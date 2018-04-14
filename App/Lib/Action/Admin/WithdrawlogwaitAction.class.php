<?php

// 全局设置
class WithdrawlogwaitAction extends ACommonAction
{

    public function __construct()
    {
        parent::__construct();

        $model = new PassesModel();
        $pass = $model->where(array('type' => 'withdrawlogwait'))->getField('pass');
        if (!empty($pass)) {
            if (!session('verifyWithDralogwait')) {
                $this->redirect('verifywithdrawlogwait/verifyPass');
            }
        }
    }


    /**
     * +----------------------------------------------------------
     * 默认操作 待审核提现
     * +----------------------------------------------------------
     */
    public function index()
    {


        $map = array();

        if ($_REQUEST['uname']) {
            $map['m.user_name'] = array("like", urldecode($_REQUEST['uname']) . "%");
            $search['uname'] = urldecode($_REQUEST['uname']);
        }

        if ($_REQUEST['deal_user']) {
            $map['w.deal_user'] = urldecode($_REQUEST['deal_user']);
            $search['deal_user'] = urldecode($_REQUEST['deal_user']);
        }

        if (!empty($_REQUEST['bj']) && !empty($_REQUEST['money'])) {
            $map['w.withdraw_money'] = array($_REQUEST['bj'], $_REQUEST['money']);
            $search['bj'] = $_REQUEST['bj'];
            $search['money'] = $_REQUEST['money'];
        }

        if (!empty($_REQUEST['start_time']) && !empty($_REQUEST['end_time'])) {
            $timespan = strtotime(urldecode($_REQUEST['start_time'])) . "," . strtotime(urldecode($_REQUEST['end_time']));
            $map['w.add_time'] = array("between", $timespan);
            $search['start_time'] = urldecode($_REQUEST['start_time']);
            $search['end_time'] = urldecode($_REQUEST['end_time']);
        } elseif (!empty($_REQUEST['start_time'])) {
            $xtime = strtotime(urldecode($_REQUEST['end_time']));
            $map['w.add_time'] = array("gt", $xtime);
            $search['start_time'] = $xtime;
        } elseif (!empty($_REQUEST['end_time'])) {
            $xtime = strtotime(urldecode($_REQUEST['end_time']));
            $map['w.add_time'] = array("lt", $xtime);
            $search['end_time'] = $xtime;
        }
        $map['w.withdraw_status'] = 0;
        $w = new WithdrawModel();
        $field = "w.*,m.user_name,mi.real_name";
        $join[] = "__MEMBERS__ m ON w.uid=m.id";
        $join[] = "__MEMBER_INFO__ mi ON w.uid=mi.uid";
        $where['map'] = $map;
        $where['limit'] = C('ADMIN_PAGE_SIZE');

        $list = $w->getList($field, $where, $join);
        foreach ($list['list'] as $k => $v) {
            $list['list'][$k]['bankNo'] = decode_ts($v['withdraw_bankNo'], getcode());
        }
        $listType = C('WITHDRAW_STATUS');
        unset($listType[1], $listType[2], $listType[3]);
        $this->assign("bj", array("gt" => '大于', "eq" => '等于', "lt" => '小于'));
        $this->assign("list", $list['list']);
        $this->assign("status", $listType);
        $this->assign("pagebar", $list['page']);
        $this->assign("search", $search);
//        $this->assign("query", http_build_query($search));   //导出用

        $this->display();
    }

    //编辑
    public function edit()
    {
        $id = intval($_REQUEST['id']);
        $w = new WithdrawModel();
        $winfo = $w->find($id);
        $uid = $winfo['uid'];
        $m = new MembersModel();
        $link = array('MemberInfo', 'Bank');
        $vo = $m->getMemberInfo($uid, $link, 'id,user_name');
        $vo['bank_num'] = decode_ts($vo['bank_num'], getcode());
        $vo['id'] = $winfo['id'];
        $vo['second_fee'] = $winfo['withdraw_fee'];
        $vo['withdraw_money'] = $winfo['withdraw_money'];
        $vo['add_time'] = $winfo['add_time'];
        $vo['withdraw_status'] = $winfo['withdraw_status'];
        $vo['deal_info'] = $winfo['deal_info'];
        $listType = C('WITHDRAW_STATUS');
        unset($listType[0], $listType[2]);
        $this->assign('type_list', $listType);
        //////////////////////////////////////
        $bank = FS("Dynamic/borrowconfig");
        $area = get_Area_list();
        $this->assign("bank", $bank['BANK_NAME']);
        $this->assign("area", $area);
        $this->assign('vo', $vo);
        $this->display();
    }

    public function checkip()
    {

        $uid = intval($_REQUEST['uid']);
        $m = new MembersModel();
        $limit = C('ADMIN_PAGE_SIZE');
        $list = $m->getMemberLogin($uid, 'ml.*', $limit);

        $this->assign('ajaxpage', $list['page']);
        $this->assign('data', $list['list']);
        $this->display();
    }

    public function doEdit()
    {

        $w = new WithdrawModel();
        $res = $w->doEditWithdraw($_POST, session('adminname'));
        if ($res['status']) { //保存成功
            alogs("withdraw", $_POST['id'], 1, '成功执行了提现处理操作！备注:' . $_POST['deal_info']);//管理员操作日志
            //成功提示
            $this->assign('jumpUrl', __URL__);
            $this->success($res['msg']);
        } else {
            alogs("withdraw", $_POST['id'], 0, '提现处理操作失败！');//管理员操作日志
            //$this->assign("waitSecond",10000);
            //失败提示
            $this->error($res['msg']);
        }

    }

