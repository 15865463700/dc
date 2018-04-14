<?php

class WithdrawAction extends MCommonAction {
    public function index(){
		$this->display();
    }

    public function withdraw(){
        $m = new MembersModel();
        $link = array('Money','MemberInfo','Bank');
        $vo = $m->getMemberInfo($this->uid,$link,'id,user_name,user_phone');

		if(empty($vo['bank_num']))
            $data['html'] = '<script type="text/javascript">layer.msg("您还未绑定银行账户",{icon:5,shade:0.3},function(){window.location.href="/user/bank#fragment-1";})</script>';
		else{
            $vo['all_money'] = $vo['account_money']+$vo['back_money'];
			$tqfee = explode( "|", $this->glo['fee_tqtx']);
			$fee[0] = explode( "-", $tqfee[0]);
			$fee[1] = explode( "-", $tqfee[1]);
			$fee[2] = explode( "-", $tqfee[2]);
			$this->assign( "fee",$fee);
            $b = new BorrowModel();
            $netMoney = $b->getNetMoney($this->uid);
            $vo['net_money'] = $netMoney;
            $vo['all_money'] -= $netMoney;
            $borrowconfig=  require C("ROOT_URL")."Dynamic/borrowconfig.php";
            $data = $borrowconfig['BANK_NAME'];
            $vo['bank_name'] = $data[$vo['bank_name']];
            $vo['bank_num'] = decode_ts($vo['bank_num'],getcode());
			$this->assign( "vo",$vo);
			$data['html'] = $this->fetch();
		}
		exit(json_encode($data));
    }
	
	public function validate(){
        $pwd = $_POST['pwd'];
        $m = new MembersModel();
        $res = $m->checkPinPass($this->uid,$pwd);
        if(!$res){
            ajaxmsg('支付密码错误',0);
        }
        $money = floatval($_POST['amount']);
        $w = new WithdrawModel();
        $result = $w->checkWithdraw($this->uid,$money);
        ajaxmsg($result['msg'],$result['status']);
	}
	
	public function actwithdraw(){
        $pwd = $_POST['pwd'];
        $m = new MembersModel();
        $res = $m->checkPinPass($this->uid,$pwd);
        if(!$res){
            ajaxmsg('支付密码错误',0);
        }
        $money = floatval($_POST['amount']);
        $w = new WithdrawModel();
        $result = $w->checkWithdraw($this->uid,$money);
        if($result['status']){
            $rx = $w->doWithdraw($this->uid,$money);
            ajaxmsg($rx['msg'],$rx['status']);
        }else{
            ajaxmsg($result['msg'],$result['status']);
        }
	}
	
	public function backwithdraw(){
        $id = intval($_GET['id']);
        $w = new WithdrawModel();
        $res = $w->cancelWithdraw($this->uid,$id);
        ajaxmsg($res['msg'],$res['status']);
	}

    public function withdrawlog(){
        $map['uid'] = $this->uid;
		if($_GET['start_time']&&$_GET['end_time']){
			$_GET['start_time'] = strtotime($_GET['start_time']." 00:00:00");
			$_GET['end_time'] = strtotime($_GET['end_time']." 23:59:59");
			
			if($_GET['start_time']<$_GET['end_time']){
				$map['add_time']=array("between","{$_GET['start_time']},{$_GET['end_time']}");
				$search['start_time'] = $_GET['start_time'];
				$search['end_time'] = $_GET['end_time'];
			}
		}
        $w = new WithdrawModel();
        $searchx = array();
        $searchx['map'] = $map;
        $searchx['limit'] = 15;
        $list = $w->getList('*',$searchx);
        $status_arr =array('待审核','审核通过,处理中','已提现','审核未通过');
        foreach($list['list'] as $key=>$v){
            $list['list'][$key]['status'] = $status_arr[$v['withdraw_status']];
        }
		$this->assign('search',$search);
		$this->assign("list",$list['list']);
		$this->assign("pagebar",$list['page']);
		$data['html'] = $this->fetch();
		exit(json_encode($data));
    }

}