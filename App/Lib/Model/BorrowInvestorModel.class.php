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
 * Class BorrowInvestorModel
 * @author LiuKeTao
 * 投资详情管理模型
 */
class BorrowInvestorModel extends BaseModel {
    protected $tableName = 'borrow_investor';
    protected $today_reward_table = 'today_reward';
    protected $pk = 'id';
    protected $_link = array(
        'InvestorDetail'=> array(
            'mapping_type'=>HAS_MANY,
            'class_name'=>'InvestorDetail',
            'foreign_key'=>'invest_id'
        ),
        'Debt'=> array(
            'mapping_type'=>HAS_ONE,
            'class_name'=>'Debt',
            'foreign_key'=>'invest_id'
        ),
    );
    /**
     * 投资明细
     * @param string $field
     * @param array $map
     * @param string $limit
     * @param array $join
     * @param string $group
     * @param string $order
     * @param string $type
     * @return mixed
     */
    public function getList($field = '*',$obj = array(),$join = ''){
        $map = $obj['map'];
        $group = $obj['group'];
        $order = $obj['order'];
        $limit = $obj['limit'];
        $per = C('DB_PREFIX');
        $table = "{$per}".$this->tableName;
        if($order==''){
            $order = '`id` desc';
            if(is_array($join)){
                $order = 'bi.`id` desc';
            }
        }
        if(is_array($join)){
            $table = "{$per}".$this->tableName.' as bi';
        }
        return $this->_getList($field,$table,$map,$join,$group,$order,$limit);
    }

    /**
     * 投标的各种判断
     * @param $uid
     * @param $borrow_id
     * @param $money
     * @return array
     */
    public function check_invest($uid,$borrow_id,$money){
        $b = new BorrowModel();
        $field = "borrow_uid,borrow_status,money_collect,is_new,
        borrow_max,borrow_money,has_borrow,borrow_min";
        $vo = $b->field($field)->find($borrow_id);
        if(empty($vo))
            return array('status'=>0,'msg'=>'没有此标');
        if($uid == $vo['borrow_uid'])
            return array('status'=>0,'msg'=>'不能投自己的标');
        if($vo['borrow_status']!= 2)
            return array('status'=>0,'msg'=>'只能投正在借款中的标');
        $m = new MembersModel();
        $link = array("Money","MoneyDetail");
        $vm = $m->getMemberInfo($uid,$link,'id');
        $amoney = floatval($vm['account_money']+$vm['back_money']);
        if($money>$amoney)
            return array('status'=>2,'msg'=>"尊敬的用户，您的账户可用余额为{$amoney}元，余额不足，请先充值");
        ////////////////////////////////////待收金额限制 2013-08-26  fan///////////////////
        if($vo['is_new']==1&&$vm['capital']==0){
            return array('status'=>0,'msg'=>'此标为新手标，只有未投资用户才能投此标');
        }
        if($vo['money_collect']>0){
            if($vm['money_collect']<$vo['money_collect']) {
                return array('status'=>0,'msg'=>"此标设置有投标待收金额限制，您账户里必须有{$vo['money_collect']}的待收才能投此标");
            }
        }

        $cwhere['borrow_id'] = $borrow_id;
        $cwhere['investor_uid'] = $uid;
        $capital = $this->where($cwhere)->sum('investor_capital');
        if(($capital+$money)>$vo['borrow_max']&&$vo['borrow_max']>0){
            $xtee = $vo['borrow_max'] - $capital;
            return array('status'=>0,'msg'=>"您已投标{$capital}元，此投上限为{$vo['borrow_max']}元，你最多只能再投{$xtee}");
        }
        $need = $vo['borrow_money'] - $vo['has_borrow'];
        if( $money>$need && ($need-$money)<>0 ){
            $msg = "尊敬的用户，您投标{$money}元，此标还差{$need}元满标,无法投标";
            if($need<$vo['borrow_min']) $msg = "尊敬的用户，您投标{$money}元，此标还差{$need}元满标,无法投标";
            return array('status'=>0,'msg'=>$msg);
        }
        if(($vo['borrow_min']-$money)>0 ){
            $msg = "尊敬的用户，本标最低投标金额为{$vo['borrow_min']}元，请重新输入投标金额";
            return array('status'=>0,'msg'=>$msg);
        }
        if(($need-$money)<0 ){
            $msg = "尊敬的用户，此标还差{$need}元满标,您最多只能再投{$need}元";
            return array('status'=>0,'msg'=>$msg);
        }
        if( $money>$need && $need==0){
            $msg = "尊敬的用户，此标已被抢投满了,下次投标手可一定要快呦！";
            return array('status'=>0,'msg'=>$msg);
        }

        return array('status'=>1,'msg'=>"尊敬的用户，您的账户可用余额为{$amoney}元，您确认投标{$money}元吗？");
    }
    /**
     * 判断定向标密码
     * @param $borrow_id
     * @param $borrow_pass
     * @return array
     */
    public function checkBorrowPwd($borrow_id,$borrow_pass){
        $b = new BorrowModel();
        $password = $b->getFieldById($borrow_id,'password');
        if(!empty($password)){
            if(empty($borrow_pass))
                return array('status'=>0,'msg'=>"此标是定向标，必须验证投标密码");
            if($password<>md5($borrow_pass))
                return array('status'=>0,'msg'=>"定向标密码不正确");
        }
        return array('status'=>1,'msg'=>"");
    }

