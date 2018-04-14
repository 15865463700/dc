<?php

/**
 * 加息券
 */
class InterestratecouponAction extends ACommonAction
{
	public function index()
	{
        $c = new CouponModel();
        $map = array();
        $where['map'] = $map;
        $where['limit'] = C('ADMIN_PAGE_SIZE');
        $list = $c->getConfList("*",$where);
        foreach($list['list'] as $k => $v){
            if($v['type'] == 11 && $v['status'] == 1 && $v['conditions'] == ''){
                $list['list'][$k]['status'] = 11;
            }
        }
        $ctype = $c->Ctype;
        $this->assign("list",$list);
        $this->assign("ctype",$ctype);
        $this->assign("cstatus",$c->Cstatus);
        $this->assign("canday",$c->canDay);
        $this->display();
	}
    public function add(){
        $c = new CouponModel();
        if(isset($_POST['submit'])){
            unset($_POST['submit']);
            $pid = $_POST['id'];
            M()->startTrans();
            $res = $c->editCouponConf($_POST,session('adminname'));
            if($res['status'] == 1){
                if($pid){
                    alogs("Coupon",$pid,1,'成功执行了更新加息券的操作！');//管理员操作日志
                }else{
                    alogs("Coupon",0,1,'成功执行了添加加息券的操作！');//管理员操作日志
                }
                M()->commit();
                $this->success("操作成功",'__URL__/index');
            }else{
                M()->rollback();
                if($pid){
                    alogs("Coupon",$pid,0,'更新加息券的操作失败！');//管理员操作日志
                }else{
                    alogs("Coupon",0,0,'添加加息券的操作失败！');//管理员操作日志
                }
                $this->error($res['msg']);
            }

        }else{
            $id = $_GET['id'];
            $ctype = $c->Ctype;
            if($id){
                $vo = $c->find($id);
                $vo['conditions'] = unserialize($vo['conditions']);
                $this->assign("vo",$vo);
            }else{
                $vo['title'] = 'C-'.date("YmdHis").mt_rand(100,999);
                $vo['online_time'] = time()+3*3600;
                $this->assign("vo",$vo);
            }
            $this->assign("ctype",$ctype);
            $this->display();
        }
    }

    public function sendpage(){
        $display = 'none';
        $c = new CouponModel();
        $id = $_REQUEST['id'];
        $vo = $c->find($id);
        if($vo['type']!=11){
            $this->error('该类型加息券不可手动下发');
        }
        $conditions = unserialize($vo['conditions']);
        unset($conditions['_URL_']);
        $m = new MembersModel();
        $map = array();
        $search['c_id'] = $vo['id'];
        if(!empty($_REQUEST['bj']) && !empty($_REQUEST['capital'])){
            $map['_string'] = " md.capital {$_REQUEST['bj']} {$_REQUEST['capital']}";
            $search['bj'] = $_REQUEST['bj'];
            $search['capital'] = $_REQUEST['capital'];
            $display = 'block';
        }else{
            if($conditions){
                $search['bj'] = $conditions['bj'];
                $search['capital'] = $conditions['capital'];
                $map['_string'] = " md.capital {$conditions['bj']} {$conditions['capital']}";
                $display = 'block';
            }
        }
        $field = "m.id,m.user_name,m.user_phone,mi.real_name,md.capital,md.withdraw,md.charge";
        $where['map'] = $map;
        $where['limit'] = C('ADMIN_PAGE_SIZE');
        $where['order'] = "m.id desc";
        $join[] = "__MEMBER_INFO__ mi on mi.uid = m.id";
        $join[] = "__MEMBER_MONEY_DETAIL__ md on md.uid = m.id";
        $list = $m->getList($field,$where,$join);
        $cl = new CouponListModel();
        foreach($list['list'] as $k => $v){
            $msg = "未领";
            $count = $cl->where("uid = {$v['id']} and c_id = {$vo['id']}")->count();
            if($count){
                $msg = "<font color='red'>已领</font>";
            }
            $list['list'][$k]['getcoupon'] = $msg;
        }
        $this->assign("bj", array(">"=>'大于',"="=>'等于',"<"=>'小于'));
        $this->assign('list',$list);
        $this->assign('vo',$vo);
        $this->assign('display',$display);
        $this->assign("search", $search);
        $this->assign("query", http_build_query($search));
        $this->display();
    }
    public function sendcoupon(){
        $id = $_REQUEST['c_id'];
        unset($_REQUEST['c_id']);
        unset($_REQUEST['_URL_']);
        $conditions = serialize($_REQUEST);
        $data['conditions']= $conditions;
        $data['id']= $id;
        $c = new CouponModel();
        $info = $c->find($id);
        if($info['status']!=0&&$info['conditions']!=''){
            $this->error("只能修改尚未开始发放或者尚未添加预发送条件的加息券");
            exit;
        }
        $res = $c->save($data);
        if($res!==false){
            alogs("Coupon",$id,1,'成功执行了预发送加息券的操作！');//管理员操作日志
            $this->success("操作成功",'__URL__/index');
        }else{
            alogs("Coupon",$id,0,'预发送加息券的失败！');//管理员操作日志
            $this->error("操作失败");
        }
    }

    public function sublist(){

        $id  = $_REQUEST['id'];
        $coupon_list = new CouponListModel();
        $map['t.c_id'] = $id;
        $where['map'] = $map;
        $where['limit'] = C('ADMIN_PAGE_SIZE');
        $where['order'] = "t.status asc,t.add_time desc";
        $field = "t.*,m.user_name,b.borrow_name,bi.investor_capital";
        $join[] = "__MEMBERS__ m on m.id = t.uid";
        $join[] = "__BORROW_INFO__ b on b.id = t.borrow_id";
        $join[] = "__BORROW_INVESTOR__ bi on bi.id = t.invest_id";
        $list = $coupon_list->getList($field,$where,$join);
        $this->assign('list',$list);
        $this->assign('status',$coupon_list->lstatus);
        $this->display();

    }

    public function couponlog(){
        $map = array();
        $cl = new CouponLogModel();
        $where['map'] = $map;
        $where['limit'] = C('ADMIN_PAGE_SIZE');
        $join[] = "__MEMBERS__ m on m.id = t.uid";
        $join[] = "__COUPON_INTEREST_LIST__ c on c.id = t.cid";
        $list = $cl->getList("t.*,m.user_name,c.title,c.rate",$where,$join);
        $this->assign('list',$list);
        $this->display();
    }
}

?>
