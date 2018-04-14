<?php
// +----------------------------------------------------------------------
// | ThinkPHP
// +----------------------------------------------------------------------
// | Copyright (c) 2008 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
// $Id$
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
class MarketAddressModel extends BaseModel {
	protected $tableName = 'market_address';
    protected $pk = 'id';

    function __construct(){
        parent::__construct();
        $per = C('DB_PREFIX');
        $this->table = $per.$this->tableName;
    }

    /**
     * @param string $field
     * @param array $map
     * @param string $limit
     * @param array $join
     * @param string $group
     * @param string $order
     * @param string $type
     * @return mixed
     */
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
     * 设置默认地址
     * @param $uid
     * @param $id
     * @return int
     */
    public function setDefaultAddress($uid,$id){
        M()->startTrans();
        $nodefault['status'] = 0;
        $default['status'] = 1;
        $map=array();
        $map['uid'] = $uid;
        $res = $this->where($map)->save($nodefault);
        $res1 = $this->where("id=".$id)->save($default);
        if($res!==false && $res1){
            M()->commit();
            return 1;
        }else{
            M()->rollback();
            return 0;
        }
    }

    /**
     * 单独取消默认地址
     * @param $id
     * @return int
     */
    public function cancelDefaultAddress($id){
        $nodefault['status'] = 0;
        $res = $this->where("id=".$id)->save($nodefault);
        if($res){
            return 1;
        }else{
            return 0;
        }
    }

    public function editAddress($uid,$obj)
    {
        M()->startTrans();
        $data['uname'] = $obj['name'];
        $data['phone'] = $obj['phone'];
        $data['province'] = $obj['province'];
        $data['city'] = $obj['city'];
        $data['area'] = $obj['area'];
        $data['address'] = $obj['address'];
        $data['remark'] = $obj['remark'];
        $data['uid'] = $uid;
        $data['add_time'] = time();
        $data['add_ip'] = get_client_ip();
        if($obj['id']){
            $data['id'] = $obj['id'];
            $res = $this->save($data);
            $msg = '编辑';
        }else{
            $count = $this->where("uid={$uid} and status = 1")->count();
            if($count){
                $res = $this->add($data);
            }else{
                $data['status']=1;
                $res = $this->add($data);
            }
            $msg = '添加';
        }
        if($res){
            M()->commit();
            return array('status'=>1,'msg'=>$msg.'成功');
        }else{
            M()->rollback();
            return array('status'=>0,'msg'=>$msg.'失败');
        }
    }
}
?>