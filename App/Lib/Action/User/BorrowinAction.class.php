<?php
// 尚贷内核类库，2014-06-11_listam
class BorrowinAction extends MCommonAction {

    public function index(){
		$this->display();
    }
	
	public function borrowing(){
		$map['borrow_uid'] = $this->uid;
		$map['borrow_status'] = 0;
		
		if($_GET['start_time2']&&$_GET['end_time2']){
			$_GET['start_time2'] = strtotime($_GET['start_time2']." 00:00:00");
			$_GET['end_time2'] = strtotime($_GET['end_time2']." 23:59:59");
			
			if($_GET['start_time2']<$_GET['end_time2']){
				$map['add_time']=array("between","{$_GET['start_time2']},{$_GET['end_time2']}");
				$search['start_time2'] = $_GET['start_time2'];
				$search['end_time2'] = $_GET['end_time2'];
			}
		}
		$b = new BorrowModel();
        $searchx = array();
        $searchx['map'] = $map;
        $searchx['limit'] = 10;
		$list = $b->getList("*",$searchx);
        $Bconfig = require C("APP_ROOT")."Conf/borrow_config.php";
        $status_arr =$Bconfig['BORROW_STATUS_SHOW'];
        $type_arr =$Bconfig['REPAYMENT_TYPE'];
        foreach($list['list'] as $k => $v){
            $list['list'][$k]['status'] = $status_arr[$v['borrow_status']];
            $list['list'][$k]['repayment_type'] = $type_arr[$v['repayment_type']];
        }
		$this->assign('search',$search);
		$this->assign("list",$list['list']);
		$this->assign("pagebar",$list['page']);
	
	
		$data['html'] = $this->fetch();
		exit(json_encode($data));
	}
    public function borrowraise(){
        $map['borrow_uid'] = $this->uid;
        $map['borrow_status'] = array("in","2,4");

        if($_GET['start_time2']&&$_GET['end_time2']){
            $_GET['start_time2'] = strtotime($_GET['start_time2']." 00:00:00");
            $_GET['end_time2'] = strtotime($_GET['end_time2']." 23:59:59");

            if($_GET['start_time2']<$_GET['end_time2']){
                $map['add_time']=array("between","{$_GET['start_time2']},{$_GET['end_time2']}");
                $search['start_time2'] = $_GET['start_time2'];
                $search['end_time2'] = $_GET['end_time2'];
            }
        }

        $b = new BorrowModel();
        $searchx = array();
        $searchx['map'] = $map;
        $searchx['limit'] = 10;
        $list = $b->getList("*,ROUND(has_borrow/borrow_money*100,2) as progress",$searchx);
        $Bconfig = require C("APP_ROOT")."Conf/borrow_config.php";
        $status_arr =$Bconfig['BORROW_STATUS_SHOW'];
        $type_arr =$Bconfig['REPAYMENT_TYPE'];
        foreach($list['list'] as $k => $v){
            $list['list'][$k]['status'] = $status_arr[$v['borrow_status']];
            $list['list'][$k]['repayment_type'] = $type_arr[$v['repayment_type']];
        }
        $this->assign('search',$search);
        $this->assign("list",$list['list']);
        $this->assign("pagebar",$list['page']);


        $data['html'] = $this->fetch();
        exit(json_encode($data));
    }

	public function borrowpaying(){
		$map['borrow_uid'] = $this->uid;
		$map['_string'] = " borrow_status = 6 or (borrow_status = 7 and has_borrow <> repayment_money)";
		
		if($_GET['start_time']&&$_GET['end_time']){
			$_GET['start_time'] = strtotime($_GET['start_time']." 00:00:00");
			$_GET['end_time'] = strtotime($_GET['end_time']." 23:59:59");
			
			if($_GET['start_time']<$_GET['end_time']){
				$map['add_time']=array("between","{$_GET['start_time']},{$_GET['end_time']}");
				$search['start_time'] = $_GET['start_time'];
				$search['end_time'] = $_GET['end_time'];
			}
		}
        $b = new BorrowModel();
        $searchx = array();
        $searchx['map'] = $map;
        $searchx['limit'] = 10;
        $list = $b->getList("*",$searchx);
        $Bconfig = require C("APP_ROOT")."Conf/borrow_config.php";
        $type_arr =$Bconfig['REPAYMENT_TYPE'];
        foreach($list['list'] as $k => $v){
            $list['list'][$k]['repayment_type_str'] = $type_arr[$v['repayment_type']];
            $vx = M('investor_detail')->switchModel("Adv")->field('deadline')->where("borrow_id={$v['id']} and repayment_time = 0")->order("deadline ASC")->first();
            $list['list'][$k]['repayment_time'] = $vx['deadline'];
        }

        $this->assign('search',$search);
		$this->assign("list",$list['list']);
		$this->assign("pagebar",$list['page']);
	
	
		$data['html'] = $this->fetch();
		exit(json_encode($data));
	}


