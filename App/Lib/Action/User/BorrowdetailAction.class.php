<?php
// 尚贷内核类库，2014-06-11_listam
class BorrowdetailAction extends MCommonAction {

    public function index(){
        $this->assign("bid",intval($_GET['id']));
		$this->display();
    }

    public function borrowdetail(){
		$borrow_id = intval($_GET['id']);
        $i = new InvestorDetailModel();
		$list = $i->getRepayList($this->uid,$borrow_id);
		$this->assign("list",$list);
		$data['html'] = $this->fetch();
		exit(json_encode($data));
    }

    public function repayment(){
		$borrow_id = intval($_POST['bid']);
		$sort_order = intval($_POST['sort_order']);
		$vo = M("borrow_info")->field('id')->where("id={$borrow_id} AND borrow_uid={$this->uid}")->find();
		if(!is_array($vo)) ajaxmsg("数据有误",0);
        $b = new BorrowModel();
		$res = $b->repaymentBorrow($this->uid,$borrow_id,$sort_order);
		ajaxmsg($res['msg'],$res['status']);
    }

}