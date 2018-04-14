<?php
// 尚贷内核类库，2014-06-11_listam
class CapitalAction extends MCommonAction {

    public function index(){
		$this->display();
    }

    public function summary(){

        $mm = new MemberMoneyModel();
        $map['mm.uid'] = $this->uid;
        $field = $mm->getDetailField();
        $join[] = "__MEMBER_MONEY_DETAIL__ md on md.uid = mm.uid";
        $searchx = array();
        $searchx['map'] = $map;
        $searchx['limit'] = 1;
        $list = $mm->getList($field,$searchx,$join);
        $this->assign("vo",$list);
		////////////////////////////////////////////////////////////////////
		$data['html'] = $this->fetch();
		exit(json_encode($data));
    }

    public function detail(){
		$logtype = C('MONEY_LOG');
		$this->assign('log_type',$logtype);

		$map['uid'] = $this->uid;
		if($_GET['start_time']&&$_GET['end_time']){
			$_GET['start_time'] = strtotime($_GET['start_time']." 00:00:00");
			$_GET['end_time'] = strtotime($_GET['end_time']." 23:59:59");
			
			if($_GET['start_time']<$_GET['end_time']){
				$map['add_time']=array("between","{$_GET['start_time']},{$_GET['end_time']}");
				$search['start_time'] = $_GET['start_time'];
				$search['end_time'] = $_GET['end_time'];
			}
		}
        if($_GET['start_time']&&!isset($_GET['end_time'])){
            $_GET['start_time'] = strtotime($_GET['start_time']." 00:00:00");
            $map['add_time']=array("gt",$_GET['start_time']);
            $search['start_time'] = $_GET['start_time'];
        }
        if($_GET['end_time']&&!isset($_GET['start_time'])){
            $_GET['end_time'] = strtotime($_GET['end_time']." 00:00:00");
            $map['add_time']=array("lt",$_GET['end_time']);
            $search['end_time'] = $_GET['end_time'];
        }
		if(!empty($_GET['log_type'])){
				$map['type'] = intval($_GET['log_type']);
				$search['log_type'] = intval($_GET['log_type']);
		}

        $ml = new MoneyLogModel();
        $searchx = array();
        $searchx['map'] = $map;
        $searchx['limit'] = 20;
        $list = $ml->getList("*",$searchx);
		$this->assign('search',$search);
		$this->assign("list",$list['list']);		
		$this->assign("pagebar",$list['page']);	
        $this->assign("query", http_build_query($search));
		$data['html'] = $this->fetch();
		exit(json_encode($data));
    }


}