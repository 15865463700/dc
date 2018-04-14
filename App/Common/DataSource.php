<?php

//获取特定栏目下文章列表
function getAreaArticleList($parm){
    if(empty($parm['type_id'])) return;
    $map['type_id'] = $parm['type_id'];
    $Osql="id DESC";
    $field="id,title,art_set,art_time,art_url,area_id";
    //查询条件
    if($parm['pagesize']){
        //分页处理
        import("ORG.Util.Page");
        $count = M('article_area')->
        where($map)->count('id');
        $p = new Page($count, $parm['pagesize']);
        $page = $p->show();
        $Lsql = "{$p->firstRow},{$p->listRows}";
        //分页处理
    }else{
        $page="";
        $Lsql="LIMIT {$parm['limit']}";
    }

    $data = M('article_area')->field($field)->where($map)->order($Osql)->limit($Lsql)->select();

    $suffix=C("URL_HTML_SUFFIX");
    $typefix = get_type_leve_area_nid($map['type_id'],$parm['area_id']);

    $typeu = implode("/",$typefix);
    foreach($data as $key=>$v){
        if($v['art_set']==1) $data[$key]['arturl'] = (stripos($v['art_url'],"http://")===false)?"http://".$v['art_url']:$v['art_url'];
        //elseif(count($typefix)==1) $data[$key]['arturl'] =
        else $data[$key]['arturl'] = MU(C("DEFAULT_GROUP")."{$typeu}","article",array("id"=>"id-".$v['id'],"suffix"=>$suffix));
    }
    $row=array();
    $row['list'] = $data;
    $row['page'] = $page;

    return $row;
}

//获取下级或者同级栏目列表
function getAreaTypeList($parm){
    //if(empty($parm['type_id'])) return;
    $Osql="sort_order DESC";
    $field="id,type_name,type_set,add_time,type_url,type_nid,parent_id,area_id";
    //查询条件
    $Lsql="{$parm['limit']}";
    $pc = D('Aacategory')->where("parent_id={$parm['type_id']} AND area_id={$parm['area_id']}")->count('id');
    if($pc>0){
        $map['is_hiden'] = 0;
        $map['parent_id'] = $parm['type_id'];
        $map['area_id'] = $parm['area_id'];
        $data = D('Aacategory')->field($field)->where($map)->order($Osql)->limit($Lsql)->select();
    }elseif(!isset($parm['notself'])){
        $map['is_hiden'] = 0;
        $map['parent_id'] = D('Aacategory')->getFieldById($parm['type_id'],'parent_id');
        $map['area_id'] = $parm['area_id'];
        $data = D('Aacategory')->field($field)->where($map)->order($Osql)->limit($Lsql)->select();
    }

    //链接处理
    $typefix = get_type_leve_area_nid($parm['type_id'],$parm['area_id']);
    $typeu = $typefix[0];
    $suffix=C("URL_HTML_SUFFIX");
    foreach($data as $key=>$v){
        if($v['type_set']==2){
            if(empty($v['type_url'])) $data[$key]['turl']="javascript:alert('请在后台添加此栏目链接');";
            else $data[$key]['turl'] = $v['type_url'];
        }
        elseif($v['parent_id']==0&&count($typefix)==1) $data[$key]['turl'] = MU(C("DEFAULT_GROUP")."/{$v['type_nid']}/index","typelist",array("id"=>$v['id'],"suffix"=>$suffix));
        else $data[$key]['turl'] = MU(C("DEFAULT_GROUP")."/{$typeu}/{$v['type_nid']}","typelist",array("id"=>$v['id'],"suffix"=>$suffix));
    }
    $row=array();
    $row = $data;

    return $row;
}

function get_bconf_setting(){
    if(!S('bconf_setting')){
        $borrowconfig=  require C("ROOT_URL")."Dynamic/borrowconfig.php";
        $bconf=$borrowconfig;

        S('bconf_setting',$bconf);
        S('bconf_setting',$bconf,3600*C('TTXF_TMP_HOUR'));
    }else{
        $bconf = S('bconf_setting');
    }

    return $bconf;
}

/**
 * 标种小图标展示
 *
 * @param mixed
 */
