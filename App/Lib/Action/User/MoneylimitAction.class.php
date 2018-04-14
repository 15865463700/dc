<?php
// 尚贷内核类库，2014-06-11_listam
class MoneylimitAction extends MCommonAction {

    function __construct(){
        parent::__construct();
        $this->member = new MembersModel();
    }
    public function index(){
		$this->display();
    }
	public function apply(){
        $uid = $this->uid;
        $res = $this->member->memberApply($uid,$_POST['apply_money'],$_POST['apply_info'],$_POST['apply_type']);
		ajaxmsg($res['msg'],$res['status']);
	}


	public function applylog(){
        $uid = $this->uid;
		$Binfo = require C("APP_ROOT")."Conf/borrow_config.php";
		$minfo = $this->member->getMemberInfo($uid,'Extra',"id");
        $this->assign("minfo",$minfo);
		$size=15;
		$map['uid'] = $uid;
        $where['map'] = $map;
        $where['limit'] = $size;
        $list = $this->member->getApplyList("*",$where);
		$status_arr =array('待审核','审核通过','审核未通过');
		foreach($list['list'] as $key=>$v){
			$list['list'][$key]['status'] = $status_arr[$v['apply_status']];
		}

		$this->assign("aType",$Binfo['APPLY_TYPE']);
		$this->assign("list",$list['list']);
		$this->assign("pagebar",$list['page']);

		$json['html'] = $this->fetch();
		exit(json_encode($json));
	}

}