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
 * Class BorrowModel
 * @author LiuKeTao
 * @date 20170707
 * @version 1.0
 */

// 借款管理模型
class BorrowModel extends BaseModel {

	protected $tableName = 'borrow_info';
    protected $tableName1 = 'borrow_expired';
    protected $tableName2 = 'borrow_substitute_log';
    protected $tableName3 = 'borrow_repay_info';
    protected $borrow_verify = 'borrow_verify';
    protected $today_reward_table = 'today_reward';
    protected $pk = 'id';
    protected $_link = array(
        'BorrowInvestor'=>array(
            'mapping_type'=>HAS_MANY,
            'class_name'=>'BorrowInvestor',
            'foreign_key'=>'borrow_id',
        ),
        'InvestorDetail'=>array(
            'mapping_type'=>HAS_MANY,
            'class_name'=>'InvestorDetail',
            'foreign_key'=>'borrow_id',
        ),
    );
    public function __construct(){
        parent::__construct();
        $this->BorrowToVerify();
        $this->BorrowToRefuse();
    }

    /**
     * 列表
     * @param string $field
     * @param array $map
     * @param string $group
     * @param string $order
     * @param string $type
     * @param string $limit
     * @param array $join
     * @return mixed
     */
    public function getList($field = '*',$obj = array(),$join = array()){

        $map = $obj['map'];
        $group = $obj['group'];
        $order = $obj['order'];
        $limit = $obj['limit'];
        $per = C('DB_PREFIX');
        $table = "{$per}".$this->tableName;
        if($order==''){
            $order = '`id` desc';
            if(is_array($join)){
                $order = 'b.`id` desc';
            }
        }
        if(is_array($join)){
            $table = "{$per}".$this->tableName.' as b';
        }
        return $this->_getList($field,$table,$map,$join,$group,$order,$limit);
    }
    /**
     * 使用关系模型查询标信息
     * @param string $field
     * @param $id
     * @param $link
     * @return mixed
     */
    public function getBorrowInfo($id,$link='',$field='*'){
        if(empty($link)){
            $borrow_info = $this->field($field)->find($id);
        }else{
            $borrow = $this->switchModel("Relation");
            $borrow->setProperty("_link",$this->_link);
            $borrow_info = $borrow->field($field)->relation($link)->find($id);
        }
        return $borrow_info;
    }


    public function repayManageFee($money,$duration,$repayment_type){
        $conf = get_global_setting();
        $fee_borrow_manage = explode("|",$conf['fee_borrow_manage']);
        if($repayment_type== 1){//按天还
            $borrow_r_fee = 0;
            $borrow_p_fee = 0;
        }else{
            $fee_rate=(is_numeric($fee_borrow_manage[2]))?($fee_borrow_manage[2]/100*$duration/12):0;
            $borrow_r_fee = getFloatValue($fee_rate*$money,2);
            $borrow_p_fee = getFloatValue($borrow_r_fee/$duration,2);
        }
        return array('borrow_r_fee'=>$borrow_r_fee,'borrow_p_fee'=>$borrow_p_fee);
    }
    /**
     * 计算或者重新计算借款管理费
     * @param $money
     * @param $duration
     * @param $repayment_type
     * @return string
     */
    public function ManageFee($money,$duration,$repayment_type){
        $conf = get_global_setting();
        $fee_borrow_manage = explode("|",$conf['fee_borrow_manage']);
        if($repayment_type== 1){//按天还
            $fee_rate = (is_numeric($fee_borrow_manage[0]))?($fee_borrow_manage[0]/100):0;
            $borrow_fee = getFloatValue($fee_rate*$money*$duration,2);
        }else{
            $fee_rate=(is_numeric($fee_borrow_manage[1]))?($fee_borrow_manage[1]/100)*$duration/12:0;
            $borrow_fee = getFloatValue($fee_rate*$money,2);
        }
        return $borrow_fee;
    }
    /**
     * 计算或重新计算借款服务费
     * @param $money
     * @return mixed
     */
    public function ServiceFee($money){
        $conf = get_global_setting();
        $fee_borrow_service = explode("|",$conf['fee_borrow_service']);
        $borrow_service_fee = $money* $fee_borrow_service[0] * 0.01;
        if($borrow_service_fee>$fee_borrow_service[1]){
            $borrow_service_fee = $fee_borrow_service[1];
        }
        return $borrow_service_fee;
    }

