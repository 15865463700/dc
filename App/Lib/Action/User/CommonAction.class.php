<?php
// 尚贷内核类库，2014-06-11_listam
class CommonAction extends MCommonAction {
	var $notneedlogin=true;
    public function index(){
		$this->display();
    }

    public function getpwd(){
        $this->display();
    }
	public function actlogout(){
		$this->_memberloginout();
		//uc登录
		$loginconfig = FS("Dynamic/loginconfig");
		$uc_mcfg  = $loginconfig['uc'];
		if($uc_mcfg['enable']==1){
			require_once C('APP_ROOT')."Lib/Uc/config.inc.php";
			require C('APP_ROOT')."Lib/Uc/uc_client/client.php";
			$logout = uc_user_synlogout();
		}
		//uc登录
		$this->assign("uclogout",de_xie($logout));
		$this->success("注销成功","/");
	}

    public function ckphone(){
        $data['user_phone'] = $_POST['up'];
        $count = M('members')->where($data)->count('id');
        if ($count==1) {
            $json['status'] = 1;
            exit(json_encode($json));
        } else {
            $json['status'] = 0;
            exit(json_encode($json));
        }

    }
    public function ckphone_reg(){
        $data['user_phone'] = text($_POST['Email']);
        $count = M('members')->where($data)->count('id');
        if ($count==1) {
            $json['status'] = 0;
            exit(json_encode($json));
        } else {
            $json['status'] = 1;
            exit(json_encode($json));
        }

    }


	public function validatephone() {
		if (session('code_temp')==text($_POST['code'])) {
			$updata['phone_status'] = 1;
			if (!session("temp_phone")) {
				ajaxmsg("验证失败", 0);
			}
            $mid = $this->regaction();

			$newid = setMemberStatus($mid, 'phone', 1, 10, '手机');
			if ($newid) {
				ajaxmsg();
			} else{
				ajaxmsg("验证失败", 0);
			}
		} else {
//			$this->regaction();
			ajaxmsg("验证校验码不对，请重新输入！", 2);
		}
	}

	public function emailverify(){
		$code = text($_GET['vcode']);
		$uk = is_verify(0,$code,8,60*1000);
		if(false===$uk){
			$this->error("验证失败");
		}else{
			$this->assign("waitSecond",3);
            setMemberStatus($uk, 'email', 1, 9, '邮箱');
			$this->success("验证成功","/user");
		}
	}

	public function getpasswordverify(){
		$code = text($_GET['vcode']);
		$uk = is_verify(0,$code,7,60*1000);
		if(false===$uk){
			$this->error("验证失败");
		}else{
			session("temp_get_pass_uid",$uk);
			$this->display('getpass');
		}
	}

	public function setnewpass(){
		$d['content'] = $this->fetch();
		echo json_encode($d);
	}

	public function dosetnewpass(){
		$per = C('DB_PREFIX');
		$uid = session("temp_get_pass_uid");
		$oldpass = M("members")->getFieldById($uid,'user_pass');
		if($oldpass == md5($_POST['pass'])){
			$newid = true;
		}else{
			$newid = M()->execute("update {$per}members set `user_pass`='".md5($_POST['pass'])."' where id={$uid}");
		}

		if($newid){
			session("temp_get_pass_uid",NULL);
			ajaxmsg();
		}else{
			ajaxmsg('',0);
		}
	}


	public function ckuser(){
		$map['user_name'] = text($_POST['UserName']);
		$count = M('members')->where($map)->count('id');
        $atstr="@";
        $pos=strpos($_POST['UserName'],$atstr);
		if ($count>0) {
			$json['status'] = 0;
			exit(json_encode($json));
        } elseif($pos !== false){
            $json['status'] = 2;
            exit(json_encode($json));
        }else {
			$json['status'] = 1;
			exit(json_encode($json));
        }
	}

