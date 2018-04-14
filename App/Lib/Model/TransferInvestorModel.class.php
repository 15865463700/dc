<?php
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

/**
 * Class TransferInvestorModel
 * U计划模型
 */
class TransferInvestorModel extends BaseModel
{
    protected $tableName = 'transfer_borrow_investor';
    protected $today_reward_table = 'today_reward';
    protected $pk = 'id';
    protected $_validate = array();
    protected $_link = array(
        'TransferDetail' => array(
            'mapping_type' => HAS_MANY,
            'class_name' => 'TransferDetail',
            'foreign_key' => 'invest_id'
        ),
    );
    protected $online_hours = 3;//默认上线时间$online_hours小时后
    public $repayment_type = array(
        1=>'按月付息到期还本',
        2=>'利息复投'
    );
    public function __construct()
    {
        parent::__construct();
        $this->per = C('DB_PREFIX');
        $this->table = $this->per . $this->tableName . ' as t';
//        $this->fund = new TransferModel();
//        $this->member = new MembersModel();
        $this->mm = new MemberMoneyModel();
        $this->inte = new IntegralModel();
    }

    public function getList($field = '*', $obj = array(), $join = '')
    {
        $map = $obj['map'];
        $group = $obj['group'];
        $order = $obj['order'];
        $limit = $obj['limit'];
        if ($order == '') {
            $order = '`id` desc';
            if (is_array($join)) {
                $order = 't.`id` desc';
            }
        }
        return $this->_getList($field, $this->table, $map, $join, $group, $order, $limit);
    }

    public function investMoney($uid, $borrow_id, $num, $repayment_type, $_is_auto = 0)
    {
        $mber = new MembersModel();
        $done = 0;
        $datag = get_global_setting();
        $fund = new TransferModel();
//        $invest_integral = $datag['invest_integral'];
        $field = "id,per_transfer,borrow_duration,borrow_uid,borrow_interest_rate,
                transfer_total,transfer_out";
        $binfo = $fund->field($field)
            ->find($borrow_id);
        $minfo = $mber->getMemberInfo($uid, "Money", "id,recommend_id,user_name");

        $money = $binfo['per_transfer'] * $num;
        $now = time();
        M()->startTrans();
        $investinfo['status'] = 1;
        $investinfo['borrow_id'] = $borrow_id;
        $investinfo['investor_uid'] = $uid;
        $investinfo['borrow_uid'] = $binfo['borrow_uid'];
        $investinfo['investor_capital'] = $money;
        $investinfo['transfer_num'] = $num;
        $investinfo['transfer_month'] = $binfo['borrow_duration'];
        $investinfo['repayment_type'] = $repayment_type;
        $investinfo['add_time'] = $now;
        $investinfo['is_auto'] = $_is_auto;
        $investinfo['deadline'] = strtotime("+{$binfo['borrow_duration']} month", $now);
        $repayDetail = $this->repayDetail($uid, $money, $binfo, $repayment_type);
        $investinfo['investor_interest'] = $repayDetail['investor_interest'];
        $investinfo['invest_fee'] = $repayDetail['invest_fee'];
        $investinfo['TransferDetail'] = $repayDetail['detail'];
        $investinfo['final_interest_rate'] = $repayDetail['shouyi'];
        $invest_defail_id = $this->addInvestorList($investinfo);
        $tborrow['id'] = $borrow_id;
        $tborrow['transfer_out'] = array("exp", "transfer_out+{$num}");
        $nid = $fund->save($tborrow);
        if ($invest_defail_id && $nid) {
            $res1 = $this->mm->updateMemberMoney($uid, 60, -$money, "对{$borrow_id}号优计划进行投资", $binfo['borrow_uid']);
            $res2 = $this->mm->updateMemberMoney($binfo['borrow_uid'], 177, $money, "第{$borrow_id}号优计划认购成功入账", $uid);
            $res3 = $this->mm->updateMemberMoney($uid, 61, $money, "对{$borrow_id}号优计划投标成功,冻结本金成为待收金额", $binfo['borrow_uid']);
            $res4 = $this->mm->updateMemberMoney($uid, 62, $investinfo['investor_interest'], "对{$borrow_id}号优计划投标成功,应收利息成为待收利息", $binfo['borrow_uid']);
            $res5 = true;
            $recommend_id = $minfo['recommend_id'];
            if ($recommend_id) {
                $_rate = $datag['award_invest'] / 1000;//推广奖励
                $jiangli = getFloatValue($_rate * $investinfo['investor_interest'], 2);
                if ($jiangli > 0) {
                    $res5 = $this->mm->updateMemberMoney($recommend_id, 50, $jiangli, "用户{$minfo['user_name']}对{$borrow_id}号标投资成功，你获得推广奖励{$jiangli}元。", $uid);
                    $sp = new SpreadModel();
                    $sp->upDataSpread($uid, $recommend_id, $money, $jiangli);
                }
            }
            if ($res1 && $res2 && $res3 && $res4 && $res5) {
                //借款天数、还款时间
                $this->preReward($uid,$money,$binfo,$minfo['back_money']);
//                $endTime = strtotime(date("Y-m-d",time()));
//                $deadline_last = $investinfo['deadline'];
//                $getIntegralDays = intval(($deadline_last-$endTime)/3600/24);//借款天数
//                $integ = intval($investinfo['investor_capital']*$getIntegralDays*$invest_integral/1000);//dump($invest_integral);exit;
//                if($integ>0){
//                    $this->inte->memberIntegralLog($uid,2,$integ,"对{$borrow_id}号优计划进行投标，应获积分：".$integ."分,投资金额：".$investinfo['investor_capital']."元,投资天数：".$getIntegralDays."天");
//                    if(isBirth($uid)){
//                        $this->inte->memberIntegralLog($uid,2,$integ,"亲，祝您生日快乐，本站特赠送您{$integ}积分作为礼物，以表祝福。");
//                    }
//                }
                $done = $invest_defail_id;
            }
        }
        if ($done) {
            M()->commit();
        } else {
            M()->rollback();
        }
        return $done;
    }

