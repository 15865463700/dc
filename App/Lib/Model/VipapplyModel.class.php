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
 * Class VipApplyModel
 * vip记录模型
 */
class VipApplyModel extends BaseModel {
	protected $tableName = 'vip_apply';
    protected $pk = "id";



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
                $order = 'v.`id` desc';
            }
        }
        if(is_array($join)){
            $table = "{$per}".$this->tableName.' as v';
        }
        return $this->_getList($field,$table,$map,$join,$group,$order,$limit);
    }
    /**
     * Vip申请
     * @param $uid
     * @param string $obj
     * @return array
     */
    public function vipApply($uid,$obj=''){
        if(''===$obj){
            return array('status'=>0,'msg'=>'参数未提交');
        }
        $m = new MembersModel();
        $mmdata = $m->getMemberInfo($uid,'Money','id');
        $datag = get_global_setting();
        $mmpd=$mmdata['account_money']+$mmdata['back_money']-$datag['fee_vip'];
        if($mmpd<0){
            return array('status'=>0,'msg'=>'您的余额不足,请充值后再申请');
        }
        $order = parent::CreateOrder();
        $mm = new MemberMoneyModel();
        $res = $mm->updateMemberMoney($uid,5,-$datag['fee_vip'],"Vip申请，冻结{$datag['fee_vip']}元",0,$order);
        if($res){
            $kfid = intval($obj['kfid']);
            $des = text($obj['des']);
            $savedata['kfid'] = $kfid;
            $savedata['des'] = $des;
            $savedata['uid'] = $uid;
            $savedata['add_time'] = time();
            $savedata['status'] = 0;
            $savedata['order'] = $order;
            $result = $this->add($savedata);
            if($result){
                $verify['vip_status'] = 3;
                $data['Verify'] = $verify;
                $m->updateMemberInfo($uid,$data);
                return array('status'=>1,'msg'=>'申请成功，等待审核');
            }else{
                return array('status'=>0,'msg'=>'系统繁忙，请稍后再试');
            }
        }else{
            return array('status'=>0,'msg'=>'申请失败，请稍后再试');
        }
    }

    public function doVipApply($id,$status,$deal_user,$deal_info){
        $datag = get_global_setting();
        $info = $this->find($id);
        if($info['status']){
            return array('status'=>0,'msg'=>'已经审核过，不可重复审核');
        }
        M()->startTrans();
        $uid = $info['uid'];
        $kfid = $info['kfid'];
        $data['id'] = $id;
        $data['status'] = $status;
        $data['deal_time'] = time();
        $data['deal_user'] = $deal_user;
        $data['deal_info'] = $deal_info;
        $nid  = $this->save($data);
        if($nid){
            $mm = new MemberMoneyModel();
            if($status==1){
                $mm->updateMemberMoney($uid,6,-$datag['fee_vip'],'VIP升级成功，扣除冻结的VIP费用');
                $inte = new IntegralModel();
                $inte->memberLimitLog($uid,11,$datag['limit_vip'],"VIP审核通过");
                addInnerMsg($uid,"您的VIP申请审核已通过","您的VIP申请审核已通过");
                $newx = setMemberStatus($uid, 'vip', 2, 13, 'vip');
                $m = new MembersModel();
                $vo = $m->getMemberInfo($uid,'','user_phone,user_name,recommend_id,user_leve,time_limit');
                $sl = new SmsLogModel();
                $sl->sendSms($vo['user_phone'],'vip');
                if($newx){
                    $savex['customer_id'] = $kfid;
                    $savex['customer_name'] = get_admin_name($kfid);
                    $savex['user_leve'] = 1;
                    if($vo['time_limit']>time()) $vo['time_limit'] = strtotime("+1 year",$vo['time_limit']);
                    else $savex['time_limit'] = strtotime("+1 year");
                    $m->updateMemberInfo($uid,$savex);
                }
                M()->commit();
                alogs("Vipapply",0,1,'VIP申请审核通过！');//管理员操作日志
                return array('status'=>1,'msg'=>'操作成功：审核通过');
            }else{
                $mm->updateMemberMoney($uid,7,$datag['fee_vip'],'vip审核驳回，退回冻结金额');
                addInnerMsg($uid,"您的VIP申请审核未通过","您的VIP申请审核未通过");
                setMemberStatus($uid, 'vip', 0, 13, 'vip');
                alogs("Vipapply",0,0,'VIP申请审核未通过！');//管理员操作日志
                M()->commit();
                return array('status'=>1,'msg'=>'操作成功：审核未通过');
            }

        }else{
            M()->rollback();
            return array('status'=>0,'msg'=>'审核失败请重试');
        }

    }
}
?>