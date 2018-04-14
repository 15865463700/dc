<?php
/**
 * 手机版 用户中心
 */
class UserAction extends MobileAction
{
    function __construct(){
        parent::__construct();
        $this->member = new MembersModel();
        $this->inner = new InnerMsgModel();
        $this->withdraw = new WithdrawModel();
        $this->borrow = new BorrowModel();
        $this->sl = new SmsLogModel();
        $this->borrowInvestor = new BorrowInvestorModel();
        $this->moneylog = new MoneyLogModel();
        $this->cl = new CouponListModel();
        $this->cl->userCouponList($this->uid,2);
        $this->cl->userCouponList($this->uid,11);
        if(!$this->uid){
            $this->error("请先登录！","/M/Pub/login");
        }
    }

    public function index()
    {
        $link = array("Verify","MoneyDetail","Money");
        $minfo = $this->member->getMemberInfo($this->uid,$link,"id,pin_pass,integral,credits");
        //实名认证验证
        if($minfo['id_status']==0)$this->error("您还没有实名认证，请先进行实名认证!","/M/User/idcard");
        //支付密码设置验证
        if($minfo['pin_pass']=="")$this->error("您还没有设置支付密码，请先设置支付密码!","/M/User/setpaypass");

        $msg_num = M('inner_msg')->where("uid = {$this->uid} and status = 0")->count();
        $this->assign('msg_num',$msg_num);

        $this->assign("minfo",$minfo);
        $this->display();
    }

    /**
     * 个人资料
     */
    public function info()
    {
        $minfo =$this->member->getMemberInfo($this->uid,"Money","*");
        $this->assign("kflist",get_admin_name());


        $this->assign("minfo",$minfo);
        $this->display();
    }

    /**
     * 资金信息
     */
    public function fund()
    {
        $mm = new MemberMoneyModel();
        $mfield = $mm->getDetailField();
        $map['mm.uid'] = $this->uid;
        $join[] = "__MEMBER_MONEY_DETAIL__ md on md.uid = mm.uid";
        $searchx = array();
        $searchx['map'] = $map;
        $searchx['limit'] = 1;
        $detail_info = $mm->getList($mfield,$searchx,$join);
        $transferD = new TransferDetailModel();
        $transferdflx = $transferD->where("borrow_uid = {$this->uid} and repayment_time = 0")->sum("interest");
        $detail_info['dflx'] +=$transferdflx;
        $this->assign("minfo",$detail_info);
        $this->display();
    }

    /**
     * 我要提现
     */
    public function cash()
    {
        if($this->isAjax()){
            $money = $this->_post('money');
            $paypass = $this->_post('paypass');
            $res = $this->member->checkPinPass($this->uid,$paypass);
            if(!$res){
                ajaxmsg('支付密码错误',0);
            }
            $w = new WithdrawModel();
            $result = $this->withdraw->checkWithdraw($this->uid,$money);
            if($result['status']){
                $rx = $w->doWithdraw($this->uid,$money);
                ajaxmsg($rx['msg'],$rx['status']);
            }else{
                ajaxmsg($result['msg'],$result['status']);
            }
        }else{
            $link = array("Money","Bank","MemberInfo");
            $vo = $this->member->getMemberInfo($this->uid,$link,"id,user_name,user_phone");
            if(empty($vo['bank_num'])){
                $this->error("请先绑定银行卡后再申请提现！","/M/User/bank");
            }
            $vo['all_money'] = $vo['account_money']+$vo['back_money'];
            $netMoney = $this->borrow->getNetMoney($this->uid);
            $vo['all_money'] -= $netMoney;
            $vo['bank_num'] = decode_ts($vo['bank_num'],getcode());
            $borrowconfig = FS("Dynamic/borrowconfig");
            $bank=$borrowconfig['BANK_NAME'];
            $vo['bank_name']=$bank[$vo['bank_name']];
            $this->assign( "vo",$vo);
            $this->display();
        }
    }
    /**
     * 用户优计划列表
     */
    public function invest()
    {
        $uid = $this->uid;
        $tranIn = new TransferInvestorModel();
        $menoyD = new MemberMoneyDetailModel();
        $map['t.investor_uid'] = $uid;
        $where['map'] = $map;
        $where['limit'] = 15;
        $field = "t.*,m.user_name,b.borrow_name";
        $join[] = "__MEMBERS__ m on m.id = t.borrow_uid";
        $join[] = "__TRANSFER_BORROW_INFO__ b on b.id = t.borrow_id";
        $list = $tranIn->getList($field,$where,$join);
        $this->assign("list",$list);
        $this->assign("count",$menoyD->getFieldByUid($uid,'transfer_num'));
        $this->assign("count_money",$menoyD->getFieldByUid($uid,'transfer_capital'));
        $this->display();
    }

