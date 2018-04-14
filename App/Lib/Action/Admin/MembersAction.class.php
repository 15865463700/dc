<?php
// 全局设置
class MembersAction extends ACommonAction
{
    /**
    +----------------------------------------------------------
     * 默认操作
    +----------------------------------------------------------
     */
    public function index()
    {
        $map=array();
        if($_REQUEST['uname']){
            $map['m.user_name'] = array("like",urldecode($_REQUEST['uname'])."%");
            $search['uname'] = urldecode($_REQUEST['uname']);
        }
        if($_REQUEST['realname']){
            $map['mi.real_name'] = urldecode($_REQUEST['realname']);
            $search['realname'] = $_REQUEST['realname'];
        }
        if($_REQUEST['is_vip']=='yes'){
            $map['m.user_leve'] = 1;
            $map['m.time_limit'] = array('gt',time());
            $search['is_vip'] = 'yes';
        }elseif($_REQUEST['is_vip']=='no'){
            $map['_string'] = 'm.user_leve=0 OR m.time_limit<'.time();
            $search['is_vip'] = 'no';
        }

        if($_REQUEST['customer_name']){
            $cusname = urldecode($_REQUEST['customer_name']);
            $kfid = M('ausers')->getFieldByUserName($cusname,'id');
            $map['m.customer_id'] = $kfid;
            $search['customer_name'] = $cusname;
        }
        //}
        if(!empty($_REQUEST['bj']) && !empty($_REQUEST['lx']) && !empty($_REQUEST['money'])){

            if($_REQUEST['lx']=='allmoney'){
                if($_REQUEST['bj']=='gt'){
                    $bj = '>';
                }else if($_REQUEST['bj']=='lt'){
                    $bj = '<';
                }else if($_REQUEST['bj']=='eq'){
                    $bj = '=';
                }
                $map['_string'] = "(mm.account_money+mm.back_money) ".$bj.$_REQUEST['money'];
            }else{
                $map[$_REQUEST['lx']] = array($_REQUEST['bj'],$_REQUEST['money']);
            }
            $search['bj'] = $_REQUEST['bj'];
            $search['lx'] = $_REQUEST['lx'];
            $search['money'] = $_REQUEST['money'];
        }

        if(!empty($_REQUEST['start_time']) && !empty($_REQUEST['end_time'])){
            $timespan = strtotime(urldecode($_REQUEST['start_time'])).",".strtotime(urldecode($_REQUEST['end_time']));
            $map['m.reg_time'] = array("between",$timespan);
            $search['start_time'] = urldecode($_REQUEST['start_time']);
            $search['end_time'] = urldecode($_REQUEST['end_time']);
        }elseif(!empty($_REQUEST['start_time'])){
            $xtime = strtotime(urldecode($_REQUEST['start_time']));
            $map['m.reg_time'] = array("gt",$xtime);
            $search['start_time'] = $xtime;
        }elseif(!empty($_REQUEST['end_time'])){
            $xtime = strtotime(urldecode($_REQUEST['end_time']));
            $map['m.reg_time'] = array("lt",$xtime);
            $search['end_time'] = $xtime;
        }

        $m = new MembersModel();
        $field= 'm.id,m.user_phone,m.reg_time,m.user_name,m.customer_name,m.user_leve,
        m.time_limit,mi.real_name,mm.money_freeze,mm.money_collect,
        (mm.account_money+mm.back_money) account_money,m.user_email,m.recommend_id,
        m.is_borrow,m.is_vip';
        $where['map'] = $map;
        $where['limit'] = C('ADMIN_PAGE_SIZE');
        $join[] = "__MEMBER_MONEY__ mm ON mm.uid=m.id";
        $join[] = "__MEMBER_INFO__ mi ON mi.uid=m.id";
        $list = $m->getList($field,$where,$join);
        $list['list']=$this->_listFilter($list['list']);

        $this->assign("bj", array("gt"=>'大于',"eq"=>'等于',"lt"=>'小于'));
        $this->assign("lx", array("allmoney"=>'可用余额',"mm.money_freeze"=>'冻结金额',"mm.money_collect"=>'待收金额'));
        $this->assign("list", $list['list']);
        $this->assign("pagebar", $list['page']);
        $this->assign("search", $search);
        $this->assign("query", http_build_query($search));

        $this->display();
    }