function getIco($map){
    $str="";
    if($map['borrow_type']==2) $str.='<img src="/Style/M/images/icon/d.png" class="ico" align="absmiddle">';
    elseif($map['borrow_type']==3) $str.='<img src="/Style/M/images/icon/m.png" class="ico" align="absmiddle">';
    elseif($map['borrow_type']==4) $str.='<img src="/Style/M/images/icon/jing.png" class="ico" align="absmiddle">';
    elseif($map['borrow_type']==1) $str.='<img src="/Style/M/images/icon/xin.png" class="ico" align="absmiddle">';
    elseif($map['borrow_type']==5) $str.='<img src="/Style/M/images/icon/ya.png" class="ico" align="absmiddle">';
    elseif($map['borrow_type']==6) $str.='<img src="/Style/M/images/icon/lbt.png" class="ico" align="absmiddle">';
    if($map['repayment_type']==1) $str.='<img src="/Style/M/images/icon/t.png" class="ico" align="absmiddle">';
    if(!empty($map['password'])) $str.='<img src="/Style/M/images/icon/passw.png" class="ico" align="absmiddle">';
    if($map['is_tuijian']==1) $str.='<img src="/Style/M/images/icon/tuijian.png" class="ico" align="absmiddle">';
    if($map["is_new"]) $str.='<img src="/Style/M/images/icon/isnew.png" class="isNew ico" align="absmiddle">';
    return $str.'';
}
function getRewardIco($map){
    $str='';
    if($map['reward_type']>0 &&($map['reward_num']>0)) {
        $str.='<a href="javascript:;" class="invest-new">奖励+'.$map["reward_num"].'%</a>';
    }
    return $str.'&nbsp;&nbsp;';
}


function ajaxmsg($msg="",$type=1,$is_end=true){
    $json['status'] = $type;
    if(is_array($msg)){
        foreach($msg as $key=>$v){
            $json[$key] = $v;
        }
    }elseif(!empty($msg)){
        $json['message'] = $msg;
    }
    $json['url'] = $_SESSION['refer'];
    $_SESSION['refer'] = '';
    if($is_end){
        echo json_encode($json);
        exit;
    }else{
        echo json_encode($json);
        exit;
    }
}

//字段文字内容隐藏处理方法
function hidecard($cardnum,$type=1,$default=""){
    if(empty($cardnum)) return $default;
    if($type==1) $cardnum = substr($cardnum,0,3).str_repeat("*",3).substr($cardnum,strlen($cardnum)-4);//身份证
    elseif($type==2) $cardnum = substr($cardnum,0,3).str_repeat("*",3).substr($cardnum,strlen($cardnum)-4);//手机号
    elseif($type==3) $cardnum = str_repeat("*",strlen($cardnum)-4).substr($cardnum,strlen($cardnum)-4);//银行卡
    elseif($type==4)
    {

        if(preg_match("/[\x7f-\xff]/", substr($cardnum,0,2))&& !preg_match("/[\x7f-\xff]/", substr($cardnum,0,1)))
        {
            $str = substr($cardnum,0,4);
        }
        elseif(!preg_match("/[\x7f-\xff]/", substr($cardnum,0,2)) && preg_match("/[\x7f-\xff]/", substr($cardnum,0,3)))
        {
            $str = substr($cardnum,0,2);
        }
        else{
            $str = substr($cardnum,0,3);
        }
        $cardnum = $str.str_repeat("*",strlen($cardnum)-3);//用户名

    }elseif($type==5)
    {


        if(preg_match("/[\x7f-\xff]/", substr($cardnum,0,2))&& !preg_match("/[\x7f-\xff]/", substr($cardnum,0,1))){
            $str1 = substr($cardnum,0,4);
        }
        elseif(!preg_match("/[\x7f-\xff]/", substr($cardnum,0,2)) && preg_match("/[\x7f-\xff]/", substr($cardnum,0,3))){
            $str1 = substr($cardnum,0,2);
        }else{
            $str1 = substr($cardnum,0,3);
        }
        if(preg_match("/[\x7f-\xff]/", substr($cardnum,strlen($cardnum)-2))&& !preg_match("/[\x7f-\xff]/", substr($cardnum,strlen($cardnum)-1))){
            $str2 = substr($cardnum,strlen($cardnum)-4);
        }
        elseif(!preg_match("/[\x7f-\xff]/", substr($cardnum,strlen($cardnum)-2)) && preg_match("/[\x7f-\xff]/", substr($cardnum,strlen($cardnum)-3))){
            $str2 = substr($cardnum,strlen($cardnum)-2);
        }
        else{
            $str2 = substr($cardnum,strlen($cardnum)-3);
        }

        $cardnum = $str1.str_repeat("*",3).$str2;//新用户名

    }
    return $cardnum;
}

