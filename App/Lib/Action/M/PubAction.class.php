<?php
class PubAction extends Action
{

    function __construct(){
        parent::__construct();
        $this->sl = new SmsLogModel();
        $this->member = new MembersModel();
    }

    public function Verify()
    {
        import("ORG.Util.Image");
        Image::buildImageVerify();
    }
    /**
     * 用户登录
     */
    public function login()
    {
        $hetong = M('hetong')->field('name,dizhi,tel')->find();
        $this->assign("web",$hetong);
        if($this->isPost()){

            if($_SESSION['verify'] != md5(strtolower($_POST['verify'])))
            {
                $this->error('验证码错误！',$_SERVER['HTTP_REFERER']);
            }
            $m = new MembersModel();
            $res = $m->memberLogin($_POST);
            if($res['status']==1){
                $JumpUrl = session('JumpUrl')?session('JumpUrl'):U('M/user/index');
                session('JumpUrl','');
                $this->success("登录成功！", $JumpUrl);
            }else{
                $this->error($res['msg']);
            }
        }else{
            if(session('u_id')){
                $this->redirect('M/user/index');
            }
            session('JumpUrl', $_SERVER['HTTP_REFERER']);
            $this->display();
        }

    }

    /**
     * 注销用户
     */
    public function Logout()
    {
        session(null);
        $this->success('安全退出!',U('M/index/index'));
    }
    //发送手机验证码
    public function sendphone() {
        $phone = text($_POST['cellphone']);
        $xuid = $this->member->getFieldByUserPhone($phone, 'id');
        if ($xuid > 0) ajaxmsg('手机号已存在', 0);
        $limit = $this->sl->sendLimit($phone,5);
        if($limit){ajaxmsg('发送次数超过限制', 0);}
        $res = $this->sl->sendSms($phone,'verify_phone');
        if ($res) {
            session("temp_phone", $phone);
            ajaxmsg('',1);
        } else{
            ajaxmsg('发送失败', 0);
        }
    }

    public function sendphone2() {
        if($_SESSION['verify'] != md5(strtolower($_POST['imgcode']))) {
            ajaxmsg('验证码错误', 0);
        }
        $phone = text($_POST['uphone']);
        $res = $this->sl->sendSms($phone,'verify_phone');
        if ($res) {
            session("temp_phone", $phone);
            ajaxmsg('',1);
        } else{
            ajaxmsg('发送失败', 0);
        }
    }
    public  function phonecode(){
        if($_SESSION['verify'] != md5(strtolower($_POST['phonecode']))) {
            ajaxmsg('fail',0);
        }else{
            ajaxmsg('fail',1);
        }
    }
    /**
     * 用户注册
     *
     */
    public function regist()
    {

        if(session('u_id')){
            $this->redirect('M/user/index');
        }
		
        if($this->isAjax()){
            $phone = $this->_post('phone');
//            $username = $this->_post('username');
            $password = $this->_post('password');
            $verify = strtolower($this->_post('verify'));
            $spread_name= $this->_post('invite');
            if(!$phone  || !$password || !$verify){
                ajaxmsg('数据不完整', 0);
            }
            if(M("members")->where("user_phone='{$phone}'")->count('id')){
                ajaxmsg('手机号已注册', 0);
            }
            $s = $this->sl->checkPhoneCode($_POST['verify'],$_POST['phone']);
            if ($s) {
                ajaxmsg('手机验证码错误', 0);
            }
            if(!empty($spread_name)){
                $infop = M("members")->where("user_phone = '{$spread_name}'")->find();
                if($infop == ''){
                    ajaxmsg('推荐人不存在', 0);
                }
            }
            M()->startTrans();
            $res = $this->member->register($_POST);
            if($res['status'] ==1){
                M()->commit();
            }else{
                M()->rollback();
            }
            ajaxmsg($res['msg'], $res['status']);
        }else{

			if($_GET['fxid']){
				$fxlist = M("members")->find($_GET['fxid']);
				$this->assign('fx_name',$fxlist['user_name']);
			}
            $is_start=1;
            //$data=get_global_setting();
            //$is_start=$data['is_phone_code'];
            $is_start=intval($is_start);
            $this->assign('is_start',$is_start);
            $this->display();
        }
    }
    public function resetPwd(){
        $per = C('DB_PREFIX');

        $pcode = $_POST['pcode'];
        $uphone = $_POST['uphone'];
        $pass = $_POST['pass'];
        $s = $this->sl->checkPhoneCode($pcode,$uphone);
        if ($s) {
            ajaxmsg('手机验证码错误', 0);
        }
        $nid = $this->member->where("user_phone = {$uphone}")->save(array('user_pass'=>md5($pass)));
        if($nid!==false){
            ajaxmsg('修改成功', 1);
        }else{
            ajaxmsg('系统繁忙，请重试', 0);
        }
    }

    public function ckphone(){
        $data['user_phone'] = text($_POST['u']);
        $count = M('members')->where($data)->count('id');
        if ($count==1) {
            ajaxmsg("",1);
        } else {
            ajaxmsg("该手机号不存在",0);
        }

    }
    public function repass()
    {
        $this->display();
    }


//新增结束

}
?>