    /**
     * 还款明细
     * @param $uid
     * @param $money
     * @param $binfo
     * @return mixed
     */
    public function repayDetail($uid, $money, $binfo, $repayment_type)
    {
        $datag = get_global_setting();
        $fee_rate = $datag['fee_invest_manage'] / 100;
        $savedetail = array();
        $monthData['month_times'] = $binfo['borrow_duration'];
        $monthData['account'] = $money;
        $monthData['year_apr'] = $binfo['borrow_interest_rate'];
        $data['shouyi'] = $binfo['borrow_interest_rate'];
        switch ($repayment_type) {
            case 1://每月还息到期还本
                $repay_list = EqualEndMonth($monthData);
                $monthData['type'] = 'all';
                $repay_listx = EqualEndMonth($monthData);
                $data['investor_interest'] = $repay_listx['interest'];
                $i = 1;
                $numl = sizeof($repay_list);
                $usem = 0;
                $interest = 0;
                foreach ($repay_list as $key => $v) {
                    $investDetail['repayment_time'] = 0;
                    $investDetail['borrow_id'] = $binfo['id'];
                    $investDetail['investor_uid'] = $uid;
                    $investDetail['borrow_uid'] = $binfo['borrow_uid'];
                    $investDetail['capital'] = $v['capital'];
                    if ($key == ($numl - 1)) {
                        $investDetail['capital'] = $money - $usem;
                        $investDetail['interest'] = $data['investor_interest'] - $interest;
                    } else {
                        $investDetail['capital'] = $v['capital'];
                        $investDetail['interest'] = $v['interest'];
                        $usem += $v['capital'];
                        $interest += $v['interest'];
                    }
                    $investDetail['interest_fee'] = getFloatValue($fee_rate * $v['interest'], 2);
                    $investDetail['status'] = 7;
                    $investDetail['receive_interest'] = 0;
                    $investDetail['receive_capital'] = 0;
                    $investDetail['sort_order'] = $i;
                    $investDetail['total'] = $binfo['borrow_duration'];
                    if ($datag['repay_cycle'] == 1) {
                        $days = $i * 30;
                        $investDetail['deadline'] = strtotime("+{$days} day", time());
                    } else {
                        $investDetail['deadline'] = strtotime("+{$i} month", time());
                    }
                    $savedetail[] = $investDetail;
                    $i++;
                }
                break;
            case 2://利息复投
                $monthData['type'] = "all";
                $repay_detail = CompoundMonth($monthData);
                $data['investor_interest'] = $repay_detail['interest'];
                $monthDatax['month_times'] = 12;
                $monthDatax['account'] = 10000;
                $monthDatax['year_apr'] = $binfo['borrow_interest_rate'];
                $monthDatax['type'] = "all";
                $repay_detailx = CompoundMonth($monthDatax);
                $data['shouyi'] = $repay_detailx['shouyi'];
                $investDetail['repayment_time'] = 0;
                $investDetail['borrow_id'] = $binfo['id'];
                $investDetail['investor_uid'] = $uid;
                $investDetail['borrow_uid'] = $binfo['borrow_uid'];
                $investDetail['capital'] = $money;
                $investDetail['interest'] = $repay_detail['interest'];
                $investDetail['interest_fee'] = getFloatValue($fee_rate * $repay_detail['interest'], 2);
                $investDetail['status'] = 7;
                $investDetail['receive_interest'] = 0;
                $investDetail['receive_capital'] = 0;
                $investDetail['sort_order'] = 1;
                $investDetail['total'] = 1;
                if ($datag['repay_cycle'] == 1) {
                    $days = $binfo['borrow_duration'] * 30;
                    $investDetail['deadline'] = strtotime("+{$days} day", time());
                } else {
                    $investDetail['deadline'] = strtotime("+{$binfo['borrow_duration']} month", time());
                }
                $savedetail[] = $investDetail;

                break;
        }
        $data['invest_fee'] = getFloatValue($fee_rate * $data['investor_interest'], 2);
        $data['detail'] = $savedetail;
        return $data;
    }


