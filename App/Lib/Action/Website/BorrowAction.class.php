<?php

// 尚贷内核类库，2014-06-11_listam
class BorrowAction extends HCommonAction
{

    private function isBusiness()
    {
        $uid = $this->uid;
        $is_business = M('members')->where(array('id' => $uid))->getField('is_business');
        return $is_business == 1
            ? true : false;
    }

    public function index()
    {
        $this->display();
    }

    public function post()
    {
        //region 个人
        if (!$this->isBusiness()) {
            $uid = $this->uid;
            $gtype = text($_GET['type']);
            if (!$uid) {
                $this->error("请先登录", "/login?ty=borrow&re={$gtype}");
                exit;
            }
            $m = new MembersModel();
            $link = array("Verify", "MemberInfo");
            $vo = $m->getMemberInfo($uid, $link, "id,user_leve,time_limit,is_borrow,is_vip");


            if ($vo['is_borrow'] == 0) {
                $this->error("您目前不允许发布借款，如需帮助，请与客服人员联系！");
                $this->assign("waitSecond", 3);
            }
            if ($vo['is_vip'] == 0) {
                if ($vo['id_status'] != 1) {
                    $this->error("请进行实名认证后再发标！", "/user/verify?id=1#fragment-4");
                }
                if (!($vo['user_leve'] > 0 && $vo['time_limit'] > time())) {
                    $this->error("请先通过VIP审核再发标", "/user/verify?id=1#fragment-5");
                }
                if ($vo['province'] == 0 && $vo['province_now'] == 0 && $vo['city'] == 0 && $vo['city_now'] == 0) {
                    $this->error("请先填写个人详细资料后再发标", "/user/memberinfo#fragment-1");
                }
            }
            $b = new BorrowModel();
            $bmap['borrow_uid'] = $uid;
            $bmap['borrow_status'] = array('in', array(0, 2, 4));

            $_xoc = $b->where($bmap)->count();
            if ($_xoc > 0 && $vo['is_vip'] == 0) $this->error("您有一个借款中的标，请等待审核", "/user/borrowin#fragment-2");


            $vkey = md5(time() . $gtype);
            switch ($gtype) {
                case "normal"://普通标
                    $borrow_type = 1;
                    break;
                case "vouch"://新担保标
                    $borrow_type = 2;
                    break;
                case "net"://净值标
                    $borrow_type = 4;
                    break;
                case "mortgage"://抵押标
                    $borrow_type = 5;
                    break;
            }


            cookie($vkey, $borrow_type, 3600);
            $borrow_duration_day = explode("|", $this->glo['borrow_duration_day']);
            $day = range($borrow_duration_day[0], $borrow_duration_day[1]);
            $day_time = array();
            foreach ($day as $v) {
                $day_time[$v] = $v . "天";
            }

            $borrow_duration = explode("|", $this->glo['borrow_duration']);
            $month = range($borrow_duration[0], $borrow_duration[1]);
            $month_time = array();
            foreach ($month as $v) {
                $month_time[$v] = $v . "个月";
            }
            $rate_lixt = explode("|", $this->glo['rate_lixi']);
            $borrow_config = require C("APP_ROOT") . "Conf/borrow_config.php";
            $this->assign("borrow_use", $this->gloconf['BORROW_USE']);
            $this->assign("borrow_min", $this->gloconf['BORROW_MIN']);
            $this->assign("borrow_max", $this->gloconf['BORROW_MAX']);
            $this->assign("borrow_time", $this->gloconf['BORROW_TIME']);
            $this->assign("BORROW_TYPE", $borrow_config['BORROW_TYPE']);
            $this->assign("borrow_type", $borrow_type);
            $this->assign("borrow_day_time", $day_time);
            $this->assign("borrow_month_time", $month_time);
            $this->assign("repayment_type", $borrow_config['REPAYMENT_TYPE']);
            $this->assign("vkey", $vkey);
            $this->assign("rate_lixt", $rate_lixt);
        }
        //endregion
        //region 企业
        else {
            $verifyRealBusiness = M('business_apply')->where(array('uid' => $this->uid))->getField('status');
            if (!$verifyRealBusiness)
                $this->error('请先通过企业审核再发标');

            // 个人发标源码
            $uid = $this->uid;
            $gtype = text($_GET['type']);
            if (!$uid) {
                $this->error("请先登录", "/login?ty=borrow&re={$gtype}");
                exit;
            }
            $m = new MembersModel();
            $link = array("Verify", "MemberInfo");
            $vo = $m->getMemberInfo($uid, $link, "id,user_leve,time_limit,is_borrow,is_vip");


            if ($vo['is_borrow'] == 0) {
                $this->error("您目前不允许发布借款，如需帮助，请与客服人员联系！");
                $this->assign("waitSecond", 3);
            }
            if ($vo['is_vip'] == 0) {
                if ($vo['id_status'] != 1) {
                    $this->error("请进行实名认证后再发标！", "/user/verify?id=1#fragment-4");
                }
                if (!($vo['user_leve'] > 0 && $vo['time_limit'] > time())) {
                    $this->error("请先通过VIP审核再发标", "/user/verify?id=1#fragment-5");
                }
                if ($vo['province'] == 0 && $vo['province_now'] == 0 && $vo['city'] == 0 && $vo['city_now'] == 0) {
                    $this->error("请先填写个人详细资料后再发标", "/user/memberinfo#fragment-1");
                }
            }
            $b = new BorrowModel();
            $bmap['borrow_uid'] = $uid;
            $bmap['borrow_status'] = array('in', array(0, 2, 4));

            $_xoc = $b->where($bmap)->count();
            if ($_xoc > 0 && $vo['is_vip'] == 0) $this->error("您有一个借款中的标，请等待审核", "/user/borrowin#fragment-2");


            $vkey = md5(time() . $gtype);
            switch ($gtype) {
                case "normal"://普通标
                    $borrow_type = 1;
                    break;
                case "vouch"://新担保标
                    $borrow_type = 2;
                    break;
                case "net"://净值标
                    $borrow_type = 4;
                    break;
                case "mortgage"://抵押标
                    $borrow_type = 5;
                    break;
            }


            cookie($vkey, $borrow_type, 3600);
            $borrow_duration_day = explode("|", $this->glo['borrow_duration_day']);
            $day = range($borrow_duration_day[0], $borrow_duration_day[1]);
            $day_time = array();
            foreach ($day as $v) {
                $day_time[$v] = $v . "天";
            }

            $borrow_duration = explode("|", $this->glo['borrow_duration']);
            $month = range($borrow_duration[0], $borrow_duration[1]);
            $month_time = array();
            foreach ($month as $v) {
                $month_time[$v] = $v . "个月";
            }
            $rate_lixt = explode("|", $this->glo['rate_lixi']);
            $borrow_config = require C("APP_ROOT") . "Conf/borrow_config.php";
            $this->assign("borrow_use", $this->gloconf['BORROW_USE']);
            $this->assign("borrow_min", $this->gloconf['BORROW_MIN']);
            $this->assign("borrow_max", $this->gloconf['BORROW_MAX']);
            $this->assign("borrow_time", $this->gloconf['BORROW_TIME']);
            $this->assign("BORROW_TYPE", $borrow_config['BORROW_TYPE']);
            $this->assign("borrow_type", $borrow_type);
            $this->assign("borrow_day_time", $day_time);
            $this->assign("borrow_month_time", $month_time);
            $this->assign("repayment_type", $borrow_config['REPAYMENT_TYPE']);
            $this->assign("vkey", $vkey);
            $this->assign("rate_lixt", $rate_lixt);
        }
        //endregion
        $this->display();
    }

