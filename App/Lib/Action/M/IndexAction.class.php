<?php
    /**
    * 手机版(wap)默认首页
    * @author  张继立  
    * @time 2014-02-24
    */
    class IndexAction extends HCommonAction
    {
        function __construct(){
            parent::__construct();
            $this->borrow = new BorrowModel();
            $this->transfer = new TransferModel();
        }
		
        public function index(){
		    $this->assign('time',time());
            //优计划
            $parm = array();
            $searchMap = array();
            $searchMap['borrow_status']=2;
            $searchMap['on_off']=1;
            $searchMap['online_time']=array("lt",time()+300);
            $parm['map'] = $searchMap;
            $parm['limit'] = 2;
            $parm['order'] = "is_show desc,id DESC";
            $listTBorrow = $this->transfer->getList("*",$parm);
            $this->assign("listTBorrow",$listTBorrow);
            //网站公告
            $parms['type_id'] = 9;
            $parms['limit'] =4;
            $this->assign("noticeList",getArticleList($parms));
            //网站公告


            //新手标
            $searchMapnew = array();
            $searchMapnew['money_collect']=0;
            $searchMapnew['is_new']=1;
            $searchMapnew['borrow_status']=array("in",'2,4,6,7');
            $order="borrow_status ASC,id DESC";
            $searchx = array();
            $searchx['map'] = $searchMapnew;
            $searchx['limit'] = 1;
            $searchx['order'] = $order;
            $listBorrowNew=$this->borrow->getList("borrow_interest_rate,repayment_type,borrow_duration,id,borrow_min,ROUND(has_borrow/borrow_money*100,2) as progress",$searchx);
            $this->assign("listBorrowNew",$listBorrowNew);
            //正在进行的贷款
            $searchMap = array();
            $searchMap['borrow_status']=array("in",'2,4,6,7');
            $searchMap['is_tuijian']=array("in",'0,1');
            $searchMap['is_new']=array("neq",'1');
            $order="borrow_status ASC,id DESC";
            $searchx = array();
            $searchx['map'] = $searchMap;
            $searchx['limit'] = 2;
            $searchx['order'] = $order;
            $listBorrow=$this->borrow->getList("*,ROUND(has_borrow/borrow_money*100,2) as progress",$searchx);
            $this->assign("listBorrow",$listBorrow);
            //正在进行的贷款
            $this->display();
        }
        public function index2()
        {

            $parm = array();
            $searchMap = array();
            $searchMap['on_off']=1;
            $searchMap['online_time']=array("lt",time()+300);
            $searchMap['borrow_status']=array("in",'2,7');
            $parm['limit'] = 5;
            $parm['map'] = $searchMap;
            $parm['order'] = "is_show desc,borrow_status ASC,id DESC";
            $list = $this->transfer->getList("*",$parm);
            if($this->isAjax()){
                $string ='';
                foreach($list['list'] as $key => $tvo){
					//<a href="'.getInvestUrl($vb['id']).'" >'.cnsubstr($vb['borrow_name'],17).'</a>
                    if($tvo["is_show"]==0&&$tvo["borrow_status"]==7){
                        $msg= '<a href="'.U("M/tinvest/tdetail", array("id"=>$tvo["id"])).'" class="btn btn-primary">已完成</a>';
                    }elseif($tvo["is_show"]==1&&$tvo["transfer_out"]!==$tvo["transfer_total"]){
                       $msg='<a href="'.U("M/tinvest/tdetail", array("id"=>$tvo["id"])).'"  class="btn btn-default">立即加入</a>';
                    }else{
                        $msg='<a href="'.U("M/tinvest/tdetail", array("id"=>$tvo["id"])).'" class="btn btn-primary">还款中</a>';
                    }
                    $string .= '<li><h3><a href="'.U('M/tinvest/tdetail', array('id'=>$tvo['id'])).'">优选定期（'.cnsubstr($tvo["borrow_name"],12).'）</a></h3>';
					$string .= '<div class="i_cont"><div class="progress"><div class="progress-bar" style="width:'.$tvo["progress"].'%;"> </div></div>';
					$string .= '<p><span class="u_rate">'.$tvo["borrow_interest_rate"].'<em>%</em></span>';
					$string .= '<span class="u_price">'.MFormt($tvo["borrow_money"]).'<em>元</em></span>';
					$string .= '<span class="u_date">'.$tvo["borrow_duration"].'<em>';
					$string .= $tvo["repayment_type"]."个月";
					$string .='</em></span></p><div class="clearfix"></div></div>';
					$string .= ''.$msg.'
						  <div class="clearfix"></div>
						</li>';
                }
                echo $string;
            }else{
                
                ///////////////企业直投列表开始 /////////////
                $this->assign('time', time());

                $this->assign('list', $list);
                $this->display();
            }
        }
        public function index3()
        {
            $searchMap['borrow_status']=array("in",'2,4,6,7');
            $searchMap['is_new']=array("neq",1);
            $order="borrow_status ASC,id DESC";
            $searchx = array();
            $searchx['map'] = $searchMap;
            $searchx['limit'] = 4;
            $searchx['order'] = $order;
            $list = $this->borrow->getList("*,ROUND(has_borrow/borrow_money*100,2) as progress",$searchx);
            $Bconfig = require C("APP_ROOT")."Conf/borrow_config.php";
            if($this->isAjax()){
                $string ='';
                foreach($list['list'] as $tvo){
                    $ico=getIco($tvo);
                    $string .= '<li><h3><a href="'.U('M/invest/detail', array('id'=>$tvo['id'])).'">'.cnsubstr($tvo["borrow_name"],13).'</a>';
                    $string .= '<a href="'.U('M/invest/invest', array('id'=>$tvo['id'])).'">'.$ico.'</a>';
                    if($tvo['reward_num'] != 0) {
                        $string .= '<span class="invest-new invest-red">奖励+'.$tvo["reward_num"].'%</span>';
                    }
                    $string .= '</h3>';
                    $string .= '<div class="i_rate"><strong>'.$tvo["borrow_interest_rate"].'</strong><em>%</em><br>年化收益率</div>';
                    $string .= '<div class="i_cont"><p>'.getMoneyFormt($tvo["borrow_money"]).'元 <i>|</i>'.$tvo["borrow_duration"];
                    $string .=$tvo['repayment_type']==1?'天':'个月';
                    $string .='</p>';
                    $string .= '<div class="progress i_progress"><div class="progress-bar" style="width:'.$tvo["progress"].'%;"> </div><span class="progress-value">'.$tvo["progress"].'%</span> ';
                    $string .= '</div><div class="clearfix"></div></div>';
                    $string .= borrow_status($tvo['id'],$tvo['borrow_status']);
                    $string .= '<div class="clearfix"></div></li>';
                }
                echo $string;
            }else{

                $this->assign('list', $list);
                $this->assign('Bconfig', $Bconfig);
                $this->display();
            }
        }
        public function index4()
        {
            //新手标
            $searchMapnew = array();
            $searchMapnew['money_collect']=0;
            $searchMapnew['is_new']=1;
            $searchMapnew['borrow_status']=array("in",'2,4,6,7');
            $order="borrow_status ASC,id DESC";
            $searchx = array();
            $searchx['map'] = $searchMapnew;
            $searchx['limit'] = 4;
            $searchx['order'] = $order;
            $list = $this->borrow->getList("*,ROUND(has_borrow/borrow_money*100,2) as progress",$searchx);
            $Bconfig = require C("APP_ROOT")."Conf/borrow_config.php"; 
            if($this->isAjax()){
                $string ='';
                foreach($list['list'] as $tvo){
					 $ico=getIco($tvo);
                    $string .= '<li><h3><a href="'.U('M/invest/detail', array('id'=>$tvo['id'])).'">'.cnsubstr($tvo["borrow_name"],13).'</a>';
					$string .= '<a href="'.U('M/invest/detail', array('id'=>$tvo['id'])).'">'.$ico.'</a>';
					if($tvo['reward_num'] != 0) 
                    $string .= '<span class="invest-new invest-red">奖励+'.$tvo["reward_num"].'%</span>';
              		$string .= '</h3>';
					$string .= '<div class="i_rate"><strong>'.$tvo["borrow_interest_rate"].'</strong><em>%</em><br>年化收益率</div>';
                    $string .= '<div class="i_cont"><p>'.MFormt($tvo["borrow_money"]).'元 <i>|</i> '.$tvo["borrow_duration"].'';
				    $string .= $tvo["repayment_type"]==1?"天":"个月";
                    $string .='</p>';
					$string .='<div class="progress i_progress"><div class="progress-bar" style="width:'.$tvo["progress"].'%;"></div><span class="progress-value">'.$tvo["progress"].'%</span>';
					$string .='</div><div class="clearfix"></div></div>';
					$string .= borrow_status($tvo['id'],$tvo['borrow_status']).'<div class="clearfix"></div>';
					$string .=' </li>';
                }
                echo $string;
            }else{
                
                ///////////////企业直投列表开始 /////////////
        
                $this->assign('list', $list);
                $this->assign('Bconfig', $Bconfig);
                $this->display(); 
            }
        }
    }
?>
