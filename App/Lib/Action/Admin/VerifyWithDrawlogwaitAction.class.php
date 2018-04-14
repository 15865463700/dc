<?php

// 全局设置
class verifywithdrawlogwaitAction extends ACommonAction
{
    private $type;

    public function __construct()
    {
        parent::__construct();
        $this->type = 'withdrawlogwait';
    }

    function doVerify()
    {
        if (!IS_POST)
            $this->error('传输错误');
        $url = '/admin/Withdrawlogwait/index.html';
        if (empty($url))
            $this->error('必须有跳转页');
        $pass = md5($_POST['pass']);

        $model = new PassesModel();
        $where = array('type' => $this->type);
        $oldPass = $model->where($where)->getField('pass');
        if ($oldPass == $pass) {
            session('verifyWithDralogwait', true);
            $this->success('验证成功！', $url);
        } else {
            session('verifyWithDralogwait', false);
            $this->error('验证失败！');
        }
        exit();
    }

    function clearVerify()
    {
        session('verifyWithDralogwait', null);
        $this->redirect('/admin/');
    }

    function verifypass()
    {
        $this->display();
    }

    public function index()
    {
        $this->display();
    }

    public function doEdit()
    {
        if (!IS_POST)
            $this->error('链接失败！');
        $data = $_POST;
        $this->editPass($data['oldPass'], $data['newPass']);
    }

    private function editPass($oldPass, $newPass)
    {
        $model = new PassesModel();
        $where = array('type' => $this->type);
        $oldPass = md5($oldPass);
        $newPass = md5($newPass);

        $modelOldPass = $model->where($where)->getField('pass');
        if (!empty($modelOldPass)) {
//            updata
            if ($modelOldPass == $oldPass) {
                $save = array('pass' => $newPass);
                $req = $model->where($where)->save($save);
                $req ? $this->success('修改成功！')
                    : $this->error('修改失败');
            } else {
                $this->error('原密码不正确');
            }
        } else {
//            add
            $add = array('type' => $this->type, 'pass' => $newPass);
            $req = $model->add($add);
            $req ? $this->success('添加密码成功！')
                : $this->error('添加失败！');
        }
    }

}