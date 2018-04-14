<?php
class FundAction extends ACommonAction
{
    function __construct(){
        parent::__construct();
        $this->fund = new TransferModel();
        $this->member = new MembersModel();
        $this->article = new ArticleModel();
        $this->transferInvestor = new TransferInvestorModel();
        $this->autoBorrow = new AutoBorrowModel();
    }

    public function index()
    {
        $map['t.is_show'] = 1;
        $map['t.borrow_status'] = 2;
        $where['map'] = $map;
        $where['limit'] = C('ADMIN_PAGE_SIZE');
        $field = "t.id,t.borrow_name,t.borrow_money,t.borrow_duration,t.transfer_total,t.transfer_out,t.add_time,m.user_name";
        $join[] = "__MEMBERS__ m on m.id = t.borrow_uid";
        $list = $this->fund->getList($field,$where,$join);
        $this->assign("list", $list);
        $this->assign("xaction",ACTION_NAME);
        $this->display();
    }

    public function endtran()
    {
        $map['t.is_show'] = 0;
        $map['t.borrow_status'] = 7;
        $where['map'] = $map;
        $where['limit'] = C('ADMIN_PAGE_SIZE');
        $field = "t.id,t.borrow_name,t.borrow_money,t.borrow_duration,t.transfer_total,t.transfer_out,t.add_time,m.user_name";
        $join[] = "__MEMBERS__ m on m.id = t.borrow_uid";
        $list = $this->fund->getList($field,$where,$join);
        $this->assign("list", $list);
        $this->assign("xaction",ACTION_NAME);
        $this->display();
    }

    public function _addFilter()
    {
        $this->assign("userlist",$this->member->getTransferUser());
        $this->assign("danbao_list",$this->article->getDanbaolist());
        $this->assign("borrow_duration_list",$this->fund->duration_list);
        $this->assign("online_time",$this->fund->createOnlineTime());
        $this->assign("borrow_name",$this->fund->createName());
    }

    public function _doDelFilter($id){
        alogs("DelTransfer",$id,1,'成功执行了优计划的删除操作！');//管理员操作日志
    }
    public function doAdd( )
    {
        M()->startTrans();
        $res = $this->fund->doAdd($_POST,session('admin'));
        if ($res['status'] ==1 ) { //保存成功
            $this->autoBorrow->autoTransferInvest($res['id']);
            alogs("Tborrow",$res['id'],1,'成功执行了优计划的添加操作！');//管理员操作日志
            M()->commit();
            $this->assign('jumpUrl', __URL__);
            $this->success(L('新增成功'));
        }else{
            M()->rollback();
            alogs("Tborrow",$res['id'],0,'执行优计划的添加操作失败！');//管理员操作日志
            //失败提示
            $this->error(L('新增失败'));
        }
    }

    public function edit() {
        $id = intval($_REQUEST['id']);
        $vo = $this->fund->find($id);
        $this->assign("danbao_list",$this->article->getDanbaolist());
        $vo['user_name'] =  M('members')->getFieldById($vo['borrow_uid'],"user_name");
        $this->assign('vo', $vo);
        $this->display();
    }

    //添加数据
    public function doEdit() {
        M()->startTrans();
        $res = $this->fund->doEdit($_POST,session('admin'));
        if ($res['status'] == 1) {
            alogs("Tborrow",$_POST['id'],1,'成功执行了基金理财信息的修改操作！');//管理员操作日志
            M()->commit();
            //成功提示
            $this->assign('jumpUrl', __URL__);
            $this->success(L('修改成功'));
        } else {
            M()->rollback();
            alogs("Tborrow",$_POST['id'],0,'执行基金理财信息的修改操作失败！');//管理员操作日志
            //失败提示
            $this->error(L('修改失败'));
        }
    }

    //每个借款标的投资人记录
    public function doinvest()
    {
        $borrow_id = intval($_REQUEST['borrow_id']);
        $field = "t.borrow_id,m.user_name,m.user_phone,m.customer_name,b.borrow_name,
        t.investor_capital,t.investor_interest,t.invest_fee,t.repayment_type,t.transfer_month,t.add_time";
        $map['t.borrow_id'] = $borrow_id;
        $where['map'] = $map;
        $where['limit'] = C('ADMIN_PAGE_SIZE');
        $join[] = "__MEMBERS__ m on m.id = t.investor_uid";
        $join[] = "__TRANSFER_BORROW_INFO__ b on b.id = t.borrow_id";
        $list = $this->transferInvestor->getList($field,$where,$join);
        $this->assign("repayment_type", $this->transferInvestor->repayment_type);
        $this->assign("list", $list);
        $this->display();
    }
    public function export(){

        $borrow_id = intval($_REQUEST['borrow_id']);
        $field = "t.borrow_id,m.user_name,m.user_phone,m.customer_name,b.borrow_name,
        t.investor_capital,t.investor_interest,t.invest_fee,t.repayment_type,t.transfer_month,t.add_time";
        $map['t.borrow_id'] = $borrow_id;
        $where['map'] = $map;
        $where['limit'] ='all';
        $join[] = "__MEMBERS__ m on m.id = t.investor_uid";
        $join[] = "__TRANSFER_BORROW_INFO__ b on b.id = t.borrow_id";
        $list = $this->transferInvestor->getList($field,$where,$join);

        $row=array();
        $row[0]=array('标号','用户名','手机号','客服','标题','投资金额','应得利息','投资期限','投资成交管理费','标种类型','投资时间');
        $i = 1;
        foreach($list as $v){
            $row[$i]['uid'] = $v['bid'];
            $row[$i]['name'] = $v['user_name'];
            $row[$i]['phone'] = $v['user_phone'];
            $row[$i]['kefu'] = $v['customer_name'] ;
            $row[$i]['biaoti'] = $v['borrow_name'];
            $row[$i]['money'] = $v['investor_capital'];
            $row[$i]['lixi'] = $v['investor_interest'];
            $row[$i]['qixian'] = $v['borrow_duration']."个月";
            $row[$i]['fee'] = $v['invest_fee'];
            $row[$i]['biao'] = $v['borrow_type'];
            $row[$i]['add_time'] = date("Y-m-d H:i:s",$v['add_time']);
            $i++;
        }
        import("ORG.Io.Excel");
        $xls = new Excel_XML('UTF-8', false, "标".$borrow_id);
        $xls->addArray($row);
        $xls->generateXML('datalistcard');

    }
    public function repayment()
    {
        $map['t.is_show'] = 0;
        $map['t.borrow_status'] = 2;
        $where['map'] = $map;
        $where['limit'] = C('ADMIN_PAGE_SIZE');
        $field = "t.id,t.borrow_name,t.borrow_money,t.borrow_duration,t.transfer_total,t.transfer_out,t.add_time,m.user_name";
        $join[] = "__MEMBERS__ m on m.id = t.borrow_uid";
        $list = $this->fund->getList($field,$where,$join);
        $this->assign("list", $list);
        $this->assign("xaction",ACTION_NAME);
        $this->display();
    }

}

?>
