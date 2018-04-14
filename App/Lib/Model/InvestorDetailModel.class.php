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
// 还款详情表模型
class InvestorDetailModel extends BaseModel {
	protected $tableName = 'investor_detail';
    protected $pk = 'id';

    /**
     * 还款明细
     * @param string $field
     * @param array $map
     * @param string $limit
     * @param array $join
     * @param string $group
     * @param string $order
     * @param string $type
     * @return mixed
     */
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
                $order = 'd.`id` desc';
            }
        }
        if(is_array($join)){
            $table = "{$per}".$this->tableName.' as d';
        }
        return $this->_getList($field,$table,$map,$join,$group,$order,$limit);
    }

    /**
     * 更新还款表的数据
     * @param $borrow_id
     * @param $repayment
     * @param $duration
     * @param $endTime
     * @param $deadline_last
     */
    public function upDataDetail($borrow_id,$repayment,$duration,$endTime,$deadline_last){
        $conf = get_global_setting();
        switch($repayment){
            case 2://每月还款
            case 3://每季还本
            case 4://期未还本
                for($i=1;$i<=$duration;$i++){
                    if($conf['repay_cycle']==1){
                        $days = $i*30;
                        $deadline = strtotime("+{$days} day",$endTime);
                    }else{
                        $deadline=strtotime("+{$i} month",$endTime);
                    }
                    $iddata = array();
                    $iddata['deadline'] = $deadline;
                    $iddata['status'] = 7;
                    $dmap = array();
                    $dmap['borrow_id'] = $borrow_id;
                    $dmap['sort_order'] = $i;
                    $updetail_res = $this->where($dmap)->save($iddata);
                }
                break;
            case 1://按天一次性还款
            case 5://一次性还款
                $deadline=$deadline_last;
                $iddata = array();
                $iddata['deadline'] = $deadline;
                $iddata['status'] = 7;
                $dmap = array();
                $dmap['borrow_id'] = $borrow_id;
                $updetail_res = $this->where($dmap)->save($iddata);
                break;
        }
    }

    /**
     * 获取还款列表
     * @param $uid
     * @param $id
     * @param $sort_order
     * @return array
     */
    public function getRepayList($uid,$id,$sort_order = 0){
        $map['borrow_id'] = $id;
        $map['borrow_uid'] = $uid;
        $field = "deadline,sum(capital) as capital,sum(interest) as interest,
                sum(receive_interest+receive_capital) as paid,
                sum(capital+interest-receive_interest-receive_capital) as needpay,
                status,sort_order,borrow_id,sum(interest_fee) as interest_fee,
	            sum(substitute_time) as substitute_time";
        $group = "sort_order";
        $order = "deadline asc";
        $search = array();
        $search['map'] = $map;
        $search['limit'] = 'all';
        $search['group'] = $group;
        $search['order'] = $order;
        $list = $this->getList($field,$search);
        $v = '';
        $status_arr =array('还未还','已还完','已提前还款','迟到还款','网站代还','逾期还款','逾期未还','待还');

        $borrowInfo = M("borrow_info")->field("borrow_p_fee")->find($id);
        foreach($list as $k => $vo){
            if($vo['deadline']<time() && $vo['status']==7){
                $status_str ='逾期未还';
            }else{
                $status_str = $status_arr[$vo['status']];
            }
            $list[$k]['status_str'] = $status_str;
            if($sort_order==$vo['sort_order']){
                $v = $vo;
            }
            $list[$k]['borrow_p_fee'] = $borrowInfo['borrow_p_fee'];

        }
        if(!empty($sort_order))
            return $v;
        $b = new BorrowModel();
        $binfo = $b->find($id);
        $row=array();
        $row['list'] = $list;
        $row['name'] = $binfo['borrow_name'];
        return $row;
    }

    /**
     *
     * @param $borrow_id
     * @param $sort_order
     * @param $type   -由谁还款1自己还，平台待还
     * @param $status  -还款状态
     */
    public function repayment($borrow_id,$sort_order,$type,$status){
        $map['borrow_id'] = $borrow_id;
        $map['sort_order'] = $sort_order;
        $mm = new MemberMoneyModel();
        $m = new MembersModel();
        $sl = new SmsLogModel();
        $bi = new BorrowInvestorModel();
        $search = array();
        $search['map'] = $map;
        $search['limit'] = 'all';
        $detailList = $this->getList("*",$search);
        $send['borrow_id'] = $borrow_id;
        $send['sort_order'] = $sort_order;
        foreach($detailList as $k => $v){
            $idata = array();
            $total_subs_invest = $v['capital']+$v['interest'];
            $type==1 && $idata['receive_capital'] = $v['capital'];
            $type==1 && $idata['receive_interest'] = $v['interest'];
            $type==1 && $idata['repayment_time'] = time();
            $type==2 && $idata['substitute_money'] = $total_subs_invest;
            $type==2 && $idata['substitute_time'] = time();
            $idata['id'] = $v['id'];
            $idata['status'] = $status;
            $bres = $this->save($idata);
            if($bres){
                $bidata['receive_capital'] = array('exp',"receive_capital+{$v['capital']}");
                $bidata['receive_interest'] = array('exp',"receive_interest+{$v['interest']}");
                $bidata['id'] = $v['invest_id'];
                $type==1 && $bi->save($bidata);
                if($v['substitute_time']==0){
                    $msg = "收到会员对{$v['borrow_id']}号标第{$sort_order}期的还款";
                    $v['debt_status']==2 && $debt = M("invest_debt")->field("serialid")->where("invest_id={$v['invest_id']} and status=2")->find();
                    $v['debt_status']==2 && $msg = "收到会员对{$debt['serialid']}号债权第{$sort_order}期的还款";
                    $mm->updateMemberMoney($v['investor_uid'],13,$v['capital'],$msg."(本金)");
                    $mm->updateMemberMoney($v['investor_uid'],14,$v['interest'],$msg."(利息)");
                    $mm->updateMemberMoney($v['investor_uid'],73,-$v['interest_fee'],$msg."，扣除利息管理费");
                    $mm->updateMemberMoney($v['investor_uid'],57,$v['interestratecoupon_money'],$msg."，加息奖励");
                    $phone = $m->getFieldById($v['investor_uid'],'user_phone');
                    $send['money'] = $v['capital']+$v['interest'];
                    $sl->sendSms($phone,'payback',$send);
                }
            }

        }
    }
}
?>