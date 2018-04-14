<?php

// 尚贷内核类库，2014-06-11_listam
class VerifyAction extends MCommonAction {
    private function getMinfo(){
        $m = new MembersModel();
        return $m->getMemberInfo($this->uid,array("Verify","MemberInfo"),"id,user_phone,user_email,user_leve,time_limit");
    }
    public function vcenter(){
        $vinfo = $this->getMinfo();
        if($vinfo["user_leve"]>0 && $vinfo["time_limit"]>time()){
            $vinfo["vip_status"]=1;
        }
        if($vinfo["user_leve"]>0 && $vinfo["time_limit"]<time()){
            $vinfo["vip_status"]=2;
        }
        $this->assign("vinfo", $vinfo);
        $data['html'] = $this->fetch();
        exit(json_encode($data));

    }
    public function vip(){
        $vo = $this->getMinfo();
        $vip_status = $vo['vip_status'];//审核中
        if($vo['user_leve']>0 && $vo['time_limit']>time()){
            $vip_status = 2;//vip中
        }
        if($vo['user_leve']>0 && $vo['time_limit']<time()){
            $vip_status = 1;//过期
        }
        if($vip_status<=1){
            $ausers = new AusersModel();
            $map['is_kf'] = 1;
            $searchx = array();
            $searchx['map'] = $map;
            $searchx['limit'] = 4;
            $list = $ausers->getList("*",$searchx);
            $this->assign("list",$list['list']);
            $this->assign("count",$list['count']);
            $this->assign("page",$list['page']);
        }
        $this->assign("vipTime",$vo['time_limit']);
        $this->assign("vip_status",$vip_status);
        $data['html'] = $this->fetch();
        ajaxmsg($data);
    }

    public function vipapply(){
        $m = new VipApplyModel();
        $res = $m->vipApply($this->uid,$_POST);
        ajaxmsg($res['msg'],$res['status']);
    }

    public function index(){
		$this->display();
    }

    public function email() {
        $sq = $this->getMinfo();
        $this->assign("sq", $sq);
        $data['html'] = $this->fetch();
        exit(json_encode($data));
    }

    public function emailvalided() {
        $vo = $this->getMinfo();
        ajaxmsg('', $vo['email_status']);
    }

	
    public function emailvsend(){
        $m = new MembersModel();
		$data['user_email'] = text($_POST['email']);
		$newid = $m->updateMemberInfo($this->uid,$data);//更改邮箱，重新激活
		if($newid){
			$status=Notice(8,$this->uid);
			if($status){
                ajaxmsg('邮件已发送，请注意查收！',1);
            }else{
                ajaxmsg('邮件发送失败,请重试！',0);
            }
		}else{
			 ajaxmsg('邮件修改失败',2);
		}
    }

    public function ckemail() {
        $m = new MembersModel();

        $map['user_email'] = text($_POST['Email']);
        $map['id'] = array("neq",$this->uid);
        $count = $m->where($map)->count();

        $vo = $m->getMemberInfo($this->uid,"Verify",'id');
        $email_status = $vo['email_status'];

        if ($count > 0 && ($email_status != 1)) {
            ajaxmsg("邮箱已经在本站注册",0);
        } else {
            ajaxmsg();
        }
    }
    public function idcard() {
        $vo = $this->getMinfo();
        $this->assign("vo", $vo);
        $data['html'] = $this->fetch();
        exit(json_encode($data));
    }
    public function safequestion() {
        $vo = $this->getMinfo();
        $isid = $vo['safequestion_status'];
        if ($isid == 1) {
            $sq = M('member_safequestion')->find($this->uid);
            $this->assign("sq", $sq);
            $this->assign("userphone", $vo['user_phone']);
        }
        $this->assign("safe_question", $isid);
        $data['html'] = $this->fetch();
        exit(json_encode($data));
    }

