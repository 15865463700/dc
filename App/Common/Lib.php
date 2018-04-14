<?php
//对提交的参数进行过滤
function EnHtml($v){
	return $v;
}
function mydate($format,$time,$default=''){
	if(intval($time)>10000) return date($format,$time);
	else return $default;
}


/*$url：要生成的地址,$vars:参数数组,$domain：是否带域名*/
function MU($url,$type,$vars=array(),$domain=false){
	//获得基础地址START
	$path = explode("/",trim($url,"/"));
	$model = strtolower($path[1]);
	$action = isset($path[2])?strtolower($path[2]):"";
	//获得基础地址START
	//获取前缀根目录及分组
	$http = UD($path,$domain);
	//获取前缀根目录及分组
	switch($type){
		case "article":
		default:
			if(!isset($vars['id'])){//特殊栏目,用nid来区分,不用ID
				unset($path[0]);//去掉分组名
				$url = implode("/",$path)."/";
				$newurl=$url;
			}else{//普通栏目,带ID
				if(1==1||strtolower(GROUP_NAME) == strtolower(C('DEFAULT_GROUP'))) {//如果是默认分组则去掉分组名
					unset($path[0]);//去掉分组名
					$url = implode("/",$path)."/";
				}
				$newurl=$url.$vars['id'].$vars['suffix'];
			}
		break;
		case "typelist":
				if(1==1||strtolower(GROUP_NAME) == strtolower(C('DEFAULT_GROUP'))) {//如果是默认分组则去掉分组名
					unset($path[0]);//去掉分组名
					$url = implode("/",$path);
				}
				$newurl=$url.$vars['suffix'];
		break;
	}

	return $http.$newurl;

}
// URL组装 支持不同模式
// 格式：UD('url参数array('分组','model','action')','显示域名')在传入的url数组中，只用到分组
function UD($url=array(),$domain = false) {
    // 解析URL
	$isDomainGroup = true;//当值为true时,不对任何链接加分组前缀,当为false时,自动判断分组及域名等,加前缀
	$isDomainD = false;
	$asdd = C('APP_SUB_DOMAIN_DEPLOY');
	//###########修复START#############，增加对当前分组分配了二级域名的判断,变量给下面用
	if($asdd){
		foreach (C('APP_SUB_DOMAIN_RULES') as $keyr => $ruler) {
			if(strtolower($url[0]."/") == strtolower($ruler[0])){
				$isDomainGroup = true;//分组分配了二级域名
				$isDomainD = true;
				break;
			}
		}
	}

	//#########及默认分组不需要加分组名 都转换成小写来比较，避免在linux上出问题
	if(strtolower(GROUP_NAME) == strtolower(C('DEFAULT_GROUP'))) $isDomainGroup = true;
	//###########修复END#############，增加对当前分组分配了二级域名的判断
    // 解析子域名
    if($domain===true){
        $domain = $_SERVER['HTTP_HOST'];
        if($asdd) { // 开启子域名部署
			//###########修复START#############，增加对没带前缀域名的判断
			$xdomain = explode(".",$_SERVER['HTTP_HOST']);
			if(!isset($xdomain[2])) $ydomain="www.".$_SERVER['HTTP_HOST'];
			else  $ydomain=$_SERVER['HTTP_HOST'];
			//###########修复END#############，增加对没带前缀域名的判断
            $domain = $domain=='localhost'?'localhost':'www'.strstr($ydomain,'.');
            // '子域名'=>array('项目[/分组]');
            foreach (C('APP_SUB_DOMAIN_RULES') as $key => $rule) {
                if(false === strpos($key,'*') && $isDomainD) {
                    $domain = $key.strstr($domain,'.'); // 生成对应子域名
                    $url   =  substr_replace($url,'',0,strlen($rule[0]));
                    break;
                }
            }
        }
    }

	if(!$isDomainGroup) $gpurl = "/".$url[0]."/";
	else $gpurl = "/";

    if($domain) {
        $url   =  'http://'.$domain.$gpurl;
    }else{
        $url   =  $gpurl;
	}

	return $url;
}

function Mheader($type){
	header("Content-Type:text/html;charset={$type}");
}

// 自动转换字符集 支持数组转换
function auto_charset($fContents, $from='gbk', $to='utf-8') {
    $from = strtoupper($from) == 'UTF8' ? 'utf-8' : $from;
    $to = strtoupper($to) == 'UTF8' ? 'utf-8' : $to;
    if ( ($to=='utf-8'&&is_utf8($fContents)) || strtoupper($from) === strtoupper($to) || empty($fContents) || (is_scalar($fContents) && !is_string($fContents))) {
        //如果编码相同或者非字符串标量则不转换
        return $fContents;
    }
    if (is_string($fContents)) {
        if (function_exists('mb_convert_encoding')) {
            return mb_convert_encoding($fContents, $to, $from);
        } elseif (function_exists('iconv')) {
            return iconv($from, $to, $fContents);
        } else {
            return $fContents;
        }
    } elseif (is_array($fContents)) {
        foreach ($fContents as $key => $val) {
            $_key = auto_charset($key, $from, $to);
            $fContents[$_key] = auto_charset($val, $from, $to);
            if ($key != $_key)
                unset($fContents[$key]);
        }
        return $fContents;
    }
    else {
        return $fContents;
    }
}
//判断是否utf8
function is_utf8($string) {
	return preg_match('%^(?:
		 [\x09\x0A\x0D\x20-\x7E]            # ASCII
	   | [\xC2-\xDF][\x80-\xBF]             # non-overlong 2-byte
	   |  \xE0[\xA0-\xBF][\x80-\xBF]        # excluding overlongs
	   | [\xE1-\xEC\xEE\xEF][\x80-\xBF]{2}  # straight 3-byte
	   |  \xED[\x80-\x9F][\x80-\xBF]        # excluding surrogates
	   |  \xF0[\x90-\xBF][\x80-\xBF]{2}     # planes 1-3
	   | [\xF1-\xF3][\x80-\xBF]{3}          # planes 4-15
	   |  \xF4[\x80-\x8F][\x80-\xBF]{2}     # plane 16
   )*$%xs', $string);
}


//验证是否通过
function is_verify($uid,$code,$utype,$timespan){
	if(!empty($uid)) $vd['ukey'] = $uid;
	$vd['type'] = $utype;
	$vd['send_time'] = array("lt",time()+$timespan);
	$vd['code'] = $code;
	$vo = M("verify")->field('ukey')->where($vd)->find();
	if(is_array($vo)) return $vo['ukey'];
	else return false;
}
//网站基本设置
function get_global_setting(){
	$list=array();
	if(!S('global_setting')){
		$list_t = M('global')->field('code,text')->select();
		foreach($list_t as $key => $v){
			$list[$v['code']] = de_xie($v['text']);
		}

        $friendList = get_home_friend(1);
        $list['friendList'] = $friendList;
		S('global_setting',$list);
		S('global_setting',$list,3600*C('TTXF_TMP_HOUR'));
	}else{
		$list = S('global_setting');
	}

	return $list;
}

//获取用户权限数组
function get_user_acl($uid=""){
	$model=strtolower(MODULE_NAME);

	if(empty($uid)) return false;
	$gid = M('ausers')->field('u_group_id')->find($uid);

	$al = get_group_data($gid['u_group_id']);

	$acl = $al['controller'];
	$acl_key = acl_get_key();

	if( array_keys($acl[$model],$acl_key) ) return true;
	else return false;
}
//判断加息券到期时间是否小于一天  2017-4-17  赵银剑
function is_day($time_deadline){
    $time_end=$time_deadline;
    $time_now=time();
    if(($time_end-$time_now)>86400){
        echo "未使用";
    }else{
        echo "还有一天过期";
    }
}

//获取权限列表
function get_group_data($gid=0){
	$gid=intval($gid);
	$list=array();

	if($gid==0){
		if( !S("ACL_all") ){
			$_acl_data = M('acl')->select();
			$acl_data=array();

			foreach($_acl_data as $key => $v){
				$acl_data[$v['group_id']] = $v;
				$acl_data[$v['group_id']]['controller'] = unserialize($v['controller']);
			}

			S("ACL_all",$acl_data,C('ADMIN_CACHE_TIME'));
			$list = $acl_data;
		}else{
			$list = S("ACL_all");
		}
	}else{
		if( !S("ACL_".$gid) ){
			$_acl_data = M('acl')->find($gid);
			$_acl_data['controller'] = unserialize($_acl_data['controller']);
			$acl_data = $_acl_data;
			S("ACL_".$gid,$acl_data,C('ADMIN_CACHE_TIME'));
			$list = $acl_data;
		}else{
			$list = S("ACL_".$gid);
		}
	}
	return $list;
}
//删除文件夹并重建文件夹
function rmdirr($dirname) {

	if (!file_exists($dirname)) {
		return false;
	}

	if (is_file($dirname) || is_link($dirname)) {
		return unlink($dirname);
	}

	$dir = dir($dirname);

	while (false !== $entry = $dir->read()) {

		if ($entry == '.' || $entry == '..') {
			continue;
		}

		rmdirr($dirname . DIRECTORY_SEPARATOR . $entry);
	}

	$dir->close();

	return rmdir($dirname);
}
//删除文件夹及文件夹下所有内容
function Rmall($dirname) {
	if (!file_exists($dirname)) {
		return false;
	}
	if (is_file($dirname) || is_link($dirname)) {
		return unlink($dirname);
	}

	$dir = dir($dirname);//如果对像是目录

	while (false !== $file = $dir->read()) {

		if ($file == '.' || $file == '..') {
			continue;
		}
		if(!is_dir($dirname."/".$file)){
			unlink($dirname."/".$file);
		}else{
			Rmall($dirname."/".$file);
		}

		rmdir($dirname."/".$file);
	}

	$dir->close();

	rmdir($dirname);

	return true;
}