    /**
     * 处理借款审核，包括初审复审等
     * @return array
     */
    public function doEditBorrow(){
        $status = 0;
        $msg = "修改失败";
        $where['id'] = $_POST['id'];
        $search['map'] = $where;
        $search['limit'] = 1;
        $vm = $this->getList("*",$search);
        if($vm['has_borrow'] == 0 && $vm['borrow_status']==4 && $_POST['borrow_status'] == 6){
            return array('status'=>$status,'msg'=>'实际借款金额为0，无法复审通过');
        }
        if (false === $this->create()) {
            $msg = $this->getError();
            return array('status' => 0,'msg'=>$msg);
        }

        $this->is_new = empty($this->is_new)?0:$this->is_new;
        if($this->is_new==1){
            $this->money_collect = 0 ;
            $vm['money_collect'] = 0 ;
        }
        $chk = $vm['borrow_status']>=2 &&
            ($vm['borrow_money']<>$this->borrow_money ||
                $vm['borrow_interest_rate']<>$this->borrow_interest_rate ||
                $vm['borrow_duration']<>$this->borrow_duration ||
                $vm['repayment_type']<>$this->repayment_type ||
                $vm['borrow_fee'] <> $this->borrow_fee ||
                $vm['is_new'] <> $this->is_new ||
                $vm['can_auto'] <> $this->can_auto ||
                $vm['borrow_max'] <> $this->borrow_max ||
                $vm['money_collect'] <> $this->money_collect);
        if($chk){
            return array('status' => 0,'msg'=>"不能再更改借款信息:标题、还款方式、借款金额、年化利率、借款期限、自动投标、管理费、最高投标、投标奖励、新手标、待收限制");
        }
        $chk1 = $vm['borrow_status']>=4 && $vm['collect_day'] <> $this->collect_day;
        if($chk1){
            return array('status' => 0,'msg'=>"不能再更改借款信息:标题、还款方式、借款金额、年化利率、借款期限、自动投标、管理费、募集时间、最高投标、投标奖励、新手标、待收限制");
        }

        $schk = $vm['borrow_status']==4 && $this->borrow_status!=5 && $this->borrow_status!=6;
        if($schk){
            return array('status' => 0,'msg'=>"复审中的借款只能改为复审通过或者复审未通过");
        }

        if($this->repayment_type == 3){
            $dem = $this->borrow_duration%3;
            if($dem > 0)
                return array('status'=>$status,'msg'=>'按季分期还款时，填入的借款期限必须为3的倍数');
        }
        if($vm['borrow_type'] == 1&&$this->borrow_status==2){
            $credit_cuse = M('member_money')->field('credit_cuse')->where("uid=".$vm['borrow_uid'])->find();
            if($this->borrow_money > $credit_cuse["credit_cuse"] )
                return array('status'=>$status,'msg'=>'借款金额大于该用户可用信用额度');
        }
        if(($this->reward_type<0||$this->reward_type>1)&&$this->reward_type==intval($this->reward_type))
            return array('status'=>$status,'msg'=>'是否有投标奖励只能填写0,1');
        if($this->reward_type==1 && $this->reward_num<=0)
            return array('status'=>$status,'msg'=>'请填写合适的投标奖励比例');
        if($this->collect_day<1)
            return array('status'=>$status,'msg'=>'提交的募集时间不能小于1，请重新填写');

        if($this->collect_day!=intval($this->collect_day))
            return array('status'=>$status,'msg'=>'提交的募集时间只能是整数，请重新填写');
        $conf = get_global_setting();
        $rate_lixt = explode("|",$conf['rate_lixi']);
        $borrow_duration = explode("|",$conf['borrow_duration']);
        $borrow_duration_day = explode("|",$conf['borrow_duration_day']);
        if(floatval($this->borrow_interest_rate)>$rate_lixt[1])
            return array('status'=>$status,'msg'=>'提交的借款利率超出允许范围，请重新填写');
        if(floatval($this->borrow_interest_rate)<$rate_lixt[0])
            return array('status'=>$status,'msg'=>'提交的借款利率超出允许范围，请重新填写');
        if($this->repayment_type=='1' && ($this->borrow_duration>$borrow_duration_day[1]||$this->borrow_duration<$borrow_duration_day[0]))
            return array('status'=>$status,'msg'=>'提交的借款期限超出允许范围,请去网站设置处重新设置系统参数');
        if($this->repayment_type!='1' && ($this->borrow_duration>$borrow_duration[1]||$this->borrow_duration<$borrow_duration[0]))
            return array('status'=>$status,'msg'=>'提交的借款期限超出允许范围,请去网站设置处重新设置系统参数');

        if($vm['borrow_fee']==$this->borrow_fee){
            $this->borrow_fee = $this->ManageFee($this->borrow_money,$this->borrow_duration,$this->repayment_type);
            $this->borrow_service_fee = $this->ServiceFee($this->borrow_money);
        }
        $this->total = $this->borrow_duration;
        $this->repayment_type == 1 && $this->total =1;
        $this->repayment_type == 5 && $this->total =1;

        $this->is_new==1 && $this->money_collect = 0;
        ////////////////////图片编辑///////////////////////
        if(!empty($_POST['swfimglist'])){
            foreach($_POST['swfimglist'] as $key=>$v){
                $row[$key]['img'] = substr($v,1);
                $row[$key]['info'] = $_POST['picinfo'][$key];
            }
            $this->updata=serialize($row);
        }
        ////////////////////图片编辑///////////////////////
        $vm['borrow_status']==2 && $vm["collect_day"] != $this->collect_day && $this->collect_time =($this->collect_day-$vm["collect_day"])*86400 +$vm["collect_time"];
        $this->borrow_status==2 && $this->collect_time = strtotime("+ {$this->collect_day} days");
        $this->borrow_interest = getBorrowInterest($this->repayment_type,$this->borrow_money,$this->borrow_duration,$this->borrow_interest_rate);
        unset($this->first_verify_time);
        ($this->borrow_status==2 || $this->borrow_status==1) && $this->first_verify_time = time();
        $bs = $this->borrow_status;
        $borrow_id = intval($this->id);
        $admin_id = $_SESSION['admin'];
        $deal_info = $_POST['deal_info'];
        $can_auto = $_POST['can_auto'];
        $m = new MembersModel();
        $sl = new SmsLogModel();
        $minfo = $m->getMemberInfo($vm['borrow_uid'],'','id,is_vip,user_phone,user_name');
        if($bs==2&&$vm['first_verify_time']>0){
            if($vm['collect_day'] < $this->collect_day){
                $spanday = $this->collect_day-$vm['collect_day'];
                $this->collect_time = strtotime("+ {$spanday} day",$vm['collect_time']);
            }else if($vm['collect_day'] > $this->collect_day){
                $temp_time = strtotime("+ {$this->collect_day} day",$vm['first_verify_time']);
                if($temp_time<time()){
                    return array('status'=>$status,'msg'=>'募集期不能小于已招标时间');
                }
                $this->collect_time = $temp_time;
            }else{
                unset($this->collect_time);
            }
        }
        $inte = new IntegralModel();
        if($bs == 6){
            $appid = $this->borrowApproved($this->id);
            if(!$appid){
                return array('status'=>$status,'msg'=>'复审失败');
            }
//            if($vm['borrow_type'] == 1 && $minfo['is_vip'] == 0){
//                memberLimitLog($vm['borrow_uid'],13,$vm['has_borrow'],"{$vm['id']}号标复审通过扣除信用额度");
//            }
            MTip('chk9',$vm['borrow_uid'],$this->id);
        }
        if($bs == 5 || $bs == 3){
            $appid = $this->borrowRefuse($this->id,$bs);
            if(!$appid){
                $bs==5 && $msg = '复审失败';
                $bs==3 && $msg = '流标失败';
                return array('status'=>$status,'msg'=>$msg);
            }
            if($vm['borrow_type'] == 1 && $minfo['is_vip'] == 0){
                $bs==5 && $info = "{$vm['id']}号标复审未通过,返还借款信用额度";
                $bs==3 && $info = "{$vm['id']}号标流标,返还借款信用额度";
                $inte->memberLimitLog($vm['borrow_uid'],4,$vm['borrow_money'],$info);
            }
            $bs==3 && $sl->sendSms($minfo['user_phone'],'refuse',array('borrow_id'=>$borrow_id));
            MTip('chk12',$vm['borrow_uid'],$this->id);
        }

        ($bs==5 || $bs==6 || $bs==3) && $this->second_verify_time = time();
        $this->borrow_status = $bs;

        $res = $this->save();
        if($res){
            $status = 1;
            $msg = '修改成功';
            if($bs==2 || $bs==1){

                $verify_info['deal_info'] = text($deal_info);
                $verify_info['deal_user'] = $admin_id;
                $verify_info['deal_time'] = time();
                $verify_info['deal_status'] = $bs;
                if($vm['first_verify_time']>0){
                    M("borrow_verify")->where("borrow_id={$borrow_id}")->save($verify_info);
                } else {
                    $verify_info['borrow_id'] = $borrow_id;
                    M("borrow_verify")->add($verify_info);
                }
            }
            if($vm['borrow_status']<2 && $bs==2){
                //新标提醒
                //newTip($m->id);
                if($can_auto == 1 && empty($vm['password']) && $vm['is_new'] == 0){
                    $ab = new AutoBorrowModel();
                    $ab->autoBorrowInvest($borrow_id);
                }
                MTip('chk8',$vm['borrow_uid'],$borrow_id);
                //自动投标
                $vm['borrow_type']==1 && $minfo['is_vip'] == 0 && $inte->memberLimitLog($vm['borrow_uid'],1,-$_POST['borrow_money'],"{$borrow_id}号标初审通过");
                $sl->sendSms($minfo['user_phone'],'firstV',array('borrow_id'=>$borrow_id));
            }
            if($bs == 5 || $bs == 6 || $bs == 3){
                $verify_info['deal_info_2'] = text($deal_info);
                $verify_info['deal_user_2'] = $admin_id;
                $verify_info['deal_time_2'] = time();
                $verify_info['deal_status_2'] = $bs;
                M("borrow_verify")->where("borrow_id={$borrow_id}")->save($verify_info);
            }

        }
        return array('status'=>$status,'msg'=>$msg);
    }

