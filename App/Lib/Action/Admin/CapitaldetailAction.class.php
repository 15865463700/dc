<?php
// 全局设置
class CapitaldetailAction extends ACommonAction
{
    /**
    +----------------------------------------------------------
    * 默认操作
    +----------------------------------------------------------
    */
    public function index()
    {
		$map=array();
		if($_REQUEST['uid'] && $_REQUEST['uname']){
			$map['ml.uid'] = $_REQUEST['uid'];
			$search['uid'] = $_REQUEST['uid'];
			$search['uname'] = urldecode($_REQUEST['uname']);	
		}
		
		if($_REQUEST['uname'] && !$_REQUEST['uid']){
			$map['m.user_name'] = array("like",urldecode($_REQUEST['uname'])."%");
			$search['uname'] = urldecode($_REQUEST['uname']);	
		}

		if($_REQUEST['target_uname']){
			$map['ml.target_uname'] = urldecode($_REQUEST['target_uname']);
			$search['target_uname'] = $map['ml.target_uname'];
		}

		if(isset($_REQUEST['type']) && $_REQUEST['type'] != ''){
			$map['ml.type'] = intval($_REQUEST['type']);
			$search['type'] = $map['ml.type'];
		}
		
		if(!empty($_REQUEST['bj']) && !empty($_REQUEST['money'])){
			$map['ml.affect_money'] = array($_REQUEST['bj'],$_REQUEST['money']);
			$search['bj'] = $_REQUEST['bj'];	
			$search['money'] = $_REQUEST['money'];	
		}

		if(!empty($_REQUEST['start_time']) && !empty($_REQUEST['end_time'])){
			$timespan = strtotime(urldecode($_REQUEST['start_time'])).",".strtotime(urldecode($_REQUEST['end_time']));
			$map['ml.add_time'] = array("between",$timespan);
			$search['start_time'] = urldecode($_REQUEST['start_time']);	
			$search['end_time'] = urldecode($_REQUEST['end_time']);	
		}elseif(!empty($_REQUEST['start_time'])){
			$xtime = strtotime(urldecode($_REQUEST['start_time']));
			$map['ml.add_time'] = array("gt",$xtime);
			$search['start_time'] = $xtime;	
		}elseif(!empty($_REQUEST['end_time'])){
			$xtime = strtotime(urldecode($_REQUEST['end_time']));
			$map['ml.add_time'] = array("lt",$xtime);
			$search['end_time'] = $xtime;	
		}
		//if(session('admin_is_kf')==1)	$map['m.customer_id'] = session('admin_id');

        $ml = new MoneyLogModel();
        $field = "ml.id,ml.add_time,m.user_name,ml.affect_money,ml.freeze_money,ml.collect_money,
        (ml.account_money+ml.back_money) account_money,ml.target_uname,ml.type,ml.info";
        $where['map'] = $map;
        $where['limit'] = C('ADMIN_PAGE_SIZE');
        $join[] = "__MEMBERS__ m ON m.id=ml.uid";
        $list = $ml->getList($field,$where,$join);

        $this->assign("bj", array("gt"=>'大于',"eq"=>'等于',"lt"=>'小于'));
        $this->assign("type", C('MONEY_LOG'));
        $this->assign("list", $list['list']);
        $this->assign("pagebar",$list['page']);
        $this->assign("search", $search);
        $this->assign("query", http_build_query($search));
		
        $this->display();
    }
	
	public function export(){
		import("ORG.Io.Excel");
		alogs("CapitalDetail",0,1,'执行了会员资金明细列表导出操作！');//管理员操作日志
		$map=array();
		if($_REQUEST['uid'] && $_REQUEST['uname']){
			$map['ml.uid'] = $_REQUEST['uid'];
		}
		
		if($_REQUEST['uname'] && !$_REQUEST['uid']){
			$map['m.user_name'] = array("like",urldecode($_REQUEST['uname'])."%");
		}

		if($_REQUEST['target_uname']){
			$map['ml.target_uname'] = urldecode($_REQUEST['target_uname']);
		}

		if(isset($_REQUEST['type']) && $_REQUEST['type'] != ''){
			$map['ml.type'] = intval($_REQUEST['type']);
		}
		
		if(!empty($_REQUEST['bj']) && !empty($_REQUEST['money'])){
			$map['ml.affect_money'] = array($_REQUEST['bj'],$_REQUEST['money']);
		}

		if(!empty($_REQUEST['start_time']) && !empty($_REQUEST['end_time'])){
			$timespan = strtotime(urldecode($_REQUEST['start_time'])).",".strtotime(urldecode($_REQUEST['end_time']));
			$map['ml.add_time'] = array("between",$timespan);
		}elseif(!empty($_REQUEST['start_time'])){
			$xtime = strtotime(urldecode($_REQUEST['start_time']));
			$map['ml.add_time'] = array("gt",$xtime);
		}elseif(!empty($_REQUEST['end_time'])){
			$xtime = strtotime(urldecode($_REQUEST['end_time']));
			$map['ml.add_time'] = array("lt",$xtime);
		}
//		if(session('admin_is_kf')==1)	$map['m.customer_id'] = session('admin_id');

        $ml = new MoneyLogModel();
        $field = "ml.id,ml.add_time,m.user_name,ml.affect_money,ml.freeze_money,ml.collect_money,
        (ml.account_money+ml.back_money) account_money,ml.target_uname,ml.type,ml.info";
        $where['map'] = $map;
        $where['limit'] = 'all';
        $join[] = "__MEMBERS__ m ON m.id=ml.uid";
        $list = $ml->getList($field,$where,$join);

		$type = C('MONEY_LOG');
		$row=array();
		$row[0]=array('序号','用户ID','用户名','交易对方','交易类型','影响金额','可用余额','冻结金额','待收金额','发生时间','备注');
		$i=1;
		foreach($list as $v){
				$row[$i]['i'] = $i;
				$row[$i]['uid'] = $v['id'];
				$row[$i]['card_num'] = $v['user_name'];
				$row[$i]['card_pass'] = $v['target_uname'];
				$row[$i]['card_mianfei'] = $type[$v['type']];
				$row[$i]['card_mianfei0'] = $v['affect_money'];
				$row[$i]['card_mianfei1'] = $v['account_money'];
				$row[$i]['card_mianfei2'] = $v['freeze_money'];
				$row[$i]['card_mianfei3'] = $v['collect_money'];
				$row[$i]['card_timelimit'] = date("Y-m-d H:i:s",$v['add_time']);
				$row[$i]['info'] = $v['info'];
				$i++;
		}
		
		$xls = new Excel_XML('UTF-8', false, 'datalist');
		$xls->addArray($row);
		$xls->generateXML("datalistcard");
	}


	
}
?>