//取得文件内容
function ReadFiletext($filepath){
	$htmlfp=@fopen($filepath,"r");
	while($data=@fread($htmlfp,1000))
	{
		$string.=$data;
	}
	@fclose($htmlfp);
	return $string;
}

//生成文件
function MakeFile($con,$filename){//$filename是全物理路径加文件名
	MakeDir(dirname($filename));
	$fp=fopen($filename,"w");
	fwrite($fp,$con);
	fclose($fp);
}

//生成全路径文件夹
function MakeDir($dir){
	return is_dir($dir) or (MakeDir(dirname($dir)) and mkdir($dir,0777));
}

//友情链接
function get_home_friend($type,$datas = array()){
	$condition['is_show']=array('eq',1);
    $condition['link_img']='';
	$condition['link_type']=array('eq',$type);
	$type = "friend_home".$type;


	if(!S($type)){
		$_list = M('friend')->field('link_txt,link_href,link_img,link_type')->where($condition)->order("link_order DESC")->select();
		$list=array();
		foreach($_list as $key => $v){
			$list[$key] = $v;
		}
		S($type,$list,3600*C('HOME_CACHE_TIME'));
	}else{
		$list = S($type);
	}

	return $list;
}

/*
栏目相关函数
Start
*/

//获取某栏目下的所有子栏目以nid-nid顺次链接
function get_type_leve($id="0"){
	$model = D('Acategory');
	if(!S("type_son_type")){
		$allid=array();
		$data = $model->field('id,type_nid')->where("parent_id = {$id}")->select();
		if(count($data)>0){
			foreach($data as $v){
				//二级
				$allid[$v['type_nid']]=$v['id'];
				$data_1=array();//清空,避免下面判断错误
				$data_1 = $model->field('id,type_nid')->where("parent_id = {$v['id']}")->select();
				if(count($data_1)>0){
					foreach($data_1 as $v1){
						//三级
						$allid[$v['type_nid']."-".$v1['type_nid']]=$v1['id'];
						$data_2=array();//清空,避免下面判断错误
						$data_2 = $model->field('id,type_nid')->where("parent_id = {$v1['id']}")->select();
						if(count($data_2)>0){
							foreach($data_2 as $v2){
								//四级
								$allid[$v['type_nid']."-".$v1['type_nid']."-".$v2['type_nid']]=$v2['id'];
								$data_3=array();//清空,避免下面判断错误
								$data_3 = $model->field('id,type_nid')->where("parent_id = {$v2['id']}")->select();

								if(count($data_3)>0){
									foreach($data_3 as $v3){
										$allid[$v['type_nid']."-".$v1['type_nid']."-".$v2['type_nid']."-".$v3['type_nid']]=$v3['id'];
									}
								}
								//四级
							}
						}
						//三级
					}
				}
				//二级
			}

		}
		S("type_son_type",$allid,3600*C('HOME_CACHE_TIME'));
	}else{
		$allid = S("type_son_type");
	}

	return $allid;
}


//获取某栏目下的所有子栏目以nid-nid顺次链接
function get_area_type_leve($id="0",$area_id=0){

	$model = D('Aacategory');
	if(!S("type_son_type_area".$area_id)){
		$allid=array();
		$data = $model->field('id,type_nid')->where("parent_id = {$id} AND area_id={$area_id}")->select();
		if(count($data)>0){
			foreach($data as $v){
				//二级
				$allid[$area_id.$v['type_nid']]=$v['id'];
				$data_1=array();//清空,避免下面判断错误
				$data_1 = $model->field('id,type_nid')->where("parent_id = {$v['id']}")->select();
				if(count($data_1)>0){
					foreach($data_1 as $v1){
						//三级
						$allid[$area_id.$v['type_nid']."-".$v1['type_nid']]=$v1['id'];
						$data_2=array();//清空,避免下面判断错误
						$data_2 = $model->field('id,type_nid')->where("parent_id = {$v1['id']}")->select();
						if(count($data_2)>0){
							foreach($data_2 as $v2){
								//四级
								$allid[$area_id.$v['type_nid']."-".$v1['type_nid']."-".$v2['type_nid']]=$v2['id'];
								$data_3=array();//清空,避免下面判断错误
								$data_3 = $model->field('id,type_nid')->where("parent_id = {$v2['id']}")->select();

								if(count($data_3)>0){
									foreach($data_3 as $v3){
										$allid[$area_id.$v['type_nid']."-".$v1['type_nid']."-".$v2['type_nid']."-".$v3['type_nid']]=$v3['id'];
									}
								}
								//四级
							}
						}
						//三级
					}
				}
				//二级
			}

		}
		S("type_son_type_area".$area_id,$allid,3600*C('HOME_CACHE_TIME'));
	}else{
		$allid = S("type_son_type_area".$area_id);
	}
	return $allid;
}

//获取某栏目的所有父栏目的type_nid,按由远到近的顺序出现在数组中1/2
function get_type_leve_nid($id="0"){
	if(empty($id)) return;
	global $allid;
	static $r=array();//先声明要返回静态变量,不然在下面被赋值时是引用赋值
	get_type_leve_nid_run($id);

	$r = $allid;
	$GLOBALS['allid'] = NULL;

	return array_reverse($r);
}
//获取某栏目的所有父栏目的type_nid,按由远到近的顺序出现在数组中2/2
function get_type_leve_nid_run($id="0"){
	global $allid;
	$data_parent = $data = "";
	$data = D('Acategory')->field('parent_id,type_nid')->find($id);
	$data_parent = D('Acategory')->field('id,type_nid')->where("id = {$data['parent_id']}")->find();
	if(isset($data_parent['type_nid'])>0){
		if(!isset($allid[0])) $allid[]=$data['type_nid'];
		$allid[]=$data_parent['type_nid'];
		get_type_leve_nid_run($data_parent['id']);
	}else{
		if(!isset($allid[0])) $allid[]=$data['type_nid'];
	}
}


//获取某栏目的所有父栏目的type_nid,按由远到近的顺序出现在数组中1/2
function get_type_leve_area_nid($id="0",$area_id=0){
	if(empty($id)||empty($area_id)) return;
	global $allid_area;
	static $r=array();//先声明要返回静态变量,不然在下面被赋值时是引用赋值

	get_type_leve_area_nid_run($id);

	$r = $allid_area;
	$GLOBALS['allid_area'] = NULL;

	return array_reverse($r);
}
//获取某栏目的所有父栏目的type_nid,按由远到近的顺序出现在数组中2/2
function get_type_leve_area_nid_run($id="0"){
	global $allid_area;
	$data_parent = $data = "";
	$data = D('Aacategory')->field('parent_id,type_nid,area_id')->find($id);
	$data_parent = D('Aacategory')->field('id,type_nid,area_id')->where("id = {$data['parent_id']}")->find();
	if(isset($data_parent['type_nid'])>0){
		if(!isset($allid_area[0])) $allid_area[]=$data['type_nid'];
		$allid_area[]=$data_parent['type_nid'];
		get_type_leve_area_nid_run($data_parent['id']);
	}else{
		if(!isset($allid_area[0])) $allid_area[]=$data['type_nid'];
	}
}

//获取某栏目下的所有子栏目,查询次数较少，查询效率更高,入口函数1/2
function get_son_type($id){
	$tempname = "type_sfs_son_all".$id;
	if(!S($tempname)){
		$row = get_son_type_run($id);
		S($tempname,$row,3600*C('HOME_CACHE_TIME'));
	}else{
		$row = S($tempname);
	}
	return $row;
}

//获取某栏目下的所有子栏目,查询次数较少，查询效率更高2/2
function get_son_type_run($id){
	static $rerow;
	global $allid;
	$data = M('type')->field('id')->where("parent_id in ({$id})")->select();
	if(count($data)>0){
		foreach($data as $key=>$v){
			$allid[]=$v['id'];
			$nowid[]=$v['id'];
		}
		$id = implode(",",$nowid);
		get_son_type_run($id);
	}
//递归函数不要加else来返回内容，不然得不到返回值
//	else{
//		return $allid;
//	}
	$rerow = $allid;
	$allid=array();
	return $rerow;
}

//获取某栏目下所有的子栏目,以数组的形式返回,入口函数1/2
function get_type_son($id=0){
	$tempname = "type_son_all".$id;
	if(!S($tempname)){
		$row = get_type_son_all($id);
		S($tempname,$row,3600*C('HOME_CACHE_TIME'));
	}else{
		$row = S($tempname);
	}
	return $row;
}
//获取某栏目下所有的子栏目2/2
function get_type_son_all($id="0"){
	static $rerow;
	global $get_type_son_all_row;

	if(empty($id)) exit;

	$data = M('type')->where("parent_id = {$id}")->field('id')->select();
	foreach($data as $key=>$v){
		$get_type_son_all_row[]=$v['id'];
		$data_son = M('type')->where("parent_id = {$v['id']}")->field('id')->select();
		if(count($data_son)>0){
			get_type_son_all($v['id']);
		}
	}

	$rerow = $get_type_son_all_row;
	$get_type_son_all_row = array();
	return $rerow;
}
//获取所有栏目每个栏目的父栏目的nid,以栏目ID为键名
function get_type_parent_nid(){
	$row=array();
	$p_nid_new=array();
	if(!S("type_parent_nid_temp")){
		$data = M('type')->field('id')->select();
		if(count($data)>0){
			foreach($data as $key => $v){
				$p_nid = get_type_leve_nid($v['id']);
				$i=$n=count($p_nid);
				//倒序处理
				if($i>1){
					for($j=0;$j<$n;$j++,$i--){
						$p_nid_new[($i-1)]=$p_nid[$j];
					}
				}else{
					$p_nid_new = $p_nid;
				}
				//倒序处理
				$row[$v['id']] = $p_nid_new;
			}
		}
		S("type_parent_nid_temp",$row,3600*C('HOME_CACHE_TIME'));
	}else{
		$row = S("type_parent_nid_temp");
	}

	return $row;
}