    /**
     * 更改所有已过筹标时间的标状态为复审中
     */
    private function BorrowToVerify(){
        $data['borrow_status'] = 4;
        $map['collect_time']=array("lt",time());
        $map['borrow_status'] = 2;
        $map['has_borrow'] = array("gt",0);
        $this->where($map)->save($data);
    }
    /**
     * 更改所有已过筹标时间且无人投资的标状态为流标
     */
    private function BorrowToRefuse(){
        $data['borrow_status'] = 3;
        $map['collect_time']=array("lt",time());
        $map['has_borrow'] = 0;
        $map['borrow_status'] = 4;
        $list = $this->where($map)->select();
        $inte = new IntegralModel();
        $sl = new SmsLogModel();
        foreach($list as $k => $v){
            $this->where("id = {$v['id']}")->save($data);
            $verify_info['deal_info_2'] = "无人投资自动流标";
            $verify_info['deal_time_2'] = time();
            $verify_info['deal_status_2'] = 3;
            M("borrow_verify")->where("borrow_id={$v['id']}")->save($verify_info);
            $minfo = M("members")->find($v['borrow_uid']);
            if($v['borrow_type'] == 1 && $minfo['is_vip'] == 0){
                $info = "{$v['id']}号标流标,返还借款信用额度";
                $inte->memberLimitLog($v['borrow_uid'],4,$v['borrow_money'],$info);
            }
            $sl->sendSms($minfo['user_phone'],'refuse',array('borrow_id'=>$v['id']));
        }
    }

