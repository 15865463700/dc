<?php
// 全局设置
class CommonAction extends ACommonAction
{
    public function member(){
		$utype = C('XMEMBER_TYPE');
		$area=get_Area_list();
        $borrowconfig=  require C("ROOT_URL")."Dynamic/borrowconfig.php";
        $data = $borrowconfig['BANK_NAME'];
		$uid=intval($_GET['id']);
        $m = new MembersModel();
        $link = array('MemberInfo','Bank','Money','Extra','MoneyDetail','RepayInfo');
        $field = "id,user_name,is_ban,user_type,credits,customer_name,user_email,integral";
        $vo = $m->getMemberInfo($uid,$link,$field);
        $vo['normal_repay_num'] = $vo['repay_num']-$vo['advance_num']-$vo['late_num']-$vo['web_num']-$vo['exporid_num'];
        $vo['is_ban'] = ($vo['is_ban']==0)?"未冻结":"<span style='color:red'>已冻结</span>";
        $vo['bank_num'] = decode_ts($vo["bank_num"],getcode());
        $b = new BorrowModel();
        $suc_borrow = $b->getBorrowNumInfo($uid);
        $this->assign("suc_borrow",$suc_borrow);
        $this->assign("vo",$vo);
        $this->assign("area",$area);
        $this->assign("data",$data);
        $this->assign("utype",$utype);
        $this->display();
    }
	
	public function sms(){
		$utype = C('XMEMBER_TYPE');
        if(in_array(intval($_GET['tab']), array(1,2,3,4)))  $tab = intval($_GET['tab']);
        else    $tab = 1;

        $this->assign("tab", $tab);
        $this->assign("user_name", text($_GET['user_name']));
        $this->assign("admin_id", $this->admin_id);
        $this->display();
    }

    public function sendsms(){
    	$info = cnsubstr(text($_POST['info']), 500);
    	$title = cnsubstr($info, 20);
    	if ($info == "") 	exit("发送内容不可为空");

        $smsLog['admin_id'] = $_SESSION['admin_id'];
        $smsLog['admin_real_name'] = $_SESSION['admin_user_name'];

        $smsLog['title'] = $title;
        $smsLog['content'] = $info;
        $smsLog['add_time'] = time();

    	if(intval($_POST['sms'])==1){//账户通讯
    		$user_name = text($_POST['user_name']);
    		$type = text($_POST['type']);

    		$user = M('members m')->field(" m.id,m.user_email,m.user_phone,ms.email_status,ms.phone_status ")->join(" shang_members_status ms ON m.id=ms.uid ")->where(" m.user_name = '".$user_name."' ")->find();
    		if (!$user)		exit("找不到用户$user_name");

            if (stripos( $type,"1") && $user['email_status']==1){//邮件
                $sm = sendemail($user['user_email'],$title,$info);
                if($sm) $smsLog['user_email'] = $user['user_email'];
            }

            if (stripos( $type,"2") && $user['phone_status']==1){//短信
                $ss = sendsms($user['user_phone'],$info);
                if($ss) $smsLog['user_phone'] = $user['user_phone'];
            }

            if (stripos( $type,"4")){//站内信
                $si = true;
                addInnerMsg($user['id'],$title,$info);
                $smsLog['user_name'] = $user_name;
            }

            if($sm || $ss || $si){
                M('smslog')->add($smsLog);
				alogs("Smslog",0,1,'成功执行了会员账户通讯通知操作！');//管理员操作日志
                exit("发送成功");
            }else{
				alogs("Smslog",0,0,'执行会员账户通讯通知操作失败！');//管理员操作日志
                exit("发送失败");
            }
    	}elseif(intval($_POST['sms'])==2){//具体通讯
    		$email = text($_POST['email']);
    		$phone = text($_POST['phone']);

    		if ($phone){
                $ss = sendsms($phone,$info);
                if($ss) $smsLog['user_phone'] = $phone;
            }

    		if ($email){
                $sm = sendemail($email,$title,$info);
                if($sm) $smsLog['user_email'] = $email;
            }

            if($sm || $ss ){
                M('smslog')->add($smsLog);
				alogs("Smslog",0,1,'成功执行了单个会员通讯通知操作！');//管理员操作日志
                exit("发送成功");
            }else{
				alogs("Smslog",0,0,'执行单个会员通讯通知操作失败！');//管理员操作日志
                exit("发送失败");
            }
    	}
    }

