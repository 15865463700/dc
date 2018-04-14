<?php
/**
 * User: lex
 * createTime: 2015/10/27 14:27
 */
class NoviceAction extends HCommonAction{
    public function index()
    {
        $searchMapnew = array();
        $searchMapnew['b.money_collect']=0;
        $searchMapnew['b.borrow_status']=array("in",'2,4,6,7');
        $searchMapnew['b.is_new']=1;
        $order = "borrow_status ASC,id DESC";
        $pagesize = 5;
        $b = new BorrowModel();
        $searchx = array();
        $searchx['map'] = $searchMapnew;
        $searchx['limit'] = $pagesize;
        $searchx['order'] = $order;
        $listBorrowNew = $b->getList("*,ROUND(has_borrow/borrow_money*100,2) as progress",$searchx);
        foreach($listBorrowNew['list'] as $key=>$v){
            $project_pic=unserialize($listBorrowNew['list'][$key]['updata']);
            $listBorrowNew['list'][$key]['project_pic_thumb']=$project_pic[0]['img'];
        }
        $num=count($listBorrowNew['list']);
        if($num <= $pagesize){
            $is_show=0;
        }else{
            $is_show=1;
        }
        $this->assign("listBorrowNew",$listBorrowNew);
        $this->assign('is_show',$is_show);
        $this->display();
    }
}