//获取以栏目ID为键的所有栏目数组,二维,如果field只有两个，并且其中一个是id，那么就会自动成为一维数组
function get_type_list($model,$field=true){
	$acaheName=md5("type_list_temp".$model.$field);
	if(!S($acaheName)){
		$list = D(ucfirst($model))->getField($field);
		S($acaheName,$list,3600*C('HOME_CACHE_TIME'));
	}else{
		$list = S($acaheName);
	}
	return $list;
}

//通过网址获取栏目相关信息
function get_type_infos(){
	$row=array();
	$type_list = get_type_list('acategory','id,type_nid,type_set');
	if(!isset($_GET['typeid'])){
		$type_nid = get_type_leve();//获得所有栏目自己的nid的组合
		$rurl = explode("?",$_SERVER['REQUEST_URI']);
		$xurl_tmp = explode("/",str_replace(array("index.html",".html"),array('',''),$rurl[0]));//获得组合的type_nid
		$zu = implode("-",array_filter($xurl_tmp));//组合
		//print_r($type_nid);
		$typeid = $type_nid[$zu];
		$typeset = $type_list[$typeid]['type_set'];
	}else{
		$typeid = intval($_GET['typeid']);
		$typeset = $type_list[$typeid]['type_set'];
	}

	if($typeset==1){//列表
		$templet = "list_index";
	}else{//单页
		$templet = "index_index";
	}

	$row['typeset'] = $typeset;
	$row['templet'] = $templet;
	$row['typeid'] = $typeid;

	return $row;
}

//通过网址获取栏目相关信息
function get_area_type_infos($area_id=0){
	$row=array();
	$type_list = get_type_list('aacategory','id,type_nid,type_set,area_id');
	if(!isset($_GET['typeid'])){

		$type_nid = get_area_type_leve(0,$area_id);//获得所有栏目自己的nid的组合
		$rurl = explode("?",$_SERVER['REQUEST_URI']);
		$xurl_tmp = explode("/",str_replace(array("index.html",".html"),array('',''),$rurl[0]));//获得组合的type_nid
		$zu = implode("-",array_filter($xurl_tmp));//组合
		//print_r($type_nid);
		$typeid = $type_nid[$area_id.$zu];
		$typeset = $type_list[$typeid]['type_set'];
	}else{
		$typeid = intval($_GET['typeid']);
		$typeset = $type_list[$typeid]['type_set'];
	}

	if($typeset==1){//列表
		$templet = "list_index";
	}else{//单页
		$templet = "index_index";
	}

	$row['typeset'] = $typeset;
	$row['templet'] = $templet;
	$row['typeid'] = $typeid;

	return $row;
}

//获取栏目列表,按栏目分级,有缩进,入口函数1/2
function get_type_leve_list($id=0,$modelname=false, $type){
	static $rerow;
	global $get_type_leve_list_run_row;


	if(!$modelname) $model = D("type");
	else $model=D(ucfirst($modelname));
	$stype = $modelname."home_type_leve_list".$id;
	if(!S($stype)){
		get_type_leve_list_run($id,$model, $type);
		$rerow = $get_type_leve_list_run_row;//把全局变量赋值给静态变量，避免引用清空
		$GLOBALS['get_type_leve_list_run_row']=NULL;//清空全局变量避免影响其他数据,不能用unset,unset只能清空单个变量或者数组中的某一元素,并且unset只能清空局部变量，清空全局变量要用unset($GLOBALS
		$data = $rerow;
		//S($stype,$data,3600*C('HOME_CACHE_TIME'));
	}else{
		$data = S($stype);
	}
	return $data;
}

//获取栏目列表,按栏目分级,有缩进2/2
function get_type_leve_list_run($id=0,$model, $type){
	global $get_type_leve_list_run_row;
	//全局变量的定义都要放在最前面
	$spa = "----";
	if(count($get_type_leve_list_run_row)<1) $get_type_leve_list_run_row=array();

	$typelist = $model->where("parent_id={$id} and model='{$type}'")->field('type_name,id,parent_id')->order('sort_order DESC')->select();//上级栏目

	foreach($typelist as $k=>$v){
		$leve = intval(get_typeLeve($v['id'],$model));
		$v['type_name'] = str_repeat($spa,$leve).$v['type_name'];
		$get_type_leve_list_run_row[]=$v;

		$typelist_s1 = $model->where("parent_id={$v['id']} and model='{$type}'")->field('type_name,id')->select();//上级栏目
		if(count($typelist_s1)>0){
			get_type_leve_list_run($v['id'],$model, $type);
		}
	}
}//id


//获取栏目列表地区性的,按栏目分级,有缩进,入口函数1/2
function get_type_leve_list_area($id=0,$modelname=false,$area_id=0){
	static $rerow;
	global $get_type_leve_list_area_run_row;


	if(!$modelname) $model = D("type");
	else $model=D(ucfirst($modelname));
	$stype = $modelname."home_type_leve_list_area".$id.$area_id;
	if(!S($stype)){
		get_type_leve_list_area_run($id,$model,$area_id);
		$rerow = $get_type_leve_list_area_run_row;//把全局变量赋值给静态变量，避免引用清空
		$GLOBALS['get_type_leve_list_area_run_row']=NULL;//清空全局变量避免影响其他数据,不能用unset,unset只能清空单个变量或者数组中的某一元素,并且unset只能清空局部变量，清空全局变量要用unset($GLOBALS
		$data = $rerow;
		S($stype,$data,3600*C('HOME_CACHE_TIME'));
	}else{
		$data = S($stype);
	}
	return $data;
}

//获取栏目列表,按栏目分级,有缩进2/2
function get_type_leve_list_area_run($id=0,$model,$area_id){
	global $get_type_leve_list_area_run_row;
	//全局变量的定义都要放在最前面
	$spa = "----";
	if(count($get_type_leve_list_area_run_row)<1) $get_type_leve_list_area_run_row=array();

	$typelist = $model->where("parent_id={$id} AND area_id={$area_id}")->field('type_name,id,parent_id')->order('sort_order DESC')->select();//上级栏目

	foreach($typelist as $k=>$v){
		$leve = intval(get_typeLeve($v['id'],$model));
		$v['type_name'] = str_repeat($spa,$leve).$v['type_name'];
		$get_type_leve_list_area_run_row[]=$v;

		$typelist_s1 = $model->where("parent_id={$v['id']}")->field('type_name,id')->select();//上级栏目
		if(count($typelist_s1)>0){
			get_type_leve_list_area_run($v['id'],$model,$area_id);
		}
	}
}//id


//获取栏目的级别1/2
function get_typeLeve($typeid,$model){
	$typeleve = 0;
	global $typeleve;
	static $rt=0;//先声明要返回静态变量,不然在下面被赋值时是引用赋值
	get_typeLeve_run($typeid,$model);
	$rt = $typeleve;
	unset($GLOBALS['typeleve']);
	return $rt;
}
//获取栏目的级别2/2
function get_typeLeve_run($typeid,$model){
	global $typeleve;
	$condition['id'] = $typeid;
	$v = $model->field('parent_id')->where($condition)->find();
	if($v['parent_id']>0){
		$typeleve++;
		get_typeLeve_run($v['parent_id'],$model);
	}
}

/*
栏目相关函数
End
*/
//在前台显示时去掉反斜线,传入数组，最多二维
function de_xie($arr){
	$data=array();
	if(is_array($arr)){
		foreach($arr as $key=>$v){
			if(is_array($v)){
				foreach($v as $skey=>$sv){
					if(is_array($sv)){

					}else{
						$v[$skey] = stripslashes($sv);
					}
				}
				$data[$key] = $v;
			}else{
				$data[$key] = stripslashes($v);
			}
		}
	}else{
		$data = stripslashes($arr);
	}
	return $data;
}


//输出纯文本
function text($text,$parseBr=false,$nr=false){
    $text = htmlspecialchars_decode($text);
    $text	=	safe($text,'text');
    if(!$parseBr&&$nr){
        $text	=	str_ireplace(array("\r","\n","\t","&nbsp;"),'',$text);
        $text	=	htmlspecialchars($text,ENT_QUOTES);
    }elseif(!$nr){
        $text	=	htmlspecialchars($text,ENT_QUOTES);
	}else{
        $text	=	htmlspecialchars($text,ENT_QUOTES);
        $text	=	nl2br($text);
    }
    $text	=	trim($text);
    return $text;
}
function safe($text,$type='html',$tagsMethod=true,$attrMethod=true,$xssAuto = 1,$tags=array(),$attr=array(),$tagsBlack=array(),$attrBlack=array()){

    //无标签格式
    $text_tags	=	'';

    //只存在字体样式
    $font_tags	=	'<i><b><u><s><em><strong><font><big><small><sup><sub><bdo><h1><h2><h3><h4><h5><h6>';

    //标题摘要基本格式
    $base_tags	=	$font_tags.'<p><br><hr><a><img><map><area><pre><code><q><blockquote><acronym><cite><ins><del><center><strike>';

    //兼容Form格式
    $form_tags	=	$base_tags.'<form><input><textarea><button><select><optgroup><option><label><fieldset><legend>';

    //内容等允许HTML的格式
    $html_tags	=	$base_tags.'<ul><ol><li><dl><dd><dt><table><caption><td><th><tr><thead><tbody><tfoot><col><colgroup><div><span><object><embed>';

    //专题等全HTML格式
    $all_tags	=	$form_tags.$html_tags.'<!DOCTYPE><html><head><title><body><base><basefont><script><noscript><applet><object><param><style><frame><frameset><noframes><iframe>';

    //过滤标签
    $text	=	strip_tags($text, ${$type.'_tags'} );

        //过滤攻击代码
        if($type!='all'){
            //过滤危险的属性，如：过滤on事件lang js
            while(preg_match('/(<[^><]+) (onclick|onload|unload|onmouseover|onmouseup|onmouseout|onmousedown|onkeydown|onkeypress|onkeyup|onblur|onchange|onfocus|action|background|codebase|dynsrc|lowsrc)([^><]*)/i',$text,$mat)){
                $text	=	str_ireplace($mat[0],$mat[1].$mat[3],$text);
            }
            while(preg_match('/(<[^><]+)(window\.|javascript:|js:|about:|file:|document\.|vbs:|cookie)([^><]*)/i',$text,$mat)){
                $text	=	str_ireplace($mat[0],$mat[1].$mat[3],$text);
            }
        }
        return $text;
}


