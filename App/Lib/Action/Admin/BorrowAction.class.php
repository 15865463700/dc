<?php
// 全局设置
class BorrowAction extends ACommonAction
{

    /**
     * search
     * 发现所有查询一致，故汇总到一个方法里，其他有额外查询项的，单独在自己方法里面写就好了
     * @param $data
     * @return array
     */
    private function search($data){
        if(!empty($data['uname'])&&!$data['uid'] || $data['uname']!=$data['olduname']){
            $uid = M("members")->getFieldByUserName(text($data['uname']),'id');
            $map['b.borrow_uid'] = $uid;
            $searchx['uid'] = $map['b.borrow_uid'];
            $search['uname'] = $data['uname'];
        }
        if( !empty($data['uid'])&&!isset($search['uname']) ){
            $map['b.borrow_uid'] = intval($data['uid']);
            $search['uid'] = $map['b.borrow_uid'];
            $search['uname'] = $data['uname'];
        }

        if(!empty($data['bj']) && !empty($data['money'])){
            $map['b.borrow_money'] = array($data['bj'],$data['money']);
            $search['bj'] = $data['bj'];
            $search['money'] = $data['money'];
        }

        if(!empty($data['start_time']) && !empty($data['end_time'])){
            $timespan = strtotime(urldecode($data['start_time'])).",".strtotime(urldecode($data['end_time']));
            $map['b.add_time'] = array("between",$timespan);
            $search['start_time'] = urldecode($data['start_time']);
            $search['end_time'] = urldecode($data['end_time']);
        }elseif(!empty($data['start_time'])){
            $xtime = strtotime(urldecode($data['start_time']));
            $map['b.add_time'] = array("gt",$xtime);
            $search['start_time'] = $xtime;
        }elseif(!empty($data['end_time'])){
            $xtime = strtotime(urldecode($data['end_time']));
            $map['b.add_time'] = array("lt",$xtime);
            $search['end_time'] = $xtime;
        }

        if($data['customer_id'] && $data['customer_name']){
            $map['m.customer_id'] = $data['customer_id'];
            $search['customer_id'] = $map['m.customer_id'];
            $search['customer_name'] = urldecode($data['customer_name']);
        }

        if($data['customer_name'] && !$search['customer_id']){
            $cusname = urldecode($data['customer_name']);
            $kfid = M('ausers')->getFieldByUserName($cusname,'id');
            $map['m.customer_id'] = $kfid;
            $search['customer_name'] = $cusname;
            $search['customer_id'] = $kfid;
        }
        session('listaction',ACTION_NAME);
        return array('map'=>$map,'search'=>$search);
    }
    /**
    +----------------------------------------------------------
     * 默认操作
    +----------------------------------------------------------
     */
    public function waitverify()
    {
        $res = $this->search($_REQUEST);
        $map = $res['map'];
        $search = $res['search'];
		$map['b.borrow_status'] = 0;
		$field= 'b.id,b.borrow_name,b.borrow_uid,b.borrow_duration,b.borrow_type,
		b.updata,b.borrow_money,b.borrow_fee,b.borrow_interest_rate,b.repayment_type,
		b.add_time,m.user_name,m.id mid,b.is_tuijian,b.money_collect';
        $bm = new BorrowModel();
        $join[] = "__MEMBERS__ m ON m.id=b.borrow_uid";
        $searchx = array();
        $searchx['map'] = $map;
        $searchx['limit'] = C('ADMIN_PAGE_SIZE');
        $list = $bm->getList($field,$searchx,$join);

        $list['list'] = $this->_listFilter($list['list']);

        $this->assign("bj", array("gt"=>'大于',"eq"=>'等于',"lt"=>'小于'));
        $this->assign("list", $list['list']);
        $this->assign("pagebar", $list['page']);
        $this->assign("search", $search);
		$this->assign("xaction",ACTION_NAME);
        $this->assign("query", http_build_query($search));

        $this->display();
    }

