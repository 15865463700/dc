<?php
// 尚贷内核类库，2014-06-11_listam
class PromotionAction extends MCommonAction {

    public function index(){
		$this->display();
    }

    public function promotion(){
		$_P_fee=get_global_setting();
		$this->assign("reward",$_P_fee['award_invest']);
		$data['html'] = $this->fetch();
		exit(json_encode($data));
    }

	public function promotionfriend(){

        $uid = $this->uid;
        $field = "m.user_name,m.user_phone,mi.real_name,m.reg_time,msp.suc_num,msp.reward,
        CASE m.recommend_id WHEN msp.rid THEN 1 ELSE 0 END as status";
        $map['msp.rid'] = $uid;
        $join[] = "__MEMBERS__ m on m.id = msp.uid";
        $join[] = "__MEMBER_INFO__ mi on mi.uid = msp.uid";
        $where['map'] = $map;
        $where['limit'] = C('MEMBER_PAGE_SIZE');
        $where['order'] = 'status desc,msp.update desc';
        $sp = new SpreadModel();
        $list = $sp->getList($field,$where,$join);
        $this->assign("pagebar", $list['page']);
        $this->assign("list",$list['list']);
		$data['html'] = $this->fetch();
		exit(json_encode($data));
    }

}