    public function edit() {
        $m = new MembersModel();
        $id = intval($_REQUEST['id']);
        setBackUrl();
        $link = array('MemberInfo','Bank');
        $vo = $m->getMemberInfo($id,$link,'*');
        $vo['bank_num'] = decode_ts($vo['bank_num'],getcode());
        $this->assign('vo', $vo);
        $this->assign("utype", C('XMEMBER_TYPE'));
        $this->assign("bank_list",$this->gloconf['BANK_NAME']);
        $this->display();
    }

    //添加数据
    public function doEdit() {
        $uid = $_POST['uid'];
        M()->startTrans();
        $m = new MembersModel();
        $data['is_vip'] = $_POST['is_vip'];
        $data['is_transfer'] = $_POST['is_transfer'];
        $data['is_ban'] = $_POST['is_ban'];
        $data['is_borrow'] = $_POST['is_borrow'];
        $data['user_type'] = $_POST['user_type'];
        $data['customer_id'] = $_POST['customer_id'];
        trim($_POST['user_pass']) && $data['user_pass'] = md5(trim($_POST['user_pass']));
        trim($_POST['pin_pass']) && $data['pin_pass'] = md5(trim($_POST['pin_pass']));
        $data['user_email'] = $_POST['user_email'];

        $m_data['address'] = $_POST['address'];
        $m_data['age'] = $_POST['age'];
        $m_data['zy'] = $_POST['zy'];
        $data['MemberInfo'] = $m_data;
        $nid = $m->updateMemberInfo($uid,$data);
        //保存当前数据对象
        if ($nid) { //保存成功
            M()->commit();
            alogs("Members",0,1,'成功执行了会员信息资料的修改操作！');//管理员操作日志
            //成功提示
            $this->assign('jumpUrl', __URL__."/".session('listaction'));
            $this->success(L('修改成功'));
        } else {
            alogs("Members",0,0,'执行会员信息资料的修改操作失败！');//管理员操作日志
            M()->rollback();
            //失败提示
            $this->error(L('修改失败'));
        }
    }