    public function waitverify2()
    {
        $res = $this->search($_REQUEST);
        $map = $res['map'];
        $search = $res['search'];
		$map['b.borrow_status'] = 4;
        $field= 'b.id,b.borrow_name,b.borrow_uid,b.borrow_duration,b.borrow_type,
        b.borrow_money,b.has_borrow,b.updata,b.borrow_fee,b.borrow_interest_rate,b.repayment_type,
        b.full_time,m.user_name,m.id mid,b.is_tuijian,b.money_collect';
        $bm = new BorrowModel();
        $join[] = "__MEMBERS__ m ON m.id=b.borrow_uid";
        $searchx = array();
        $searchx['map'] = $map;
        $searchx['limit'] = C('ADMIN_PAGE_SIZE');
        $list = $bm->getList($field,$searchx,$join);

		$list['list'] = $this->_listFilter($list['list']);

        $this->assign("bj", array("gt"=>'大于',"eq"=>'等于',"lt"=>'小于'));
        $this->assign("list", $list['list']);
        $this->assign("pagebar", $list['page']);
        $this->assign("search", $search);
		$this->assign("xaction",ACTION_NAME);
        $this->assign("query", http_build_query($search));

        $this->display();
    }

    public function waitmoney()
    {
        $res = $this->search($_REQUEST);
        $map = $res['map'];
        $search = $res['search'];
		$map['b.borrow_status'] = 2;

		$field= 'b.id,b.borrow_name,b.borrow_uid,b.borrow_duration,b.borrow_type,b.borrow_money,
		b.updata,b.borrow_fee,b.borrow_interest_rate,b.repayment_type,b.add_time,m.user_name,
		m.id mid,b.is_tuijian,b.has_borrow,b.money_collect';
        $bm = new BorrowModel();
        $join[] = "__MEMBERS__ m ON m.id=b.borrow_uid";
        $searchx = array();
        $searchx['map'] = $map;
        $searchx['limit'] = C('ADMIN_PAGE_SIZE');
        $list = $bm->getList($field,$searchx,$join);

        $list['list'] = $this->_listFilter($list['list']);

        $this->assign("bj", array("gt"=>'大于',"eq"=>'等于',"lt"=>'小于'));
        $this->assign("list", $list['list']);
        $this->assign("pagebar", $list['page']);
        $this->assign("search", $search);
		$this->assign("xaction",ACTION_NAME);
        $this->assign("query", http_build_query($search));

        $this->display();
    }

    public function repaymenting()
    {
        $res = $this->search($_REQUEST);
        $map = $res['map'];
        $search = $res['search'];
		$map['b.borrow_status'] = 6;//还款中

		$field= 'm.id as mid,m.customer_name,b.id,b.borrow_name,b.borrow_uid,b.borrow_duration,
		b.borrow_type,b.borrow_money,b.has_borrow,b.borrow_interest,b.repayment_money,
		b.repayment_interest,b.borrow_fee,b.borrow_interest_rate,b.repayment_type,b.deadline,
		m.user_name,m.user_phone,b.is_tuijian,b.money_collect';
        $bm = new BorrowModel();
        $join[] = "__MEMBERS__ m ON m.id=b.borrow_uid";
        $searchx = array();
        $searchx['map'] = $map;
        $searchx['limit'] = C('ADMIN_PAGE_SIZE');
        $list = $bm->getList($field,$searchx,$join);

        $list['list'] = $this->_listFilter($list['list']);
        foreach ($list['list'] as $k => $v) {
            $vx = M('investor_detail')->field('deadline,sort_order,status')->where(" borrow_id={$v['id']} AND status in(4,7) ")->order("deadline ASC")->find();
            $list['list'][$k]['repayment_time'] = $vx['deadline'];
        }
        $this->assign("bj", array("gt"=>'大于',"eq"=>'等于',"lt"=>'小于'));
        $this->assign("list", $list['list']);
        $this->assign("pagebar", $list['page']);
        $this->assign("search", $search);
		$this->assign("xaction",ACTION_NAME);
        $this->assign("query", http_build_query($search));

        $this->display();
    }

