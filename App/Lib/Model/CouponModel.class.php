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
class CouponModel extends BaseModel {
    protected $tableName = 'coupon_interest_config';
    protected $pk = 'id';
    public $Ctype = array(
        1=>'注册',
        2=>'登录',
//        3=>'推广',
//        4=>'投资',
        11=>'管理员下发'
    );
    public $Cstatus = array(
        0 => '活动未开始',
        1 => '正在下发中',
        2 => '活动已结束',
        3 => '已下发',
        11=> '等待下发'

    );
    public $canDay = array(
        0=>'不可用',
        1=>'可用'
    );
    public function __construct(){
        parent::__construct();
        $this->updateCoupon();
    }
    public function getConfList($field = '*',$obj = array(),$join = array()){
        $map = $obj['map'];
        $group = $obj['group'];
        $order = $obj['order'];
        $limit = $obj['limit'];

        $per = C('DB_PREFIX');
        $table = "{$per}".$this->tableName;
        if($order==''){
            $order = '`id` desc';
            if(is_array($join)){
                $order = 'c.`id` desc';
            }
        }
        if(is_array($join)){
            $table = "{$per}".$this->tableName.' as c';
        }
        return $this->_getList($field,$table,$map,$join,$group,$order,$limit);
    }

    public function editCouponConf($obj,$admin_uname){
        $status = 0;
        $msg = '操作失败';
        $cid = $obj['id'];
        if($cid){
            $statusx = $this->getFieldById($cid,'status');
            if($statusx!=0){
                return array('status'=>$status,'msg'=>'加息券只有未上线时可以修改');
            }
        }
        if($this->create($obj)){
            switch($this->type){
                case 1:
                case 2:
                case 3:
                case 4:
                case 11:
                    break;
                default:
                    $msg = '加息券错误';
                    break;
            }
            $this->online_time  = strtotime($this->online_time);
            $this->deadline  = strtotime($this->deadline);
            $this->admin_uname  = $admin_uname;
            if($this->id){
                $nid = $this->save();
            }else{
                $this->add_time  = time();
                $nid = $this->add();
            }
            if($nid!==false){
                $status = 1;
                $msg = '操作成功';
            }
            return array('status'=>$status,'msg'=>$msg);
        }else{
            $msg = $this->getError();
        }
        return array('status'=>$status,'msg'=>$msg);
    }

    private function updateCoupon(){
        $where = array();
        $where['status'] = 0;
        $where['online_time'] = array("lt",time());
        $this->where($where)->setInc('status');
        $where = array();
        $where['status'] = 1;
        $where['deadline'] = array("lt",time());
        $this->where($where)->setInc('status');
    }
}
?>