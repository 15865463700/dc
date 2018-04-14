<?php
// +----------------------------------------------------------------------
// | ThinkPHP
// +----------------------------------------------------------------------
// | Copyright (c) 2008 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
// $Id$
/**
 *                             _ooOoo_
 *                            o8888888o
 *                            88" . "88
 *                            (| -_- |)
 *                            O\  =  /O
 *                         ____/`---'\____
 *                       .'  \\|     |//  `.
 *                      /  \\|||  :  |||//  \
 *                     /  _||||| -:- |||||-  \
 *                     |   | \\\  -  /// |   |
 *                     | \_|  ''\---/''  |   |
 *                     \  .-\__  `-`  ___/-. /
 *                   ___`. .'  /--.--\  `. . __
 *                ."" '<  `.___\_<|>_/___.'  >'"".
 *               | | :  `- \`.;`\ _ /`;.`/ - ` : | |
 *               \  \ `-.   \_ __\ /__ _/   .-` /  /
 *          ======`-.____`-.___\_____/___.-`____.-'======
 *                             `=---='
 *          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 *                     佛祖保佑        永无BUG
 *            佛曰:
 *                   写字楼里写字间，写字间里程序员；
 *                   程序人员写程序，又拿程序换酒钱。
 *                   酒醒只在网上坐，酒醉还来网下眠；
 *                   酒醉酒醒日复日，网上网下年复年。
 *                   但愿老死电脑间，不愿鞠躬老板前；
 *                   奔驰宝马贵者趣，公交自行程序员。
 *                   别人笑我忒疯癫，我笑自己命太贱；
 *                   不见满街漂亮妹，哪个归得程序员？
*/
// 会员模型
class MemberMoneyModel extends BaseModel {
	protected $tableName = 'member_money';
    protected $pk = 'uid';

    public function getList($field = '*',$obj = array(),$join = array()){

        $map = $obj['map'];
        $group = $obj['group'];
        $order = $obj['order'];
        $limit = $obj['limit'];

        $per = C('DB_PREFIX');
        $table = "{$per}".$this->tableName;
        if($order==''){
            $order = '`uid` desc';
            if(is_array($join)){
                $order = 'mm.`uid` desc';
            }
        }
        if(is_array($join)){
            $table = "{$per}".$this->tableName.' as mm';
        }
        return $this->_getList($field,$table,$map,$join,$group,$order,$limit);
    }

