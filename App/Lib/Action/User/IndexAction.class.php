<?php
// 尚贷内核类库，2014-06-11_listam
class IndexAction extends MCommonAction {
    function __construct(){
        parent::__construct();
        $this->cl = new CouponListModel();
        $this->cl->userCouponList($this->uid,2);
        $this->cl->userCouponList($this->uid,11);
    }
    public function index(){
        $m = new MembersModel();
        $mm = new MemberMoneyModel();
        $mfield = $mm->getDetailField();
        $map['mm.uid'] = $this->uid;
        $join[] = "__MEMBER_MONEY_DETAIL__ md on md.uid = mm.uid";
        $searchx = array();
        $searchx['map'] = $map;
        $searchx['limit'] = 1;
        $detail_info = $mm->getList($mfield,$searchx,$join);
        $this->assign("vo",$detail_info);

        $minfo =$m->getMemberInfo($this->uid,'','id,credits,integral');
        $this->assign("minfo",$minfo);

        //判断当前时间（早晨-中午-下午-晚上）
        //信息完整度
        $field = "m.id as uid,m.user_name,m.pin_pass,
        mbank.bank_num as mbank_bank_num,mci.address as mci_address,
        mhi.house_dizhi as mhi_house_dizhi,mdpi.department_name as mdpi_department_name,
        mei.ensuer1_name as mei_ensuer1_name,mfi.fin_house as mfi_fin_house,ms.phone_status,
        id_status,email_status,mi.sex";
        $mmap['id'] = $this->uid;
        $wheres['map'] = $mmap;
        $wheres['limit'] = 1;
        $join = array();
        $join[] = "__MEMBERS_STATUS__ ms ON m.id=ms.uid";
        $join[] = "__MEMBER_BANKS__ mbank ON m.id=mbank.uid";
        $join[] = "__MEMBER_CONTACT_INFO__ mci ON m.id=mci.uid";
        $join[] = "__MEMBER_DEPARTMENT_INFO__ mdpi ON m.id=mdpi.uid";
        $join[] = "__MEMBER_HOUSE_INFO__ mhi ON m.id=mhi.uid";
        $join[] = "__MEMBER_ENSURE_INFO__ mei ON m.id=mei.uid";
        $join[] = "__MEMBER_FINANCIAL_INFO__ mfi ON m.id=mfi.uid";
        $join[] = "__MEMBER_INFO__ mi ON m.id=mi.uid";
        $member_info = $m->getList($field,$wheres,$join);
        $member_info_progress = 0;
        if($member_info['pin_pass'] != "")$member_info_progress += 10;
        if($member_info['sex'] != "")$member_info_progress += 10;
        if($member_info['mci_address'] != "")$member_info_progress += 10;
        if($member_info['mhi_house_dizhi'] != "")$member_info_progress += 10;
        if($member_info['mdpi_department_name'] != "")$member_info_progress += 10;
        if($member_info['mei_ensuer1_name'] != "")$member_info_progress += 10;
        if($member_info['mfi_fin_house'] != "")$member_info_progress += 10;
        if($member_info['phone_status'] == 1)$member_info_progress += 10;
        if($member_info['id_status'] == 1)$member_info_progress += 10;
        if($member_info['email_status'] == 1)$member_info_progress += 10;
        $this->assign("member_info_progress",$member_info_progress);
        //推广奖励
        $sp = new SpreadModel();
        $smap['rid'] = $this->uid;
        $where['map'] = $smap;
        $where['limit'] = 1;
        $sp_field = "count(id) as num,sum(reward) as reward";
        $spread_info = $sp->getList($sp_field,$where);
        $this->assign("spread_info",$spread_info);
        $capital_money_1 = M("borrow_investor")->where("status in (1,4) and investor_uid = {$this->uid} and debt_status < 2")->sum("investor_capital");
        $capital_count_1 = M("borrow_investor")->where("status in (1,4) and investor_uid = {$this->uid} and debt_status < 2")->count();
        $capital_money_2 = M("borrow_investor")->where("status> 5 and investor_uid = {$this->uid} and debt_status < 2")->sum("investor_capital");
        $capital_count_2 = M("borrow_investor")->where("status > 5 and investor_uid = {$this->uid} and debt_status < 2")->count();
        $this->assign("capital_money_1",$capital_money_1);
        $this->assign("capital_money_2",$capital_money_2);
        $this->assign("capital_count_1",$capital_count_1);
        $this->assign("capital_count_2",$capital_count_2);
        $borrow = new BorrowModel();
        $map = array();
        $map['borrow_status'] = 2;
        if($detail_info['capital']>0){
            $map['is_new'] = 0;
        }
        $where = array();
        $where['map'] = $map;
        $where['limit'] = 2;
        $where['order'] = "is_new desc,borrow_interest_rate desc";
        $tuijianlist = $borrow->getList("*",$where);
        $this->assign("tuijianlist",$tuijianlist);

        $prl = new PrivilegeListModel();
        $tqj = $prl->where("uid = {$this->uid} and status = 1")->sum('money');
        $this->assign("tqj",$tqj);
        $this->display();
    }
	/**************新增找回支付密码  2013-10-02  fan*********************************/
		public function getpaypassword(){
		$d['content'] = $this->fetch();
		echo json_encode($d);
	}
	
	//找回支付密码
	public function dogetpaypass(){
		(false!==strpos($_POST['u'],"@"))?$data['user_email'] = text($_POST['u']):$data['user_name'] = text($_POST['u']);
		$vo = M('members')->field('id')->where($data)->find();
		if(is_array($vo)){
			$res = Notice(10,$vo['id']);
			if($res) ajaxmsg();
			else ajaxmsg('',0);
		}else{
			ajaxmsg('',0);
		}
	}
	
	//验证码验证
	public function getpaypasswordverify(){
		$code = text($_GET['vcode']);
		$uk = is_verify(0,$code,10,60*1000);
		if(false===$uk){
			$this->error("验证失败");
		}else{
			session("temp_get_paypass_uid",$uk);
			$this->display('getpaypass');
		}
	}
	
	//设置新支付密码
	public function setnewpaypass(){
		$d['content'] = $this->fetch();
		echo json_encode($d);
	}
	
	//处理支付密码
	public function dosetnewpaypass(){
		$per = C('DB_PREFIX');
		$uid = session("temp_get_paypass_uid");
		$oldpass = M("members")->getFieldById($uid,'pin_pass');
		if($oldpass == md5($_POST['paypass'])){
			$newid = true;
		}else{
			$newid = M()->execute("update {$per}members set `pin_pass`='".md5($_POST['paypass'])."' where id={$uid}");
		}
		
		if($newid){
			session("temp_get_paypass_uid",NULL);
			ajaxmsg();
		}else{
			ajaxmsg('',0);
		}
	}

    //特权金详情
    public function tqj_details(){
        $this->display();
    }


    //特权金统计
    public function summary(){
        $prl = new PrivilegeListModel();
        $field = "*";
        $map['uid'] = $this->uid;
        $where['map'] = $map;
        $where['limit'] = 15;
        $where['order'] = "status asc,add_time desc";

        $list = $prl->getList($field,$where);
        $this->assign("list",$list);
        $this->assign("lstatus",$prl->lstatus);
        $data['html'] = $this->fetch();
        exit(json_encode($data));
    }
}