    /**
     * 使用关系模型增加投资和还款数据
     * @param $data
     * @return mixed
     */
    public function addInvestorList($data){
        $bi = $this->switchModel("Relation");
        $bi->setProperty("_link",$this->_link);
        return $bi->relation(true)->add($data);
    }


    /**
     * 使用关系模型删除投资和还款数据
     * @param $id
     * @return mixed
     */
    public function delInvestorList($id){
        $bi = $this->switchModel("Relation");
        $bi->setProperty("_link",$this->_link);
        $map['id']=$id;
        return $bi->relation(true)->where($map)->delete();
    }
    /**
     * 计算回款续投预奖励
     * @param $uid
     * @param $money
     * @param $binfo
     * @param $back_money
     * @return array|int|void
     */
    public function preReward($uid,$money,$binfo,$back_money){
        if($binfo['borrow_type']==3)
            return ;
        $map['investor_uid'] = $uid;
        $count = $this->where($map)->count();
        $datag = get_global_setting();
        $today_reward = explode("|",$datag['today_reward']);
        if($binfo['repayment_type']=='1'){//如果是天标，则执行1个月的续投奖励利率
            $reward_rate = floatval($today_reward[0]);
        }else{
            if($binfo['borrow_duration']==1){
                $reward_rate = floatval($today_reward[0]);
            }else if($binfo['borrow_duration']==2){
                $reward_rate = floatval($today_reward[1]);
            }else{
                $reward_rate = floatval($today_reward[2]);
            }
        }
        if($reward_rate>0 && $back_money>0 && $count>0){//首次投标不给续投奖励
            if($money>$back_money){//如果投标金额大于回款资金池金额，有效续投奖励以回款金额资金池总额为标准，否则以投标金额为准
                $reward_money_s = $back_money;
            }else{
                $reward_money_s = $money;
            }

            $save_reward['borrow_id'] = $binfo['id'];
            $save_reward['reward_uid'] = $uid;
            $save_reward['invest_money'] = $reward_money_s;//如果投标金额大于回款资金池金额，有效续投奖励以回款金额资金池总额为标准，否则以投标金额为准
            $save_reward['reward_money'] = $reward_money_s*$reward_rate/1000;//续投奖励
            $save_reward['reward_status'] = 0;
            $save_reward['add_time'] = time();
            $save_reward['add_ip'] = get_client_ip();
            $per = C('DB_PREFIX');
            $table = "{$per}".$this->today_reward_table;
            $newidxt = $this->table($table)->add($save_reward);
            if($newidxt){
                $mm = new MemberMoneyModel();
                $mm->updateMemberMoney($uid,51,$save_reward['reward_money'],"续投有效金额({$reward_money_s})的奖励({$binfo['id']}号标)预奖励");
            }
        }
    }

    /**
     * 发放续投预奖励
     * @param $borrow_id
     */
    public function grantReReward($borrow_id){
        $map['borrow_id'] = $borrow_id;
        $map['reward_status'] = 0;
        $per = C('DB_PREFIX');
        $table = "{$per}".$this->today_reward_table;
        $list = $this->table($table)->field("reward_uid,reward_money")->where($map)->select();
        $mm = new MemberMoneyModel();
        foreach($list as $k => $v){
            $mm->updateMemberMoney($v['reward_uid'],52,$v['reward_money'],"续投奖励({$borrow_id}号标)预奖励到账");
        }
        $updata_s['deal_time'] = time();
        $updata_s['reward_status'] = 1;
        $this->table($table)->where($map)->save($updata_s);
    }

