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
 * Class WebsiteFlowsModel
 * 网站收支模型
 */
class WebsiteFlowsModel extends BaseModel {
    protected $tableName = 'website_flows';
    protected $pk = 'id';

    public function getList($field = '*',$obj = array(),$join = array()){

        $map = $obj['map'];
        $group = $obj['group'];
        $order = $obj['order'];
        $limit = $obj['limit'];

        $per = C('DB_PREFIX');
        $table = "{$per}".$this->tableName;
        if($order==''){
            $order = '`date` desc';
            if(is_array($join)){
                $order = 'wf.`date` desc';
            }
        }
        if(is_array($join)){
            $table = "{$per}".$this->tableName.' as wf';
        }
        return $this->_getList($field,$table,$map,$join,$group,$order,$limit);
    }

    /**
     * 网站每日资金进出
     * @param $type
     * @param $money
     * @param $fee
     */
    public function upWebsiteFlows($type,$money,$fee){
        $data['date'] = date("Ymd");
        $id = $this->where($data)->getField('id');
        if(!$id){
            $id = $this->add($data);
        }
        switch($type){
            case 2:
                $data['admin_options'] = array("exp","admin_options-{$money}");
                $money < 0 && $data['web_in'] = array("exp","web_in-{$money}");
                $money > 0 && $data['web_out'] = array("exp","web_out+{$money}");
                break;
            case 3:
                $data['charge'] = array("exp","charge+{$money}");
                break;
            case 4:
                $data['charge_fee'] = array("exp","charge_fee-{$money}");
                $data['web_in'] = array("exp","web_in-{$money}");
                break;
            case 6:
                $data['vip_fee'] = array("exp","vip_fee-{$money}");
                $data['web_in'] = array("exp","web_in-{$money}");
                break;
            case 18:
                $data['borrow_fee'] = array("exp","borrow_fee-{$money}");
                $data['web_in'] = array("exp","web_in-{$money}");
                break;
            case 20:
                $data['service_fee'] = array("exp","service_fee-{$money}");
                $data['web_in'] = array("exp","web_in-{$money}");
                break;
            case 22:
                $data['withdraw'] = array("exp","withdraw-{$money}");
                $data['withdraw_fee'] = array("exp","withdraw_fee+{$fee}");
                $data['web_in'] = array("exp","web_in+{$fee}");
                break;
            case 43:
                $data['debt_fee'] = array("exp","debt_fee-{$money}");
                $data['web_in'] = array("exp","web_in-{$money}");
                break;
            case 50:
                $data['spread_reward'] = array('exp',"spread_reward+{$money}");
                $data['web_out'] = array("exp","web_out+{$money}");
                break;
            case 52:
            case 63:
                $data['re_invest_reward'] = array('exp',"re_invest_reward+{$money}");
                $data['web_out'] = array("exp","web_out+{$money}");
                break;
            case 57:
                $data['coupon_reward'] = array('exp',"coupon_reward+{$money}");
                $data['web_out'] = array("exp","web_out+{$money}");
                break;
            case 58:
                $data['privilege_reward'] = array('exp',"privilege_reward+{$money}");
                $data['web_out'] = array("exp","web_out+{$money}");
                break;
            case 71:
                $data['overdue'] = array('exp',"overdue-{$money}");
                $data['web_in'] = array("exp","web_in-{$money}");
                break;
            case 72:
                $data['call_fee'] = array('exp',"call_fee-{$money}");
                $data['web_in'] = array("exp","web_in-{$money}");
                break;
            case 73:
            case 173:
                $data['interest_fee'] = array('exp',"interest_fee-{$money}");
                $data['web_in'] = array("exp","web_in-{$money}");
                break;
            default:
                break;
        }
        $data['id'] = $id;
        $this->save($data);
    }

    /**
     * 网站每日注册
     */
    public function regNumber(){
        $data['date'] = date("Ymd");
        $id = $this->where($data)->getField('id');
        if(!$id){
            $id = $this->add($data);
        }
        $data['id'] = $id;
        $data['reg_num'] = array("exp","reg_num+1");
        $data['login_num'] = array("exp","login_num+1");
        $this->save($data);
    }
    /**
     * 网站每日登录人次
     */
    public function loginNumber(){
        $data['date'] = date("Ymd");
        $id = $this->where($data)->getField('id');
        if(!$id){
            $id = $this->add($data);
        }
        $data['id'] = $id;
        $data['login_num'] = array("exp","login_num+1");
        $this->save($data);
    }

}
?>