    public function info()
    {
        $m = new MembersModel();

        $field = "m.id,m.id as uid,m.user_name,mbank.bank_num as mbank_bank_num,
	            mi.idcard as mi_idcard,mci.address as mci_address,
	            mhi.house_dizhi as mhi_house_dizhi,mdpi.department_name as mdpi_department_name,
	            mei.ensuer1_name as mei_ensuer1_name,mfi.fin_house as mfi_fin_house";
        $map = array();
        if($_GET['user_name']){
            $map['m.user_name'] = text($_GET['user_name']);
            $search['user_name'] = text($_GET['user_name']);
        }
        $where['map'] = $map;
        $where['limit'] = C('ADMIN_PAGE_SIZE');

        $join[]= "__MEMBER_BANKS__ mbank ON m.id=mbank.uid";
        $join[]= "__MEMBER_CONTACT_INFO__ mci ON m.id=mci.uid";
        $join[]= "__MEMBER_DEPARTMENT_INFO__ mdpi ON m.id=mdpi.uid";
        $join[]= "__MEMBER_HOUSE_INFO__ mhi ON m.id=mhi.uid";
        $join[]= "__MEMBER_ENSURE_INFO__ mei ON m.id=mei.uid";
        $join[]= "__MEMBER_INFO__ mi ON m.id=mi.uid";
        $join[]= "__MEMBER_FINANCIAL_INFO__ mfi ON m.id=mfi.uid";

        $list = $m->getList($field,$where,$join);
        foreach($list['list'] as $key=>$v){
            $is_data = M('member_data_info')->where("uid={$v['uid']}")->count("id");
            $list['list'][$key]['mbank'] = ($v['mbank_bank_num'] != "")?"<span style='color:green'>已填写</span>":"<span style='color:black'>未填写</span>";
            $list['list'][$key]['mci'] = ($v['mci_address'] != "")?"<span style='color:green'>已填写</span>":"<span style='color:black'>未填写</span>";
            $list['list'][$key]['mdi'] = ($is_data > 0)?"<span style='color:green'>已填写(<a href='".U('/admin/memberdata/index')."?uid={$v['uid']}'>查看</a>)</span>":"<span style='color:black'>未填写</span>";
            $list['list'][$key]['mhi'] = ($v['mhi_house_dizhi'] != "")?"<span style='color:green'>已填写</span>":"<span style='color:black'>未填写</span>";
            $list['list'][$key]['mdpi'] = ($v['mdpi_department_name'] != "")?"<span style='color:green'>已填写</span>":"<span style='color:black'>未填写</span>";
            $list['list'][$key]['mei'] = ($v['mei_ensuer1_name'] != "")?"<span style='color:green'>已填写</span>":"<span style='color:black'>未填写</span>";
            $list['list'][$key]['mfi'] = ($v['mfi_fin_house'] != "")?"<span style='color:green'>已填写</span>":"<span style='color:black'>未填写</span>";
            $list['list'][$key]['mi'] = ($v['mi_idcard'] != "")?"<span style='color:green'>已填写</span>":"<span style='color:black'>未填写</span>";
        }
        $this->assign("list",$list['list']);
        $this->assign("pagebar",$list['page']);
        $this->assign("search", $search);
        $this->display();
    }

    public function infowait()
    {
        $m = new MembersModel();
        $Bconfig = require C("APP_ROOT")."Conf/borrow_config.php";
        $field = "ma.id,ma.uid,ma.apply_type,ma.apply_status,ma.add_time,
                m.user_name,mbank.bank_num as mbank_bank_num,
	            mi.idcard as mi_idcard,mci.address as mci_address,
	            mhi.house_dizhi as mhi_house_dizhi,mdpi.department_name as mdpi_department_name,
	            mei.ensuer1_name as mei_ensuer1_name,mfi.fin_house as mfi_fin_house";
        $map = array();
        if($_GET['user_name']){
            $map['m.user_name'] = text($_GET['user_name']);
            $search['user_name'] = text($_GET['user_name']);
        }
        $where['map'] = $map;
        $where['limit'] = C('ADMIN_PAGE_SIZE');
        $join[]= "__MEMBERS__ m ON m.id=ma.uid";
        $join[]= "__MEMBER_BANKS__ mbank ON m.id=mbank.uid";
        $join[]= "__MEMBER_CONTACT_INFO__ mci ON m.id=mci.uid";
        $join[]= "__MEMBER_DEPARTMENT_INFO__ mdpi ON m.id=mdpi.uid";
        $join[]= "__MEMBER_HOUSE_INFO__ mhi ON m.id=mhi.uid";
        $join[]= "__MEMBER_ENSURE_INFO__ mei ON m.id=mei.uid";
        $join[]= "__MEMBER_INFO__ mi ON m.id=mi.uid";
        $join[]= "__MEMBER_FINANCIAL_INFO__ mfi ON m.id=mfi.uid";

        $list = $m->getApplyList($field,$where,$join);
        foreach($list['list'] as $key=>$v){
            $is_data = M('member_data_info')->where("uid={$v['uid']}")->count("id");
            $list['list'][$key]['mbank'] = ($v['mbank_bank_num'] != "")?"<span style='color:green'>已填写</span>":"<span style='color:black'>未填写</span>";
            $list['list'][$key]['mci'] = ($v['mci_address'] != "")?"<span style='color:green'>已填写</span>":"<span style='color:black'>未填写</span>";
            $list['list'][$key]['mdi'] = ($is_data > 0)?"<span style='color:green'>已填写(<a href='".U('/admin/memberdata/index')."?uid={$v['uid']}'>查看</a>)</span>":"<span style='color:black'>未填写</span>";
            $list['list'][$key]['mhi'] = ($v['mhi_house_dizhi'] != "")?"<span style='color:green'>已填写</span>":"<span style='color:black'>未填写</span>";
            $list['list'][$key]['mdpi'] = ($v['mdpi_department_name'] != "")?"<span style='color:green'>已填写</span>":"<span style='color:black'>未填写</span>";
            $list['list'][$key]['mei'] = ($v['mei_ensuer1_name'] != "")?"<span style='color:green'>已填写</span>":"<span style='color:black'>未填写</span>";
            $list['list'][$key]['mfi'] = ($v['mfi_fin_house'] != "")?"<span style='color:green'>已填写</span>":"<span style='color:black'>未填写</span>";
            $list['list'][$key]['mi'] = ($v['mi_idcard'] != "")?"<span style='color:green'>已填写</span>":"<span style='color:black'>未填写</span>";
        }
        $this->assign("aType",$Bconfig['APPLY_TYPE']);
        $this->assign("list",$list['list']);
        $this->assign("pagebar",$list['page']);
        $this->display();
    }

