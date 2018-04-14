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
 * Class ArticleModel
 * 债权转让
 */
class DebtModel extends BaseModel {
    protected $tableName = 'invest_debt';
    protected $pk = 'id';

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
     * 可转债权
     * @param $uid
     * @param int $limit
     * @return mixed
     */
    public function canDebt($uid,$limit=10){
        $map['bi.investor_uid'] = $uid;
        $map['bi.status'] = 4;
        $map['bi.debt_status'] = 0;
        $map['id.status'] = array('in',array(6,7));

        $field = "bi.id, bi.borrow_id, bi.add_time, bi.deadline,
                bi.investor_interest, bi.investor_capital, b.borrow_name,
                b.borrow_interest_rate, m.user_name, b.total,
                count(id.id) as re_num, sum(id.capital) as capital,
               sum(id.interest) as interest ";
        $join[] = "__BORROW_INFO__ b ON b.id = bi.borrow_id";
        $join[] = "__MEMBERS__ m ON bi.borrow_uid = m.id";
        $join[] = "__INVESTOR_DETAIL__ id ON id.invest_id = bi.id";

        $where['map'] = $map;
        $where['limit'] = $limit;
        $where['group'] = "bi.id desc";
        $bi = new BorrowInvestorModel();
        $list = $bi->getList($field,$where,$join);
        return $list;
    }

    /**
     * 根据投资号查询债权转让情况
     * @param $id
     * @return mixed
     */
    public function canDebtById($id){

        $i = new InvestorDetailModel();
        $field = "count(d.id) as re_num, sum(d.capital) as capital,
               sum(d.interest) as interest,b.total,b.borrow_name,b.id";
        $map['d.invest_id'] = $id;
        $map['d.status'] = array('in',array(6,7));
        $join[] = "__BORROW_INFO__ b on b.id = d.borrow_id";
        $where['map'] = $map;
        $where['limit'] = 1;

        $list =  $i->getList($field,$where,$join);
        return $list;

    }


    /**
     * 债权转让检测
     * @param $uid
     * @param $invest_id
     * @param $price
     * @param $pin_pass
     * @return array
     */
    public function checkDebtSell($uid,$invest_id, $price, $pin_pass){

        $info = $this->canDebtById($invest_id);
        if(!is_array($info)){
            return array('status'=>0,'msg'=>'债权不存在或系统繁忙，请刷新重试');
        }
        $total = $info['capital']+$info['interest'];
        if($price > $total){ // 有没有超出价格上限
            return array('status'=>0,'msg'=>'债权转让不允许超出价格上限');
        }
        $m = new MembersModel();
        $vm = $m->getMemberInfo($uid,'','id,pin_pass');
        if(md5($pin_pass) != $vm['pin_pass']){
            //return 'payment_password_error';
            return array('status'=>0,'msg'=>'支付密码错误');
        }
        return array('status'=>1,'msg'=>'可转债权');

    }

    /**
     * 出售债权转让
     * @param $uid
     * @param $invest_id
     * @param $price
     * @param $pin_pass
     * @return array
     */
    public function debtSell($uid,$invest_id, $price, $pin_pass){
        $check = $this->checkDebtSell($uid,$invest_id, $price, $pin_pass);
        if($check['status']==1){
            M()->startTrans();
            $bi = new BorrowInvestorModel();
            $debt = array();
            $count_invest  = $this->canDebtById($invest_id);
            $serial = "ZQZR-".date("YmdHis").mt_rand(1000,9999);
            $debt['invest_id'] = $invest_id;
            $debt['sell_uid'] = $uid;
            $debt['serialid'] = $serial;
            $debt['transfer_price'] = $price;
            $debt['capital'] =  $count_invest['capital'];
            $debt['interest'] = $count_invest['interest'];
            $debt['period'] = $count_invest['re_num'];
            $debt['total_period'] = $count_invest['total'];
            $debt['borrow_id'] = $count_invest['id'];
            $debt['addtime'] = time();
            $debt['ip'] = get_client_ip();
            $datag = get_global_setting();
            $debt_audit = $datag['debt_audit'];
            if($debt_audit){
                $debt['status'] = 99; //审核
            }else{
                $debt['status'] = 1;
                $debt['valid'] = time();
            }
            $bdata = array();
            $bdata['id'] = $invest_id;
            $bdata['debt_status'] = 1;
            $res = $bi->save($bdata);
            $d_id = $this->where("invest_id={$invest_id}")->getField('id');
            if($d_id){
                $debt['id'] = $d_id;
                $resx = $this->save($debt);
            }else{
                $resx = $this->add($debt);
            }
            if($res&&$resx!==false){
                M()->commit();
                return array('status'=>1,'msg'=>'债权转让成功');
            }else{
                M()->rollback();
                return array('status'=>0,'msg'=>'债权转让失败');
            }
        }else{
            return $check;
        }
    }

    /**
     * 该更债权状态
     * @param $debt_id
     * @param $status
     * @param string $remark
     * @return array
     */
    public function doDebtStatus($debt_id,$status,$remark = ''){

        M()->startTrans();

        $debt = $this->lock(true)->find($debt_id);
        if($debt['status']!=99&&$status==3){
            M()->commit();
            return array('status'=>0,'msg'=>'已审核,无法撤销');
        }
        $map['id'] = $debt_id;

        $data['status'] = $status;
        $data['remark'] = $remark;

        $bi_status = true;
        $status == 1 && $data['valid'] = time()+60*60*24*7;

        if($status == 3){
            $data['cancel_time'] = time();
            $data['cancel_times'] = array('exp','cancel_times+1');
            $bi = new BorrowInvestorModel();
            $invest_id = M("invest_debt")->where($map)->getField('invest_id');
            $bi_status = $bi->where("id={$invest_id}")->save(array('debt_status'=>0));
        }

        $res = $this->where($map)->save($data);
        if($res&&$bi_status!==false){
            M()->commit();
            return array('status'=>1,'msg'=>'修改成功');
        }else{
            M()->rollback();
            return array('status'=>0,'msg'=>'修改失败');
        }
    }

