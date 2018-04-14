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
 * Class IntegralModel
 * 积分处理模型
 */
class IntegralModel extends BaseModel {
    protected $tableName = 'member_integral_log';//积分记录
    protected $pk = 'id';
    protected $tableName1 = 'member_limit_log';//额度记录

    /**
     * 积分记录
     * @param string $field
     * @param array $obj
     * @param string $join
     * @return mixed
     */
    public function getIntegralList($field = '*',$obj = array(),$join = ''){

        $map = $obj['map'];
        $group = $obj['group'];
        $order = $obj['order'];
        $limit = $obj['limit'];

        $per = C('DB_PREFIX');
        $table = "{$per}".$this->tableName;
        if($order==''){
            $order = '`id` desc';
            if(is_array($join)){
                $order = 'mil.`id` desc';
            }
        }
        if(is_array($join)){
            $table = "{$per}".$this->tableName.' as mil';
        }
        return $this->_getList($field,$table,$map,$join,$group,$order,$limit);
    }

    /**
     * 额度记录
     * @param string $field
     * @param array $obj
     * @param array $join
     * @return mixed
     */
    public function getLimitList($field = '*',$obj = array(),$join = array()){

        $map = $obj['map'];
        $group = $obj['group'];
        $order = $obj['order'];
        $limit = $obj['limit'];

        $per = C('DB_PREFIX');
        $table = "{$per}".$this->tableName1;
        if($order==''){
            $order = '`id` desc';
            if(is_array($join)){
                $order = 'mll.`id` desc';
            }
        }
        if(is_array($join)){
            $table = "{$per}".$this->tableName1.' as mll';
        }
        return $this->_getList($field,$table,$map,$join,$group,$order,$limit);
    }

    /**
     * 如果是消费积分动作，则判断可用积分
     * @param $uid
     * @param $integral
     * @return int
     */
    public function checkIntegral($uid,$integral){
        $status = 0;
        $m = new MembersModel();
        $minfo = $m->find($uid);
        if($integral>$minfo['integral']){
            $status = 1;
        }
        return $status;
    }

    /**
     * 积分记录
     * @param $uid
     * @param $type
     * @param $integral
     * @param string $info
     * @return bool
     */
    public function memberIntegralLog($uid,$type,$integral,$info="无"){

        if($integral==0) return true;
        $done = false;
        $m = new MembersModel();
        $minfo = $m->find($uid);

        $data['uid'] = $uid;
        $data['type'] = $type;
        $data['affect_integral'] = $integral;
        $data['active_integral'] = $integral + $minfo['active_integral'];
        $data['integral'] = $integral + $minfo['integral'];
        $data['info'] = $info;
        $data['add_time'] = time();
        $data['add_ip'] = get_client_ip();
        $integral<0 && $data['integral'] = $minfo['integral'];
        $nid = $this->add($data);
        $map['id'] = $uid;
        $xid = $m->where($map)->setInc('active_integral',$integral);
        $yid = true;
        $integral>0 && $yid = $m->where($map)->setInc('integral',$integral);
        //消费积分为负数，消费积分只减活跃积分，不减总积分
        if($nid && $xid && $yid){
            $done = true;
        }
        return $done;
    }

    /**
     * 额度记录
     * @param $uid
     * @param $type
     * @param $limit
     * @param string $info
     * @return bool
     */
    public function memberLimitLog($uid,$type,$limit,$info=""){
        $xva = floatval($limit);
        if(empty($xva)) return true;
        $done = false;
        M()->startTrans();
        $data['uid'] = $uid;
        $data['type'] = $type;
        $data['info'] = $info;
        $data['add_time'] = time();
        $data['add_ip'] = get_client_ip();
        $data['credit_limit'] = $limit;
//        $data['borrow_vouch_limit'] = 0;
//        $data['invest_vouch_limit'] = 0;
        switch($type){
            case 1://信用标初审通过暂扣
            case 4://信用标复审未通过返回
            case 7://标的完成，返回
            case 12://流标，返回
                $credit_limit = 0;
                $credit_cuse = $limit;
                break;
            case 11://VIP审核通过
                $credit_cuse = $limit;
                $credit_limit = $limit;
                break;
        }
        $per = C('DB_PREFIX');
        $table = "{$per}".$this->tableName1;
        $newid = $this->table($table)->add($data);
        //账户更新
        $mmoney['credit_limit']=array('exp',"credit_limit+{$credit_limit}");
        $mmoney['credit_cuse']=array('exp',"credit_cuse+{$credit_cuse}");
//        $mmoney['borrow_vouch_cuse']=array('exp',"borrow_vouch_cuse+{$data['borrow_vouch_cuse']}");
//        $mmoney['invest_vouch_cuse']=array('exp',"invest_vouch_cuse+{$data['invest_vouch_cuse']}");
        $m = new MembersModel();
        $datam['Extra'] = $mmoney;
        $res = $m->updateMemberInfo($uid,$datam);
        if($newid&&$res){
            M()->commit();
            $done = true;
        }else{
            M()->rollback();
        }
        return $done;
    }

}
?>