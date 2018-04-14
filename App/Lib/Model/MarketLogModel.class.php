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
class MarketLogModel extends BaseModel {
	protected $tableName = 'market_log';
    protected $pk = 'id';

    function __construct(){
        parent::__construct();
        $per = C('DB_PREFIX');
        $this->table = $per.$this->tableName.' as t';
        $this->member = new MembersModel();
        $this->market = new MarketModel();
        $this->inte = new IntegralModel();
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
        return $this->_getList($field,$this->table,$map,$join,$group,$order,$limit);
    }

    public function checkbuy($uid,$goods_id,$goods_count){

        if(empty($goods_id)){
            return array('status'=>0,'msg'=>'数据出错');
        }
        $map['id'] = $goods_id;
        $map['is_sys'] = 1;
        $good = $this->market->where($map)->find();
        if(!$good){
            return array('status'=>0,'msg'=>'数据出错');
        }
        $surplus= $good['number'] - $good['convert'];//剩余数量
        if($surplus<=0){//剩余数量必须大于0
            return array('status'=>0,'msg'=>'兑换已结束');
        }

        if($goods_count>$surplus){//剩余数量必须大于0
            return array('status'=>0,'msg'=>'兑换失败：剩余'.$surplus.'件');
        }
        $map1['gid'] = $goods_id;
        $map1['uid'] = $uid;
        $count = $this->where($map1)->sum('num');
        $amount = $good['amount'];

        if($count>=$amount&&$amount!=0){
            return array('status'=>0,'msg'=>'您兑换的商品数量已经达到上限:'.$good['amount'].'件');
        }
        if(($goods_count+$count)>$good['amount']&&$amount!=0){
            return array('status'=>0,'msg'=>'您最多再兑换:'.($good['amount']-$count).'件');
        }
        $mm = $this->member->find($uid);
        if($mm['active_integral']<$good['cost']){
            return array('status'=>0,'msg'=>'积分不足');
        }
        return array('status'=>1,'msg'=>'');
    }

    public function buyGoods($uid,$obj){
        $chk = $this->checkbuy($uid,$obj['id'],$obj['amount']);
        if($chk['status'] == 1){
            $good = $this->market->find($obj['id']);
            $log = array();
            $jifen = $good['cost']*$obj['amount'];
            $log['uid'] = $uid;
            $log['type'] = 1;
            $log['style'] = $obj['style'];
            $log['gid'] = $obj['id'];
            $log['name'] = $good['name'];
            $log['price'] = $good['price']*$obj['amount'];
            $log['cost'] = $jifen;
            $log['num'] = $obj['amount'];
            $log['info'] = "积分兑换‘{$good['name']}’";
            $log['add_ip'] = get_client_ip();
            $log['add_time'] = time();
            $log['status'] = 0;
            $log['way'] = $good['category']==1?2:0;
            $log['u_name'] = $obj['name'];
            $log['u_phone'] =$obj['phone'];
            $log['u_address'] = $obj['address'];
            M()->startTrans();
            $nid = $this->add($log);
            $gres = $this->market->where("id={$obj['id']}")->setInc('`convert`',$obj['amount']);
            $ires = $this->inte->memberIntegralLog($uid,3,-$jifen,"兑换‘{$good['name']}’");
            if($nid&&$gres&&$ires){
                addInnerMsg($uid,'积分兑换','使用'.$jifen.'积分，兑换了'.$good['name'].'X'.$obj['amount']);
                M()->commit();
                return array('status'=>1,'msg'=>'兑换成功');
            }else{
                M()->rollback();
                return array('status'=>0,'msg'=>'兑换失败，请重试');
            }
        }else{
            return $chk;
        }

    }
}
?>