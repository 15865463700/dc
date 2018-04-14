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
 * Class PrivilegeModel
 */
class PrivilegeModel extends BaseModel {
    protected $tableName = 'privilege_config';
    protected $pk = 'id';
    public $status = array(
        0 => '活动未开始',
        1 => '活动中',
        2 => '活动已结束'
    );
    public function __construct(){
        parent::__construct();
        $per = C('DB_PREFIX');
        $this->table = "{$per}".$this->tableName;
        $this->updatePrivilege();
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

    private function updatePrivilege(){
        $where['status'] = 0;
        $where['online_time'] = array('lt',time());
        $this->where($where)->setInc('status');
        $where['status'] = 1;
        $where['deadline'] = array('lt',time());
        $this->where($where)->setInc('status');
    }

    public function editPrivilege($obj,$admin_uname){
        $status = 0;
        $msg = '操作失败';
        $pid = $obj['id'];
        if($pid){
            $statusx = $this->getFieldById($pid,'status');
            if($statusx!=0){
                return array('status'=>$status,'msg'=>'特权金只有未上线时可以修改');
            }
        }
        if($this->create($obj)){
            $this->conditions = serialize($this->conditions);
            $this->online_time  = strtotime($this->online_time);
            $this->deadline  = strtotime($this->deadline)+86400-1;
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

}
?>