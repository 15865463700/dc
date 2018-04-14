<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2015/4/23
 * Time: 15:05
 */
class PrivilegeAction extends HCommonAction{
    function __construct(){
        parent::__construct();
        $this->pri = new PrivilegeModel();
        $this->prl = new PrivilegeListModel();
    }
    public function index(){
        $map = array();
        $field = "*";
        $map['status'] = array('gt',0);
        $where['map'] = $map;
        $where['limit'] = 4;
        $list = $this->pri->getList($field,$where);
        $send_status = 0;
        foreach($list['list'] as $k => $v){
            $list['list'][$k]['conditions'] = unserialize($v['conditions']);
            if($this->uid){
                $send_status = $this->prl->where("uid = {$this->uid} and cid = {$v['id']}")->count();
            }
            $list['list'][$k]['send_status'] = $send_status;
        }
        $this->assign("list",$list);
        $this->display();

    }

	public function gold(){
        $field = "*";
        $map['uid'] = $this->uid;
        $where['map'] = $map;
        $where['limit'] = 'all';
        $where['order'] = "status asc,add_time desc";

        $list = $this->prl->getList($field,$where);
        $this->assign("list",$list);
        $this->assign("lstatus",$this->prl->lstatus);
        $this->display();
    }

    public function receive(){
        $uid=$this->uid;//用户id
        if(!$uid){
            ajaxmsg("请先登录，正在跳转登录页，请稍后。。",2);
        }
        $pid = $_POST['id'];
        if(!$pid){
            ajaxmsg("参数错误",0);
        }
        $res = $this->prl->addList($uid,$pid);
        ajaxmsg($res['msg'],$res['status']);
    }
}