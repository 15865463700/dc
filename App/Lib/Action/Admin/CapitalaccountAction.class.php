<?php
// 全局设置
class CapitalaccountAction extends ACommonAction
{
    /**
    +----------------------------------------------------------
    * 默认操作
    +----------------------------------------------------------
    */
    public function index()
    {
		$map=array();
		if($_REQUEST['uname']){
			$map['m.user_name'] = array("like",urldecode($_REQUEST['uname'])."%");
			$search['uname'] = urldecode($_REQUEST['uname']);	
		}
		if($_REQUEST['realname']){
			$map['mi.real_name'] = urldecode($_REQUEST['realname']);
			$search['realname'] = $map['mi.real_name'];	
		}
		if(!empty($_REQUEST['bj']) && !empty($_REQUEST['lx']) && !empty($_REQUEST['money'])){
			if($_REQUEST['lx']=='allmoney'){
				if($_REQUEST['bj']=='gt'){
					$bj = '>';
				}else if($_REQUEST['bj']=='lt'){
					$bj = '<';
				}else if($_REQUEST['bj']=='eq'){
					$bj = '=';
				}
				$map['_string'] = "(mm.account_money+mm.back_money) ".$bj.$_REQUEST['money'];
			}else{
				$map[$_REQUEST['lx']] = array($_REQUEST['bj'],$_REQUEST['money']);
			}
			$search['bj'] = $_REQUEST['bj'];	
			$search['lx'] = $_REQUEST['lx'];	
			$search['money'] = $_REQUEST['money'];	
		}

        $mm = new MemberMoneyModel();

        $field = "m.id,m.user_name,mi.real_name,mm.money_collect,mm.money_freeze,
        (mm.account_money+mm.back_money) total_money,
        (mm.account_money+mm.back_money+mm.money_freeze+mm.money_collect) total,
        (md.suc_capital-md.receive_capital-md.sell_debt_capital+md.buy_debt_capital) dsbj,
        (md.net_interest-md.receive_interest-md.sell_debt_interest+md.buy_debt_interest) dslx,
        (md.borrow+md.wait_pay_interest-md.repayment_money-paid_interest) dfbx,
        (md.borrow-md.repayment_money) dfbj,(md.wait_pay_interest-paid_interest) dflx,
        md.withdraw_freeze,md.withdraw_fee,md.charge_fee,md.withdraw,md.charge,
        (md.borrow_fee+md.borrow_service_fee+md.interest_fee+md.invest_reward_out) ljzfyj,
        md.invest_reward_in,md.spread_reward,md.offline_reward,md.re_invest_reward,
        (md.receive_interest-md.interest_fee) jzlx,md.paid_interest,md.admin_options";
        $join[] = "__MEMBERS__ m on m.id = mm.uid";
        $join[] = "__MEMBER_INFO__ mi on mi.uid = mm.uid";
        $join[] = "__MEMBER_MONEY_DETAIL__ md on md.uid = mm.uid";
        $searchx = array();
        $searchx['map'] = $map;
        $searchx['limit'] = C('ADMIN_PAGE_SIZE');
//        $searchx['order'] = $order;
        $list = $mm->getList($field,$searchx,$join);

        $this->assign("bj", array("gt"=>'大于',"eq"=>'等于',"lt"=>'小于'));
        $this->assign("lx", array("allmoney"=>'可用余额',"mm.money_freeze"=>'冻结金额',"mm.money_collect"=>'待收金额'));
        $this->assign("list", $list['list']);
        $this->assign("pagebar", $list['page']);
        $this->assign("search", $search);
        $this->assign("query", http_build_query($search));
//        $this->assign("flag", $flag);
        $this->display();
    }
	