	public function unfinish(){
        $res = $this->search($_REQUEST);
        $map = $res['map'];
        $search = $res['search'];
		$map['b.borrow_status'] = 3;

		$field= 'b.id,b.borrow_name,b.borrow_status,b.borrow_uid,b.borrow_duration,
		b.borrow_type,b.borrow_money,b.updata,b.borrow_fee,b.borrow_interest_rate,b.repayment_type,
		b.deadline,m.id mid,m.user_name,v.deal_user_2,v.deal_time_2,v.deal_info_2';
        $bm = new BorrowModel();
        $join[] = "__MEMBERS__ m ON m.id=b.borrow_uid";
        $join[] = "__BORROW_VERIFY__ v ON b.id=v.borrow_id";
        $searchx = array();
        $searchx['map'] = $map;
        $searchx['limit'] = C('ADMIN_PAGE_SIZE');
        $list = $bm->getList($field,$searchx,$join);

        $list['list'] = $this->_listFilter($list['list']);

        $this->assign("bj", array("gt"=>'大于',"eq"=>'等于',"lt"=>'小于'));
        $this->assign("list", $list['list']);
        $this->assign("pagebar", $list['page']);
        $this->assign("search", $search);
		$this->assign("xaction",ACTION_NAME);
        $this->assign("query", http_build_query($search));

        $this->display();
	}


    public function done()
    {
        $res = $this->search($_REQUEST);
        $map = $res['map'];
        $search = $res['search'];
		$map['b.borrow_status'] = array("in","7,9");

		$field= 'b.id,b.borrow_name,b.has_borrow,b.borrow_uid,b.borrow_duration,
		b.borrow_type,b.borrow_money,b.updata,b.borrow_fee,b.borrow_interest_rate,b.repayment_type,
		b.repayment_money,b.deadline,m.id mid,m.user_name';
        $bm = new BorrowModel();
        $join[] = "__MEMBERS__ m ON m.id=b.borrow_uid";
        $searchx = array();
        $searchx['map'] = $map;
        $searchx['limit'] = C('ADMIN_PAGE_SIZE');
        $list = $bm->getList($field,$searchx,$join);

        $list['list'] = $this->_listFilter($list['list']);

        $this->assign("bj", array("gt"=>'大于',"eq"=>'等于',"lt"=>'小于'));
        $this->assign("list", $list['list']);
        $this->assign("pagebar", $list['page']);
        $this->assign("search", $search);
		$this->assign("xaction",ACTION_NAME);
        $this->assign("query", http_build_query($search));

        $this->display();
    }

    public function fail()
    {
        $res = $this->search($_REQUEST);
        $map = $res['map'];
        $search = $res['search'];
		$map['b.borrow_status'] = 1;


		$field= 'b.id,b.borrow_name,b.borrow_status,b.borrow_uid,b.borrow_duration,
		b.borrow_type,b.borrow_money,b.updata,b.borrow_fee,b.borrow_interest_rate,
		b.repayment_type,b.add_time,m.user_name,v.deal_user,v.deal_time,m.id mid,v.deal_info';
        $bm = new BorrowModel();
        $join[] = "__MEMBERS__ m ON m.id=b.borrow_uid";
        $join[] = "__BORROW_VERIFY__ v ON b.id=v.borrow_id";
        $searchx = array();
        $searchx['map'] = $map;
        $searchx['limit'] = C('ADMIN_PAGE_SIZE');
        $list = $bm->getList($field,$searchx,$join);

        $list['list'] = $this->_listFilter($list['list']);

        $this->assign("bj", array("gt"=>'大于',"eq"=>'等于',"lt"=>'小于'));
        $this->assign("list", $list['list']);
        $this->assign("pagebar", $list['page']);
        $this->assign("search", $search);
		$this->assign("xaction",ACTION_NAME);
        $this->assign("query", http_build_query($search));

        $this->display();
    }

