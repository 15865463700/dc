<?php
// 尚贷内核类库，2014-06-11_listam
class BankAction extends MCommonAction {

    public function index(){
		$this->display();
    }

    public function bank(){
        $m = new MembersModel();
        $link = array("Verify");
        $vo = $m->getMemberInfo($this->uid,$link,"id");
        if($vo['id_status']!=1){
            $data['html'] = '<script type="text/javascript">layer.msg("请先进行实名认证",{icon:5,shade:0.3},function(){window.location.href="/user/verify?id=1#fragment-4";})</script>';
            exit(json_encode($data));
        }

        $link = array("MemberInfo","Bank");
        $voinfo = $m->getMemberInfo($this->uid,$link,"id");
        $voinfo['bank_province'] = "";
        $voinfo['bank_city'] = "";
        $voinfo['bank_num'] = $voinfo['bank_num']==''?'':decode_ts($voinfo['bank_num'],getcode());
        $this->assign("voinfo",$voinfo);
        $this->assign("bank_list",$this->gloconf['BANK_NAME']);
        $this->assign('edit_bank', $this->glo['edit_bank']);
        $data['html'] = $this->fetch();
		exit(json_encode($data));
    }
	public function bindbank(){
        $phone_code = $_POST['phone_code'];
        $sl = new SmsLogModel();
        $res = $sl->checkPhoneCode($phone_code);
        if($res){
            ajaxmsg("手机验证码输入错误！", 0 );
        }
        $m = new MembersModel();
        $res = $m->bindBank($this->uid,$_POST);
        if($res['status']){
            $sl->unsetTemp();
        }
        ajaxmsg($res['msg'],$res['status']);
	}
	
	
	public function getarea(){
		$rid = intval($_GET['rid']);
		if(empty($rid)) return;
		$alist = get_city_list($rid);
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
    public function sendphone() {

        $m = new MembersModel();
        $user_phone = $m->getFieldById($this->uid, 'user_phone');
        $sl = new SmsLogModel();
        $resl = $sl->sendLimit($user_phone,5);
        if($resl){
            ajaxmsg('半小时内连续发送不能超过5次',2);
        }
        $res = $sl->sendSms($user_phone,'verify_phone');
        if($res){
            ajaxmsg('验证码发送成功！',1);
        }else{
            ajaxmsg("验证码发送失败，请<a href='javascript:;' onclick='sendMobileValidSMSCode()' id='btnSendMsg'><span style='color:red;'>【重新发送】</span></a>！",0);
        }

	}

}