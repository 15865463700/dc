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
// 模型
class BaseModel extends Model {

    /**
     * @param $field
     * @param $table
     * @param $map
     * @param $join
     * @param $group
     * @param $order
     * @param $limit
     * @param $type
     * @return mixed
     */
    protected function _getList($field,$table,$map,$join,$group,$order,$limit){
        if($limit=='all'){
            $list = $this->table($table)->field($field)->join($join)->where($map)->group($group)->order($order)->select();
            return $list;
        }else {
            if ($limit == 1) {
                $list = $this->table($table)->field($field)->join($join)->where($map)->group($group)->order($order)->limit($limit)->find();
                return $list;
            } else {
                $pagesize = $limit == '' ? 20 : $limit;
                import("ORG.Util.Page");
                if($group){
                    $buildSql = $this->table($table)->join($join)->where($map)->group($group)->buildSql();
                    $newsql = M()->query("select count(*) as tc from {$buildSql} as t");
                    $count = $newsql[0]['tc'];
                }else{
                    $count = $this->table($table)->join($join)->where($map)->group($group)->count();
                }
                $p = new Page($count, $pagesize);
                $page = $p->show();
                $Lsql = "{$p->firstRow},{$p->listRows}";
                $list = $this->table($table)->field($field)->join($join)->where($map)->group($group)->order($order)->limit($Lsql)->select();
                $row['list'] = $list;
                $row['page'] = $page;
                $row['count'] = $count;
                $row['total'] = ceil($count / $pagesize);
                $row['nowPage'] = isset($_REQUEST['p']) ? $_REQUEST['p'] : 1;
                return $row;
            }
        }
    }

    protected function CreateOrder(){
        return date("YmdHis").mt_rand(1000,9999);
    }
}
?>