    public function fail2()
    {
        $res = $this->search($_REQUEST);
        $map = $res['map'];
        $search = $res['search'];
		$map['b.borrow_status'] = 5;

		$field= 'b.id,b.borrow_name,b.borrow_status,b.borrow_uid,b.borrow_duration,b.borrow_type,
		b.borrow_money,b.updata,b.borrow_fee,b.borrow_interest_rate,b.repayment_type,b.add_time,
		m.user_name,m.id mid,v.deal_user_2,v.deal_time_2,v.deal_info_2';
        $bm = new BorrowModel();
        $join[] = "__MEMBERS__ m ON m.id=b.borrow_uid";
        $join[] = "__BORROW_VERIFY__ v ON b.id=v.borrow_id";
        $searchx = array();
        $searchx['map'] = $map;
        $searchx['limit'] = C('ADMIN_PAGE_SIZE');
        $list = $bm->getList($field,$searchx,$join);

        $list['list'] = $this->_listFilter($list['list']);

        $this->assign("bj", array("gt"=>'大于',"eq"=>'等于',"lt"=>'小于'));
        $this->assign("list", $list['list']);
        $this->assign("pagebar", $list['page']);
        $this->assign("search", $search);
		$this->assign("xaction",ACTION_NAME);
        $this->assign("query", http_build_query($search));

        $this->display();
    }

    public function _editFilter($id)
    {
		$Bconfig = require C("APP_ROOT")."Conf/borrow_config.php";
		$borrow_status = $Bconfig['BORROW_STATUS'];
	 	//$BType = $Bconfig['BORROW_TYPE'];
		switch(strtolower(session('listaction'))){
			case "waitverify":
				for($i=0;$i<=10;$i++){
					if(in_array($i,array("1","2")) ) continue;
					unset($borrow_status[$i]);
				}
			break;
			case "waitverify2":
				for($i=0;$i<=10;$i++){
					if(in_array($i,array("5","6")) ) continue;
					unset($borrow_status[$i]);
				}
			break;
			case "waitmoney":
				for($i=0;$i<=10;$i++){
					if(in_array($i,array("2","3")) ) continue;
					unset($borrow_status[$i]);
				}
			break;
			case "fail":
				unset($borrow_status['3'],$borrow_status['4'],$borrow_status['5']);
			break;
		}
		///////////////////////////////////////////////////////////////////////////////////
		//$danbao = M('article_category')->field('id,type_name')->where("type_name='合作机构资质展示'")->select();

		//$sql = M('article')->field("id,title")->where("type_id =7")->select();//"select id,title from shang_article where type_id =7";
		$danbao = M('article')->field("id,title")->where("type_id =7")->select();//M()->query($sql);
		$dblist = array();
		if(is_array($danbao)){
			foreach($danbao as $key => $v){
				$dblist[$v['id']]=$v['title'];
			}
		}
		$this->assign("danbao_list",$dblist);//新增担保标A+
		//////////////////////////////////////////////////////////////////////////////
		$this->assign('xact',session('listaction'));
		$btype = $Bconfig['REPAYMENT_TYPE'];
		$this->assign("vv",M("borrow_verify")->find($id));
		$this->assign('borrow_status',$borrow_status);
		$this->assign('type_list',$btype);
		$this->assign('borrow_type',$Bconfig['BORROW_TYPE']);
		//setBackUrl(session('listaction'));
    }

	public function _doAddFilter($m){
		if(!empty($_FILES['imgfile']['name'])){
			$this->saveRule = date("YmdHis",time()).rand(0,1000);
			$this->savePathNew = C('ADMIN_UPLOAD_DIR').'Article/' ;
			$this->thumbMaxWidth = C('ARTICLE_UPLOAD_W');
			$this->thumbMaxHeight = C('ARTICLE_UPLOAD_H');
			$info = $this->CUpload();
			$data['art_img'] = $info[0]['savepath'].$info[0]['savename'];
		}
		if($data['art_img']) $m->art_img=$data['art_img'];
		$m->art_time=time();
		if($_POST['is_remote']==1) $m->art_content = get_remote_img($m->art_content);
		return $m;
	}


