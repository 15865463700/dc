<?php
// 尚贷内核类库，2014-06-11_listam
class ChargeAction extends MCommonAction {

    public function index(){
		$this->display();
    }

    public function allcharge(){
		$data['html'] = $this->fetch();
		exit(json_encode($data));
    }

    public function charge(){
		$map['uid'] = $this->uid;
		$account_money = M('member_money')->field('(account_money+back_money) account_money')->where($map)->find();
		$this->assign("account_money",$account_money);
		$this->assign("payConfig",FS("Dynamic/payconfig"));
		$data['html'] = $this->fetch();
		exit(json_encode($data));
    }

    public function chargeoff(){
		$this->assign("vo",M('article_category')->where("type_name='线下充值'")->find());
		
        $config = FS("Dynamic/payoff");
        $this->assign('bank', $config['BANK']);
        $this->assign('info',$config['BANK_INFO']);
        $data['html'] = $this->fetch();
		exit(json_encode($data));
    }

    public function chargelog(){
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
        $p = new PaylogModel();
        $searchx = array();
        $searchx['map'] = $map;
        $searchx['limit'] = 15;
        $list = $p->getList("*",$searchx);
        $status_arr = C("PAYLOG_TYPE");
        foreach($list['list'] as $key=>$v){
            $list['list'][$key]['status'] = $status_arr[$v['status']];
        }
        $m = new MembersModel();
        $minfo = $m->getMemberInfo($this->uid,'MoneyDetail','id');
        if($_GET['start_time']&&$_GET['end_time']){
            $map['status'] = 1;
            $pinfo = $p->field("sum(money) as charge ,sum(fee) as charge_fee")->where($map)->find();
            $minfo['charge'] = $pinfo['charge'];
            $minfo['charge_fee'] = $pinfo['charge_fee'];
        }
		$this->assign('search',$search);
		$this->assign("list",$list['list']);
		$this->assign("pagebar",$list['page']);
		$this->assign("success_money",$minfo['charge']);
		$this->assign("fee",$minfo['charge_fee']);
		
		$data['html'] = $this->fetch();
		exit(json_encode($data));
    }
    public function uploadImg()
    {
        $uid = $this->uid;
         
        if ( $_POST['picpath'] ){ //删除
            $imgpath = substr( $_POST['picpath'], 1 );           
            if ( in_array( $imgpath, $_SESSION['imgfiles'] ) ){                
                $res = unlink( C( "WEB_ROOT" ).$imgpath );                
                if ( $res )        $this->success( "删除成功", "", $_POST['oid'] );                
                else             $this->error( "删除失败", "", $_POST['oid'] );                
            }else{                
                $this->error( "图片不存在", "", $_POST['oid'] );            
            }        
        } else { //上传
            $this->savePathNew = C( "MEMBER_UPLOAD_DIR" )."PayImg/$uid/";            
            $this->saveRule = date( "YmdHis", time() ).rand( 0, 1000 );            
            $info = $this->CUpload(); 

            if ( !isset( $_SESSION['count_file'] ) )    $_SESSION['count_file'] = 1;            
            else                 ++$_SESSION['count_file'];

            $data['img'] = $info[0]['savepath'].$info[0]['savename'];  
            
                      
            $_SESSION['imgfiles'][$_SESSION['count_file']] = $data['img'];            
            echo "{$_SESSION['count_file']}:/".$data['img'];
        }
    }

}