function setmb($size)
{
    $mbsize=$size/1024/1024;
    if($mbsize>0)
    {
        list($t1,$t2)=explode(".",$mbsize);
        $mbsize=$t1.".".substr($t2,0,2);
    }

    if($mbsize<1){
        $kbsize=$size/1024;
        list($t1,$t2)=explode(".",$kbsize);
        $kbsize=$t1.".".substr($t2,0,2);
        return $kbsize."KB";
    }else{
        return $mbsize."MB";
    }

}

function getMoneyFormt($money){
    if($money>=100000 && $money<=100000000){
        $res = getFloatValue(($money/10000),2)."万";
    }else if($money>=100000000){
        $res = getFloatValue(($money/100000000),2)."亿";
    }else{
        $res = getFloatValue($money,2);
    }
    return $res;
}


function getArea(){
    $area = FS("Dynamic/area");
    if(!is_array($area)){
        $list = M("area")->getField("id,name");
        FS("area",$list,"Dynamic/");
    }else{
        return $area;
    }
}

//信用等级图标显示
function getLeveIco($num,$type=1){
    $leveconfig = FS("Dynamic/leveconfig");
    foreach($leveconfig as $key=>$v){
        if($num>=$v['start'] && $num<=$v['end']){
            if($type==1) return "/Static/leveico/".$v['icoName'];
            elseif($type==2)  return '<a  target="_blank" href="/user/credit#fragment-1"><img class="icon_ic" src="/Static/leveico/'.$v['icoName'].'"/></a>';
            elseif($type==3)  return '<a href="/user/credit#fragment-1">'.$v['name'].'</a>' ;//手机版使用
            else   return '<a href="/user/credit#fragment-1"><img class="icon_ic" src="/Static/leveico/'.$v['icoName'].'" title="'.$v['name'].'"/></a>';
        }
    }
}

//投资等级图标显示
function getInvestLeveIco($num,$type=1){
    $leveconfig = FS("Dynamic/leveinvestconfig");
    foreach($leveconfig as $key=>$v){
        if($num>=$v['start'] && $num<=$v['end']){
            if($type==1){
                return "/Static/leveico/".$v['icoName'];
            }elseif($type==2){
                return '<a target="_blabk" href="/user/credit#fragment-2"><img class="icon_icon" src="/Static/leveico/'.$v['icoName'].'" title="'.$v['name'].'"/></a>';
            }elseif($type==3){
                return $v['name'] ;//手机版使用
            }else{
                return '<a href="/user/credit#fragment-2"><img class="icon_icon" src="/Static/leveico/'.$v['icoName'].'" title="'.$v['name'].'"/></a>';										}
        }
    }
}
//投资等级图标显示 微信端
function getInvestLeveIcoM($num,$type=1){
    $leveconfig = FS("Dynamic/leveinvestconfig");
    foreach($leveconfig as $key=>$v){
        if($num>=$v['start'] && $num<=$v['end']){
            if($type==1){
                return "/Static/leveicom/".$v['icoName'];
            }elseif($type==2){
                return '<a target="_blabk"><img class="icon_icon" src="/Static/leveicom/'.$v['icoName'].'" title="'.$v['name'].'"/></a>';
            }elseif($type==3){
                return $v['name'] ;//手机版使用
            }else{
                return '<a><img class="icon_icon" src="/Static/leveicom/'.$v['icoName'].'" title="'.$v['name'].'"/></a>';										}
        }
    }
}
//信用等级图标显示  微信端
function getLeveIcoM($num,$type=1){
    $leveconfig = FS("Dynamic/leveconfig");
    foreach($leveconfig as $key=>$v){
        if($num>=$v['start'] && $num<=$v['end']){
            if($type==1) return "/Static/leveicom/".$v['icoName'];
            elseif($type==2)  return '<a  target="_blank"><img class="icon_ic" src="/Static/leveicom/'.$v['icoName'].'"/></a>';
            elseif($type==3)  return '<a>'.$v['name'].'</a>' ;//手机版使用
            else   return '<a><img class="icon_ic" src="/Static/leveicom/'.$v['icoName'].'" title="'.$v['name'].'"/></a>';
        }
    }
}
function Fmoney1($money){
    if(!is_numeric($money) || $money == 0) return "0.00";
    if($money<0){
        $money = $money*(-1);
    }

    $dot = explode(".",$money);
    $tmp_money = strrev_utf8($dot[0]);
    $format_money = "";
    for($i = 3;$i<strlen($dot[0]);$i+=3){
        $format_money .= substr($tmp_money,0,3).",";
        $tmp_money = substr($tmp_money,3);
    }
    $format_money .=$tmp_money;
    $format_money = strrev_utf8($format_money);
    if($dot[1]){
        return $format_money.".".$dot[1];
    }else{
        return $format_money.".00";
    }
}

