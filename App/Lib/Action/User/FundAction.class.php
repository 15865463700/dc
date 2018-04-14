<?php
class FundAction extends MCommonAction
{

	public function index()
	{
		$this->display( );
	}
	//回收中优计划
	public function tendbacking()
	{
        $tranIn = new TransferInvestorModel();
        $field = "t.*,m.user_name";
		$map['t.investor_uid'] = $this->uid;
		$map['t.status'] = 1;
        $where['map'] = $map;
        $where['limit'] = 15;
        $join[] = "__MEMBERS__ m on m.id = t.borrow_uid";
        $list = $tranIn->getList($field,$where,$join);
		$this->assign("list", $list['list']);
		$this->assign("pagebar", $list['page']);
		$this->assign("total", M("transfer_borrow_investor t")->where($map)->sum("investor_capital"));
		$this->assign("num", $list['count']);
		$data['html'] = $this->fetch();
		exit(json_encode($data));
	}
    //已回收优计划
	public function tenddone()
	{
        $tranIn = new TransferInvestorModel();
		$map['t.investor_uid'] = $this->uid;
        $map['_string'] = "t.receive_capital > 0";
        $where['map'] = $map;
        $where['limit'] = 15;
        $field = "t.*,m.user_name";
        $join[] = "__MEMBERS__ m on m.id = t.borrow_uid";
        $list = $tranIn->getList($field,$where,$join);
        $this->assign("list", $list['list']);
        $this->assign("pagebar", $list['page']);
        $this->assign("total", M("transfer_borrow_investor t")->where($map)->sum("investor_capital"));
        $this->assign("num", $list['count']);
		$data['html'] = $this->fetch();
		exit(json_encode($data));
	}


	public function tenddetaildo()
	{
		$map['d.investor_uid'] = $this->uid;
		$map['d.status'] = 1;
		$list = gettdtenderlist( $map,15);
		$this->assign( "list", $list['list']);
		$this->assign( "pagebar", $list['page']);
		$this->assign( "total", $list['total_money']);
		$this->assign( "num", $list['total_num']);
		$data['html'] = $this->fetch();
		exit(json_encode($data));
	}
    //未完成
    public function ajax_detail(){
	    $investid = $_GET['id'];
		$this->assign('investid', $investid);
		$data['content'] = $this->fetch();
		exit(json_encode($data));
	}
	//已完成
	public function ajax_done(){
	    $investid = $_GET['id'];
		$this->assign('investid', $investid);
		$data['content'] = $this->fetch();
		exit(json_encode($data));
	}
	//未完成详情
	public function tenddetail()
	{
		$map['d.investor_uid'] = $this->uid;
		$map['d.status'] = 7;
		$map['d.invest_id'] = $_GET['id'];

		$list = gettdtenderlist($map,10);
		$this->assign("list", $list['list']);
		$this->assign("pagebar", $list['page']);
		$this->assign("total", $list['total_money']);
		$this->assign("num", $list['total_num']);
		//$data['content'] = $this->fetch();
		$this->display();
	}
	//已完成详情
    public function tenddetaildone()
	{
		//$map['d.investor_uid'] = $this->uid;
		$map['d.status'] = 1;
		$map['d.invest_id'] = $_GET['id'];

		$list = gettdtenderlist($map,10);
		$this->assign("list", $list['list']);
		$this->assign("pagebar", $list['page']);
		$this->assign("total", $list['total_money']);
		$this->assign("num", $list['total_num']);
		//$data['content'] = $this->fetch();
		$this->display();
	}
}

?>
