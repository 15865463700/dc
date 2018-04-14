<?php

/**
 * 加息券
 */
class RedpacketAction extends ACommonAction
{

	/*public function sendpage()
	{
        if(is_array($_REQUEST['checkbox'])){

            $detail = M('interestratecoupon_detail');
            $quan =  M('interestratecoupon');
            $res = $quan->field('status')->find($_REQUEST['id']);
            if($res['status'] == 0){
                foreach ($_REQUEST['checkbox'] as $k => $v) {
                    $data['cid'] = $_REQUEST['id'];
                    $data['uid'] = $v;
                    $data['addtime'] = time();
                    $detail->add($data);
                }

                $data1['status'] = 1;
                $data1['id'] = $_REQUEST['id'];
                $quan->save($data1);

                echo "<script>alert('发送成功')</script>";
            }else{
                echo "<script>alert('发送失败')</script>";

            }

        }


		if($_REQUEST['condition'] == 'all'){
			$members = M('members')->select();
            $this->assign('select_state','all');
        }elseif($_REQUEST['condition'] == 'vip'){
            $members = M('members')->where(array('user_leve'=>'1'))->select();
            $this->assign('select_state','vip');
        }

		if(isset($members)){
			$this->assign('members',$members);
		}

		$this->display();
	}*/
	
	public function index()
	{
        $map = array();
        if(isset($_REQUEST["status"])){
            $map["status"] = $_REQUEST["status"];
        }
        $this->_list(M("redpacket"), $field ='*', $map, "id", false);
        $this->assign("xaction",ACTION_NAME);
        $this->display();
	}

   /* public function sublist(){
        $map = array();
        $map["cid"] = $_REQUEST["id"];
        $this->_list(D("JiaxiquanView"), $field ='*', $map, "id", false);
        $this->assign("xaction",ACTION_NAME);
        $this->display();
    }*/
	public function doadd()
	{
		
		if(isset($_POST['submit1'])&&$_POST['submit1']==1){
			
			foreach($_POST['ad_type'] as $k=>$v)
			{
				if($v==0)
				{
					$_POST['phone_status']=1;
				}else if($v==1)
				{
					$_POST['email_status']=1;
				}else if($v==2)
				{
					$_POST['name_status']=1;
				}
			}
			
			$data['title']=$_POST['title'];
            $data['rmoney']=preg_replace('/^0+/','',$_POST['rmoney']);
            $data['min_duration']=trim($_POST['min_duration']);
            $data['max_duration']=trim($_POST['max_duration']);
            $data['min_invest_money']=preg_replace('/^0+/','',$_POST['min_invest_money']);
			$data['name_status']=trim($_POST['name_status']);
			$data['email_status']=trim($_POST['email_status']);
         
            $data['phone_status']=trim($_POST['phone_status']);
           
            $data['expire_time']=trim($_POST['expire_time']);
            $data['add_time']=time();
			
			$count = M('redpacket')->add($data);
            $this->success("添加成功","__URL__/index");
			
		}
	}

    /*public function _addFilter(){
        $this->assign("title","u-".date( 'YmdHis' ).mt_rand(100000, 999999));
        $this->assign("online_time",time());
        $this->assign("deadline",time());
    }*/

	/*public function _doAddFilter($model)
	{
        $model->online_time = strtotime(urldecode($_REQUEST['online_time']));
        $model->deadline = strtotime(urldecode($_REQUEST['deadline']));
        $model->addtime = time();
        return $model;
	}

    public function _doEditFilter($model){
        $model->online_time =strtotime(urldecode($_REQUEST['online_time']));
        $model->deadline =strtotime(urldecode($_REQUEST['deadline']));
        return $model;
    }*/
}

?>
