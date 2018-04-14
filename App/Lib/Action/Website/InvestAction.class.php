<?php
// 尚贷内核类库，2014-06-11_listam
class InvestAction extends HCommonAction {
	/**
    * 普通标列表
    *
    */
    public function index()
    {
		$Bconfig = require C("APP_ROOT")."Conf/borrow_config.php";

        
		$curl = $_SERVER['REQUEST_URI'];
		$urlarr = parse_url($curl);
		parse_str($urlarr['query'],$surl);//array获取当前链接参数，2.
        $urlArr = array('borrow_type','borrow_status','borrow_duration');
		foreach($urlArr as $v){
			$newpars = $surl;//用新变量避免后面的连接受影响
			unset($newpars[$v],$newpars['type'],$newpars['order_sort'],$newpars['orderby']);//去掉公共参数，对掉当前参数
			foreach($newpars as $skey=>$sv){
				if($sv=="all") unset($newpars[$skey]);//去掉"全部"状态的参数,避免地址栏全满
			}
			
			$newurl = http_build_query($newpars);//生成此值的链接,生成必须是即时生成
			$searchUrl[$v]['url'] = $newurl;
			$searchUrl[$v]['cur'] = empty($_GET[$v])?"all":text($_GET[$v]);
		}

        $bids=M('bid_name')->field('bidname')->select();
        $searchMap['borrow_type'] = array("all"=>"不限","1"=>$bids[1]['bidname'],"2"=>$bids[0]['bidname'],"4"=>$bids[4]['bidname'],"5"=>$bids[3]['bidname']);
        $searchMap['borrow_status'] = array("all"=>"不限","2"=>"进行中","4"=>"复审中","6"=>"还款中","7"=>"已完成");
		$searchMap['borrow_duration'] = array("all"=>"不限","t"=>"天标","0-3"=>"3个月以内","3-6"=>"3-6个月","6-12"=>"6-12个月","12-24"=>"12-24个月");

		$search = array();
		//搜索条件
		foreach($urlArr as $v){
			if($_GET[$v] && $_GET[$v]<>'all' && $_GET[$v]<>'t'){
				switch($v){
                    case 'borrow_type':
                        $search[$v] = intval($_GET[$v]);
                        break;
					case 'borrow_status':
						$search[$v] = intval($_GET[$v]);
					break;
					default:
						$barr = explode("-",text($_GET[$v]));
						$search[$v] = array("between",$barr);
					break;
				}
				$search["repayment_type"] = array("in","1,2,3,4,5");
			}elseif($_GET[$v]=="t"){
                $search["repayment_type"] = 1;
            }
		}
	
		if($search['borrow_status']==0){
			$search['borrow_status']=array("in","2,4,6,7,9");
		}
        if($search['borrow_status']==7){
            $search['borrow_status']=array("in","7,9");
        }

        if($_REQUEST['searchkeywords']!="输入项目标题或用户名"){
		    $str = "%".urldecode($_REQUEST['searchkeywords'])."%";
			$search['borrow_name']=array("like",$str);
        }
		$search['is_new']=0;
		//排序
		$order="borrow_status ASC,id DESC";

        $field = "*,ROUND(has_borrow/borrow_money*100,2) as progress";
        $b = new BorrowModel();
        $map = array();
        $map['map'] = $search;
        $map['limit'] = 5;
        $map['order'] = $order;
        $list = $b->getList($field,$map);
        foreach($list['list'] as $key=>$v){
            $project_pic=unserialize($list['list'][$key]['updata']);
            $list['list'][$key]['project_pic_thumb']=$project_pic[0]['img'];
        }
		$this->assign("searchUrl",$searchUrl);
        $this->assign("searchMap",$searchMap);
        $this->assign("Bconfig",$Bconfig);
        $this->assign("Buse",$this->gloconf['BORROW_USE']);
        $this->assign("list",$list);
        $this->display();
    }
    
	/////////////////////////////////////////////////////////////////////////////////////
	