    public function viewinfo()
    {
        $Bconfig = require C("APP_ROOT")."Conf/borrow_config.php";
        $this->assign("aType",$Bconfig['APPLY_TYPE']);
        setBackUrl();
        $id = intval($_GET['id']);
        $vx = M('member_apply')->field(true)->find($id);
        $uid = $vx['uid'];
        $m = new MembersModel();
        $link = array('MemberInfo','Bank','MemberContact','House','MemberDepartment','Ensure','Financial');
        $vo = $m->getMemberInfo($uid,$link,'id');
        $this->assign("vx",$vx);
        $this->assign("vo",$vo);
        $this->assign("id",$id);
        $this->display();
    }

    public function viewinfom()
    {
        $uid = intval($_GET['id']);
        $m = new MembersModel();
        $link = array('MemberInfo','Bank','MemberContact','House','MemberDepartment','Ensure','Financial');
        $vo = $m->getMemberInfo($uid,$link,'id');
        $this->assign("vo",$vo);
        $this->display();
    }

    public function doEditCredit(){
        $id = intval($_POST['id']);
        $uid = intval($_POST['uid']);
        $data['id'] = $id;
        $data['deal_info'] = text($_POST['deal_info']);
        $data['apply_status'] = intval($_POST['apply_status']);
        $data['credit_money'] = floatval($_POST['credit_money']);
        if($data['apply_status']==2){
            $data['credit_money']=0.00;
        }
        $newid = M('member_apply')->save($data);

        if($newid){
            //审核通过后资金授信改动
            if($data['apply_status']==1){
                $m = new MembersModel();
                $c_data = array();
                $vx = M('member_apply')->field(true)->find($id);
                if($vx['apply_type']==1){
                    $c_data['credit_limit'] = array("exp","credit_limit+{$data['credit_money']}");
                    $c_data['credit_cuse'] = array("exp","credit_cuse+{$data['credit_money']}");
                }elseif($vx['apply_type']==2){
                    $c_data['borrow_vouch_limit'] = array("exp","borrow_vouch_limit+{$data['credit_money']}");
                    $c_data['borrow_vouch_cuse'] = array("exp","borrow_vouch_cuse+{$data['credit_money']}");
                }elseif($vx['apply_type']==3){
                    $c_data['invest_vouch_limit'] = array("exp","invest_vouch_limit+{$data['credit_money']}");
                    $c_data['invest_vouch_cuse'] = array("exp","invest_vouch_cuse+{$data['credit_money']}");
                }
                $save_data['Extra'] = $c_data;
                $m->updateMemberInfo($uid,$save_data);
            }//审核通过后资金授信改动
            alogs("Members",0,1,'成功执行了会员资料通过后资金授信改动的审核操作！');//管理员操作日志
            $this->success("审核成功",__URL__."/infowait".session('listaction'));
        }else{
            alogs("Members",0,0,'执行会员资料通过后资金授信改动的审核操作失败！');//管理员操作日志
            $this->error("审核失败");
        }
    }