	public function ckemail(){
		$map['user_email'] = text($_POST['Email']);
		$count = M('members')->where($map)->count('id');

		if ($count>0) {
			$json['status'] = 0;
			exit(json_encode($json));
        } else {
			$json['status'] = 1;
			exit(json_encode($json));
        }
	}
    public function ckemail3(){
        (false!==strpos($_POST['u'],"@"))?$data['user_email'] = text($_POST['u']):$data['user_name'] = text($_POST['u']);
        $vo = M('members')->field('user_email')->where($data)->find();
        if(is_array($vo)){
            if(isset($vo['user_email'])&&$vo['user_email']!=''){
                $json['email'] = $vo['user_email'];
                $json['status'] = 1;
                exit(json_encode($json));
            }
        }
        $json['status'] = 0;
        exit(json_encode($json));
    }
	public function emailvsend(){
		session('email_temp',text($_POST['email']));
		$mid = $this->regaction();

		$status=Notice(8,$mid);
		if($status) ajaxmsg('邮件已发送，请注意查收！',1);
		else ajaxmsg('邮件发送失败,请重试！',0);

    }
	public function ckcode(){
		if($_SESSION['verify'] != md5($_POST['sVerCode'])) {
			echo (0);
		 }else{
			echo (1);
        }
    }
    public function ckpcode() {

        if (session('code_temp') != text($_POST['sVerCode'])) {
            echo (0);
        } else {
            echo (1);
        }
    }

	public function getpassword(){
		$d['content'] = $this->fetch();
		echo json_encode($d);
	}


    public function resetPwd(){
        $per = C('DB_PREFIX');
        $pcode = $_POST['pcode'];
        $uphone = $_POST['uphone'];
        $pass = $_POST['pass'];

        if($_SESSION["uphone"]!=$uphone){
            $json['status'] = 3;
            exit(json_encode($json));
        }

        if($_POST['pcode'] == $_SESSION['pcode']&&isset($_SESSION['pcode'])){
            $flag = M()->execute("update {$per}members set `user_pass`='".md5($pass)."' where user_phone={$uphone}");
            $json['status'] = 1;
            exit(json_encode($json));
        }else{
            $json['status'] = 2;
            exit(json_encode($json));
        }
    }

    public function verify() {
        import("ORG.Util.Image");
        Image::buildImageVerify();
    }

    public function regsuccess() {
        $this->assign('userEmail', M('members')->getFieldById($this->uid, 'user_email'));
        $d['content'] = $this->fetch();
        echo json_encode($d);
    }

    public function dogetpass() {
        (false !== strpos($_POST['u'], "@")) ? $data['user_email'] = text($_POST['u']) : $data['user_name'] = text($_POST['u']);
        $vo = M('members')->field('id')->where($data)->find();
        if (is_array($vo)) {
            $res = Notice(7, $vo['id']);
            if ($res)
                ajaxmsg();
            else
                ajaxmsg('', 0);
        }else {
            ajaxmsg('', 0);
        }
    }

    public function register2() {
        $this->display();
    }

    public function sendcode(){
        if(md5(strtolower(join('', $_POST['code'])))==$_SESSION['verify']){
            ajaxmsg();
        }else{
            ajaxmsg("图形验证码不正确",0);
        }
    }
	public function phone(){
		$this->assign("phone",$_GET['phone']);
		$data['content'] = $this->fetch();
		exit(json_encode($data));

	}

	//跳过手机验证
	public function skipphone(){
		$this->regaction();
		ajaxmsg();

	}
	//推荐人检测
    public function ckInviteUser() {
        $map['user_name'] = text($_POST['InviteUserName']);
        $map1['user_phone'] = text($_POST['InviteUserName']);
        $map2['user_name'] = text($_POST['InviteUserName']);
        $map2['u_group_id'] = 26;
        $count = M('members')->where($map)->count('id');
        $count1 = M('members')->where($map1)->count('id');
        $count2 = M('ausers')->where($map2)->count('id');

        if ($count == 1 || $count2 == 1||$count1==1) {
            $json['status'] = 1;
            exit(json_encode($json));
        } else {
            $json['status'] = 0;
            exit(json_encode($json));
        }
    }
    public function phonecode(){
        if($_SESSION['verify'] != md5($_POST['phonecode'])) {
            ajaxmsg('fail',0);
        }else{
            ajaxmsg('fail',1);
        }
    }
}