    public function duizhang()
    {
        $id = $_REQUEST["id"];
        $vo = M("member_withdraw")->find($id);
        $ordersn = $vo["reqNo"];
        $SUBMIT_TIME = date("YmdHis", time());
        $id_no = sprintf("%06d", $id);
        $allinpayconfig = FS("Dynamic/allinpay");
        $order = trim($allinpayconfig['allinpay']['MERCHANT_ID']) . $SUBMIT_TIME . $id_no;

        $params = array('INFO' => array('TRX_CODE' => '200004', 'VERSION' => '03', 'DATA_TYPE' => '2',
            'REQ_SN' => $order, 'USER_NAME' => trim($allinpayconfig['allinpay']['USER_NAME']),
            'USER_PASS' => trim($allinpayconfig['allinpay']['USER_PASS']),),
            'QTRANSREQ' => array('MERCHANT_ID' => trim($allinpayconfig['allinpay']['MERCHANT_ID']),
                'QUERY_SN' => $ordersn, 'STATUS' => 2, 'TYPE' => 1),);
        require_once(C("APP_ROOT") . "Lib/Pay/allinpay/libs/ArrayXml.class.php");
        require_once(C("APP_ROOT") . "Lib/Pay/allinpay/libs/cURL.class.php");
        require_once(C("APP_ROOT") . "Lib/Pay/allinpay/libs/PhpTools.class.php");
        header('Content-Type: text/html; Charset=UTF-8');
        $tools = new PhpTools();
        $result = $tools->send($params);
        $info = array();

        $info["uname"] = M("members")->getFieldById($vo["uid"], "user_name");
        $info["order"] = $result["AIPG"]["QTRANSRSP"]["QTDETAIL"]["BATCHID"][0];
        $info["allinpay_code"] = $result["AIPG"]["INFO"]["RET_CODE"][0];
        $info["allinpay_err"] = $result["AIPG"]["INFO"]["ERR_MSG"][0];
        $info["end_code"] = $result["AIPG"]["QTRANSRSP"]["QTDETAIL"]["RET_CODE"][0];
        $info["end_err"] = $result["AIPG"]["QTRANSRSP"]["QTDETAIL"]["ERR_MSG"][0];
        $info["money"] = $result["AIPG"]["QTRANSRSP"]["QTDETAIL"]["AMOUNT"][0] / 100;
        $info["bank_no"] = $result["AIPG"]["QTRANSRSP"]["QTDETAIL"]["ACCOUNT_NO"][0];
        $info["name"] = $result["AIPG"]["QTRANSRSP"]["QTDETAIL"]["ACCOUNT_NAME"][0];
        $info["withdraw_status"] = $vo["withdraw_status"];
        $info["deal_info"] = $vo["deal_info"];
        $info["fee"] = $vo["withdraw_fee"];
        $info["id"] = $vo["id"];
        $listType = C('WITHDRAW_STATUS');
        unset($listType[0], $listType[1]);
        $this->assign('type_list', $listType);
        $this->assign("vo", $info);
        $this->display();
    }

    public function duizhangedit()
    {
        $status = intval($_POST['withdraw_status']);
        $id = intval($_POST['id']);
        $deal_info = $_POST['deal_info'];
        $secondfee = floatval($_POST['fee']);
        $vo = M("member_withdraw")->where("id={$id}")->find();
        if ($vo['withdraw_status'] > 1) {
            $this->error("此提现复审已处理过，请不要重复处理！");
        }
        $mm = new MemberMoneyModel();
        //保存当前数据对象
        $data['withdraw_status'] = $status;
        $data['deal_info'] = $deal_info;
        $data['deal_time'] = time();
        $data['deal_user'] = session('adminname');
        ////////////////////////
        if ($vo['withdraw_status'] <> 3 && $status == 3) {
            $res = $mm->updateMemberMoney($vo['uid'], 24, $vo['withdraw_money'], '提现未通过,返还', 0, $vo['order']);
            addInnerMsg($vo['uid'], "您的提现申请审核未通过", "您的提现申请审核未通过，处理说明：" . $deal_info);
            $data['success_money'] = 0;

        } else if ($vo['withdraw_status'] <> 2 && $status == 2) {
            addInnerMsg($vo['uid'], "您的提现申请已通过", "您的提现申请已通过，正在处理中");
            $res = $mm->updateMemberMoney($vo['uid'], 22, -$vo['withdraw_money'], "提现成功,扣除实际手续费" . $vo['second_fee'] . "元，到账金额" . $vo['success_money'] . "元", 0, $vo['order']);
            addInnerMsg($vo['uid'], "您的提现已完成", "您的提现已完成");
            $data['second_fee'] = $secondfee;
            $data['success_money'] = $vo['withdraw_money'] - $vo['second_fee'];
        }
        //////////////////////////
        $result = D("member_withdraw")->where("id", $id)->save($data);

        if ($result) { //保存成功
            alogs("withdraw", $id, $status, $deal_info);//管理员操作日志
            //成功提示
            $this->assign('jumpUrl', __URL__);
            $this->success(L('修改成功'));
        } else {
            alogs("withdraw", $id, $status, '提现处理操作失败！');//管理员操作日志
            //$this->assign("waitSecond",10000);
            //失败提示
            $this->error(L('修改失败'));
        }

    }
}

?>