    public function updateMemberMoney($uid,$type_save,$amoney,$remark,$target_uid=0,$order=''){
        $xva = floatval($amoney);
        if(empty($xva)) return true;
        $done = false;
        $field = "money_freeze,money_collect,account_money,back_money";
        $MM = $this->field($field)->lock(true)->find($uid);

        $m = new MembersModel();
        if(empty($target_uid)){
            $tname = '@网站管理员@';
        }else{
            $tname = $m->getFieldById($target_uid,'user_name');
        }
        $type = $type_save;
        $type_save == 177 && $type = 17;
        $type_save == 171 && $type = 11;
        $type_save == 172 && $type = 12;
        $type_save == 173 && $type = 73;

        $data['uid'] = $uid;
        $data['info'] = $remark;
        $data['type'] = $type;
        $data['target_uid'] = $target_uid;
        $data['target_uname'] = $tname;
        $data['add_time'] = time();
        $data['add_ip'] = get_client_ip();
        $o = new OrderListModel();
        $res = $o->getBackMoney($order);
        $flag = 0;
        $fee = 0;
        switch($type){
            case 5://vip申请
            case 8://投标冻结
            case 21://提现冻结
            case 60://提现冻结
                $data['affect_money'] = $amoney;
                if(($MM['back_money']+$amoney)<=0){
                    $data['back_money'] = 0;
                    $data['account_money'] = $MM['account_money']+$MM['back_money']+$amoney;
                }else{
                    $data['account_money'] = $MM['account_money'];
                    $data['back_money'] = $MM['back_money']+$amoney;
                }
                $data['collect_money'] = $MM['money_collect'];
                $data['freeze_money'] = $MM['money_freeze']-$amoney;
                $flag = 1;
                break;
            case 19://借款保证金冻结
            case 52://续投奖励
                $data['affect_money'] = $amoney;
                $data['account_money'] = $MM['account_money']+$amoney;
                $data['back_money'] = $MM['back_money'];
                $data['collect_money'] = $MM['money_collect'];
                $data['freeze_money'] = $MM['money_freeze']-$amoney;
                break;
            case 6://vip申请通过
            case 22://提现成功
            case 51://续投预奖励冻结
            case 53://续投预奖励撤销
//            case 202://管理员操作冻结
                $data['affect_money'] = $amoney;
                $data['account_money'] = $MM['account_money'];
                $data['back_money'] = $MM['back_money'];
                $data['collect_money'] = $MM['money_collect'];
                $data['freeze_money'] = $MM['money_freeze']+$amoney;
                break;
            case 7://vip审核不通过
            case 23://提现撤销
            case 24://提现失败
            case 26://解冻保证金
            case 30://流标返还
            case 31://复审未通过返还
                $data['affect_money'] = $amoney;
                if(!empty($res)){
                    $data['account_money'] = $MM['account_money']+$res['account_money'];
                    $data['back_money'] = $MM['back_money']+$res['back_money'];
                }else{
                    $data['account_money'] = $MM['account_money']+$amoney;
                    $data['back_money'] = $MM['back_money'];
                }
                $data['collect_money'] = $MM['money_collect'];
                $data['freeze_money'] = $MM['money_freeze']-$amoney;
                break;
            case 9://投标成功本金解冻
            case 61://投标成功本金解冻
                $data['affect_money'] = $amoney;
                $data['account_money'] = $MM['account_money'];
                $data['back_money'] = $MM['back_money'];
                $data['collect_money'] = $MM['money_collect']+$amoney;
                $data['freeze_money'] = $MM['money_freeze']-$amoney;
                break;
            case 10://应收利息变为待收
            case 62://应收利息变为待收
            case 44://购买债权，待收增加
            case 45://出售债权，待收减少
//            case 203://管理员操作待收
                $data['affect_money'] = $amoney;
                $data['account_money'] = $MM['account_money'];
                $data['back_money'] = $MM['back_money'];
                $data['collect_money'] = $MM['money_collect']+$amoney;
                $data['freeze_money'] = $MM['money_freeze'];
                break;
            case 13://待收本金变回款
            case 14://待收利息变回款
            case 64://待收本金变回款
            case 65://待收利息变回款
                $data['affect_money'] = $amoney;
                $data['account_money'] = $MM['account_money'];
                $data['back_money'] = $MM['back_money']+$amoney;
                $data['collect_money'] = $MM['money_collect']-$amoney;
                $data['freeze_money'] = $MM['money_freeze'];
                break;
            case 2://管理员操作
            case 3://充值
            case 4://充值手续费
            case 17://借款入账
            case 18://借款管理费
            case 20://借款服务费
            case 50://推广奖励
            case 54://投标奖励
            case 56://线下充值奖励
            case 57://加息奖励
            case 58://特权金收益
            case 63://优计划续投奖励
                $data['affect_money'] = $amoney;
                if(($MM['account_money']+$amoney)<=0){
                    $data['account_money'] = 0;
                    $data['back_money'] = $MM['account_money']+$MM['back_money']+$amoney;
                }else{
                    $data['back_money'] = $MM['back_money'];
                    $data['account_money'] = $MM['account_money']+$amoney;
                }
                $data['collect_money'] = $MM['money_collect'];
                $data['freeze_money'] = $MM['money_freeze'];
                break;
            default:
                $data['affect_money'] = $amoney;
                if(($MM['back_money']+$amoney)<=0){
                    $data['back_money'] = 0;
                    $data['account_money'] = $MM['account_money']+$MM['back_money']+$amoney;
                }else{
                    $data['back_money'] = $MM['back_money']+$amoney;
                    $data['account_money'] = $MM['account_money'];
                }
                $data['collect_money'] = $MM['money_collect'];
                $data['freeze_money'] = $MM['money_freeze'];
                break;

        }
        $flag==1 && abs($amoney) >= $MM['back_money'] && $back_money = $MM['back_money'];
        $flag==1 && abs($amoney) < $MM['back_money'] && $back_money = abs($amoney);
        $flag==1 && $order && $o->addLog($order,abs($amoney),$back_money);
        $ml = new MoneyLogModel();
        $resx = $ml->add($data);
        if($resx){
            $mmoney['money_freeze']=$data['freeze_money'];
            $mmoney['money_collect']=$data['collect_money'];
            $mmoney['account_money']=$data['account_money'];
            $mmoney['back_money']=$data['back_money'];
            $xid = $this->where("uid={$uid}")->save($mmoney);
            if($xid){
                $type_save == 22 && $fee = $o->getWithdrawFee($order);
                if($type_save==44||$type_save==45){
                    $debt = new DebtModel();
                    $where['serialid'] = $order;
                    $fee = $debt->where($where)->getField('interest');
                }
                $this->updateMoneyDetail($uid,$type_save,$amoney,$target_uid,$fee);
                $done = true;
            }
        }
        return $done;
    }