    /*
     *散标投资列表
     */
    public function invest_san()
    {
        $map_y=array();
        $map_y['investor_uid'] = $this->uid;
        $map_y['status'] = 1;
        $inf = $this->borrowInvestor
            ->field("sum(investor_capital) as investor_capital,count(*) as count")
            ->where($map_y)->find();
        $this->assign("count",$inf['count']);
        $this->assign("total_money",$inf['investor_capital']);
        $map_ww=array();
        $field = "bi.id,bi.receive_capital,bi.receive_interest,
            b.total,b.has_pay,b.borrow_money,bi.borrow_id,b.borrow_name,
            b.borrow_status,bi.add_time,b.borrow_interest_rate,
            b.borrow_duration,bi.investor_capital,bi.investor_interest,
            bi.add_time as adds_time,bi.deadline,bi.debt_status";
        $map_ww['bi.investor_uid']=$this->uid;
        $map_ww['b.borrow_status']=array("in","2,4,6,7");
        $where['map'] = $map_ww;
        $where['limit'] = 6;
        $where['order'] = "b.borrow_status asc";
        $join[] = "__BORROW_INFO__ b on b.id = bi.borrow_id";
        $list = $this->borrowInvestor->getList($field,$where,$join);
        foreach($list as $key=>$v){
            $next = $v['has_pay'] + 1;
            if($next <= $v['total']){
                $deadline = M("investor_detail")
                    ->where("invest_id = {$v['id']} and sort_order = {$next}")
                    ->getField("deadline");
                $breakday = getExpiredDays($deadline);
                if($breakday){
                    $list[$key]['breakday'] = $breakday;
                    $list[$key]['borrow_status'] = 8;
                }
            }
        }

        $this->assign("list",$list);

        $this->display();
    }

    public function invest_debt()
    {
        $map['bi.debt_uid'] = $this->uid;
        $map['bi.debt_status'] = 2;
        $where['map'] = $map;
        $where['limit'] = 6;
        $where['order'] = "id.status asc,bi.id desc";
        $field = "id.buy_time,id.serialid,id.transfer_price,(id.capital+id.interest) as total_money,
        b.total,b.borrow_name,bi.borrow_id,id.status,bi.id";
        $join[] = "__INVEST_DEBT__ id on id.invest_id = bi.id";
        $join[] = "__BORROW_INFO__ b on b.id = bi.borrow_id";
        $list = $this->borrowInvestor->getList($field,$where,$join);
        foreach($list['list'] as $k => $v){
            $list['list'][$k]['has_pay'] = M("investor_detail")->where("invest_id = {$v['id']} and (repayment_time > 0 or substitute_time > 0)")->count();
            $list['list'][$k]['receive_money'] = M("investor_detail")->where("invest_id = {$v['id']} and repayment_time = 0 and substitute_time = 0")->sum("capital+interest");
        }
        $this->assign("list",$list);
        $this->display();
    }

