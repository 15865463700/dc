<?php
// 全局设置
class WithdrawlogAction extends ACommonAction
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
		
		if(isset($_REQUEST['status']) && $_REQUEST['status']!=""){
			$map['w.withdraw_status'] = intval($_REQUEST['status']);
			$search['status'] = intval($_REQUEST['status']);
		}
		
		if($_REQUEST['deal_user']){
			$map['w.deal_user'] = urldecode($_REQUEST['deal_user']);
			$search['deal_user'] = urldecode($_REQUEST['deal_user']);
		}
		
		if(!empty($_REQUEST['bj']) && !empty($_REQUEST['money'])){
			$map['w.withdraw_money'] = array($_REQUEST['bj'],$_REQUEST['money']);
			$search['bj'] = $_REQUEST['bj'];	
			$search['money'] = $_REQUEST['money'];	
		}

		if(!empty($_REQUEST['start_time']) && !empty($_REQUEST['end_time'])){
			$timespan = strtotime(urldecode($_REQUEST['start_time'])).",".strtotime(urldecode($_REQUEST['end_time']));
			$map['w.add_time'] = array("between",$timespan);
			$search['start_time'] = urldecode($_REQUEST['start_time']);	
			$search['end_time'] = urldecode($_REQUEST['end_time']);	
		}elseif(!empty($_REQUEST['start_time'])){
			$xtime = strtotime(urldecode($_REQUEST['end_time']));
			$map['w.add_time'] = array("gt",$xtime);
			$search['start_time'] = $xtime;	
		}elseif(!empty($_REQUEST['end_time'])){
			$xtime = strtotime(urldecode($_REQUEST['end_time']));
			$map['w.add_time'] = array("lt",$xtime);
			$search['end_time'] = $xtime;	
		}

        $w = new WithdrawModel();
        $field = "w.*,m.user_name,mi.real_name";
        $join[] = "__MEMBERS__ m ON w.uid=m.id";
        $join[] = "__MEMBER_INFO__ mi ON w.uid=mi.uid";
        $where['map'] = $map;
        $where['limit'] = C('ADMIN_PAGE_SIZE');

        $list = $w->getList($field,$where,$join);
        foreach($list['list'] as $k => $v){
            $list['list'][$k]['bankNo'] = decode_ts($v['withdraw_bankNo'],getcode());
        }
		$this->assign("bj", array("gt"=>'大于',"eq"=>'等于',"lt"=>'小于'));
        $this->assign("list", $list['list']);
		$this->assign("status",C('WITHDRAW_STATUS'));
        $this->assign("pagebar", $list['page']);
        $this->assign("search", $search);
        $this->assign("query", http_build_query($search));
        $this->display();
    }

