<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2015/4/23
 * Time: 14:06
 */
class PrivilegeAction extends ACommonAction {
    function __construct(){
        parent::__construct();
        $this->pri = new PrivilegeModel();
        $this->statusx = $this->pri->status;
        $this->prl = new PrivilegeListModel();
        $this->lstatus = $this->prl->lstatus;
    }

    private function _conditions($data){
        foreach($data as $k => $v){
            $data[$k]['conditions'] = unserialize($v['conditions']);
        }
        return $data;
    }

    public function index(){

        $map = array();
        $field = "*";
        $where['map'] = $map;
        $where['limit'] = C('ADMIN_PAGE_SIZE');
        $list = $this->pri->getList($field,$where);
        $list['list'] = $this->_conditions($list['list']);
        $this->assign("list",$list);
        $this->assign("statusx",$this->statusx);
        $this->display();

    }
    //用户领取记录
    public function record(){

        $map = array();
        if($_REQUEST['id']){
            $map['t.cid'] = $_REQUEST['id'];
        }
        $where['map'] = $map;
        $where['limit'] = C('ADMIN_PAGE_SIZE');
        $where['order'] = 't.status asc,t.add_time desc';
        $join[] = "__MEMBERS__ m on m.id = t.uid";
        $list = $this->prl->getList("t.*,m.user_name",$where,$join);
        $this->assign("list",$list);
        $this->assign("lstatus",$this->lstatus);
        $this->display();
    }

    public function add(){
        if(isset($_POST['submit'])){
            if(empty($_POST['conditions']['principal'])){
                unset($_POST['conditions']['principal']);
            }
            unset($_POST['submit']);
            $pid = $_POST['id'];
            M()->startTrans();
            $res = $this->pri->editPrivilege($_POST,session('adminname'));
            if($res['status'] == 1){
                if($pid){
                    alogs("Privilege",$pid,1,'成功执行了更新特权金的操作！');//管理员操作日志
                }else{
                    alogs("Privilege",0,1,'成功执行了添加特权金的操作！');//管理员操作日志
                }
                M()->commit();
                $this->success("操作成功",'__URL__/index');
            }else{
                M()->rollback();
                if($pid){
                    alogs("Privilege",$pid,0,'更新特权金的操作失败！');//管理员操作日志
                }else{
                    alogs("Privilege",0,0,'添加特权金的操作失败！');//管理员操作日志
                }
                $this->error($res['msg']);
            }
        }else{
            if($_REQUEST['id']){
                $vo = $this->pri->find($_REQUEST['id']);
                $vo['conditions'] = unserialize($vo['conditions']);
                $this->assign('vo',$vo);
            }
            $this->display();
        }
    }

    public function del(){
        $id = $_REQUEST['id'];
        $count = $this->pri->getFieldById($id,'send_count');
        if($count){
            $this->error("领取人数：{$count},不可删除");
        }else{
            $this->pri->delete($id);
            alogs("Privilege",$id,1,'成功执行了删除特权金的操作！');//管理员操作日志
            $this->success("删除成功",'__URL__/index');
        }
    }

}