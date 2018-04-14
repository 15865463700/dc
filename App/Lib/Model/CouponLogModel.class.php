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
class CouponLogModel extends BaseModel {
    protected $tableName = 'coupon_interest_log';
    protected $pk = 'id';
    public function __construct(){
        parent::__construct();
        $per = C('DB_PREFIX');
        $this->table = "{$per}".$this->tableName;
    }
    public function getList($field = '*',$obj = array(),$join = array()){
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
    public function add_log($uid,$cid,$status,$invest_id = 0,$borrow_id = 0,$remark=''){
        $data['cid'] = $cid;
        $data['uid'] = $uid;
        $data['add_time'] = time();
        $data['remark'] = $remark;
        $nid = $this->add($data);
        if($nid){
            $cl = new CouponListModel();
            $res = $cl->updateCoupon($cid,$status,$invest_id,$borrow_id);
            return $res;
        }else{
            return false;
        }
    }


}
?>