
<?php
    class TinvestAction extends HCommonAction
    {
        function __construct(){
            parent::__construct();
            if(!$this->uid){
                $this->error("请先登录","/M/pub/login.html");
            }
            $this->transfer = new TransferModel();
            $this->member = new MembersModel();
            $this->transferInvestor = new TransferInvestorModel();
        }
        public function tdetail() 
        {    
            $id = intval($_GET['id']);

            $binfo = $this->transfer->find($id);
            if($binfo['id']!=$id){
                $this->error("参数错误，请重试");
            }
            $binfo['need'] = getfloatvalue(($binfo['transfer_total'] - $binfo['transfer_out'])*$binfo['per_transfer'], 2 );
            $borrow_name = $this->member->getFieldById($binfo['borrow_uid'],'user_name');
            $this->assign("borrow_name", $borrow_name);
            $monthData['month_times'] = 12;
            $monthData['account'] = 10000;
            $monthData['year_apr'] = $binfo['borrow_interest_rate'];
            $monthData['type'] = "all";
            $repay_detail = CompoundMonth($monthData);
            $this->assign("Compound",$repay_detail['shouyi']);
            $field = "m.user_name,t.transfer_num,t.investor_capital";
            $map['t.borrow_id'] = $id;
            $where['map'] = $map;
            $where['limit'] = 'all';
            $join[] = "__MEMBERS__ m on m.id = t.investor_uid";
            $list = $this->transferInvestor->getList($field,$where,$join);
            if($binfo['online_time'] > time()){
                $list = array();
                $binfo['need'] = 0;
            }
            $this->assign("vo", $binfo);
            $this->assign("list", $list);
            $this->assign("time", time());
            $this->display();
        } 
        
        public function invest()
        {
            if($this->isAjax()){

                $borrow_id = intval($this->_get('id'));
                $tnum = intval($_POST['cnum']);
                $repayment_type = $_POST['repay_type'];
                if(!in_array($repayment_type,array(1,2))){
                    ajaxmsg("还款方式有误",0);
                }
                $pin = $_POST['paypass'];
                $pres = $this->member->checkPinPass($this->uid,$pin);
                if(!$pres){
                    ajaxmsg("支付密码错误",0);
                }
                $res = $this->transfer->investCk($this->uid,$borrow_id,$tnum);
                if($res['status'] == 1){
                    $done = $this->transferInvestor->investMoney($this->uid,$borrow_id,$tnum,$repayment_type);
                    if($done){
                        $per_transfer = $this->transfer->getFieldById($borrow_id,"per_transfer");
                        $money = $per_transfer*$tnum;
                        ajaxmsg("恭喜成功认购{$tnum}份,共计{$money}元",1);
                    }else{
                        ajaxmsg("认购失败，请重试",0);
                    }
                }else{
                    ajaxmsg($res['msg'],0);
                }
            }else{
                $borrow_id = $this->_get('id');
                $borrowinfo = $this->transfer->find($borrow_id);

                $borrowinfo['need'] = getfloatvalue(($borrowinfo['transfer_total'] - $borrowinfo['transfer_out'])*$borrowinfo['per_transfer'], 2 );
                $this->assign("vo", $borrowinfo);
				$this->assign("borrow_id",$borrow_id);

                $uinfo = $this->member->getMemberInfo($this->uid,"Money","id,pin_pass");
                $this->assign('mmoney', $uinfo['account_money']+$uinfo['back_money']);
                $this->assign('paypass', $uinfo['pin_pass']);
                $this->display();   
            }
        }
    }
?>