	public function export(){
		import("ORG.Io.Excel");
		alogs("CapitalAccount",0,1,'执行了所有会员资金列表导出操作！');//管理员操作日志
		$map=array();
		if($_REQUEST['uname']){
			$map['m.user_name'] = array("like",urldecode($_REQUEST['uname'])."%");
			$search['uname'] = urldecode($_REQUEST['uname']);	
		}
		if($_REQUEST['realname']){
			$map['mi.real_name'] = urldecode($_REQUEST['realname']);
			$search['realname'] = $map['mi.real_name'];	
		}
		if(!empty($_REQUEST['bj']) && !empty($_REQUEST['lx']) && !empty($_REQUEST['money'])){
			if($_REQUEST['lx']=='allmoney'){
				if($_REQUEST['bj']=='gt'){
					$bj = '>';
				}else if($_REQUEST['bj']=='lt'){
					$bj = '<';
				}else if($_REQUEST['bj']=='eq'){
					$bj = '=';
				}
				$map['_string'] = "(mm.account_money+mm.back_money) ".$bj.$_REQUEST['money'];
			}else{
				$map[$_REQUEST['lx']] = array($_REQUEST['bj'],$_REQUEST['money']);
			}
			$search['bj'] = $_REQUEST['bj'];	
			$search['lx'] = $_REQUEST['lx'];	
			$search['money'] = $_REQUEST['money'];	
		}
        $mm = new MemberMoneyModel();

        $field = "m.id,m.user_name,mi.real_name,mm.money_collect,mm.money_freeze,
        (mm.account_money+mm.back_money) total_money,
        (mm.account_money+mm.back_money+mm.money_freeze+mm.money_collect) total,
        (md.suc_capital-md.receive_capital-md.sell_debt_capital+md.buy_debt_capital) dsbj,
        (md.net_interest-md.receive_interest-md.sell_debt_interest+md.buy_debt_interest) dslx,
        (md.borrow+md.wait_pay_interest-md.repayment_money-paid_interest) dfbx,
        (md.borrow-md.repayment_money) dfbj,(md.wait_pay_interest-paid_interest) dflx,
        md.withdraw_freeze,md.withdraw_fee,md.charge_fee,md.withdraw,md.charge,
        (md.borrow_fee+md.borrow_service_fee+md.interest_fee+md.invest_reward_out) ljzfyj,
        md.invest_reward_in,md.spread_reward,md.offline_reward,md.re_invest_reward,
        (md.receive_interest-md.interest_fee) jzlx,md.paid_interest,md.admin_options";
        $join[] = "__MEMBERS__ m on m.id = mm.uid";
        $join[] = "__MEMBER_INFO__ mi on mi.uid = mm.uid";
        $join[] = "__MEMBER_MONEY_DETAIL__ md on md.uid = mm.uid";
        $searchx = array();
        $searchx['map'] = $map;
        $searchx['limit'] = 'all';
        $list = $mm->getList($field,$searchx,$join);

		$row=array();
		$row[0]=array('ID','用户名','真实姓名','总资产','可用余额','冻结金额',
            '待收本息金额','待收本金','待收利息','待付本息金额','待付本金',
            '待付利息','累计提现金额','待审核提现','累计提现手续费',
            '累计充值金额','累计充值手续费','累计支付佣金','累计投标奖励',
            '累计推广奖励','累计充值奖励','累计续投奖励','净赚利息','净付利息','管理员操作资金');
		$i=1;
		foreach($list as $v){
				$row[$i]['uid'] = $v['id'];
				$row[$i]['user_name'] = $v['user_name'];
				$row[$i]['real_name'] = $v['real_name']==""?"--":$v['real_name'];
				$row[$i]['total'] = $v['total'];
				$row[$i]['total_money'] = $v['total_money'];
				$row[$i]['money_freeze'] = $v['money_freeze'];
				$row[$i]['money_collect'] = $v['money_collect'];
				$row[$i]['dsbj'] = $v['dsbj'];
				$row[$i]['dslx'] = $v['dslx'];
				
				$row[$i]['dfbx'] = $v['dfbx'];
				$row[$i]['dfbj'] = $v['dfbj'];
				$row[$i]['dflx'] = $v['dflx'];
				$row[$i]['withdraw'] = $v['withdraw'];
				$row[$i]['withdraw_freeze'] = $v['withdraw_freeze'];
				
				$row[$i]['withdraw_fee'] = $v['withdraw_fee'];
				$row[$i]['charge'] = $v['charge'];
				$row[$i]['charge_fee'] = $v['charge_fee'];
				$row[$i]['ljzfyj'] = $v['ljzfyj'];
				$row[$i]['invest_reward_in'] = $v['invest_reward_in'];

				$row[$i]['spread_reward'] = $v['spread_reward'];

                $row[$i]['offline_reward'] = $v['offline_reward'];
                $row[$i]['re_invest_reward'] = $v['re_invest_reward'];
                $row[$i]['jzlx'] = $v['jzlx'];


				$row[$i]['paid_interest'] = $v['paid_interest'];
				$row[$i]['admin_options'] = $v['admin_options'];
				$i++;
			}
		$xls = new Excel_XML('UTF-8', false, 'datalist');
		$xls->addArray($row);
		$xls->generateXML("datalistcard");
	}


	
}
?>