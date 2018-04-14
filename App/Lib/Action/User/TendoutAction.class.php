<?php
// 尚贷内核类库，2014-06-11_listam
class TendoutAction extends MCommonAction {

    public function index(){
		$this->display();
    }
	 public function tindex(){
		$this->display();
    }
    private function get_list($map){
        $bi = new BorrowInvestorModel();
        $field = "bi.*,m.user_name,b.borrow_interest_rate,b.total,b.borrow_money,b.borrow_duration";
        $where['map'] = $map;
        $where['limit'] = 15;
        $join[] = "__BORROW_INFO__ b ON b.id=bi.borrow_id";
        $join[] = "__MEMBERS__ m ON m.id=b.borrow_uid";
        $list = $bi->getList($field,$where,$join);
        return $list;
    }
	
	public function tending(){
        $uid = $this->uid;
        $map['bi.investor_uid'] = $uid;
        $map['bi.status'] = 1;
        $list = $this->get_list($map);
		$this->assign("list",$list['list']);
		$this->assign("pagebar",$list['page']);
        $md = new MemberMoneyDetailModel();
        $total = $md->where("uid = {$uid}")->sum("capital-suc_capital-refuse_capital");
		$this->assign("total",$total);
		$this->assign("num",$list['count']);
		$data['html'] = $this->fetch();
		exit(json_encode($data));
	}

	public function tendbacking(){
        $uid = $this->uid;
        $map['bi.investor_uid'] = $uid;
		$map['bi.status'] = 4;
        $list = $this->get_list($map);
        foreach($list['list'] as $key=>$v){
            $vx = M('investor_detail')
                ->field('deadline')
                ->where("borrow_id={$v['borrow_id']} and status=7")
                ->order("deadline ASC")->find();
            $list['list'][$key]['repayment_time'] = $vx['deadline'];
            $has_pay = M("investor_detail")
                ->where("invest_id = {$v['id']} and (repayment_time > 0 || substitute_money > 0)")
                ->count();
            $list['list'][$key]['back'] = $has_pay;
        }
		$this->assign("list",$list['list']);
		$this->assign("pagebar",$list['page']);
        $this->assign("total",$list['total']);
        $this->assign("num",$list['count']);
        $this->assign('uid', $uid);
		$data['html'] = $this->fetch();
		exit(json_encode($data));
	}

	public function tenddone(){
        $uid = $this->uid;
		$map['bi.investor_uid'] = $uid;
		$map['bi.status'] = array("in","5,6");
        $list = $this->get_list($map);
        foreach($list['list'] as $key=>$v){
            $capital = M('investor_detail')
                ->field("sum(receive_capital) as receive_capital,sum(receive_interest) as receive_interest")
                ->where("invest_id={$v['id']} and investor_uid = {$v['investor_uid']}")
                ->find();
            $list['list'][$key]['receive_capital'] = $capital['receive_capital'];
            $list['list'][$key]['receive_interest'] = $capital['receive_interest'];
            $capital_ = M('investor_detail')
                ->field("sum(receive_capital) as receive_capital,
                sum(receive_interest) as receive_interest")
                ->where("invest_id={$v['id']} and investor_uid = {$v['debt_uid']}")
                ->find();
            $list['list'][$key]['debt_capital'] = $capital_['receive_capital'];
            $list['list'][$key]['debt_interest'] = $capital_['receive_interest'];
        }
		$this->assign("list",$list['list']);
		$this->assign("pagebar",$list['page']);
        $md = new MemberMoneyDetailModel();
        $debt_total = $md->where("uid = {$uid}")->sum("sell_debt_capital+sell_debt_interest");
        $total = $md->where("uid = {$uid}")->getField('receive_capital');
        $this->assign("total",$total);
        $this->assign("debt_total",$debt_total);
        $this->assign("num",$list['count']);

		$data['html'] = $this->fetch();
		exit(json_encode($data));
	}

	public function tendbreak(){
        $map=array();
        $map['d.status'] = array("neq",0);
        $map['d.repayment_time'] = 0;
        $map['d.deadline'] = array("between","100000,".time());
        $map['d.investor_uid'] = $this->uid;
        $i = new InvestorDetailModel();
        $field = "m.user_name,d.borrow_id,b.borrow_name,d.status,b.borrow_interest_rate,
		d.total,d.borrow_id,b.borrow_uid,d.sort_order,sum(d.capital) as capital,
		sum(d.interest) as interest,d.deadline,b.borrow_duration,b.repayment_type,d.sort_order";
        $join[] = "__BORROW_INFO__ b ON b.id=d.borrow_id";
        $join[] = "__MEMBERS__ m ON m.id=b.borrow_uid";
        $group = "d.borrow_id asc,d.sort_order asc";
        $searchx = array();
        $searchx['map'] = $map;
        $searchx['limit'] = C('ADMIN_PAGE_SIZE');
        $searchx['group'] = $group;
        $list = $i->getList($field,$searchx,$join);
        foreach($list['list'] as $key=>$v){
            $backday = getExpiredDays($v['deadline']);
            $list['list'][$key]['breakday'] = $backday;
        }
		$this->assign("list",$list['list']);
		$this->assign("pagebar",$list['page']);

		$data['html'] = $this->fetch();
		exit(json_encode($data));
	}

    public function tendoutdetail(){
		$pre = C('DB_PREFIX');
		$status_arr =array('还未还','已还完','已提前还款','迟还','网站代还','逾期还款','','等待还款');
		$investor_id = intval($_GET['id']);
		$vo = M("borrow_investor i")
            ->field("b.borrow_name")
            ->join("{$pre}borrow_info b ON b.id=i.borrow_id")
            ->where("i.investor_uid={$this->uid} AND i.id={$investor_id}")->find();
		if(!is_array($vo)) $this->error("数据有误");
		$map['invest_id'] = $investor_id;
		$list = M('investor_detail')->field(true)->where($map)->select();
        foreach ($list as $key => $v) {
            $list[$key]['debt_status'] = $v['investor_uid']==$this->uid?"":"(已债权转让)";
        }

        $this->assign("status_arr",$status_arr);
		$this->assign("list",$list);
		$this->assign("name",$vo['borrow_name']);
		$this->display();
    }


}