    public function loan()
    {
        $map=array();
        $map['borrow_uid']=$this->uid;
        $field="*";
        $where['map'] = $map;
        $where['limit'] = 6;
        $borrowlist_san=$this->borrow->getList($field,$where);
        $glodata = get_global_setting();
        $expired = explode("|",$glodata['fee_expired']);
        $call_fee = explode("|",$glodata['fee_call']);
        foreach($borrowlist_san['list'] as $key=>$v){
            $borrowlist_san['list'][$key]['progress'] = getFloatValue($v['has_borrow']/$v['borrow_money']*100,2);
            $res_map=array();
            $res_map["borrow_id"]=$v['id'];
            $res_map["borrow_uid"]=$this->uid;
            $res_map['repayment_time'] = 0;
            $res_map['status'] = array('in','4,7');
            $field = "sum(capital) as capital,sum(interest) as interest";
            $investor_list=M('investor_detail')
                ->field($field)
                ->where($res_map)->find();

            $res_map['deadline'] = array("lt",time());
            $dealine = M('investor_detail')
                ->field("sum(capital) as capital,sum(interest) as interest,deadline")
                ->where($res_map)
                ->group("sort_order")
                ->order("deadline asc")
                ->select();

            $sodeadline = M("investor_detail")->field("deadline")->where("(status = 7 or status = 4) and borrow_id = {$v['id']}")->order("deadline asc")->find();
            $borrowlist_san['list'][$key]['breakday'] = getExpiredDays($dealine[0]['deadline']);
            $borrowlist_san['list'][$key]['capital']=$investor_list['capital'];
            $borrowlist_san['list'][$key]['interest_sum']=$investor_list['interest'];
            $borrowlist_san['list'][$key]['deadline'] = $sodeadline['deadline'];
            $expired_money = 0;
            $call_money = 0;
            foreach($dealine as $k => $val){
                $xbreakday = getExpiredDays($val['deadline']);
                if($xbreakday>$expired[0]){
                    $expired_money += getExpiredMoney($xbreakday,$val['capital'],$val['interest']);
                }
                if($xbreakday>$call_fee[0]){
                    $call_money += getExpiredCallFee($xbreakday,$val['capital'],$val['interest']);
                }
            }
            $borrowlist_san['list'][$key]['expired_money'] = $expired_money;

            $borrowlist_san['list'][$key]['call_fee'] = $call_money;

            $borrowlist_san['list'][$key]['allneed'] = $expired_money + $call_money + $investor_list['capital'] + $investor_list['interest'];
        }
        $borrow_config = require C("APP_ROOT")."Conf/borrow_config.php";
        $repayment_type = $borrow_config['REPAYMENT_TYPE'];
        $this->assign("repayment_type",$repayment_type);
        $this->assign("borrowlist_san",$borrowlist_san);
        $this->assign("time",time());
        $this->display();
    }
    /**
     * 安全中心
     */
    public function safe()
    {
        $this->assign("memberinfo", M('members')->find($this->uid));
        $this->assign("mstatus", M('members_status')->field(true)->find($this->uid));
        $this->assign("memberdetail", M('member_info')->find($this->uid));
        $paypass = M("members")->field('pin_pass')->where('id='.$this->uid)->find();
        $this->assign('paypass', $paypass['pin_pass']);
        $this->display();
    }
    /**
     * 设置支付密码
     */
    public function setPayPass()
    {
        if($this->isAjax()){
            $password = $this->_post('password');
            $paypass = $this->_post('paypass');
            $paypass2 = $this->_post('paypass2');
            if(!$password || !$paypass || !$paypass2){
                ajaxmsg("数据不完整",0);
            }
            $paypass == $password && ajaxmsg("不能和登录密码相同",0);
            $paypass != $paypass2 && ajaxmsg("两次支付密码不一致",0);
            $user_pass = $this->member->getFieldById($this->uid,'user_pass');
            if($user_pass!=md5($password)){
                ajaxmsg("登录密码不正确",0);
            }
            $res = $this->member->setPinPass($this->uid,$paypass);
            ajaxmsg($res['msg'],$res['status']);

        }else{
            $this->display();
        }
    }
    /**
     * 修改支付密码
     *
     */
    public function editpaypass()
    {
        if($this->isAjax()){
            $uid = $this->uid;
            if(!$uid){
                ajaxmsg("尚未登录",2);
            }
            $oldpass = $this->_post('oldpass');
            $paypass = $this->_post('paypass');
            $paypass2 = $this->_post('paypass2');
            if(!$oldpass || !$paypass || !$paypass2){
                ajaxmsg("数据不完整",0);
            }
            $paypass == $oldpass && ajaxmsg("新密码不能和旧密码相同",0);
            $paypass != $paypass2 && ajaxmsg("两次支付密码不一致",0);
            $pin_pass = $this->member->getFieldById($uid,"pin_pass");
            if($pin_pass!=md5($oldpass)){
                ajaxmsg("旧支付密码不正确",0);
            }
            $res = $this->member->setPinPass($uid,$paypass);
            ajaxmsg($res['msg'],$res['status']);
        }else{
            $this->display();
        }
    }

    /**
     * 修改登录密码
     *
     */
    public function editpass()
    {
        if($this->isAjax()){
            $uid = $this->uid;
            if(!$uid){
                ajaxmsg("尚未登录",2);
            }
            $oldpass = $this->_post('oldpass');
            $password = $this->_post('password');
            $password2 = $this->_post('password2');
            if(!$oldpass || !$password || !$password2){
                ajaxmsg("数据不完整",0);
            }
            $password != $password2 && ajaxmsg("两次密码不一致",0);

            $res = $this->member->updateUserPassByOld($uid,$password,$oldpass);
            ajaxmsg($res['msg'],$res['status']);

        }else{
            $this->display();
        }
    }

