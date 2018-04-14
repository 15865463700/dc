<?php
// 全局设置
class VipapplyAction extends ACommonAction
{
    /**
    +----------------------------------------------------------
    * 默认操作
    +----------------------------------------------------------
    */
    public function index()
    {
        $ausers = new AusersModel();
		$map=array();
		if($_REQUEST['uid'] && $_REQUEST['uname']){
			$map['v.uid'] = $_REQUEST['uid'];
			$search['uid'] = $map['v.uid'];	
			$search['uname'] = urldecode($_REQUEST['uname']);	
		}
		
		if($_REQUEST['uname'] && !$search['uid']){
			$map['m.user_name'] = array("like",urldecode($_REQUEST['uname'])."%");
			$search['uname'] = urldecode($_REQUEST['uname']);	
		}
		
		if($_REQUEST['realname']){
			$map['mi.real_name'] = urldecode($_REQUEST['realname']);
			$search['real_name'] = $map['mi.real_name'];	
		}
		
		if($_REQUEST['customer_id']){
			$map['v.kfid'] = $_REQUEST['customer_id'];
			$search['customer_id'] = $map['v.kfid'];	
			//$search['customer_name'] = urldecode($_REQUEST['customer_name']);	
		}
		
		if($_REQUEST['customer_name'] && !$search['customer_id']){
			$cusname = urldecode($_REQUEST['customer_name']);
			$kfid = $ausers->getFieldByUserName($cusname,'id');
			$map['v.kfid'] = $kfid;
			$search['customer_name'] = $cusname;	
			$search['customer_id'] = $kfid;	
		}
		if(isset($_REQUEST['status'])){
			$map['v.status'] = $_REQUEST['status'];
			$search['status'] = $map['v.status'];	
		}
		if(!empty($_REQUEST['start_time']) && !empty($_REQUEST['end_time'])){
			$timespan = strtotime(urldecode($_REQUEST['start_time'])).",".strtotime(urldecode($_REQUEST['end_time']));
			$map['v.add_time'] = array("between",$timespan);
			$search['start_time'] = urldecode($_REQUEST['start_time']);	
			$search['end_time'] = urldecode($_REQUEST['end_time']);	
		}elseif(!empty($_REQUEST['start_time'])){
			$xtime = strtotime(urldecode($_REQUEST['start_time']));
			$map['v.add_time'] = array("gt",$xtime);
			$search['start_time'] = $xtime;	
		}elseif(!empty($_REQUEST['end_time'])){
			$xtime = strtotime(urldecode($_REQUEST['end_time']));
			$map['v.add_time'] = array("lt",$xtime);
			$search['end_time'] = $xtime;	
		}
        $vip = new VipApplyModel();
		$field= 'v.*,m.user_name as uname,mi.real_name';
        $join[] = "__MEMBERS__ m ON m.id=v.uid";
        $join[] = "__MEMBER_INFO__ mi ON mi.uid=v.uid";
        $searchx = array();
        $searchx['map'] = $map;
        $searchx['limit'] = C('ADMIN_PAGE_SIZE');
        $list = $vip->getList($field,$searchx,$join);
        $list['list'] = $this->_listFilter($list['list']);

        $this->assign("status", array('待审核','已通过审核','未通过审核'));
        $this->assign("list", $list['list']);
        $this->assign("pagebar", $list['page']);
        $this->assign("search", $search);
        $this->display();
    }
	public function edit(){
		setBackUrl();
		$id=intval($_GET['id']);
		$aUser = get_admin_name();
        $vip = new VipApplyModel();
		$vo = $vip->find($id);
		if($vo['status']!=0) $this->error("审核过的不能再次审核");
		$vo['kfuname'] = $aUser[$vo['kfid']];
		$vo['uname'] = M('members')->getFieldById($vo['uid'],'user_name');
		$this->assign("vo",$vo);
		$this->display();
	}

	public function doEdit(){
        $deal_info = $_POST['deal_info'];
        $id = intval($_POST['id']);
        $status = $_POST['status'];
        $deal_user = session('admin_id');

        $vip = new VipApplyModel();
        $res = $vip->doVipApply($id,$status,$deal_user,$deal_info);
        if ($res['status']==1) { //保存成功
            //成功提示
            $this->assign('jumpUrl', __URL__."/".session('listaction'));
            $this->success($res['msg']);
        } else {
            //失败提示
            $this->error($res['msg']);
        }
	}

	
	public function _listFilter($list){
		$row=array();
		$aUser = get_admin_name();
		foreach($list as $key=>$v){
			$v['a_kfName'] = $aUser[$v['kfid']];
			$row[$key]=$v;
		}
		return $row;
	}
}
?>