	public function doEditWaitverify(){

        $m = new BorrowModel();
        $res = $m->doEditBorrow();
        $borrow_id = $_POST['id'];
        if($res['status']){
            alogs("doEditWait",$borrow_id,1,'初审操作成功！');//管理员操作日志
            $this->assign('jumpUrl', __URL__."/".session('listaction'));
            $this->success($res['msg']);
        }else{
            alogs("doEditWait",$borrow_id,0,'初审操作失败！');//管理员操作日志
            $this->error($res['msg']);
        }
	}

	public function doEditWaitverify2(){
        $m = new BorrowModel();
        $res = $m->doEditBorrow();
        $borrow_id = $_POST['id'];
        if($res['status']){
            alogs("borrowApproved",$borrow_id,1,'复审操作成功！');//管理员操作日志
            $this->assign('jumpUrl', __URL__."/".session('listaction'));
            $this->success($res['msg']);
        }else{
            alogs("borrowApproved",$borrow_id,0,'复审操作失败！');//管理员操作日志
            $this->error($res['msg']);
        }
	}

	public function doEditWaitmoney(){
        $m = new BorrowModel();
        $res = $m->doEditBorrow();
        $borrow_id = $_POST['id'];
        $status = $_POST['borrow_status'];
        if($res['status']){
            $status == 3 && alogs("borrowRefuse",$borrow_id,1,'流标操作成功！');//管理员操作日志
            $status == 5 && alogs("borrowing",$borrow_id,1,'招标中的借款操作修改成功！');//管理员操作日志
            $this->assign('jumpUrl', __URL__."/".session('listaction'));
            $this->success($res['msg']);
        }else{
            $status == 3 && alogs("borrowRefuse",$borrow_id,0,'流标操作失败！');//管理员操作日志
            $status == 5 && alogs("borrowing",$borrow_id,0,'招标中的借款操作修改失败！');//管理员操作日志
            $this->error($res['msg']);
        }
	}


	public function doEditFail(){
        $m = D(ucfirst($this->getActionName()));
        if (false === $m->create()) {
            $this->error($m->getError());
        }
		$vm = M('borrow_info')->field('borrow_uid,borrow_status')->find($m->id);
		if($vm['borrow_status']==2 && $m->borrow_status<>2){
			$this->error('已通过审核的借款不能改为别的状态');
			exit;
		}

		foreach($_POST['updata_name'] as $key=>$v){
			$updata[$key]['name'] = $v;
			$updata[$key]['time'] = $_POST['updata_time'][$key];
		}
		$m->borrow_interest = getBorrowInterest($m->repayment_type,$m->borrow_money,$m->borrow_duration,$m->borrow_interest_rate);
		$m->updata = serialize($updata);
		$m->collect_time = strtotime($m->collect_time);
        //保存当前数据对象
        if ($result = $m->save()) { //保存成功
            //成功提示
            $this->assign('jumpUrl', __URL__."/".session('listaction'));
            $this->success(L('修改成功'));
        } else {
            //失败提示
            $this->error(L('修改失败'));
		}
	}