    public function detail(){
		$id = intval($_GET['id']);
        $uid = $this->uid;
        if(!$uid){
            $this->error("请先登录","/login?ty=b&re={$id}");
            exit;
        }
		$Bconfig = require C("APP_ROOT")."Conf/borrow_config.php";
		$b = new BorrowModel();

        $field = "*";
		$borrowinfo = $b->getBorrowInfo($id,'',$field);
		if(!is_array($borrowinfo) || ($borrowinfo['borrow_status']==0 && $this->uid!=$borrowinfo['borrow_uid']) ) $this->error("数据有误");
		$borrowinfo['need'] = $borrowinfo['borrow_money'] - $borrowinfo['has_borrow'];
		$borrowinfo['lefttime'] =$borrowinfo['collect_time'] - time();
		$borrowinfo['progress'] = getFloatValue($borrowinfo['has_borrow']/$borrowinfo['borrow_money']*100,2);
        $borrowinfo['pwd'] = empty($borrowinfo['password'])?0:1;
        $this->assign("vo",$borrowinfo);

        $m = new MembersModel();
        $field = 'id,user_email,customer_name,integral,user_name';
        $link = array('MemberInfo','Financial','Verify');
		$memberinfo = $m->getMemberInfo($borrowinfo['borrow_uid'],$link,$field);
		$areaList = getArea();
		$memberinfo['location'] = $areaList[$memberinfo['province']].$areaList[$memberinfo['city']];
        $project_pic=unserialize($borrowinfo['updata']);
        $this->assign('project_pic_img',$project_pic[0]['img']);
		$this->assign("minfo",$memberinfo);
        // 投资记录
        $this->investRecord($id);
        $this->assign('borrow_id', $id);

        $this->assign("investInfo", $m->getMemberInfo($this->uid,"Money",'id'));

        $dfield = "sum(capital) as capital,sum(interest) as interest,deadline";
        $dmap['borrow_id'] = $id;
        $dmap['status'] = array('neq',0);
        $group = 'sort_order';
        $d = new InvestorDetailModel();
        $searchx = array();
        $searchx['map'] = $dmap;
        $searchx['group'] = $group;
        $searchx['order'] = "deadline asc";
        $repay_list = $d->getList($dfield,$searchx);
        $this->assign("repay_list",$repay_list['list']);
		//账户资金情况
		$this->assign("capitalinfo", $b->getMemberBorrowScan($borrowinfo['borrow_uid']));
		//账户资金情况

		$this->assign("Bconfig",$Bconfig);
		$this->assign("gloconf",$this->gloconf);
		$this->display();
    }
	
	public function investcheck(){
        $uid= $this->uid;
        !$uid && ajaxmsg("请先登录", 0);

        $bi = new BorrowInvestorModel();
        $m = new MembersModel();

		$pin =$_POST['pin'];
		$borrow_id = intval($_POST['borrow_id']);
		$money = intval($_POST['money']);
        $borrow_pass = $_POST['borrow_pass'];
        $cres = $bi->checkBorrowPwd($borrow_id,$borrow_pass);
        if(!$cres['status']){
            ajaxmsg($cres['msg'],0);
        }
        $pres = $m->checkPinPass($uid,$pin);
        !$pres && ajaxmsg("支付密码错误，请重试!",0);
        $res = $bi->check_invest($uid,$borrow_id,$money);
        if($res['status']){
            ajaxmsg($res['msg'],$res['status']);
        }else{
            ajaxmsg($res['msg'],0);
        }
	}
		