//输出安全的html
function h($text, $tags = null){
	$text	=	trim($text);
	$text	=	preg_replace('/<!--?.*-->/','',$text);
	//完全过滤注释
	$text	=	preg_replace('/<!--?.*-->/','',$text);
	//完全过滤动态代码
	$text	=	preg_replace('/<\?|\?'.'>/','',$text);
	//完全过滤js
	$text	=	preg_replace('/<script?.*\/script>/','',$text);

	$text	=	str_replace('[','&#091;',$text);
	$text	=	str_replace(']','&#093;',$text);
	$text	=	str_replace('|','&#124;',$text);
	//过滤换行符
	$text	=	preg_replace('/\r?\n/','',$text);
	//br
	$text	=	preg_replace('/<br(\s\/)?'.'>/i','[br]',$text);
	$text	=	preg_replace('/(\[br\]\s*){10,}/i','[br]',$text);
	//过滤危险的属性，如：过滤on事件lang js
	while(preg_match('/(<[^><]+) (lang|on|action|background|codebase|dynsrc|lowsrc)[^><]+/i',$text,$mat)){
		$text=str_replace($mat[0],$mat[1],$text);
	}
	while(preg_match('/(<[^><]+)(window\.|javascript:|js:|about:|file:|document\.|vbs:|cookie)([^><]*)/i',$text,$mat)){
		$text=str_replace($mat[0],$mat[1].$mat[3],$text);
	}
	if(empty($tags)) {
		$tags = 'table|tbody|td|th|tr|i|b|u|strong|img|p|br|div|span|em|ul|ol|li|dl|dd|dt|a|alt|h[1-9]?';
		$tags.= '|object|param|embed';	// 音乐和视频
	}
	//允许的HTML标签
	$text	=	preg_replace('/<(\/?(?:'.$tags.'))( [^><\[\]]*)?>/i','[\1\2]',$text);
	//过滤多余html
	$text	=	preg_replace('/<\/?(html|head|meta|link|base|basefont|body|bgsound|title|style|script|form|iframe|frame|frameset|applet|id|ilayer|layer|name|style|xml)[^><]*>/i','',$text);
	//过滤合法的html标签
	while(preg_match('/<([a-z]+)[^><\[\]]*>[^><]*<\/\1>/i',$text,$mat)){
		$text=str_replace($mat[0],str_replace('>',']',str_replace('<','[',$mat[0])),$text);
	}
	//转换引号
	while(preg_match('/(\[[^\[\]]*=\s*)(\"|\')([^\2\[\]]+)\2([^\[\]]*\])/i',$text,$mat)){
		$text = str_replace($mat[0], $mat[1] . '|' . $mat[3] . '|' . $mat[4],$text);
	}
	//过滤错误的单个引号
	// 修改:2011.05.26 kissy编辑器中表情等会包含空引号, 简单的过滤会导致错误
//	while(preg_match('/\[[^\[\]]*(\"|\')[^\[\]]*\]/i',$text,$mat)){
//		$text=str_replace($mat[0],str_replace($mat[1],'',$mat[0]),$text);
//	}
	//转换其它所有不合法的 < >
	$text	=	str_replace('<','&lt;',$text);
	$text	=	str_replace('>','&gt;',$text);
    $text   =   str_replace('"','&quot;',$text);
    //$text   =   str_replace('\'','&#039;',$text);
	 //反转换
	$text	=	str_replace('[','<',$text);
	$text	=	str_replace(']','>',$text);
	$text	=	str_replace('|','"',$text);
	//过滤多余空格
	$text	=	str_replace('  ',' ',$text);
	return $text;
}
//根据原图片地址得到缩略图地址
function get_thumb_pic($str){
	$path = explode("/",$str);
	$sc = count($path);
	$path[($sc-1)] = "thumb_".$path[($sc-1)];
	return implode("/",$path);
}
/*
* 中文截取，支持gb2312,gbk,utf-8,big5
*
* @param string $str 要截取的字串
* @param int $start 截取起始位置
* @param int $length 截取长度
* @param string $charset utf-8|gb2312|gbk|big5 编码
* @param $suffix 是否加尾缀
*/
function cnsubstr($str, $length, $start=0, $charset="utf-8", $suffix=true)
{
	   $str = strip_tags($str);
	   if(function_exists("mb_substr"))
	   {
			   if(mb_strlen($str, $charset) <= $length) return $str;
			   $slice = mb_substr($str, $start, $length, $charset);
	   }
	   else
	   {
			   $re['utf-8']   = "/[\x01-\x7f]|[\xc2-\xdf][\x80-\xbf]|[\xe0-\xef][\x80-\xbf]{2}|[\xf0-\xff][\x80-\xbf]{3}/";
			   $re['gb2312'] = "/[\x01-\x7f]|[\xb0-\xf7][\xa0-\xfe]/";
			   $re['gbk']          = "/[\x01-\x7f]|[\x81-\xfe][\x40-\xfe]/";
			   $re['big5']          = "/[\x01-\x7f]|[\x81-\xfe]([\x40-\x7e]|\xa1-\xfe])/";
			   preg_match_all($re[$charset], $str, $match);
			   if(count($match[0]) <= $length) return $str;
			   $slice = join("",array_slice($match[0], $start, $length));
	   }
	   if($suffix) return $slice."…";
	   return $slice;
}

/**
 * 获取指定uid的头像文件规范路径
 * 来源：Ucenter base类的get_avatar方法
 *
 * @param int $uid
 * @param string $size 头像尺寸，可选为'big', 'middle', 'small'
 * @param string $type 类型，可选为real或者virtual
 * @return unknown
 */
function get_avatar($uid, $size = 'middle', $type = '') {
	$size = in_array($size, array('big', 'middle', 'small')) ? $size : 'big';
	$uid = abs(intval($uid));
	$uid = sprintf("%09d", $uid);
	$dir1 = substr($uid, 0, 3);
	$dir2 = substr($uid, 3, 2);
	$dir3 = substr($uid, 5, 2);
	$typeadd = $type == 'real' ? '_real' : '';
	$path = '/Style/header/customavatars/'.$dir1.'/'.$dir2.'/'.$dir3.'/'.substr($uid, -2).$typeadd."_avatar_$size.jpg";
	if(!file_exists(C("WEB_ROOT").$path)) $path = '/Style/header/images/'."noavatar_$size.gif";
	return  $path;
}
/**
 * 获取地区列表，id为键，地区名为值的二维数组
 */
function get_Area_list($id="") {
	$cacheName = "temp_area_list_s";
	if(!S($cacheName)){
		$list = M('area')->getField('id,name');
		S($cacheName,$list);
	}else{
		$list = S($cacheName);
	}
	if(!empty($id)) return $list[$id];
	else return $list;
}
/**
 * 省市区列表
 *
 */
function get_city_list($reid=1) {
    $cacheName = "temp_city_list_".$reid;
    if(!S($cacheName)){
        $field = "id,name";
        $map['reid'] = $reid;
        $list = M('area')->field($field)->where($map)->select();
        S($cacheName,$list);
    }else{
        $list = S($cacheName);
    }
    return $list;
}
function getborrowclass($id){

    $borrowlvl = M("borrow_info")->getFieldById($id,"borrow_lvl");
    $str = "";
    if($borrowlvl!=""&&$borrowlvl!=0){
        $lvlname = M("disperse_class")->getFieldById($borrowlvl,"name");
        $str = "【{$lvlname}级】";
    }
    return $str;
}



//快速缓存调用和储存
function FS($filename,$data="",$path=""){
	$path = C("WEB_ROOT").$path;
	if($data==""){
		$f = explode("/",$filename);
		$num = count($f);
		if($num>2){
			$fx = $f;
			array_pop($f);
			$pathe = implode("/",$f);
			$re = F($fx[$num-1],'',$pathe."/");
		}else{
			isset($f[1])?$re = F($f[1],'',C("WEB_ROOT").$f[0]."/"):$re = F($f[0]);
		}
		return $re;
	}else{
		if(!empty($path)) $re = F($filename,$data,$path);
		else $re = F($filename,$data);
	}
}

function getFloatValue($f,$len)
{
  return  number_format($f,$len,'.','');
}

