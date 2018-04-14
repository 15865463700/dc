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
 * Class PaylogModel
 * 充值模型
 */
class PaylogModel extends BaseModel {
	protected $tableName = 'member_payonline';
    protected $pk = "id";
    public $payWay = array(
        'off'=>'线下充值',
        'gfb'=>'国付宝',
        'ips'=>'环迅支付',
        'chinabank'=>'网银在线',
        'baofoo'=>'宝付',
        'tenpay'=>'财付通',
        'ecpss'=>'汇潮支付',
        'easypay'=>'易生支付',
        'cmpay'=>'中国移动支付',
        'allinpay'=>'通联支付',
        'baofuwap'=>'宝付认证支付(wap)'
    );

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
                $order = 'p.`id` desc';
            }
        }
        if(is_array($join)){
            $table = "{$per}".$this->tableName.' as p';
        }
        return $this->_getList($field,$table,$map,$join,$group,$order,$limit);
    }
    /**
     * 增加充值记录
     * @param $data
     * @return mixed
     */
    public function addPayLog($data){
        $data['status'] = 0;
        $data['add_time'] = time();
        $data['add_ip'] = get_client_ip();
        $data['nid'] = $this->createNid($data['order'],$data['way']);
        return $this->add($data);
    }

    private function createNid($order,$type){
        return md5($type.$order);
    }

    /**
     * 充值结果处理
     * @param $order
     * @param $status
     * @return bool
     */
    public function payDone($order,$status){

        $map['tran_id'] = $order;
        M()->startTrans();
        $vo = $this->where($map)->lock(true)->find();
        $data['status'] =  $status;

        $nid = $this->where($map)->save($data);
        $res = false;
        if($nid){
            switch($status){
                case 1:
                    if($vo['status']!=0 || !is_array($vo))
                        return false;
                    $m = new MemberMoneyModel();
                    $res = $m->updateMemberMoney($vo['uid'],3,$vo['money'],"会员充值，充值订单号:{$order}");
                    $resx = $m->updateMemberMoney($vo['uid'],4,-$vo['fee'],"扣除会员充值手续费，充值订单号:{$order}");
                    $vx = M("members")->field("user_phone,user_name")->find($vo['uid']);
                    $sl = new SmsLogModel();
                    $sl->sendSms($vx['user_phone'],'payonline',array('add_time'=>date('Y-m-d H:i:s',$vo['add_time']),'money'=>$vo['money']));
                    break;
                default:
                    break;
            }
            if($res){
                M()->commit();
                return true;
            }else{
                M()->rollback();
                return false;
            }
        }else{
            M()->rollback();
            return false;
        }

    }
}
?>