    public function moneyedit()
    {
        setBackUrl();
        $this->assign("id",intval($_GET['id']));
        $this->display();
    }

    public function doMoneyEdit()
    {
        $id = intval($_POST['id']);
        $uid = $id;
        $info = text($_POST['info']);
        $done=true;
        M()->startTrans();
        $mm = new MemberMoneyModel();
        if(floatval($_POST['account_money'])!=0){
            $done = $mm->updateMemberMoney($uid,2,$_POST['account_money'],$info);
        }
//        $inte = new IntegralModel();
        //修改投资积分
//        if(floatval($_POST['integral'])!=0&&$done){
//            $done = $inte->memberIntegralLog($uid, 2,floatval($_POST['integral']), $info);
//        }
        //修改信用积分
        if(floatval($_POST['credits'])!=0&&$done){
            $done = memberCreditsLog($uid, 14,floatval($_POST['credits']), $info);
        }
        ###################增加修改投资积分和修改信用积分########################

        $this->assign('jumpUrl', __URL__."/index".session('listaction'));
        if($done){
            M()->commit();
            alogs("Members",0,1,'成功执行了会员余额调整的操作！');//管理员操作日志
            $this->success("操作成功");
        }else{
            M()->rollback();
            alogs("Members",0,0,'执行会员余额调整的操作失败！');//管理员操作日志
            $this->error("操作失败");
        }
    }

    public function creditedit()
    {
        setBackUrl();
        $this->assign("id",intval($_GET['id']));
        $this->display();
    }

    public function doCreditEdit()
    {
        $id = intval($_POST['id']);
        M()->startTrans();
        $m = new MembersModel();
        $data['credit_limit'] = array('exp',"credit_limit+{$_POST['credit_limit']}");
        $data['credit_cuse'] = array('exp',"credit_cuse+{$_POST['credit_limit']}");
//        $data['borrow_vouch_limit'] = array('exp',"borrow_vouch_limit+{$_POST['borrow_vouch_limit']}");
//        $data['borrow_vouch_cuse'] = array('exp',"borrow_vouch_cuse+{$_POST['borrow_vouch_limit']}");
//        $data['invest_vouch_limit'] = array('exp',"invest_vouch_limit+{$_POST['invest_vouch_limit']}");
//        $data['invest_vouch_cuse'] = array('exp',"invest_vouch_cuse+{$_POST['invest_vouch_limit']}");
        $save_data['Extra'] = $data;
        !empty($_POST['credits']) && $save_data['credits'] = array('exp',"credits+{$_POST['credits']}");
        $newid  = $m->updateMemberInfo($id,$save_data);
        $this->assign('jumpUrl', __URL__."/index".session('listaction'));
        if($newid){
            M()->commit();
            alogs("Members",0,1,'成功执行了会员授信调整的操作！');//管理员操作日志
            $this->success("操作成功");
        }else{
            M()->rollback();
            alogs("Members",0,0,'执行会员授信调整的操作失败！');//管理员操作日志
            $this->error("操作失败");
        }
    }