    /**
     * 资金记录
     */
    public function  records()
    {
        $logtype = C('MONEY_LOG');
        $this->assign('log_type',$logtype);

        $map['uid'] = $this->uid;
        $where['map'] = $map;
        $where['limit'] = 'all';
        $list = $this->moneylog->getList("*",$where);
        $this->assign("list",$list);
        $this->display();
    }

    /**
     * 资金记录详情
     * 赵银剑 2017-4-8
     */
    public function  records_details()
    {
        $list = $this->moneylog->find($_GET['id']);
        $logtype = C('MONEY_LOG');
        $this->assign('log_type',$logtype);
        $this->assign("list",$list);
        $this->display();
    }

    public function msg()
    {
        $field = "*";
        $map['uid'] = $this->uid;
        $where['map'] = $map;
        $where['limit'] = '15';

        $list = $this->inner->getList($field,$where);

        $this->assign("list",$list);
        $this->display();

    }
    public function msg_content()
    {
        $id = $this->_get('id');
        $map['id'] = $id;
        $list = $this->inner->where($map)->find();
        $map['status'] = 0;
        $this->inner->where($map)->setInc('status');
        $this->assign("list",$list);
        $this->display();
    }

    public function add(){

        require_once(C("APP_ROOT")."Lib/Sdk/Baofoo.class.php");
        $minfo = M("member_info")->field("idcard,real_name")->where("uid = {$this->uid}")->find();
        $baofoo = new Baofoo();
        $param = array(
            'id_card' => $minfo['idcard'],
            'id_holder' => $minfo['real_name'],
            'acc_no' => $_POST['acc_no'],
            'mobile' => $_POST['mobile'],
            'card_type' => 101,
            'PayCodeA' => $_POST['pay_code'],
        );
        $result = $baofoo->checkBank($param);
        if($result === false){
//                ajaxmsg('持卡人身份信息填写错误,验证失败',0);
            $this->error("持卡人身份信息填写错误,验证失败");
        }
        else {
            $data['uid'] = $this->uid;
            $data['acc_no'] = $_POST['acc_no'];
            $data['id_card'] = $minfo['idcard'];
            $data['id_holder'] = $minfo['real_name'];
            $data['pay_code'] = $_POST['pay_code'];
            $data['add_time'] = time();
            $data['mobile'] = $_POST['mobile'];
            $re = M("wap_bank")->add($data);
            $this->success("绑定成功");

        }
    }
    public function editbank(){
        $count = M("wap_bank")->where("uid = {$this->uid}")->count();
        if($count==0){
            $this->error("无法修改","/m/user");
        }
        $minfo = M("member_info")->field("idcard,real_name")->where("uid = {$this->uid}")->find();
        $bank = M("wap_bank")->where("uid = {$this->uid}")->find();
        $bankinfo = FS("Dynamic/wapbaofubank");

        $this->assign("bankinfo",$bankinfo);
        $this->assign("bank",$bank);
        $this->assign("minfo",$minfo);
        $this->display();
    }
    public function doeditbank(){
        $data['acc_no'] = $_POST['acc_no'];
        $data['pay_code'] = $_POST['pay_code'];
        $data['add_time'] = time();
        $data['mobile'] = $_POST['mobile'];
        $re = M("wap_bank")->where("uid = {$this->uid}")->save($data);
        if($re){
            $this->success("修改成功","/m/user/charge");
        }else{
            $this->error("修改失败","m/user/editbank");
        }
    }
    public function charge(){
        $count = M("wap_bank")->where("uid = {$this->uid}")->count();
        $wapbank = M("wap_bank")->where("uid = {$this->uid}")->find();
        $mstatus = M("members_status")->field("id_status")->where("uid = {$this->uid}")->find();
        if($mstatus['id_status'] !=1){
            $this->error("尚未完成实名认证");
        }
        $minfo = M("member_info")->field("idcard,real_name")->where("uid = {$this->uid}")->find();
        $minfo['idcard'] = hidecard($minfo['idcard'],1);
        $wapbank['pay_card'] = $wapbank['acc_no'];
        $wapbank['acc_no'] = hidecard($wapbank['acc_no'],1);

        $bankinfo = FS("Dynamic/wapbaofubank");
        $bank_config = FS("Dynamic/wapbaofubank_config");
        $this->assign("wapbank",$wapbank);
        $this->assign("count",$count);
        $this->assign("bankinfo",$bankinfo);
        $this->assign("bank_config",$bank_config);
        $this->assign("minfo",$minfo);
        $this->display();
    }
    //在线支付
    public function pay() {
        $map['uid'] = $this->uid;
        $account_money = M('member_money')->field('(account_money+back_money) account_money')->where($map)->find();
        $this->assign("account_money",$account_money['account_money']);
        $this->display();
    }

