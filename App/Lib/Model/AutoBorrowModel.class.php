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
 * Class AutoBorrowModel
 * 自动投标
 */
class AutoBorrowModel extends BaseModel {
    protected $tableName = 'auto_borrow';
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
                $order = 'ab.`id` desc';
            }
        }
        if(is_array($join)){
            $table = "{$per}".$this->tableName.' as ab';
        }
        return $this->_getList($field,$table,$map,$join,$group,$order,$limit);
    }

    /**
     * 散标自动投标
     * @param $borrow_id
     * @return bool
     */
    public function autoBorrowInvest($borrow_id){
        $conf = get_global_setting();
        $b = new BorrowModel();
        $field = "borrow_uid,is_new,borrow_money,borrow_type,repayment_type,
        borrow_interest_rate,borrow_duration,has_borrow,
        borrow_max,borrow_min,can_auto";
        $binfo = $b->field($field)->find($borrow_id);

        $map['ab.is_use'] = 1;
        $map['ab.borrow_type'] = 1;
        $map['ab.end_time'] = array("gt",time());
        $binfo['repayment_type'] ==1 && $map['ab.can_day'] = 1;

        $fields = "ab.*,(m.account_money+m.back_money) as money";
        $where['map'] = $map;
        $where['limit'] = 'all';
        $where['order'] = "ab.invest_time asc,ab.invest_id asc,ab.add_time asc";
        $join = array();
        $join[] = "__MEMBER_MONEY__ m ON ab.uid=m.uid";

        $autolist = $this->getList($fields,$where,$join);
        $max_auto = $conf['all_auto_rate']*$binfo['borrow_money']/100;
        if($max_auto<$binfo['borrow_min']){
            return false;
        }
        $max_auto = floor($max_auto/$binfo['borrow_min'])*$binfo['borrow_min'];
        if($max_auto>$binfo['borrow_money']){
            $max_auto = $binfo['borrow_money'];
        }
        $user_auto_max = $conf['auto_rate']*$binfo['borrow_money']/100;
        if($user_auto_max<$binfo['borrow_min']){
            return false;
        }
        $user_auto_max = floor($user_auto_max/$binfo['borrow_min'])*$binfo['borrow_min'];
        if($user_auto_max>$binfo['borrow_money']){
            $user_auto_max = $binfo['borrow_money'];
        }
//        $md = new MemberMoneyDetailModel();
        $bi = new BorrowInvestorModel();
        foreach($autolist as $key=>$v){
            if($max_auto<$binfo['borrow_min']){
                break;
            }
//            $capital = $md->where("uid = {$v['uid']}")->getField('capital');
//            if($capital==0){
//                continue;
//            }
            if( $v['uid']==$binfo['borrow_uid']) continue;
            if($v['interest_rate']>0&&$binfo['borrow_interest_rate']<$v['interest_rate']){
                continue;
            }
            if($binfo['repayment_type']!=1){
                if($v['duration_to'] > $v['duration_from'] && $v['duration_from'] > 0){//借款期限范围
                    if($binfo['borrow_duration']>$v['duration_to']||$binfo['borrow_duration']<$v['duration_from']){
                        continue;
                    }
                }
            }
            $invset_money = $v['money']-$v['account_money'];
            if($invset_money<$v['min_invest']){
                continue;
            }
            if($invset_money>$v['invest_money']){
                $invset_money = $v['invest_money'];
            }
            if($invset_money > $binfo['borrow_max'] && $binfo['borrow_max']>0){
                $invset_money = $binfo['borrow_max'];
            }
            if($invset_money>$max_auto){
                $invset_money = $max_auto;
            }
            if($invset_money>$user_auto_max&&$user_auto_max<=$max_auto){
                $invset_money = $user_auto_max;
            }
            if($invset_money<$binfo['borrow_min']){
                continue;
            }
            $invset_money = floor($invset_money/$binfo['borrow_min'])*$binfo['borrow_min'];

            if($invset_money<$v['min_invest']){
                continue;
            }
            M()->startTrans();
            $x = $bi->investMoney($v['uid'],$borrow_id,$invset_money,1);
            if($x){
                $max_auto = $max_auto - $invset_money;   // 减去剩余已投金额
                $this->where("id={$v['id']}")->setField("invest_time",time());
                $this->where("id={$v['id']}")->setField("invest_id",$x);
                MTip('chk27',$v['uid'],$borrow_id,$v['id']);//sss
                M()->commit();
            }else{
                M()->rollback();
            }
        }
        return true;
    }

    public function autoTransferInvest($borrow_id){
        $conf = get_global_setting();
        $tranb = new TransferModel();
        $field = "borrow_money,borrow_uid,per_transfer,
        borrow_interest_rate,borrow_duration,progress,
        transfer_total,transfer_out,borrow_max";
        $binfo = $tranb->field($field)->find($borrow_id);
        $transferInvestor = new TransferInvestorModel();
        $map['ab.is_use'] = 1;
        $map['ab.borrow_type'] = 3;
        $map['ab.end_time'] = array("gt",time());
        $fields = "ab.*,(m.account_money+m.back_money) as money";
        $where['map'] = $map;
        $where['limit'] = 'all';
        $where['order'] = "ab.invest_time asc,ab.invest_id asc,ab.add_time asc";
        $join = array();
        $join[] = "__MEMBER_MONEY__ m ON ab.uid=m.uid";

        $autolist = $this->getList($fields,$where,$join);

        $max_auto = floor($conf['all_auto_rate']*$binfo['transfer_total']/100);
        $max_auto>$binfo['transfer_total'] && $max_auto = $binfo['transfer_total'];

        $user_auto_max = floor($conf['auto_rate']*$binfo['transfer_total']/100);
        $user_auto_max > $max_auto && $user_auto_max = $max_auto;


        foreach($autolist as $key=>$v){
            if($max_auto<1){
                break;
            }
            if( $v['uid']==$binfo['borrow_uid']) continue;
            if($v['interest_rate']>0&&$binfo['borrow_interest_rate']<$v['interest_rate']){
                continue;
            }
            if($v['duration_to'] > $v['duration_from'] && $v['duration_from'] > 0){//借款期限范围
                if($binfo['borrow_duration']>$v['duration_to']||$binfo['borrow_duration']<$v['duration_from']){
                    continue;
                }
            }
            $invset_money = $v['money']-$v['account_money'];
            if($invset_money<$v['min_invest']){
                continue;
            }
            if($invset_money>$v['invest_money']){
                $invset_money = $v['invest_money'];
            }
            $invest_num = floor($invset_money/$binfo['per_transfer']);
            if($invest_num==0){
                continue;
            }
            if($invest_num>$binfo['borrow_max'] && $binfo['borrow_max']>0){
                $invest_num = $binfo['borrow_max'];
            }
            if($invest_num>$max_auto){
                $invest_num = $max_auto;
            }
            if($invest_num>$user_auto_max&&$user_auto_max<=$max_auto){
                $invest_num = $user_auto_max;
            }

            M()->startTrans();
            $x = $transferInvestor->investMoney($v['uid'],$borrow_id,$invest_num,$v['repayment_type'],1);
            if($x){
                $max_auto = $max_auto - $invest_num;
                $this->where("id={$v['id']}")->setField("invest_time",time());
                $this->where("id={$v['id']}")->setField("invest_id",$x);
                MTip('chk27',$v['uid'],$borrow_id,$v['id']);//sss
                M()->commit();
            }else{
                M()->rollback();
            }

        }
        return true;
    }

}
?>