    /**
     * 购买检测
     * @param $uid
     * @param $debt_id
     * @return array
     */
    public function checkBuy($uid,$debt_id){
        $debt = $this->find($debt_id);
        if($debt['status']!=1){
            return array('status'=>0,'msg'=>'');
        }
        if($debt['sell_uid']==$uid){
            return array('status'=>0,'msg'=>'不能购买自己发布的债权');
        }
        if(time() > $debt['valid']){
            return array('status'=>0,'msg'=>'债权转让已过期');
        }
        $b = new BorrowModel();
        $binfo = $b->field("borrow_uid")->find($debt['borrow_id']);
        if($binfo['borrow_uid']==$uid){
            return array('status'=>0,'msg'=>'原借款人不能购买债权');
        }
        $m = new MembersModel();
        $minfo = $m->getMemberInfo($uid,'Money','id');
        $money = $minfo['account_money']+$minfo['back_money'];
        if($money<$debt['transfer_price']){
            return array('status'=>0,'msg'=>'账户余额不足');
        }
        return array('status'=>1,'msg'=>'可以购买');
    }

    public function buyDebt($uid,$debt_id){
        $chk = $this->checkBuy($uid,$debt_id);
        if($chk['status']==1){
            M()->startTrans();
            $debt = $this->find($debt_id);
            $data_debt = array();
            $data_debt['id'] = $debt_id;
            $data_debt['buy_time'] = time();
            $data_debt['buy_uid'] = $uid;
            $data_debt['status'] = 2;

            $bi = new BorrowInvestorModel();
            $data_invest = array();
            $data_invest['id'] = $debt['invest_id'];
            $data_invest['debt_status'] = 2;
            $data_invest['debt_uid'] = $uid;

            $d = new InvestorDetailModel();
            $data_detail['investor_uid'] = $uid;
            $where_d['invest_id'] = $debt['invest_id'];
            $where_d['status'] = array('in',array(6,7));
            $res = $this->save($data_debt);
            $resx = $bi->save($data_invest);
            $resd = $d->where($where_d)->save($data_detail);
            if($res&&$resx&&$resd){
                $datag = get_global_setting();
                $debt_fee = $datag['debt_fee'];// 百分比
                $fee = round(($debt['transfer_price'] * $debt_fee)/100, 2);
                $debt_collect = $debt['capital']+$debt['interest'];
                $mm = new MemberMoneyModel();
                $buy_res = $mm->updateMemberMoney($uid,41,-$debt['transfer_price'],"购买{$debt['serialid']}号债权",$debt['sell_uid']);
                $sell_res = $mm->updateMemberMoney($debt['sell_uid'],42,$debt['transfer_price'],"转让{$debt['serialid']}号债权",$uid);
                $buy_res_c = $mm->updateMemberMoney($uid,44,$debt_collect,"购买{$debt['serialid']}号债权，增加{$debt_collect}待收",$debt['sell_uid'],$debt['serialid']);
                $sell_res_c = $mm->updateMemberMoney($debt['sell_uid'],45,-$debt_collect,"转让{$debt['serialid']}号债权，减少{$debt_collect}待收",$uid,$debt['serialid']);
                $fee_res = $mm->updateMemberMoney($debt['sell_uid'],43,-$fee,"转让{$debt['serialid']}号债权，收取手续费");
                if($buy_res&&$sell_res&&$fee_res&&$buy_res_c&&$sell_res_c){
                    M()->commit();
                    return array('status'=>1,'msg'=>'购买成功');
                }else{
                    M()->rollback();
                    return array('status'=>0,'msg'=>'购买失败，请重试');
                }
            }else{
                M()->rollback();
                return array('status'=>0,'msg'=>'购买失败，请重试');
            }

        }else{
            return $chk;
        }
    }

    /**
     * 还款撤销债权专用
     * @param $borrow_id
     */
    public function cancelDebt($borrow_id)
    {
        $map['status'] = array('in',array(1,99));
        $map['borrow_id'] = $borrow_id;
        $where['map'] = $map;
        $where['limit'] = 'all';
        $list = $this->getList("*",$where);
        foreach($list as $k => $v){
            $this->doDebtStatus($v['id'],3,'债权还款撤销');
        }
    }

    /**
     * 超时撤销债权专用
     */
    public function cancelDebtValid()
    {
        $map['status'] = 1;
        $map['valid'] = array('lt',time());
        $where['map'] = $map;
        $where['limit'] = 'all';
        $list = $this->getList("*",$where);
        foreach($list as $k => $v){
            $this->doDebtStatus($v['id'],3,'债权超时撤销');
        }
    }

    /**
     * 还款完成
     * @param $borrow_id
     */
    public function completeDebt($borrow_id)
    {
        $map['status'] = 2;
        $map['borrow_id'] = $borrow_id;
        $where['map'] = $map;
        $where['limit'] = 'all';
        $list = $this->getList("*",$where);
        foreach($list as $k => $v){
            $this->doDebtStatus($v['id'],4,'债权完成');
        }
    }
}
?>