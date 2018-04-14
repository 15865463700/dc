<?php
/**
* wap版公共函数库
*/


/**
* 格式化资金数据保持两位小数
* @desc intval $num  // 接受资金数据
*/
function MFormt($num)
{
    return number_format($num,2);
}

/**
* 根据接收到的状态输出状态按钮
* @desc intval $status  // 借款状态
* @return string
* @author zhangjili 2014-03-25
*/
function borrow_status($borrow_id , $status=0)
{   
    switch($status){
        case 0:
            $href =  '<a href="'.U('M/Invest/detail', array('id'=>$borrow_id)).'" class="btn btn-primary">等待初审</a> ';
            break;
        case 1:
            $href =  '<a href="'.U('M/Invest/detail', array('id'=>$borrow_id)).'" class="btn btn-primary">初审未通过</a> ';
            break;
        case 2:
            //$href =  '<a href="/m'.getInvestUrl($borrow_id).'"  class="tz_bt">我要投资</a> '; 
			$href =  '<a href="'.U('M/Invest/detail', array('id'=>$borrow_id)).'"  class="btn btn-default">立即加入</a> ';
            break;
        case 4:
            $href =  '<a href="'.U('M/Invest/detail', array('id'=>$borrow_id)).'" class="btn btn-primary">复审中</a> ';
            break;
        case 5:
            $href =  '<a href="'.U('M/Invest/detail', array('id'=>$borrow_id)).'" class="btn btn-primary">复审未通过</a> ';
            break;
        case 6:
            $href =  '<a  href="'.U('M/Invest/detail', array('id'=>$borrow_id)).'"class="btn btn-primary">还款中</a> ';
            break;
        case 3:
            $href =  '<a href="'.U('M/Invest/detail', array('id'=>$borrow_id)).'" class="btn btn-primary">流标</a> ';
            break;
        case 7:
            $href =  '<a href="'.U('M/Invest/detail', array('id'=>$borrow_id)).'" class="btn btn-primary">完成</a> ';
            break;
        case 8:
            $href =  '<a href="'.U('M/Invest/detail', array('id'=>$borrow_id)).'" class="btn btn-primary">逾期</a> ';
            break;
        default:
            $href =  '<a href="'.U('M/Invest/detail', array('id'=>$borrow_id)).'" class="btn btn-primary">还款中</a> ';
    }
    
    return $href;
}
//获取特定栏目下文章列表
function getArticleList($parm){
    if(empty($parm['type_id'])) return;
    //$map['type_id'] = $parm['type_id'];
    $type_id= intval($parm['type_id']);
    $Allid = M("article_category")->field("id")->where("parent_id = {$type_id}")->select();
    $newlist = array();
    array_push($newlist,$parm['type_id']);

    foreach ($Allid as $ka => $v) {
        array_push($newlist,$v["id"]);
    }
    $map['type_id']= array("in",$newlist);

    $Osql="sort_order desc,id DESC";//id DESC,
    $field="id,title,art_set,art_time,art_url,art_img,art_info,art_writer,art_keyword,art_content";
    //查询条件
    if($parm['pagesize']){
        //分页处理
        import("ORG.Util.Page");
        $count = M('article')->where($map)->count('id');
        $p = new Page($count, $parm['pagesize']);
        $page = $p->show();
        $Lsql = "{$p->firstRow},{$p->listRows}";
        //分页处理
    }else{
        $page="";
        $Lsql="{$parm['limit']}";
    }

    $data = M('article')->field($field)->where($map)->order($Osql)->limit($Lsql)->select();

    $suffix=C("URL_HTML_SUFFIX");
    $typefix = get_type_leve_nid($map['type_id']);
    $typeu = implode("/",$typefix);
    foreach($data as $key=>$v){
        if($v['art_set']==1) $data[$key]['arturl'] = (stripos($v['art_url'],"http://")===false)?"http://".$v['art_url']:$v['art_url'];
        //elseif(count($typefix)==1) $data[$key]['arturl'] =
        else $data[$key]['arturl'] = MU("M/{$typeu}","article",array("id"=>$v['id'],"suffix"=>$suffix));
    }
    $row=array();
    $row['list'] = $data;
    $row['page'] = $page;

    return $row;
}
?>
