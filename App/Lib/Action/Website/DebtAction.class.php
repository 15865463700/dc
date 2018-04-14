<?php
/**
 * 普通标债权转让控制器类
 */
class DebtAction extends HCommonAction
{

    /**
     * 债权转让列表
     *
     */
    public function index()
    {

        $search = array();
        //搜索条件

        if($search['b.borrow_status']==0){
            $search['b.borrow_status']=array("in","2,4,6,7");
        }
        $debt = new DebtModel();
        $field = "d.transfer_price,d.status,(d.capital+d.interest) as money,d.total_period,d.period,
        d.id as debt_id,b.id,b.repayment_type,b.borrow_type,b.password,b.is_tuijian,
        b.is_new,b.borrow_name,b.updata,b.borrow_interest_rate";
        $search['d.status'] = array('in','1,2,4');
        $where['map'] = $search;
        $where['limit'] = 5;
        $where['order'] = "d.status ASC";
        $join[] = "__BORROW_INFO__ b on b.id = d.borrow_id";
        $list = $debt->getList($field,$where,$join);
        foreach($list['list'] as $key=>$v){
            $project_pic=unserialize($v['updata']);
            $list['list'][$key]['project_pic_thumb']=$project_pic[0]['img'];
        }
        $this->assign("list", $list);
        $this->display();
        $debt->cancelDebtValid();
    }

    /**
     * 购买债权提示框
     *
     */
    public function buydebt()
    {
        if(!$this->uid)  ajaxmsg("请先登录",0);
        $debt_id = intval($_REQUEST['debt_id']);
        !$debt_id && ajaxmsg(L('参数错误'),0);

        $debt_model = new DebtModel();
        $field = "transfer_price,(capital+interest) as money,status,sell_uid";
        $debt = $debt_model->field($field)->find($debt_id);
        if($debt['status']!=1){
            ajaxmsg("系统繁忙，请刷新重试",0);
        }
        if($debt['sell_uid']==$this->uid){
            ajaxmsg("不能购买自己的债权",0);
        }
        $m = new MembersModel();
        $minfo = $m->getMemberInfo($this->uid,"Money",'id,pin_pass');
        $account =  $minfo['account_money'] + $minfo['back_money'];
        /**************增加支付密码判断*****************/
        $this->assign("pin_pass",$minfo['pin_pass']);
        /**************增加支付密码判断*****************/
        $this->assign('debt', $debt);
        $this->assign('account', $account);
        $this->assign('debt_id', $debt_id);
        $d['content'] = $this->fetch();
        echo json_encode($d);

    }

    /**
     * 确认购买
     * 流程： 检测购买条件
     * 购买
     */
    public function buy()
    {
        $uid = $this->uid;
        if(!$uid){
            ajaxmsg("请先登录",2);
        }
        $pin_pass = strval($_REQUEST['pin_pass']);
        $debt_id = intval($_REQUEST['debt_id']);

        $m = new MembersModel();
        $chk_pin = $m->checkPinPass($uid,$pin_pass);
        if(!$chk_pin){
            ajaxmsg("支付密码错误",0);
        }
        $debt = new DebtModel();
        $res = $debt->buyDebt($uid,$debt_id);
        ajaxmsg($res['msg'],$res['status']);
    }
}
?>
