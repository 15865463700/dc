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
class MarketModel extends BaseModel {
	protected $tableName = 'market_goods';
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
        $table = $this->table;
        if(is_array($join)){
            $table .=' as t';
        }
        return $this->_getList($field,$table,$map,$join,$group,$order,$limit);
    }

}
?>