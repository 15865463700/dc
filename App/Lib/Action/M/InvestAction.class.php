<?php
    class InvestAction extends HCommonAction
    {
        function __construct(){
            parent::__construct();
            $this->borrow = new BorrowModel();
            $this->member = new MembersModel();
            $this->borrowInvestor = new BorrowInvestorModel();
            $this->investDetail = new InvestorDetailModel();
            $this->cl = new CouponListModel();
        }
        public function detail()
        {   
            $id = intval($_GET['id']);
            $borrowinfo = $this->borrow->find($id);
            if(!$borrowinfo){
                $this->error("数据有误");
            }
            $borrowinfo['biao'] = $borrowinfo['borrow_times'];
            $borrowinfo['need'] = $borrowinfo['borrow_money'] - $borrowinfo['has_borrow'];
            $borrowinfo['lefttime'] =$borrowinfo['collect_time'] - time();
            $borrowinfo['progress'] = getFloatValue($borrowinfo['has_borrow']/$borrowinfo['borrow_money']*100,2);
            $borrow_config = require C("APP_ROOT")."Conf/borrow_config.php";
            $repayment_type = $borrow_config['REPAYMENT_TYPE'];
            $this->assign("repayment_type",$repayment_type); 
            $this->assign("vo",$borrowinfo);

            $field = "id,customer_name,customer_id,user_name,reg_time,credits,integral,user_email,user_phone";
            $link = array("Money","MemberInfo","Financial");
            $memberinfo = $this->member->getMemberInfo($borrowinfo['borrow_uid'],$link,$field);
            //此标借款利息还款相关情况
           $area=M("area")
               ->where("id={$memberinfo['province']} or id={$memberinfo['city']} or id={$memberinfo['area']}")
               ->select();
            $jiguan="";
            foreach($area as $v){
                $jiguan['name'].=$v['name'];
            }
            $this->assign("minfo",$memberinfo);
            $this->assign("jiguan",$jiguan);
            //memberinfo
            $this->assign("gloconf",$this->gloconf);
            
            //还款计划
            $ifield = "sum(capital) as capital,sum(interest) as interest,deadline";
            $imap['borrow_id'] = $id;
            $imap['status'] = array('neq',0);
            $iwhere['map'] = $imap;
            $iwhere['limit'] = 'all';
            $iwhere['group'] = 'sort_order';
            $iwhere['order'] = 'deadline asc';
            $repay_list = $this->investDetail->getList($ifield,$iwhere);
            $this->assign("repay_list",$repay_list);
            //还款计划
            //投资记录
            $bfield = "bi.investor_capital,bi.add_time, m.user_name";
            $bmap['bi.borrow_id'] = $id;
            $bwhere['map']=$bmap;
            $bwhere['limit'] = 'all';
            $bwhere['order'] = 'bi.id desc';
            $join[] = "__MEMBERS__ m on m.id = bi.investor_uid";
            $list = $this->borrowInvestor->getList($bfield,$bwhere,$join);
            $this->assign("invest_list",$list);

            $this->display();
        }
        
        /**
        * 手机普通标投资
        */
        public function Invest()
        {   
            if(!$this->uid){
                if($this->isAjax()){
                    die("请先登录后投资");   
                }else{
                    $this->redirect('M/pub/login');       
                }
            }
            if($this->isAjax()){   // ajax提交投资信息
                $borrow_id = intval($this->_get('id'));
                $invest_money = intval($this->_post('invest_money'));
                $paypass = $this->_post('paypass');
                $invest_pass = isset($_POST['invest_pass'])?$_POST['invest_pass']:'';
                $cid = intval($this->_post('cid'));

                $cres = $this->borrowInvestor->checkBorrowPwd($borrow_id,$invest_pass);
                if(!$cres['status']){
                    ajaxmsg($cres['msg'],0);
                }
                $pres = $this->member->checkPinPass($this->uid,$paypass);
                !$pres && ajaxmsg("支付密码错误，请重试!",0);
                $res = $this->borrowInvestor->check_invest($this->uid,$borrow_id,$invest_money);
                $coupon_status = $this->cl->getFieldById($cid,'status');
                if($coupon_status!=0){
                    ajaxmsg("加息券已使用!",0);
                }
                $extra_data['cid'] = $cid;
                $extra_data['c_rate'] = $this->cl->getFieldById($cid,'rate');
                if($res['status']==1){
                    $done = $this->borrowInvestor->investMoney($this->uid,$borrow_id,$invest_money,0,$extra_data);
                    if($done){
                        $this->cl->userCouponList($this->uid,11);
                        ajaxmsg("恭喜成功投标{$invest_money}元",1);
                    }else{
                        ajaxmsg("对不起，投标失败，请重试!",0);
                    }
                }else{
                    ajaxmsg($res['msg'],0);
                }
            }else{  
                $borrow_id = $this->_get('id');
                $borrow_info = $this->borrow->find($borrow_id);

                if($borrow_info['is_new'] == ''){
                    $borrow_info['is_new'] = 0;
                }
                $this->assign('borrow_info', $borrow_info);
                $this->assign("borrow_id",$borrow_id);
                
                $user_info = $this->member->getMemberInfo($this->uid,'Money','id,pin_pass');
                $this->assign('user_info', $user_info);
                $this->assign('paypass', $user_info['pin_pass']);
                $this->display();   
            }
        }
        
        /**
        * 获取加息券列表
        */
        public function get_coupon_list(){
            $money = intval($_POST['money']);
            if(empty($money)){
                exit;
            }
            $borrow_id = intval($_POST['borrow_id']);
            $list = $this->cl->ajax_invest_list($this->uid,$borrow_id,$money);
            $html = '<option value="0" style="padding: 10px;">&nbsp;====&nbsp;请选择&nbsp;====&nbsp;</option>';
            foreach ($list as $vo) {
                $html .= '<option value="'.$vo['id'].'" style="padding: 10px;">'.$vo['title'].'</option>';
            }
            exit($html);
        }
    }
?>
