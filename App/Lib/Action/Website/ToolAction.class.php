<?php
// 尚贷内核类库，2014-06-11_listam
class ToolAction extends HCommonAction {
	//借款计算器
    public function index(){
        $conf = get_global_setting();
        $fee_borrow_manage = explode("|",$conf['fee_borrow_manage']);
		if($_POST){
			// var_dump($_POST);exit();
			$amount = round(floatval($_POST['amount']),4);//借款金额
			$date_limit = intval($_POST['date_limit']);//借款期限
			$rate = floatval($_POST['rate']);			//借款利率
			$reward_rate = floatval($_POST['reward_rate']);//借款奖励


			$rate_type = (intval($_POST['rate_type'])==2)?2:1;//投资利率：1：年利率；2：日利率

			$repayment_type = intval($_POST['repayment_type']);//借款类型
			if ($repayment_type !=1 && $rate_type==2) 	$rate = $rate*365;//利率
			if ($repayment_type ==1 && $rate_type==1) 	$rate = $rate/365;//
            $b_p_fee = 0;
            if($repayment_type!=1){
                $repay_detail['borrow_manage'] = round($amount*$fee_borrow_manage[1]/100*$date_limit/12,2);//借款管理费
                $b_p_fee = round($amount*$fee_borrow_manage[2]/12/100,2);
            }
            $repay_detail['b_p_fee'] = $b_p_fee;
			$repay_detail['reward_money'] = round($amount*$reward_rate/100,2);//奖励
			$repay_detail['borrow_money'] = $amount  - $repay_detail['borrow_manage'] - $repay_detail['reward_money'];
			switch ($repayment_type) {
				case '1'://按天到期还款
					$repay_detail['repayment_money'] = round($amount*($rate*$date_limit+100)/100,2);
					$repay_detail['interest'] = $repay_detail['repayment_money'] - $amount;
					$repay_detail['day_apr'] = round(($repay_detail['repayment_money']-$repay_detail['borrow_money'])*100/($repay_detail['borrow_money']*$date_limit),2);
					$repay_detail['year_apr'] = $rate;
                    $repay_detail['b_p_fee'] = $b_p_fee;
					$repay_detail['month_apr'] = round($repay_detail['day_apr']*365/12,2); 
					break;
				case '4'://到期还本息
					$repay_detail['repayment_money'] = round($amount*($date_limit*$rate/12+100)/100,2);
					$repay_detail['interest'] = $repay_detail['repayment_money'] - $amount;
					$repay_detail['month_apr'] = round(($repay_detail['repayment_money']-$repay_detail['borrow_money'])*100/($repay_detail['borrow_money']*$date_limit),2); 
					$repay_detail['year_apr'] = $rate;
                    $repay_detail['b_p_fee'] = $b_p_fee;
					$repay_detail['day_apr'] = round($repay_detail['month_apr']*12/365,2);
					break;
				case '3'://每月还息到期还本
					$repay_detail['repayment_money'] = round($amount*($rate*$date_limit/12+100)/100,2);
					$repay_detail['interest'] = $repay_detail['repayment_money'] - $amount;
					$repay_detail['month_apr'] = round(($repay_detail['repayment_money']-$repay_detail['borrow_money'])*100/($repay_detail['borrow_money']*$date_limit),2); 
					$repay_detail['year_apr'] = $rate;
					$repay_detail['day_apr'] = round($repay_detail['month_apr']*12/365,2);

  					$interest = round($amount*$rate/12/100,2);//利息等于应还金额乘月利率
  					for($i=0;$i<$date_limit;$i++){
	  					if ($i+1 == $date_limit)	$capital = $amount;//本金只在最后一个月还，本金等于借款金额除季度
					  	else 	$capital = 0;
	  
					  	$_result[$i]['repayment_money'] = $interest+$capital;
					  	$_result[$i]['interest'] = $interest;
					  	$_result[$i]['capital'] = $capital;
                        $_result[$i]['b_p_fee'] = $b_p_fee;
  					}
					break;
				case '5'://先息后本
					$repay_detail['interest'] = round($amount*$rate*$date_limit/12/100,2);
					$repay_detail['borrow_money'] -= $repay_detail['interest'];
					$repay_detail['repayment_money'] = $amount;

					$repay_detail['month_apr'] = round(($repay_detail['repayment_money']-$repay_detail['borrow_money'])*100/($repay_detail['borrow_money']*$date_limit),2); 
					$repay_detail['year_apr'] = $rate;
                    $repay_detail['b_p_fee'] = $b_p_fee;
					$repay_detail['day_apr'] = round($repay_detail['month_apr']*12/365,2);
					break;
				case '2'://按月分期还款
				default:
					$month_apr = $rate/(12*100);
					$_li = pow((1+$month_apr),$date_limit);
					$repayment = ($_li!=1)?round($amount * ($month_apr * $_li)/($_li-1),2):round($amount/$date_limit,2);
					$repay_detail['repayment_money'] = $repayment*$date_limit;
					$repay_detail['interest'] = $repay_detail['repayment_money'] - $amount;

					for($i=0;$i<$date_limit;$i++){
						if ($i==0){
							$interest = round($amount*$month_apr,2);
						}else{
							$_lu = pow((1+$month_apr),$i);
							$interest = round(($amount*$month_apr - $repayment)*$_lu + $repayment,2);
						}
						$_result[$i]['repayment_money'] = getFloatValue($repayment,2);
						$_result[$i]['interest'] = getFloatValue($interest,2);
						$_result[$i]['capital'] = getFloatValue($repayment-$interest,2);
                        $_result[$i]['b_p_fee'] = $b_p_fee;
					}

					$month_apr2 = ($repay_detail['repayment_money']-$repay_detail['borrow_money'])/($repay_detail['borrow_money']*$date_limit);
					$rekursiv = 0.001;
					for ($i=0; $i < 100; $i++) { 
						$_li2 = pow((1+$month_apr2),$date_limit);
						$repay = $repay_detail['borrow_money'] * $date_limit * ($month_apr2 * $_li2)/($_li2-1);
						if($repay<$repay_detail['repayment_money']*0.99999) {
							$month_apr2 += $rekursiv;
						}elseif($repay>$repay_detail['repayment_money']*1.00001) {
							$month_apr2 -= $rekursiv*0.9;
							$rekursiv *= 0.1;
						}else break;
					}
					$repay_detail['month_apr'] = round($month_apr2*100,2); 
 
					$repay_detail['year_apr'] = $rate;
					$repay_detail['day_apr'] = round($repay_detail['month_apr']*12/365,2);
					break;
			}
			$repay_detail['total_interest'] = round($repay_detail['repayment_money'] - $repay_detail['borrow_money'],2);

			$this->assign('repayment_type',$repayment_type);
			$this->assign('month',$date_limit);
			$this->assign('repay_list',$_result);
			$this->assign('repay_detail',$repay_detail);
			
			$data['html'] = $this->fetch('index_res');
			exit(json_encode($data));
		}

        $this->assign('fee_borrow_manage',$fee_borrow_manage);

		$this->assign("leftlist",array(1=>array("turl"=>"/tools/tool2.html","type_name"=>"投资计算器"),0=>array("turl"=>"/tools/tool.html","type_name"=>"借款计算器")));
		$this->display();
	}

