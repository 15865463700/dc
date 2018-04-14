<?php

// 尚贷内核类库，2014-06-11_listam
class RegisterAction extends MCommonAction
{
    var $notneedlogin = true;

//    public function index()
//    {
//        $m = new MembersModel();
//        $in = $m->getFieldById($_GET['invite'], 'user_phone');
//        $this->assign("in", $in);
//        $this->assign("invite", $_GET['invite']);
//        $step = 1;
//        $uid = $this->uid;
//        if ($uid) {
//            $checkinfo = $m->getMemberInfo($uid, 'Verify', 'id,pin_pass,is_business');
//            $step = 4;
//            if (empty($checkinfo["pin_pass"])) {
//                $step = 3;
//            }
//            if ($checkinfo["id_status"] != 1 && $checkinfo["id_status"] != 3) {
//                $step = 2;
//            }
//            $this->assign('business', $checkinfo['is_business']);
//        }
//        $this->assign("step", $step);
//        $this->display();
//    }

    public function index()
    {
        $m = new MembersModel();
        $in = $m->getFieldById($_GET['invite'], 'user_phone');
        $this->assign("in", $in);
        $this->assign("invite", $_GET['invite']);
        $step = 1;
        if ($this->uid) {
            $checkinfo = $m->getMemberInfo($this->uid, 'Verify', 'id,pin_pass,is_business');
            $step = 4;
            if (empty($checkinfo["pin_pass"])) {
                $step = 3;
            }
            if ($checkinfo["id_status"] != 1 && $checkinfo["id_status"] != 3) {
                $step = 2;
            }
            $this->assign('business', $checkinfo['is_business']);
        }
        $this->assign("step", $step);
        $this->display();
    }

    public function verify()
    {
        import("ORG.Util.Image");
        Image::buildImageVerify();
    }

    public function checkphone()
    {
        $m = new MembersModel();
        $map['user_phone'] = text($_POST['phone']);
        $count = $m->where($map)->count('id');

        if ($count > 0) {
            $json['status'] = 0;
            exit(json_encode($json));
        } else {
            $json['status'] = 1;
            exit(json_encode($json));
        }
    }

    public function ajaxCheckPhone()
    {
        $m = new MembersModel();
        $map['user_phone'] = text($_POST['phone']);
        $count = $m->where($map)->count('id');

        if ($count > 0) {
            $json['status'] = 0;
        } else {
            $json['status'] = 1;
        }
        $this->ajaxReturn(1, $json);
    }

    public function ajaxCheckPhone2()
    {
        $m = new MembersModel();
        $map['user_phone'] = text($_POST['phone']);
        $count = $m->where($map)->count('id');

        if ($count > 0) {
            $json['status'] = 1;
        } else {
            $json['status'] = 0;
        }
        $this->ajaxReturn(1, $json);
    }

    public function checkimgcode()
    {
        if ($_SESSION['verify'] != md5(strtolower($_POST['img_code']))) {
            $json['status'] = 0;
            exit(json_encode($json));
        } else {
            $json['status'] = 1;
            exit(json_encode($json));
        }
    }

    public function ajaxcheckimgcode()
    {
        if ($_SESSION['verify'] != md5(strtolower($_POST['img_code']))) {
            $json['status'] = 0;
        } else {
            $json['status'] = 1;
        }
        $this->success($json);
    }

    public function checkphonecode()
    {
        if (session('code_temp') != text($_POST['phone_code']) || $_POST['phone_code'] == '') {
            $json['status'] = 0;
            exit(json_encode($json));
        } else {
            $json['status'] = 1;
            exit(json_encode($json));
        }
    }

    public function ajaxcheckphonecode()
    {
        if (session('code_temp') != text($_POST['phone_code']) || $_POST['phone_code'] == '') {
            $json['status'] = 0;
        } else {
            $json['status'] = 1;
        }
        $this->success($json);
    }

    public function sendphone()
    {
        if (empty($_POST['code'])) {
            ajaxmsg("请填写图形验证码", 3);
        }
        if (md5(strtolower($_POST['code'])) != $_SESSION['verify']) {
            ajaxmsg("图形验证码不正确", 0);
        }
        $phone = text($_POST['phone']);
        $m = new MembersModel();

        $xuid = $m->getFieldByUserPhone($phone, 'id');
        if ($xuid > 0 && $xuid <> $this->uid) ajaxmsg('手机号已存在', 0);
        $sl = new SmsLogModel();
        $limit = $sl->sendLimit($phone, 5);
        if ($limit) {
            ajaxmsg('发送次数超过限制', 0);
        }
        $res = $sl->sendSms($phone, 'verify_phone');
        if ($res) {
            session("temp_phone", $phone);
            ajaxmsg('', 1);
        } else {
            ajaxmsg('发送失败', 0);
        }
    }