	public function _listFilter($list){
		$Bconfig = require C("APP_ROOT")."Conf/borrow_config.php";
	 	$listType = $Bconfig['REPAYMENT_TYPE'];
	 	$BType = $Bconfig['BORROW_TYPE'];
		$row=array();
		$aUser = get_admin_name();
		foreach($list as $key=>$v){
			$v['repayment_type_num'] = $v['repayment_type'];
			$v['repayment_type'] = $listType[$v['repayment_type']];
			$v['borrow_type'] = $BType[$v['borrow_type']];
			if($v['deadline']) $v['overdue'] = getLeftTime($v['deadline']) * (-1);
			if($v['borrow_status']==1 || $v['borrow_status']==3 || $v['borrow_status']==5){
				$v['deal_uname_2'] = $aUser[$v['deal_user_2']];
				$v['deal_uname'] = $aUser[$v['deal_user']];
			}

			$v['last_money'] = $v['borrow_money']-$v['has_borrow'];//新增剩余金额
			if($v['is_auto']==1){
				$v['is_auto']="自动投标";
			}else{
				$v['is_auto']="手动投标";
			}

			$row[$key]=$v;
		}
		return $row;
	}


	 public function doweek()
    {
        $res = $this->search($_REQUEST);
        $map = $res['map'];
        $search = $res['search'];
		$map['b.borrow_status'] = 6;
		if(!empty($_REQUEST['isShow'])){
			$week_1 = array(strtotime(date("Y-m-d",time())." 00:00:00"),strtotime("+6 day",strtotime(date("Y-m-d",time())." 23:59:59")));//一周内
			$map['b.deadline'] = array("between",$week_1);
		}


		$field= 'b.id,b.borrow_name,b.borrow_uid,b.borrow_duration,b.borrow_type,b.borrow_money,b.borrow_fee,b.borrow_interest_rate,b.repayment_type,b.deadline,m.user_name,m.id mid';
        $bm = new BorrowModel();
        $join[] = "__MEMBERS__ m ON m.id=b.borrow_uid";
        $searchx = array();
        $searchx['map'] = $map;
        $searchx['limit'] = C('ADMIN_PAGE_SIZE');
        $list = $bm->getList($field,$searchx,$join);

        $list['list'] = $this->_listFilter($list['list']);

        $this->assign("bj", array("gt"=>'大于',"eq"=>'等于',"lt"=>'小于'));
        $this->assign("list", $list['list']);
        $this->assign("pagebar", $list['page']);
        $this->assign("search", $search);
		$this->assign("xaction",ACTION_NAME);
        $this->assign("query", http_build_query($search));

        $this->display();
    }

	//swf上传图片
	public function swfUpload(){
		if($_POST['picpath']){
			$imgpath = substr($_POST['picpath'],1);
			if(in_array($imgpath,$_SESSION['imgfiles'])){
					 unlink(C("WEB_ROOT").$imgpath);
					 $thumb = get_thumb_pic($imgpath);
				$res = unlink(C("WEB_ROOT").$thumb);
				if($res) $this->success("删除成功","",$_POST['oid']);
				else $this->error("删除失败","",$_POST['oid']);
			}else{
				$this->error("图片不存在","",$_POST['oid']);
			}
		}else{
			$this->savePathNew = C('ADMIN_UPLOAD_DIR').'Product/' ;
			$this->thumbMaxWidth = C('PRODUCT_UPLOAD_W');
			$this->thumbMaxHeight = C('PRODUCT_UPLOAD_H');
			$this->saveRule = date("YmdHis",time()).rand(0,1000);
			$info = $this->CUpload();
			$data['product_thumb'] = $info[0]['savepath'].$info[0]['savename'];
			if(!isset($_SESSION['count_file'])) $_SESSION['count_file']=1;
			else $_SESSION['count_file']++;
			$_SESSION['imgfiles'][$_SESSION['count_file']] = $data['product_thumb'];
			echo "{$_SESSION['count_file']}:/".$data['product_thumb'];//返回给前台显示缩略图
		}
	}

	//邮件提醒
	  public function tip() {
	  	$id = intval($_REQUEST['id']);
		$vm = M('borrow_info')->field('borrow_uid,borrow_name,borrow_money,repayment_type,deadline')->find($id);
		$borrowName = $vm['borrow_name'];
		$borrowMoney = $vm['borrow_money'];
		if($id){
			Notice(9,$vm['borrow_uid'],array('id'=>$id,'borrowName'=>$borrowName,'borrowMoney'=>$borrowMoney));
			ajaxmsg();
		}
		else ajaxmsg('',0);
	}

