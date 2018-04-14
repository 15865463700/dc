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
 * Class CouponModel
 * 各类红包模型
 */
class CouponListModel extends BaseModel {
    protected $tableName = 'coupon_interest_list';
    protected $pk = 'id';
    public $lstatus = array(
        0=>'可用',
        1=>'使用锁定中',
        10=>'已使用',
        20=>'过期未使用'
    );
    public function __construct(){
        parent::__construct();
        $this->updateCouponList();
        $per = C('DB_PREFIX');
        $this->table = "{$per}".$this->tableName.' as t';
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
        return $this->_getList($field,$this->table,$map,$join,$group,$order,$limit);
    }

    public function userCouponList($uid,$type){
        $md = new MemberMoneyDetailModel();
        $c = new CouponModel();
        M()->startTrans();
        $info = $md->field("capital")->where("uid = {$uid}")->find();
        $map['type'] = $type;
        $map['status'] = 1;
        $where['map'] = $map;
        $where['limit'] = 'all';
        $field = "*";
        $list = $c->getConfList($field,$where);
        $data = array();
        foreach($list as $k => $v){
            $count = $this->where("uid = {$uid} and c_id = {$v['id']}")->count();
            if($count){
                continue;
            }
            if($v['conditions']==''&&$type==11){
                continue;
            }
            $conditions = unserialize($v['conditions']);
            unset($conditions['_URL_']);
            if($type==11&&$conditions){
                if($conditions['bj']=='>'&&($info['capital']-$conditions['capital'])<0){
                    continue;
                }
                if($conditions['bj']=='<'&&($info['capital']-$conditions['capital'])>0){
                    continue;
                }
                if($conditions['bj']=='='&&($info['capital']-$conditions['capital'])!=0){
                    continue;
                }
            }
            $data[] = array(
                'uid'=> $uid,
                'c_id' => $v['id'],
                'title' => $v['title'],
                'rate' => $v['rate'],
                'min_money' => $v['min_money'],
                'duration_from' => $v['duration_from'],
                'duration_to' => $v['duration_to'],
                'add_time' => time(),
                'deadline' => time()+86400*$v['day'],
                'can_day' => $v['can_day'],
                'remark' => '获得加息券，类型'.$c->Ctype[$v['type']],
            );
            $c->where("id = {$v['id']}")->setInc('send_count');
        }
        $res = $this->addAll($data);
        if($res){
            M()->commit();
        }else{
            M()->rollback();
        }
    }

    private function updateCouponList(){
        $where['status'] = 20;
        $where['deadline'] = array("gt",time());
        $this->where($where)->save(array('status'=>0));
        $where['status'] = 0;
        $where['deadline'] = array("lt",time());
        $this->where($where)->save(array('status'=>20));

    }

    /**
     * 获取可用的加息券
     * @param $uid
     * @param $borrow_id
     * @param $money
     * @return mixed
     */
    public function ajax_invest_list($uid,$borrow_id,$money){
        $b = new BorrowModel();
        $binfo = $b->find($borrow_id);
        $map['uid'] = $uid;
        $map['status'] = 0;
        $map['min_money'] = array('elt',$money);
        if($binfo['repayment_type']==1){
            $map['can_day'] = 1;
        }else{
            $map['duration_from'] =array('elt',$binfo['borrow_duration']);
            $map['duration_to'] =array('egt',$binfo['borrow_duration']);
        }
        $where['map'] = $map;
        $where['limit'] = 'all';
        $field = "id,title,FORMAT(rate/10,1) as rate";
        return $this->getList($field,$where);
    }

    public function updateCoupon($id,$status,$invest_id = 0,$borrow_id = 0){
        $data['borrow_id'] = $borrow_id;
        $data['invest_id'] = $invest_id;
        $data['status'] = $status;
        $data['id'] = $id;
        $old_status = $this->getFieldById($id,'status');
        $flag = 0;
        if($old_status == 0 && $status ==1){
            $flag = 1;
        }
        if($old_status == 1 && $status == 10){
            $flag = 1;
        }
        if($old_status == 1 && $status == 0){
            $flag = 1;
        }
        if($flag){
            $nid = $this->save($data);
            if($nid){
                return true;
            }else{
                return false;
            }
        }else{
            return false;
        }

    }
}
?>