    public function questionsave() {
        $m =new MembersModel();
        $uid = $this->uid;
        $data['question1'] = text($_POST['q1']);
        $data['question2'] = text($_POST['q2']);
        $data['answer1'] = text($_POST['a1']);
        $data['answer2'] = text($_POST['a2']);
        $data['add_time'] = time();
        $save_data['Question'] = $data;
        $res = $m->updateMemberInfo($uid,$save_data);
        if ($res) {
            $newid = setMemberStatus($this->uid, 'safequestion', 1, 6, '安全问题');
            if ($newid) {
                addInnerMsg($uid, "您的安全问题已设置", "您的安全问题已设置");
            }
            ajaxmsg();
        } else
            ajaxmsg("", 0);
    }

    public function cellphone() {
        $phone = $this->getMinfo();
        $m = new MembersModel();
        $this->assign("phone", $phone['user_phone']);
        $sq = $m->getMemberInfo($this->uid,"Question","id");
        $this->assign("sq", $sq);
        $this->assign("phone_status", $phone['phone_status']);
        $data['html'] = $this->fetch();
        exit(json_encode($data));
    }

    public function sendphone() {
        $smsTxt = FS("Dynamic/smstxt");
        $smsTxt = de_xie($smsTxt);
        $phone = text($_POST['cellphone']);
        $xuid = M('members')->getFieldByUserPhone($phone, 'id');
        if ($xuid > 0 && $xuid <> $this->uid)
            ajaxmsg("", 2);

        $code = rand_string(6, 1);
        $datag = get_global_setting();
        $is_manual = $datag['is_manual'];
        if ($is_manual == 0) {//如果未开启后台人工手机验证，则由系统向会员自动发送手机验证码到会员手机，
            $res = sendsms($phone, str_replace(array("#UserName#", "#CODE#"), array(session('u_user_name'), $code), $smsTxt['verify_phone']));
        } else {//否则，则由后台管理员来手动审核手机验证
            $res = true;
            $phonestatus = M('members_status')->getFieldByUid($this->uid, 'phone_status');
            if ($phonestatus == 1)
                ajaxmsg("手机已经通过验证", 1);
            $updata['phone_status'] = 3; //待审核

            $updata1['user_phone'] = $phone;
            $a = M('members')->where("id = {$this->uid}")->count('id');
            if ($a == 1)
                $newid = M("members")->where("id={$this->uid}")->save($updata1);
            else {
                M('members')->where("id={$this->uid}")->setField('user_phone', $phone);
            }

            $updata2['cell_phone'] = $phone;
            $b = M('member_info')->where("uid = {$this->uid}")->count('uid');
            if ($b == 1)
                $newid = M("member_info")->where("uid={$this->uid}")->save($updata2);
            else {
                $updata2['uid'] = $this->uid;
                $updata2['cell_phone'] = $phone;
                M('member_info')->add($updata2);
            }
            $c = M('members_status')->where("uid = {$this->uid}")->count('uid');
            if ($c == 1)
                $newid = M("members_status")->where("uid={$this->uid}")->save($updata);
            else {
                $updata['uid'] = $this->uid;
                $newid = M('members_status')->add($updata);
            }
            if ($newid) {
                ajaxmsg();
            } else
                ajaxmsg("验证失败", 0);

            //////////////////////////////////////////////////////////////
        }
        if ($res) {
            session("temp_phone", $phone);
            ajaxmsg();
        } else
            ajaxmsg("", 0);
    }