function Fmoney($money){
    if(!is_numeric($money) || $money == 0) return "￥0.00";
    $sb = "";
    if($money<0){
        $sb="-";
        $money = $money*(-1);
    }

    $dot = explode(".",$money);
    $tmp_money = strrev_utf8($dot[0]);
    $format_money = "";
    for($i = 3;$i<strlen($dot[0]);$i+=3){
        $format_money .= substr($tmp_money,0,3).",";
        $tmp_money = substr($tmp_money,3);
    }
    $format_money .=$tmp_money;
    if(empty($sb)) $format_money = "￥".strrev_utf8($format_money);
    else $format_money = "￥-".strrev_utf8($format_money);
    if($dot[1]){
        return $format_money.".".$dot[1];
    }else{
        return $format_money.".00";
    }
}

function strrev_utf8($str) {
    return join("", array_reverse(
        preg_split("//u", $str)
    ));
}
//获取管理员ID对应的名称,以id为键
function get_admin_name($id=false){
    $stype = "adminlist";
    $list = array();
    if(!S($stype)){
        $rule = M('ausers')->field('id,user_name')->select();
        foreach($rule as $v){
            $list[$v['id']]=$v['user_name'];
        }

        S($stype,$list,3600*C('HOME_CACHE_TIME'));
        if(!$id) $row = $list;
        else $row = $list[$id];
    }else{
        $list = S($stype);
        if($id===false) $row = $list;
        else $row = $list[$id];
    }
    return $row;
}



function rand_string($len=6,$type=1,$addChars='') {
    switch($type) {
        case 0:
            $chars='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'.$addChars;
            break;
        case 1:
            $chars= str_repeat('0123456789',3);
            break;
        case 2:
            $chars='ABCDEFGHIJKLMNOPQRSTUVWXYZ'.$addChars;
            break;
        case 3:
            $chars='abcdefghijklmnopqrstuvwxyz'.$addChars;
            break;
        default :
            // 默认去掉了容易混淆的字符oOLl和数字01，要添加请使用addChars参数
            $chars='ABCDEFGHIJKMNPQRSTUVWXYZabcdefghijkmnpqrstuvwxyz23456789'.$addChars;
            break;
    }
    if($len>10 ) {//位数过长重复字符串一定次数
        $chars= $type==1? str_repeat($chars,$len) : str_repeat($chars,5);
    }
    $chars   =   str_shuffle($chars);
    $str     =   substr($chars,0,$len);
    return $str;
}
/**
 * 设置用户认证状态 处理表为members_status
 *
 * @param int $uid  // 用户id
 * @param string $type  // 类型的名字 结合数据库字段
 * @param int  $status // 状态0 or 1
 * @param string $info //类别说明，用户保存增加积分说明
 */
function setMemberStatus($uid, $type, $status, $log_type, $log_info)
{
    $ms = new MemberStatusModel();
    $nid = $ms->setMemberStatus($uid, $type, $status, $log_type, $log_info);
    return $nid;
}

