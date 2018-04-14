<?php
// 全局设置
class CapitalallAction extends ACommonAction
{
    /**
    +----------------------------------------------------------
    * 默认操作
    +----------------------------------------------------------
    */
    public function index()
    {
        $m = new MembersModel();
        $ms = new MemberStatusModel();
        $md = new MemberMoneyDetailModel();
        $field = "sum(charge) charge,sum(withdraw) withdraw,sum(borrow) borrow,
        sum(repayment_money) repayment_money,
        sum(borrow_freeze-borrow_unfreeze) as borrow_freeze,sum(call_fee) call_fee,
        sum(overdue) overdue,sum(charge_fee) charge_fee,
        sum(borrow_fee) borrow_fee,sum(interest_fee) interest_fee,
        sum(withdraw_fee) withdraw_fee,sum(vip_fee) vip_fee,
        sum(net_interest) net_interest,sum(invest_reward_out) invest_reward_out,
        sum(offline_reward) offline_reward,
        sum(spread_reward) spread_reward,sum(re_invest_reward) re_invest_reward,
        sum(coupon_reward) as coupon_reward,sum(privilege_reward) as privilege_reward,
        sum(transfer_capital) as transfer_capital,
        sum(repay_transfer_money) as repay_transfer_money,
        sum(repay_transfer_interest) as repay_transfer_interest,
        sum(transfer_interest) as transfer_interest
        ";
        $where['limit'] = 1;
        $list = $md->getList($field,$where);
        $list['m_count'] = $m->count('id');
        $list['vip_count'] = $m->where("user_leve = 1 and time_limit > ".time())->count('id');
        $list['id_count'] = $ms->where("id_status = 1")->count();
		$this->assign('list',$list);
        $sub_money = M('borrow_substitute_log')->sum("money");
        $this->assign('sub_money',$sub_money);
        $d= new InvestorDetailModel();
        $map['repayment_time'] = 0;
        $map['status'] = 7;
        $has_expired = $d->where($map)->sum("capital+interest");
        $this->assign('has_expired',$has_expired);
        $map=array();
        $map['repayment_time'] = array('gt',0);
        $map['substitute_money'] = array('gt',0);
        $expired_money = $d->where($map)->sum("receive_capital+receive_interest");
        $this->assign('expired_money',$expired_money);
        $this->display();
    }

    public function iolist(){
        $map = array();
        if(!empty($_REQUEST['start_time']) && !empty($_REQUEST['end_time'])){
            $start = strtotime(urldecode($_REQUEST['start_time']));
            $end = strtotime(urldecode($_REQUEST['end_time']));
            $s_date = date("Ymd",$start);
            $e_date = date("Ymd",$end);
            $map['date'] = array("between",array($s_date,$e_date));
            $search['start_time'] = urldecode($_REQUEST['start_time']);
            $search['end_time'] = urldecode($_REQUEST['end_time']);
        }elseif(!empty($_REQUEST['start_time'])){
            $xtime = strtotime(urldecode($_REQUEST['start_time']));
            $s_date = date("Ymd",$xtime);
            $map['date'] = array("egt",$s_date);
            $search['start_time'] = $xtime;
        }elseif(!empty($_REQUEST['end_time'])){
            $xtime = strtotime(urldecode($_REQUEST['end_time']));
            $s_date = date("Ymd",$xtime);
            $map['date'] = array("elt",$s_date);
            $search['end_time'] = $xtime;
        }
        $wf = new WebsiteFlowsModel();

        $where['map'] = $map;
        $where['limit'] = C('ADMIN_PAGE_SIZE');
        $field = "*";
        $list = $wf->getList($field,$where);
        foreach ($list['list'] as $k => $v) {
            $list['list'][$k]['date'] = date("Y-m-d",strtotime($v['date']));
        }

        $this->assign('list',$list);
        $this->display();
    }

    public function export(){
        $map = array();
        if(!empty($_REQUEST['start_time']) && !empty($_REQUEST['end_time'])){
            $start = strtotime(urldecode($_REQUEST['start_time']));
            $end = strtotime(urldecode($_REQUEST['end_time']));
            $s_date = date("Ymd",$start);
            $e_date = date("Ymd",$end);
            $map['date'] = array("between",array($s_date,$e_date));
        }elseif(!empty($_REQUEST['start_time'])){
            $xtime = strtotime(urldecode($_REQUEST['start_time']));
            $s_date = date("Ymd",$xtime);
            $map['date'] = array("egt",$s_date);
        }elseif(!empty($_REQUEST['end_time'])){
            $xtime = strtotime(urldecode($_REQUEST['end_time']));
            $s_date = date("Ymd",$xtime);
            $map['date'] = array("elt",$s_date);
        }
        $wf = new WebsiteFlowsModel();

        $where['map'] = $map;
        $where['limit'] = 'all';
        $field = "*";
        $list = $wf->getList($field,$where);

        import("ORG.Io.Excel");
        alogs("CapitalAll",0,1,'执行网站资金进出列表导出操作！');//管理员操作日志
        $row=array();
        $row[0]=array('ID','时间','平台收入','平台支出','今日注册用户数','今日活跃人次',
            '管理员操作(-代表支出)','充值','充值手续费','提现','提现手续费',
            'vip费用','借款管理费','借款服务费','债权转让手续费','逾期罚息',
            '催收费','利息管理费','推广奖励','续投奖励','加息奖励','特权金支出');
        $i=1;
        foreach($list as $k => $v){
            $row[$i]['id'] = $v['id'];
            $date = strtotime(urldecode($_REQUEST['date']));
            $row[$i]['date'] = date("Y-m-d",$date);
            $row[$i]['web_in'] = $v['web_in'];
            $row[$i]['web_out'] = $v['web_out'];
            $row[$i]['reg_num'] = $v['reg_num'];
            $row[$i]['login_num'] = $v['login_num'];
            $row[$i]['admin_options'] = $v['admin_options'];
            $row[$i]['charge'] = $v['charge'];
            $row[$i]['charge_fee'] = $v['charge_fee'];
            $row[$i]['withdraw'] = $v['withdraw'];
            $row[$i]['withdraw_fee'] = $v['withdraw_fee'];
            $row[$i]['vip_fee'] = $v['vip_fee'];
            $row[$i]['borrow_fee'] = $v['borrow_fee'];
            $row[$i]['service_fee'] = $v['service_fee'];
            $row[$i]['debt_fee'] = $v['debt_fee'];
            $row[$i]['overdue'] = $v['overdue'];
            $row[$i]['call_fee'] = $v['call_fee'];
            $row[$i]['interest_fee'] = $v['interest_fee'];
            $row[$i]['spread_reward'] = $v['spread_reward'];
            $row[$i]['re_invest_reward'] = $v['re_invest_reward'];
            $row[$i]['coupon_reward'] = $v['coupon_reward'];
            $row[$i]['privilege_reward'] = $v['privilege_reward'];
            $i++;
        }

        $xls = new Excel_XML('UTF-8', false, 'datalist');
        $xls->addArray($row);
        $xls->generateXML("datalistcard");
    }
	
}
?>