/////////////////////////////////
/**
	*提现成功
	*/
	public function withdraw2()
    {
		$map=array();
		if($_REQUEST['uname']){
			$map['m.user_name'] = array("like",urldecode($_REQUEST['uname'])."%");
			$search['uname'] = urldecode($_REQUEST['uname']);	
		}
		
		if($_REQUEST['deal_user']){
			$map['w.deal_user'] = urldecode($_REQUEST['deal_user']);
			$search['deal_user'] = urldecode($_REQUEST['deal_user']);
		}
		
		if(!empty($_REQUEST['bj']) && !empty($_REQUEST['money'])){
			$map['w.withdraw_money'] = array($_REQUEST['bj'],$_REQUEST['money']);
			$search['bj'] = $_REQUEST['bj'];	
			$search['money'] = $_REQUEST['money'];	
		}

		if(!empty($_REQUEST['start_time']) && !empty($_REQUEST['end_time'])){
			$timespan = strtotime(urldecode($_REQUEST['start_time'])).",".strtotime(urldecode($_REQUEST['end_time']));
			$map['w.add_time'] = array("between",$timespan);
			$search['start_time'] = urldecode($_REQUEST['start_time']);	
			$search['end_time'] = urldecode($_REQUEST['end_time']);	
		}elseif(!empty($_REQUEST['start_time'])){
			$xtime = strtotime(urldecode($_REQUEST['end_time']));
			$map['w.add_time'] = array("gt",$xtime);
			$search['start_time'] = $xtime;	
		}elseif(!empty($_REQUEST['end_time'])){
			$xtime = strtotime(urldecode($_REQUEST['end_time']));
			$map['w.add_time'] = array("lt",$xtime);
			$search['end_time'] = $xtime;	
		}
        $map['withdraw_status'] = 2;
		//if(session('admin_is_kf')==1)	$map['m.customer_id'] = session('admin_id');
		
		//分页处理
        $w = new WithdrawModel();
        $field = "w.*,m.user_name,mi.real_name";
        $join[] = "__MEMBERS__ m ON w.uid=m.id";
        $join[] = "__MEMBER_INFO__ mi ON w.uid=mi.uid";
        $where['map'] = $map;
        $where['limit'] = C('ADMIN_PAGE_SIZE');
        $list = $w->getList($field,$where,$join);
        foreach($list['list'] as $k => $v){
            $list['list'][$k]['bankNo'] = decode_ts($v['withdraw_bankNo'],getcode());
        }
        $listType = C('WITHDRAW_STATUS');
		unset($listType[0],$listType[1],$listType[3]);
		$this->assign("bj", array("gt"=>'大于',"eq"=>'等于',"lt"=>'小于'));
        $this->assign("list", $list['list']);
		$this->assign("status",$listType);
        $this->assign("pagebar", $list['page']);
        $this->assign("search", $search);
        $this->assign("query", http_build_query($search));
		
        $this->display();
    }
	/**
	*提现失败
	*/
	public function withdraw3()
    {
		$map=array();
		
		if($_REQUEST['uname']){
			$map['m.user_name'] = array("like",urldecode($_REQUEST['uname'])."%");
			$search['uname'] = urldecode($_REQUEST['uname']);	
		}
		
		if($_REQUEST['deal_user']){
			$map['w.deal_user'] = urldecode($_REQUEST['deal_user']);
			$search['deal_user'] = urldecode($_REQUEST['deal_user']);
		}
		
		if(!empty($_REQUEST['bj']) && !empty($_REQUEST['money'])){
			$map['w.withdraw_money'] = array($_REQUEST['bj'],$_REQUEST['money']);
			$search['bj'] = $_REQUEST['bj'];	
			$search['money'] = $_REQUEST['money'];	
		}

		if(!empty($_REQUEST['start_time']) && !empty($_REQUEST['end_time'])){
			$timespan = strtotime(urldecode($_REQUEST['start_time'])).",".strtotime(urldecode($_REQUEST['end_time']));
			$map['w.add_time'] = array("between",$timespan);
			$search['start_time'] = urldecode($_REQUEST['start_time']);	
			$search['end_time'] = urldecode($_REQUEST['end_time']);	
		}elseif(!empty($_REQUEST['start_time'])){
			$xtime = strtotime(urldecode($_REQUEST['end_time']));
			$map['w.add_time'] = array("gt",$xtime);
			$search['start_time'] = $xtime;	
		}elseif(!empty($_REQUEST['end_time'])){
			$xtime = strtotime(urldecode($_REQUEST['end_time']));
			$map['w.add_time'] = array("lt",$xtime);
			$search['end_time'] = $xtime;	
		}
		//if(session('admin_is_kf')==1)	$map['m.customer_id'] = session('admin_id');
        $map['withdraw_status'] = 3;
        $w = new WithdrawModel();
        $field = "w.*,m.user_name,mi.real_name";
        $join[] = "__MEMBERS__ m ON w.uid=m.id";
        $join[] = "__MEMBER_INFO__ mi ON w.uid=mi.uid";
        $where['map'] = $map;
        $where['limit'] = C('ADMIN_PAGE_SIZE');
        $list = $w->getList($field,$where,$join);
        foreach($list['list'] as $k => $v){
            $list['list'][$k]['bankNo'] = decode_ts($v['withdraw_bankNo'],getcode());
        }
		$listType = C('WITHDRAW_STATUS');
		unset($listType[0],$listType[1],$listType[2]);
		$this->assign("bj", array("gt"=>'大于',"eq"=>'等于',"lt"=>'小于'));
        $this->assign("list", $list['list']);
		$this->assign("status",$listType);
        $this->assign("pagebar", $list['page']);
        $this->assign("search", $search);
        $this->assign("query", http_build_query($search));
		
        $this->display();
    }
    public function duizhang(){
        $id = $_REQUEST["id"];
        $vo = M("member_withdraw")->find($id);
        $ordersn = $vo["reqNo"];
        $SUBMIT_TIME = date("YmdHis",time());
        $id_no = sprintf("%06d",$id);
        $allinpayconfig = FS("Dynamic/allinpay");
        $order = trim($allinpayconfig['allinpay']['MERCHANT_ID']).$SUBMIT_TIME.$id_no;

        $params = array(
            'INFO' => array(
                'TRX_CODE' => '200004',
                'VERSION' => '03',
                'DATA_TYPE' => '2',
                'REQ_SN' =>  $order,
                'USER_NAME' => trim($allinpayconfig['allinpay']['USER_NAME']),
                'USER_PASS' => trim($allinpayconfig['allinpay']['USER_PASS']),
            ),
            'QTRANSREQ' => array(
                'MERCHANT_ID' => trim($allinpayconfig['allinpay']['MERCHANT_ID']),
                'QUERY_SN' => $ordersn,
                'STATUS' => 2,
                'TYPE' => 1
            ),
        );
        require_once(C("APP_ROOT") . "Lib/Pay/allinpay/libs/ArrayXml.class.php");
        require_once(C("APP_ROOT") . "Lib/Pay/allinpay/libs/cURL.class.php");
        require_once(C("APP_ROOT") . "Lib/Pay/allinpay/libs/PhpTools.class.php");
        header('Content-Type: text/html; Charset=UTF-8');
        $tools = new PhpTools();
        $result = $tools->send($params);
        $info = array();

        $info["uname"] = M("members")->getFieldById($vo["uid"],"user_name");
        $info["order"] =  $result["AIPG"]["QTRANSRSP"]["QTDETAIL"]["BATCHID"][0];
        $info["allinpay_code"] =  $result["AIPG"]["INFO"]["RET_CODE"][0];
        $info["allinpay_err"] =  $result["AIPG"]["INFO"]["ERR_MSG"][0];
        $info["end_code"] =  $result["AIPG"]["QTRANSRSP"]["QTDETAIL"]["RET_CODE"][0];
        $info["end_err"] =  $result["AIPG"]["QTRANSRSP"]["QTDETAIL"]["ERR_MSG"][0];
        $info["money"] =  $result["AIPG"]["QTRANSRSP"]["QTDETAIL"]["AMOUNT"][0]/100;
        $info["bank_no"] =  $result["AIPG"]["QTRANSRSP"]["QTDETAIL"]["ACCOUNT_NO"][0];
        $info["name"] =  $result["AIPG"]["QTRANSRSP"]["QTDETAIL"]["ACCOUNT_NAME"][0];

        $this->assign("vo",$info);
        $this->display();
    }
}
?>