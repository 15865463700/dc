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
 * Class TransferDetailModel
 * U计划模型
 */
class TransferDetailModel extends BaseModel {
    protected $tableName = 'transfer_investor_detail';
    protected $pk = 'id';
    protected $_validate = array(

    );
    public function __construct(){
        parent::__construct();
        $per = C('DB_PREFIX');
        $this->table = $per.$this->tableName.' as t';
        $this->member = new MembersModel();
        $this->mm = new MemberMoneyModel();
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

    public function transferRepayment(){
        $map = array();
        $map['deadline'] = array("lt", time() + 86400);
        $map['status'] = 7;
        $field = "id,invest_id,interest,investor_uid,borrow_uid,
            borrow_id,capital,interest_fee,sort_order,total";
        $list = $this->field($field)->where($map)->select();
        $trani = new TransferInvestorModel();
        $tranB = new TransferModel();
        $strOut = "<br/>-----------正在执行企业直投自动还款程序：服务器当前时间" . date("Y-m-d H:i:s", time()) . "---------------<br/>";
        if (is_array($list) && !empty($list)) {
            $of = fopen(dirname(C("APP_ROOT")) ."/ThinkPHP/Auto/AutoRepayment/log/AutoRepayMent-".date("Y-m-d-H-i-s", time()).".txt",'w');
            fwrite($of, "\nlist=\n");
            fwrite($of, var_export($list, true));
            foreach ($list as $v) {
                $minfo = $this->member->getMemberInfo($v['borrow_uid'],"Money","id");
                $mbmoney = $minfo['account_money']+$minfo['back_money'];
                $repayMoney = $v['capital'] + $v['interest'];
                if($mbmoney<$repayMoney){
                    break;
                }
                M()->startTrans();
                $res1 = $this->mm->updateMemberMoney($v['borrow_uid'],171,-$v['capital'],"对{$v['borrow_id']}号优计划进行还款（本金）",$v['investor_uid']);
                $res2 = $this->mm->updateMemberMoney($v['borrow_uid'],172,-$v['interest'],"对{$v['borrow_id']}号优计划进行还款（利息）",$v['investor_uid']);
                $res3 = $this->mm->updateMemberMoney($v['investor_uid'],64,$v['capital'],"收到借款人对{$v['borrow_id']}号企业直投的还款（本金）",$v['investor_uid']);
                $res4 = $this->mm->updateMemberMoney($v['investor_uid'],65,$v['interest'],"收到借款人对{$v['borrow_id']}号企业直投的还款（利息）",$v['investor_uid']);
                $res5 = $this->mm->updateMemberMoney($v['investor_uid'],173,-$v['interest_fee'],"网站已将第{$v['borrow_id']}号优计划的利息管理费扣除");
                $updetail = array();
                $updetail['id'] = $v['id'];
                $updetail['status'] = 1; //还款完成
                $updetail['receive_capital'] = array("exp", "`receive_capital`+{$v['capital']}");
                $updetail['receive_interest'] = array("exp", "`receive_interest`+{$v['interest']}");
                $updetail['repayment_time'] = time();

                $summary = true;
                $nid = $this->save($updetail);
                if ($v['sort_order'] == $v['total']) {
                    $update_investor['status'] = 2; //还款完成
                    $transfer_num = $trani->getFieldById($v['invest_id'],"transfer_num");
                    $update_borrow = array();
                    $update_borrow['id'] = $v['borrow_id'];
                    $update_borrow['transfer_back'] = array("exp", "`transfer_back`+{$transfer_num}");
                    $summary = $tranB -> save($update_borrow);
                }
                $update_investor['id'] = $v['invest_id'];
                $update_investor['receive_capital'] = array("exp", "`receive_capital`+{$v['capital']}");
                $update_investor['receive_interest'] = array("exp", "`receive_interest`+{$v['interest']}");
                $investor =  $trani->save($update_investor);
                if($res1&&$res2&&$res3&&$res4&&$res5&&$nid&&$summary&&$investor){
                    M()->commit();
                    $strOut .= "成功还款第{$v['borrow_id']}号企业直投<br/>";
                }else{
                    M()->rollback();
                    $strOut .= "第{$v['borrow_id']}号企业直投还款失败<br/>";
                }
                fwrite($of, "\n\n");
            }
            fclose($of);
        }

        $data = $strOut . "\r\n" . date("Y-m-d H:i:s", time()); //服务器时间
        echo $data;
    }

}
?>