    public function validatephone() {
        $phonestatus = M('members_status')->getFieldByUid($this->uid, 'phone_status');
        if ($phonestatus == 1)
            ajaxmsg("手机已经通过验证", 1);
        if (is_verify($this->uid, text($_POST['code']), 2, 10 * 60)) {
            $updata['phone_status'] = 1;
            if (!session("temp_phone"))
                ajaxmsg("验证失败", 0);

            $updata1['user_phone'] = session("temp_phone");
            $a = M('members')->where("id = {$this->uid}")->count('id');
            if ($a == 1)
                $newid = M("members")->where("id={$this->uid}")->save($updata1);
            else {
                M('members')->where("id={$this->uid}")->setField('user_phone', session("temp_phone"));
            }

            $updata2['cell_phone'] = session("temp_phone");
            $b = M('member_info')->where("uid = {$this->uid}")->count('uid');
            if ($b == 1)
                $newid = M("member_info")->where("uid={$this->uid}")->save($updata2);
            else {
                $updata2['uid'] = $this->uid;
                $updata2['cell_phone'] = session("temp_phone");
                M('member_info')->add($updata2);
            }
            $c = M('members_status')->where("uid = {$this->uid}")->count('uid');
            if ($c == 1)
                $newid = M("members_status")->where("uid={$this->uid}")->save($updata);
            else {
                $updata['uid'] = $this->uid;
                $newid = M('members_status')->add($updata);
            }
            if ($newid) {
                $newid = setMemberStatus($this->uid, 'phone', 1, 10, '手机');
                ajaxmsg();
            } else
                ajaxmsg("验证失败", 0);
        }else {
            ajaxmsg("验证校验码不对，请重新输入！", 2);
        }
    }

    public function ajaxupimg() {
        if (!empty($_FILES['imgfile']['name'])) {
            $this->fix = false;
            $this->saveRule = date("YmdHis", time()) . rand(0, 1000) . "_{$this->uid}";
            $this->savePathNew = C('MEMBER_UPLOAD_DIR') . 'Idcard/';
            $this->thumbMaxWidth = "1000,1000";
            $this->thumbMaxHeight = "1000,1000";
            $info = $this->CUpload();
            $img = $info[0]['savepath'] . $info[0]['savename'];
        }
        if ($img) {
            $c = M('member_info')->where("uid = {$this->uid}")->count('uid');
            if ($c == 1) {
                $newid = M("member_info")->where("uid={$this->uid}")->setField('card_img', $img);
            } else {
                $data['uid'] = $this->uid;
                $data['card_img'] = $img;
                $newid = M('member_info')->add($data);
            }
            session("idcardimg", "1");
            ajaxmsg('', 1);
        } else
            ajaxmsg('', 0);
    }

    public function ajaxupimg2() {
        if (!empty($_FILES['imgfile2']['name'])) {
            $this->fix = false;
            $this->saveRule = date("YmdHis", time()) . rand(0, 1000) . "_{$this->uid}_back";
            $this->savePathNew = C('MEMBER_UPLOAD_DIR') . 'Idcard/';
            $this->thumbMaxWidth = "1000,1000";
            $this->thumbMaxHeight = "1000,1000";
            $info = $this->CUpload();
            $img = $info[0]['savepath'] . $info[0]['savename'];
        }
        if ($img) {
            $c = M('member_info')->where("uid = {$this->uid}")->count('uid');
            if ($c == 1) {
                $newid = M("member_info")->where("uid={$this->uid}")->setField('card_back_img', $img);
            } else {
                $data['uid'] = $this->uid;
                $data['card_back_img'] = $img;
                $newid = M('member_info')->add($data);
            }
            session("idcardimg2", "1");
            ajaxmsg('', 1);
        } else
            ajaxmsg('', 0);
    }
    ////////////////////////////
    public function changesafe() {
        $map['answer1'] = text($_POST['a1']);
        $map['answer2'] = text($_POST['a2']);
        $map['uid'] = $this->uid;
        $c = M('member_safequestion')->where($map)->count();
        if ($c == 0)
            ajaxmsg('', 0);
        else {
            session('temp_safequestion', 1);
            ajaxmsg();
        }
    }

