<?php
// 全局设置
class RefereedetailAction extends ACommonAction
{
    function __construct(){
        parent::__construct();
        $this->spread = new SpreadModel();
    }
    /**
    +----------------------------------------------------------
     * 默认操作
    +----------------------------------------------------------
     */
    public function index()
    {
        $map=array();
        if(!empty($_REQUEST['runame'])){
            $map['mr.user_name'] = array("like",urldecode($_REQUEST['runame'])."%");
            $search['runame'] = urldecode($_REQUEST['runame']);
        }else{
            $map['m.recommend_id'] =array('neq','0');
        }
        if($_REQUEST['uname']){
            $map['m.user_name'] = array("like",urldecode($_REQUEST['uname'])."%");
            $search['uname'] = urldecode($_REQUEST['uname']);
        }
        $field = "msp.*,m.user_name,mr.user_name as recommend_name";

        $where['map'] = $map;
        $where['limit'] = C('ADMIN_PAGE_SIZE');
        $join[] = "__MEMBERS__ m on m.id = msp.uid";
        $join[] = "__MEMBERS__ mr on mr.id = msp.rid";
        $list = $this->spread->getList($field,$where,$join);
        $this->assign("list", $list['list']);
        $this->assign("pagebar", $list['page']);
        $this->assign("search", $search);
        $this->assign("query", http_build_query($search));

        $this->display();
    }

    public function export(){
        import("ORG.Io.Excel");

        $map=array();
        if(!empty($_REQUEST['runame'])){
            $map['mr.user_name'] = array("like",urldecode($_REQUEST['runame'])."%");
        }else{
            $map['m.recommend_id'] =array('neq','0');
        }
        if($_REQUEST['uname']){
            $map['m.user_name'] = array("like",urldecode($_REQUEST['uname'])."%");
        }
        $field = "msp.*,m.user_name,mr.user_name as recommend_name";

        $where['map'] = $map;
        $where['limit'] = "all";
        $join[] = "__MEMBERS__ m on m.id = msp.uid";
        $join[] = "__MEMBERS__ mr on mr.id = msp.rid";
        $list = $this->spread->getList($field,$where,$join);

        $row=array();
        $row[0]=array('序号','投资用户','推广人','投资总金额','投资总笔数','推广奖励');
        $i=1;
        foreach($list as $v){
            $row[$i]['i'] = $i;
            $row[$i]['user_name'] = $v['user_name'];
            $row[$i]['recommend_name'] = $v['recommend_name'];
            $row[$i]['capital'] = $v['suc_capital'];
            $row[$i]['bishu'] = $v['suc_num'];
            $row[$i]['offer'] = $v['reward'];
            $i++;
        }

        $xls = new Excel_XML('UTF-8', false, 'datalist');
        $xls->addArray($row);
        $xls->generateXML("datalistcard");
    }



}
?>