//获取远程图片
function get_remote_img($content){
	$rt = C("WEB_ROOT");
	$img_dir = C("REMOTE_IMGDIR")?C("REMOTE_IMGDIR"):"/Static/Remote";//img_dir远程图片的保存目录，带前"/"不带后"/"
	$base_dir = substr($rt,0,strlen($rt)-1);//$base_dir网站根目录物理路径，不带后"/"

	$content = stripslashes($content);
	$img_array = array();
	preg_match_all("/(src|SRC)=[\"|'| ]{0,}(http:\/\/(.*)\.(gif|jpg|jpeg|bmp|png|ico))/isU",$content,$img_array); //获取内容中的远程图片
	$img_array = array_unique($img_array[2]); //把重复的图片去掉
	set_time_limit(0);
	$imgUrl = $img_dir."/".strftime("%Y%m%d",time()); //img_dir远程图片的保存目录，带前"/"不带后"/"
	$imgPath = $base_dir.$imgUrl; //$base_dir网站根目录物理路径，不带后"/"
	$milliSecond = strftime("%H%M%S",time());
	if(!is_dir($imgPath)) MakeDir($imgPath,0777);//如果路径不存在则创建
	foreach($img_array as $key =>$value)
	{
		$value = trim($value);
		$get_file = @file_get_contents($value);
		$rndFileName = $imgPath."/".$milliSecond.$key.".".substr($value,-3,3);
		$fileurl = $imgUrl."/".$milliSecond.$key.".".substr($value,-3,3);

		if($get_file)
		{
			$fp = @fopen($rndFileName,"w");
			@fwrite($fp,$get_file);
			@fclose($fp);
		}
		$content = ereg_replace($value,$fileurl,$content);
	}
	//$content = addslashes($content);
	return $content;
}

function getCreditsLog($map,$size){
	if(empty($map['uid'])) return;

	if($size){
		//分页处理
		import("ORG.Util.Page");
		$count = M('member_creditslog')->where($map)->count('id');
		$p = new Page($count, $size);
		$page = $p->show(1);
		$Lsql = "{$p->firstRow},{$p->listRows}";
		//分页处理
	}

	$list = M('member_creditslog')->where($map)->order('id DESC')->limit($Lsql)->select();
	$type_arr = C("MONEY_LOG");
	foreach($list as $key=>$v){
		//$list[$key]['type'] = $type_arr[$v['type']];
	}

	$row=array();
	$row['list'] = $list;
	$row['page'] = $page;
	return $row;
}

function getCredit($uid){
	$pre = C('DB_PREFIX');
	$user = M('members m')->join("{$pre}member_money mm ON m.id=mm.uid")->where("m.id={$uid}")->find();
	if( !is_array($user) ) 	return "用户出错，请重新操作";

	$credit = array();
	$credit['xy']['limit'] = 	getFloatValue($user['credit_limit'],2);
	$credit['xy']['use'] = 		getFloatValue(M('borrow_info')->where("borrow_uid = {$uid} AND borrow_status in(0,2,4,6) AND borrow_type=1")->sum("borrow_money-repayment_money"),2);
	$credit['xy']['cuse'] = 	getFloatValue($credit['xy']['limit'] - $credit['xy']['use'],2);

	$credit['db']['limit'] = 	getFloatValue($user['vouch_limit'],2);
	$credit['db']['use'] = 		getFloatValue(M('borrow_info')->where("borrow_uid = {$uid} AND borrow_status in(0,2,4,6) AND borrow_type=2")->sum("borrow_money-repayment_money"),2);
	$credit['db']['cuse'] = 	getFloatValue($credit['db']['limit'] - $credit['db']['use'],2);

	$credit['dy']['limit'] = 	getFloatValue($user['diya_limit'],2);
	$credit['dy']['use'] = 		getFloatValue(M('borrow_info')->where("borrow_uid = {$uid} AND borrow_status in(0,2,4,6) AND borrow_type=5")->sum("borrow_money-repayment_money"),2);
	$credit['dy']['cuse'] = 	getFloatValue($credit['dy']['limit'] - $credit['dy']['use'],2);

	$credit['jz']['limit'] = 	getFloatValue(0.9 * M('investor_detail')->where(" investor_uid={$uid} AND status =7 ")->sum("capital+interest-interest_fee"),2);
	$credit['jz']['use'] = 		getFloatValue(M('borrow_info')->where("borrow_uid = {$uid} AND borrow_status in(0,2,4,6) AND borrow_type=4")->sum("borrow_money+borrow_interest-repayment_money-repayment_interest"),2);
	$credit['jz']['cuse'] = 	getFloatValue($credit['jz']['limit'] - $credit['jz']['use'],2);

	$credit['all']['limit'] = 	getFloatValue($credit['xy']['limit'] + $credit['db']['limit'] + $credit['dy']['limit'],2);
	$credit['all']['use'] = 	getFloatValue($credit['xy']['use'] + $credit['db']['use'] + $credit['dy']['use'],2);
	$credit['all']['cuse'] = 	getFloatValue($credit['all']['limit'] - $credit['all']['use'],2);

	return $credit;
}

//所有圈子列表,以id为键
function Notice($type,$uid,$data=array()){
    $datag = get_global_setting();
    $datag=de_xie($datag);
    $msgconfig = FS("Dynamic/msgconfig");

    $emailTxt = FS("Dynamic/emailtxt");
    $smsTxt = FS("Dynamic/smstxt");
    $msgTxt = FS("Dynamic/msgtxt");
    $emailTxt=de_xie($emailTxt);
    $smsTxt=de_xie($smsTxt);
    $msgTxt=de_xie($msgTxt);
    //邮件
    import("ORG.Net.Email");
    $port =$msgconfig['stmp']['port'];//25;
    $smtpserver=$msgconfig['stmp']['server'];
    $smtpuser = $msgconfig['stmp']['user'];
    $smtppwd = $msgconfig['stmp']['pass'];
    $mailtype = "HTML";
    $sender = $msgconfig['stmp']['user'];
    $fromname = $msgconfig['stmp']['name'];
    $smtp = new smtp($smtpserver,$port,true,$smtpuser,$smtppwd,$sender);
    //邮件
    $minfo = M('members')->field('user_email,user_name,user_phone')->find($uid);
    $uname = $minfo['user_name'];
    $body = "";
    $res = false;
    $data_verify = "";
    switch($type){
        case 2://安全中心通过验证码改密码安全问题
            $vcode = rand_string(10,3);
            $data_verify['code'] = $vcode;
            $data_verify['send_time'] = time();
            $data_verify['type'] = 2;
            /*邮件*/
            $subject = "您刚刚在".$datag['web_name']."通过验证码改密码安全问题";
            $body = str_replace(array("#CODE#"),array($vcode),$emailTxt['safecode']);
            $to = $minfo['user_email'];
            $send=$smtp->sendmail($to,$fromname,$sender,$subject,$body,$mailtype);

            $datax['email_title']='通过验证码改密码安全问题';
            $sl = new SmsLogModel();
            //手机
            $sendp = $sl->sendSms($minfo['user_phone'],'safecode');
            $res = $send;
            break;
        case 5://安全中心新手机验证码安全码
            $vcode = rand_string(10,1);
            $data_verify['code'] = $vcode;
            $data_verify['send_time'] = time();
            $data_verify['type'] = 5;
            /*邮件*/
            $subject = "您刚刚在".$datag['web_name']."申请更换手机的安全码";
            $body = str_replace(array("#CODE#"),array($vcode),$emailTxt['changephone']);
            $to = $minfo['user_email'];
            $send=$smtp->sendmail($to,$fromname,$sender,$subject,$body,$mailtype);
            //将邮件发送记录存到数据库中
            $datax['email_title']='更换手机的安全码邮箱通知';
            /*邮件*/
            $res = $send;
            break;

        case 6://借款发布成功审核通过
            /*邮件*/
            $subject = "恭喜，你在".$datag['web_name']."发布的借款审核通过";
            $body = str_replace(array("#UserName#"),array($uname),$emailTxt['verifysuccess']);
            $to = $minfo['user_email'];
            $send=$smtp->sendmail($to,$fromname,$sender,$subject,$body,$mailtype);
            //将邮件发送记录存到数据库中
            $datax['email_title']='审核通过邮箱通知';
            /*邮件*/
            /*站内信*/
            $body = str_replace(array("#UserName#"),array($uname),$msgTxt['verifysuccess']);
            addInnerMsg($uid,"恭喜借款审核通过",$body);
            /*站内信*/
            $res = $send;
            break;

        case 7://密码找回
            $vcode = rand_string(32,0);
            $data_verify['code'] = $vcode;
            $data_verify['send_time'] = time();
            $data_verify['type'] = 7;
            $link='<a href="'.C('WEB_URL').'/user/common/getpasswordverify?vcode='.$vcode.'">点击链接验证邮件</a>';
            /*邮件*/
            $subject = "您刚刚在".$datag['web_name']."申请了密码找回";
            $body = str_replace(array("#UserName#","#LINK#"),array($uname,$link),$emailTxt['getpass']);
            $to = $minfo['user_email'];
            $send=$smtp->sendmail($to,$fromname,$sender,$subject,$body,$mailtype);
            //将邮件发送记录存到数据库中
            $datax['email_title']='密码找回';
            /*邮件*/
            $res = $send;
            break;
        case 8://验证中心邮件验证
            $vcode = rand_string(32,0);
            $data_verify['code'] = $vcode;
            $data_verify['send_time'] = time();
            $data_verify['type'] = 8;
            $link='<a href="'.C('WEB_URL').'/user/common/emailverify?vcode='.$vcode.'">点击链接验证邮件</a>';
            /*邮件*/
            $subject = "您刚刚在".$datag['web_name']."申请邮件验证";
            $body = str_replace(array("#UserName#","#LINK#"),array($uname,$link),$emailTxt['regsuccess']);
            $to = $minfo['user_email'];
            $send=$smtp->sendmail($to,$fromname,$sender,$subject,$body,$mailtype);
            //将邮件发送记录存到数据库中
            $datax['email_title']='注册邮箱确认';
            /*邮件*/
            $res = $send;
            break;


        case 9://还款到期提醒
            /*邮件*/
            $subject = "您在".$datag['web_name']."的还款最终期限即将到期。";
            $body = str_replace(array("#UserName#","#borrowName#","#borrowMoney#"),array($uname,$data['borrowName'],$data['borrowMoney']),$emailTxt['repaymentTip']);
            $to = $minfo['user_email'];
            $send=$smtp->sendmail($to,$fromname,$sender,$subject,$body,$mailtype);
            //将邮件发送记录存到数据库中
            $datax['email_title']='还款到期提醒';
            /*邮件*/
            $res = $send;
            break;
        case 10://支付密码找回
            $vcode = rand_string(32,0);
            $data_verify['code'] = $vcode;
            $data_verify['send_time'] = time();
            $data_verify['type'] = 10;
            $link='<a href="'.C('WEB_URL').'/user/index/getpaypasswordverify?vcode='.$vcode.'">点击链接验证邮件</a>';
            /*邮件*/
            $subject = "您刚刚在".$datag['web_name']."申请了支付密码找回";
            $body = str_replace(array("#UserName#","#LINK#"),array($uname,$link),$emailTxt['getpaypass']);
            $to = $minfo['user_email'];
            $send=$smtp->sendmail($to,$fromname,$sender,$subject,$body,$mailtype);
            //将邮件发送记录存到数据库中
            $datax['email_title']='支付密码找回';
            /*邮件*/
            $res = $send;
            break;

    }
    $inemail=new EmailLogModel();
    $datax['send_email']=$sender;
    $datax['email']=$minfo['user_email'];
    $datax['status']=1;//1为邮箱待确认，2为邮箱确认成功，3为邮箱确认失败
    $datax['msg']=$body;
    $datax['addtime']=time();
    $datax['addip']=get_client_ip();
    $inemail->addLog($uid,$datax,$data_verify);

    return $res;
}