    /**
     * @param $uid
     * @param $type
     * @param $money
     * @param $target_uid
     */
    private function updateMoneyDetail($uid,$type,$money,$target_uid=0,$fee=0){
        $m = new MembersModel();
        $detail = array();
        $target_detail = array();
        switch($type){
            case 2://管理员操作
                $detail['admin_options'] = array('exp',"admin_options+{$money}");
                break;
            case 3://充值
                $detail['charge'] = array('exp',"charge+{$money}");
                break;
            case 4://扣充值手续费
                $detail['charge_fee'] = array('exp',"charge_fee-{$money}");
                break;
            case 5://vip申请
            case 7:
                $detail['vip_fee'] = array('exp',"vip_fee-{$money}");
                break;
            case 8:
                $detail['capital'] = array('exp',"capital-{$money}");
                break;
            case 9:
                $detail['suc_capital'] = array('exp',"suc_capital+{$money}");
                $detail['suc_capital_num'] = array('exp',"suc_capital_num+1");
                break;
            case 10:
                $detail['net_interest'] = array('exp',"net_interest+{$money}");
                $target_detail['wait_pay_interest'] = array('exp',"wait_pay_interest+{$money}");
                break;
            case 11:
                $detail['repayment_money'] = array('exp',"repayment_money-{$money}");
                break;
            case 12:
                $detail['paid_interest'] = array('exp',"paid_interest-{$money}");
                break;
            case 13:
                $detail['receive_capital'] = array('exp',"receive_capital+{$money}");
                break;
            case 14:
                $detail['receive_interest'] = array('exp',"receive_interest+{$money}");
                break;
            case 17:
                $detail['borrow'] = array('exp',"borrow+{$money}");
                break;
            case 18:
                $detail['borrow_fee'] = array('exp',"borrow_fee-{$money}");
                break;
            case 19:
                $detail['borrow_freeze'] = array('exp',"borrow_freeze-{$money}");
                break;
            case 20:
                $detail['borrow_service_fee'] = array('exp',"borrow_service_fee-{$money}");
                break;
            case 21:
            case 23:
            case 24:
                $detail['withdraw_freeze'] = array('exp',"withdraw_freeze-{$money}");
                break;
            case 22:
                $detail['withdraw_freeze'] = array('exp',"withdraw_freeze+{$money}");
                $detail['withdraw'] = array('exp',"withdraw-{$money}");
                $detail['withdraw_fee'] = array('exp',"withdraw_fee+{$fee}");
                break;
            case 26:
                $detail['borrow_unfreeze'] = array('exp',"borrow_unfreeze+{$money}");
                break;
            case 30:
            case 31:
                $detail['refuse_capital'] = array('exp',"refuse_capital+{$money}");
                break;
            case 41:
                $detail['buy_debt'] = array('exp',"buy_debt-{$money}");
                break;
            case 42:
                $detail['sell_debt'] = array('exp',"sell_debt+{$money}");
                break;
            case 43:
                $detail['sell_debt_fee'] = array('exp',"sell_debt_fee-{$money}");
                break;
            case 44:
                $capital = $money-$fee;
                $detail['buy_debt_capital'] = array('exp',"buy_debt_capital+{$capital}");
                $detail['buy_debt_interest'] = array('exp',"buy_debt_interest+{$fee}");
                break;
            case 45:
                $capital = $money+$fee;
                $detail['sell_debt_capital'] = array('exp',"sell_debt_capital-{$capital}");
                $detail['sell_debt_interest'] = array('exp',"sell_debt_interest+{$fee}");
                break;
            case 50:
                $detail['spread_reward'] = array('exp',"spread_reward+{$money}");
                $target_detail['offer_spread_reward'] = array('exp',"offer_spread_reward+{$money}");
                break;
            case 52:
            case 63:
                $detail['re_invest_reward'] = array('exp',"re_invest_reward+{$money}");
                break;
            case 54:
                $detail['invest_reward_in'] = array('exp',"invest_reward_in+{$money}");
                break;
            case 55:
                $detail['invest_reward_out'] = array('exp',"invest_reward_out-{$money}");
                break;
            case 56:
                $detail['offline_reward'] = array('exp',"offline_reward+{$money}");
                break;
            case 57:
                $detail['coupon_reward'] = array('exp',"coupon_reward+{$money}");
                break;
            case 58:
                $detail['privilege_reward'] = array('exp',"privilege_reward+{$money}");
                break;
            case 60:
                $detail['transfer_capital'] = array('exp',"transfer_capital-{$money}");
                $detail['transfer_num'] = array('exp',"transfer_num+1");
                break;
            case 62:
                $detail['transfer_interest'] = array('exp',"transfer_interest+{$money}");
                break;
            case 64:
                $detail['receive_transfer_money'] = array('exp',"receive_transfer_money+{$money}");
                break;
            case 65:
                $detail['receive_transfer_interest'] = array('exp',"receive_transfer_interest+{$money}");
                break;
            case 71:
                $detail['overdue'] = array('exp',"overdue-{$money}");
                break;
            case 72:
                $detail['call_fee'] = array('exp',"call_fee-{$money}");
                break;
            case 73:
                $detail['interest_fee'] = array('exp',"interest_fee-{$money}");
                break;
            case 177:
                $detail['transfer_borrow'] = array('exp',"transfer_borrow+{$money}");
                break;
            case 171:
                $detail['repay_transfer_money'] = array('exp',"repay_transfer_money-{$money}");
                break;
            case 172:
                $detail['repay_transfer_interest'] = array('exp',"repay_transfer_interest-{$money}");
                break;
            case 173:
                $detail['transfer_interest_fee'] = array('exp',"transfer_interest_fee-{$money}");
                break;
            default:
                break;
        }
        $data['MoneyDetail'] = $detail;
        $m->updateMemberInfo($uid,$data);
        if($target_uid&&$target_detail){
            $tdata['MoneyDetail'] = $target_detail;
            $m->updateMemberInfo($target_uid,$tdata);
        }
        $web = new WebsiteFlowsModel();
        $web->upWebsiteFlows($type,$money,$fee=0);

    }