    /**
     * 使用关系模型增加投资和还款数据
     * @param $data
     * @return mixed
     */
    public function addInvestorList($data)
    {
        $ti = $this->table($this->per.$this->tableName)->switchModel("Relation");
        $ti->table($this->per.$this->tableName)->setProperty("_link", $this->_link);
        return $ti->table($this->per.$this->tableName)->relation(true)->add($data);
    }

    /**
     * 计算回款续投预奖励
     * @param $uid
     * @param $money
     * @param $binfo
     * @param $back_money
     * @return array|int|void
     */
    private function preReward($uid,$money,$binfo,$back_money){
        $datag = get_global_setting();
        $today_reward = explode("|",$datag['today_reward']);
        if($binfo['borrow_duration']==1){
            $reward_rate = floatval($today_reward[0]);
        }else if($binfo['borrow_duration']==2){
            $reward_rate = floatval($today_reward[1]);
        }else{
            $reward_rate = floatval($today_reward[2]);
        }
        if($reward_rate>0 && $back_money>0){//首次投标不给续投奖励
            if($money>$back_money){//如果投标金额大于回款资金池金额，有效续投奖励以回款金额资金池总额为标准，否则以投标金额为准
                $reward_money_s = $back_money;
            }else{
                $reward_money_s = $money;
            }

            $save_reward['borrow_id'] = $binfo['id'];
            $save_reward['reward_uid'] = $uid;
            $save_reward['invest_money'] = $reward_money_s;//如果投标金额大于回款资金池金额，有效续投奖励以回款金额资金池总额为标准，否则以投标金额为准
            $save_reward['reward_money'] = $reward_money_s*$reward_rate/1000;//续投奖励
            $save_reward['reward_status'] = 1;
            $save_reward['add_time'] = time();
            $save_reward['deal_time'] = time();
            $save_reward['add_ip'] = get_client_ip();
            $table = $this->per.$this->today_reward_table;
            $newidxt = $this->table($table)->add($save_reward);
            if($newidxt){
                $this->mm->updateMemberMoney($uid,63,$save_reward['reward_money'],"续投有效金额({$reward_money_s})的奖励({$binfo['id']}号优计划)");
            }
        }
    }
}
?>