    public function ajaxsendphone()
    {
        if (empty($_POST['code'])) {
            ajaxmsg("请填写图形验证码", 3);
        }
        if (md5(strtolower($_POST['code'])) != $_SESSION['verify']) {
            ajaxmsg("图形验证码不正确", 0);
        }
        $phone = text($_POST['phone']);
        $m = new MembersModel();

        $xuid = $m->getFieldByUserPhone($phone, 'id');
        if ($xuid > 0 && $xuid <> $this->uid) ajaxmsg('手机号已存在', 0);
        $sl = new SmsLogModel();
        $limit = $sl->sendLimit($phone, 5);
        if ($limit) {
            ajaxmsg('发送次数超过限制', 0);
        }
        $res = $sl->sendSms($phone, 'verify_phone');
        if ($res) {
            session("temp_phone", $phone);
            $json['status'] = 1;
//            ajaxmsg('', 1);
        } else {
            $json['status'] = 0;
//            ajaxmsg('发送失败', 0);
        }
        $this->success($json);
        exit();
    }

    public function reg_action()
    {
       $sl = new SmsLogModel();
       $s = $sl->checkPhoneCode($_POST['phone_code'],$_POST['phone']);
       if ($s) {
           ajaxmsg('手机验证码错误', 0);
       }
        M()->startTrans();
        $m = new MembersModel();
        $res = $m->register($_POST);
        if ($res['status'] == 1) {
            M()->commit();
        } else {
            M()->rollback();
        }
        ajaxmsg($res['msg'], $res['status']);
    }

    public function ajaxRegAction()
    {
        $sl = new SmsLogModel();
        $s = $sl->checkPhoneCode($_POST['phoneVerify'],$_POST['phone']);
        if ($s) {
           $this->error(array('status'=>0,'msg'=>'手机验证码错误'));
        }
        $user_name = $_POST['phone'];
        $where = ' user_name =' .$user_name. ' OR user_phone = '.$user_name;
        $m = M('members')->where($where)->find();
        if($m)
            $this->error(array('status'=>0,'msg'=>'此账号已经被注册过！'));

        M()->startTrans();
        $m = new MembersModel();
        $res = $m->registerUser($_POST);
        if ($res['status'] == 1) {
            M()->commit();
        } else {
            M()->rollback();
        }
        $this->success($res);
    }

    public function ajaxRegBusinessAction()
    {
		$sl = new SmsLogModel();
        $s = $sl->checkPhoneCode($_POST['phoneVerify'],$_POST['phone']);
        if ($s) {
           $this->error(array('status'=>0,'msg'=>'手机验证码错误'));
        }
        $user_name = $_POST['phone'];
        $where = ' user_name =' .$user_name. ' OR user_phone = '.$user_name;
        $m = M('members')->where($where)->find();
        if($m)
            $this->error(array('status'=>0,'msg'=>'此账号已经被注册过！'));

        M()->startTrans();
        $m = new MembersModel();
        $res = $m->registerBusiness($_POST);
        if ($res['status'] == 1) {
            M()->commit();
        } else {
            M()->rollback();
        }
        $this->success($res);
    }

    public function checkidcard()
    {
        $m = new MembersModel();
        $res = $m->realNameAuth($this->uid, $_POST);
        ajaxmsg($res['msg'], $res['status']);
    }

    public function ajaxCheckidcard()
    {
        $m = new MembersModel();
        $res = $m->realNameAuth($this->uid, $_POST);
        $this->success($res);
    }

    function checkbusiness()
    {
        $m = new MembersModel();
        $req = $m->realBusinessAuth($this->uid, $_POST);
        ajaxmsg($req['msg'], $req['status']);
    }

    function ajaxcheckbusiness()
    {
        $m = new MembersModel();
        $req = $m->realBusinessAuth($this->uid, $_POST);
        $this->success($req);
    }

    public function savepinpass()
    {
        $m = new MembersModel();
        $res = $m->setPinPass($this->uid, $_POST['pin']);
        $res['status'] && $m->_memberLogin($this->uid);
        ajaxmsg($res['msg'], $res['status']);
    }

    public function ajaxSavepinpass()
    {
        $m = new MembersModel();
        $res = $m->setPinPass($this->uid, $_POST['pin']);
        $res['status'] && $m->_memberLogin($this->uid);
        $this->success($res);
    }
}