    /**
     * 获取用户待还的净值表借款金额（含利息）
     * @param $uid
     * @return mixed
     */
    public function getNetMoney($uid){
        $map['borrow_uid'] = $uid;
        $map['borrow_type'] = 4;
        $map['borrow_status'] = array('in',array(6,8,9,10));
        return $this->where($map)->sum("has_borrow+borrow_interest+borrow_fee-repayment_money-repayment_interest");
    }

    public function borrowApproved($borrow_id){
        $conf = get_global_setting();
        $field = "id,borrow_type,reward_type,borrow_service_fee,reward_num,borrow_fee,borrow_money,has_borrow,borrow_uid,borrow_duration,repayment_type";
        M()->startTrans();
        $binfo = $this->field($field)->find($borrow_id);
        $endTime = strtotime(date("Y-m-d",time())." ".$conf['back_time']);
        if($binfo['borrow_type']==3 || $binfo['repayment_type']==1){//天标或秒标
            $deadline_last = strtotime("+{$binfo['borrow_duration']} day",$endTime);
        }else{//月标
            $deadline_last = strtotime("+{$binfo['borrow_duration']} month",$endTime);
            if($conf['repay_cycle']==1){
                $days = $binfo['borrow_duration']*30;
                $deadline_last = strtotime("+{$days} day",$endTime);
            }

        }

        $data['id'] = $borrow_id;
        $data['deadline'] = $deadline_last;
        $nid = $this->save($data);
        $m = new MembersModel();
        $mm = new MemberMoneyModel();
        $sl = new SmsLogModel();
        $i = new BorrowInvestorModel();
        if($nid){
            $res = $mm->updateMemberMoney($binfo['borrow_uid'],17,$binfo['has_borrow'],"第{$borrow_id}号标复审通过，借款金额入账");
            if($res){
                $borrow_fee = $this->ManageFee($binfo['has_borrow'],$binfo['borrow_duration'],$binfo['repayment_type']);
                $borrow_service_fee = $this->ServiceFee($binfo['has_borrow']);
                $mm->updateMemberMoney($binfo['borrow_uid'],18,-$borrow_fee,"第{$borrow_id}号标借款成功，扣除借款管理费");
                $money_deposit = round($binfo['has_borrow']*$conf['money_deposit']/100,2);
                $money_deposit > 0 && $mm->updateMemberMoney($binfo['borrow_uid'],19,-$money_deposit,"第{$borrow_id}号标借款成功，冻结{$conf['money_deposit']}%的保证金");
                $binfo['borrow_service_fee']>0 && $mm->updateMemberMoney($binfo['borrow_uid'],20,-$borrow_service_fee,"第{$borrow_id}号标借款成功，扣除借款服务费");
                $i->upDataInvestor($binfo);
                $i->grantReReward($borrow_id);
                $minfo = $m->getMemberInfo($binfo['borrow_uid'],'','user_phone,user_name');
                $sl->sendSms($minfo['user_phone'],'approve',array('borrow_id'=>$borrow_id));
                M()->commit();
                return true;
            }else{
                M()->rollback();
                return false;
            }
        }else{
            M()->rollback();
            return false;
        }
    }