    /**
     * 用户金额明细中sql语句基本查询的内容
     * @param $extra -额外的查询内容
     * @return string
     */
    public function getDetailField($extra = ''){
        $field = "mm.money_collect,mm.money_freeze,
        (mm.account_money+mm.back_money) total_money,md.vip_fee,
        (mm.account_money+mm.back_money+mm.money_freeze+mm.money_collect) total,
        md.withdraw_fee,md.charge_fee,md.charge,md.withdraw,
        (md.suc_capital-md.receive_capital-md.sell_debt_capital+md.buy_debt_capital+md.transfer_capital-md.receive_transfer_money) dsbj,
        (md.net_interest-md.receive_interest-md.sell_debt_interest+md.buy_debt_interest+md.transfer_interest-md.receive_transfer_interest) dslx,
        (md.borrow-md.repayment_money+md.transfer_borrow-md.repay_transfer_money) dfbj,
        (md.wait_pay_interest-md.paid_interest) dflx,
        md.invest_reward_in,md.invest_reward_out,md.spread_reward,md.offline_reward,
        (md.borrow_fee+md.borrow_service_fee+md.interest_fee+md.transfer_interest_fee) commission,
        md.re_invest_reward,md.privilege_reward,md.coupon_reward,
        (md.receive_interest-md.interest_fee+md.receive_transfer_interest-md.transfer_interest_fee) jzlx,
        (md.paid_interest+md.repay_transfer_interest) as paid_interest,
        (md.overdue+md.call_fee) overdue,(md.suc_capital+md.transfer_capital) suc_capital,(md.borrow+md.transfer_borrow) borrow,md.borrow_fee,
        (md.receive_interest-md.interest_fee-md.paid_interest-
        md.vip_fee-md.borrow_fee-md.overdue-md.call_fee-md.withdraw_fee-md.charge_fee+md.re_invest_reward+
        md.invest_reward_in+md.spread_reward-md.invest_reward_out+md.offline_reward-md.repay_transfer_interest
        +md.receive_transfer_interest-md.transfer_interest_fee) total_o_i";
        $extra && $field .=",".$extra;
        return $field;
    }
}
?>