    public function baofuwappay(){
        if($_POST["pay_type"]==2){
            $this->kuaiqianpay();
            exit;
        }
        $payconfig = FS("Dynamic/wappayconfig");
        $baofu_config = $payconfig['baofuwap'];
        $path = C("APP_ROOT")."Lib/Pay/baofuwap/";
        $order = date("YmdHis").rand(10000,99999);
        $bank = M("wap_bank")->where("uid={$this->uid}")->find();
        $data_content["txn_sub_type"] = "01";
        $data_content["biz_type"] = "0000";
        $data_content["terminal_id"] = $baofu_config["TerminalID"];
        $data_content["member_id"] = $baofu_config["MemberID"];
        $data_content["pay_code"] = $bank['pay_code'];
        $data_content["acc_no"] = $bank['acc_no'];
        $data_content['id_card_type'] = "01";
        $data_content['id_card'] = $bank['id_card'];
        $data_content['id_holder'] = $bank['id_holder'];
        $data_content['mobile'] = $bank['mobile']==""?"":$bank['mobile'];
        $data_content['trans_id'] = $order;
        $data_content['txn_amt'] = $_POST['money']*100;//单位分
        $data_content['trade_date'] = Date("YmdHis",time());
        $data_content['commodity_name'] = "充值";
        $data_content['commodity_amount'] = "1";
//            $data_content['user_name'] = $bank['user_name'];
        $data_content['page_url'] = "http://".$_SERVER['HTTP_HOST']."/m/user";
        $data_content['return_url'] = "http://".$_SERVER['HTTP_HOST']."/m/user/paynotice";
        $data_content['additional_info'] = "";
        $json_data = trim(json_encode($data_content));

        $data['version'] = "4.0.0.0";
        $data['input_charset'] = 1;
        $data['language'] = 1;
        $data['terminal_id'] =$baofu_config["TerminalID"];
        $data['txn_type'] = "03311";
        $data['txn_sub_type'] = "01";
        $data["member_id"] = $baofu_config["MemberID"];
        $data['data_type'] = "json";
        require_once(C("APP_ROOT")."Lib/Pay/baofuwap/BaofooSdk.php");
        $baofooSdk = new BaofooSdk($baofu_config["MemberID"], $baofu_config["TerminalID"],"json",$path.'bfkey_100000178@@100000916.pfx',$path.'baofoo_pub.cer',$baofu_config["pkey"]);
        $encode =mb_detect_encoding($json_data, "UTF-8,GB2312,GBK");
        if (trim($encode) == "GBK" or trim($encode) == "GB2312")
        {
            $string = iconv($encode,"UTF-8",$json_data);
        }
        else
        {
            $string = $json_data;
        }
        $data["data_content"] = $baofooSdk->encryptedByPrivateKey($string);
        $data['back_url'] = "http://".$_SERVER['HTTP_HOST']."/m/user";
        $paydetail['uid'] = $this->uid;
        $paydetail['nid'] = "baofuwap".$order;
        $paydetail['money'] = $_POST['money'];
        $paydetail['status'] = 0;
        $paydetail['tran_id'] = $order;
        $paydetail['way'] = "baofuwap";
        $paydetail['add_time']=time();
        $paydetail['add_ip'] = get_client_ip();

        M( "member_payonline" )->add($paydetail);


        $this->submit($data,"https://tgw.baofoo.com/apipay/wap");

    }
    public function paynotice(){
        $payconfig = FS("Dynamic/wappayconfig");
        $baofu_config = $payconfig['baofuwap'];
        $path = C("APP_ROOT")."Lib/Pay/baofuwap/";
        $data_content = $_POST['data_content'];
        require_once(C("APP_ROOT")."Lib/Pay/baofuwap/BaofooSdk.php");
        ob_start();
        $baofooSdk = new BaofooSdk($baofu_config["MemberID"], $baofu_config["TerminalID"],"json",$path.'bfkey_100000178@@100000916.pfx',$path.'baofoo_pub.cer',$baofu_config["pkey"]);
        $endata_content = $baofooSdk->decryptByPublicKey($data_content);
        $data = json_decode($endata_content);
        if($data->resp_code=="0000"){
            $money = $data->succ_amt;
            $trans_id = $data->trans_id;
            $res = M("member_payonline")->where("tran_id = '{$trans_id}'")->save(array("status"=>1));
            $uid = M("member_payonline")->where("tran_id = '{$trans_id}'")->find();
            $rem = memberMoneyLog($uid['uid'],3,$money,"充值订单号:".$trans_id,0,'@网站管理员@');
            $vx = M("members")->field("user_phone,user_name")->find($uid['uid']);
            M("wap_bank")->where("uid={$uid['uid']}")->save(array("is_charge"=>1));
            SMStip("payonline",$vx['user_phone'],array("#USERANEM#","#DATE#","#MONEY#"),array($vx['user_name'],date('Y-m-d H:i:s'),$money));
            echo "OK";
        }
        ob_end_clean();

    }
    private function submit($data,$submitUrl){
        $inputstr = "";
        foreach($data as $key=>$v){
            $inputstr .= '
		<input type="hidden"  id="'.$key.'" name="'.$key.'" value="'.$v.'"/>
		';
        }

        $form = '
		<form action="'.$submitUrl.'" name="pay" id="pay" method="POST">
';
        $form.=	$inputstr;
        $form.=	'
</form>
		';

        $html = '
		<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
		<html xmlns="http://www.w3.org/1999/xhtml">
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>支付跳转中.....</title>
        </head>
<body>

        ';
        $html.=	$form;
        $html.=	'
        <script type="text/javascript">
			document.getElementById("pay").submit();
		</script>
        ';
        $html.= '
        </body>
</html>
		';

        Mheader('utf-8');
        echo $html;
        exit;
    }