    public function borrowRefuse($borrow_id,$status){
        $bi = new BorrowInvestorModel();
        $res = $bi->RefuseInvestor($borrow_id,$status);
        $mm = new MemberMoneyModel();
        if($res){
            $rmap['borrow_id'] = $borrow_id;
            $rmap['reward_status'] = 0;
            $rfield = "reward_uid,reward_money";
            $listreward =M("today_reward")->field($rfield)->where($rmap)->select();
            foreach($listreward as $v)
            {
                $mm->updateMemberMoney($v['reward_uid'],53,-$v['reward_money'],"续投奖励({$borrow_id}号标)预奖励取消");
            }
            $updata_s['deal_time'] = time();
            $updata_s['reward_status'] = 2;
            $per = C('DB_PREFIX');
            $table = "{$per}".$this->today_reward_table;
            $this->table($table)->where($rmap)->save($updata_s);
            return true;
        }else{
            return false;
        }

    }

    /**
     * 撤销借款
     * @param $uid
     * @param $id
     * @return mixed
     */
    public function borrowCancel($uid,$id){
        $map['borrow_uid'] = $uid;
        $map['id'] = $id;
        $map['borrow_status'] = 0;
        return $this->where($map)->delete();
    }

    /**
     * 还款
     * @param $uid
     * @param $borrow_id
     * @param $sort_order
     * @param $type  1借款会员还款，2网站待还本金
     * @return array
     */
    public function repaymentBorrow($uid,$borrow_id,$sort_order,$type=1)
    {

        $binfo = $this->find($borrow_id);
        if ($uid != $binfo['borrow_uid']) {
            return array('status' => 0, 'msg' => '数据有误');
        }
        if ($sort_order <= $binfo['has_pay']){
            return array('status' => 0, 'msg' => "对不起，本期已还");
        }
        if (($binfo['has_pay'] + 1) < $sort_order){
            return array('status' => 0, 'msg' => "对不起，此借款第" . ($binfo['has_pay'] + 1) . "期还未还，请先还第" . ($binfo['has_pay'] + 1) . "期");
        }

        $i = new InvestorDetailModel();
        $imap['sort_order'] = $sort_order;
        $imap['borrow_id'] = $borrow_id;
        $vs = $i->getRepayList($uid, $borrow_id, $sort_order);
        $total_sub = $vs['capital'] + $vs['interest'];
        if ($vs['substitute_time'] > 0) {
            $is_substitute = true;//已代还
        } else {
            $is_substitute = false;
        }
        if($is_substitute && $type == 2){
            return array('status' => -1, 'msg' => "已代还过了");
        }
        $b_p_fee = $binfo['borrow_p_fee'];

//逾期的相关计算
        $expired_days = getExpiredDays($vs['deadline']);
        $expired_money = $expired_days == 0 ? 0 : getExpiredMoney($expired_days, $vs['capital'], $vs['interest']);
        $call_fee = $expired_days == 0 ? 0 : getExpiredCallFee($expired_days, $vs['capital'], $vs['interest']);
        //逾期的相关计算
        $needpay = $total_sub;
        $type==1 && $needpay = $total_sub + $expired_money + $call_fee + $b_p_fee;
        $m = new MembersModel();
        $mm = new MemberMoneyModel();
        $minfo = $m->getMemberInfo($uid, 'Money', "id");
        $all_money = $minfo['account_money'] + $minfo['back_money'];
        $chk = $type == 1 && $all_money < $needpay;
        if ($chk){
            return array('status' => 0, 'msg' => "账户可用余额不足，本期还款共需" . ($needpay) . "元，请先充值");

        }
        M()->startTrans();
        $flag = 0;
        $sort_order == $binfo['total'] && $flag = 1;
        $flag && $bdata['borrow_status'] = 7 ;
        $type == 2 && $bdata['substitute_money'] = array('exp', "substitute_money+{$total_sub}");
        $type == 1 && $bdata['repayment_money'] = array('exp', "repayment_money+{$vs['capital']}");
        $type == 1 && $bdata['repayment_interest'] = array('exp', "repayment_interest+{$vs['interest']}");
        $type == 1 && $bdata['has_pay'] = array('exp', 'has_pay+1');
        $type==1 && $bdata['borrow_h_fee'] = array('exp', "borrow_h_fee+{$b_p_fee}");

        $bdata['id'] = $borrow_id;
        $res = $this->save($bdata);
        if ($res) {
            if ($type == 1) {
                $remm = $mm->updateMemberMoney($uid, 11, -$vs['capital'], "对{$borrow_id}号标第{$sort_order}期还款(本金)");
                if($remm){
                    $mm->updateMemberMoney($uid, 12, -$vs['interest'], "对{$borrow_id}号标第{$sort_order}期还款(利息)");
                    if($b_p_fee>0){
                        $mm->updateMemberMoney($uid, 18, -$b_p_fee, "对{$borrow_id}号标第{$sort_order}期还款,收取每月借款管理费");
                    }
                    $expired_days && $this->addExpired($uid, $borrow_id, $sort_order, $vs['capital'], $vs['interest'], $vs['deadline']);
                    $flag && $this->lastRepayment($binfo);
                }
            }
            if (!$is_substitute) {
                $status = 4;
                if ($type == 1) {
                    /**
                     * 加status判断
                     */
                    $glodata = get_global_setting();
                    $expired = explode("|", $glodata['fee_expired']);
                    $expired_chk = $expired[0];
                    $day_span = floor(($vs['deadline'] - time()) / (3600 * 24));
                    $inte = new IntegralModel();
                    if ($day_span > 0) {//提前还款
//                        $inte->memberIntegralLog($binfo['borrow_uid'], 1, intval($vs['capital'] * $day_span / 1000), "对第{$borrow_id}号标进行了提前还款操作,获取还款积分");//还款积分处理
                        $status = 2;
                    } elseif ($expired_days==0) {//正常还款
//                        $inte->memberIntegralLog($binfo['borrow_uid'], 1, intval($vs['capital'] / 1000), "对第{$borrow_id}号标进行了正常的还款操作,获取还款积分");//还款积分处理
                        $status = 1;
                    } elseif ($expired_days<=$expired_chk) {//迟还
                        $status = 3;
                    } else {//逾期
                        $status = 5;
                    }
                }
                $i->repayment($borrow_id, $sort_order, $type, $status);
                if ($flag) {
                    $idata['status'] = 5;
                    $bi = new BorrowInvestorModel();
                    $map['borrow_id'] = $borrow_id;
                    $bi->where($map)->save($idata);
                }
                if($type==2){
                    $this->addSubstitute($uid,$borrow_id,$sort_order,$total_sub,session('admin'),session('adminname'));
                    $this->updateRepayNum($uid,'web_num');
                }else{
                    $status == 1 && $this->updateRepayNum($uid);
                    $status == 2 && $this->updateRepayNum($uid,'advance_num');
                    $status == 3 && $this->updateRepayNum($uid,'late_num');
                    $status == 5 && $this->updateRepayNum($uid,'exporid_num');
                }
            }else{
                $i->repayment($borrow_id, $sort_order, $type, 5);
            }
            $debt = new DebtModel();
            $debt->cancelDebt($borrow_id);
            $flag == 1 && $debt->completeDebt($borrow_id);
            M()->commit();
            MTip('chk25', $binfo['borrow_uid'], $borrow_id);//sss
            return array('status' => 1, 'msg' => '还款成功');
        } else {
            M()->rollback();
            return array('status' => 0, 'msg' => "还款失败，请重试");
        }
    }

