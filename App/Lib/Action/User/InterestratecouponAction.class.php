<?php

/**
 * 加息券
 */
class InterestratecouponAction extends MCommonAction
{
    function __construct(){
        parent::__construct();
        $this->coupon_list = new CouponListModel();
        $this->coupon = new CouponModel();
        $this->canDay = $this->coupon->canDay;
    }
	public function index()
	{
		$this->display( );
	}

    private function _filterRate($data){
        foreach($data as $k => $v){
            $data[$k]['rate'] = $v['rate']/10;
        }
        return $data;
    }
    /**
     * 未使用加息券
     */
    public function notused()
    {
        $field = "*";
        $map['status'] = 0;
        $map['uid'] = $this->uid;
        $where['map'] = $map;
        $where['limit'] = 20;
        $list = $this->coupon_list->getList($field,$where);
        $list['list'] = $this->_filterRate($list['list']);
        $this->assign("list", $list);
        $this->assign("can_day", $this->canDay);
        $data['html'] = $this->fetch();
        exit(json_encode($data));
    }

    /**
     * 使用中加息券
     */
    public function using()
    {
        $field = "t.*,bi.borrow_name,bii.investor_capital,bii.add_time";
        $map['t.status'] = 1;
        $map['t.uid'] = $this->uid;
        $where['map'] = $map;
        $where['limit'] = 20;
        $join[] = "__BORROW_INFO__ bi on bi.id = t.borrow_id";
        $join[] = "__BORROW_INVESTOR__ bii on bii.id = t.invest_id";
        $list = $this->coupon_list->getList($field,$where,$join);
        $list['list'] = $this->_filterRate($list['list']);
        $this->assign("list", $list);
        $this->assign("can_day", $this->canDay);
        $data['html'] = $this->fetch();
        exit(json_encode($data));
    }

    /**
     * 已使用的加息券
     */
    public function used()
    {
        $field = "t.*,bi.borrow_name,bii.investor_capital,bi.second_verify_time";
        $map['t.status'] = 10;
        $map['t.uid'] = $this->uid;
        $where['map'] = $map;
        $where['limit'] = 20;
        $join[] = "__BORROW_INFO__ bi on bi.id = t.borrow_id";
        $join[] = "__BORROW_INVESTOR__ bii on bii.id = t.invest_id";
        $list = $this->coupon_list->getList($field,$where,$join);
        $list['list'] = $this->_filterRate($list['list']);
        $this->assign("list", $list);
        $this->assign("can_day", $this->canDay);
        $data['html'] = $this->fetch();
        exit(json_encode($data));
    }

    /**
     * 过期的加息券
     */
    public function expire()
    {
        $field = "*";
        $map['status'] = 20;
        $map['uid'] = $this->uid;
        $where['map'] = $map;
        $where['limit'] = 20;
        $list = $this->coupon_list->getList($field,$where);
        $list['list'] = $this->_filterRate($list['list']);
        $this->assign("list", $list);
        $this->assign("can_day", $this->canDay);
        $data['html'] = $this->fetch();
        exit(json_encode($data));
    }
}

?>