function SMStip($type,$mob,$from=array(),$to=array()){
	if(empty($mob)) return;
		$datag = get_global_setting();
		$datag=de_xie($datag);
		$smsTxt = FS("Dynamic/smstxt");
		$smsTxt=de_xie($smsTxt);
		if($smsTxt[$type]['enable']==1){
			$body = str_replace($from,$to,$smsTxt[$type]['content']);
			$send=sendsms($mob,$body);
		}else{
			return;
		}
}


//所有圈子列表,以id为键
function MTip($type,$uid=0,$info="",$autoid=""){
    $datag = get_global_setting();
    $datag=de_xie($datag);
    $m = new MembersModel();
    $minfo = $m->getMemberInfo($uid,'','id,user_email');
    switch($type){
        case "chk1"://修改密码
            $innerbody = "您刚刚修改了登录密码,如不是自己操作,请尽快联系客服";
            addInnerMsg($minfo['id'],"您刚刚修改了登录密码",$innerbody);
            break;

        case "chk2"://修改银行账号
            $innerbody = "您刚刚修改或绑定了提现的银行账户,如不是自己操作,请尽快联系客服";
            addInnerMsg($minfo['id'],"您刚刚修改或绑定了提现的银行账户",$innerbody);
            break;

        case "chk6"://资金提现
            $innerbody = "您刚刚申请了提现操作,如不是自己操作,请尽快联系客服";
            addInnerMsg($minfo['id'],"您刚刚申请了提现操作",$innerbody);
            break;

        case "chk7"://借款标初审未通过
            $innerbody = "您发布的第{$info}号借款标刚刚初审未通过";
            addInnerMsg($minfo['id'],"刚刚您的借款标初审未通过",$innerbody);
            break;

        case "chk8"://借款标初审通过
            $innerbody = "您发布的第{$info}号借款标刚刚初审通过";
            addInnerMsg($minfo['id'],"刚刚您的借款标初审通过",$innerbody);
            break;

        case "chk9"://借款标复审通过
            $innerbody = "您发布的第{$info}号借款标刚刚复审通过";
            addInnerMsg($minfo['id'],"刚刚您的借款标复审通过",$innerbody);
            break;

        case "chk12"://借款标复审未通过
            $innerbody = "您发布的第{$info}号借款标复审未通过";
            addInnerMsg($minfo['id'],"刚刚您的借款标复审未通过",$innerbody);
            break;

        case "chk10"://借款标满标
            $innerbody = "刚刚您的借款标已满标";
            addInnerMsg($minfo['id'],"刚刚您的第{$info}号借款标已满标",$innerbody);
            break;

        case "chk11"://借款标流标
            $innerbody = "您的第{$info}号借款标已流标";
            addInnerMsg($minfo['id'],"刚刚您的借款标已流标",$innerbody);
            break;

        case "chk25"://借入人还款成功
            $innerbody = "您对借入的第{$info}号借款进行了还款";
            addInnerMsg($minfo['id'],"您对借入标还款进行了还款操作",$innerbody);
            break;

        case "chk27"://自动投标借出完成
            $innerbody = "您设置的第{$autoid}号自动投标对第{$info}号借款进行了投标";
            addInnerMsg($minfo['id'],"您设置的第{$autoid}号自动投标按设置投了新标",$innerbody);
            break;

        case "chk14"://借出成功
            $innerbody = "您投标的借款成功了";
            addInnerMsg($minfo['id'],"您投标的第{$info}号借款借款成功",$innerbody);
            break;


        case "chk15"://借出流标
            $innerbody = "您投标的借款流标了";
            addInnerMsg($minfo['id'],"您投标的第{$info}号借款流标了，相关资金已经返回账户",$innerbody);
            break;

        case "chk16"://收到还款
            $innerbody = "您借出的借款收到了新的还款";
            addInnerMsg($minfo['id'],"您借出的第{$info}号借款收到了新的还款",$innerbody);
            break;

        case "chk18"://网站代为偿还
            $innerbody = "您借出的第{$info}号借款逾期网站代还了本金";
            addInnerMsg($minfo['id'],"您借出的第{$info}号借款逾期网站代还",$innerbody);
            break;
    }
}



function getBorrowInterestRate($rate,$duration){
	return ($rate/(12*100)*$duration);
}


function memberCreditsLog($uid,$type,$acredits,$info="无"){
	if($acredits==0) return true;
	$done = false;
	$mCredits = M("members")->getFieldById($uid,'credits');
	$Creditslog = D('member_creditslog');
	$Creditslog->startTrans();
		$data['uid'] = $uid;
		$data['type'] = $type;
		$data['affect_credits'] = $acredits;
		$data['account_credits'] = $mCredits + $acredits;
		$data['info'] = $info;
		$data['add_time'] = time();
		$data['add_ip'] = get_client_ip();
		$newid = $Creditslog->add($data);

		$xid = M('members')->where("id={$uid}")->setField('credits',$data['account_credits']);

		if($xid){
			$Creditslog->commit() ;
			$done = true;
		}else{
			$Creditslog->rollback() ;
		}

	return $done;
}

function getLeftTime($timeend,$type=1){
	if($type==1){
		$timeend = strtotime(date("Y-m-d",$timeend)." 23:59:59");
		$timenow = strtotime(date("Y-m-d",time())." 23:59:59");
		$left = ceil( ($timeend-$timenow)/3600/24 );
	}else{
		$left_arr = timediff(time(),$timeend);
		$left = $left_arr['day']."天 ".$left_arr['hour']."小时 ".$left_arr['min']."分钟 ".$left_arr['sec']."秒";
	}
	return $left;
}

function timediff($begin_time,$end_time )
{
    if ( $begin_time < $end_time ) {
        $starttime = $begin_time;
        $endtime = $end_time;
    } else {
        $starttime = $end_time;
        $endtime = $begin_time;
    }
    $timediff = $endtime - $starttime;
    $days = intval( $timediff / 86400 );
    $remain = $timediff % 86400;
    $hours = intval( $remain / 3600 );
    $remain = $remain % 3600;
    $mins = intval( $remain / 60 );
    $secs = $remain % 60;
    $res = array( "day" => $days, "hour" => $hours, "min" => $mins, "sec" => $secs );
    return $res;
}

function addInnerMsg($uid,$title,$msg){
    $iner = new InnerMsgModel();
    $iner->addInnerMsg($uid,$title,$msg);
}


//获取下级或者同级栏目列表
function getTypeList($parm){
	$Osql="sort_order DESC";
	$field="id,type_name,type_set,add_time,type_url,type_nid,parent_id";
	//查询条件
	$Lsql="{$parm['limit']}";
	$pc = D('navigation')->where("parent_id={$parm['type_id']} and model='navigation'")->count('id');
	if($pc>0){
		$map['is_hiden'] = 0;
		$map['parent_id'] = $parm['type_id'];
        $map['model']  = 'navigation';
		$data = D('navigation')->field($field)->where($map)->order($Osql)->limit($Lsql)->select();
	}elseif(!isset($parm['notself'])){
		$map['is_hiden'] = 0;
		$map['parent_id'] = D('Acategory')->getFieldById($parm['type_id'],'parent_id');
		$data = D('Acategory')->field($field)->where($map)->order($Osql)->limit($Lsql)->select();
	}

	//链接处理
	$typefix = get_type_leve_nid($parm['type_id']);
	$typeu = $typefix[0];
	$suffix=C("URL_HTML_SUFFIX");
	foreach($data as $key=>$v){
		if($v['type_set']==2){
			if(empty($v['type_url'])) $data[$key]['turl']="javascript:alert('请在后台添加此栏目链接');";
			else $data[$key]['turl'] = $v['type_url'];
		}
		elseif($parm['model']=='navigation'||($v['parent_id']==0)) $data[$key]['turl'] = MU(C("DEFAULT_GROUP")."/{$v['type_nid']}/index","typelist",array("suffix"=>$suffix));
		elseif($parm['model']=='article'||($v['parent_id']==0)) $data[$key]['turl'] = MU(C("DEFAULT_GROUP")."/{$v['type_nid']}/index","typelist",array("suffix"=>$suffix));
		else $data[$key]['turl'] = MU(C("DEFAULT_GROUP")."/{$typeu}/{$v['type_nid']}","typelist",array("suffix"=>$suffix));
	}
	$row=array();
	$row = $data;

	return $row;
}

