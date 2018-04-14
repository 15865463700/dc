<?php
// 全局设置
class CapitalonlineAction extends ACommonAction
{
    /**
    +----------------------------------------------------------
    * 默认操作
    +----------------------------------------------------------
    */
    public function charge()
    {
		$map=array();
		if($_REQUEST['uid'] && $_REQUEST['uname']){
			$map['p.uid'] = $_REQUEST['uid'];
			$search['uid'] = $map['p.uid'];	
			$search['uname'] = urldecode($_REQUEST['uname']);	
		}
		
		if($_REQUEST['uname'] && !$_REQUEST['uid']){
			$map['m.user_name'] = array("like",urldecode($_REQUEST['uname'])."%");
			$search['uname'] = urldecode($_REQUEST['uname']);	
		}
		
		if($_REQUEST['tran_id']){
			$map['p.tran_id'] = urldecode($_REQUEST['tran_id']);
			$search['tran_id'] = $map['p.tran_id'];	
		}
		
		if(isset($_REQUEST['status']) && $_REQUEST['status']!=""){
			$map['p.status'] = intval($_REQUEST['status']);
			$search['status'] = $map['p.status'];	
		}
		
		if($_REQUEST['way']){
			$map['p.way'] = $_REQUEST['way'];
			$search['way'] = $map['p.way'];	
		}
		
		if(!empty($_REQUEST['bj']) && !empty($_REQUEST['money'])){
			$map['p.money'] = array($_REQUEST['bj'],$_REQUEST['money']);
			$search['bj'] = $_REQUEST['bj'];	
			$search['money'] = $_REQUEST['money'];	
		}

		if(!empty($_REQUEST['start_time']) && !empty($_REQUEST['end_time'])){
			$timespan = strtotime(urldecode($_REQUEST['start_time'])).",".strtotime(urldecode($_REQUEST['end_time']));
			$map['p.add_time'] = array("between",$timespan);
			$search['start_time'] = urldecode($_REQUEST['start_time']);	
			$search['end_time'] = urldecode($_REQUEST['end_time']);	
		}elseif(!empty($_REQUEST['start_time'])){
			$xtime = strtotime(urldecode($_REQUEST['start_time']));
			$map['p.add_time'] = array("gt",$xtime);
			$search['start_time'] = $xtime;	
		}elseif(!empty($_REQUEST['end_time'])){
			$xtime = strtotime(urldecode($_REQUEST['end_time']));
			$map['p.add_time'] = array("lt",$xtime);
			$search['end_time'] = $xtime;	
		}
		//if(session('admin_is_kf')==1)	$map['m.customer_id'] = session('admin_id');

		$pl = new PaylogModel();
        $field= 'p.*,m.user_name';
        $where['map'] = $map;
        $where['limit'] = C('ADMIN_PAGE_SIZE');
        $join[] = "__MEMBERS__ m ON p.uid=m.id";
        $list = $pl->getList($field,$where,$join);

        $payWay = $pl->payWay;
		//分页处理
        $this->assign("way", $payWay);
        $this->assign("bj", array("gt"=>'大于',"eq"=>'等于',"lt"=>'小于'));
        $this->assign("list", $list['list']);
		$this->assign("status",C('PAYLOG_TYPE'));
        $this->assign("pagebar", $list['page']);
        $this->assign("search", $search);
        $this->assign("query", http_build_query($search));
		
        $this->display();
    }
	
