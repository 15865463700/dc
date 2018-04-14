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
 * Class ArticleModel
 * 管理员模型
 */
class AusersModel extends BaseModel {
    protected $tableName = 'ausers';
    protected $pk = 'id';
    protected $tableName1 = 'auser_dologs';
    protected $tableName_acl = 'acl';

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
                $order = 'a.`id` desc';
            }
        }
        if(is_array($join)){
            $table = "{$per}".$this->tableName.' as a';
        }
        return $this->_getList($field,$table,$map,$join,$group,$order,$limit);
    }

    /**
     * 权限列表
     * @param string $field
     * @param array $obj
     * @param array $join
     * @return mixed
     */
    public function getAclList($field = '*',$obj = array(),$join = array()){

        $map = $obj['map'];
        $group = $obj['group'];
        $order = $obj['order'];
        $limit = $obj['limit'];

        $per = C('DB_PREFIX');
        $table = "{$per}".$this->tableName_acl;
        if($order==''){
            $order = '`id` desc';
            if(is_array($join)){
                $order = 'acl.`id` desc';
            }
        }
        if(is_array($join)){
            $table = "{$per}".$this->tableName_acl.' as acl';
        }
        return $this->_getList($field,$table,$map,$join,$group,$order,$limit);
    }


    /**
     * 管理员日志
     * @param $type
     * @param $tid
     * @param $tstatus
     * @param string $deal_info
     * @param string $deal_user
     * @return mixed
     */
    public function addAdminLog($type,$tid,$tstatus,$deal_info='',$deal_user=''){
        $arr = array();
        $arr['type'] = $type;
        $arr['tid'] = $tid;
        $arr['tstatus'] = $tstatus;
        $arr['deal_info'] = $deal_info;
        $arr['deal_user'] = $deal_user;
        $arr['deal_ip'] = get_client_ip();
        $arr['deal_time'] = time();
        //dump($arr);exit;
        $newid = M("auser_dologs")->add($arr);
        return $newid;
    }

}
?>