    public function changesafeact() {
        $is_can = session('temp_safequestion');
        if ($is_can == 1) {
            $data['question1'] = text($_POST['q1']);
            $data['question2'] = text($_POST['q2']);
            $data['answer1'] = text($_POST['a1']);
            $data['answer2'] = text($_POST['a2']);
            $data['add_time'] = time();
            $save_data['Question'] = $data;
            $m = new MembersModel();
            $newid = $m->updateMemberInfo($this->uid,$save_data);
            if ($newid) {
                session('temp_safequestion', NULL);
                ajaxmsg();
            } else
                ajaxmsg('', 0);
        }else {
            ajaxmsg('', 0);
        }
    }

    public function sendphonecode() {
        $m = new MembersModel();
        $phone = $m->getFieldById($this->uid,'user_phone');
        $sl = new SmsLogModel();
        $limit = $sl->sendLimit($phone,5);
        if($limit){ajaxmsg('发送次数超过限制', 0);}
        $res = $sl->sendSms($phone,'safecode');
        if ($res) {
            ajaxmsg('',1);
        } else{
            ajaxmsg('发送失败', 0);
        }
    }

    public function sendphonecodex() {
        $phone = text($_POST['phone']);
        $map['user_phone'] = $phone;
        $m = new MembersModel();
        $count = $m->where($map)->count();
        if($count){
            ajaxmsg('', 2);
        }else{
            $sl = new SmsLogModel();
            $limit = $sl->sendLimit($phone,7);
            if($limit){ajaxmsg('发送次数超过限制', 0);}
            $res = $sl->sendSms($phone,'safecode');
            if ($res) {
                ajaxmsg('',1);
            } else{
                ajaxmsg('发送失败', 0);
            }
        }
    }

    public function changephone(){
        $vcode = text($_POST['code']);
        $sl = new SmsLogModel();
        $res = $sl->checkPhoneCode($vcode);
        if($res){
            ajaxmsg('验证码不正确', 0);
        }else{
            ajaxmsg();
        }
    }

    public function changephoneact() {
        $vcode = text($_POST['code']);
        $sl = new SmsLogModel();
        $s = $sl->checkPhoneCode($vcode);
        if($s){
            ajaxmsg('验证码不正确', 0);
        }
        $phone = text($_POST['phone']);
        $data['user_name'] = $phone;
        $data['user_phone'] = $phone;
        $data['MemberInfo'] = array(
            'cell_phone'=>$phone,
            'up_time'=>time()
        );
        $m = new MembersModel();
        $res = $m->updateMemberInfo($this->uid,$data);


        if ($res){
            $sl->unsetTemp();
            ajaxmsg();
        }
        else
            ajaxmsg('', 0);
    }

    public function sendemailtov() {
        $user_email=M('members')->field('user_email,user_name,user_phone')->find($this->uid);
        if($user_email['user_email'] == ''){
            ajaxmsg('未进行邮箱验证，无法发送', 3);
        }else{
            $r = Notice(5, $this->uid);
            if ($r)
                ajaxmsg();
            else
                ajaxmsg('', 0);
        }

    }

    public function doemailchangephone() {
        $code = text($_POST['safecode']);
        $r = is_verify($this->uid, $code, 5, 600);
        if (!$r)
            ajaxmsg("", 2);
        $map['answer1'] = text($_POST['qone']);
        $map['answer2'] = text($_POST['qtwo']);
        $map['uid'] = $this->uid;
        $c = M('member_safequestion')->where($map)->count();
        if ($c == 0)
            ajaxmsg('', 0);
        ajaxmsg();
    }

    public function sendverify() {
        $r = Notice(2, $this->uid);
        if ($r)
            echo(1);
        else
            echo(0);
    }

    public function verifyep() {
        $pcode = $_POST['pcode'];
        $ecode = is_verify($this->uid, text($_POST['ecode']), 2, 10 * 60);

        $sl  = new SmsLogModel();
        $res = $sl->checkPhoneCode($pcode);
        if($res){
            ajaxmsg('',0);
        }
        if($ecode){
			session('temp_safequestion',1);
            $sl->unsetTemp();
			ajaxmsg();
		}else{
			ajaxmsg('',0);
		}
	}
}