//获取下级或者同级栏目列表 文章栏目
function getTypeListActa($parm){
	//if(empty($parm['type_id'])) return;
	$Osql="sort_order DESC";
	$field="id,type_name,type_set,add_time,type_url,type_nid,parent_id";
	//查询条件
	$Lsql="{$parm['limit']}";
	//$pc = D('Acategory')->where("parent_id={$parm['type_id']} and model='navigation'")->count('id');
	$pc = D('Acategory')->where("parent_id={$parm['type_id']} and model='article'")->count('id');
	if($pc>0){
		$map['is_hiden'] = 0;
		$map['parent_id'] = $parm['type_id'];
        $map['model']  = 'article';
		//$data = D('Acategory')->field($field)->where($map)->order($Osql)->limit($Lsql)->select();
		$data = D('Acategory')->field($field)->where($map)->order($Osql)->limit($Lsql)->select();
	}elseif(!isset($parm['notself'])){
		$map['is_hiden'] = 0;
		$map['parent_id'] = D('Acategory')->getFieldById($parm['type_id'],'parent_id');
		//$data = D('Acategory')->field($field)->where($map)->order($Osql)->limit($Lsql)->select();
		$data = D('Acategory')->field($field)->where($map)->order($Osql)->limit($Lsql)->select();
	}

	//链接处理
	$typefix = get_type_leve_nid($parm['type_id']);
	$typeu = $typefix[0];
	$suffix=C("URL_HTML_SUFFIX");
	foreach($data as $key=>$v){
		if($v['type_set']==2){
			if(empty($v['type_url'])) $data[$key]['turl']="javascript:alert('请在后台添加此栏目链接');";
			else $data[$key]['turl'] = $v['type_url'];
		}
		//elseif($parm['type_id']==0||($v['parent_id']==0&&count($typefix)==1)) $data[$key]['turl'] = MU("Home/{$v['type_nid']}/index","typelist",array("suffix"=>$suffix));
		elseif($parm['model']=='article'||($v['parent_id']==0)) $data[$key]['turl'] = MU(C("DEFAULT_GROUP")."/{$v['type_nid']}/index","typelist",array("suffix"=>$suffix));
		else $data[$key]['turl'] = MU(C("DEFAULT_GROUP")."/{$typeu}/{$v['type_nid']}","typelist",array("suffix"=>$suffix));
	}
	$row=array();
	$row = $data;

	return $row;
}
function getBorrowInterest($type,$money,$duration,$rate){
    $interest = 0;
	switch($type){
		case 1://按天到期还款
			$day_rate =  $rate/36500;//计算出天标的天利率
			$interest = getFloatValue($money*$day_rate*$duration ,2);
		break;
		case 2://按月分期还款
			$parm['month_times'] = $duration;
			$parm['account'] = $money;
			$parm['year_apr'] = $rate;
			$parm['type'] = "all";
			$intre = EqualMonth($parm);
			$interest = ($intre['repayment_money'] - $money);
		break;
		case 3://按季分期还款
			$parm['month_times'] = $duration;
			$parm['account'] = $money;
			$parm['year_apr'] = $rate;
			$parm['type'] = "all";
			$intre = EqualSeason($parm);
			$interest = $intre['interest'];
		break;
		case 4://每月还息到期还本
			$parm['month_times'] = $duration;
			$parm['account'] = $money;
			$parm['year_apr'] = $rate;
			$parm['type'] = "all";
			$intre = EqualEndMonth($parm);
			$interest = $intre['interest'];
		break;
		case 5://一次性到期还款
			$parm['month_times'] = $duration;
			$parm['account'] = $money;
			$parm['year_apr'] = $rate;
			$parm['type'] = "all";
			$intre = EqualEndMonthOnly($parm);
			$interest = $intre['interest'];
		break;

	}
	return $interest;
}

//等额本息法
//贷款本金×月利率×（1+月利率）还款月数/[（1+月利率）还款月数-1]
//a*[i*(1+i)^n]/[(1+I)^n-1]
//（a×i－b）×（1＋i）
/*
money,year_apr,duration,borrow_time(用来算还款时间的),type(==all时，返回还款概要)

*/
function EqualMonth ($data = array()){
	if (isset($data['account']) && $data['account']>0){
		$account = $data['account'];
	}else{
		return "";
	}
	//利率
	if (isset($data['year_apr']) && $data['year_apr']>=0){
		$year_apr = $data['year_apr'];
	}else{
		return "";
	}

	if (isset($data['month_times']) && $data['month_times']>=0){
		$duration = $data['month_times'];
	}
	if (isset($data['borrow_time']) && $data['borrow_time']>0){
		$borrow_time = $data['borrow_time'];
	}else{
		$borrow_time = time();
	}
	$month_apr = $year_apr/(12*100);
	$_li = pow((1+$month_apr),$duration);
	$repayment = round($account * ($month_apr * $_li)/($_li-1),2);
	$_result = array();
	if (isset($data['type']) && $data['type']=="all"){
		$_result['repayment_money'] = $repayment*$duration;
		$_result['monthly_repayment'] = $repayment;
		$_result['month_apr'] = round($month_apr*100,2);
	}else{
		for($i=0;$i<$duration;$i++){
			if ($i==0){
				$interest = round($account*$month_apr,2);
			}else{
				$_lu = pow((1+$month_apr),$i);
				$interest = round(($account*$month_apr - $repayment)*$_lu + $repayment,2);
			}
			$_result[$i]['repayment_money'] = getFloatValue($repayment,2);
			$_result[$i]['repayment_time'] = get_times(array("time"=>$borrow_time,"num"=>$i+1));
			$_result[$i]['interest'] = getFloatValue($interest,2);
			$_result[$i]['capital'] = getFloatValue($repayment-$interest,2);
		}
	}
	return $_result;
}
//按季等额本息法
function EqualSeason ($data = array()){
  //借款的月数
  if (isset($data['month_times']) && $data['month_times']>0){
	  $month_times = $data['month_times'];
  }
  //按季还款必须是季的倍数
  if ($month_times%3!=0){
	  return false;
  }
  //借款的总金额
  if (isset($data['account']) && $data['account']>0){
	  $account = $data['account'];
  }else{
	  return "";
  }
  //借款的年利率
  if (isset($data['year_apr']) && $data['year_apr']>0){
	  $year_apr = $data['year_apr'];
  }else{
	  return "";
  }

  //借款的时间 --- 什么时候开始借款，计算还款的
  if (isset($data['borrow_time']) && $data['borrow_time']>0){
	  $borrow_time = $data['borrow_time'];
  }else{
	  $borrow_time = time();
  }

  //月利率
  $month_apr = $year_apr/(12*100);

  //得到总季数
  $_season = $month_times/3;

  //每季应还的本金
  $_season_money = round($account/$_season,2);

  $_yes_account = 0 ;
  $repayment_account = 0;//总还款额
  $_all_interest = 0;//总利息
  for($i=0;$i<$month_times;$i++){
	  $repay = $account - $_yes_account;//应还的金额

	  $interest = round($repay*$month_apr,2);//利息等于应还金额乘月利率
	  $repayment_account = $repayment_account+$interest;//总还款额+利息
	  $capital = 0;
	  if ($i%3==2){
		  $capital = $_season_money;//本金只在第三个月还，本金等于借款金额除季度
		  $_yes_account = $_yes_account+$capital;
		  $repayment_account = $repayment_account+$capital;//总还款额+本金
	  }

	  $_result[$i]['repayment_money'] = getFloatValue($interest+$capital,2);
	  $_result[$i]['repayment_time'] = get_times(array("time"=>$borrow_time,"num"=>$i+1));
	  $_result[$i]['interest'] = getFloatValue($interest,2);
	  $_result[$i]['capital'] = getFloatValue($capital,2);
	  $_all_interest += $interest;
  }
  if (isset($data['type']) && $data['type']=="all"){
	  $_resul['repayment_money'] = $repayment_account;
	  $_resul['monthly_repayment'] = round($repayment_account/$_season,2);
	  $_resul['month_apr'] = round($month_apr*100,2);
	  $_resul['interest'] = $_all_interest;
	  return $_resul;
  }else{
	  return $_result;
  }
}

//到期还本，按月付息
function EqualEndMonth ($data = array()){

  //借款的月数
  if (isset($data['month_times']) && $data['month_times']>0){
	  $month_times = $data['month_times'];
  }

  //借款的总金额
  if (isset($data['account']) && $data['account']>0){
	  $account = $data['account'];
  }else{
	  return "";
  }

  //借款的年利率
  if (isset($data['year_apr']) && $data['year_apr']>0){
	  $year_apr = $data['year_apr'];
  }else{
	  return "";
  }


  //借款的时间
  if (isset($data['borrow_time']) && $data['borrow_time']>0){
	  $borrow_time = $data['borrow_time'];
  }else{
	  $borrow_time = time();
  }

  //月利率
  $month_apr = $year_apr/(12*100);



  $_all_interest=0;

  $interest = round($account*$month_apr,2);//利息等于应还金额乘月利率
  for($i=0;$i<$month_times;$i++){
	  $capital = 0;
	  if ($i+1 == $month_times){
		  $capital = $account;//本金只在最后一个月还，本金等于借款金额除季度
	  }

	  $_result[$i]['repayment_account'] = $interest+$capital;
	  $_result[$i]['repayment_time'] = get_times(array("time"=>$borrow_time,"num"=>$i+1));
	  $_result[$i]['interest'] = $interest;
	  $_result[$i]['capital'] = $capital;
	  $_all_interest += $interest;
  }
  if (isset($data['type']) && $data['type']=="all"){
	  $_resul['repayment_account'] = $account + $interest*$month_times;
	  $_resul['monthly_repayment'] = $interest;
	  $_resul['month_apr'] = round($month_apr*100,2);
	  $_resul['interest'] = $_all_interest;
	  return $_resul;
  }else{
	  return $_result;
  }
}

