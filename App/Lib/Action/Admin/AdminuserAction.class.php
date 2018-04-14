<?php
// 管理员管理
class AdminuserAction extends ACommonAction
{
    /**
    +----------------------------------------------------------
    * 默认操作
    +----------------------------------------------------------
    */
    public function index()
    {
        $auser = new AusersModel();
        $field = 'id,user_name,u_group_id,real_name,is_ban,area_name,is_kf,qq,phone,user_word';
        $where['order'] = "id DESC,u_group_id DESC";
        $where['limit'] = C('ADMIN_PAGE_SIZE');
        $list = $auser->getList($field,$where);
		$AdminUserList = $list['list'];
		
		$GroupArr = get_group_data();
		foreach($AdminUserList as $key => $v){
			$AdminUserList[$key]['groupname'] = $GroupArr[$v['u_group_id']]['groupname'];
		}

		$this->assign('position', '管理员管理');
		$this->assign('pagebar', $list['page']);
		$this->assign('admin_list', $AdminUserList);
		$this->assign('group_list', $GroupArr);
        $this->display();
    }

    /**
    +----------------------------------------------------------
    * 默认操作
    +----------------------------------------------------------
    */
    public function addAdmin()
    {
	
		$data = $_POST;
        $auser = new AusersModel();
		if(!isset($_POST['uid'])){//新增
			foreach($data as $key => $v){
				if($key == "user_pass") $data[$key] = md5(strtolower($data['user_pass']));
				else $data[$key] = EnHtml($v);
			}
			$data['area_name'] = M("area")->getFieldById(1,'name');
            unset($data['uid']);
			$newid = $auser->add($data);
			if(!$newid>0){
				alogs("AusersAdd",$newid,0,'管理员添加失败！');//管理员操作日志
				$this->error('添加失败，请确认填入数据正确');
				exit;
			}
			alogs("AusersAdd",$newid,1,'管理员添加成功！');//管理员操作日志
			$this->assign('jumpUrl', U('/admin/Adminuser/'));
			$this->success('管理员添加成功');
		}else{
			$data['id'] = intval($_POST['uid']);
			$data['user_pass'] = trim($data['user_pass']);
			if( empty($data['user_pass']) ) unset($data['user_pass']);
			foreach($data as $key => $v){
				if($key == "user_pass") $data[$key] = md5(strtolower($data['user_pass']));
				else $data[$key] = EnHtml($v);
			}
            unset($data['uid']);
			$newid = $auser->save($data);
			if(!$newid>0){
				alogs("AusersEdit",$newid,0,'管理员修改失败！');//管理员操作日志
				$this->error('修改失败，数据没有改动或者改动未成功');
				exit;
			}
			alogs("AusersEdit",$newid,1,'管理员修改成功！');//管理员操作日志
			$this->assign('jumpUrl', U('/admin/Adminuser/'));
			$this->success('管理员修改成功');
		}
		
    }



    public function doDelete()
    {
        $auser = new AusersModel();
		$id=$_REQUEST['idarr'];
		$delnum =$auser->where("id in ({$id})")->delete();
		if($delnum){
			alogs("AusersDel",$id,1,'管理员删除成功！');//管理员操作日志
			$this->success("管理员删除成功",'',$id);
		}else{
			alogs("AusersDel",$id,0,'管理员删除失败！');//管理员操作日志
			$this->success("管理员删除失败");
		}
		
    }
	
	public function header(){
		$kfuid = intval($_GET['id']);
		$this->assign("kfuid",$kfuid);
		$this->display();
	}
	
	public function memberheaderuplad(){
		$uid = intval($_GET['uid']) + 10000000;
		if($uid<=10000000) exit;
		else{
			alogs("AusersEditHead",0,0,'编辑管理员头像！');//管理员操作日志
			redirect("/Style/header/upload.php?uid={$uid}");
		}
		exit;
	}


}
?>
