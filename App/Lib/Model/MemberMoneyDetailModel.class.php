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
class MemberMoneyDetailModel extends BaseModel {
	protected $tableName = 'member_money_detail';
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
                    $order = 'md.`uid` desc';
                }
            }
            if(is_array($join)){
                $table = "{$per}".$this->tableName.' as md';
            }
            return $this->_getList($field,$table,$map,$join,$group,$order,$limit);
        }
    /**
     * 查排行榜
     * @param $top
     * @param $column
     * @param string $sc
     * @return mixed
     */
    public function rankingList($top,$column,$sc = 'DESC'){
        $field = "uid,{$column}";
        $map[$column] = array('gt',0);
        $order = $column.' '.$sc;
        $select = 'top'.$top;
        $list =  $this->switchModel("Adv")->field($field)->where($map)->order($order)->$select();
        $m = new MembersModel();
        foreach($list as $k => $v){
            $info = $m->getMemberInfo($v['uid'],'','user_phone,user_name');
            $list[$k]['user_name'] = $info['user_name'];
            $list[$k]['user_phone'] = $info['user_phone'];
        }
        return $list;
    }


}
?>