	public function chargeexport(){
		import("ORG.Io.Excel");
		alogs("Charge",0,1,'执行了会员充值记录列表导出操作！');//管理员操作日志
		$map=array();
		if($_REQUEST['uid'] && $_REQUEST['uname']){
			$map['p.uid'] = $_REQUEST['uid'];
		}
		
		if($_REQUEST['uname'] && !$_REQUEST['uid']){
			$map['m.user_name'] = array("like",urldecode($_REQUEST['uname'])."%");
		}
		
		if($_REQUEST['tran_id']){
			$map['p.tran_id'] = urldecode($_REQUEST['tran_id']);
		}
		
		if(isset($_REQUEST['status']) && $_REQUEST['status']!=""){
			$map['p.status'] = intval($_REQUEST['status']);
		}
		
		if($_REQUEST['way']){
			$map['p.way'] = $_REQUEST['way'];
		}
		
		if(!empty($_REQUEST['bj']) && !empty($_REQUEST['money'])){
			$map['p.money'] = array($_REQUEST['bj'],$_REQUEST['money']);
		}

		if(!empty($_REQUEST['start_time']) && !empty($_REQUEST['end_time'])){
			$timespan = strtotime(urldecode($_REQUEST['start_time'])).",".strtotime(urldecode($_REQUEST['end_time']));
			$map['p.add_time'] = array("between",$timespan);
		}elseif(!empty($_REQUEST['start_time'])){
			$xtime = strtotime(urldecode($_REQUEST['start_time']));
		}elseif(!empty($_REQUEST['end_time'])){
			$xtime = strtotime(urldecode($_REQUEST['end_time']));
		}
//		if(session('admin_is_kf')==1)	$map['m.customer_id'] = session('admin_id');
        $pl = new PaylogModel();
        $field= 'p.*,m.user_name';
        $where['map'] = $map;
        $where['limit'] = 'all';
        $join[] = "__MEMBERS__ m ON p.uid=m.id";
        $list = $pl->getList($field,$where,$join);
        $payWay = $pl->payWay;
		$status = C('PAYLOG_TYPE');
		$row=array();
		$row[0]=array('序号','用户ID','用户名','充值金额','充值手续费','充值状态','对账订单号','充值方式','充值时间');
		$i=1;
		foreach($list as $v){
				$row[$i]['i'] = $i;
				$row[$i]['uid'] = $v['id'];
				$row[$i]['card_1'] = $v['user_name'];
				$row[$i]['card_2'] = $v['money'];
				$row[$i]['card_3'] = $v['fee'];
				$row[$i]['card_4'] = $status[$v['status']];
				$row[$i]['card_5'] = $v['tran_id'];
				$row[$i]['card_6'] = $payWay[$v['way']];
				$row[$i]['card_7'] = date("Y-m-d H:i:s",$v['add_time']);
				$i++;
		}
		
		$xls = new Excel_XML('UTF-8', false, 'datalist');
		$xls->addArray($row);
		$xls->generateXML("datalistcard");
	}