    /**
     * 添加逾期信息
     * @param $uid
     * @param $borrow_id
     * @param $sort_order
     * @param $capital
     * @param $interest
     * @param $deadline
     */
    public function addExpired($uid,$borrow_id,$sort_order,$capital,$interest,$deadline){
        $expired_days = getExpiredDays($deadline);
        $expired_money = $expired_days==0?0:getExpiredMoney($expired_days,$capital,$interest);
        $call_fee = $expired_days==0?0:getExpiredCallFee($expired_days,$capital,$interest);
        $per = C('DB_PREFIX');
        $table = "{$per}".$this->tableName1;
        $data['borrow_id'] = $borrow_id;
        $data['uid'] = $uid;
        $data['sort_order'] = $sort_order;
        $data['expired_money'] = $expired_money;
        $data['call_fee'] = $call_fee;
        $data['expired_days'] = $expired_days;
        $data['add_time'] = time();
        $data['add_ip'] = get_client_ip();
        $nid = $this->table($table)->add($data);
        if($nid){
            $mm = new MemberMoneyModel();
            $expired_money && $mm->updateMemberMoney($uid,71,-$expired_money,"对{$borrow_id}号标第{$sort_order}期逾期罚息");
            $call_fee && $mm->updateMemberMoney($uid,72,-$call_fee,"对{$borrow_id}号标第{$sort_order}期逾期催收费");
        }
    }