    /**
     * 快钱支付
     */
    public function kuaiqianpay(){
        $members = M('members')->where(array(id=>$this->uid))->find();
        $member_info = M('member_info')->where(array(uid=>$this->uid))->find();
        $member_banks = M('member_banks')->where(array(uid=>$this->uid))->find();
        require_once(C("APP_ROOT")."Lib/Pay/kuaiqianpay/pci_query.php");
        require_once(C("APP_ROOT")."Lib/Pay/kuaiqianpay/DynNum.php");
        require_once(C("APP_ROOT")."Lib/Pay/kuaiqianpay/pur.php");
        $payconfig = FS("Dynamic/wappayconfig");
        $kuaiqian_config = $payconfig['kuaiqian'];
        $merchantId = $kuaiqian_config["merchantId"];
        $certPassword = $kuaiqian_config["pkey"];
        $customerId = $this->uid;
        $amount = $_POST["money"];
        $externalRefNumber = date("YmdHis").rand(10000,99999);
        $phone = $members["user_phone"];
        $pan = decode_ts($member_banks["bank_num"],getcode());
        $cardHolderName = $member_info["real_name"];
        $cardHolderId = $member_info["idcard"];
        $bankId = $_POST["pay_code"];
        $query_xml = kuaiqian_query($merchantId,$certPassword,$customerId,$storablePan);
        $query_code = $this->getNodeVal("responseCode",$query_xml);
        if($query_code=="00"){
            $dynNum_xml = kuaiqian_dynNum($merchantId,$certPassword,$customerId,$phone,$amount,$pan,$cardHolderName,$cardHolderId,$externalRefNumber,$bankId);
            $dynNum_xml = str_replace('<MasMessage xmlns="http://www.99bill.com/mas_cnp_merchant_interface">',"",$dynNum_xml);
            $dynNum_xml = str_replace('</MasMessage>','',$dynNum_xml);
            $data = array();
            $data["merchantId"] = $this->getNodeVal("merchantId",$dynNum_xml);
            $data["certPassword"] = $certPassword;
            $data["customerId"] = $this->getNodeVal("customerId",$dynNum_xml);
            $data["cardNo"] = $pan;//$this->getNodeVal("cardno",$dynNum_xml);
            $data["externalRefNumber"] = $externalRefNumber;
            $data["token"] = $this->getNodeVal("token",$dynNum_xml);
            $data["bankId"] = $bankId;
        }else{
            echo '<script type="text/javascript:;">document.write("操作失败！");setTimeout(function(){window.location.href="/m";},2000);</script>';
        }
        $str = '<form name="frm" action="/M/user/kuaiqianpay2" method="post">';
        foreach($data as $key=>$value){
            $str .= '<input name="'.$key.'" type="hidden" value="'.$value.'"/><br/>';
        }
        $str .= '充值金额:<input name="amount" type="text" value="'.$amount.'"/><br/>';
        $str .= '手机号码:<input name="validCode" type="text" value="'.$phone.'"/><br/>';
        $str .= '手机验证码:<input name="phone" type="text" value=""/><br/>';
        $str .= '<input type="submit" value="充值"/>';
        $str .= '</form>';
        echo $str;
    }