	public function investmoney(){
        $uid = $this->uid;
        !$uid && $this->error("请先登录","/user");
        !$uid && exit;

        $money = intval($_REQUEST['money']);
		$borrow_id = intval($_REQUEST['borrow_id']);
        $pin = $_POST['pin'];
        $cid = $_POST['cid'];
        $bi = new BorrowInvestorModel();
        $m = new MembersModel();
        $borrow_pass = $_POST['borrow_pass'];
        $cres = $bi->checkBorrowPwd($borrow_id,$borrow_pass);
        if(!$cres['status']){
            $this->error($cres['msg']);
            exit;
        }
        $pres = $m->checkPinPass($uid,$pin);
        if(!$pres){
            $this->error("支付密码错误，请重试");
            exit;
        }
        $res = $bi->check_invest($uid,$borrow_id,$money);
        $cl = new CouponListModel();
        $coupon_status = $cl->getFieldById($cid,'status');
        if($coupon_status!=0){
            $this->error("加息券已使用");
            exit;
        }
        $extra_data['cid'] = $cid;
        $extra_data['c_rate'] = $cl->getFieldById($cid,'rate');
        if($res['status']==1){
            $done = $bi->investMoney($uid,$borrow_id,$money,0,$extra_data);
            if($done){
                $cl->userCouponList($uid,11);
                $this->success("恭喜成功投标{$money}元");
            }else{
                $this->error("对不起，投标失败，请重试!");
            }
        }elseif($res['status']==2){
            $this->error($res['msg'],"/user/charge#fragment-1");
        }else{
            $this->error($res['msg']);
        }
	}
	public function ajax_invest(){
        $uid = $this->uid;
		!$uid && ajaxmsg("请先登录", 0);
		$id = intval($_GET['id']);
        $pwd = empty($_GET['pwd'])?0:1;

        $money = intval($_GET['num']);
        $bi = new BorrowInvestorModel();
        $res = $bi->check_invest($uid,$id,$money);

        if($res['status']==1){
            $cl = new CouponListModel();
            $coupon_list = $cl->ajax_invest_list($uid,$id,$money);
            $this->assign("coupon_list",$coupon_list);
            $this->assign("id",$id);
            $this->assign("investMoney",$money);
            $this->assign("pwd",$pwd);
            $data['content'] = $this->fetch();
            ajaxmsg($data);
        }else{
            ajaxmsg($res['msg'],0);
        }
	}
	public function getarea(){
		$rid = intval($_GET['rid']);
		if(empty($rid)){
			$data['NoCity'] = 1;
			exit(json_encode($data));
		}
		$map['reid'] = $rid;
		$alist = M('area')->field('id,name')->order('sort_order DESC')->where($map)->select();

		if(count($alist)===0){
			$str="<option value=''>--该地区下无下级地区--</option>\r\n";
		}else{
			if($rid==1) $str.="<option value='0'>请选择省份</option>\r\n";
			foreach($alist as $v){
				$str.="<option value='{$v['id']}'>{$v['name']}</option>\r\n";
			}
		}
		$data['option'] = $str;
		$res = json_encode($data);
		echo $res;
	}	


     /**
    * ajax 获取投资记录
    * 
    */
    public function investRecord($borrow_id=0)
    {

        $pre = C('DB_PREFIX');
        isset($_GET['borrow_id']) && $borrow_id = intval($_GET['borrow_id']);
        import("ORG.Util.Page");
        $count = M("borrow_investor")->where('borrow_id='.$borrow_id)->count('id');
        $Page     = new Page($count,20);


        $show = $Page->ajax_show();
        $this->assign('page', $show);
        if($_GET['borrow_id']){
            $list = M("borrow_investor as b")
                ->join("{$pre}members as m on  b.investor_uid = m.id")
                ->join("{$pre}borrow_info as i on  b.borrow_id = i.id")
                ->field('i.borrow_interest_rate, i.repayment_type, b.investor_capital, b.add_time, b.is_auto, m.user_name')
                ->where('b.borrow_id='.$borrow_id)->order('b.id desc')->limit($Page->firstRow.','.$Page->listRows)->select();
            $string = '';
            foreach($list as $k=>$v){
                $relult=$k%2;
                if(!$relult){
                    $string .= "<tr style='background-color: rgb(255, 255, 255);' class='borrowlist3'><td width='248' class='txtleft'>".hidecard($v['user_name'],5)."</td><td  width='248' class='txtleft'>";
                }else{
                    $string .= "<tr style='background-color: rgb(244, 244, 244);' class='borrowlist5'>
                   <td width='248' class='txtleft'>".hidecard($v['user_name'],5)."</td>
                      <td  width='248' class='txtleft'>";
                }
                $string .= $v['is_auto']?'自动':'手动';
                $string .= "</td><td  width='228' class='txtleft pr30'>".getMoneyFormt($v['investor_capital'])."元</td>
                      <td width='298' class='txtleft'>".date("Y-m-d H:i",$v['add_time'])."</td>
                     <td>成功</td></tr>";
            }
            echo empty($string)?'暂时没有投资记录':$string;
        }

    }

}