	//每个借款标的投资人记录
	 public function doinvest()
    {
		$borrow_id = intval($_REQUEST['borrow_id']);
		$map=array();
        $bi = new BorrowInvestorModel();
		$map['bi.borrow_id'] = $borrow_id;
        $search['borrow_id'] = $borrow_id;
		//分页处理
		$field= 'bi.id bid,b.id,bi.investor_capital,bi.investor_interest,
        bi.invest_fee,bi.add_time,bi.is_auto,m.user_name,m.id mid,m.user_phone,
		b.borrow_duration,b.repayment_type,m.customer_name,b.borrow_type,b.borrow_name';
        $join[] = "__MEMBERS__ m ON m.id=bi.investor_uid";
        $join[] = "__BORROW_INFO__ b ON b.id=bi.borrow_id";
        $searchx = array();
        $searchx['map'] = $map;
        $searchx['limit'] = C('ADMIN_PAGE_SIZE');
        $list = $bi->getList($field,$searchx,$join);
		$list['list'] = $this->_listFilter($list['list']);
        $this->assign("list", $list['list']);
        $this->assign("pagebar", $list['page']);
        $this->assign("query", http_build_query($search));
        $this->display();
    }
    public function export(){

        $map['bi.borrow_id'] = $_REQUEST['borrow_id'];
        $Bconfig = require C("APP_ROOT")."Conf/borrow_config.php";
        $repayment = $Bconfig['REPAYMENT_TYPE'];
        $type = $Bconfig['BORROW_TYPE'];
        $auto = $Bconfig['IS_AUTO'];
        //分页处理
        $bi = new BorrowInvestorModel();
        $field= 'bi.id bid,b.id,bi.investor_capital,bi.investor_interest,bi.invest_fee,bi.add_time,bi.is_auto,m.user_name,m.id mid,m.user_phone,b.borrow_duration,b.repayment_type,m.customer_name,b.borrow_type,b.borrow_name';
        $join[] = "__MEMBERS__ m ON m.id=bi.investor_uid";
        $join[] = "__BORROW_INFO__ b ON b.id=bi.borrow_id";
        $searchx = array();
        $searchx['map'] = $map;
        $searchx['limit'] = 'all';
        $list = $bi->getList($field,$searchx,$join);
        $row=array();
        $row[0]=array('标号','用户名','手机号','客服','标题','投资金额','应得利息','投资期限','投资成交管理费','还款方式','标种类型','投标方式','投资时间');
        $i = 1;
        foreach($list as $v){
            $row[$i]['uid'] = $v['bid'];
            $row[$i]['name'] = $v['user_name'];
            $row[$i]['phone'] = $v['user_phone']==""?"--":$v['user_phone'];
            $row[$i]['kefu'] = $v['customer_name']==""?"--":$v['customer_name'] ;
            $row[$i]['biaoti'] = $v['borrow_name'];
            $row[$i]['money'] = $v['investor_capital'];
            $row[$i]['lixi'] = $v['investor_interest'];
            $str = "个月";
            if($v['repayment_type']==1){
                $str="天";
            }
            $row[$i]['qixian'] = $v['borrow_duration'].$str;
            $row[$i]['fee'] = $v['invest_fee'];

            $row[$i]['repayment'] = $repayment[$v['repayment_type']];
            $row[$i]['biao'] = $type[$v['borrow_type']];
            $row[$i]['is_auto'] = $auto[$v['is_auto']];
            $row[$i]['add_time'] = date("Y-m-d H:i:s",$v['add_time']);
            $i++;
        }
        import("ORG.Io.Excel");
        $xls = new Excel_XML('UTF-8', false, "标".$map['borrow_id']);
        $xls->addArray($row);
        $xls->generateXML('datalistcard');

    }

}
?>