    public function sendgala(){
        set_time_limit(0);//设置脚本最大执行时间

        $info = cnsubstr(text($_POST['info']),500);
        $title = cnsubstr($info,12);
        if ($info == "")    exit("发送内容不可为空");

        $smsLog['admin_id'] = $_SESSION['admin_id'];
        $smsLog['admin_real_name'] = $_SESSION['admin_user_name'];

        $smsLog['title'] = $title;
        $smsLog['content'] = $info;
        $smsLog['add_time'] = time();

        $type = text($_POST['type']);
        $user_name = intval($_POST['user_name']);

        if ($user_name==2){//VIP会员
            $map = " user_leve=1 AND time_limit>".time();
            $user = "VIP会员";
        }elseif ($user_name==3){//非VIP会员
            $map = " user_leve=0 OR time_limit<".time();
            $user = "非VIP会员";
        }else{//所有会员
            $map = ""; 
            $user = "所有会员";
        }

        if(stripos( $type,"1")) $smsLog['user_email'] = $user;
        if(stripos( $type,"2")) $smsLog['user_phone'] = $user;
        if(stripos( $type,"4")) $smsLog['user_name'] = $user;
        M('smslog')->add($smsLog);
       
        $user = M('members m')->field(" m.id,m.user_email,m.user_phone,ms.email_status,ms.phone_status ")->join(" shang_members_status ms ON m.id=ms.uid ")->where($map)->select();
        
        if (stripos( $type,"4")) {//站内信
            foreach ($user as $k => $v) {
                addInnerMsg($v['id'],$title,$info);
            }
        }


        if (stripos( $type,"2")) {//短信
		foreach ($user as $k => $v) {
			sendsms($v['user_phone'],$info);
			//var_dump("$v,$info");
		}
            // $i= 1;
            // foreach ($user as $k => $v) {
                // if($v['phone_status']==1){
                    // $phone[floor($i/150)] .=$v['user_phone'].",";
                    // $i++;
                // }
            // }
            

            // foreach ($phone as $key2 => $val2) {
                // $val2 = substr($val2, 0, strlen($val2)-1 );
                // sendsms($val2,$info);
                
            // }
        }
		alogs("Smslog",0,1,'对'.$user.'执行通讯通知操作成功！');//管理员操作日志
        exit("发送成功");
    }

    public function smslog(){
        $data = M('ausers')->field("id,real_name")->select();
        foreach ($data as $k => $v) {
            $admin_data[$v['id']] = $v['real_name'];
        }

        if(!empty($_GET['admin_id']))       $map['admin_id'] = intval($_GET['admin_id']);
        if(!empty($_GET['user_name']))      $map['user_name'] = text($_GET['user_name']);
        if(!empty($_GET['user_email']))     $map['user_email'] = text($_GET['user_email']);
        if(!empty($_GET['user_phone']))     $map['user_phone'] = text($_GET['user_phone']);

        //分页处理
        import("ORG.Util.Page");
        $count = M('smslog')->where($map)->count();
        $p = new Page($count, 10);
        $page = $p->show();
        $Lsql = "{$p->firstRow},{$p->listRows}";
        
        $list = M('smslog')->where($map)->order("id desc")->limit($Lsql)->select();
            // ->join("{$per}members m ON m.id=d.borrow_uid")

        $this->assign("page", $page);
        $this->assign("list", $list);
        $this->assign('admin_data',$admin_data);
        $this->assign('map',$map);

        $data['html'] = $this->fetch('smslog_res');
        exit(json_encode($data));
    }

}
?>