<?php

/**
 * 加息券
 */
class InterestratecouponAction extends HCommonAction
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
        $map['uid'] = $this->uid;
        $where['map'] = $map;
        $where['limit'] = 'all';
        $where['order'] = '`status` asc,id desc';
        $list = $this->coupon_list->getList($field,$where);
        $list = $this->_filterRate($list);
        $this->assign("list", $list);
        $this->assign("lstatus", $this->coupon_list->lstatus);
        $this->display( );
        
    }
}

?>