	public function borrowbreak(){
		$Wsql="";
		if($_GET['start_time1']&&$_GET['end_time1']){
			$_GET['start_time1'] = strtotime($_GET['start_time1']." 00:00:00");
			$_GET['end_time1'] = strtotime($_GET['end_time1']." 23:59:59");
			
			if($_GET['start_time1']<$_GET['end_time1']){
				$Wsql = " AND ( d.deadline between {$_GET['start_time1']} AND {$_GET['end_time1']} ) ";
				$search['start_time1'] = $_GET['start_time1'];
				$search['end_time1'] = $_GET['end_time1'];
			}
		}
		
		$list = getMBreakRepaymentList($this->uid,10,$Wsql);
		
		//print_r($list['list']);
		$this->assign('search',$search);
		$this->assign("list",$list['list']);
		$this->assign("pagebar",$list['page']);
	
		$data['html'] = $this->fetch();
		exit(json_encode($data));
	}
	
	public function borrowfail(){
		$map['borrow_uid'] = $this->uid;
		$map['borrow_status'] = array("in","1,3,5");
		
		if($_GET['start_time4']&&$_GET['end_time4']){
			$_GET['start_time4'] = strtotime($_GET['start_time4']." 00:00:00");
			$_GET['end_time4'] = strtotime($_GET['end_time4']." 23:59:59");
			
			if($_GET['start_time4']<$_GET['end_time4']){
				$map['add_time']=array("between","{$_GET['start_time4']},{$_GET['end_time4']}");
				$search['start_time4'] = $_GET['start_time4'];
				$search['end_time4'] = $_GET['end_time4'];
			}
		}
        $b = new BorrowModel();
        $searchx = array();
        $searchx['map'] = $map;
        $searchx['limit'] = 10;
        $list = $b->getList("*",$searchx);
        $Bconfig = require C("APP_ROOT")."Conf/borrow_config.php";
        $status_arr =$Bconfig['BORROW_STATUS_SHOW'];
        $type_arr =$Bconfig['REPAYMENT_TYPE'];
        foreach($list['list'] as $k => $v){
            $list['list'][$k]['status'] = $status_arr[$v['borrow_status']];
            $list['list'][$k]['repayment_type'] = $type_arr[$v['repayment_type']];
            $deal_info = M('borrow_verify')->field("deal_info,deal_info_2")->find($v['id']);
            $list['list'][$k]['dealinfo'] = $deal_info['deal_info_2']==''?$deal_info['deal_info']:$deal_info['deal_info_2'];
        }
		$this->assign('search',$search);
		$this->assign("list",$list['list']);
		$this->assign("pagebar",$list['page']);
	
	
		$data['html'] = $this->fetch();
		exit(json_encode($data));
	}
	public function borrowdone(){
		$map['borrow_uid'] = $this->uid;
		$map['borrow_status'] = 7;
		
		if($_GET['start_time8']&&$_GET['end_time8']){
			$_GET['start_time8'] = strtotime($_GET['start_time8']." 00:00:00");
			$_GET['end_time8'] = strtotime($_GET['end_time8']." 23:59:59");
			
			if($_GET['start_time8']<$_GET['end_time8']){
				$map['add_time']=array("between","{$_GET['start_time8']},{$_GET['end_time8']}");
				$search['start_time8'] = $_GET['start_time8'];
				$search['end_time8'] = $_GET['end_time8'];
			}
		}
        $b = new BorrowModel();
        $searchx = array();
        $searchx['map'] = $map;
        $searchx['limit'] = 10;
        $list = $b->getList("*",$searchx);
        $Bconfig = require C("APP_ROOT")."Conf/borrow_config.php";
        $type_arr =$Bconfig['REPAYMENT_TYPE'];
		$this->assign('search',$search);
        $this->assign('type_arr',$type_arr);
		$this->assign("list",$list['list']);
		$this->assign("pagebar",$list['page']);
	
		$data['html'] = $this->fetch();
		exit(json_encode($data));
	}

	public function cancel(){
        $b = new BorrowModel();
		$id = intval($_POST['id']);
		$newid = $b->borrowCancel($this->uid,$id);
		if($newid) ajaxmsg("撤消成功");
		else ajaxmsg("撤销失败，管理员已审核或已撤销",0);
			
	}

}