/**
 * 过滤上传资料类型
 *
 * @param array $arr  // Dynamic/integration 文件
 */
function FilterUploadType($arr)
{
    $uploadType = array();
    if(is_array($arr)){
        foreach($arr as $key=>$val){
            if(is_numeric($key)){
                $uploadType[$key] = $val;
            }
        }
    }
    return $uploadType;
}

/**
 * 获取当前用户没有上传过的上传资料类型
 *
 * @param int $uid   // 用户id
 */
function get_upload_type($uid)
{
    $integration = FilterUploadType(FS("Dynamic/integration"));
    $uploadType = M('member_data_info')->field('type')->where("uid='{$uid}' and status in (0,1)")->select();
    foreach($uploadType as $row){
        unset($integration[$row['type']]);
    }
    foreach($integration as $key=>$val){
        $integration[$key] = $val['description'];
    }
    return $integration;
}



/****************************
/*  手机短信接口（整合吉信通www.winic.org、漫道短信www.zucp.net和亿美短信www.zucp.net）
/* 参数：$mob  		手机号码
/*		$content   	短信内容
 *****************************/
function sendsms($mob,$content){


    $msgconfig = FS("Dynamic/msgconfig");
    $type = $msgconfig['sms']['type'];// type=0 吉信通短信接口   type=1    type=2 亿美短信接口
    if($type==0){
        $uid=$msgconfig['sms']['user1']; //分配给你的账号
        $pwd=$msgconfig['sms']['pass1']; //密码
        $mob=$mob; //发送号码用逗号分隔
        if(PATH_SEPARATOR==':'){//如果是Linux系统，则执行linux短息接口
            $url="http://service.winic.org:8009/sys_port/gateway/?id=%s&pwd=%s&to=%s&content=%s&time=";
            $id = urlencode($uid);
            $pwd = urlencode($pwd);
            $to = urlencode($mob);
            $content = iconv("UTF-8","GB2312",$content);
            $rurl = sprintf($url, $id, $pwd, $to, $content);

            $ch = curl_init();
            curl_setopt($ch, CURLOPT_POST, 1);
            curl_setopt($ch, CURLOPT_HEADER, 0);
            curl_setopt($ch, CURLOPT_URL,$rurl);
            curl_setopt($ch,CURLOPT_RETURNTRANSFER,true);
            $result = curl_exec($ch);
            curl_close($ch);
            $status = substr($result, 0,3);
            if($status==="000"){
                return true;
            }else{
                return false;
            }

        }else{
            $content=urlencode(auto_charset($content,"utf-8",'gbk'));  //短信内容
            $sendurl="http://service.winic.org:8009/sys_port/gateway/?";
            $sdata="id=".$uid."&pwd=".$pwd."&to=".$mob."&content=".$content."&time=";

            $xhr=new COM("MSXML2.XMLHTTP");
            $xhr->open("POST",$sendurl,false);
            $xhr->setRequestHeader ("Content-type:","text/xml;charset=GB2312");
            $xhr->setRequestHeader ("Content-Type","application/x-www-form-urlencoded");
            $xhr->send($sdata);
            $data = explode("/",$xhr->responseText);
            if($data[0]=="000") return true;
            else return false;
        }
    }elseif($type==1){
        /////////////////////////////////////////漫道短信接口 开始/////////////////////////////////////////////////////////////
        //如果您的系统是utf-8,请转成GB2312 后，再提交、
        $flag = 0;
        //要post的数据
        $argv = array(
            'sn'=>$msgconfig['sms']['user2'], ////替换成您自己的序列号
            'pwd'=>$msgconfig['sms']['pass2'], //此处密码需要加密 加密方式为 md5(sn+password) 32位大写

            'mobile'=>$mob,//手机号 多个用英文的逗号隔开 post理论没有长度限制.推荐群发一次小于等于10000个手机号
            'content'=>iconv( "UTF-8", "gb2312//IGNORE" ,$content),//短信内容
            'ext'=>'',
            'stime'=>'',//定时时间 格式为2011-6-29 11:09:21
            'rrid'=>''
        );
        //构造要post的字符串
        foreach ($argv as $key=>$value) {
            if ($flag!=0) {
                $params .= "&";
                $flag = 1;
            }
            $params.= $key."=";
            $params.= urlencode($value);
            $flag = 1;
        }
        $length = strlen($params);
        //创建socket连接
        $fp = fsockopen("sdk2.zucp.net",8060,$errno,$errstr,10) or exit($errstr."--->".$errno);
        //构造post请求的头
        $header = "POST /webservice.asmx/mt HTTP/1.1\r\n";
        $header .= "Host:sdk2.zucp.net\r\n";
        $header .= "Content-Type: application/x-www-form-urlencoded\r\n";
        $header .= "Content-Length: ".$length."\r\n";
        $header .= "Connection: Close\r\n\r\n";
        //添加post的字符串
        $header .= $params."\r\n";
        //发送post的数据
        fputs($fp,$header);
        $inheader = 1;
        while (!feof($fp)) {
            $line = fgets($fp,1024); //去除请求包的头只显示页面的返回数据
            if ($inheader && ($line == "\n" || $line == "\r\n")) {
                $inheader = 0;
            }
            if ($inheader == 0) {
                // echo $line;
            }
        }
        $rescode = $inheader;
        $line=str_replace("
<string xmlns=\"http://tempuri.org/\">","",$line);
        $line=str_replace("</string>
","",$line);
        $result=explode("-",$line);

        if(count($result)>1){
            return false;
        }else{
            return true;
        }
        /////////////////////////////////////////漫道短信接口 结束/////////////////////////////////////////////////////////////
    }elseif($type==2){
        ////////////////////////////////////////////////////////亿美短信接口 开始/////////////////////////////////////////////
        $uid=$msgconfig['sms']['user3']; //分配给你的账号
        $pwd=$msgconfig['sms']['pass3']; //密码
        $mob=$mob; //发送号码用逗号分隔
        #短信内容
        $content2=$content;
        $content=urlencode(auto_charset($content,"utf-8",'utf-8'));

        $sendurl="http://sdk4report.eucp.b2m.cn:8080/sdkproxy/sendsms.action?";
        $sendurl.='cdkey='.$uid.'&password='.$pwd.'&phone='.$mob.'&message='.$content;#.'&addserial=';

        $d = file_get_contents($sendurl);

        preg_match_all('/<response>(.*)<\/response>/isU',$d,$arr);

        foreach($arr[1] as $k=>$v){
            preg_match_all('#<error>(.*)</error>#isU',$v,$ar[$k]);
            $data[]=$ar[$k][1];
        }

        if($data[0][0]=="0"){
            return true;
        }else{
            return false;
        }
        ////////////////////////////////////////////////////////亿美短信接口 结束/////////////////////////////////////////////
    }elseif($type==4){
        ////////////////////////////////////////////////////////漫道二次短信接口 开始/////////////////////////////////////////////
        $uid4=$msgconfig['sms']['userid4']; //分配给你的账号
        $account4=$msgconfig['sms']['user4']; //分配给你的账号
        $pwd4=$msgconfig['sms']['pass4']; //密码
        $mob=$mob; //发送号码用逗号分隔
        #短信内容
        $content2=$content;
        //$content=urlencode(auto_charset($content,"utf-8",'utf-8'));
        $post_data = array();
        $post_data['userid'] =$uid4; //改为自己的id
        $post_data['account'] = $account4;
        $post_data['password'] = $pwd4;
        $post_data['content'] = $content2;
        $post_data['mobile'] = $mob;
        $post_data['sendtime'] = ''; //不定时发送，值为0，定时发送，输入格式YYYYMMDDHHmmss的日期值
        $url = 'http://115.29.242.32:8888/sms.aspx?action=send&';
        $url.='userid='.$uid4.'&account='.$account4.'&password='.$pwd4.'&content='.$content2.'&mobile='.$mob.'&sendtime=';
        $d = @file_get_contents($url,false);
        preg_match_all('/<successCounts>(.*)<\/successCounts>/isU', $d, $data);
        if($data[1][0] > 0){
            return true;
        }else{
            return false;
        }
        ////////////////////////////////////////////////////////漫道二次短信接口 结束/////////////////////////////////////////////
    }elseif($type==5){
        ////////////////////////////////////////////////////////漫道三次短信接口 开始/////////////////////////////////////////////
        $uid5=$msgconfig['sms']['userid5']; //分配给你的账号
        $account5=$msgconfig['sms']['user5']; //分配给你的账号
        $pwd5=$msgconfig['sms']['pass5'];; //密码
        $mob=$mob; //发送号码用逗号分隔
        #短信内容
        $content2=$content;
        //$content=urlencode(auto_charset($content,"utf-8",'utf-8'));
        $post_data = array();
        $post_data['userid'] =$uid5; //改为自己的id
        $post_data['account'] = $account5;
        $post_data['password'] = $pwd5;
        $post_data['content'] = $content2;
        $post_data['mobile'] = $mob;
        $post_data['json'] = 1;
        $post_data['sendtime'] = ''; //不定时发送，值为0，定时发送，输入格式YYYYMMDDHHmmss的日期值
        $url = 'http://client.movek.net:8888/sms.aspx?action=send';
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_URL,$url);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $post_data);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        $result = curl_exec($ch);
//        echo $result;
        $data = json_decode($result,true);
        if($data['data']['successCounts'] > 0){
            return true;
        }else{
            return false;
        }
        ////////////////////////////////////////////////////////漫道三次短信接口 结束/////////////////////////////////////////////
    }else{
            return true;
    }
}