    /**
     * 添加代还记录
     * @param $uid
     * @param $borrow_id
     * @param $sort_order
     * @param $money
     * @param $admin_id
     * @param $admin_uname
     */
    public function addSubstitute($uid,$borrow_id,$sort_order,$money,$admin_id,$admin_uname){
        $per = C('DB_PREFIX');
        $table = "{$per}".$this->tableName2;
        $data['borrow_id'] = $borrow_id;
        $data['borrow_uid'] = $uid;
        $data['sort_order'] = $sort_order;
        $data['money'] = $money;
        $data['add_time'] = time();
        $data['add_ip'] = get_client_ip();
        $data['admin_id'] = $admin_id;
        $data['admin_uname'] = $admin_uname;
        $this->table($table)->add($data);
    }

    /**
     * 最后一期还款
     * @param $binfo
     * @return bool
     */
    public function lastRepayment($binfo){

        $uid = $binfo['borrow_uid'];
        $conf=get_global_setting();
        $money = round($binfo['has_borrow']*$conf['money_deposit']/100,2);
        $mm = new MemberMoneyModel();
        if($conf['money_deposit']>0){
            $money = round($binfo['has_borrow']*$conf['money_deposit']/100,2);
            $res = $mm->updateMemberMoney($uid,26,$money,"网站对{$binfo['id']}号标还款完成的解冻保证金");
            if(!$res){
                return false;
            }
        }
        $debt = new DebtModel();
        $debt->completeDebt($binfo['id']);
        $m = new MembersModel();
        $minfo = $m->getMemberInfo($uid,'','id,is_vip');
        if($binfo['borrow_type']==1 && $minfo['is_vip'] == 0){
            $inte = new IntegralModel();
            return $inte->memberLimitLog($binfo['borrow_uid'],7,($binfo['borrow_money']),$info="{$binfo['id']}号标还款完成,返还信用额度");
        }
        return true;

//        if($binfo['borrow_type']==2){
//            $x=false;
//            //返回借款人的借款担保额度
//            $x = memberLimitLog($binfo['borrow_uid'],8,($binfo['borrow_money']),$info="{$binfo['id']}号标还款完成");
//            if(!$x) return false;
//            //返回投资人的投资担保额度
//            $vocuhlist = M('borrow_vouch')->field("uid,vouch_money")->where("borrow_id={$binfo['id']}")->select();
//            foreach($vocuhlist as $vv){
//                $x = memberLimitLog($vv['uid'],10,($vv['vouch_money']),$info="您担保的{$binfo['id']}号标还款完成");
//            }
//        }elseif($binfo['borrow_type']==1 && $vip['is_vip'] == 0){
//            $x=false;
//            $x = memberLimitLog($binfo['borrow_uid'],7,($binfo['borrow_money']),$info="{$binfo['id']}号标还款完成");
//        }

    }