	//投资计算器
    public function tool2(){
		if($_POST){
			// var_dump($_POST);exit();
			$amount = round(floatval($_POST['amount']),2);//投资金额
			$date_limit = intval($_POST['date_limit']);//投资期限
			$rate = floatval($_POST['rate']);//投资利率
			$reward_rate = floatval($_POST['reward_rate']);//借款奖励
			$invest_manage = floatval($_POST['invest_manage']);//利息管理费

			$rate_type = (intval($_POST['rate_type'])==2)?2:1;//投资利率：1：年利率；2：日利率
			$date_type = (intval($_POST['date_type'])==2)?2:1;//投资类型：1：月；2：日

			$repayment_type = intval($_POST['repayment_type']);
			if ($repayment_type !=1 && $rate_type==2) 	$rate = $rate*365;
			if ($repayment_type ==1 && $rate_type==1) 	$rate = $rate/365;
		
			$repay_detail['reward_money'] = round($amount*$reward_rate/100,2);
			$repay_detail['invest_money'] = $amount - $repay_detail['reward_money'];
			switch ($repayment_type) {
				case '1'://按天到期还款
					$repay_detail['repayment_money'] = round($amount*($rate*$date_limit*(100-$invest_manage)/100+100)/100,2);
					$repay_detail['interest'] = round($repay_detail['repayment_money'] - $amount,2);
					$repay_detail['day_apr'] = round(($repay_detail['repayment_money']-$repay_detail['invest_money'])*100/($repay_detail['invest_money']*$date_limit),2); 
					//$repay_detail['year_apr'] = $rate;
					$repay_detail['year_apr'] = round($repay_detail['day_apr']*365,2);
					$repay_detail['month_apr'] = round($repay_detail['day_apr']*365/12,2); 
					break;
				case '4'://到期还本息
					$repay_detail['repayment_money'] = round(($amount+$amount*($date_limit*$rate/12/100)*(100-$invest_manage)/100),2); 
					$repay_detail['interest'] = round($repay_detail['repayment_money'] - $amount,2);
					$repay_detail['month_apr'] = round(($repay_detail['repayment_money']-$repay_detail['invest_money'])*100/($repay_detail['invest_money']*$date_limit),2); 
					//$repay_detail['year_apr'] = $rate;
					$repay_detail['year_apr'] = round($repay_detail['month_apr']*12,2);
					$repay_detail['day_apr'] = round($repay_detail['month_apr']*12/365,2);
					break;
				case '3'://每月还息到期还本
					$repay_detail['repayment_money'] = round($amount*($rate*$date_limit*(100-$invest_manage)/100/12+100)/100,2);
					$repay_detail['interest'] = round($repay_detail['repayment_money'] - $amount,2);
					$repay_detail['month_apr'] = round(($repay_detail['repayment_money']-$repay_detail['invest_money'])*100/($repay_detail['invest_money']*$date_limit),2); 
					//$repay_detail['year_apr'] = $rate;
					$repay_detail['year_apr']=round($repay_detail['month_apr']*12,2);
					$repay_detail['day_apr'] = round($repay_detail['month_apr']*12/365,2);

  					$interest = round($amount*$rate*(100-$invest_manage)/100/12/100,2);//利息等于应还金额乘月利率
					$repay = $repay_detail['repayment_money'];
  					for($i=0;$i<$date_limit;$i++){
	  					if ($i+1 == $date_limit){
	  						$capital = $amount;//本金只在最后一个月还，本金等于借款金额除季度
	  						$repay = $interest+$capital;
	  					}else{
	  						$capital = 0;
	  						$repay = $repay- $interest;
	  					} 	
	  
					  	$_result[$i]['repayment_money'] = $interest+$capital;
					  	$_result[$i]['interest'] = $interest;
					  	$_result[$i]['capital'] = $capital;
						$_result[$i]['last_money'] = $repay;
  					}
					break;
				case '5'://先息后本
					$repay_detail['interest'] = round(($amount*($rate/12/100)*$date_limit)*((100-$invest_manage)/100),2);
					$repay_detail['invest_money'] -= $repay_detail['interest'];
					$repay_detail['repayment_money'] = $amount; 

					$repay_detail['month_apr'] = round(($repay_detail['repayment_money']-$repay_detail['invest_money'])*100/($repay_detail['invest_money']*$date_limit),2); 
				//	$repay_detail['year_apr'] = $rate;
					$repay_detail['year_apr']=round($repay_detail['month_apr']*12,2);
					$repay_detail['day_apr'] = round($repay_detail['month_apr']*12/365,2);
					break;
				case '2'://按月分期还款
				default:
					$month_apr = $rate/(12*100);
					$_li = pow((1+$month_apr),$date_limit);
					$repayment = ($_li!=1)?round($amount * ($month_apr * $_li)/($_li-1),2):round($amount/$date_limit,2);
					$repay_detail['repayment_money'] = round(($repayment*$date_limit-$amount)*(100-$invest_manage)/100+$amount,2);
					$repay_detail['interest'] = round($repay_detail['repayment_money'] - $amount,2);

					$repay = $repay_detail['repayment_money'];
					for($i=0;$i<$date_limit;$i++){
						if ($i==0){
							$interest = round($amount*$month_apr,2);
						}else{
							$_lu = pow((1+$month_apr),$i);
							$interest = round(($amount*$month_apr - $repayment)*$_lu + $repayment,2);
						}
						$fee = $interest*$invest_manage/100;

						$_result[$i]['repayment_money'] = getFloatValue($repayment-$fee,2);
						$_result[$i]['interest'] = getFloatValue($interest-$fee,2);
						$_result[$i]['capital'] = getFloatValue($repayment-$interest,2);

						if($i+1 != $date_limit)	$repay = $repay-$_result[$i]['repayment_money'];
						else $repay = 0;
						$_result[$i]['last_money'] = $repay;
					}

					$month_apr2 = ($repay_detail['repayment_money']-$repay_detail['invest_money'])/($repay_detail['invest_money']*$date_limit);
					$rekursiv = 0.001;
					for ($i=0; $i < 100; $i++) { 
						$_li2 = pow((1+$month_apr2),$date_limit);
						$repay = $repay_detail['invest_money'] * $date_limit * ($month_apr2 * $_li2)/($_li2-1);
						if($repay<$repay_detail['repayment_money']*0.99999) {
							$month_apr2 += $rekursiv;
						}elseif($repay>$repay_detail['repayment_money']*1.00001) {
							$month_apr2 -= $rekursiv*0.9;
							$rekursiv *= 0.1;
						}else break;
					}
					$repay_detail['month_apr'] = round($month_apr2*100,2); 
 
//					$repay_detail['year_apr'] = $rate;
					$repay_detail['year_apr']=round($repay_detail['month_apr']*12,2);
					$repay_detail['day_apr'] = round($repay_detail['month_apr']*12/365,2);
					break;
			}
			$repay_detail['total_interest'] = round($repay_detail['repayment_money'] - $repay_detail['invest_money'],2);

			$this->assign('repayment_type',$repayment_type);
			$this->assign('month',$date_limit);
			$this->assign('repay_list',$_result);
			$this->assign('repay_detail',$repay_detail);
			
			$data['html'] = $this->fetch('tool2_res');
			exit(json_encode($data));
		}

		//网站公告
		$parm['type_id'] = 321;
		$parm['limit'] = 8;
		$this->assign("noticeList",getArticleList($parm));

		$this->assign("leftlist",array(1=>array("turl"=>"/tools/tool2.html","type_name"=>"投资计算器"),0=>array("turl"=>"/tools/tool.html","type_name"=>"借款计算器")));
		$this->display();
	}
	
	
    public function tool3(){
		if($_POST){
			$money = floatval($_POST['money']);
			$rate = floatval($_POST['interest_rate']);
			$month = ($_POST['selDays']== -1)?intval($_POST['month']):intval($_POST['selDays']);
			$fee = getFloatValue( ($rate/12 * $month * $money)/100 + $money,4);
			$this->assign('mmoney',$money);
			$this->assign('m',$month);
			$this->assign('fee',$fee);

			$parm['month_times'] = $month;
			$parm['account'] = $money;
			$parm['year_apr'] = $rate;
			$repay_detail = EqualSeason($parm);
			$parm['type'] = "all";
			$repay_summary = EqualSeason($parm);
			
			$this->assign('repay_detail',$repay_detail);
			$this->assign('repay_summary',$repay_summary);

			$data['html_1'] = $this->fetch('tool3_res_1');
			$data['html_2'] = $this->fetch('tool3_res_2');
			exit(json_encode($data));
		}
		$this->display();
	}
	///////////////////////////////////实时财务开始 2013-05-11////////////////////////////////
	