//提取广告
function get_ad($id){
    $stype = "home_ad".$id;
    if(!S($stype)){
        $list=array();
        /*$condition['start_time']=array("lt",time());
        $condition['end_time']=array("gt",time());*/
        $condition['id']=array('eq',$id);
        $_list = M('ad')->field('ad_type,content')->where($condition)->find();


        if($_list['ad_type']==1) $_list['content']=unserialize($_list['content']);
        $list = $_list;
        S($stype,$list,3600*C('HOME_CACHE_TIME'));
    }else{
        $list = S($stype);
    }

    if($list['ad_type']==0 || !$list['content']){
        if(!$list['content']) $list['content'] = "广告未上传或已过期";
        echo $list['content'];
    }
    else{
        return $list['content'];
    }

}


function getVerify($uid){
    $pre = C('DB_PREFIX');
    $vo = M("members m")->field("m.id,m.user_leve,m.time_limit,m.pin_pass,s.id_status,s.phone_status,s.email_status,s.video_status,s.face_status")->join("{$pre}members_status s ON s.uid=m.id")->where("m.id={$uid}")->find();
    $str = "";
    if($vo['id_status']==1) $str.='&nbsp;<img alt="实名认证通过" src="/Style/H/images/icon/id.gif"/>';
    else  $str.='&nbsp;<img alt="实名认证未通过" src="/Style/H/images/icon/id_0.gif"/>';
    if($vo['phone_status']==1) $str.='&nbsp;<img alt="手机认证通过" src="/Style/H/images/icon/phone.gif"/>';
    else  $str.='&nbsp;<img alt="手机认证未通过" src="/Style/H/images/icon/phone_0.gif"/>';
    if($vo['email_status']==1) $str.='&nbsp;<img alt="邮件认证通过" src="/Style/H/images/icon/email.gif"/></br>
';
    else  $str.='&nbsp;<img alt="邮件认证未通过" src="/Style/H/images/icon/email_0.gif"/></br>
';
    if($vo['user_leve']!=0 && $vo['time_limit']>time()) $str.='&nbsp;<img alt="VIP会员" src="/Style/H/images/icon/vip.gif"/></a>&nbsp;';
    else  $str.='&nbsp;<img alt="不是VIP会员" src="/Style/H/images/icon/vip_0.gif"/>';
    if(!empty($vo['pin_pass'])) {
        $str.='<img alt="支付密码已设置" src="/Style/H/images/icon/mima.gif"/>&nbsp;';
    }else{
        $str.='<img alt="支付密码未设置" src="/Style/H/images/icon/mima_0.gif"/>';
    }
    return $str;
}
function getVerify_ucenter($uid){
    $pre = C('DB_PREFIX');
    $vo = M("members m")->field("m.id,m.user_leve,m.time_limit,m.pin_pass,s.id_status,s.phone_status,s.email_status,s.video_status,s.face_status")->join("{$pre}members_status s ON s.uid=m.id")->where("m.id={$uid}")->find();
    $str = "";
    if ($vo['id_status'] == 1)
        $str.='<a href="/user/verify#fragment-4"><img alt="实名认证通过"   title="实名认证通过" src="/Style/H/images/icon/id.png"/></a>&nbsp;';
    else
        $str.='<a href="/user/verify#fragment-4"><img alt="实名认证未通过"  title="实名认证未通过" src="/Style/H/images/icon/id_0.png"/></a>&nbsp;';
    if ($vo['phone_status'] == 1)
        $str.='<a href="/user/verify#fragment-3"><img alt="手机认证通过"   title="手机认证通过" src="/Style/H/images/icon/phone.png"/>&nbsp;';
    else
        $str.='<a href="/user/verify#fragment-3"><img alt="手机认证未通过"   title="手机认证未通过" src="/Style/H/images/icon/phone_0.png"/></a>&nbsp;';
    if ($vo['email_status'] == 1)
        $str.='<a href="/user/verify?id=1#fragment-2"><img alt="邮件认证通过"   title="邮件认证通过" src="/Style/H/images/icon/email.png"/></a>&nbsp;';
    else
        $str.='<a href="/user/verify?id=1#fragment-2"><img alt="邮件认证未通过"   title="邮件认证未通过" src="/Style/H/images/icon/email_0.png"/></a>&nbsp;';
    if ($vo['user_leve'] != 0 && $vo['time_limit'] > time())
        $str.='<a href="javascript:;" onclick="window.location.href=\'/user/verify#fragment-5\';"><img alt="VIP会员"   title="VIP会员" src="/Style/H/images/icon/vip.png"/></a>&nbsp;';
    else
        $str.='<a href="javascript:;" onclick="window.location.href=\'/user/verify#fragment-5\';"><img alt="不是VIP会员"   title="不是VIP会员" src="/Style/H/images/icon/vip_0.png"/></a>&nbsp;';

    if (!empty($vo['pin_pass'])) {
        $str.='<a  href="/user/user#fragment-3"><img alt="支付密码已设置"   title="支付密码已设置" src="/Style/H/images/icon/mima.png"/></a>&nbsp;';
    } else {
        $str.='<a  href="/user/user#fragment-3"><img alt="支付密码未设置"   title="支付密码未设置" src="/Style/H/images/icon/mima_0.png"/></a>&nbsp;';
    }

    return $str;
}


