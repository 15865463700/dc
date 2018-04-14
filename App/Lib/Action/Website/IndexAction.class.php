<?php
// 尚贷内核类库，2014-06-11_listam
class IndexAction extends HCommonAction {

    public function index()
    {

        //网站公告
        $parm['type_id'] = 9;
        $parm['limit'] = 4;
        $this->assign("noticeList", getArticleList($parm));
        //网站公告
        //最新动态
        $parm['type_id'] = 2;
        $parm['limit'] = 5;
        $this->assign("NnoticeList", getArticleList($parm));
        //最新动态
        //投资指南
        $parm['type_id'] = 48;
        $parm['limit'] = 5;
        $this->assign("GnoticeList", getArticleList($parm));
        //投资指南

        //投资排行榜

        $md = new MemberMoneyDetailModel();
        $bangdan_list = $md->rankingList(5,'suc_capital');

        $this->assign("bangdan_list", $bangdan_list);
        $borrow = new BorrowModel();

        $field = "*,ROUND(has_borrow/borrow_money*100,2) as progress";
        $map = array();
        $map['is_new'] = 0;
        $map['borrow_status'] = array("in","2,4,6,7");
        $where = array();
        $where['map'] = $map;
        $where['limit'] = 3;
        $where['order'] = "borrow_status asc,id desc";
        $borrowList = $borrow->getList($field,$where);
        $this->assign("borrow_list",$borrowList);
        $map['is_new'] = 1;
        $where['map'] = $map;
        $newList = $borrow->getList($field,$where);
        $this->assign("new_list", $newList);

        $map = array();
        $map['borrow_status'] = 2;
        $map['on_off'] = 1;
        $map['online_time'] = array("lt", time() + 300);
        $transfer = new TransferModel();
        $parm['map'] = $map;
        $parm['limit'] = 3;
        $parm['order'] = "is_show desc,borrow_status ASC,online_time desc";
        $fundList = $transfer->getList("*",$parm);
        $this->assign("fund_list", '');

        /******************************************/
        $link_img = M('friend')->where("link_img <> '' AND is_show = 1")->order("link_order desc")->select();
        $this->assign('link_img', $link_img);
        /******************************************/
        ///////////////优计划列表结束  fan 2014-06-13///////////////
        $this->display();
    }
}
