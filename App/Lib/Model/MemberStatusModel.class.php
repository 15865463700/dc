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
// 会员模型
class MemberStatusModel extends BaseModel {
	protected $tableName = 'members_status';
    protected $pk = 'uid';

    public function getList($field = '*',$obj = array(),$join = array()){

        $map = $obj['map'];
        $group = $obj['group'];
        $order = $obj['order'];
        $limit = $obj['limit'];

        $per = C('DB_PREFIX');
        $table = "{$per}".$this->tableName;
        if($order==''){
            $order = '`uid` desc';
            if(is_array($join)){
                $order = 'ms.`uid` desc';
            }
        }
        if(is_array($join)){
            $table = "{$per}".$this->tableName.' as ms';
        }
        return $this->_getList($field,$table,$map,$join,$group,$order,$limit);
    }


    /**
     * @param $uid
     * @param $type -认证类型，检索类型用，例如：传id则对应id_status和id_credits
     * @param $status
     * @param $log_type -积分类型
     * @param $log_info -认证类型
     * @return mixed
     */
    public function setMemberStatus($uid, $type, $status, $log_type, $log_info){
        $uid = intval($uid);
        $status = intval($status);

        $type_status = $type.'_status';
        $type_credits = $type.'_credits';
        $integration = FS('Dynamic/integration');
        $credits = $integration[$type]['fraction'];
        $field = "uid,".$type_status.",".$type_credits;
        $map['uid'] =  $uid;

        $insert_info = $this->field($field)->where($map)->find();
        if(!$insert_info['uid']){  //如果记录不存在
            $data['uid'] = $uid;
            $data[$type_status] = $status;
            if($status===1){
                $data[$type_credits] = $credits;
            }
            $nid = $this->add($data);
        }else{ //如果记录存在切积分不存在  判断状态是否为1（不给积分） 为0 （认为是第一次审核给积分）
            $data[$type_status] = $status;
            if(!($insert_info[$type_credits] or $insert_info[$type_status]===1 or $status===2)){ //状态为 1 or 积分已存在 or 修改状态为2
                $data[$type_credits] = $credits;
            }
            $nid = $this->where($map)->save($data);
        }

        if($status === 1 && $nid){
            memberCreditsLog($uid, $log_type, $credits, $log_info."认证通过,奖励积分{$credits}");
        }
        return $nid;
    }

}
?>