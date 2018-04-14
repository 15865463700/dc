<?php
/**
 * User: leixiao
 */
Class Id5Action extends ACommonAction{

    public function index()
    {
        $id5_config = FS("Dynamic/id5");
       // dump($id5_config);
        $this->assign("id5_config",$id5_config);
        $this->display();
    }
    public function save()
    {
        FS("id5",$_POST['id5'],"Dynamic/");
        alogs("id5",0,1,'执行了id5身份验证接口参数的编辑操作！');//管理员操作日志
        $this->success("操作成功",__URL__."/index/");
    }
}