    /**
     * 投标
     * @param $uid
     * @param $borrow_id
     * @param $money
     * @param int $_is_auto
     * @param array $obj  -额外的参数
     * @return int|mixed
     */
    public function investMoney($uid,$borrow_id,$money,$_is_auto=0,$obj=array()){
        $done = 0;
        $b = new BorrowModel();
        M()->startTrans();
        $field = "id,borrow_uid,borrow_interest_rate,borrow_duration,repayment_type,borrow_type,
        has_borrow,borrow_money,reward_num,(borrow_money-has_borrow) as need";
        $binfo = $b->field($field)->lock(true)->find($borrow_id);
        $m = new MembersModel();
        $vminfo = $m->getMemberInfo($uid,"Money","id");
        $order = $this->CreateOrder();
        $investinfo['status'] = 1;
        $investinfo['borrow_id'] = $borrow_id;
        $investinfo['investor_capital'] = $money;
        $investinfo['investor_uid'] = $uid;
        $investinfo['borrow_uid'] = $binfo['borrow_uid'];
        $investinfo['is_auto'] = $_is_auto;
        $investinfo['reward_money'] = $binfo['reward_num']==0?0:round($money*$binfo['reward_num']/100,2);
        $investinfo['add_time'] = time();
        $investinfo['order'] = $order;
        $repayDetail = $this->repayDetail($uid,$money,$binfo,$obj['c_rate']);
        $investinfo['investor_interest'] = $repayDetail['investor_interest'];
        $investinfo['invest_fee'] = $repayDetail['invest_fee'];
        $investinfo['InvestorDetail'] = $repayDetail['detail'];
        $invest_defail_id = $this->addInvestorList($investinfo);
        $bdata['id'] = $borrow_id;
        $bdata['has_borrow'] = array('exp',"has_borrow+{$money}");
        $bdata['borrow_times'] = array('exp',"borrow_times+1");
        if($money==$binfo['need']){
            $bdata['borrow_status']=4;
            $bdata['full_time']=time();
        }
        $upborrow_res = $b->save($bdata);
        $mm = new MemberMoneyModel();
        if($invest_defail_id  && $upborrow_res){
            $res = $mm->updateMemberMoney($uid,8,-$money,"对{$borrow_id}号标进行投标,资金冻结",$binfo['borrow_uid'],$order);
            $resx = true;
            if($obj['cid']){
                $cl = new CouponLogModel();
                $resx = $cl->add_log($uid,$obj['cid'],1,$invest_defail_id,$borrow_id,"对{$borrow_id}号标进行投标，使用加息券");
            }
            if($res&&$resx){
                $this->preReward($uid,$money,$binfo,$vminfo['back_money']);
                M()->commit();
                $done = $invest_defail_id;
            }else{
                M()->rollback();
            }
        }else{
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
    public function repayDetail($uid,$money,$binfo,$c_rate){
        $datag = get_global_setting();
        $fee_rate=$datag['fee_invest_manage']/100;
        $savedetail=array();
        $monthData['month_times'] = $binfo['borrow_duration'];
        $monthData['account'] = $money;
        $monthData['year_apr'] = $binfo['borrow_interest_rate'];
        $data['investor_interest'] = getBorrowInterest($binfo['repayment_type'],$money,$binfo['borrow_duration'],$binfo['borrow_interest_rate']);
        $data['invest_fee'] = getFloatValue($fee_rate * $data['investor_interest'],2);
        switch($binfo['repayment_type']){
            case 1://按天到期还款
            case 5://一次性还款
                //还款概要START
                //还款概要END
                $investdetail['borrow_id'] = $binfo['id'];
                $investdetail['investor_uid'] = $uid;
                $investdetail['borrow_uid'] = $binfo['borrow_uid'];
                $investdetail['capital'] = $money;
                $investdetail['interest'] = $data['investor_interest'];
                $investdetail['interest_fee'] = $data['invest_fee'];
                $investdetail['interestratecoupon_money'] = sprintf("%.2f",$investdetail['interest']*$c_rate/$binfo['borrow_interest_rate']/10);
                $investdetail['status'] = 0;
                $investdetail['sort_order'] = 1;
                $investdetail['total'] = 1;
                $savedetail[] = $investdetail;
                break;
            case 2://每月还款
            case 3://按季分期还款
            case 4://每月还息到期还本
                $repay_list= array();
                $binfo['repayment_type']==2 && $repay_list = EqualMonth($monthData);
                $binfo['repayment_type']==3 && $repay_list = EqualSeason($monthData);
                $binfo['repayment_type']==4 && $repay_list = EqualEndMonth($monthData);
                $i=1;
                $numl = sizeof($repay_list);
                $usem = 0;
                $interest = 0;
                foreach($repay_list as $key=>$v){
                    $investdetail['borrow_id'] = $binfo['id'];
                    $investdetail['investor_uid'] = $uid;
                    $investdetail['borrow_uid'] = $binfo['borrow_uid'];
                    /**
                     * 修复投资金额，利息等不一致的情况
                     */
                    if($key == ($numl-1)){
                        $investdetail['capital'] = $money-$usem;
                        $investdetail['interest'] = $data['investor_interest']-$interest;
                    }else{
                        $investdetail['capital'] = $v['capital'];
                        $investdetail['interest'] = $v['interest'];
                        $usem+=$v['capital'];
                        $interest+=$v['interest'];
                    }
                    $investdetail['interest_fee'] = getFloatValue($fee_rate*$investdetail['interest'],4);
                    $investdetail['interestratecoupon_money'] = sprintf("%.2f",$investdetail['interest']*$c_rate/$binfo['borrow_interest_rate']/10);
                    $investdetail['status'] = 0;
                    $investdetail['sort_order'] = $i;
                    $investdetail['total'] = $binfo['borrow_duration'];
                    $i++;
                    $savedetail[] = $investdetail;
                }
                break;
        }
        $data['detail'] = $savedetail;
        return $data;
    }

    /**
     * 根据标信息更新投资标数据和用户资金
     * @param $obj
     * @return bool
     */
    public function upDataInvestor($obj){
        $borrow_id = $obj['id'];
        $field = "id,borrow_id,investor_uid,investor_capital,investor_interest,reward_money,borrow_uid";
        $map['borrow_id'] = $borrow_id;
        $investorList = $this->field($field)->where($map)->select();
        $conf = get_global_setting();
        $invest_integral = $conf['invest_integral'];
        $endTime = strtotime(date("Y-m-d",time())." ".$conf['back_time']);
        if($obj['borrow_type']==3 || $obj['repayment_type']==1){//天标或秒标
            $deadline_last = strtotime("+{$obj['borrow_duration']} day",$endTime);
        }else{//月标
            if($conf['repay_cycle']==1){
                $days = $obj['borrow_duration']*30;
                $deadline_last = strtotime("+{$days} day",$endTime);
            }else{
                $deadline_last = strtotime("+{$obj['borrow_duration']} month",$endTime);
            }
        }
        $getIntegralDays = ceil(($deadline_last-$endTime)/3600/24);//借款天数
        $sl = new SmsLogModel();
        $m = new MembersModel();
        $mm = new MemberMoneyModel();
        $cl = new CouponLogModel();
        $coupon = new CouponListModel();
        $idata['deadline'] = $deadline_last;
        $idata['status'] = 4;
        try{  //捕获错误异常
            foreach($investorList as $key=>$v){
                $res = $mm->updateMemberMoney($v['investor_uid'],9,$v['investor_capital'],"第{$borrow_id}号标复审通过，冻结本金成为待收金额",$v['borrow_uid']);
                $cid = $coupon->getFieldByInvestId($v['id'],'id');
                if($cid){
                    $cl->add_log($v['investor_uid'],$cid,10,$v['id'],$borrow_id,"第{$borrow_id}号标复审通过，加息券确认使用结算");
                }
                if($res){
                    $mm->updateMemberMoney($v['investor_uid'],10,$v['investor_interest'],"第{$borrow_id}号标复审通过，应收利息成为待收利息",$v['borrow_uid']);
                    if($v['reward_money']>0){
                        $mm->updateMemberMoney($v['borrow_uid'],55,-$v['reward_money'],"第{$borrow_id}号标复审通过，支付投标奖励",$v['investor_uid']);
                        $mm->updateMemberMoney($v['investor_uid'],54,$v['reward_money'],"第{$borrow_id}号标复审通过，获取投标奖励",$v['borrow_uid']);
                    }
                    $minfo = $m->getMemberInfo($v['investor_uid'],'','recommend_id,user_name,user_phone');
                    $recommend_id = $minfo['recommend_id'];
                    if($recommend_id && $obj['repayment_type']!=1&&($obj['borrow_type']==1 || $obj['borrow_type']==2 || $obj['borrow_type']==5)){
                        $_rate = $conf['award_invest']/1000;
                        $jiangli = getFloatValue($_rate * $v['investor_interest'],2);
                        if($jiangli>0){
                            $mm->updateMemberMoney($recommend_id,50,$jiangli,"用户{$minfo['user_name']}对{$borrow_id}号标投资成功，你获得推广奖励{$jiangli}元。",$v['investor_uid']);
                            $sp = new SpreadModel();
                            $sp->upDataSpread($v['investor_uid'],$recommend_id,$v['investor_capital'],$jiangli);
                        }
                    }

                    /**
                     * 投资积分
                     */
//                    $integ = intval($v['investor_capital']*$getIntegralDays*$invest_integral/1000);
                    $inte = new IntegralModel();
//                    $inte->memberIntegralLog($v['investor_uid'],2,$integ,"第{$borrow_id}号标复审通过，应获积分：".$integ."分,投资金额：".$v['investor_capital']."元,投资天数：".$getIntegralDays."天");
//                    if(isBirth($v['investor_uid'])){
//                        $inte->memberIntegralLog($v['investor_uid'],2,$integ,"亲，祝您生日快乐，本站特赠送您{$integ}积分作为礼物，以表祝福。");
//                    }

                    MTip('chk14',$v['investor_uid'],$borrow_id);
                    $sdata = array();
                    $sdata['borrow_id'] = $borrow_id;
                    $sl->sendSms($minfo['user_phone'],'approve_invest',$sdata);
                }

            }
            $res = $this->where($map)->save($idata);
            if($res){
                $d = new InvestorDetailModel();
                $d->upDataDetail($borrow_id,$obj['repayment_type'],$obj['borrow_duration'],$endTime,$deadline_last);
                return true;
            }else{
                return false;
            }
        }catch(Exception $e){
            return false;
        }
    }

    /**
     * 退回投资
     * @param $borrow_id
     * @param $status
     * @return bool
     */
    public function RefuseInvestor($borrow_id,$status){
        $field = "id,investor_uid,investor_capital,order,borrow_uid";
        $map['borrow_id'] = $borrow_id;
        $investorList = $this->field($field)->where($map)->select();
        if(!is_array($investorList)){
            return true;
        }
        M()->startTrans();
        $status == 3 && $istatus=2;
        $status == 5 && $istatus=3;
        $nid = $this->where($map)->setField("status",$istatus);
        $cl = new CouponLogModel();
        $coupon = new CouponListModel();
        if($nid){
            $status == 3 && $type=30;
            $status == 5 && $type=31;
            $status == 3 && $info="第{$borrow_id}号标流标,";
            $status == 5 && $info="第{$borrow_id}号标复审未通过,";
            $mm = new MemberMoneyModel();
            foreach($investorList as $k => $v){
                $cid = $coupon->getFieldByInvestId($v['id'],'id');
                if($cid){
                    $cl->add_log($v['investor_uid'],$cid,0,0,0,$info.'返还加息券');
                }
                $res = $mm->updateMemberMoney($v['investor_uid'],$type,$v['investor_capital'],$info.'返回冻结资金',$v['borrow_uid'],$v['order']);
                if($res){
                    MTip('chk15',$v['investor_uid'],$borrow_id);//sss
                }
            }
            $i = new InvestorDetailModel();
            $i->where($map)->delete();
            M()->commit();
            return true;
        }else{
            M()->rollback();
            return false;
        }
    }

    public function repayInvestor($uid,$borrow_id,$sort_order,$type=1){
        $i = new InvestorDetailModel();
        $list = $i->getRepayList($uid,$borrow_id,$sort_order);
        $vs = $list['list'];

        $expired_days = getExpiredDays($vs['deadline']);
        $expired_money = $expired_days==0?0:getExpiredMoney($expired_days,$vs['capital'],$vs['interest']);
        $call_fee = $expired_days==0?0:getExpiredCallFee($expired_days,$vs['capital'],$vs['interest']);

        $needpay = $vs['capital']+$vs['interest']+$expired_money+$call_fee;

        $m = new MembersModel();
        $minfo = $m->getMemberInfo($uid,'Money',"id");
        $all_money = $minfo['account_money'] + $minfo['back_money'];
        $chk = $type==1 && $all_money < $needpay;
        if($chk)
            return array('status'=>0,'msg'=>"账户可用余额不足，本期还款共需".($needpay)."元，请先充值");
        //借款人还款


    }
}
?>