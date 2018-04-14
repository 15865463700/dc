<?php
// 全局设置
class ExpiredAction extends ACommonAction
{
    /**
    +----------------------------------------------------------
    * 默认操作
    +----------------------------------------------------------
    */
    public function index()
    {
		$map=array();
		$map['d.status'] = array("neq",0);
		$map['d.deadline'] = array("between","100000,".time());
        $map['_string'] = "d.repayment_time = 0 or d.substitute_money > 0 or d.repayment_time > d.deadline";

		if($_REQUEST['uid'] && $_REQUEST['uname']){
			$map['d.borrow_uid'] = $_REQUEST['uid'];
			$search['uid'] = $map['d.borrow_uid'];	
			$search['uname'] = urldecode($_REQUEST['uname']);	
		}
		
		if($_REQUEST['uname'] && !$search['uid']){
			$map['m.user_name'] = array("like",urldecode($_REQUEST['uname'])."%");
			$search['uname'] = urldecode($_REQUEST['uname']);	
		}
		
		if($_REQUEST['status']){
			if($_REQUEST['status']==1) $map['d.substitute_money'] = array("gt",0);
			elseif($_REQUEST['status']==2) $map['d.substitute_money'] = array("elt",0);
			$search['status'] = intval($_REQUEST['status']);	
		}

		if(!empty($_REQUEST['bj']) && !empty($_REQUEST['money'])){
			$map['capital'] = array($_REQUEST['bj'],$_REQUEST['money']);
			$search['bj'] = $_REQUEST['bj'];	
			$search['money'] = $_REQUEST['money'];	
		}

		if(!empty($_REQUEST['start_time']) && !empty($_REQUEST['end_time'])){
			$timespan = strtotime(urldecode($_REQUEST['start_time'])).",".strtotime(urldecode($_REQUEST['end_time']));
			$map['d.deadline'] = array("between",$timespan);
			$search['start_time'] = urldecode($_REQUEST['start_time']);	
			$search['end_time'] = urldecode($_REQUEST['end_time']);	
		}elseif(!empty($_REQUEST['start_time'])){
			$xtime = strtotime(urldecode($_REQUEST['start_time']));
			$map['d.deadline'] = array("between",$xtime.",".time());
			$search['start_time'] = $xtime;	
		}elseif(!empty($_REQUEST['end_time'])){
			$xtime = strtotime(urldecode($_REQUEST['end_time']));
			$map['d.deadline'] = array("between",time().",".$xtime);
			$search['end_time'] = $xtime;	
		}
		$i = new InvestorDetailModel();
		$field = "m.user_name,d.borrow_id as id,b.borrow_name,d.status,
		d.total,d.borrow_id,b.borrow_uid,d.sort_order,sum(d.capital) as capital,
		sum(d.interest) as interest,sum(d.substitute_money) as substitute_money,
		d.deadline,b.borrow_duration,b.repayment_type";
        $join[] = "__BORROW_INFO__ b ON b.id=d.borrow_id";
        $join[] = "__MEMBERS__ m ON m.id=b.borrow_uid";
        $group = "d.borrow_id asc,d.sort_order asc";
        $searchx = array();
        $searchx['map'] = $map;
        $searchx['limit'] = C('ADMIN_PAGE_SIZE');
        $searchx['group'] = $group;
        $list = $i->getList($field,$searchx,$join);

		$list['list'] = $this->_listFilter($list['list']);

        $this->assign("bj", array("gt"=>'大于',"eq"=>'等于',"lt"=>'小于'));
        $this->assign("status", array("1"=>'已代还',"2"=>'未代还'));
        $this->assign("list", $list['list']);
        $this->assign("pagebar", $list['page']);
        $this->assign("search", $search);
        $this->assign("query", http_build_query($search));
		
        $this->display();
    }


    public function member()
    {
		$map=array();
        $map['d.deadline'] = array('lt',time());
        $map['_string'] = "d.repayment_time = 0 or d.substitute_money > 0 or d.repayment_time > d.deadline";
//        $map['d.status'] = 7;
		if($_REQUEST['uname']){
            $uid = M("members")->getFieldByUserName(urldecode($_REQUEST['uname']),"id");
            $map['d.borrow_uid'] = $uid;
            $search['uid'] = $map['d.borrow_uid'];
            $search['uname'] = urldecode($_REQUEST['uname']);
		}
        $i = new InvestorDetailModel();
        $field = "sum(d.capital+d.interest) as total_expired,m.user_name,m.id";
        $join[] = "__MEMBERS__ m ON m.id=d.borrow_uid";
        $group = "d.borrow_uid desc";
        $searchx = array();
        $searchx['map'] = $map;
        $searchx['limit'] = C('ADMIN_PAGE_SIZE');
        $searchx['group'] = $group;
        $list = $i->getList($field,$searchx,$join);

        $groupx = "d.borrow_id,d.sort_order";
        foreach($list['list'] as $k => $v){
            $where = "deadline < ".time()." and borrow_uid = {$v['id']} and (repayment_time=0 or substitute_money > 0 or repayment_time > deadline)";
            $searchx = array();
            $searchx['map'] = $where;
            $searchx['limit'] = 'all';
            $searchx['group'] = $groupx;
            $l = $i->getList($field,$searchx,$join);
            $list['list'][$k]['tc'] = sizeof($l);
        }
		
        $this->assign("bj", array("gt"=>'大于',"eq"=>'等于',"lt"=>'小于'));
        $this->assign("status", array("1"=>'已代还',"2"=>'未代还'));
        $this->assign("list", $list['list']);
        $this->assign("pagebar", $list['page']);
        $this->assign("search", $search);
        $this->assign("query", http_build_query($search));
		
        $this->display();
    }


	public function doexpired(){
		$borrow_id = intval($_GET['id']);
		$sort_order = intval($_GET['sort_order']);
        $uid = intval($_GET['uid']);
        $b = new BorrowModel();
		$res = $b->repaymentBorrow($uid,$borrow_id,$sort_order,2);
		if($res['status']){
			alogs("Doexpired",$borrow_id,1,'成功执行了逾期贷款的代还操作！');//管理员操作日志
            $this->success("代还成功");
		}else{
            $res['status'] == -1 && alogs("Doexpired",$borrow_id,0,'逾期贷款的代还操作失败！');//管理员操作日志
			$this->error($res['msg']);
		}
	}

	private function _listFilter($list){
		$row=array();
		foreach($list as $key=>$v){
            $map = array();
            $map['borrow_id'] = $v['borrow_id'];
            $map['sort_order'] = $v['sort_order'];
            $expired = M('borrow_expired')->where($map)->find();
            if($expired){
                $v['breakday'] = $expired['expired_days'];
                $v['expired_money'] = $expired['expired_money'];
                $v['call_fee'] = $expired['call_fee'];
                $v['user_repay'] = 1;
            }else{
                $v['breakday'] = getExpiredDays($v['deadline']);
                $v['expired_money'] = getExpiredMoney($v['breakday'],$v['capital'],$v['interest']);
                $v['call_fee'] = getExpiredCallFee($v['breakday'],$v['capital'],$v['interest']);
                $v['user_repay'] = 0;
            }
            $count = M("borrow_substitute_log")->where($map)->count();
            if($count){
                $v['web_repay'] = 1;
            }else{
                $v['web_repay'] = 0;
            }

			$row[$key]=$v;
		}
		return $row;
	}
	
	
	
}
?>