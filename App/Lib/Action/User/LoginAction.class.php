<?php
// 尚贷内核类库，2014-06-11_listam
class LoginAction extends MCommonAction {
    function __construct(){
        parent::__construct();
        if($this->uid){
            redirect("/User");
        }
    }
    var $notneedlogin=true;
    public function index(){
        $type = $_GET['ty'];
        $refer = '';
        switch($type){
            case 't':
                $refer = "http://".$_SERVER ['HTTP_HOST']."/fund/".$_GET['re'].".html";
                break;
            case 'b':
                $refer = "http://".$_SERVER ['HTTP_HOST']."/invest/".$_GET['re'].".html";
                break;
            case 'borrow':
                $refer = "http://".$_SERVER ['HTTP_HOST']."/borrow/post/".$_GET['re'].".html";
                break;
            case 'p':
                $refer = "http://".$_SERVER ['HTTP_HOST']."/privilege/index";
                break;
        }
        $_SESSION['refer'] = $refer;
        $this->display();
    }
    public function verify()
    {
        import("ORG.Util.Image");
        Image::buildImageVerify();
    }
    public function actlogin(){
        setcookie('LoginCookie','',time()-10*60,"/");
        $m = new MembersModel();
        $res = $m->memberLogin($_POST);
        ajaxmsg($res['msg'],$res['status']);
    }
}