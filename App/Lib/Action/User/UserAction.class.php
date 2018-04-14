<?php
// 尚贷内核类库，2014-06-11_listam
class UserAction extends MCommonAction {
    public function index(){
		$this->display();
    }

    public function header(){
		$data['html'] = $this->fetch();
		exit(json_encode($data));
    }

    public function password(){
		$data['html'] = $this->fetch();
		exit(json_encode($data));
    }

    public function pinpass(){
		$data['html'] = $this->fetch();
		exit(json_encode($data));
    }
    public function verify() {
        import("ORG.Util.Image");
        Image::buildImageVerify();
    }
    public function changepass(){
        $m = new MembersModel();
        $res = $m->updateUserPassByOld($this->uid,$_POST['newpwd'],$_POST['oldpwd']);
        if($res['status']==1){
            MTip('chk1',$this->uid);
        }
        ajaxmsg($res['msg'],$res['status']);
    }

    public function changepin(){
		$old = md5($_POST['oldpwd']);
		$newpwd = md5($_POST['newpwd']);
        $editWay = $_POST['editWay'];
        $m = new MembersModel();
        $ml = new SmsLogModel();
        if($editWay==1){
            if($old==$newpwd){
                ajaxmsg("请勿让新密码与老密码相同。",0);
            }
        }elseif($editWay==2){
            $phone_code = $_POST['phone_code'];
            $s = $ml->checkPhoneCode($phone_code);
            if($s){
                ajaxmsg("手机验证码输入错误。",0);
            }
        }else{
            ajaxmsg("设置失败，请重试。",0);
        }
        $data['pin_pass'] = $newpwd;
        $res = $m->updateMemberInfo($this->uid,$data);
        if($res){
            $ml->unsetTemp();
            ajaxmsg('更新成功',1);
        }else{
            ajaxmsg("设置失败，请重试。",0);
        }
    }

    public function sendphone() {

        if($_SESSION['verify'] != md5($_POST['phonecode'])) {
            ajaxmsg('图形验证码填写错误',3);
        }
        $m = new MembersModel();
        $sl = new SmsLogModel();

        //手机认证验证
        $phone = $m->getFieldById($this->uid, 'user_phone');
        $limit = $sl->sendLimit($phone,5);
        if($limit){
            ajaxmsg('发送次数超过限制',3);
        }
        $res = $sl->sendSms($phone,'verify_phone');
        if($res){
            ajaxmsg('验证码发送成功！',1);
        }else{
            ajaxmsg("验证码发送失败，请<a href='javascript:;' onclick='sendMobileValidSMSCode()' id='btnSendMsg'><span style='color:red;'>【重新发送】</span></a>！",0);
        }
    }
}