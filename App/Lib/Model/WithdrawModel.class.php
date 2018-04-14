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
 * Class WithdrawModel
 * 提现模型
 */
class WithdrawModel extends BaseModel {
	protected $tableName = 'member_withdraw';
    protected $pk = 'id';

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
                $order = 'w.`id` desc';
            }
        }
        if(is_array($join)){
            $table = "{$per}".$this->tableName.' as w';
        }
        return $this->_getList($field,$table,$map,$join,$group,$order,$limit);
    }

    /**
     * 判断是否可以提现
     * @param $uid
     * @param $money
     * @return array
     */
    public function checkWithdraw($uid,$money){
        $m = new MembersModel();
        $vo = $m->getMemberInfo($uid,'Money','id,user_leve,time_limit');
        $b = new BorrowModel();
        $netMoney = $b->getNetMoney($uid);
        $all_money = $vo['account_money']+$vo['back_money'];
        $borrow_money = $all_money-$netMoney;
        if(($borrow_money - $money)<0){
            return array('status'=>0,'msg'=>"存在净值标借款".$netMoney."元未还，账户余额提现不足");
        }
        if(($all_money-$money)<0)
            return array('status'=>0,'msg'=>"提现额大于账户余额");
        $conf = get_global_setting();
        $start = strtotime(date("Y-m-d"));
        $wmap['uid'] = $uid;
        $wmap['withdraw_status'] = array("neq",3);
        $wmap['add_time'] = array("gt",$start);
        $today_money = $this->where($wmap)->sum('withdraw_money');
        $today_time = $this->where($wmap)->count();

        $tqfee = explode("|",$conf['fee_tqtx']);

        //////////////////////////////////修改提现手续费///////////////////////////////////////
        switch(count($tqfee)){
            case 2:
                $fee[0] = $tqfee[0];//手续费
                $fee[2] = explode("-",$tqfee[1]);//上限

                break;
            case 3:
                $fee[0] = explode("-",$tqfee[0]);
                $fee[1] = explode("-",$tqfee[1]);
                $fee[2] = explode("-",$tqfee[2]);
                break;
            default:
                return array('status'=>0,'msg'=>"提现规则设置有误，请联系管理员");

        }

        $one_limit = $fee[2][0]*10000;
        if($money<100 ||$money>$one_limit)
            return array('status'=>0,'msg'=>"单笔提现金额限制为100-{$one_limit}元");
        $today_limit = $fee[2][1]/$fee[2][0];
        if($today_time>$today_limit){
            return array('status'=>0,'msg'=>"一天最多只能提现{$today_limit}次");
        }
        if(($today_money+$money)>$fee[2][1]*10000){
            $message = "单日提现上限为{$fee[2][1]}万元。您今日已经申请提现金额：{$today_money}元,当前申请金额为:{$money}元,已超出单日上限，请您修改申请金额或改日再申请提现";
            return array('status'=>0,'msg'=>$message);
        }
        $res = $this->withdrawFee($money,$vo['back_money']);
        return array('status'=>$res['status'],'msg'=>$res['msg']);
    }

    /**
     * 提现申请
     * @param $uid
     * @param $money
     * @return array
     */
    public function doWithdraw($uid,$money){
        $m = new MembersModel();
        $link = array("Money","Bank");
        $vo = $m->getMemberInfo($uid,$link,'id');
        $res = $this->withdrawFee($money,$vo['back_money']);
        if($res['status']){
            $fee = $res['fee'];
            M()->startTrans();
            $order = $this->CreateOrder();
            $moneydata['withdraw_money'] = $money;
            $moneydata['withdraw_fee'] = $fee;
            $moneydata['second_fee'] = $fee;
            $moneydata['withdraw_status'] = 0;
            $moneydata['uid'] =$uid;
            $moneydata['order'] =$order;
            $moneydata['add_time'] = time();
            $moneydata['add_ip'] = get_client_ip();
            $moneydata['withdraw_bankNo'] = $vo['bank_num'];
            $newid = $this->add($moneydata);
            if($newid){
                $mm = new MemberMoneyModel();
                $rx = $mm->updateMemberMoney($uid,21,-$money,"提现冻结{$money}元",0,$order);
                if($rx){
                    M()->commit();
                    MTip('chk6',$uid);
                    return array('status'=>1,'msg'=>'恭喜您提现申请成功');
                }else{
                    M()->rollback();
                    return array('status'=>0,'msg'=>'系统繁忙，请重试');
                }
            }else{
                M()->rollback();
                return array('status'=>0,'msg'=>'系统繁忙，请重试');
            }
        }else{
            return array('status'=>$res['status'],'msg'=>$res['msg']);
        }
    }

    public function cancelWithdraw($uid,$id){
        $map['id'] = $id;
        $map['uid'] = $uid;
        M()->startTrans();
        $info = $this->lock(true)->where($map)->find();
        if($info['withdraw_status']!=0){
            $this->commit();
            return array('status'=>0,'msg'=>'系统繁忙，请重试');
        }
        $newid = $this->where($map)->delete();
        if($newid){
            $mm = new MemberMoneyModel();
            $res = $mm->updateMemberMoney($uid,23,$info['withdraw_money'],'撤消提现',0,$info['order']);
            if($res){
                M()->commit();
                return array('status'=>1,'msg'=>'撤销成功');
            }else{
                M()->rollback();
                return array('status'=>0,'msg'=>'撤销失败，请重试');
            }
        }else{
            M()->rollback();
            return array('status'=>0,'msg'=>'撤销失败，请重试');
        }
    }

    /**
     * 检测手续费规则，并返回手续费信息
     * @param $money
     * @param $back_money
     * @return mixed
     */
    public function withdrawFee($money,$back_money){
        $conf = get_global_setting();
        $tqfee = explode("|",$conf['fee_tqtx']);
        switch(count($tqfee)){
            case 2:
                $fee = $tqfee[0]; //手续费
                $message = "您好，您申请提现{$money}元，收取提现手续费{$fee}元，确认要提现吗？";
                $status = 1;
                break;
            case 3:
                $fee1[0] = explode("-",$tqfee[0]);
                $fee1[1] = explode("-",$tqfee[1]);
                if(($money-$back_money)>=0){
                    $maxfee1 = ($money-$back_money)*$fee1[0][0]/1000;
                    if($maxfee1>=$fee1[0][1]){
                        $maxfee1 = $fee1[0][1];
                    }

                    $maxfee2 = $back_money*$fee1[1][0]/1000;
                    if($maxfee2>=$fee1[1][1]){
                        $maxfee2 = $fee1[1][1];
                    }

                    $fee = $maxfee1+$maxfee2;
                }else{
                    $fee = $back_money*$fee1[1][0]/1000;
                }
                $fee=round($fee,2);
                if($money <= $back_money)
                {
                    $message = "您好，您申请提现{$money}元，小于目前的回款总额{$back_money}元，因此无需手续费，确认要提现吗？";
                }else{
                    $t_money = $money-$back_money;
                    $message = "您好，您申请提现{$money}元，其中有{$back_money}元在回款之内，无需提现手续费，另有{$t_money}元需收取提现手续费{$fee}元，确认要提现吗？";
                }
                $status = 1;
                break;
            default:
                $status = 0;
                $message = "提现规则设置有误，请联系管理员";
                break;
        }
        $data['status'] = $status;
        $data['msg'] = $message;
        $data['fee'] = $fee;
        return $data;
    }


    public function doEditWithdraw($obj,$admin_uname){
        $id = intval($obj['id']);
        $status = intval($obj['withdraw_status']);
        $deal_info = $obj['deal_info'];
        $secondfee = floatval($obj['withdraw_fee']);
        $deal_user = $admin_uname;

        $map['id'] = $id;
        $count = $this->where($map)->count();
        if(!$count){
            return array('status'=>0,'msg'=>'该提现不存在');
        }
        $info = $this->find($id);
        if($info['add_time']&&$info['withdraw_status']!=0&&$status==1){
            return array('status'=>0,'msg'=>'此提现初审已处理过，请不要重复处理！');
        }
        if($status<=$info['withdraw_status']&&$status==2){
            return array('status'=>0,'msg'=>'此提现复审已处理过，请不要重复处理！');
        }
        $data['withdraw_status'] = $status;
        $data['deal_info'] = $deal_info;
        $data['deal_time'] = time();
        $data['deal_user'] = $deal_user;
        $mm = new MemberMoneyModel();
        if($obj['daifu']==1&&$status!=3){
            $vo = $this->find($id);
            $daozhao = $vo['withdraw_money'] - $secondfee;
            $res = $this->daifu($id,$obj['bank_num'],$obj['real_name'],$daozhao);
            $result_daifu = $res['result'];
            $result_daifu_d = $res['datax'];
            if($result_daifu != FALSE){
                if($result_daifu['status'] == 1){
                    addInnerMsg($info['uid'],"您的提现申请已通过","您的提现申请已通过，正在处理中");
                    $data['second_fee'] = $secondfee;
                    $data['success_money'] = $info['withdraw_money']-$secondfee;
                    $data['reqNo'] = $result_daifu_d['reqNo'];
                    $data['deal_info'] = $info['deal_info'].";通联返回：".$result_daifu['msg'];
                    if($result_daifu['state'] == 1){
                        $msg = "提现成功,扣除实际手续费".$vo['second_fee']."元，减去冻结资金，到账金额".($vo['withdraw_money'] - $vo['second_fee'])."元";
                        $res = $mm->updateMemberMoney($info['uid'],22,-$info['withdraw_money'],$msg,0,$info['order']);
                        addInnerMsg($info['uid'],"您的提现已完成","您的提现已完成");
                        $data['success_money'] = $info['withdraw_money']-$info['second_fee'];
                        $data['deal_info'] .= ";最终返回：".$result_daifu['end_msg'];
                        $data['withdraw_status'] = 2;
                        $mmsg = L('修改成功,支付结果：'.$result_daifu['end_msg']);
                    }else{
                        $mmsg = L('修改成功,通联返回：'.$result_daifu['msg']);
                    }
                    $result = M("member_withdraw")->where("id = {$id}")->save($data);
                    return array('status'=>1,'msg'=>$mmsg);
                }else{
                    return array('status'=>0,'msg'=>L('修改失败,通联返回：'.$result_daifu['msg']));
                }
            }else{
                return array('status'=>0,'msg'=>L('修改失败'));
            }

        }

        //保存当前数据对象

        $res = true;
        ////////////////////////
        if($info['withdraw_status']!=3 && $status==3){
            $res = $mm->updateMemberMoney($info['uid'],24,$info['withdraw_money'],'提现未通过,返还',0,$info['order']);
            addInnerMsg($info['uid'],"您的提现申请审核未通过","您的提现申请审核未通过，处理说明：".$deal_info);
            $data['success_money'] = 0;

        }else if($info['withdraw_status']!=2 && $status==2){
            $res = $mm->updateMemberMoney($info['uid'],22,-$info['withdraw_money'],"提现成功,扣除实际手续费".$info['second_fee']."元，到账金额".$info['success_money']."元",0,$info['order']);
            addInnerMsg($info['uid'],"您的提现已完成","您的提现已完成");
            $data['success_money'] = $info['withdraw_money']-$info['second_fee'];
        }elseif($info['withdraw_status'] !=1 && $status == 1){
            addInnerMsg($info['uid'],"您的提现申请已通过","您的提现申请已通过，正在处理中");
            $data['second_fee'] = $secondfee;
            $data['success_money'] = $info['withdraw_money']-$secondfee;
        }
        //////////////////////////
        $result = $this->where($map)->save($data);

        if ($result&&$res) { //保存成功
            $sl = new SmsLogModel();
            $m = new MembersModel();
            $phone = $m->getFieldById($info['uid'],'user_phone');
            $status==2 && $sl->sendSms($phone,'withdraw',array('add_time'=>date("Y-m-d",$info['add_time']),'money'=>$info['withdraw_money']));
            return array('status'=>1,'msg'=>'处理成功');
        } else {
            return array('status'=>0,'msg'=>'处理失败');
        }
    }
    private function daifu($id,$bank_num,$real_name,$money){


        $SUBMIT_TIME = date("YmdHis",time());
        $money100 = $money * 100;
        $id_no = sprintf("%06d",$id);
        $allinpayconfig = FS("Dynamic/allinpay");

        $reqsn = M('member_withdraw')->getFieldByid($id,'reqNo');
        $order = $allinpayconfig['allinpay']['USER_NAME'].$SUBMIT_TIME.$id_no;
        $order = $reqsn==''?$order:$reqsn;

        $params = array(
            'INFO' => array(
                'TRX_CODE' => '100014',
                'VERSION' => '03',
                'DATA_TYPE' => '2',
                'LEVEL' => '6',
                'USER_NAME' => trim($allinpayconfig['allinpay']['USER_NAME']),
                'USER_PASS' => trim($allinpayconfig['allinpay']['USER_PASS']),
                'REQ_SN' => $order
            ),
            'TRANS' => array(
                'BUSINESS_CODE' => '09900',
                'MERCHANT_ID' => trim($allinpayconfig['allinpay']['MERCHANT_ID']),
                'SUBMIT_TIME' => $SUBMIT_TIME,
                'ACCOUNT_NO' => $bank_num,
                'ACCOUNT_NAME' => $real_name,
                'ACCOUNT_PROP' => 0,
                'AMOUNT' => $money100,
                'CURRENCY' => 'CNY',
                'ID_TYPE' => '0'
            )
        );
        require_once(C("APP_ROOT")."Lib/Pay/allinpay/libs/ArrayXml.class.php");

        require_once(C("APP_ROOT")."Lib/Pay/allinpay/libs/cURL.class.php");

        require_once(C("APP_ROOT")."Lib/Pay/allinpay/libs/PhpTools.class.php");

        $datax = array();
        $datax["reqJson"] = json_encode($params);
        $datax["reqNo"] = $order;
        M("member_withdraw")->where("id = {$id}")->save($datax);
        header('Content-Type: text/html; Charset=UTF-8');
        $tools = new PhpTools();
        $result = $tools->send($params);
        return array('result'=>$result,'datax'=>$datax);
    }
}
?>