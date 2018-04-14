<?php
//借款逾期但还未还的借款列表(逾期)
function getMBreakRepaymentList($uid=0,$size=10,$Wsql=""){
	if(empty($uid)) return;
	$pre = C('DB_PREFIX');
	if($size){
		//分页处理
		import("ORG.Util.Page");
//		$count = M()->query("select d.id as count from {$pre}investor_detail d where d.borrow_id in(select tb.id from {$pre}borrow_info tb where tb.borrow_uid={$uid}) AND tb.borrow_status in(6,9) AND d.deadline<".time()." AND d.repayment_time=0 {$Wsql} ");
		$count=  M()->query("select d.id as count from {$pre}
investor_detail d left join {$pre}borrow_info b ON b.id=d.borrow_id
where d.borrow_uid ={$uid} AND b.borrow_status in(6,7) AND d.deadline<".time()."
AND d.repayment_time=0 {$Wsql} group by d.sort_order,d.borrow_id order by  d.borrow_id,d.sort_order");
                $count = count($count);
		$p = new Page($count, $size);
		$page = $p->show(1);
		$Lsql = "{$p->firstRow},{$p->listRows}";
		//分页处理
	}else{
		$page="";
		$Lsql="{$parm['limit']}";
	}
	
	$field = "b.borrow_name,d.status,d.total,d.borrow_id,d.sort_order,sum(d.capital) as capital,sum(d.interest) as interest,d.deadline";
	$sql = "select {$field} from {$pre}investor_detail d left join {$pre}borrow_info b ON b.id=d.borrow_id where d.borrow_uid ={$uid} AND b.borrow_status in(6,7) AND d.deadline<".time()." AND d.repayment_time=0 {$Wsql} group by d.sort_order,d.borrow_id order by  d.borrow_id,d.sort_order limit {$Lsql}";

	$list = M()->query($sql);
	$status_arr =array('还未还','已还完','已提前还款','逾期还款','网站代还');
	$glodata = get_global_setting();
	$expired = explode("|",$glodata['fee_expired']);
	$call_fee = explode("|",$glodata['fee_call']);
	foreach($list as $key=>$v){
		$list[$key]['status'] = $status_arr[$v['status']];
		$list[$key]['breakday'] = getExpiredDays($v['deadline']);
		
		if($list[$key]['breakday']>$expired[0]){
			$list[$key]['expired_money'] = getExpiredMoney($list[$key]['breakday'],$v['capital'],$v['interest']);
		}
		
		if($list[$key]['breakday']>$call_fee[0]){
			$list[$key]['call_fee'] = getExpiredCallFee($list[$key]['breakday'],$v['capital'],$v['interest']);
		}
		
		$list[$key]['allneed'] = $list[$key]['call_fee'] + $list[$key]['expired_money'] + $v['capital'] + $v['interest'];
	}
	$row=array();
	$row['list'] = $list;
	$row['page'] = $page;
	$row['count'] = $count;
	return $row;
}

function getBackingList($map,$size,$limit=10){
	$pre = C('DB_PREFIX');
	if(empty($map['d.investor_uid'])) return;
	
	if($size){
		//分页处理
		import("ORG.Util.Page");
		$count = M('investor_detail d')->where($map)->count('d.id');
		$p = new Page($count, $size);
		$page = $p->show();
		$Lsql = "{$p->firstRow},{$p->listRows}";
		//分页处理
	}else{
		$page="";
		$Lsql="{$parm['limit']}";
	}
	
	$type_arr =C('BORROW_TYPE');
	$field = true;
	$list = M('investor_detail d')->field($field)->where($map)->order('d.id DESC')->limit($Lsql)->select();
	foreach($list as $key=>$v){
		//$list[$key]['status'] = $status_arr[$v['status']];
	}
	
	$row=array();
	$row['list'] = $list;
	$row['page'] = $page;
	$sx = M('investor_detail d')->field("sum(d.capital + d.interest) as tox")->where("d.status=1 AND d.investor_uid={$map['d.investor_uid']}")->find();
	$sxcount = M('borrow_investor')->where("status=4 AND investor_uid={$map['d.investor_uid']}")->count("id");
	$month = M('investor_detail d')->field("sum(d.capital + d.interest) as tox")->where($map)->find();
	$row['month_total'] = $month['tox'];
	$row['total_money'] = $sx['tox'];
	$row['total_num'] = $sxcount;
	return $row;
}


//在线客服
function get_qq($type){
    $list = M('qq')->where("type = $type and is_show = 1")->order("qq_order DESC")->select();
	return $list;
}


function getTDTenderList($map, $size, $limit = 10)
{
	$pre = C("DB_PREFIX");
	$Bconfig = require(C("APP_ROOT")."Conf/borrow_config.php");
	if(empty($map['d.investor_uid']))
	{
		return;
	}
	if($size)
	{
		import("ORG.Util.Page");
		$count = M("transfer_investor_detail d")->where($map)->count("d.id");
		$p = new Page($count, $size);
		$page = $p->show();
		$Lsql = "{$p->firstRow},{$p->listRows}";
	}else{
		$page = "";
		$Lsql = "{$parm['limit']}";
	}
	$type_arr = $Bconfig['BORROW_TYPE'];
	$field = "d.*,m.user_name as borrow_user,b.borrow_name,m.credits,i.add_time";
	$list = M("transfer_investor_detail d")->field($field)->where($map)->join("{$pre}transfer_borrow_info b ON b.id=d.borrow_id")->join( "{$pre}transfer_borrow_investor i ON i.id=d.invest_id")->join("{$pre}members m ON m.id=b.borrow_uid")->order("d.deadline ASC")->limit($Lsql)->select();
	foreach($list as $key => $v)
	{
	}
	$row = array();
	$row['list'] = $list;
	$row['page'] = $page;
	$row['total_money'] = M("transfer_investor_detail d")->where($map)->sum("`capital`+`interest`-`interest_fee`");
	$row['total_num'] = $count;
	return $row;
}
///个人资料分
function getMemberInfoList($uid){
    $pre = C('DB_PREFIX');
    $map = array();
    $map["m.id"] = $uid;
    //分页处理

    $field = "m.id,m.id as uid,m.user_name,mbank.bank_num as mbank_bank_num,mi.idcard as mi_idcard,mci.address as mci_address,mhi.house_dizhi as mhi_house_dizhi,mdpi.department_name as mdpi_department_name,mei.ensuer1_name as mei_ensuer1_name,mfi.fin_house as mfi_fin_house";
    $v = M('members m')->field($field)->join("{$pre}member_banks mbank ON m.id=mbank.uid")->join("{$pre}member_contact_info mci ON m.id=mci.uid")->join("{$pre}member_department_info mdpi ON m.id=mdpi.uid")->join("{$pre}member_house_info mhi ON m.id=mhi.uid")->join("{$pre}member_ensure_info mei ON m.id=mei.uid")->join("{$pre}member_info mi ON m.id=mi.uid")->join("{$pre}member_financial_info mfi ON m.id=mfi.uid")->where($map)->find();

    $fenshu = 0;
    $status = 0;
    if($v['mi_idcard'] != ""&& $v['mci_address'] != ""&&$v['mdpi_department_name'] != ""&&$v['mfi_fin_house'] != ""&&$v['mhi_house_dizhi'] != ""&&$v['mei_ensuer1_name'] != ""){
        $status = 1;
    }




    $list = array();
    $list["status"] = $status;

    return $list;
}

//////////////////////////////企业直投 管理模块结束  /////////////////////////////

function getMemberIsBusiness($uid){
	$model = new MembersModel();
	$html = '';
	return $model->where(array('id'=>intval($uid)))->getField('is_business');
}



function getMemberBusiness($uid){
	$model = new MembersModel();
	$html = '';
	$is_business = $model->where(array('id'=>intval($uid)))->getField('is_business');
	if ($is_business == 1){
		$html = '<span style="color:#f00">企业会员</span>';
	}
	return $html;
}

function getBusinessData($uid){
	$model  = new BusinessApplyModel();
	$where = array('uid' => intval($uid));
	return $model->where($where)->find();
}
?>