	public function finanz(){
        $md = new MemberMoneyDetailModel();
        $mdinfo = $md->field("sum(borrow) as mborrowOut,sum(borrow-repayment_money) as mborrowLimit")->find();
                //成功放款总额（散标）
		$this->assign( "mborrowOut",$mdinfo['mborrowOut']);
                //成功放款笔数（散标）
		$this->assign( "mborrowOutNum",M( "borrow_info" )->where( "borrow_status > 5" )->count( ) );
                //待回收本金总额（散标）
		$this->assign( "mborrowLimit",$mdinfo['mborrowLimit']);
                //投资理财用户（散标）
        $this->assign( "mborrowCount",M( "members" )->count() );

		$this->display();
	}

	public function finanzData(){
		$per = C('DB_PREFIX');
		$investDetail = new InvestorDetailModel();
        $md = new MemberMoneyDetailModel();
		$site = intval($_GET['site']);
		switch ($site) {
			case 2:
                $map['d.deadline'] = array("lt",time());
                $map['d.status'] = array("in","7");
                $map['d.repayment_time'] = 0;
                $field = "sum(d.capital+d.interest) as capital_all,
				d.borrow_uid,m.user_name,d.borrow_id,b.borrow_name,sum(d.interest) as interest,
				d.repayment_time,d.deadline";
                $where['map'] = $map;
                $where['limit'] = 10;
                $where['group'] = "d.sort_order,d.borrow_id";
                $where['order'] = "d.deadline asc";
                $join = array();
                $join[] = "__MEMBERS__ m on m.id = d.borrow_uid";
                $join[] = "__BORROW_INFO__ b on b.id = d.borrow_id";
                $list = $investDetail->getList($field,$where,$join);

				$this->assign("page", $list['page']);
				$this->assign("tendlately", $list['list']);

				$data['html'] = $this->fetch('finanz_res1');
				exit(json_encode($data));
				break;
			case 3:
                $map['md.suc_capital'] = array('gt',0);
                $where['map'] = $map;
                $where['limit'] = 10;
                $where['order'] = "md.suc_capital desc";
                $field = "md.suc_capital,m.user_name";
                $join = array();
                $join[] = "__MEMBERS__ m on m.id = md.uid";
                $list = $md->getList($field,$where,$join);
                $this->assign("page", $list['page']);
				$this->assign("tenddata", $list['list']);
				$data['html'] = $this->fetch('finanz_res2');
				exit(json_encode($data));
				break;
			case 4:
                $map['md.borrow'] = array('gt',0);
                $where['map'] = $map;
                $where['limit'] = 10;
                $where['order'] = "md.borrow desc";
                $field = "md.borrow as suc_capital,m.user_name";
                $join = array();
                $join[] = "__MEMBERS__ m on m.id = md.uid";
                $list = $md->getList($field,$where,$join);
                $this->assign("page", $list['page']);
				$this->assign("tenddata", $list['list']);
				$data['html'] = $this->fetch('finanz_res2');
				exit(json_encode($data));
				break;
			case 1:
			default:
				$time = strtotime("+1 week");
                $map['d.deadline'] = array("between",array(time(),$time));
                $map['d.status'] = array("in","(1,2,7)");
				$field = "sum(d.capital+d.interest) as capital_all,
				d.borrow_uid,m.user_name,d.borrow_id,b.borrow_name,sum(d.interest) as interest,
				d.repayment_time,d.deadline";
				$where['map'] = $map;
                $where['limit'] = 10;
                $where['group'] = "d.sort_order,d.borrow_id";
                $where['order'] = "d.deadline asc";
                $join = array();
                $join[] = "__MEMBERS__ m on m.id = d.borrow_uid";
                $join[] = "__BORROW_INFO__ b on b.id = d.borrow_id";
                $list = $investDetail->getList($field,$where,$join);
				//分页处理

				$this->assign("page", $list['page']);
				$this->assign("tendlately", $list['list']);

				$data['html'] = $this->fetch('finanz_res1');
				exit(json_encode($data));
				break;
		}

		$data['html'] = "无相关记录";
		exit(json_encode($data));
	}
	///////////////////////////////////实时财务开始 2013-05-11////////////////////////////////
	
	
	
	
}