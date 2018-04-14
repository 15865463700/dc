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
 * Class OrderListModel
 * 扣款对应的订单包含的可用和回款资金
 * 特别用于资金回退时的处理
 */
class OrderListModel extends baseModel {
	protected $tableName = 'member_order_detail';
	protected $pk = 'id';

    /**
     * 增加订单对应的可用回款
     * @param $order
     * @param $money
     * @param $back_money
     */
    public function addLog($order,$money,$back_money){
        $account = $money-$back_money;

        $data['order'] = $order;
        $data['back_money'] = $back_money;
        $data['account_money'] = $account;
        $data['add_time'] = time();
        $data['add_ip'] = get_client_ip();
        $this->add($data);
    }

    /**
     * 查询订单对应的可用回款
     * @param $order
     * @return mixed
     */
    public function getBackMoney($order){
        $map['order'] = $order;
        $field = "back_money,account_money";
        return $this->field($field)->where($map)->find();
    }

    public function getWithdrawFee($order){
        $per = C('DB_PREFIX');
        $map['order'] = $order;
        $info = $this->table($per."member_withdraw")->where($map)->find();
        return $info['second_fee'];
    }
}
?>