    function kuaiqianpay2(){
        require_once(C("APP_ROOT")."Lib/Pay/kuaiqianpay/pci_query.php");
        require_once(C("APP_ROOT")."Lib/Pay/kuaiqianpay/DynNum.php");
        require_once(C("APP_ROOT")."Lib/Pay/kuaiqianpay/pur.php");
        $paydetail['uid'] = $this->uid;
        $paydetail['nid'] = "kuaiqianpay".$_POST["externalRefNumber"];
        $paydetail['money'] = $_POST["amount"];
        $paydetail['status'] = 0;
        $paydetail['tran_id'] = $_POST["externalRefNumber"];
        $paydetail['way'] = "kuaiqian";
        $paydetail['add_time']=time();
        $paydetail['add_ip'] = get_client_ip();
        M( "member_payonline" )->add($paydetail);
        $pur_xml = kuaiqian_pur($_POST["merchantId"],$_POST["certPassword"],$_POST["customerId"],$_POST["externalRefNumber"],$_POST["cardNo"],$_POST["amount"],$_POST["phone"],$_POST["validCode"],$_POST["token"]);
        if($this->getNodeVal("responseCode",$pur_xml)=="00"){
            $res = M("member_payonline")->where("tran_id = '{$_POST["externalRefNumber"]}'")->save(array("status"=>1));
            $uid = M("member_payonline")->where("tran_id = '{$_POST["externalRefNumber"]}'")->find();
            $rem = memberMoneyLog($uid['uid'],3,$_POST["amount"],"充值订单号:".$_POST["externalRefNumber"],0,'@网站管理员@');
            $vx = M("members")->field("user_phone,user_name")->find($uid['uid']);
            M("wap_bank")->where("uid={$uid['uid']}")->save(array("is_charge"=>1));
            SMStip("payonline",$vx['user_phone'],array("#USERANEM#","#DATE#","#MONEY#"),array($vx['user_name'],date('Y-m-d H:i:s'),$_POST["amount"]));
            echo '恭喜，充值成功！<a href="/m">返回</a>';
        }else{
            echo '充值失败！<script type="text/javascript:;">setTimeout(function(){window.location.href="/m";},2000););</script>';
        }
    }

    function getNodeVal($node,$xml){
        $preg = "/\<{$node}\>(.*)\<\/{$node}\>/";
        preg_match($preg,$xml,$matches);
        return $matches[1];
    }

