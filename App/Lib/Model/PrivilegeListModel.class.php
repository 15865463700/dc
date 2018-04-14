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
 * Class PrivilegeListModel
 */
class PrivilegeListModel extends BaseModel {
    protected $tableName = 'privilege_list';
    protected $pk = 'id';
    public $lstatus = array(
        1=>'收益发放中',
        2=>'收益发放完毕'
    );
    public function __construct(){
        parent::__construct();
        $per = C('DB_PREFIX');
        $this->table = "{$per}".$this->tableName;
    }
    public function getList($field = '*',$obj = array(),$join = ''){
        $map = $obj['map'];
        $group = $obj['group'];
        $order = $obj['order'];
        $limit = $obj['limit'];
        if($order==''){
            $order = '`id` desc';
            if(is_array($join)){
                $order = 't.`id` desc';
            }
        }
        if(is_array($join)){
            $this->table .= ' as t';
        }
        return $this->_getList($field,$this->table,$map,$join,$group,$order,$limit);
    }

    /**
     * 领取特权金
     * @param $uid
     * @param $pid
     * @return array
     */
    public function addList($uid,$pid){
        $pri = new PrivilegeModel();
        $pinfo = $pri->find($pid);
        if(!$pinfo){
            return array('status' => 0, 'msg' => "特权金不存在");
        }
        $count = $this->where("cid = {$pid} and uid = {$uid}")->count();
        if($count){
            return array('status' => 0, 'msg' => "该特权金您已经领取");
        }
        if($pinfo['status']==0){
            return array('status' => 0, 'msg' => "该特权金活动尚未开始");
        }
        if($pinfo['status']==2){
            return array('status' => 0, 'msg' => "该特权金活动已结束");
        }

        $m = new MembersModel();
        $link = array('MoneyDetail','Verify');
        $minfo = $m->getMemberInfo($uid,$link,'id');
        $collect = $minfo['suc_capital']-$minfo['receive_capital']-$minfo['sell_debt_capital'];
        $conditions = unserialize($pinfo['conditions']);
        if(isset($conditions['phone'])&&$conditions['phone']!=$minfo['phone_status']){
            return array('status' => 0, 'msg' => "请先完成手机认证");
        }
        if(isset($conditions['idcard'])&&$conditions['idcard']!=$minfo['id_status']){
            return array('status' => 0, 'msg' => "请先完成实名认证");
        }
        if(isset($conditions['email'])&&$conditions['email']!=$minfo['email_status']){
            return array('status' => 0, 'msg' => "请先完成邮箱认证");
        }
        if(!empty($conditions['principal'])&&$conditions['principal']>$collect){
            return array('status' => 0, 'msg' => "您的待收本金不足".$conditions['principal']);
        }
        M()->startTrans();
        $day_reward = sprintf("%.2f",$pinfo['money']/360*$pinfo['rate']/100);
        $data['title'] = $pinfo['title'];
        $data['cid'] = $pinfo['id'];
        $data['money'] = $pinfo['money'];
        $data['total'] = $pinfo['total'];
        $data['uid'] = $uid;
        $data['next_time'] = strtotime(date("Y-m-d")."+1 day");
        $data['rate'] = $pinfo['rate'];
        $data['add_time'] = time();
        $data['day_reward'] = $day_reward;
        $data['total_reward'] = $day_reward*$pinfo['total'];
        $nid  = $this->add($data);
        $res = $pri->where("id = {$pinfo['id']}")->setInc('send_count');
        if($nid&&$res){
            M()->commit();
            return array('status' => 1, 'msg' => "领取成功");
        }else{
            M()->rollback();
            return array('status' => 0, 'msg' => "领取失败");
        }

    }

    /**
     * 特权金收益发放
     * 配置计划任务的时间点需要再每日的0点之后，1点之前即可
     */
    public function privilegeReward(){
        $map['status'] = 1;
        $map['next_time'] = array('lt',time());
        $list = $this->where($map)->select();
        $mm = new MemberMoneyModel();
        foreach($list as $k => $v){
            $data = array();
            M()->startTrans();
            $res = $mm->updateMemberMoney($v['uid'],58,$v['day_reward'],"收到特权金'{$v['title']}'第{$v['next_sort']}次收益{$v['day_reward']}元");
            $v['next_sort']!=$v['total'] && $data['next_sort'] = array('exp',"next_sort+1");
            $v['next_sort']!=$v['total'] && $data['next_time'] = strtotime(date("Y-m-d",$v['next_time'])."+1 day");
            $v['next_sort']==$v['total'] && $data['status'] = 2;
            $data['has_reward'] = array('exp',"has_reward+{$v['day_reward']}");
            $data['id'] = $v['id'];
            $nid = $this->save($data);
            if($res&&$nid){
                M()->commit();
            }else{
                M()->rollback();
            }
        }
    }

}
?>