    public function save()
    {
        if (!$this->uid) $this->error("请先登录", "/login");
        //相关的判断参数
        $rate_lixt = explode("|", $this->glo['rate_lixi']);

        $m = new BorrowModel();
        //相关的判断参数
        $borrow['borrow_type'] = intval(cookie(text($_POST['vkey'])));
        if ($borrow['borrow_type'] == 0 || $borrow['borrow_type'] == 3 || $borrow['borrow_type'] > 5) $this->error("校验数据有误，请重新发布");
        if (floatval($_POST['borrow_interest_rate']) > $rate_lixt[1] || floatval($_POST['borrow_interest_rate']) < $rate_lixt[0]) $this->error("提交的借款利率超出允许范围，请重试", 0);
        $borrow['borrow_money'] = intval($_POST['borrow_money']);

        $mm = new MembersModel();
        $_minfo = $mm->getMemberInfo($this->uid, array("Money", "Extra"), "id,is_vip");
        switch ($borrow['borrow_type']) {
            case 1://普通标
                if ($_minfo['credit_cuse'] < $borrow['borrow_money'] && $_minfo['is_vip'] == 0) $this->error("您的可用信用额度为{$_minfo['credit_cuse']}元，小于您准备借款的金额，不能发标");
                break;
            case 2://新担保标
                break;
            case 4://净值标
                $nmap['borrow_uid'] = $this->uid;
                $nmap['borrow_type'] = 4;
                $nmap['borrow_status'] = 6;
                $borrowNum = $m->where($nmap)->sum("borrow_money-repayment_money");
                $_netMoney = getFloatValue(0.9 * $_minfo['money_collect'] - $borrowNum, 2);
                if ($_netMoney < $borrow['borrow_money']) $this->error("您的净值额度{$_netMoney}元，小于您准备借款的金额，不能发标");
                break;
            case 5://抵押标
                break;
        }

        $borrow['borrow_uid'] = $this->uid;
        $borrow['borrow_name'] = text($_POST['borrow_name']);
        $borrow['borrow_duration'] = intval($_POST['borrow_duration']);//秒标固定为一月
        $borrow['borrow_interest_rate'] = floatval($_POST['borrow_interest_rate']);

        $borrow['repayment_type'] = intval($_POST['repayment_type']);
        strtolower($_POST['is_day']) == 'yes' && $borrow['repayment_type'] = 1;
        $borrow['total'] = $borrow['borrow_duration'];//分几期还款
        $borrow['repayment_type'] == 1 && $borrow['total'] = 1;
        $borrow['repayment_type'] == 5 && $borrow['total'] = 1;

        $borrow['borrow_status'] = 0;
        $borrow['borrow_use'] = intval($_POST['borrow_use']);
        $borrow['add_time'] = time();
        $borrow['collect_day'] = intval($_POST['borrow_time']);
        $borrow['add_ip'] = get_client_ip();
        $borrow['borrow_info'] = text($_POST['borrow_info']);
        $borrow['reward_num'] = floatval($_POST["reward_type_1_value"]);
        $borrow['reward_type'] = 0;
        $borrow['reward_num'] > 0 && $borrow['reward_type'] = intval($_POST['reward_type']);

        $borrow['borrow_min'] = intval($_POST['borrow_min']);
        $borrow['borrow_max'] = intval($_POST['borrow_max']);
        $_POST['is_pass'] && intval($_POST['is_pass']) == 1 && $borrow['password'] = md5($_POST['password']);
        $borrow['money_collect'] = floatval($_POST['moneycollect']);//代收金额限制设置
        $_POST['moneycollect'] == 1 && $borrow['money_collect'] = 0;//代收金额限制设置

        //借款费和利息
        $borrow['borrow_interest'] = getBorrowInterest($borrow['repayment_type'], $borrow['borrow_money'], $borrow['borrow_duration'], $borrow['borrow_interest_rate']);

        #计算服务费
        $borrow['borrow_service_fee'] = $m->ServiceFee($borrow['borrow_money']);
        #借款管理费
        $borrow['borrow_fee'] = $m->ManageFee($borrow['borrow_money'], $borrow['borrow_duration'], $borrow['repayment_type']);
        $feeNew = $m->repayManageFee($borrow['borrow_money'], $borrow['borrow_duration'], $borrow['repayment_type']);
        $borrow['repayment_type'] != 1 && $borrow['borrow_r_fee'] = $feeNew['borrow_r_fee'];
        $borrow['repayment_type'] != 1 && $borrow['borrow_p_fee'] = $feeNew['borrow_p_fee'];

        $borrow['is_new'] = $_POST["is_new"] == '' ? 0 : $_POST["is_new"];
        $newid = $m->add($borrow);

        if ($newid) $this->success("借款发布成功，网站会尽快初审", "/user/borrowin#fragment-1");
        else $this->error("发布失败，请先检查是否完成了个人详细资料然后重试");

    }
}