/////////////////////////////////////////一次性还款//////////////////////////////////////
function EqualEndMonthOnly($data = array()){

  //借款的月数
  if (isset($data['month_times']) && $data['month_times']>0){
	  $month_times = $data['month_times'];
  }

  //借款的总金额
  if (isset($data['account']) && $data['account']>0){
	  $account = $data['account'];
  }else{
	  return "";
  }

  //借款的年利率    $data['year_apr']>0
  if (isset($data['year_apr']) && $data['year_apr']>=0){
	  $year_apr = $data['year_apr'];
  }else{
	  return "";
  }

  //月利率
  $month_apr = $year_apr/(12*100);

  $interest = getFloatValue($account*$month_apr*$month_times,2);//利息等于应还金额*月利率*借款月数

  $_resul['repayment_account'] = $account + $interest;
  $_resul['monthly_repayment'] = $interest;
  $_resul['month_apr'] = round($month_apr*100,2);
  $_resul['interest'] = $interest;
  $_resul['capital'] = $account;
  return $_resul;
}




function getExpiredDays($deadline){
	if($deadline>time()) return 0;
	return ceil( (time()-$deadline)/3600/24 );
}
function getExpiredMoney($expired,$capital,$interest){
	$glodata = get_global_setting();
	$expired_fee = explode("|",$glodata['fee_expired']);

	if($expired<=$expired_fee[0]) return 0;
	return getFloatValue(($capital+$interest)*($expired-$expired_fee[0])*$expired_fee[1]/1000,2);
}
function getExpiredCallFee($expired,$capital,$interest){
	$glodata = get_global_setting();
	$call_fee = explode("|",$glodata['fee_call']);

	if($expired<=$call_fee[0]) return 0;
	return getFloatValue(($capital+$interest)*($expired-$call_fee[0])*$call_fee[1]/1000,2);
}


function setBackUrl($per="",$suf=""){
	$url = $_SERVER['HTTP_REFERER'];
	$urlArr = parse_url($url);
	$query = $per."?1=1&".$urlArr['query'].$suf;
	session('listaction',$query);
}

//是否生日
function isBirth($uid){
    $m = new MembersModel();
    $minfo = $m->getMemberInfo($uid,"MemberInfo",'id');
	$idcard = $minfo['idcard'];
	if(!$idcard)return false;

	$bir = substr($idcard, 10, 4);
	$now = date("md");
	if( $bir==$now )return true;
	else return false;
}

function sendemail($to,$subject,$body){
	$msgconfig = FS("Dynamic/msgconfig");

	import("ORG.Net.Email");
	$port =$msgconfig['stmp']['port'];//25;
	$smtpserver=$msgconfig['stmp']['server'];
	$smtpuser = $msgconfig['stmp']['user'];
	$smtppwd = $msgconfig['stmp']['pass'];
	$mailtype = "HTML";
	$sender = $msgconfig['stmp']['user'];
        $fromname = $msgconfig['stmp']['name'];

	$smtp = new smtp($smtpserver,$port,true,$smtpuser,$smtppwd,$sender);
	$send=$smtp->sendmail($to,$fromname,$sender,$subject,$body,$mailtype);
	return $send;
}

function getInvestUrl($id){
    return "/invest/{$id}".C('URL_HTML_SUFFIX');
}
//优计划投标处理方法
function getFundUrl($id){
	return "/fund/{$id}".C("URL_HTML_SUFFIX");
}


//后台管理员登录日志
function alogs($type,$tid,$tstatus,$deal_info='',$deal_user='' ){
    $auser = new AusersModel();
    $deal_user = $deal_user==''?session('adminname'):$deal_user;
    $newid = $auser->addAdminLog($type,$tid,$tstatus,$deal_info,$deal_user);
	return $newid;
}
function cnsubstr2($str, $length, $start=0, $charset="utf-8", $suffix=true)
{
	   $str = strip_tags($str);
	   if(function_exists("mb_substr"))
	   {
			   if(mb_strlen($str, $charset) <= $length) return $str;
			   $slice = mb_substr($str, $start, $length, $charset);
	   }
	   else
	   {
			   $re['utf-8']   = "/[\x01-\x7f]|[\xc2-\xdf][\x80-\xbf]|[\xe0-\xef][\x80-\xbf]{2}|[\xf0-\xff][\x80-\xbf]{3}/";
			   $re['gb2312'] = "/[\x01-\x7f]|[\xb0-\xf7][\xa0-\xfe]/";
			   $re['gbk']          = "/[\x01-\x7f]|[\x81-\xfe][\x40-\xfe]/";
			   $re['big5']          = "/[\x01-\x7f]|[\x81-\xfe]([\x40-\x7e]|\xa1-\xfe])/";
			   preg_match_all($re[$charset], $str, $match);
			   if(count($match[0]) <= $length) return $str;
			   $slice = join("",array_slice($match[0], $start, $length));
	   }
	   if($suffix) return $slice;
	   return $slice;
}
/////////////////////////////////////////利息复投//////////////////////////////////////

function CompoundMonth($data = array()){

  //借款的月数
  if (isset($data['month_times']) && $data['month_times']>0){
	  $month_times = $data['month_times'];
  }

  //借款的总金额
  if (isset($data['account']) && $data['account']>0){
	  $account = $data['account'];
  }else{
	  return "";
  }

  //借款的年利率
  if (isset($data['year_apr']) && $data['year_apr']>0){
	  $year_apr = $data['year_apr'];
  }else{
	  return "";
  }

  //借款的时间
  if (isset($data['borrow_time']) && $data['borrow_time']>0){
	  $borrow_time = $data['borrow_time'];
  }else{
	  $borrow_time = time();
  }

  //月利率
  $month_apr = $year_apr/(12*100);


  $mpow = pow((1 + $month_apr),$month_times);


  $repayment_account = getFloatValue($account*$mpow,2);//利息等于应还金额*月利率*借款月数

  if (isset($data['type']) && $data['type']=="all"){
	  $_resul['repayment_account'] = $repayment_account;
	  $_resul['month_apr'] = round($month_apr*100,4);
	  $_resul['interest'] = $repayment_account - $account;
	  $_resul['capital'] = $account;
	  $_resul['shouyi'] = round($_resul['interest']/$account*100,2);
	  return $_resul;
  }
}
///////////////////////////////////////////////////////////////////////////////////////////
//通过用户ID查找用户名
function getName($id){
    $userName = M("members")->field("user_name")->find($id);
    return $userName['user_name'];
}
//根据城市ID查询城市名称
function getNameById($id){
   $name = M("area")->field("name")->find($id);
   return $name['name'];
}
//特权金发放


function extra_encode($id,$len){
    $data = array(
        0 => "H",
        1 => "B",
        2 => "C",
        3 => "K",
        4 => "E",
        5 => "F",
        6 => "G",
        7 => "A",
        8 => "J",
        9 => "D"
    );
    $str = "L7UZ2WSX3VR5PQVR4T8MW25PQYT67YNZPQY7U5U5PQSX3YN4T6U5PQSX3QVL7X3VQVL7UWSUWSL7UZ2WSX3VR5PQVR4T8MW25PQYT67YNZPQY7U5U5PQSX3YN4T6U5PQSX3QVL7X3VQVL7UWSUWS";

    $i=0;
    $num = intval($id);
    $scode = "";
    $start = $num%10*(11-$num%10);
    while($num >0){
        $x = $num%10;
        $num = intval($num/10);
        $i++;
        $scode .= $data[$x];
    }
    $elselen = $len-$i;
    $scode .=substr($str,$start,$elselen);
    return $scode;


}
function extra_decode($str,$len){
    $data = array(
        "H" => 0,
        "B" => 1,
        "C" => 2,
        "K" => 3,
        "E" => 4,
        "F" => 5,
        "G" => 6,
        "A" => 7,
        "J" => 8,
        "D" => 9
    );
    $arr = array();
    $id = "";
    for($i=0;$i<strlen($str);$i++){
        $char = substr($str,$i,1);
        $arr[$i] = $data[$char];
        $id .= $arr[$i];
    }
    $strcheck = "L7UZ2WSX3VR5PQVR4T8MW25PQYT67YNZPQY7U5U5PQSX3YN4T6U5PQSX3QVL7X3VQVL7UWSUWSL7UZ2WSX3VR5PQVR4T8MW25PQYT67YNZPQY7U5U5PQSX3YN4T6U5PQSX3QVL7X3VQVL7UWSUWS";

    $id = strrev($id);
    $start = $id%10*(11-$id%10);
    $len = $len-strlen($id);
    $checkstr = substr($str,strlen($id));
    $checksrt = substr($strcheck,$start,$len);
    if($checkstr == $checksrt){
        return $id;
    }else{
        return 0;
    }
}
//项目置顶时，先取消之前的置顶项目
function stickoff(){
    $res1 = M("borrow_info")->where("is_tuijian = 2")->select();
    foreach($res1 as $k1 =>$v1){
        $data1["is_tuijian"] = 1;
        M("borrow_info")->where("id = {$v1["id"]}")->save($data1);
    }
    $res2 = M("transfer_borrow_info")->where("is_tuijian = 2")->select();
    foreach($res2 as $k2 =>$v2){
        $data2["is_tuijian"] = 1;
        M("transfer_borrow_info")->where("id = {$v2["id"]}")->save($data2);
    }
}

function sinaIPApi($ip){
    $str = file_get_contents("http://int.dpool.sina.com.cn/iplookup/iplookup.php?ip=".$ip);
    $str = iconv("gbk", "utf-8//IGNORE", $str);
    preg_match_all("/[/x{4e00}-/x{9fa5}]+/u",$str,$get);
    $add = implode('',$get[0]);
    return $str;
}

?>