    public function _listFilter($list,$type=0){
        $row=array();
        foreach($list as $key=>$v){
            if($v['recommend_id']<>0){
                $v['recommend_name'] = M("members")->getFieldById($v['recommend_id'],"user_name");
            }else{
                $v['recommend_name'] =$type==1?"无推荐人":"<span style='color:#000'>无推荐人</span>";
            }
            if($v['is_vip']==1){
                $v['is_vip'] = $type==1?"内部发标专员":"<span style='color:red'>内部发标专员</span>";
            }else{
                $v['is_vip'] ="个人";
            }
            ($v['user_leve']==1 && $v['time_limit']>time())?$v['user_type'] = ($type==1?"VIP会员":"<span style='color:red'>VIP会员</span>"):$v['user_type'] = "普通会员";
            $row[$key]=$v;
        }
        return $row;
    }

    public function getusername(){
        $uname = M("members")->getFieldById(intval($_POST['uid']),"user_name");
        if($uname) exit(json_encode(array("uname"=>"<span style='color:green'>".$uname."</span>")));
        else exit(json_encode(array("uname"=>"<span style='color:orange'>不存在此会员</span>")));
    }

    public function idcardedit() {
        $m = new MembersModel();
        $id = intval($_REQUEST['id']);
        $vo = $m->getMemberInfo($id,'MemberInfo','id');
        $this->assign('vo', $vo);
        $this->assign("utype", C('XMEMBER_TYPE'));
        $this->display();
    }

    //添加身份证信息
    public function doIdcardEdit() {
        $uid = $_POST['uid'];
        M()->startTrans();
        $m = new MembersModel();
        $data['real_name'] = $_POST['real_name'];
        $data['idcard'] = $_POST['idcard'];
        /////////////////////////////
        if(!empty($_FILES['imgfile']['name'])){
            $this->fix = false;
            //设置上传文件规则
            $this->saveRule = 'uniqid';
            //$this->saveRule = date("YmdHis",time()).rand(0,1000)."_".$model->id;
            $this->savePathNew = C('ADMIN_UPLOAD_DIR').'Idcard/';
            $this->thumbMaxWidth = C('IDCARD_UPLOAD_H');
            $this->thumbMaxHeight = C('IDCARD_UPLOAD_W');
            $info = $this->CUpload();
            $data['card_img'] = $info[0]['savepath'].$info[0]['savename'];
            $data['card_back_img'] = $info[1]['savepath'].$info[1]['savename'];
        }
        $s_data['id_status'] = 1;
        $save_date['MemberInfo'] = $data;
        $save_date['Verify'] = $s_data;
        $nid = $m->updateMemberInfo($uid,$save_date);
        //保存当前数据对象
        if ($nid) { //保存成功
            M()->commit();
            alogs("Members",0,1,'成功执行了会员身份证代传的操作！');//管理员操作日志
            //成功提示
            $this->assign('jumpUrl', __URL__."/".session('listaction'));
            $this->success(L('修改成功'));
        } else {
            M()->rollback();
            alogs("Members",0,0,'执行会员身份证代传的操作失败！');//管理员操作日志
            //失败提示
            $this->error(L('修改失败'));
        }
    }