     public function withdraw()
    {
		$map=array();
		if($_REQUEST['uid'] && $_REQUEST['uname']){
			$map['w.uid'] = $_REQUEST['uid'];
			$search['uid'] = $map['w.uid'];	
			$search['uname'] = urldecode($_REQUEST['uname']);	
		}
		
		if($_REQUEST['uname'] && !$search['uid']){
			$map['m.user_name'] = array("like",urldecode($_REQUEST['uname'])."%");
			$search['uname'] = urldecode($_REQUEST['uname']);	
		}
		
		if(isset($_REQUEST['status']) && $_REQUEST['status']!=""){
			$map['w.withdraw_status'] = intval($_REQUEST['status']);
			$search['status'] = $map['w.withdraw_status'];	
		}
		
		if($_REQUEST['deal_user']){
			$map['w.deal_user'] = urldecode($_REQUEST['deal_user']);
			$search['deal_user'] = $map['w.deal_user'];	
		}
		
		if(!empty($_REQUEST['bj']) && !empty($_REQUEST['money'])){
			$map['w.withdraw_money'] = array($_REQUEST['bj'],$_REQUEST['money']);
			$search['bj'] = $_REQUEST['bj'];	
			$search['money'] = $_REQUEST['money'];	
		}

		if(!empty($_REQUEST['start_time']) && !empty($_REQUEST['end_time'])){
			$timespan = strtotime(urldecode($_REQUEST['start_time'])).",".strtotime(urldecode($_REQUEST['end_time']));
			$map['w.add_time'] = array("between",$timespan);
			$search['start_time'] = urldecode($_REQUEST['start_time']);	
			$search['end_time'] = urldecode($_REQUEST['end_time']);	
		}elseif(!empty($_REQUEST['start_time'])){
			$xtime = strtotime(urldecode($_REQUEST['end_time']));
			$map['w.add_time'] = array("gt",$xtime);
			$search['start_time'] = $xtime;	
		}elseif(!empty($_REQUEST['end_time'])){
			$xtime = strtotime(urldecode($_REQUEST['end_time']));
			$map['w.add_time'] = array("lt",$xtime);
			$search['end_time'] = $xtime;	
		}
		//if(session('admin_is_kf')==1)	$map['m.customer_id'] = session('admin_id');
        $w = new WithdrawModel();

        $where['map'] = $map;
        $where['limit'] = C('ADMIN_PAGE_SIZE');
        $field = "w.*,m.user_name";
        $join[] = "__MEMBERS__ m ON w.uid=m.id";
        $list = $w->getList($field,$where,$join);
        $this->assign("bj", array("gt"=>'大于',"eq"=>'等于',"lt"=>'小于'));
        $this->assign("list", $list['list']);
		$this->assign("status",C('WITHDRAW_STATUS'));
        $this->assign("pagebar", $list['page']);
        $this->assign("search", $search);
        $this->assign("query", http_build_query($search));
		
        $this->display();
    }

	
	public function withdrawexport(){
		import("ORG.Io.Excel");
		alogs("Withdraw",0,1,'执行了会员提现记录列表导出操作！');//管理员操作日志
		$map=array();
		if($_REQUEST['uid'] && $_REQUEST['uname']){
			$map['w.uid'] = $_REQUEST['uid'];
		}
		
		if($_REQUEST['uname'] && !$_REQUEST['uid']){
			$map['m.user_name'] = array("like",urldecode($_REQUEST['uname'])."%");
		}
		
		if(isset($_REQUEST['status']) && $_REQUEST['status']!=""){
			$map['w.withdraw_status'] = intval($_REQUEST['status']);
		}
		
		if($_REQUEST['deal_user']){
			$map['w.deal_user'] = urldecode($_REQUEST['deal_user']);
		}
		
		if(!empty($_REQUEST['bj']) && !empty($_REQUEST['money'])){
			$map['w.withdraw_money'] = array($_REQUEST['bj'],$_REQUEST['money']);
		}

		if(!empty($_REQUEST['start_time']) && !empty($_REQUEST['end_time'])){
			$timespan = strtotime(urldecode($_REQUEST['start_time'])).",".strtotime(urldecode($_REQUEST['end_time']));
			$map['w.add_time'] = array("between",$timespan);
		}elseif(!empty($_REQUEST['start_time'])){
			$xtime = strtotime(urldecode($_REQUEST['end_time']));
			$map['w.add_time'] = array("gt",$xtime);
		}elseif(!empty($_REQUEST['end_time'])){
			$xtime = strtotime(urldecode($_REQUEST['end_time']));
			$map['w.add_time'] = array("lt",$xtime);
		}
//		if(session('admin_is_kf')==1)	$map['m.customer_id'] = session('admin_id');

        $w = new WithdrawModel();

        $where['map'] = $map;
        $where['limit'] = 'all';
        $field = "w.*,m.user_name";
        $join[] = "__MEMBERS__ m ON w.uid=m.id";
        $list = $w->getList($field,$where,$join);
		$status = C('WITHDRAW_STATUS');
		$row=array();
		$row[0]=array('序号','用户ID','用户名','提现金额','提现手续费','到账金额','提现状态','提现时间','处理时间','处理人');
		$i=1;
		foreach($list as $v){
				$row[$i]['i'] = $i;
				$row[$i]['uid'] = $v['id'];
				$row[$i]['card_1'] = $v['user_name'];
				$row[$i]['card_2'] = $v['withdraw_money'];
				$row[$i]['card_3'] = $v['second_fee'];
				$row[$i]['card_8'] =($v['withdraw_status']==3)?0:$v['success_money'];
				$row[$i]['card_4'] = $status[$v['withdraw_status']];
				$row[$i]['card_5'] = date("Y-m-d H:i:s",$v['add_time']);
				$row[$i]['card_6'] = ($v['deal_time']>0)?date("Y-m-d H:i:s",$v['deal_time']):"未处理";
				$row[$i]['card_7'] = (!empty($v['deal_user']))?$v['deal_user']:'';
				$i++;
		}
		
		$xls = new Excel_XML('UTF-8', false, 'datalist');
		$xls->addArray($row);
		$xls->generateXML("datalistcard");
	}
	
}
?>