    public function getBorrowNumInfo($uid){

        $suc_map['borrow_uid'] = $uid;
        $suc_map['borrow_status'] = array('egt',6);
        $suc_count  = $this->where($suc_map)->count();
        return $suc_count;
    }

    public function updateRepayNum($uid,$type=''){
        $data['uid'] = $uid;
        $per = C('DB_PREFIX');
        $table = "{$per}".$this->tableName3;
        $id = $this->table($table)->where($data)->getField('id');
        if(!$id){
            $id = $this->table($table)->add($data);
        }
        $data['repay_num'] = array("exp","repay_num+1");
        $type && $data[$type] = array("exp","{$type}+1");
        $data['id'] = $id;
        $this->table($table)->save($data);
    }

    public function getMemberBorrowScan($uid){
        //借款次数相关
        $jkcgcs = $this->where("borrow_status > 5 and borrow_uid = {$uid}")->count();
        $borrow_repay = M("borrow_repay_info")->where("uid = {$uid}")->find();
        $collect_num = $this->where("borrow_status >= 5 and borrow_uid = {$uid}")->sum("total-has_pay");
        $row=array();
        $row['borrow_suc_num']=$jkcgcs;
        $row['normal_repay_num'] = $borrow_repay['repay_num']-$borrow_repay['advance_num']-$borrow_repay['exporid_num']-$borrow_repay['late_num'];
        $row['late_num'] = $borrow_repay['late_num'];
        $row['advance_num'] = $borrow_repay['advance_num'];
        $row['exporid_num'] = $borrow_repay['exporid_num'];
        $row['web_num'] = $borrow_repay['web_num'];
        $row['collect_num'] = $collect_num;
        return $row;
    }
}
?>