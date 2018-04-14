<?php
    class DebtAction extends ACommonAction
    {
        public function index()
        {

            $get_status = $_REQUEST['status'];
            $debt = new DebtModel();
            if($get_status){
                if(stripos($get_status, ',')){
                    $map['d.status'] = array('in',$get_status);
                }else{
                    $map['d.status'] = $get_status;
                }
                $where['map'] = $map;
            }
            $order = 'FIELD(d.status,99,1,2,4,3)';
            $where['order'] = $order;
            $where['limit'] = C('ADMIN_PAGE_SIZE');
            $field = "d.*,b.borrow_name,b.borrow_interest_rate,b.total,b.has_pay,m.user_name,m.id uid";
            $join[] = "__BORROW_INFO__ b on b.id = d.borrow_id";
            $join[] = "__MEMBERS__ m on m.id = d.sell_uid";
            $list = $debt->getList($field,$where,$join);
            $this->assign('list', $list);
            $template = '';
            $get_status == 3 && $template='list3';
            $this->display($template);
        }
        
        public function audit()
        {
            if($_POST['dosubmit']){
                $status = intval($this->_post('status', 'strip_tags','99'));
                $debt_id = intval($this->_post('debt_id', 'strip_tags', 0));
                $remark = '管理员：'.$this->_post('remark', 'htmlspecialchars');  
                $debt = new DebtModel();
                $res = $debt->doDebtStatus($debt_id,$status,$remark);
                if($res['status']==1){
                    $this->success("审核成功！", U("debt/index"));
                }else{
                    $this->error("审核失败！");
                }
            }else{
                $debt_id = $this->_get('debt_id','strip_tags');
                $this->assign("debt_id", $debt_id);
                $this->display();    
            }
            
        }
    }
?>