//获得时间天数
function get_times($data=array()){
    if (isset($data['time']) && $data['time']!=""){
        $time = $data['time'];//时间
    }elseif (isset($data['date']) && $data['date']!=""){
        $time = strtotime($data['date']);//日期
    }else{
        $time = time();//现在时间
    }
    if (isset($data['type']) && $data['type']!=""){
        $type = $data['type'];//时间转换类型，有day week month year
    }else{
        $type = "month";
    }
    if (isset($data['num']) && $data['num']!=""){
        $num = $data['num'];
    }else{
        $num = 1;
    }

    if ($type=="month"){
        $month = date("m",$time);
        $year = date("Y",$time);
        $_result = strtotime("$num month",$time);
        $_month = (int)date("m",$_result);
        if ($month+$num>12){
            $_num = $month+$num-12;
            $year = $year+1;
        }else{
            $_num = $month+$num;
        }

        if ($_num!=$_month){

            $_result = strtotime("-1 day",strtotime("{$year}-{$_month}-01"));
        }
    }else{
        $_result = strtotime("$num $type",$time);
    }
    if (isset($data['format']) && $data['format']!=""){
        return date($data['format'],$_result);
    }else{
        return $_result;
    }

}

//获取当前星期的日期范围，也就是从星期一到星期日的日期范围
function getWeekRange($date){
    $ret=array();
    $timestamp=strtotime($date);
    $w=strftime('%u',$timestamp);
    $ret['sdate']=date('Y-m-d 00:00:00',$timestamp-($w-1)*86400);
    $ret['edate']=date('Y-m-d 23:59:59',$timestamp+(7-$w)*86400);
    return $ret;
}


