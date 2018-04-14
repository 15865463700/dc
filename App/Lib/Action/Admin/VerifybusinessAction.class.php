<?php


// 全局设置
class VerifybusinessAction extends ACommonAction
{
    /**
     * +----------------------------------------------------------
     * 默认操作
     * +----------------------------------------------------------
     */
    public function index()
    {
        $ausers = new AusersModel();
        $map = array();
        if ($_REQUEST['uid'] && $_REQUEST['uname']) {
            $map['v.uid'] = $_REQUEST['uid'];
            $search['uid'] = $map['v.uid'];
            $search['uname'] = urldecode($_REQUEST['uname']);
        }

        if ($_REQUEST['uname'] && !$search['uid']) {
            $map['m.user_name'] = array("like", urldecode($_REQUEST['uname']) . "%");
            $search['uname'] = urldecode($_REQUEST['uname']);
        }

        if ($_REQUEST['realname']) {
            $map['mi.real_name'] = urldecode($_REQUEST['realname']);
            $search['real_name'] = $map['mi.real_name'];
        }

        if ($_REQUEST['customer_id']) {
            $map['v.kfid'] = $_REQUEST['customer_id'];
            $search['customer_id'] = $map['v.kfid'];
            //$search['customer_name'] = urldecode($_REQUEST['customer_name']);
        }

        if ($_REQUEST['customer_name'] && !$search['customer_id']) {
            $cusname = urldecode($_REQUEST['customer_name']);
            $kfid = $ausers->getFieldByUserName($cusname, 'id');
            $map['v.kfid'] = $kfid;
            $search['customer_name'] = $cusname;
            $search['customer_id'] = $kfid;
        }
        if (isset($_REQUEST['status'])) {
            $map['v.status'] = $_REQUEST['status'];
            $search['status'] = $map['v.status'];
        }
        if (!empty($_REQUEST['start_time']) && !empty($_REQUEST['end_time'])) {
            $timespan = strtotime(urldecode($_REQUEST['start_time'])) . "," . strtotime(urldecode($_REQUEST['end_time']));
            $map['v.add_time'] = array("between", $timespan);
            $search['start_time'] = urldecode($_REQUEST['start_time']);
            $search['end_time'] = urldecode($_REQUEST['end_time']);
        } elseif (!empty($_REQUEST['start_time'])) {
            $xtime = strtotime(urldecode($_REQUEST['start_time']));
            $map['v.add_time'] = array("gt", $xtime);
            $search['start_time'] = $xtime;
        } elseif (!empty($_REQUEST['end_time'])) {
            $xtime = strtotime(urldecode($_REQUEST['end_time']));
            $map['v.add_time'] = array("lt", $xtime);
            $search['end_time'] = $xtime;
        }

        $business = new BusinessApplyModel();

        $list['list'] = $business->select();

        $searchx['limit'] = C('ADMIN_PAGE_SIZE');

        $this->assign("status", array('待审核', '已通过审核', '未通过审核'));
        $this->assign("list", $list['list']);
        $this->assign("pagebar", $list['page']);
        $this->assign("search", $search);
        $this->display();
    }

    public function edit()
    {
        setBackUrl();
        $id = intval($_GET['id']);
        $aUser = get_admin_name();
        $model = new BusinessApplyModel();
        $vo = $model->find($id);
        if ($vo['status'] != 0) $this->error("审核过的不能再次审核");
        $vo['kfuname'] = $aUser[$vo['kfid']];
        $vo['uname'] = M('members')->getFieldById($vo['uid'], 'user_name');
        $this->assign("vo", $vo);
        $this->display();
    }

    public function doEdit()
    {
        $id = intval($_POST['id']);
        $deal_info = $_POST['deal_info'];
        $status = $_POST['status'];
        $deal_user = session('admin_id');
        $del_time = time();

        $save = array(
            'id'=>$id,
            'status'=>$status,
            'deal_time'=>$del_time,
            'deal_user'=>$deal_user,
            'deal_info'=>$deal_info
        );
        $modelBusiness = new BusinessApplyModel();

        $req = array('status'=>0,'msg'=>'error Msg');
        if(!$modelBusiness->save($save)){
            $req['msg']='审核失败！';
        }else{
            $req['status'] = 1;
            $req['msg'] = '审核成功';
        }
        return $req;
    }


    public function _listFilter($list)
    {
        $row = array();
        $aUser = get_admin_name();
        foreach ($list as $key => $v) {
            $v['a_kfName'] = $aUser[$v['kfid']];
            $row[$key] = $v;
        }
        return $row;
    }
}

?>