    //导出会员信息
    public function memberexport(){
        import("ORG.Io.Excel");
        alogs("Charge",0,1,'执行了会员列表导出操作！');//管理员操作日志
        $map=array();
        if($_REQUEST['uname']){
            $map['m.user_name'] = array("like",urldecode($_REQUEST['uname'])."%");
        }
        if($_REQUEST['realname']){
            $map['mi.real_name'] = urldecode($_REQUEST['realname']);
        }
        if($_REQUEST['is_vip']=='yes'){
            $map['m.user_leve'] = 1;
            $map['m.time_limit'] = array('gt',time());
        }elseif($_REQUEST['is_vip']=='no'){
            $map['_string'] = 'm.user_leve=0 OR m.time_limit<'.time();
        }
        if($_REQUEST['customer_name']){
            $cusname = urldecode($_REQUEST['customer_name']);
            $kfid = M('ausers')->getFieldByUserName($cusname,'id');
            $map['m.customer_id'] = $kfid;
        }

        if(!empty($_REQUEST['bj']) && !empty($_REQUEST['lx']) && !empty($_REQUEST['money'])){

            if($_REQUEST['lx']=='allmoney'){
                if($_REQUEST['bj']=='gt'){
                    $bj = '>';
                }else if($_REQUEST['bj']=='lt'){
                    $bj = '<';
                }else if($_REQUEST['bj']=='eq'){
                    $bj = '=';
                }
                $map['_string'] = "(mm.account_money+mm.back_money) ".$bj.$_REQUEST['money'];
            }else{
                $map[$_REQUEST['lx']] = array($_REQUEST['bj'],$_REQUEST['money']);
            }
        }

        if(!empty($_REQUEST['start_time']) && !empty($_REQUEST['end_time'])){
            $timespan = strtotime(urldecode($_REQUEST['start_time'])).",".strtotime(urldecode($_REQUEST['end_time']));
            $map['m.reg_time'] = array("between",$timespan);
        }elseif(!empty($_REQUEST['start_time'])){
            $xtime = strtotime(urldecode($_REQUEST['start_time']));
            $map['m.reg_time'] = array("gt",$xtime);
        }elseif(!empty($_REQUEST['end_time'])){
            $xtime = strtotime(urldecode($_REQUEST['end_time']));
            $map['m.reg_time'] = array("lt",$xtime);
        }

        $m = new MembersModel();
        $field= 'm.id,m.user_phone,m.reg_time,m.user_name,m.customer_name,m.user_leve,
        m.time_limit,mi.real_name,mm.money_freeze,mm.money_collect,
        (mm.account_money+mm.back_money) account_money,m.user_email,m.recommend_id,
        m.is_borrow,m.is_vip';
        $where['map'] = $map;
        $where['limit'] = 'all';
        $join[] = "__MEMBER_MONEY__ mm ON mm.uid=m.id";
        $join[] = "__MEMBER_INFO__ mi ON mi.uid=m.id";
        $list = $m->getList($field,$where,$join);
        $list=$this->_listFilter($list);

        $row=array();
        $row[0]=array('序号','ID','发标身份','用户名','真实姓名','手机号','推荐人','所属客服','会员类型','可用余额','冻结金额','待收金额','注册时间');
        $i=1;
        foreach($list as $v){
            $row[$i]['i'] = $i;
            $row[$i]['uid'] = $v['id'];
            $row[$i]['is_vip'] = $v['is_vip'];
            $row[$i]['user_name'] = $v['user_name'];
            $row[$i]['real_name'] = $v['real_name'];
            $row[$i]['user_phone'] = $v['user_phone'];
            $row[$i]['recommend_name'] = $v['recommend_name'];;
            $row[$i]['customer_name'] = $v['customer_name'];
            $row[$i]['user_type'] = $v['user_type'];
            $row[$i]['account_money'] = $v['account_money'];
            $row[$i]['money_freeze'] = $v['money_freeze'];
            $row[$i]['money_collect'] = $v['money_collect'];
            $row[$i]['reg_time'] = date("Y-m-d H:i:s",$v['reg_time']);
            $i++;
        }

        $xls = new Excel_XML('UTF-8', false, 'datalist');
        $xls->addArray($row);
        $xls->generateXML("datalistcard");
    }

    public function getarea(){
        $rid = intval($_GET['rid']);
        if(empty($rid)) return;
        $map['reid'] = $rid;
        $alist = M('area')->field('id,name')->order('sort_order DESC')->where($map)->select();
        if(count($alist)===0){
            $str="<option value=''>--该地区下无下级地区--</option>\r\n";
        }else{
            foreach($alist as $v){
                $str.="<option value='{$v['id']}'>{$v['name']}</option>\r\n";
            }
        }
        $data['option'] = $str;
        $res = json_encode($data);
        echo $res;
    }
}
?>