    //实名认证
    public function idcard() {

        $ids = M('members_status')->getFieldByUid($this->uid, 'id_status');
        if ($ids == 1) {
            $vo = M("member_info")->field('idcard,real_name')->find($this->uid);
            $this->assign("vo", $vo);
        }
        $id5config = FS("Dynamic/id5");

        $this->assign("id_status", $ids);
        $this->assign("id5_status", $id5config['enable']);
        $this->display();
    }
    public function saveid() {
        $res = $this->member->realNameAuth($this->uid,$_POST);
        ajaxmsg($res['msg'], $res['status']);
    }
    //绑定银行卡
    public function bank(){


        $ids = M('members_status')->getFieldByUid($this->uid,'id_status');
        if($ids==1){
            $voinfo = M("member_info")->field('idcard,real_name')->find($this->uid);
            $vobank = M("member_banks")
                ->field(true)->where("uid = {$this->uid} and bank_num !=''")
                ->find();
            $vobank['bank_province'] = M('area')->getFieldByName("{$vobank['bank_province']}",'id');
            $vobank['bank_city'] = M('area')->getFieldByName("{$vobank['bank_city']}",'id');
            $borrowconfig = require C("ROOT_URL") . "Dynamic/borrowconfig.php";
            $bank_name = $borrowconfig['BANK_NAME'];
            $vobank['bank_num'] = decode_ts($vobank['bank_num'],getcode());
            $this->assign("voinfo",$voinfo);
            $this->assign("vobank",$vobank);
            $this->assign("bank_list",$bank_name);
            $this->assign('edit_bank', $this->glo['edit_bank']);
        }else{
            $this->error("您还未完成身份验证，请先进行实名认证！","/M/User/idcard");
        }
        $this->display();
    }
    public function getarea(){
        $rid = intval($_GET['rid']);
        if(empty($rid)) return;
        $map['reid'] = $rid;
        $alist = M('area')->field('id,name')->order('sort_order DESC')->where($map)->select();
        if(count($alist)===0){
            $str="<option value=''>--该地区下无下级地区--</option>\r\n";
        }else{
            foreach($alist as $v){
                $str.="<option value='{$v['id']}'>{$v['name']}</option>\r\n";
            }
        }
        $data['option'] = $str;
        $res = json_encode($data);
        echo $res;
    }
    public function bindbank(){

        $bank_info = M('member_banks')->field("uid, bank_num")->where("uid=".$this->uid)->find();

        !$bank_info['uid'] && $data['uid'] = $this->uid;
        $data['bank_num'] = encode_ts(text($_POST['account']),getcode());
        $data['bank_name'] = text($_POST['bankname']);
        $data['bank_address'] = text($_POST['bankaddress']);
        $data['bank_province'] = text($_POST['province']);
        $data['bank_city'] = text($_POST['cityName']);
        $data['add_ip'] = get_client_ip();
        $data['add_time'] = time();
        if($bank_info['uid']){
            $s = $this->sl->checkPhoneCode($_POST['phone_code'],$this->member->getFieldById($this->uid,"user_phone"));
            if($s) {
                ajaxmsg('手机验证码错误', 0);
            }
        }
        if($bank_info['uid']){
            /////////////////////新增银行卡修改锁定开关 开始 20130510 fans///////////////////////////
            if(intval($this->glo['edit_bank'])!= 1 && $bank_info['bank_num']){
                ajaxmsg("为了您的账户资金安全，银行卡已锁定，如需修改，请联系客服", 0 );
            }
            /////////////////////新增银行卡修改锁定开关 结束 20130510 fans///////////////////////////
            if($bank_info['bank_num']!=0){
                if(session('code_temp')<>$_POST['phone_code'] || $_POST['phone_code']==""){
                    ajaxmsg("手机验证码输入错误！", 0 );
                }
            }
            $old = text($_POST['oldaccount']);
            if($bank_info['bank_num'] && $old <> decode_ts($bank_info['bank_num'],getcode())) ajaxmsg('原银卡号不对',0);
            $newid = M('member_banks')->where("uid=".$this->uid)->save($data);
        }else{
            $newid = M('member_banks')->add($data);
        }
        if($newid){
            MTip('chk2',$this->uid);
            ajaxmsg();
        }
        else ajaxmsg('操作失败，请重试',0);
    }
    public function sendphone() {

        $phone = $this->member->getFieldById($this->uid,"user_phone");
        $res = $this->sl->sendSms($phone,'verify_phone');
        if ($res) {
            session("temp_phone", $phone);
            ajaxmsg('',1);
        } else{
            ajaxmsg('发送失败', 0);
        }
    }
    //手机认证
    public function cellphone(){
        $isid = M('members_status')->getFieldByUid($this->uid,'phone_status');
        $phone = M('members')->getFieldById($this->uid,'user_phone');
        $this->assign("phone",$phone);
        $this->assign("phone_status",$isid);
        $this->display();
    }
    public function validatephone(){
        $phonestatus = M('members_status')->getFieldByUid($this->uid,'phone_status');
        if($phonestatus==1) ajaxmsg("手机已经通过验证",1);
        if( is_verify($this->uid,text($_POST['code']),2,10*60) ){
            $updata['phone_status'] = 1;
            if(!session("temp_phone")) ajaxmsg("验证失败",0);

            $updata1['user_phone'] = session("temp_phone");
            $a = M('members')->where("id = {$this->uid}")->count('id');
            if($a==1) $newid = M("members")->where("id={$this->uid}")->save($updata1);
            else{
                M('members')->where("id={$this->uid}")->setField('user_phone',session("temp_phone"));
            }

            $updata2['cell_phone'] = session("temp_phone");
            $b = M('member_info')->where("uid = {$this->uid}")->count('uid');
            if($b==1) $newid = M("member_info")->where("uid={$this->uid}")->save($updata2);
            else{
                $updata2['uid'] = $this->uid;
                $updata2['cell_phone'] = session("temp_phone");
                M('member_info')->add($updata2);
            }
            $c = M('members_status')->where("uid = {$this->uid}")->count('uid');
            if($c==1) $newid = M("members_status")->where("uid={$this->uid}")->save($updata);
            else{
                $updata['uid'] = $this->uid;
                $newid = M('members_status')->add($updata);
            }
            if($newid){
                $newid = setMemberStatus($this->uid, 'phone', 1, 10, '手机');
                ajaxmsg();

            }
            else  ajaxmsg("验证失败",0);
        }else{
            ajaxmsg("验证校验码不对，请重新输入！",2);
        }
    }

}
?>
