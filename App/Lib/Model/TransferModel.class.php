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
 * Class TransferModel
 * U计划模型
 */
class TransferModel extends BaseModel {
    protected $tableName = 'transfer_borrow_info';
    protected $pk = 'id';
    protected $_validate = array(

    );
    protected $online_hours = 3;//默认上线时间$online_hours小时后
    public function __construct(){
        parent::__construct();
        $per = C('DB_PREFIX');
        $this->table = $per.$this->tableName.' as t';
        $this->updateTransfer();
    }

    public $duration_list = array(
        "1"=>'1',
        "3"=>'3',
        "6"=>'6',
        "9"=>'9',
        "12"=>'12',
        "15"=>'15',
        "18"=>'18',
        "24"=>'24'
    );//基金期限
    /**
     * 生成上线时间
     * @return int
     */
    public function createOnlineTime(){
        return time()+3600*$this->online_hours;
    }
    /**
     * 生成标名
     * @return string
     */
    public function createName(){
        $time = strtotime(date("Y-m-d"));
        $map['add_time'] = array('gt',$time);
        $bid = $this->where($map)->count();
        $Newid=$bid+1;
        return "U-".date("Ymd").str_repeat("0",3-strlen($Newid)).$Newid;
    }
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

    /**
     * 添加优计划
     * @param $obj
     * @param $admin
     * @return array
     */
    public function doAdd($obj,$admin){
        if (false === $this->create($obj)) {
            $msg = $this->getError();
            return array('status' => 0,'msg'=>$msg);
        }
        $this->total = $obj['borrow_duration'];//共几期(分几次还)
        $this->repayment_type = 0;
        $this->borrow_status = 2;
        $this->add_time = time();
        $this->online_time = strtotime($obj['online_time']);//上线时间
        $this->deadline = $this->online_time + $obj['borrow_duration'] * 30 * 24 * 3600;
        $this->add_ip = get_client_ip();
        $this->deal_user = $admin;
        $nid = $this->add();
        if($nid){
            return array('status' => 1,'msg'=>'添加成功','id'=>$nid);
        }else{
            return array('status' => 0,'msg'=>'添加失败');
        }
    }

    /**
     * 编辑优计划
     * @param $obj
     * @param $admin
     * @return array
     */
    public function doEdit($obj,$admin){
        if (false === $this->create($obj)) {
            $msg = $this->getError();
            return array('status' => 0,'msg'=>$msg);
        }
        $this->online_time = strtotime($obj['online_time']);//上线时间
        $this->deal_user = $admin;
        $nid = $this->save();
        if($nid){
            return array('status' => 1,'msg'=>'编辑成功');
        }else{
            return array('status' => 0,'msg'=>'编辑失败');
        }
    }

    public function investCk($uid,$borrow_id,$num){
        $mber = new MembersModel();
        $transI = new TransferInvestorModel();
        $minfo = $mber->getMemberInfo($uid,"Money",'id,user_name');
        $amoney = $minfo['account_money']+$minfo['back_money'];

        $field = "transfer_out,transfer_back,transfer_total,per_transfer,
            is_show,deadline,borrow_duration,borrow_max,on_off,borrow_uid,online_time";
        $binfo = $this->field($field)->find($borrow_id);

        if($binfo['on_off']!=1){
            return array('status'=>0,'msg'=>'此项目无法投资');
        }
        if($binfo['borrow_uid']==$uid){
            return array('status'=>0,'msg'=>'不能投自己的项目');
        }
        if($binfo['online_time'] > time()){
            return array('status'=>0,'msg'=>'未到上线时间，不能投标');
        }
        $investmoney = $binfo['per_transfer'] * $num;

        if ($amoney < $investmoney)
        {
            return array('status'=>0,'msg'=>'可用余额不足');
        }
        if($num < 1) {
            return array('status'=>0,'msg'=>'本标最少要投1份');
        }
        $has_tran = $binfo['transfer_total'] - $binfo['transfer_out'];
        $max_num = $has_tran;
        $map['investor_uid'] = $uid;
        $map['borrow_id'] = $borrow_id;
        $count = $transI->where($map)->sum("transfer_num");
        $user_max_tran = $binfo['borrow_max'] >0 ?($binfo['borrow_max']-$count):$max_num;
        $has_count = $user_max_tran-$num;
        if($has_count<0){
            $msg = "本标还剩{$has_tran}份";
            $binfo['borrow_max'] >0 && $msg = "单人限购{$binfo['borrow_max']}份";
            return array('status'=>0,'msg'=>$msg);
        }
        return array('status'=>1,'msg'=>"尊敬的用户，您的账户可用余额为{$amoney}元，您确认投标{$investmoney}元吗？");
    }

    private function updateTransfer(){
        $map['borrow_status'] = 2;
        $map['online_time'] = array('lt',time());
        $map['progress'] = array("neq",100);
        $data['progress'] = array('exp','transfer_out/transfer_total*100');
        $this->where($map)->save($data);
        $map=array();
        $map['borrow_status'] = 2;
        $map['_string'] = "transfer_out = transfer_total";
        $this->where($map)->save(array("is_show"=>0));
        $map=array();
        $map['borrow_status'] = 2;
        $map['_string'] = "transfer_back = transfer_total";
        $this->where($map)->save(array("borrow_status"=>7));
    }

}
?>