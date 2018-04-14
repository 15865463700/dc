<?php
// 尚贷内核类库，2014-06-11_listam
class AutoAction extends MCommonAction {

    public function index(){
		$this->display();
    }

	public function auto(){
        $ab = new AutoBorrowModel();
        $map = array();
        $map['uid']=$this->uid;
        $map['borrow_type'] = 1;
        $vo = $ab->where($map)->find();
		if($vo){
            $vo['is_dead'] = 0;
            if($vo['end_time']<time()){
                $vo['is_dead'] = 1;
            }
            $invest_time = $vo['invest_time'];
            $mapb['borrow_type'] = 1;
            $mapb['is_use'] = 1;
            $mapb['end_time'] = array("gt",time());
            $mapb['invest_time'] = array('elt',$invest_time);
            $vo['invest_id']&&$mapb['invest_id'] = array('lt',$vo['invest_id']);
            $vo['invest_id'] == 0 && $mapb['add_time'] = array('lt',$vo['add_time']);
            $count = $ab->where($mapb)->count('id');
            $this->assign("num",$count);
            $this->assign("now",$count+1);
            $this->assign("vo",$vo);
		}


        $map = array();
        $map['uid']=$this->uid;
        $map['borrow_type'] = 3;
        $vot = $ab->where($map)->find();
        if($vot){
            $vot['is_dead'] = 0;
            if($vot['end_time']<time()){
                $vot['is_dead'] = 1;
            }
            $invest_time = $vot['invest_time'];
            $mapt['borrow_type'] = 3;
            $mapt['is_use'] = 1;
            $mapt['end_time'] = array("gt",time());
            $mapt['invest_time'] = array('elt',$invest_time);
            $vot['invest_id']&&$mapt['invest_id'] = array('lt',$vot['invest_id']);
            $vot['invest_id'] == 0 && $mapt['add_time'] = array('lt',$vot['add_time']);
            $countt = $ab->where($mapt)->count('id');
            $this->assign("tnum",$countt);
            $this->assign("tnow",$countt+1);
            $this->assign("vot",$vot);
        }

		$data['html'] = $this->fetch();
		exit(json_encode($data));
	}

    public function autolong(){

        $ab = new AutoBorrowModel();
        $map = array();
        $map['uid']=$this->uid;
        $map['borrow_type'] = 1;
        $vo = $ab->where($map)->find();
		$vo['is_use_name'] = ($vo['is_use']==0)?"当前设置已暂停使用":"当前设置已启用";
        $vo['is_use_name'] = $vo['end_time'] < time()?"当前设置已过期":$vo['is_use_name'];
        $vo['is_end'] = $vo['end_time'] < time()?0:1;
        $m = new MembersModel();
		$x = $m->field("time_limit,user_leve")->find($this->uid);
		if($x['time_limit']>0 && $x['user_leve']==1) $is_vip=1;
		else $is_vip=0;
		$this->assign('isvip',$is_vip);
		$this->assign('vo',$vo);

		$data['html'] = $this->fetch();
		exit(json_encode($data));
    }
	
	public function setupauto(){
		$aid = intval($_POST['aid']);
		$s = intval($_POST['s']);
        $ab = new AutoBorrowModel();
        $vo = $ab->find($aid);
		if(is_array($vo)){
            $s == 0 && $data['invest_id'] = 0;
            $s == 1 && $data['add_time'] = time();
            $s == 1 && $data['invest_time'] = time();
            $data['id'] = $aid;
            $data['is_use'] = $s;
			$newid = $ab->save($data);
			if($newid) exit("1");
			else exit("0");
		}else{
			exit("0");
		}
	}

	public function savelong(){
        $m = new MembersModel();
		$x = $m->field("time_limit,user_leve")->find($this->uid);
		($x['time_limit']>0 && $x['user_leve']==1)?$is_vip=1:$is_vip=0;
		(intval($_POST['tendAmount'])==0 && $is_vip==1)?$is_full=1:$is_full=0;
		
		$duration = explode(",",text($_POST['loancycle']));
		$data['uid'] = $this->uid;
		$data['account_money'] = floatval($_POST['miniamount']);
		$data['borrow_type'] = intval($_POST['borrowtype']);
		$data['interest_rate'] = intval($_POST['interest']);
		$data['duration_from'] = intval($duration[0]);
		if($_POST['expireddate'] != ''){
			$data['end_time'] = strtotime($_POST['expireddate']." 00:00:00");
		}else{
			$data['end_time'] = strtotime(date("Y-m-d",time()+60*60*24*365));
		}
		$data['duration_to'] = intval($duration[1]);
		$data['is_auto_full'] = $is_full;
		$data['invest_money'] = floatval($_POST['tendAmount']);
		$data['min_invest'] = floatval($_POST['mininvest']);
		$data['add_ip'] = get_client_ip();
		$data['add_time'] = time();
        $data['invest_time'] = time();
        $data['is_use'] = 1;
        $data['can_day'] = $_POST['can_day']?1:0;
        $data['repayment_type'] = $_POST['repayment_type']?$_POST['repayment_type']:0;
        $ab = new AutoBorrowModel();
        $map['uid'] = $this->uid;
        $map['borrow_type'] = $data['borrow_type'];
        $c = $ab->where($map)->getField('id');
		if($c){
			$data['id'] = $c;
			$newid = $ab->save($data);
			if($newid){
                ajaxmsg("修改成功",1);
            }else{
                ajaxmsg("修改失败，请重试",0);
            }
		}
		else{
			$data['invest_time'] = time();
			$newid = $ab->add($data);
			if($newid) ajaxmsg("添加成功",1);
			else ajaxmsg("添加失败，请重试",0);
		}
	}

    public function autotransferindex(){
        $ab = new AutoBorrowModel();
        $map = array();
        $map['uid']=$this->uid;
        $map['borrow_type'] = 3;
        $vo = $ab->where($map)->find();
        $vo['is_use_name'] = ($vo['is_use']==0)?"当前设置已暂停使用":"当前设置已启用";
        $vo['is_use_name'] = $vo['end_time'] < time()?"当前设置已过期":$vo['is_use_name'];
        $vo['is_end'] = $vo['end_time'] < time()?0:1;
        $m = new MembersModel();
        $x = $m->field("time_limit,user_leve")->find($this->uid);
        if($x['time_limit']>0 && $x['user_leve']==1) $is_vip=1;
        else $is_vip=0;
        $this->assign('isvip',$is_vip);
        $this->assign('vo',$vo);

        $data['html'] = $this->fetch();
        exit(json_encode($data));
    }

}