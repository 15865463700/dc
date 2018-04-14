<?php
// 尚贷内核类库，2014-06-11_listam
class FundAction extends HCommonAction {
    function __construct(){
        parent::__construct();
        $this->fund = new TransferModel();
        $this->member = new MembersModel();
        $this->transferInvestor = new TransferInvestorModel();
    }
    public function index(){
        $map["on_off"] = 1;
        $map["online_time"] = array("lt",time()+300);
        $where['map'] = $map;
        $where['limit'] = 6;
        $where['order'] = "is_show desc,borrow_status ASC,borrow_duration ASC,online_time desc";
        $list = $this->fund->getList("*",$where);
		$invest_num = M('transfer_borrow_investor')->group("investor_uid")->select();
		$invest_total = M('transfer_borrow_investor')->sum("investor_capital");
		$invest_interest = M('transfer_borrow_investor')->sum("investor_interest");
        $this->assign("time",time());
		$this->assign("list",$list);
		$this->assign("invest_num",count($invest_num));
		$this->assign("invest_total",$invest_total);
		$this->assign("invest_interest",$invest_interest);
		$this->display();
    }
	
	////////////////////////////////////////////////////////////////////////////////////
    public function tdetail(){

		$id = intval($_GET['id']);
		$this->assign("borrow_id",$id);
		$this->assign("investInfo", $this->member->getMemberInfo($this->uid,"Money","id"));
		$borrowinfo = $this->fund->find($id);
        if($borrowinfo['id']!=$id){
            $this->error("非法请求");
        }
        $borrowinfo['borrow_max'] = $borrowinfo['borrow_max']==0?"":$borrowinfo['borrow_max']*$borrowinfo['per_transfer'];
        $borrowinfo['borrow_min'] = $borrowinfo['borrow_min']==0?$borrowinfo['per_transfer']:$borrowinfo['borrow_min']*$borrowinfo['per_transfer'];

		$this->assign("vo", $borrowinfo);
        $count = $this->transferInvestor->where("borrow_id = {$id}")->count();
        if($borrowinfo['online_time'] > time()){
            $count = 0;
        }
        $this->assign("count", $count);
		//收益率
		$monthData['month_times'] = 12;
		$monthData['account'] = 10000;
		$monthData['year_apr'] = $borrowinfo['borrow_interest_rate'];
		$monthData['type'] = "all";
		$repay_detail = CompoundMonth($monthData);
		$this->assign("Compound",$repay_detail['shouyi']);
		//评论
		$this->assign("time",time());
		$this->display();
    }

	public function investcheck()
	{
        if(!$this->uid){
            ajaxmsg("请先登录", 0);
        }
		$borrow_id = intval($_POST['borrow_id']);
		$tnum = intval($_POST['tnum']);
        $res = $this->fund->investCk($this->uid,$borrow_id,$tnum);
        ajaxmsg($res['msg'], $res['status']);
	}

    public function investcheck1()
    {
        if(!$this->uid){
            ajaxmsg("请先登录", 0);
        }
        $borrow_id = intval($_POST['borrow_id']);
        $tnum = intval($_POST['tnum']);
        $pin = $_POST['pin'];
        $pres = $this->member->checkPinPass($this->uid,$pin);
        !$pres && ajaxmsg("支付密码错误，请重试!",0);
        $res = $this->fund->investCk($this->uid,$borrow_id,$tnum);
        ajaxmsg($res['msg'], $res['status']);
    }
	
	public function investmoney()
	{
		if(!$this->uid){
            $this->error("请先登录");
        }
		$borrow_id = intval($_POST['T_borrow_id']);
		$tnum = intval($_POST['transfer_invest_num']);
		$repayment_type = intval($_POST['chooseWay']);
		$pin = $_POST['T_pin'];
        $pres = $this->member->checkPinPass($this->uid,$pin);
        if(!$pres){
            $this->error("支付密码错误");
        }
        $res = $this->fund->investCk($this->uid,$borrow_id,$tnum);
        if($res['status'] == 1){
            $done = $this->transferInvestor->investMoney($this->uid,$borrow_id,$tnum,$repayment_type);
            if($done){
                $money = intval($_POST['per_transfer'])*$tnum;
                $this->success("恭喜成功认购{$tnum}份,共计{$money}元");
            }else{
                $this->error("对不起，认购失败，请重试!");
            }
        }else{
            $this->error($res['msg']);
        }

	}

	public function ajax_invest()
	{
		if ( !$this->uid )
		{
			ajaxmsg( "请先登录", 0 );
		}
		$id = intval( $_GET['id'] );
		$num = intval( $_GET['num'] );
		$chooseWay = $_GET['chooseWay'];
        $vo = $this->fund->find($id);

        $res = $this->fund->investCk($this->uid,$id,$num);
        if($res['status']==0){
            ajaxmsg( $res['msg'], 0 );
        }
        $pin_pass = $this->member->getFieldById($this->uid,"pin_pass");
		$has_pin = empty( $pin_pass ) ? "no" : "yes";
		//收益结束
		$this->assign( "has_pin", $has_pin);
		$this->assign( "num", $num);
        $this->assign( "id", $id);
        $this->assign( "vo", $vo);
		$this->assign("chooseway",$chooseWay);
		$data['content'] = $this->fetch();
		ajaxmsg($data);
	}

    public function investRecord($borrow_id=0)
    {
        $pre = C('DB_PREFIX');
        isset($_GET['borrow_id']) && $borrow_id = intval($_GET['borrow_id']);
        import("ORG.Util.Page");
        $count = $this->transferInvestor->where('borrow_id='.$borrow_id)->count('id');
        $Page     = new Page($count,12);


        $show = $Page->ajax_show();
        $this->assign('count', $count);
        $this->assign('page', $show);
        if($_GET['borrow_id']){
            $list = M("transfer_borrow_investor as b")
                        ->join("__MEMBERS__ as m on  b.investor_uid = m.id")
                        ->join("__TRANSFER_BORROW_INFO__ as i on  b.borrow_id = i.id")
                        ->field('i.online_time,i.borrow_interest_rate, b.investor_capital, b.transfer_num, b.transfer_month, b.is_auto, m.user_name')
                        ->where('b.borrow_id='.$borrow_id)->order('b.id DESC')->limit($Page->firstRow.','.$Page->listRows)->select();
            $string = '';
            foreach($list as $k=>$v){
				if($v['online_time'] <= time()) {
					$v['is_auto'] == 1 ? $investor_type = "自动" : $investor_type = "手动";
					$string .= "<tr>
					  <td height='25' align='left' valign='middle'>" . hidecard($v['user_name'], 5) . "</td>
					  <td align='left' valign='middle'>" . $v['transfer_num'] . "份</td>
					  <td align='left' valign='middle'>" . getMoneyFormt($v['investor_capital']) . "元</td>
					  <td align='left' valign='middle'>" . $v['borrow_interest_rate'] . "%/年</td>
					  <td align='left' valign='middle'>" . $v['transfer_month'] . "个月</td>
					  <td align='left' valign='middle'>" . $investor_type . "</td>
					  <td align='left' valign='middle'><img src='/Style/H/images/fund/zhangtai.png' /></td></tr>";
				}
            }
            echo empty($string)?'暂时没有投资记录':$string;
        }

    }
}
?>