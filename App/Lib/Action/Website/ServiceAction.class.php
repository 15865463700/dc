<?php
/**
 * App系统接口文件
 * p2p系统app接口，可供原生安卓和ios开发者调用
 * @time 2016-06-27
 * @version v2.0
 * @since 1.0
 */
include "vendor/autoload.php";
use \Firebase\JWT\JWT;
class ServiceAction extends Action
{

    function __construct(){
        parent::__construct();

    }
    private $key = "v5p2p6258954";#生成token的key

    /**
     * function decodeUnicode
     * json字符串中的unicode转中文 
     * @access private
     * @params str
     * @since 1.0
     * @return string;
     */
    private function decodeUnicode($str)
    {
        return preg_replace_callback('/\\\\u([0-9a-f]{4})/i',
            create_function(
                '$matches',
                'return mb_convert_encoding(pack("H*", $matches[1]), "UTF-8", "UCS-2BE");'
            ),
            $str);
    }


    /**
     * function create_token
     * 生成token
     * @access privatez
     * @params data=array(name,phone,id,valp)
     * 参数说明 data=array(用户名，手机号，用户id，有效时长天数)
     * @since 1.0
     * @return string;
     */
    private function create_token($bat=array()){

        $token = array(
            "nam"=>$bat["name"],
            "pho"=>$bat["phone"],
            "ids"=>$bat["id"],
            "valp"=>$bat["valp"]
        );
        return $jwt = JWT::encode($token, $this->key);

    }
    /**
     * function decode_token
     * 解析获取的token并判断授权期
     * @access private
     * @param token
     * @since 1.0
     * @return array;
     */
    private function decode_token($jwt){


        JWT::$leeway = 60;
        $decoded = JWT::decode($jwt, $this->key, array('HS256'));

        $token_info = json_decode(json_encode($decoded),true);

        $uid = $token_info["ids"];
        $val = $token_info["valp"];
        $time = time();
        $last_log_time = M("members")->getFieldById($uid,"last_log_time");
        $x = $last_log_time+86400*intval($val)-$time;
        if($x<0){
            $output["event"] = 99;
            $output["msg"] = "授权期已过，请重新登录";
            exit($this->decodeUnicode(json_encode($output)));
        }else{
            $update["last_log_time"] = time();
            $update["last_log_ip"] = get_client_ip();
            M("members")->where("id = {$uid}")->save($update);
            return json_decode(json_encode($decoded),true);
        }

    }
    /**
     * function getPToken
     * 生成手机验证码并附加有效期
     * @access private
     * @param code：手机验证码
     * @param phone：手机号
     * @since 1.0
     * @return string;
     */
    private function getPToken($code,$phone){
        $str = $code."_".$phone."_".(time()+900);
        $st = base64_encode($str);
        return $st;
    }
    /**
     * function is_PToken
     * 手机验证码校验
     * @access private
     * @param token：生成的手机校验字串
     * @since 1.0
     * @return array;
     */
    private function is_PToken($token){
        $str = base64_decode($token);
        $arr = explode("_",$str);
        $code = $arr[0];
        $phone = $arr[1];
        $time = $arr[2];
        $res = time()>$time||$token==""||sizeof($arr)!=3?0:1;
        $data['pcode']= $code;
        $data['phone']= $phone;
        $data["res"] = $res;
        return $data;
    }

    /**
     * function getLeveIco
     * 用户信用等级
     * @access private
     * @param num：用户的信用分
     * @since 1.0
     * @return string;
     */
    private function getLeveIco($num){
        $leveconfig = FS("Dynamic/leveconfig");
        foreach($leveconfig as $key=>$v){
            if($num>=$v['start'] && $num<=$v['end']){
                return $v['name'];
            }
        }
    }

    /**
     * function getInvestLeveIco
     * 用户投资等级
     * @access private
     * @param num：用户的投资积分
     * @since 1.0
     * @return string;
     */
    private function getInvestLeveIco($num){
        $leveconfig = FS("Dynamic/leveinvestconfig");
        foreach($leveconfig as $key=>$v){
            if($num>=$v['start'] && $num<=$v['end']){
                return $v['name'] ;
            }
        }
    }

    /**
     * function login
     * 用户登录
     * @access public
     * @param username:用户名或手机号
     * @param pwd:登录密码（MD5加密后）
     * @since 1.0
     * @return array(event,msg,data)
     * 返回说明 array(状态，信息，数据)
     */
    public function login(){
        $obj = $_POST;
        $user_name = $obj["user_name"];
        $pwd = $obj["pwd"];

        $output = array();

        if (preg_match("/^1[34578]\\d{9}$/", text($user_name))) {
            $data['user_phone'] = text($user_name);
        } else {
            (false !== strpos($user_name, "@")) ? $data['user_email'] = text($user_name) : $data['user_name'] = text($user_name);
        }

        $data["user_pass"] = $pwd;

        $vo = M('members')->field('id,user_name,user_email,user_pass,is_ban,user_phone')->where($data)->find();
        if(is_array($vo)){
            if($vo["is_ban"]){
                $output["event"] = 1;
                $output["msg"] = "您的账户已被冻结";
            }else{
                $update["last_log_time"] = time();
                $update["last_log_ip"] = get_client_ip();
                $nid = M("members")->where("id = {$vo["id"]}")->save($update);
                if($nid){
                    $token =array();
                    $token["name"] = $vo["user_name"];
                    $token["phone"] = $vo["user_phone"];
                    $token["id"] = $vo["id"];
                    $token["valp"] = 14;

                    $output["event"] = 88;
                    $output["msg"] = "登录成功";
                    $output["data"] = $this->create_token($token);
                }else{
                    $output["event"] = 90;
                    $output["msg"] = "登录异常，请重试";
                }
            }
        }else{
            $output["event"] = 0;
            $output["msg"] = "用户名/手机号或密码错误";
        }
        exit($this->decodeUnicode(json_encode($output)));

    }

    /**
     * function send_code
     * 发送验证码(通用)
     * @access public
     * @param phone:手机号  or  token find
     * @since 1.0
     * @return array(event,msg,data)
     * 返回说明 array(状态，信息，数据)
     */
    public function send_code(){
        $obj = $_POST;
        $phone = $obj["phone"];
        $username="";
        if($phone!=""){
            if(strlen($phone) == "11")
            {
                if(!preg_match("/^1[3|4|5|7|8|9][0-9]\\d{8}$/",$phone)){
                    $output = array('event'=>0,'msg'=>'手机号格式错误');
                    exit($this->decodeUnicode(json_encode($output)));
                }
            }else{
                $output = array('event'=>1,'msg'=>"手机号长度错误");
                exit($this->decodeUnicode(json_encode($output)));
            }
            if($_POST["find"]==1){
            }else{
                $count = M("members")->where("user_phone = {$phone}")->count();
                if($count>0){
                    $output = array('event'=>2,'msg'=>'手机号已被使用');
                    exit($this->decodeUnicode(json_encode($output)));
                }
            }

        }else{
            $jwt = $obj["token"];
            $uinfo = $this->decode_token($jwt);

            $uid = $uinfo["ids"];
            $username = $uinfo["nam"];
            $phone = $uinfo["pho"];
        }

        $smsTxt = FS("Dynamic/smstxt");
        $smsTxt = de_xie($smsTxt);
        $code = rand_string(6, 1);
        $datag = get_global_setting();
        $is_manual = $datag['is_manual'];
        if ($is_manual == 0) { // 如果未开启后台人工手机验证，则由系统向会员自动发送手机验证码到会员手机，
            $res = sendsms($phone, str_replace(array("#USERNAME#", "#CODE#"), array($username, $code), $smsTxt['verify_phone']));
            if ($res===true) {
                $str = $this->getPToken($code,$phone);
                $output = array('event'=>88,'msg'=>'发送成功','data'=>$str);
                exit($this->decodeUnicode(json_encode($output)));
            } else{
                $output = array('event'=>90,'msg'=>'发送失败');
                exit($this->decodeUnicode(json_encode($output)));
            }
        }else{
            $output = array('event'=>89,'msg'=>'未开启发送功能');
            exit($this->decodeUnicode(json_encode($output)));
        }

    }

    /**
     * function check_name
     * 检测用户名
     * @access public
     * @param username:用户名
     * @since 1.0
     * @return array(event,msg,data)
     * 返回说明 array(状态，信息，数据)
     */
    public function check_name(){
        $obj = $_POST;
        $name = $obj["user_name"];
        $map["user_name"] = $name;
        $count = M("members")->where($map)->count();
        if($count>0){
            $output = array('event'=>0,'msg'=>'用户名已被使用');
            exit($this->decodeUnicode(json_encode($output)));
        }else{
            $output = array('event'=>88,'msg'=>'用户名可用');
            exit($this->decodeUnicode(json_encode($output)));
        }
    }


    /**
     * function reg
     * 用户注册
     * @access public
     * @param username:用户名 非必填
     * @param phone:手机号
     * @param pwd:密码（MD5）
     * @param code:手机验证码
     * @param verify_code:校验字串
     * @since 1.0
     * @return array(event,msg,data)
     * 返回说明 array(状态，信息，数据)
     */
    public function reg(){
        $obj = $_POST;
        $user_name = $obj["user_name"];
        $phone = $obj["phone"];
        $pwd = $obj["pwd"];
        $code = $obj["code"];
        $invite_code = $obj["invite_code"];

        if($user_name==""){
            $user_name = $phone;
        }
        $data["user_name"] = $user_name;

        $count = M("members")->where($data)->count();
        if($count>0){
            $output = array('event'=>0,'msg'=>'用户名被使用');
            exit($this->decodeUnicode(json_encode($output)));
        }

        $res = $this->is_PToken($obj['verify_code']);
        if ($res['pcode'] != $code||$res["phone"]!=$phone) {
            $output = array('event'=>1,'msg'=>'验证码错误');
            exit($this->decodeUnicode(json_encode($output)));
        }
        if($res["res"]==0){
            $output = array('event'=>2,'msg'=>'验证码已过期');
            exit($this->decodeUnicode(json_encode($output)));
        }

        $data['user_phone'] = text($phone);
        $data['user_pass'] = $pwd;
        $data['reg_time'] = time();
        $data['reg_ip'] = get_client_ip();
        $data['last_log_time'] = time();
        $data['last_log_ip'] = get_client_ip();
        if($invite_code != ''){
            $invite = M("members")->where("user_name =".$invite_code)->find();
            $data['recommend_id'] = $invite['id'];
            $data['recommend_time'] = time();
        }
        if($invite_code!=''){
            //$invite = extra_decode($invite_code,10);
            
            if($invite==0){
                $output = array('event'=>0,'msg'=>'推荐人不存在');
                exit($this->decodeUnicode(json_encode($output)));
            }
        }

        //            $data['recommend_id'] = $obj["invitecode"]!=""?extra_decode($obj["invitecode"],16):0;
        //            $data['recommend_time'] = $obj["invitecode"]!=""?time():0;
        $newid = M('members')->add($data);
        if ($newid) {
            $updata['cell_phone'] = text($phone);
            $b = M("member_info")->where("uid = {$newid}")->count('uid');
            if ($b == 1) {
                M("member_info")->where("uid={$newid}")->save($updata);
            } else {
                $updata['uid'] = $newid;
                $updata['cell_phone'] = text($obj["phone"]);
                $updata['email_status'] = 0;
                M("member_info")->add($updata);
            }
            unset($updata['cell_phone']);
            $updata['phone_status'] =1;
            $updata['uid'] = $newid;
            M('members_status')->add($updata);

            $token =array();
            $token["name"] = $user_name;
            $token["phone"] = $phone;
            $token["id"] = $newid;
            $token["valp"] = 14;


            $str = $this->create_token($token);

            setMemberStatus($newid, 'phone', 1, 10, '手机');
            //recommend_person($newid,$invite_code);
            $output = array('event'=>88,'msg'=>'注册成功','data'=>$str);
            exit($this->decodeUnicode(json_encode($output)));
        }else{
            $output = array('event'=>90,'msg'=>'注册失败');
            exit($this->decodeUnicode(json_encode($output)));
        }

    }
    /**
     * function member
     * 账户中心首页
     * @access public
     * @param token:用户名
     * @since 1.0
     * @return array(event,msg,data)
     * 返回说明 array(状态，信息，数据)
     */
    public function member(){
        $obj = $_POST;
        $jwt = $obj["token"];
        $uinfo = $this->decode_token($jwt);

        $uid = $uinfo["ids"];
        $uname = $uinfo["nam"];
        $uphone = $uinfo["pho"];

        $count = M("member_money")->where("uid = {$uid}")->count();
        if($count==0){
            M("member_money")->add(array("uid=>{$uid}","account_money"=>0,"back_money"=>0,"money_freeze"=>0));
        }

        $pre = C('DB_PREFIX');
        $map['m.id'] = $uid;
        $field="m.id,m.user_name,m.user_phone,
                    mm.account_money,mm.back_money,mm.money_freeze,mm.money_collect,
                    m.credits,m.integral,m.pin_pass,
                    m.user_leve,m.time_limit,mi.real_name,mi.idcard";
        $vm = M('members m')
            ->join("{$pre}member_money mm on mm.uid = m.id")
            ->join("{$pre}member_info mi on mi.uid = m.id")
            ->field($field)
            ->where($map)
            ->find();
        $data["header_img"] = "http://".$_SERVER['HTTP_HOST'].get_avatar($vm['id']);
        $data['user_name'] = $uname;
        $data['user_phone'] = hidecard($uphone,5);
        $data['real_name'] = $vm['real_name'];
        $data['idcard'] = $vm['idcard'];
        $data['all_money'] = floatval($vm["account_money"]+$vm["back_money"]+$vm["money_freeze"]+$vm["money_collect"]);
        $data['balance_money'] = floatval($vm["account_money"]+$vm["back_money"]);
        $data['freeze_money'] = floatval($vm['money_freeze']);
        //代收利息

        $interest_collection = M('investor_detail')
            ->field('sum(interest) as interest, sum(capital) as capital,sum(interest_fee) as fee')
            ->where("investor_uid={$uid} and status in (6,7)")
            ->find();
        $transfer_interest_collection = M('transfer_investor_detail')
            ->field('sum(interest) as interest, sum(capital) as capital,sum(interest_fee) as fee')
            ->where("investor_uid={$uid} and status = 7")
            ->find();
        $lixi = $interest_collection['interest'] - $interest_collection['fee'] + $transfer_interest_collection['interest'] - $transfer_interest_collection['fee']; //dai shou ben xi


       /*  $data['collect_interest'] = floatval($lixi); */
        $benefit = get_personal_benefit($uid);
        $data['collect_interest'] = floatval($benefit['capital_collection'])+floatval($benefit['interest_collection']);
        $data['credit_lvl'] = $this->getLeveIco($vm["credits"]);
        $data['invest_lvl'] = $this->getInvestLeveIco($vm["integral"]);

        $data['id_status'] = intval(M("members_status")->getFieldByUid($uid,"id_status"));
        $data['phone_status'] = intval(M("members_status")->getFieldByUid($uid,"phone_status"));
        $data['email_status'] = intval(M("members_status")->getFieldByUid($uid,"email_status"));
        $data['has_pin'] = $vm["pin_pass"]==""?0:1;
        $data['vip'] = $vm["user_leve"]==0?0:(time()<$vm["time_limit"]?1:2);
        /**
         * 邀请码
         */
        $data['invite_code'] = extra_encode($uid,10);
        $count = M("inner_msg")->where("uid = {$uid} and status = 0")->count();
        $data['msg_count'] = $count;

        $output = array('event'=>88,'msg'=>'success','data'=>$data);
        exit($this->decodeUnicode(json_encode($output)));

    }

    /**
     * function borrow_list
     * 散标列表
     * @access public
     * @param page:页码
     * @param pagesize:每页记录数
     * @since 1.0
     * @return array(event,msg,data,currentPage,pageSize,maxCount,maxPage)
     * 返回说明 array(状态，信息，数据，当前页，每页记录数，总条数，最大页数)
     */
    public function borrow_list(){
        $map["b.borrow_status"] = array("in",array(2,4,6,7,9));
        $count = M("borrow_info b")->where($map)->count();
		$lists = M("borrow_info")->where($map)->select();
        $output = array();
        if($count==0){
            $output["event"]=0;
            $output["msg"]="尚未发布借款";
        }else{
            $pre = C('DB_PREFIX');
            $obj = $_POST;
            $borrow_config = require C("APP_ROOT")."Conf/borrow_config.php";
            $page = $obj['page']==""?1:$obj['page'];
            $pagesize = $obj['pagesize']==""?6:$obj['pagesize'];
			//利率正序：1    利率倒序：2  期限正序：3  期限倒序：4   默认：5
			$rank = $obj['rank'];
			if($rank == '1'){		//利率正序
				$rank_order = 'b.borrow_interest_rate asc';
			}elseif($rank == '2'){	//利率倒序
				$rank_order = 'b.borrow_interest_rate desc';
			}elseif($rank == '3'){	//期限正序
				$rank_order = 'repayment_type asc,b.borrow_duration asc';
			}elseif($rank == '4'){	//期限倒序
				$rank_order = 'repayment_type desc,b.borrow_duration desc';
			}else{					//默认
				$rank_order = 'b.borrow_status asc,b.id DESC';
			}
			//筛选功能
			//利率
			$interest_rate = $obj['interest_rate'];
			if(!empty($interest_rate)){
				if($interest_rate == 'max'){
					$map["b.borrow_interest_rate"] = array('GT',12);
				}else{
					$map["b.borrow_interest_rate"] = array('EGT',$interest_rate);
				}
			}
			//期限
			$deadline = $obj['deadline'];
			if(!empty($deadline)){
				if($deadline == 't'){
                    //$map["b.borrow_duration"] = array('ELT',$interest_rate);
					$map["b.repayment_type"] = array('EQ','1');
				}else{
                    $map["b.repayment_type"] = array('EQ','2');
					$map["b.borrow_duration"] = array('EGT',$deadline);
				}
			}
			//最小金额投资
			$small_money = $obj['small_money'];
			if(!empty($small_money)){
				if($small_money == 'max'){
					$map["b.borrow_min"] = array('GT',1000);
				}else{
					$map["b.borrow_min"] = array('EGT',$small_money);
				}
			}

            $page_start = $pagesize*($page-1);
            $limit = "$page_start,$pagesize";
            $list = M("borrow_info b")
                ->field("b.id,b.borrow_name,
                    b.borrow_duration,b.borrow_money,b.has_borrow,
                    b.borrow_interest_rate,b.borrow_status,
                    b.borrow_type,b.reward_num,b.password,
                    m.credits,b.collect_time,b.updata,b.is_new,(if(b.repayment_type=1,'1','2')) as repayment_type")
                ->join("{$pre}members m on m.id = b.borrow_uid")
                ->where($map)
                ->order($rank_order)
                ->limit($limit)
                ->select();
            $counts = M("borrow_info b")->where($map)->count();
            foreach($list as $k => $v){
                $list[$k]['borrow_name'] = getborrowclass($v["id"]).$v["borrow_name"];
                $list[$k]['id'] = intval($v["id"]);
                $list[$k]['borrow_interest_rate'] = floatval($v["borrow_interest_rate"]);
                $list[$k]['borrow_money'] = floatval($v['borrow_money']);
                $list[$k]['has_borrow'] = floatval($v['has_borrow']);
                $list[$k]['borrow_status']=intval($v['borrow_status']);
                $list[$k]['repayment_type']=$borrow_config["REPAYMENT_TYPE"][$v['repayment_type']];
                $list[$k]['repayment_types'] = $v['repayment_type'];
                $list[$k]['credits']=intval($v['credits']);
                $list[$k]['level'] = $this->getLeveIco($v['credits']);
                $list[$k]['borrow_type']=$borrow_config["BORROW_TYPE"][$v['borrow_type']];
                $list[$k]["borrow_duration"] .= $v["repayment_type"]==1?"天":"个月";
                $list[$k]['progress'] = round(100*$v['has_borrow']/$v['borrow_money'],2);
                $list[$k]['has_pass'] = $v['password'] != '' ? 1 : 0;
                $list[$k]['is_new'] = $v['is_new'] == 1 ? 1 : 0;
                unset($list[$k]['password']);
            }
            $currentPage = intval($page);
            $pageSize = intval($pagesize);
            $maxCount = intval($counts);
            $maxPage = ceil($counts/$pagesize);
            $output["event"]=88;
            $output["msg"]="success";
            $output["data"]=$list;
            $output["currentPage"]=$currentPage;
            $output["pageSize"]=$pageSize;
            $output["maxCount"]=$maxCount;
            $output["maxPage"]=$maxPage;
        }
        exit($this->decodeUnicode(json_encode($output)));
    }

    /**
     * function borrow_detail
     * 散标详情
     * @access public
     * @since 1.0
     * @return array(event,msg,data)
     * 返回说明 array(状态，信息，数据)
     */
    public function borrow_detail(){

        $obj=$_POST;

        $map["id"] = $obj["id"];
        $output = array();
        $borrow_config = require C("APP_ROOT")."Conf/borrow_config.php";
        $fields = "id,borrow_name,borrow_duration,borrow_money,borrow_interest_rate,
        has_borrow,borrow_times,repayment_type,borrow_type,borrow_status,add_time,
        collect_day,borrow_info,reward_num,borrow_min,borrow_max,password,
        is_new,updata,money_collect,collect_time";
        $binfo = M("borrow_info")->field($fields)->where($map)->find();

        $binfo['id']=intval($binfo['id']);
        $binfo['borrow_name'] = getborrowclass($binfo['id']).$binfo['borrow_name'];
        $binfo["borrow_duration"] .= $binfo["repayment_type"]==1?"天":"个月";
        $binfo['borrow_money'] = floatval($binfo['borrow_money']);
        $binfo['borrow_interest_rate']=floatval($binfo['borrow_interest_rate']);
        $binfo['has_borrow']=floatval($binfo['has_borrow']);
        $binfo['borrow_times']=intval($binfo['borrow_times']);
        $binfo['repayment_type']=$borrow_config["REPAYMENT_TYPE"][$binfo['repayment_type']];
        $binfo['borrow_type']=$borrow_config["BORROW_TYPE"][$binfo['borrow_type']];
        $binfo['borrow_status_str']=$borrow_config["BORROW_STATUS_SHOW"][$binfo['borrow_status']];
        $binfo['borrow_status']=intval($binfo['borrow_status']);
        $binfo['add_time']=date("Y-m-d H:i",$binfo['add_time']);
        $binfo['collect_day']=intval($binfo['collect_day']);
        $binfo['reward_num']=floatval($binfo['reward_num']);
        $binfo['borrow_min']=floatval($binfo['borrow_min']);
        $binfo['borrow_max']=floatval($binfo['borrow_max']);
        $binfo['has_pass']=$binfo['password']==""?0:1;
        unset($binfo['password']);
        $binfo['is_new']=$binfo['is_new']==1?1:0;
        $binfo['money_collect']=floatval($binfo['money_collect']);
        $binfo['updata']=unserialize($binfo['updata']);
        $binfo['progress'] = round(100*$binfo['has_borrow']/$binfo['borrow_money'],2);
        $binfo["borrow_info"] = str_replace("/Static","http://".$_SERVER['HTTP_HOST']."/Static",$binfo["borrow_info"]);
        $binfo['borrow_bid'] = intval($binfo['borrow_bid']);
        //$binfo['collect_time_day'] = $binfo['collect_time']/60/60*24+1;
        if(is_array($binfo)){
            $output["event"]=88;
            $output["msg"]="success";
            $output["data"]=$binfo;
        }else{
            $output["event"]=0;
            $output["msg"]="查询错误";
        }
        exit($this->decodeUnicode(json_encode($output)));
    }

    /**
     * 散标还款计划
     */
    public function repayment_plan(){
        $obj=$_POST;
        $map["borrow_id"] = $obj["borrow_id"];
        $map["status"] =array('neq', 0);
        $repay_list = M("investor_detail")->field("sum(capital) as capital,sum(interest) as interest,deadline")
            ->where($map)->group("sort_order")->select();
        foreach($repay_list as $k=> $v){
            $repay_list[$k]['deadline'] = date('Y-m-d',$v['deadline']);
        }
        $output["event"]=is_array($repay_list)?88:0;
        $output["msg"]=is_array($repay_list)?"success":"暂无数据";
        $output["data"]=$repay_list;
        exit($this->decodeUnicode(json_encode($output)));
    }

    /**
     * function transfer_list
     * 优计划列表
     * @access public
     * @param page:页码
     * @param pagesize:每页记录数
     * @since 1.0
     * @return array(event,msg,data,currentPage,pageSize,maxCount,maxPage)
     * 返回说明 array(状态，信息，数据，当前页，每页记录数，总条数，最大页数)
     */
    public function transfer_list(){
        $map["borrow_status"] = array("in",array(2,7));
        $count = M("transfer_borrow_info")->where($map)->count();
        $output = array();
        
        $map['is_jijin']=1;
        $map['on_off']=1;
        $map['online_time']=array("lt",time()+300);
       
        
        
        if($count==0){
            $output["event"]=0;
            $output["msg"]="尚未发布优计划";
        }else{
            $obj = $_POST;
            $page = $obj['page']==""?1:$obj['page'];
            $pagesize = $obj['pagesize']==""?6:$obj['pagesize'];
            $page_start = $pagesize*($page-1);
            $limit = "$page_start,$pagesize";


            //利率正序：1    利率倒序：2  期限正序：3  期限倒序：4   默认：5
			$rank = $obj['rank'];
			if($rank == '1'){		//利率正序
				$rank_order = 'borrow_interest_rate asc';
			}elseif($rank == '2'){	//利率倒序
				$rank_order = 'borrow_interest_rate desc';
			}elseif($rank == '3'){	//期限正序
				$rank_order = 'borrow_duration asc';
			}elseif($rank == '4'){	//期限倒序
				$rank_order = 'borrow_duration desc';
			}else{					//默认
				$rank_order = 'borrow_status asc,id DESC';
                $rank_order = 'is_show desc,borrow_status ASC,borrow_duration ASC,online_time desc';
			}
			//筛选功能
			//利率
			$interest_rate = $obj['interest_rate'];
			if(!empty($interest_rate)){
				if($interest_rate == 'max'){
					$map["borrow_interest_rate"] = array('GT',12);
				}else{
					$map["borrow_interest_rate"] = array('EGT',$interest_rate);
				}
			}
			//期限
			$deadline = $obj['deadline'];
			if(!empty($deadline)){

					$map["borrow_duration"] = array('EGT',$deadline);
				
			}
			//最小金额投资
			$small_money = $obj['small_money'];
			if(!empty($small_money)){
				if($small_money == 'max'){
					$map["per_transfer"] = array('GT',1000);
				}else{
					$map["per_transfer"] = array('EGT',$small_money);
				}
			}





            $list = M("transfer_borrow_info")
                ->field("id,borrow_name,transfer_out,transfer_total,per_transfer,
                    borrow_duration,borrow_money,
                    borrow_interest_rate,borrow_status,online_time")
                ->where($map)
                ->order($rank_order)
                ->limit($limit)
                ->select();
            $counts = M("transfer_borrow_info")->where($map)->count();
            foreach($list as $k => $v){
                $list[$k]['id'] = intval($v["id"]);
                $list[$k]['borrow_interest_rate'] = floatval($v["borrow_interest_rate"]);
                $list[$k]['borrow_money'] = floatval($v['borrow_money']);
                $list[$k]['transfer_out']=intval($v['transfer_out']);
                $list[$k]['transfer_total']=intval($v['transfer_total']);
                $list[$k]['per_transfer']=intval($v['per_transfer']);
                $list[$k]["borrow_duration"] .= $v["repayment_type"]==1?"天":"个月";
                $list[$k]['borrow_status']=intval($v['borrow_status']);
                $list[$k]['progress'] = round(100*$v['transfer_out']/$v['transfer_total'],2);
                if($v['online_time'] > time() && $v['transfer_out']-$v['transfer_total'] != 0)
                    $list[$k]['online_type'] = 1;
                else
                    $list[$k]['online_type'] = 0;
            }
            $currentPage = intval($page);
            $pageSize = intval($pagesize);
            $maxCount = intval($counts);
            $maxPage = ceil($counts/$pagesize);
            $output["event"]=88;
            $output["msg"]="success";
            $output["data"]=$list;
            $output["currentPage"]=$currentPage;
            $output["pageSize"]=$pageSize;
            $output["maxCount"]=$maxCount;
            $output["maxPage"]=$maxPage;
        }
        exit($this->decodeUnicode(json_encode($output)));
    }

    /**
     * function transfer_detail
     * 优计划详情
     * @access public
     * @since 1.0
     * @return array(event,msg,data)
     * 返回说明 array(状态，信息，数据)
     */
    public function transfer_detail(){

        $obj=$_POST;
        $map["id"] = $obj["id"];
        $output = array();
        $fields = "id,borrow_name,borrow_duration,borrow_money,borrow_interest_rate,
        borrow_status,transfer_out,transfer_total,per_transfer,add_time,borrow_info,
        is_show,borrow_max,borrow_min,online_time";
        $binfo = M("transfer_borrow_info")->field($fields)->where($map)->find();

        
        
            
            
            
        if($binfo['online_time'] > time() && $binfo['transfer_out']-$binfo['transfer_total'] != 0){
            $binfo['immediately'] =1;
        }else{
            $binfo['immediately'] =0;
        }
        $binfo["id"] = intval($binfo["id"]);
        $binfo["borrow_duration"] .= $binfo["repayment_type"]==1?"天":"个月";
        $binfo['borrow_money'] = floatval($binfo['borrow_money']);
        $binfo['borrow_interest_rate'] = floatval($binfo['borrow_interest_rate']);
        $binfo['borrow_status']=intval($binfo['borrow_status']);
        $binfo['transfer_out']=intval($binfo['transfer_out']);
        $binfo['transfer_total']=intval($binfo['transfer_total']);
        $binfo['per_transfer']=intval($binfo['per_transfer']);
        $binfo['add_time']=date("Y-m-d H:i",$binfo['add_time']);
        
        $binfo['online_time']=date("Y-m-d H:i",$binfo['online_time']);
        $binfo['is_show']=intval($binfo['is_show']);
        //$binfo['borrow_max']=$binfo['borrow_max']==0?intval($binfo['transfer_total']-$binfo['transfer_out']):intval($binfo['borrow_max']);
        //$binfo['borrow_max']=($binfo['transfer_total']-$binfo['transfer_out']-$binfo['borrow_max'])<0?intval($binfo['transfer_total']-$binfo['transfer_out']):intval($binfo['borrow_max']);
        $binfo['borrow_min']=$binfo['borrow_min']==0?1:intval($binfo['borrow_min']);
        $binfo['progress'] = round(100*$binfo['transfer_out']/$binfo['transfer_total'],2);
       
        if(is_array($binfo)){
            $output["event"]=88;
            $output["msg"]="success";
            $output["data"]=$binfo;
        }else{
            $output["event"]=0;
            $output["msg"]="查询错误";
        }
        exit($this->decodeUnicode(json_encode($output)));
    }

    /**
     * function debt_list
     * 债权转让列表
     * @access public
     * @since 1.0
     * @return array(event,msg,data,currentPage,pageSize,maxCount,maxPage)
     * 返回说明 array(状态，信息，数据，当前页，每页记录数，总条数，最大页数)
     */

    public function debt_list(){
        $pre = C('DB_PREFIX');
        $obj=$_POST;
        $page = $obj['page']==""?1:$obj['page'];
        $pagesize = $obj['pagesize']==""?5:$obj['pagesize'];
        $page_start = $pagesize*($page-1);
        $output = array();
        $limit = "$page_start,$pagesize";
        $map = array();
        $map['b.borrow_status']=array("in","2,4,6,7");
        $map['d.status']=array("in","2,4");
        $count = M("invest_debt d")
            ->join("{$pre}borrow_investor i ON d.invest_id=i.id")
            ->join("{$pre}borrow_info b ON i.borrow_id = b.id")
            ->where($map)
            ->count();
        if($count==0){
            $output["event"]=0;
            $output["msg"]="暂无债权转让";
        }else{
            $borrow_config = require C("APP_ROOT")."Conf/borrow_config.php";
            $field = "d.transfer_price, d.status, d.money, d.total_period,
                        d.period, d.valid, d.id as debt_id, i.deadline, b.borrow_name,b.borrow_type,
                        b.borrow_interest_rate,b.borrow_status,b.borrow_duration,b.repayment_type,
                        m.credits as credits,mb.credits as creditsb";
            $list = M("invest_debt d")
                ->join("{$pre}borrow_investor i ON d.invest_id=i.id")
                ->join("{$pre}borrow_info b ON i.borrow_id = b.id")
                ->join("{$pre}members m ON i.investor_uid=m.id")
                ->join("{$pre}members mb ON i.borrow_uid=mb.id")
                ->field($field)
                ->where($map)
                ->limit($limit)
                ->order("d.status asc")
                ->select();
            foreach($list as $k =>$v){
                $list[$k]['transfer_price'] = floatval($v["transfer_price"]);
                $list[$k]['status'] = intval($v["status"]);
                $list[$k]['money'] = floatval($v["money"]);
                $list[$k]['total_period'] = intval($v["total_period"]);
                $list[$k]['period'] = intval($v["period"]);
                $list[$k]['valid'] = date("Y-m-d H:i",$v["valid"]);
                $list[$k]['debt_id'] = intval($v["debt_id"]);
                $list[$k]['deadline'] = date("Y-m-d H:i",$v["deadline"]);
                $list[$k]['borrow_type'] = $borrow_config["BORROW_TYPE"][$v["borrow_type"]];
                $list[$k]['borrow_interest_rate'] = floatval($v["borrow_interest_rate"]);
                $list[$k]['borrow_status'] = intval($v["borrow_status"]);
                $list[$k]['borrow_duration'] .= $v["repayment_type"]==1?"天":"个月";
                $list[$k]['credits'] = intval($v["credits"]);//转让人信用等级
                $list[$k]['creditsb'] = intval($v["creditsb"]);//借款人信用等级
                $list[$k]['level'] = $this->getLeveIco($v['credits']);//借款人信用等级
                $list[$k]['levelb'] = $this->getLeveIco($v['creditsb']);//借款人信用等级
                unset($list[$k]['repayment_type']);
            }
            $currentPage = intval($page);
            $pageSize = intval($pagesize);
            $maxCount = intval($count);
            $maxPage = ceil($count/$pagesize);
            $output["event"]=88;
            $output["msg"]="success";
            $output["data"]=$list;
            $output["currentPage"]=$currentPage;
            $output["pageSize"]=$pageSize;
            $output["maxCount"]=$maxCount;
            $output["maxPage"]=$maxPage;
        }

        exit($this->decodeUnicode(json_encode($output)));
    }
    /**
     * function debt_detail
     * 债权详情
     * @access public
     * @params debt_id(债权id)
     * @since 1.0
     * @return array(event,msg,data)
     * 返回说明 array(状态，信息，数据)
     */
    public function debt_detail(){
        $pre = C('DB_PREFIX');

        $obj = $_POST;
        $id = intval($obj['debt_id']);
        $map['d.id']=$id;
        $vo = M("invest_debt d")
            ->field("b.borrow_interest_rate as rate,
            d.transfer_price,d.money,d.valid,d.period,
            d.total_period,m1.credits,bi.deadline,
            ms.id_status,m1.user_phone as invest_user,m2.user_phone as borrow_user,ms.phone_status,d.status,
            ms.email_status,b.borrow_name as debt_name,b.borrow_info,bi.id as invest_id")
            ->join("{$pre}borrow_investor bi on bi.id = d.invest_id")
            ->join("{$pre}borrow_info b on b.id = bi.borrow_id")
            ->join("{$pre}members m1 on m1.id = bi.investor_uid")
            ->join("{$pre}members m2 on m2.id = b.borrow_uid")
            ->join("{$pre}members_status ms on ms.uid = m2.id")
            ->join("{$pre}member_info mi on mi.uid = m2.id")
            ->where($map)->find();
        $vo["rate"] = floatval($vo["rate"]);
        $vo["transfer_price"] = floatval($vo["transfer_price"]);
        $vo["money"] = floatval($vo["money"]);
        $vo["valid"] = date("Y-m-d H:i",$vo["valid"]);
        $vo["period"] = intval($vo["period"]);
        $vo["total_period"] = intval($vo["total_period"]);
        $vo["credits"] = intval($vo["credits"]);
        $vo["id_status"] = intval($vo["id_status"]);
        $vo["phone_status"] = intval($vo["phone_status"]);
        $vo["status"] = intval($vo["status"]);
        $vo["invest_id"] = intval($vo["invest_id"]);
        $vo["email_status"] = intval($vo["email_status"]);
        $vo['invest_user'] = hidecard($vo['invest_user'],2);
        $vo['borrow_user'] = hidecard($vo['borrow_user'],2);
        $vo['level'] = $this->getLeveIco($vo['credits']);
        $vo["borrow_info"] = str_replace("/Static","http://".$_SERVER['HTTP_HOST']."/Static",$vo["borrow_info"]);
        $vo['deadline']=date("Y-m-d",$vo['deadline']);
        $bconf = get_bconf_setting();
        $vo['borrow_use'] = $bconf['BORROW_USE'][$vo['borrow_use']];

        if(is_array($vo)){
            $output["event"]=88;
            $output["msg"]="success";
            $output["data"]=$vo;
        }else{
            $output["event"]=0;
            $output["msg"]="查询错误";
        }
        exit($this->decodeUnicode(json_encode($output)));
    }



    /**
     * function borrow_invest_list
     * 散标购买记录
     * @access public
     * @since 1.0
     * @return array(event,msg,data,currentPage,pageSize,maxCount,maxPage)
     * 返回说明 array(状态，信息，数据，当前页，每页记录数，总条数，最大页数)
     */
    public function borrow_invest_list(){
        $obj=$_POST;
        $pre = C('DB_PREFIX');
        $id = $obj['id'];
        $count = M("borrow_investor")->where("borrow_id={$id}")->count("id");
        if($count==0){
            $output["event"]=0;
            $output["msg"]="暂无投标记录";
        }else{
            $pagesize = $obj['pagesize']==""?10:$obj['pagesize'];
            $page = $obj['page']==""?1:$obj['page'];
            $page_start = $pagesize*($page-1);
            $page_end = $pagesize;
            $limit = "$page_start,$page_end";
            $field = "b.investor_capital, b.add_time, b.is_auto, m.user_name,i.id";
            $list = M("borrow_investor as b")
                ->join("{$pre}members as m on  b.investor_uid = m.id")
                ->join("{$pre}borrow_info as i on  b.borrow_id = i.id")
                ->field($field)
                ->where('b.borrow_id='.$id)
                ->order('b.id')
                ->limit($limit)
                ->select();
            foreach ($list as $k=>$v) {
                $list[$k]['investor_capital'] = floatval($v["investor_capital"]);
                $list[$k]['add_time'] = date("Y-m-d H:i",$v["add_time"]);
                $list[$k]['user_name'] = hidecard($v['user_name'],5);
                $list[$k]['is_auto'] = $v['is_auto']?'自动':'手动';
                $list[$k]['id'] = intval($v["id"]);
            }
            $currentPage = intval($page);
            $pageSize = intval($pagesize);
            $maxCount = intval($count);
            $maxPage = ceil($count/$pagesize);
            $output["event"]=88;
            $output["msg"]="success";
            $output["data"]=$list;
            $output["currentPage"]=$currentPage;
            $output["pageSize"]=$pageSize;
            $output["maxCount"]=$maxCount;
            $output["maxPage"]=$maxPage;
        }

        exit($this->decodeUnicode(json_encode($output)));

    }

    /**
     * function transfer_invest_list
     * 优计划购买记录
     * @access public
     * @since 1.0
     * @return array(event,msg,data,currentPage,pageSize,maxCount,maxPage)
     * 返回说明 array(状态，信息，数据，当前页，每页记录数，总条数，最大页数)
     */
    public function transfer_invest_list(){
        $obj = $_POST;
        $pre = C('DB_PREFIX');
        $id = $obj['id'];


        $count = M("transfer_borrow_investor")->where("borrow_id={$id}")->count("id");

        if($count==0){
            $output["event"]=0;
            $output["msg"]="暂无投标记录";
        }else{
            $pagesize = $obj['pagesize']==""?10:$obj['pagesize'];
            $page = $obj['page']==""?1:$obj['page'];
            $page_start = $pagesize*($page-1);
            $page_end = $pagesize;
            $limit = "$page_start,$page_end";
            $field = " b.investor_capital,b.add_time, b.is_auto, m.user_name,i.id";
            $list = M("transfer_borrow_investor as b")
                ->join("{$pre}members as m on  b.investor_uid = m.id")
                ->join("{$pre}transfer_borrow_info as i on  b.borrow_id = i.id")
                ->field($field)
                ->where('b.borrow_id='.$id)
                ->order('b.id desc')
                ->limit($limit)
                ->select();

            foreach ($list as $k=>$v) {
                $list[$k]['investor_capital'] = floatval($v["investor_capital"]);
                $list[$k]['add_time'] = date("Y-m-d H:i",$v["add_time"]);
                $list[$k]['user_name'] = hidecard($v['user_name'],5);
                $list[$k]['is_auto'] = $v['is_auto']?'自动':'手动';
                $list[$k]['id'] = intval($v["id"]);

            }
            $currentPage = intval($page);
            $pageSize = intval($pagesize);
            $maxCount = intval($count);
            $maxPage = ceil($count/$pagesize);
            $output["event"]=88;
            $output["msg"]="success";
            $output["data"]=$list;
            $output["currentPage"]=$currentPage;
            $output["pageSize"]=$pageSize;
            $output["maxCount"]=$maxCount;
            $output["maxPage"]=$maxPage;
        }



        exit($this->decodeUnicode(json_encode($output)));

    }

    /**
     * function invest_money
     * 散标投资
     * @access public
     * @param token,money,borrow_id,pin,password,coupon_id
     * 参数说明 token,投资金额,标的id,用户支付密码,定向标密码,加息券编号
     * @since 1.0
     * @return array(event,msg)
     * 返回说明 array(状态，信息)
     */

    public function invest_money(){
        $obj = $_POST;
        $jwt = $obj["token"];
        $uinfo = $this->decode_token($jwt);
        $uid = $uinfo["ids"];
        $cid = $obj['coupon_id'];
        //$interest_id = $obj['interest_id'];
        $money = $obj['money'];
        $borrow_id = $obj['borrow_id'];
        $pin = $obj['pin'];
        $binfo = M("borrow_info")->where("id={$borrow_id}")->find();
        $data['id'] = $uid;
        $user = M("members")->where($data)->find();
        $money_info = getMinfo($uid,'m.pin_pass,mm.account_money,mm.back_money,mm.money_collect');
        $pin_pass = $money_info['pin_pass'];

        if($pin_pass == ""){
            $output["event"] = 1;
            $output["msg"] = "尚未设置支付密码";
            exit($this->decodeUnicode(json_encode($output)));
        }
		$pre = C('DB_PREFIX');
		$coupon = M("interestratecoupon_detail d")
            ->join("{$pre}interestratecoupon i on i.id=d.cid")
            ->where(array("d.id"=>$cid))
            ->find();
		if($money < $coupon['min_invest_money']){
            $output["event"] = 0;
            $output["msg"] = "投资金额不能少于加息券最小金额";
            exit($this->decodeUnicode(json_encode($output)));
        }
        if($uid == $binfo['borrow_uid']){
            $output["event"] = 0;
            $output["msg"] = "不能投自己的标";
            exit($this->decodeUnicode(json_encode($output)));
        }
        if($binfo["borrow_status"]!=2){
            $output["event"] = 0;
            $output["msg"] = "投标错误";
            exit($this->decodeUnicode(json_encode($output)));
        }
        if($money-$money_info['back_money']-$money_info['account_money']>0){
            $output["event"] = 2;
            $output["msg"] = "余额不足";
            exit($this->decodeUnicode(json_encode($output)));
        }
        if(!empty($binfo['password'])){
            if(empty($obj['borrow_pass'])){
                $output["event"] = 0;
                $output["msg"] = "请输入定向标密码";
                exit($this->decodeUnicode(json_encode($output)));
            }
            else if($binfo['password']<>md5($obj['borrow_pass'])){
                $output["event"] = 0;
                $output["msg"] = "定向标密码错误";
                exit($this->decodeUnicode(json_encode($output)));
            }
        }
        if($pin!=$pin_pass){
            $output["event"] = 0;
            $output["msg"] = "支付密码错误";
            exit($this->decodeUnicode(json_encode($output)));
        }
        $capital = M('borrow_investor')->where("borrow_id={$borrow_id} AND investor_uid={$user['id']}")->sum('investor_capital');
        if(($capital+$money)>$binfo['borrow_max']&&$binfo['borrow_max']>0){
            $output["event"] = 0;
            $output["msg"] = "您的投标超出投标上限";
            exit($this->decodeUnicode(json_encode($output)));
        }
        $need = $binfo['borrow_money'] - $binfo['has_borrow'];
        $caninvest = $need - $binfo['borrow_min'];
        if( $money>$caninvest && $need==0){
            $output["event"] = 0;
            $output["msg"] = "标已投满";
            exit($this->decodeUnicode(json_encode($output)));
        }
        if($money + $binfo['has_borrow']-$binfo['borrow_money']>0){
            $output["event"] = 0;
            $output["msg"] = "投资金额大于借款剩余";
            exit($this->decodeUnicode(json_encode($output)));
        }
        if($money%$binfo['borrow_min']!=0){
            $output["event"] = 0;
            $output["msg"] = "投资金额应该为最小金额的整数倍";
            exit($this->decodeUnicode(json_encode($output)));
        }
        if(($binfo['borrow_min']-$money)>0){
            $output["event"] = 0;
            $output["msg"] = "投资金额小于最小投资金额";
            exit($this->decodeUnicode(json_encode($output)));
        }
        $binfo = M("borrow_info")->field('borrow_money,is_new,has_borrow,has_vouch,borrow_max,borrow_min,borrow_type,password,money_collect')->find($borrow_id);
        $benefits = get_personal_benefit($uid);
        if($binfo['is_new']==1&&$benefits['count']>0){
            $output["event"] = 0;
            $output["msg"] = "对不起，此标为新手标，只有未投资用户才能投此标！";
            exit($this->decodeUnicode(json_encode($output)));
        }
        if($binfo['money_collect']>0){
            if($money_info['money_collect']<$binfo['money_collect']) {
                $output["event"] = 0;
                $output["msg"] = "投标待收限制:{$binfo['money_collect']}";
                exit($this->decodeUnicode(json_encode($output)));
            }
        }

        $done = investMoney($user['id'],$borrow_id,$money,0,$cid);
        if($done===true) {
            //usecoupon($coupon_id,$borrow_id);
            $output["event"] = 88;
            $output["msg"] = "投资成功";
            exit($this->decodeUnicode(json_encode($output)));
        }else{
            $output["event"] = 90;
            $output["msg"] = "投资失败，请重试";
            exit($this->decodeUnicode(json_encode($output)));
        }
    }
    /**
     * function transfer_invest_money
     * 优计划投资
     * @access public
     * @param token,num,borrow_id,pin,chooseWay
     * 参数说明 token,投资份数,标的id,用户支付密码,还款方式
     * @since 1.0
     * @return array(event,msg)
     * 返回说明 array(状态，信息)
     */
    public function transfer_invest_money(){
        $obj = $_POST;
        $jwt = $obj["token"];
        $uinfo = $this->decode_token($jwt);
        $uid = $uinfo["ids"];
        $uname = $uinfo["nam"];
        $uphone = $uinfo["pho"];
        $output = array();
        $tnum = $obj['num'];
        $borrow_id = $obj['borrow_id'];
        $repayment_type = intval($obj['chooseWay'])==""?4:intval($obj['chooseWay']);
        if($repayment_type !=4 &&$repayment_type !=6){

            $output["event"] = 0;
            $output["msg"] = "参数错误";
            exit($this->decodeUnicode(json_encode($output)));
        }
        $pin = $obj['pin'];
        $binfo = M("transfer_borrow_info")->where("id={$borrow_id}")->find();
        $data['id'] = $uid;
        $user = M("members")->where($data)->find();
        $money_info = getMinfo($user['id'],'m.pin_pass,mm.account_money,mm.back_money,mm.money_collect');
        $amoney = $money_info['account_money']+$money_info['back_money'];
        $pin_pass = $money_info['pin_pass'];
        $month = $binfo['borrow_duration'];
        if($binfo['on_off']!=1){
            $output["event"] = 0;
            $output["msg"] = "参数错误";
            exit($this->decodeUnicode(json_encode($output)));
        }
        if($binfo['online_time'] > time()){
            $output["event"] = 0;
            $output["msg"] = "未到上线时间";
            exit($this->decodeUnicode(json_encode($output)));
        }
        if($uid == $binfo['borrow_uid']){
            $output["event"] = 0;
            $output["msg"] = "不能投自己的标";
            exit($this->decodeUnicode(json_encode($output)));
        }

        if($pin<>$pin_pass){
            $output["event"] = 0;
            $output["msg"] = "支付密码错误";
            exit($this->decodeUnicode(json_encode($output)));
        }
        if($tnum < 1) {
            $output["event"] = 0;
            $output["msg"] = "最少要投1份";
            exit($this->decodeUnicode(json_encode($output)));
        }

        if($binfo['borrow_max'] > 0){
            $havebuy = M("transfer_borrow_investor")->where("investor_uid={$user['id']} and borrow_id={$borrow_id}")->sum("transfer_num");
            if($binfo['borrow_max'] - $tnum - $havebuy<0){
                $output["event"] = 0;
                $output["msg"] = "超出单人购买上限";
                exit($this->decodeUnicode(json_encode($output)));
            }

        }
        $max_num = $binfo['transfer_total'] - $binfo['transfer_out'];
        if($max_num < $tnum){
            $output["event"] = 0;
            $output["msg"] = "购买份数超过标剩余";
            exit($this->decodeUnicode(json_encode($output)));
        }
        $money = $binfo['per_transfer'] * $tnum;
        if($amoney < $money){
            $output["event"] = 1;
            $output["msg"] = "用户余额不足";
            exit($this->decodeUnicode(json_encode($output)));
        }

        $done = TinvestMoney($user['id'],$borrow_id,$tnum,$month,0,$repayment_type);
        if($done===true) {
            $output["event"] = 88;
            $output["msg"] = "投资成功";
            exit($this->decodeUnicode(json_encode($output)));
        }else{
            $output["event"] = 90;
            $output["msg"] = "投资失败";
            exit($this->decodeUnicode(json_encode($output)));
        }


    }

    /**
     * function debt_invest_money
     * 购买债权转让
     * @access public
     * @param token,invest_id,pin
     * 参数说明 token,转让的id,交易密码
     * @since 1.0
     * @return array(event,msg)
     * 返回说明 array(状态，信息)
     */
    public function debt_invest_money(){
        $obj = $_POST;

        $output = array();
        $jwt = $obj["token"];
        $uinfo = $this->decode_token($jwt);

        $uid = $uinfo["ids"];
        $invest_id = intval($obj['invest_id']);
        $paypass = strval($obj['pin']);# 明文

        D("DebtBehavior");
        $Debt = new DebtBehavior($uid);
        // 检测是否可以购买  密码是否正确，余额是否充足
        $result = $Debt->buy($paypass, $invest_id);

        if($result === '购买成功'){
            $output["event"] = 88;
        }else if($result==='不能购买自己发布的债权'){
            $output["event"] = 0;
        }else if($result==='本债权转让已过期'){
            $output["event"] = 0;
        }else if($result==='原借款人不能购买债权'){
            $output["event"] = 0;
        }else if($result==='支付密码错误'){
            $output["event"] = 0;
        }else if($result==='您的账户余额不足'){
            $output["event"] = 1;
        }else{
            $output["event"] = 90;
        }
        $output["msg"] = $result;
        exit($this->decodeUnicode(json_encode($output)));
    }

    /**
     * function verify_id_card
     * 实名认证
     * @access public
     * @param token,real_name,card_no
     * 参数说明 token,姓名,身份证号
     * @since 1.0
     * @return array(event,msg)
     * 返回说明 array(状态，信息)
     */
    public function verify_id_card(){
        $obj = $_POST;
        $pre = C('DB_PREFIX');
        $output = array();
        $jwt = $obj["token"];
        $uinfo = $this->decode_token($jwt);

        $uid = $uinfo["ids"];
        $uname = $uinfo["nam"];
        $uphone = $uinfo["pho"];

        $realname = trim($obj["real_name"]);
        $cardno = trim($obj["card_no"]);
        if (empty($realname) || empty($cardno)){
            $output["event"] = 0;
            $output["msg"] = "姓名或身份证号为空";
            exit($this->decodeUnicode(json_encode($output)));
        }
        $xuid = M('member_info')->getFieldByIdcard($cardno, 'uid');
        if($xuid>0 && $xuid != $uid){
            $output["event"] = 0;
            $output["msg"] = "身份证号被使用";
            exit($this->decodeUnicode(json_encode($output)));
        }
        if(strlen($cardno)!=15&&strlen($cardno)!=18){
            $output["event"] = 0;
            $output["msg"] = "身份证号长度错误";
            exit($this->decodeUnicode(json_encode($output)));
        }
        $b = M('name_apply')->where("uid = {$uid}")->count('uid');
        $data['real_name'] = text($realname);
        $data['idcard'] = text($cardno);
        $data['up_time'] = time();
        $data1['idcard'] = text($cardno);
        $data1['up_time'] = time();
        $data1['uid'] = $uid;
        $data1['status'] = 0;
        if ($b == 1) {
            M('name_apply')->where("uid ={$uid}")->save($data1);
        } else {
            M('name_apply')->add($data1);
        }
        $id5config = FS("Dynamic/id5");
        if($id5config['enable'] == 1){
            $userid = $id5config['USERID'];//userid
            $pass = $id5config['KEY'];//password
            $id5_result = file_get_contents("http://realname.tuanshang.net/Api/api.php?userid={$userid}&password={$pass}&realname={$realname}&idcard={$cardno}",false);
            $result = json_decode($id5_result,true);
            if($result['code']==200){
                $c = M('member_info')->where("uid = {$uid}")->count('uid');
                if ($c == 1) {
                    $newid = M('member_info')->where("uid = {$uid}")->save($data);
                } else {
                    $data['uid'] = $uid;
                    $newid = M('member_info')->add($data);
                }
                if ($newid) {
                    $ms = M('members_status')->where("uid={$uid}")->setField('id_status', 1);
                    if ($ms == 1) {
                        $output["event"] = 88;
                        $output["msg"] = "审核成功";
                        exit($this->decodeUnicode(json_encode($output)));
                    } else {
                        $dt['uid'] = $uid;
                        $dt['id_status'] = 1;
                        M('members_status')->add($dt);
                    }
                    $output["event"] = 88;
                    $output["msg"] = "审核成功";
                    exit($this->decodeUnicode(json_encode($output)));
                } else{
                    $output["event"] = 89;
                    $output["msg"] = "身份证号更新失败";
                    exit($this->decodeUnicode(json_encode($output)));
                }
            }else{
                $output["event"] = 90;
                $output["msg"] = $result['message'];
                exit($this->decodeUnicode(json_encode($output)));
            }
        }
    }
    /**
     * function set_pin_pass
     * 设置/修改交易密码
     * @access public
     * @param token,pin,type
     * 参数说明 token,密码（MD5加密后）,操作类型（1：设置，2：通过原支付密码修改，3：通过手机验证码修改）
     * @since 1.0
     * @return array(event,msg)
     * 返回说明 array(状态，信息)
     */
    public function set_pin_pass(){
        $obj = $_POST;
        $pre = C('DB_PREFIX');
        $output = array();
        $jwt = $obj["token"];
        $uinfo = $this->decode_token($jwt);

        $uid = $uinfo["ids"];
        $uname = $uinfo["nam"];
        $uphone = $uinfo["pho"];

        $pwd = M("members")->getFieldById($uid,"pin_pass");

        $type = $obj["type"];
        $pinpass = trim($obj["pin_pass"]);
        $pinpassnew = trim($obj["pin_pass_new"]);
        if(strlen($pinpassnew)<6){
            $output["event"] = 0;
            $output["msg"] = "新密码长度太短";
            exit($this->decodeUnicode(json_encode($output)));
        }
        if($pinpassnew==$pinpass){
            $output["event"] = 0;
            $output["msg"] = "新密码和原密码相同";
            exit($this->decodeUnicode(json_encode($output)));
        }
        if($type ==1){
        }//设置支付密码
        else if($type == 2){//type ==2,修改支付密码//通过输入原支付密码修改
            $info = M("members")->field("pin_pass,user_pass")->where("id = {$uid}")->find();
            if($info["pin_pass"] !=$pinpass && $info["user_pass"] !=$pinpass){
                $output["event"] = 0;
                $output["msg"] = "原密码错误";
                exit($this->decodeUnicode(json_encode($output)));
            }

        }else if($type==3){//使用手机验证码验证
            $pcode = $obj["code"];
            $verify_code = $obj["verify_code"];

            $res = $this->is_PToken($verify_code);
            if ($res['pcode'] != $pcode || $uphone !=$res["phone"]) {
                $output["event"] = 0;
                $output["msg"] = "验证码错误";
                exit($this->decodeUnicode(json_encode($output)));
            }
            if($res["res"]==0){
                $output["event"] = 0;
                $output["msg"] = "验证码已过期";
                exit($this->decodeUnicode(json_encode($output)));
            }
            if($pinpassnew==$pwd){
                $output["event"] = 0;
                $output["msg"] = "新密码和原密码相同";
                exit($this->decodeUnicode(json_encode($output)));
            }
        }else{
            $output["event"] = 0;
            $output["msg"] = "参数错误";
            exit($this->decodeUnicode(json_encode($output)));
        }
        $data["pin_pass"] = $pinpassnew;
        $res = M("members")->where("id = {$uid}")->save($data);
        if($res){
            $output["event"] = 88;
            $output["msg"] = "设置成功";
            exit($this->decodeUnicode(json_encode($output)));
        }
        $output["event"] = 90;
        $output["msg"] = "设置失败";
        exit($this->decodeUnicode(json_encode($output)));
    }

    /**
     * function change_pwd_by_phone
     * 通过手机验证码找回/修改登录密码
     * @access public
     * @param token,phone,code,verify_code,pwd
     * 参数说明 token,手机号,手机验证码,验证码校验字串,新密码(MD5后)
     * @since 1.0
     * @return array(event,msg)
     * 返回说明 array(状态，信息)
     */


    public function change_pwd_by_phone(){
        $obj = $_POST;
        $pre = C('DB_PREFIX');
        $output = array();
        
        $phone = $obj["phone"];
        $code = $obj['code'];
        $pwd = $obj["pwd"];
        
        if($phone == null){
            $jwt = $obj["token"];
            $uinfo = $this->decode_token($jwt);
            $uid = $uinfo["ids"];
        }
        $verify_code = $obj["verify_code"];

        $res = $this->is_PToken($verify_code);
        if($res["res"]==0){
            $output["event"] = 2;
            $output["msg"] = "验证码已过期";
            exit($this->decodeUnicode(json_encode($output)));
        } 
        
        if($phone!=""){
            $count = M("members")->where("user_phone = {$phone}")->count();
            if ($count==0) {
                $output["event"] = 0;
                $output["msg"] = "系统无此手机号";
                exit($this->decodeUnicode(json_encode($output)));
            }
             if ($res['pcode'] != $code||$res["phone"]!=$phone) {
                $output["event"] = 1;
                $output["msg"] = "验证码错误";
                exit($this->decodeUnicode(json_encode($output)));
            }
        }else{
            $jwt = $obj["token"];
            $uinfo = $this->decode_token($jwt);

            $phone = $uinfo["pho"];
            if ($res['pcode'] != $code||$res["phone"]!=$phone) {
                $output["event"] = 1;
                $output["msg"] = "验证码错误";
                exit($this->decodeUnicode(json_encode($output)));
            }
        }

        $oldpassword = M("members")->where('user_name='.$phone)->find();
        if($oldpassword==$pwd){
            $output["event"] = 0;
            $output["msg"] = "新密码与旧密码相同，请重新输入";
            exit($this->decodeUnicode(json_encode($output)));
        }
        $oldinfo = M("members")->where("user_phone = {$phone}")->find();
        $user_pass = $pwd;

        if($user_pass==$oldinfo["user_pass"]){
            $token =array();
            $token["name"] = $oldinfo["user_name"];
            $token["phone"] = $oldinfo["user_phone"];
            $token["id"] = $oldinfo["id"];
            $token["valp"] = 14;

            $output["data"] = $this->create_token($token);
            $output["event"] = 88;
            $output["msg"] = "更新成功";
            exit($this->decodeUnicode(json_encode($output)));
        }

        $data['user_pass'] = $user_pass;

        $newid = M('members')->where("user_phone = {$phone}")->save($data);

        if ($newid) {
            $token =array();
            $token["name"] = $oldinfo["user_name"];
            $token["phone"] = $oldinfo["user_phone"];
            $token["id"] = $oldinfo["id"];
            $token["valp"] = 14;
            $output["data"] = $this->create_token($token);
            $output["event"] = 88;
            $output["msg"] = "更新成功";
            exit($this->decodeUnicode(json_encode($output)));
        }else{
            $output["event"] = 90;
            $output["msg"] = "更新失败";
            exit($this->decodeUnicode(json_encode($output)));
        }

    }
    
    /**
     * function change_pwd_by_old
     * 通过旧密码修改登录密码
     * @access public
     * @param token,old_pwd,pwd
     * 参数说明 token,旧密码(MD5),新密码(MD5)
     * @since 1.0
     * @return array(event,msg)
     * 返回说明 array(状态，信息)
     */
    public function change_pwd_by_old(){
        $obj = $_POST;
        $pre = C('DB_PREFIX');
        $output = array();
        $jwt = $obj["token"];
        $uinfo = $this->decode_token($jwt);

        $uid = $uinfo["ids"];

        $oldpwd = $obj["old_pwd"];
        $pwd = $obj["pwd"];
        $oldpassword = M("members")->getFieldById($uid,"user_pass");
        if($oldpassword!=$oldpwd){
            $output["event"] = 0;
            $output["msg"] = "原密码输入错误";
            exit($this->decodeUnicode(json_encode($output)));
        }
        if($oldpwd==$pwd){
            $output["event"] = 0;
            $output["msg"] = "新密码与旧密码相同，请重新输入";
            exit($this->decodeUnicode(json_encode($output)));
        }
        $data['id'] = $uid;
        $data['user_pass'] = $pwd;
        $res =M("members")->save($data);

        if ($res!==false) {
            $output["event"] = 88;
            $output["msg"] = "修改成功";
        }else{
            $output["event"] = 90;
            $output["msg"] = "修改失败";

        }
        exit($this->decodeUnicode(json_encode($output)));
    }
    /**
     * function bank_list
     * 银行列表
     * @access public
     * @since 1.0
     * @return array(event,msg)
     * 返回说明 array(状态，信息)
     */
    public function bank_list(){
        $borrowconfig=  require C("ROOT_URL")."Dynamic/borrowconfig.php";
        $data = $borrowconfig['BANK_NAME'];
        $list = array();
        foreach($data as $k=>$v){
            $list[] = array("bank_name"=>$v,"bank"=>$k);
        }
        $output["event"] = 88;
        $output["msg"] = "success";
        $output["data"] = $list;
        exit($this->decodeUnicode(json_encode($output)));
    }
    /**
     * function bank_card_info
     * 用户银行卡信息
     * @access public
     * @param token
     * 参数说明 token
     * @since 1.0
     * @return array(event,msg,data)
     * 返回说明 array(状态，信息)
     */

    public function bank_card_info(){
        $obj = $_POST;
        $pre = C('DB_PREFIX');
        $output = array();
        $jwt = $obj["token"];
        $uinfo = $this->decode_token($jwt);

        $uid = $uinfo["ids"];
        $uname = $uinfo["nam"];
        $uphone = $uinfo["pho"];

        $count = M("member_banks")->where("uid = {$uid}")->count();

        if($count == 0){
            $output["event"] = 0;
            $output["msg"] = "未绑卡";
            exit($this->decodeUnicode(json_encode($output)));
        }
        $info = M("member_banks")
            ->field("uid,bank_num,bank_province,bank_city,bank_address,bank_name,add_time")
            ->where("uid = {$uid}")->find();
        $borrowconfig=  require C("ROOT_URL")."Dynamic/borrowconfig.php";
        $data = $borrowconfig['BANK_NAME'];
        $area=get_Area_list();
        $info["bank_num"] = decode_ts($info['bank_num'],getcode());
        $info["bank_province"] = intval($info["bank_province"]);
        $info["bank_province_str"] = $area[$info["bank_province"]];
        $info["bank_city"] = intval($info["bank_city"]);
        $info["bank_city_str"] = $area[$info["bank_city"]];
        $info["add_time"] = date("Y-m-d H:i",$info["add_time"]);
        $info["bank_name_str"] = $data[$info["bank_name"]];
        $output["event"] = 88;
        $output["msg"] = "success";
        $output["data"] = $info;
        exit($this->decodeUnicode(json_encode($output)));
    }
    /**
     * function bind_bank_card
     * 添加/修改银行卡
     * @access public
     * @param token,card_no,code,verify_code,bank_name,bank_address,province,city
     * 参数说明 token,银行卡号,手机验证码,验证码校验字串,银行编码,支行名,省，市
     * @since 1.0
     * @return array(event,msg)
     * 返回说明 array(状态，信息)
     */
    public function bind_bank_card(){
        $obj = $_POST;
        $output = array();
        $jwt = $obj["token"];
        $uinfo = $this->decode_token($jwt);

        $uid = $uinfo["ids"];
        $uphone = $uinfo["pho"];
        $code = $obj['code'];

        $verify_code = $obj["verify_code"];

       
        
        
        
        
        $res = $this->is_PToken($verify_code);
        if($res["res"]==0){
            $output["event"] = 2;
            $output["msg"] = "验证码已过期";
            exit($this->decodeUnicode(json_encode($output)));
        }
        if ($res['pcode'] != $code||$res["phone"]!=$uphone) {
            $output["event"] = 1;
            $output["msg"] = "验证码错误";
            exit($this->decodeUnicode(json_encode($output)));
        }
        $bank_info = M('member_banks')->field("uid, bank_num")->where("uid= {$uid}")->find();

        $data['uid'] = $uid;
        $data['bank_num'] = encode_ts($obj['card_no'],getcode());
        $data['bank_name'] = $obj['bank_name'];
        $data['bank_address'] = text($obj['bank_address']);
        $data['bank_province'] = intval($obj['province']);
        $data['bank_city'] = intval($obj['city']);
        $data['add_ip'] = get_client_ip();
        $data['add_time'] = time();

        if($bank_info['uid']){
            if(decode_ts($bank_info["bank_num"],getcode())==$obj['card_no']){
                $output["event"] = 0;
                $output["msg"] = "更新失败:新卡与原卡相同";
                exit($this->decodeUnicode(json_encode($output)));
            }
            $newid = M('member_banks')->save($data);
            if($newid){
                $output["event"] = 88;
                $output["msg"] = "修改成功";
                exit($this->decodeUnicode(json_encode($output)));
            }else{
                $output["event"] = 90;
                $output["msg"] = "修改失败";
                exit($this->decodeUnicode(json_encode($output)));
            }
        }else{
            $newid = M('member_banks')->add($data);
            if($newid){
                $output["event"] = 88;
                $output["msg"] = "绑定成功";
                exit($this->decodeUnicode(json_encode($output)));
            }else{
                $output["event"] = 90;
                $output["msg"] = "绑定失败";
                exit($this->decodeUnicode(json_encode($output)));
            }
        }
    }

    /**
     * 省市区对应关系开始
     */
    public function get_area(){
        $list = M("area")->select();
        $output["event"] = 88;
        $output["msg"] = "success";
        $output["data"] = $list;
        exit($this->decodeUnicode(json_encode($output)));

    }
    public function get_province(){
        $list = M("area")->field("id,name")->where("sort_order = 1")->select();
        $output["event"] = 88;
        $output["msg"] = "success";
        $output["data"] = $list;
        exit($this->decodeUnicode(json_encode($output)));
    }
    public function get_city(){
        $obj = $_POST;
        $id = $obj['id'];
        $list = M("area")->field("id,name")->where("reid = {$id}")->select();
        $output["event"] = 88;
        $output["msg"] = "success";
        $output["data"] = $list;
        exit($this->decodeUnicode(json_encode($output)));
    }
    //省市区对应关系开始结束

    /**
     * function inner_msg_list
     * 站内信列表
     * @access public
     * @param token
     * 参数说明 token
     * @since 1.0
     * @return array(event,msg)
     * 返回说明 array(状态，信息)
     */
    public function inner_msg_list(){
        $obj = $_POST;
        $output = array();
        $jwt = $obj["token"];
        $uinfo = $this->decode_token($jwt);

        $uid = $uinfo["ids"];

        $data['id'] = $uid;
        $user = M("members")->where($data)->find();
        $page = $obj['page']==""?1:$obj['page'];
        $pagesize = $obj['pagesize']==""?6:$obj['pagesize'];
        $page_start = $pagesize*($page-1);
        $page_end = $pagesize;
        $limit = "$page_start,$page_end";

        $count = M("inner_msg")->where("uid = {$user['id']}")->count();
        $list = M("inner_msg")
            ->field("msg,send_time,status,title,id")
            ->where("uid = {$user['id']}")->order("id desc")->limit($limit)->select();
        if(is_array($list)){
            foreach($list as $k=>$v){
                $list[$k]["id"] = intval($v["id"]);
                $list[$k]["send_time"] = date("Y-m-d H:i",$v["send_time"]);
                $list[$k]["status"] = intval($v["status"]);
            }
            $currentPage = intval($page);
            $pageSize = intval($pagesize);
            $maxCount = intval($count);
            $maxPage = ceil($count/$pagesize);
            $output["event"]=88;
            $output["msg"]="success";
            $output["data"]=$list;
            $output["currentPage"]=$currentPage;
            $output["pageSize"]=$pageSize;
            $output["maxCount"]=$maxCount;
            $output["maxPage"]=$maxPage;
        }
        else{
            $output["event"]=0;
            $output["msg"]="无站内信";
        }
        exit($this->decodeUnicode(json_encode($output)));
    }
    
    /**
     * function inner_msg_status
     * 站内信状态修改
     * @access public
     * @param token,id
     * 参数说明 token,站内信id
     * @since 1.0
     * @return array(event,msg)
     * 返回说明 array(状态，信息)
     */
    public function inner_msg_status() {
        $obj = $_POST;
        $output = array();
        $jwt = $obj["token"];
        
        $uinfo = $this->decode_token($jwt);
        
        $uid = $uinfo["ids"];
        
        $count = M('inner_msg')->where("uid = {$uid} and id = {$obj['id']} and status = 0")->count('id');
       
        if($obj['id'] == '' || $count < 1){
            $output["event"] = 0;
            $output["msg"] = "参数有误";
        }else{
            
            $update['status'] = 1;
            $inner_status = M('inner_msg')->where("uid = {$uid} and id = {$obj['id']}")->save($update);
            
            if($inner_status){
                $output["event"] = 88;
                $output["msg"] = "更新成功";
            }else{
                $output["event"] = 1;
                $output["msg"] = "更新失败";
            }
        }
        
        exit($this->decodeUnicode(json_encode($output)));
    }
    
    /**
     * function withdraw_list
     * 提现列表
     * @access public
     * @param token
     * 参数说明 token
     * @since 1.0
     * @return array(event,msg)
     * 返回说明 array(状态，信息)
     */
    public function withdraw_list(){
        $obj = $_POST;
        $output = array();
        $jwt = $obj["token"];
        $uinfo = $this->decode_token($jwt);

        $uid = $uinfo["ids"];
        $map["uid"] = $uid;
        $pagesize = $obj['pagesize']==""?6:$obj['pagesize'];
        $page = $obj['page']==""?1:$obj['page'];
        $page_start = $pagesize*($page-1);
        $page_end = $pagesize;
        $limit = "$page_start,$page_end";
        $count = M("member_withdraw")->where($map)->count();
        $list = M('member_withdraw')
            ->field("id,add_time,
                    case withdraw_status
                    WHEN 0 THEN '待审核'
                    WHEN 1 THEN '审核通过'
                    WHEN 2 THEN '已提现'
                    WHEN 3 THEN '审核未通过'
                    ELSE '' END  as withdraw_status, withdraw_money")
            ->where($map)->order('id DESC')->limit($limit)->select();
        foreach($list as $k =>$v){
            $list[$k]["id"] = intval($v["id"]);
            $list[$k]["withdraw_money"] = floatval($v["withdraw_money"]);
            $list[$k]["add_time"] = date("Y-m-d H:i",$v["add_time"]);
        }
        if(is_array($list)){
            $currentPage = intval($page);
            $pageSize = intval($pagesize);
            $maxCount = intval($count);
            $maxPage = ceil($count/$pagesize);
            $output["event"]=88;
            $output["msg"]="success";
            $output["data"]=$list;
            $output["currentPage"]=$currentPage;
            $output["pageSize"]=$pageSize;
            $output["maxCount"]=$maxCount;
            $output["maxPage"]=$maxPage;
        }
        else{
            $output["event"]=0;
            $output["msg"]="无提现记录";
        }
        exit($this->decodeUnicode(json_encode($output)));
    }
    /**
     * function withdraw_fee
     * 计算提现费用/检查提现金额
     * @access public
     * @param money，token
     * 参数说明 提现金额,token
     * @since 1.0
     * @return array(event,msg)
     * 返回说明 array(状态，信息)
     */
    public function withdraw_fee(){
        $obj = $_POST;
        $output = array();
        $jwt = $obj["token"];
        $uinfo = $this->decode_token($jwt);

        $uid = $uinfo["ids"];
        $money = $obj["money"];
        $pre = C('DB_PREFIX');
        $withdraw_money = floatval($money);
        $vo = M('members m')->field('mm.account_money,mm.back_money,(mm.account_money+mm.back_money) all_money,m.user_leve,m.time_limit,m.pin_pass,b.bank_num')
            ->join("{$pre}member_money mm on mm.uid = m.id")
            ->join("{$pre}member_banks b on b.uid = m.id")
            ->where("m.id={$uid}")->find();
        if($withdraw_money>floatval($vo["all_money"])){
            $output["event"]=0;
            $output["msg"]="提现金额大于可用余额";
            exit($this->decodeUnicode(json_encode($output)));
        }

        $feeconig = get_global_setting();
        $tqfee1 = explode("|",$feeconig['fee_tqtx']);

        //////////////////////////////////修改提现手续费///////////////////////////////////////
        switch(count($tqfee1)) {
            case 2:
                $fee = $tqfee1[0]; //手续费
                break;
            case 3:
                $fee1[0] = explode("-",$tqfee1[0]);
                $fee1[1] = explode("-",$tqfee1[1]);
                if(($withdraw_money-$vo['back_money'])>=0){
                    $maxfee1 = ($withdraw_money-$vo['back_money'])*$fee1[0][0]/1000;
                    if($maxfee1>=$fee1[0][1]){
                        $maxfee1 = $fee1[0][1];
                    }

                    $maxfee2 = $vo['back_money']*$fee1[1][0]/1000;
                    if($maxfee2>=$fee1[1][1]){
                        $maxfee2 = $fee1[1][1];
                    }

                    $fee = $maxfee1+$maxfee2;
                }else{
                    $fee = $withdraw_money*$fee1[1][0]/1000;
                    if($fee>=$fee1[1][1]){
                        $fee = $fee1[1][1];
                    }
                }
                break;
            default :
                $output["event"]=89;
                $output["msg"]="提现规则设置有误，请联系管理员";
                exit($this->decodeUnicode(json_encode($output)));

        }
        $data["fee"] = floatval($fee);
        $output["event"]=88;
        $output["msg"]="success";
        $output["data"] = $data;
        exit($this->decodeUnicode(json_encode($output)));

    }
    /**
     * function withdraw_info
     * 提现信息展示
     * @access public
     * @param token
     * 参数说明 token
     * @since 1.0
     * @return array(event,msg)
     * 返回说明 array(状态，信息)
     */
    public function withdraw_info(){
        $obj = $_POST;
        $pre = C('DB_PREFIX');
        $output = array();
        $jwt = $obj["token"];
        $uinfo = $this->decode_token($jwt);

        $uid = $uinfo["ids"];
        $bank_info = M('member_banks')->field("bank_num")->where("uid= {$uid}")->find();
        if($bank_info["bank_num"]==""){
            $output["event"] = 0;
            $output["msg"] = "尚未绑卡";
            exit($this->decodeUnicode(json_encode($output)));
        }
        $info = M("members m")
            ->field("(mm.account_money+mm.back_money) money,mm.back_money,mb.bank_num,mb.bank_name")
            ->join("{$pre}member_money mm on mm.uid = m.id")
            ->join("{$pre}member_info mi on mi.uid = m.id")
            ->join("{$pre}member_banks mb on mb.uid = m.id")
            ->where("m.id = {$uid}")
            ->find();
        $feeconig = get_global_setting();
        $info["fee_formula"] = $feeconig['fee_tqtx'];
        $info["fee_formula_str"] = M("global")->getFieldByCode("fee_tqtx","tip");
        $info["money"]=floatval($info["money"]);
        $info["back_money"]=floatval($info["back_money"]);
        $borrowconfig=  require C("ROOT_URL")."Dynamic/borrowconfig.php";
        $data = $borrowconfig['BANK_NAME'];
        $info["bank_name"]=$data[$info["bank_name"]];
        $info["bank_num"]=hidecard($info["bank_num"],5);

        $output["event"]=88;
        $output["msg"]="success";
        $output["data"] = $info;
        exit($this->decodeUnicode(json_encode($output)));

    }
    /**
     * function withdraw
     * 提现
     * @access public
     * @param token,money,fee,pin_pass
     * 参数说明 token,提现金额,费用,支付密码(MD5)
     * @since 1.0
     * @return array(event,msg)
     * 返回说明 array(状态，信息)
     */
    public function withdraw(){
        $obj = $_POST;
        $output = array();
        $jwt = $obj["token"];
        $uinfo = $this->decode_token($jwt);

        $uid = $uinfo["ids"];

        $money = $obj["money"];
        $pin = $obj["pin_pass"];

        $pre = C('DB_PREFIX');
        $withdraw_money = floatval($money);
        $vo = M('members m')->field('mm.account_money,mm.back_money,(mm.account_money+mm.back_money) all_money,m.user_leve,m.time_limit,m.pin_pass,b.bank_num')
            ->join("{$pre}member_money mm on mm.uid = m.id")
            ->join("{$pre}member_banks b on b.uid = m.id")
            ->where("m.id={$uid}")->find();
        if(empty($vo['bank_num'])){
            $output["event"]=1;
            $output["msg"]="未绑卡";
            exit($this->decodeUnicode(json_encode($output)));
        }

        if($pin!=$vo["pin_pass"]){
            $output["event"]=0;
            $output["msg"]="支付密码错误";
            exit($this->decodeUnicode(json_encode($output)));
        }
        if($vo['all_money']<$withdraw_money){
            $output["event"]=0;
            $output["msg"]="提现额大于账户余额";
            exit($this->decodeUnicode(json_encode($output)));
        }
        $start = strtotime(date("Y-m-d",time())." 00:00:00");
        $end = strtotime(date("Y-m-d",time())." 23:59:59");
        $wmap['uid'] = $uid;
        $wmap['withdraw_status'] = array("neq",3);
        $wmap['add_time'] = array("between","{$start},{$end}");
        $today_money = M('member_withdraw')->where($wmap)->sum('withdraw_money');
        $today_time = M('member_withdraw')->where($wmap)->count('id');
        $feeconig = get_global_setting();
        $tqfee = explode("|",$feeconig['fee_tqtx']);

        //////////////////////////////////修改提现手续费///////////////////////////////////////
        switch(count($tqfee)){
            case 2:
                $fee[0] = $tqfee[0];//手续费
                $fee[2] = explode("-",$tqfee[1]);//上限

                break;
            case 3:
                $fee[0] = explode("-",$tqfee[0]);
                $fee[1] = explode("-",$tqfee[1]);
                $fee[2] = explode("-",$tqfee[2]);
                break;
            default:
                $output["event"]=89;
                $output["msg"]="提现规则设置有误，请联系管理员";
                exit($this->decodeUnicode(json_encode($output)));
        }
        //////////////////////////////////修改提现手续费（完）///////////////////////////////////////

        $one_limit = $fee[2][0]*10000;
        if($withdraw_money<100){
            $output["event"]=0;
            $output["msg"]="单笔提现金额最低100";
            exit($this->decodeUnicode(json_encode($output)));
        }
        if($withdraw_money>$one_limit){
            $output["event"]=0;
            $output["msg"]="单笔提现金额超过上限:{$one_limit}元";
            exit($this->decodeUnicode(json_encode($output)));
        }
        $today_limit = $fee[2][1]/$fee[2][0];
        if($today_time>=$today_limit){
            $output["event"]=0;
            $output["msg"]="单日提现次数超过上限:{$today_limit}次";
            exit($this->decodeUnicode(json_encode($output)));
        }

        if(($today_money+$withdraw_money)>$fee[2][1]*10000){
            $output["event"]=0;
            $output["msg"]="超出单日提现上限:{$fee[2][1]}万元,今日已提现{$today_money}元";
            exit($this->decodeUnicode(json_encode($output)));
        }

        $fee = $obj["fee"];
        if(($vo['all_money']-$withdraw_money - $fee)<0 ){

            $moneydata['withdraw_money'] = $withdraw_money;
            $moneydata['withdraw_fee'] = $fee;
            $moneydata['second_fee'] = $fee;
            $moneydata['withdraw_status'] = 0;
            $moneydata['uid'] =$uid;
            $moneydata['add_time'] = time();
            $moneydata['add_ip'] = get_client_ip();
            $newid = M('member_withdraw')->add($moneydata);
            if($newid){
                memberMoneyLog($uid,4,-$withdraw_money,"提现,默认自动扣减手续费".$fee."元",'0','@网站管理员@',0,$newid);
                MTip('chk6',$uid);
                $output["event"]=88;
                $output["msg"]="提现申请成功";
                exit($this->decodeUnicode(json_encode($output)));
            }

        }else{
            $moneydata['withdraw_money'] = $withdraw_money;
            $moneydata['withdraw_fee'] = $fee;
            $moneydata['second_fee'] = $fee;
            $moneydata['withdraw_status'] = 0;
            $moneydata['uid'] =$uid;
            $moneydata['add_time'] = time();
            $moneydata['add_ip'] = get_client_ip();
            $newid = M('member_withdraw')->add($moneydata);
            if($newid){
                memberMoneyLog($uid,4,-$withdraw_money,"提现,默认自动扣减手续费".$fee."元",'0','@网站管理员@',0,$newid);
                MTip('chk6',$uid);
                $output["event"]=88;
                $output["msg"]="提现申请成功";
                exit($this->decodeUnicode(json_encode($output)));
            }
        }
    }
    /**
     * function check_pin_pass
     * 判断是否设置支付密码
     * @access public
     * @param token
     * 参数说明 token
     * @since 1.0
     * @return array(event,msg)
     * 返回说明 array(状态，信息)
     */

    public function check_pin_pass(){
        $obj = $_POST;
        $output = array();
        $jwt = $obj["token"];
        $uinfo = $this->decode_token($jwt);

        $uid = $uinfo["ids"];
        $uname = $uinfo["nam"];
        $uphone = $uinfo["pho"];

        $pin = M("members")->getFieldById($uid,"pin_pass");
        $has_pin = empty($pin)?0:88;
        $has_pin_str = empty($pin)?"尚未设置支付密码":"已设置支付密码";
        $output["event"] = $has_pin;
        $output["msg"] = $has_pin_str;

        exit($this->decodeUnicode(json_encode($output)));
    }
    /**
     * function check_id_status
     * 判断是否实名认证
     * @access public
     * @param token
     * 参数说明 token
     * @since 1.0
     * @return array(event,msg)
     * 返回说明 array(状态，信息)
     */


    public function check_id_status(){
        $obj = $_POST;
        $pre = C('DB_PREFIX');
        $output = array();
        $jwt = $obj["token"];
        $uinfo = $this->decode_token($jwt);

        $uid = $uinfo["ids"];
        $uname = $uinfo["nam"];
        $uphone = $uinfo["pho"];

        $id_status = M("members_status")->getFieldByUid($uid,"id_status");
        $event = $id_status==1?88:90;
        $msg = $id_status==1?"已认证":"未认证";

        if($event==90){
            /*$apply = M("name_apply")->where("uid = {$uid}")->order("id desc")->find();
            if(count($apply)!=0){
                //$arr = array(0=>"待审核",1=>"已通过审核",2=>"未通过审核");
                if($apply["status"]==1){
                    $event = 88;
                    $msg = "已认证";
                }
                
                if(empty($apply['deal_info'])){
                    $event = 88;
                    $msg = "待审核";
                }
            }*/
            $member_info = M("members_status")->field("id_status")->where("uid = {$uid}")->find();
            if($member_info['id_status'] == 1){
                $event = 88;
                $msg = "已认证";
            }
            if($member_info['id_status'] == 3){
                $event = 87;
                $msg = "待审核";
            }
        }
        $info = M('member_info')->where("uid = {$uid}")->find();
        $data = array(
            'real_name'=>$info['real_name'],
            'idNo'=>$info['idcard']
        );
        $output["event"] = $event;
        $output["msg"] = $msg;
        $output["data"] = $data;
        exit($this->decodeUnicode(json_encode($output)));
    }
    /**
     * function check_bank_card
     * 判断是否绑定银行卡
     * @access public
     * @param token
     * 参数说明 token
     * @since 1.0
     * @return array(event,msg)
     * 返回说明 array(状态，信息)
     */


    public function check_bank_card(){
        $obj = $_POST;
        $pre = C('DB_PREFIX');
        $output = array();
        $jwt = $obj["token"];
        $uinfo = $this->decode_token($jwt);

        $uid = $uinfo["ids"];
        $uname = $uinfo["nam"];
        $uphone = $uinfo["pho"];

        $count = M("member_banks")->where("uid = {$uid}")->count();
        $event = $count==0?0:88;
        $msg = $count==0?"尚未绑卡":"已绑定";

        $output["event"] = $event;
        $output["msg"] = $msg;
        exit($this->decodeUnicode(json_encode($output)));
    }


    /**
     * function recommend_list
     * 首页推荐项目
     * @access public
     * @since 1.0
     * @return array(event,msg,data)
     * 返回说明 array(状态，信息，数据)
     */
    public function recommend_list(){
        $output = array();

        //新手标
        $searchMapnew = array();
        $searchMapnew['money_collect']=0;
        $searchMapnew['is_new']=1;
        $searchMapnew['borrow_status']=array("in",'2,4,6,7');
        $order="borrow_status ASC,id DESC";
        $b = new BorrowModel();
        $searchx = array();
        $searchx['map'] = $searchMapnew;
        $searchx['limit'] = 1;
        $searchx['order'] = $order;
        $listx = $b->getList("*,ROUND(has_borrow/borrow_money*100,2) as progress",$searchx);

        $output["event"] = is_array($listx)?88:0;
        $output["msg"] = is_array($listx)?'success':'暂无推荐项目';
        $output["data"] = $listx;
        exit($this->decodeUnicode(json_encode($output)));
    }

    /**
     * 卓金的账户中心特权金（红包）
     */
    public function coupon_list(){
        $obj = $_POST;
        $jwt = $obj["token"];
        $uinfo = $this->decode_token($jwt);
        $uid = $uinfo["ids"];
        $this->overdue($uid);
        $map["uid"] = $uid;
        $page = $obj['page']==""?1:$obj['page'];
        $pagesize = $obj['pagesize']==""?6:$obj['pagesize'];
        $page_start = $pagesize*($page-1);
        $page_end = $pagesize;
        $limit = "$page_start,$page_end";
        $count = M("coupon_log")->where($map)->count();

        $list = M("coupon_log")->field("id,money,type,duration,status,FROM_UNIXTIME(deadline,'%Y-%m-%d %H:%i') as deadline,name,multiple_money")->where($map)->order("status asc,id desc")->limit($limit)->select();
        $coupon_config = require C("APP_ROOT") . "Conf/coupon_config.php";
        foreach($list as $k=>$v){
            $str = "用于期限(月)为";
            $arr = explode(",",$v["duration"]);
            if($arr[0]==1){
                $arr1 = explode("-",$arr[1]);
                foreach($arr1 as $i=>$va){
                    if($i==0){
                        $str.=$va;
                    }else{
                        $str.=",".$va;
                    }
                }
            }elseif($arr[0]==2){
                $arr2 = explode("|",$arr[1]);
                if($arr2[1]==0){
                    $str.=$arr2[0]."以上";
                }else{
                    $str.=$arr2[0]."-".$arr2[1];
                }
            }
            $str.="的标，";
            $str.="且投资{$v["multiple_money"]}元及以上可用";
            $list[$k]["str"] = $str;
            $list[$k]["type"] = $coupon_config["COUPON_TYPE"][$v["type"]];
            if($v["status"]==2||$v["status"]==4){
                $remark = M("coupon_uselog")->getFieldByCouponId($v["id"],"remark");
                $list[$k]["str"] = $remark;
            }
            if($v["status"]==3){
                $list[$k]["str"] = "该特权金在截止日期前未使用，已过期";
            }
        }


        $currentPage = $page;
        $pageSize = $pagesize;
        $maxCount = $count;
        $maxPage = ceil($count/$pagesize);
        $output["event"] = is_array($list)?88:0;
        $output["msg"] = is_array($list)?'success':'暂无特权金';
        $output["data"]=$list;
        $output["currentPage"]=$currentPage;
        $output["pageSize"]=$pageSize;
        $output["maxCount"]=$maxCount;
        $output["maxPage"]=$maxPage;
        exit($this->decodeUnicode(json_encode($output)));
    }

    /**
     * 散标投资时查询出的可用的特权金（红包）
     */
    public function coupon(){
        $obj = $_POST;
        $jwt = $obj["token"];
        $output = array();
        $uinfo = $this->decode_token($jwt);

        $uid = $uinfo["ids"];

        $this->overdue($uid);
        $money = $obj["money"];
        $borrow_id = $obj["borrow_id"];
        $field = "id,borrow_duration,borrow_bid";
        $vo = M('borrow_info')->field($field)->find($borrow_id);
        $time = time();
        $couponlist = M("coupon_log")->field("id,name,money,duration")->where("multiple_money<={$money} and uid = {$uid} and start_time <='{$time}' and deadline >= '{$time}' and status = 1")
            ->order("multiple_money desc")
            ->select();
        $x = 0;
        $data = array();
        foreach($couponlist as $k=>$v){
            $arr = explode(",",$v['duration']);
            if($arr[0]==1){
                $arr1 = explode("-",$arr[1]);
                for($i=0;$i<sizeof($arr1);$i++){
                    if($vo["borrow_duration"]==$arr1[$i]){
                        $data[$x] = $v;
                        $x+=1;
                    }
                }
            }
            if($arr[0]==2){
                $arr2 = explode("|",$arr[1]);
                if($arr2[1]==0&&$arr2[0]<=$vo["borrow_duration"]){
                    $data[$x] = $v;
                    $x+=1;
                }elseif($arr2[0]<=$vo["borrow_duration"]&&$arr2[1]>=$vo["borrow_duration"]){
                    $data[$x] = $v;
                    $x+=1;
                }
            }
        }
        $output["event"] = is_array($data)?88:0;
        $output["msg"] = is_array($data)?'success':'暂无特权金';
        $output["data"]=$data;

        exit($this->decodeUnicode(json_encode($output)));
    }



    private function overdue($uid){
        $map["status"] = 1;
        $map["uid"] = $uid;
        $map["deadline"] = array("lt",time());
        $list = M("coupon_log")->where($map)->select();
        foreach($list as $k =>$v){
            $data["id"]=$v["id"];
            $data["status"] = 3;
            M("coupon_log")->save($data);
        }
    }

    /**
     *借款申请验证
     * @params['token']
     * 参数说明 token
     */
    public function applyverify(){
        
        $obj = $_POST;
        $jwt = $obj["token"];
        $output = array();
        $uinfo = $this->decode_token($jwt);

        $uid = $uinfo["ids"];

        // 是否已提交借款申请
        $borrowRequest = M("feedback")->field('status')->where("uid = {$uid}")->order("add_time desc")->find();
        if(is_array($borrowRequest) && $borrowRequest["status"] == 1){
            $output["event"] = 0;
            $output["msg"] = '您的借款申请已经通过审核，不必重新申请';
        }elseif(is_array($borrowRequest) && $borrowRequest["status"] == 0){
            $output["event"] = 1;
            $output["msg"] = '您的借款申请正在审核中，请耐心等待';
        }else{
            $output["event"] = 88;
            $output["msg"] = 'Success';
        }
        
        exit($this->decodeUnicode(json_encode($output)));
    }
    
    /**
     *借款申请
     * @params['token',classify','name','province','city','contact','money','duration','intention','other','txtCode']
     * 参数说明 token，分类，联系人，所在省，所在市，手机号，融资金额，融资期限，借款用途，抵押物信息，验证码
     */
    public function borrowapply(){
        
        $obj = $_POST;
        $jwt = $obj["token"];
        $output = array();
        $uinfo = $this->decode_token($jwt);

        $uid = $uinfo["ids"];

        // 是否已提交借款申请
        $borrowRequest = M("feedback")->field('status')->where("uid = {$uid}")->order("add_time desc")->find();
        if(is_array($borrowRequest) && $borrowRequest["status"] == 1){
            $output["event"] = 3;
            $output["msg"] = '您的借款申请已经通过审核，不必重新申请';
            
            exit($this->decodeUnicode(json_encode($output)));
        }elseif(is_array($borrowRequest) && $borrowRequest["status"] == 0){
            $output["event"] = 4;
            $output["msg"] = '您的借款申请正在审核中，请耐心等待';
            
            exit($this->decodeUnicode(json_encode($output)));
        }
         
        // 验证码验证
        $res = $this->is_PToken($obj['verify_code']);
        
        if ($res['pcode'] != $obj['code'] || $res["res"] == 0) {
            $output = array('event'=>1,'msg'=>'验证码错误或已过期');
            exit($this->decodeUnicode(json_encode($output)));
        }
        
        $request['classify'] = $_POST['classify'];
        $request['duration'] = $_POST['duration'];
        $request['name'] = $_POST['name'];
        $request['contact'] = $_POST['contact'];
        $request['province'] = $_POST['province'];
        $request['city'] = $_POST['city'];
        $request['money'] = $_POST['money'];
        $request['intention'] = $_POST['intention'];
        $request['other'] = $_POST['other'];
        $request['type'] = 3;
        $request['ip'] = get_client_ip();
        $request['status'] = 0;
        $request['add_time'] = time();
        $request['uid'] = $uid;
        
        if($request['classify'] == "" || $request['name'] == "" || $request['contact'] == "" || $request['province'] == "" || $request['city'] == "" || $request['money'] == "" || $request['intention'] == ""){
            $output["event"] = 2;
            $output["msg"] = '必填项不允许为空';

            exit($this->decodeUnicode(json_encode($output)));
        }
        
        //插入申请信息
        $requestInsert = M("feedback")->add($request);
        
        if($requestInsert){
            $output["event"] = 88;
            $output["msg"] = '申请提交成功';
        }else{
            $output["event"] = 0;
            $output["msg"] = '申请提交失败';
        }
        
        exit($this->decodeUnicode(json_encode($output)));
    }


    //APP上传图片。banner。介绍
    public function indexbanner(){
        $output["event"] = 88;
        $output["msg"] = 'success';
		$info = M("app_manager")->field("banner_img")->where("id=1")->find();
        $output["data"]  = unserialize($info['banner_img']);
        foreach($output["data"] as $k=>$v){
			$output["data"][$k]['img'] = 'http://v5.petope.com/'.$output["data"][$k]['img'];
		}
        exit($this->decodeUnicode(json_encode($output)));
    }
    public function more(){
        $info = M("app_manager")->field("erweima,weixin,weibo,more_img,kefu,kefu_time,text_content")->where("id = 1")->find();
        $info["erweima"] = "http://".$_SERVER["HTTP_HOST"]."/".$info["erweima"];
        $info["more_img"] = "http://".$_SERVER["HTTP_HOST"]."/".$info["more_img"];
        $output["event"] = 88;
        $output["msg"] = 'success';
        $output["data"] = $info;
        exit($this->decodeUnicode(json_encode($output)));
    }


    public function events(){

        $obj = $_POST;
        $output = array();
        $page = $obj['page']==""?1:$obj['page'];
        $pagesize = $obj['pagesize']==""?6:$obj['pagesize'];
        $page_start = $pagesize*($page-1);
        $page_end = $pagesize;
        $limit = "$page_start,$page_end";

        $count = M("event_manage")->count();

        $list = M("event_manage")
            ->field("id,img_url,event_title,event_info")
            ->where("is_show = 1")
            ->order("up_time desc")->limit($limit)->select();

        $httpstr = "http://";
        if($_SERVER['HTTPS']=='on'){
            $httpstr = "https://";
        }
        foreach($list as $k=>$v){
            $list[$k]['img_url'] = $httpstr.$_SERVER['HTTP_HOST'].'/'.$v['img_url'];
        }
        $currentPage = $page;
        $pageSize = $pagesize;
        $maxCount = $count;
        $maxPage = ceil($count/$pagesize);
        $output["event"] = is_array($list)?88:0;
        $output["msg"] = is_array($list)?'success':'暂无活动';
        $output["data"]=$list;
        $output["currentPage"]=$currentPage;
        $output["pageSize"]=$pageSize;
        $output["maxCount"]=$maxCount;
        $output["maxPage"]=$maxPage;
        exit($this->decodeUnicode(json_encode($output)));
    }

    public function event_info(){

        $obj = $_POST;
        $output = array();
        $jwt = $obj["token"];
        $uinfo = $this->decode_token($jwt);

        $uid = $uinfo["ids"];
        $share_info = M("event_manage")
            ->field("id,share_title,share_info,share_img,share_url,img_url")
            ->where("id = {$obj['id']}")->find();
        $tpl_info = M("event_tpl_list")->where("em_id = {$obj["id"]} and is_use = 1")->order("up_time desc")->find();

        $httpstr = "http://";
        if($_SERVER['HTTPS']=='on'){
            $httpstr = "https://";
        }
        $tpl = $httpstr.$_SERVER['HTTP_HOST'].'/M/event/'.$tpl_info['tpl_name'].'.html';
        if($share_info['share_url']==''){
            $share_info['share_url'] = $httpstr.$_SERVER['HTTP_HOST'].'/M/event/'.$tpl_info['tpl_name'].'.html?invite='.$uid;
        }else{
            //判断是不是站内链接
            $urls = explode('/',$share_info['share_url']);
            if($_SERVER['HTTP_HOST']==$urls['2']){
                //判断?
                if($_SERVER['HTTP_HOST']==$urls['2']){
                    if(strpos($share_info['share_url'],'?') && ((strpos($share_info['share_url'],'?')+1)!=strlen($share_info['share_url']))){
                        $share_info['share_url'] =$share_info['share_url'].'&invite='.$uid;
                    }elseif(strpos($share_info['share_url'],'?')&&((strpos($share_info['share_url'],'?')+1)==strlen($share_info['share_url']))){
                        $share_info['share_url'] =$share_info['share_url'].'invite='.$uid;
                    }else{
                        $share_info['share_url'] =$share_info['share_url'].'?invite='.$uid;
                    }
                }
            }
        }
        $share_img = unserialize($share_info["share_img"]);

        $imgs = $httpstr.$_SERVER['SERVER_NAME'].'/'.$share_img[0]['img'];
        $imgs = $share_img[0]['img']==''?$httpstr.$_SERVER['SERVER_NAME'].'/'.$share_info['img_url']:$imgs;

        $data["share_title"] = $share_info['share_title'];
        $data["tpl"] = $tpl;
        $data["share_url"] = $share_info['share_url'];
        $data["share_img"] = $imgs;
        $data["share_info"] = $share_info['share_info'];
        $output["event"] = 88;
        $output["msg"] = 'success';
        $output["data"]=$data;
        exit($this->decodeUnicode(json_encode($output)));
    }

    /**
     * 资金记录
     */
    public function money_log(){
        $obj = $_POST;
        $output = array();
        $jwt = $obj["token"];
        $uinfo = $this->decode_token($jwt);

        $uid = $uinfo["ids"];
        $uname = $uinfo["nam"];
        $uphone = $uinfo["pho"];

        $obj = $_POST;
        $output = array();
        $page = $obj['page']==""?1:$obj['page'];
        $pagesize = $obj['pagesize']==""?6:$obj['pagesize'];
        $page_start = $pagesize*($page-1);
        $page_end = $pagesize;
        $limit = "$page_start,$page_end";

        $count = M("member_moneylog")->where("uid = {$uid}")->count();

        $list = M("member_moneylog")
            ->where("uid = {$uid}")
            ->order("id desc")->limit($limit)->select();
        $logtype = C('MONEY_LOG');
        foreach($list as $k => $v){
            unset($list[$k]['uid']);
            unset($list[$k]['name']);
            unset($list[$k]['target_uid']);
            unset($list[$k]['target_uname']);
            unset($list[$k]['add_ip']);
            $list[$k]['add_time'] = date("Y-m-d H:i",$v['add_time']);
            $list[$k]['type'] = $logtype[$v['type']];
        }

        $currentPage = $page;
        $pageSize = $pagesize;
        $maxCount = $count;
        $maxPage = ceil($count/$pagesize);
        $output["event"] = is_array($list)?88:0;
        $output["msg"] = is_array($list)?'success':'暂无数据';
        $output["data"]=$list;
        $output["currentPage"]=$currentPage;
        $output["pageSize"]=$pageSize;
        $output["maxCount"]=$maxCount;
        $output["maxPage"]=$maxPage;


        exit($this->decodeUnicode(json_encode($output)));
    }

    /**
     * 用户投资列表
     */
    public function userinvestor()
    {

        $obj = $_POST;
        $output = array();
        $jwt = $obj["token"];
        $uinfo = $this->decode_token($jwt);

        $uid = $uinfo["ids"];

        $page = $obj['page']==""?1:$obj['page'];
        $pagesize = $obj['pagesize']==""?6:$obj['pagesize'];
        $page_start = $pagesize*($page-1);
        $page_end = $pagesize;
        $limit = "$page_start,$page_end";

        $type = $obj["type"];
        $pre = C('DB_PREFIX');
        $data['id'] = $uid;

        $user = M("members")->where($data)->find();
        $map = "";
        if($type == 1){
            $map .= "(bi.investor_uid = {$user["id"]} and bi.status in (4,6)) or (id.buy_uid = {$user["id"]} and id.status =1)";
        }elseif($type == 2){
            $map .= "bi.investor_uid = {$user["id"]} and bi.status in (5,7) or (id.buy_uid = {$user["id"]} and id.status =4)";
        }else{
            $output["event"] = 90;
            $output["msg"] = '提交参数有误';
            exit($this->decodeUnicode(json_encode($output)));
        }

        $count = M("borrow_investor bi")
            ->join("{$pre}borrow_info sbi on bi.borrow_id = sbi.id")
            ->join("{$pre}members m on bi.borrow_uid = m.id")
            ->join("{$pre}invest_debt id on bi.id = id.invest_id")
            ->where($map)->count();

        $list = M("borrow_investor bi")->field('bi.id as id,
                    bi.borrow_id as borrow_id,bi.investor_uid as investor_uid,
                    sbi.borrow_name as borrow_name,bi.investor_capital as investor_capital,
                    bi.investor_interest as investor_interest,bi.receive_capital as receive_capital,
                    bi.receive_interest as receive_interest,bi.add_time as add_time,
                    bi.is_auto as is_auto,sbi.borrow_interest_rate as rate
                    ')
            ->join("{$pre}borrow_info sbi on bi.borrow_id = sbi.id")
            ->join("{$pre}members m on bi.borrow_uid = m.id")
            ->join("{$pre}invest_debt id on bi.id = id.invest_id")
            ->where($map)->order('bi.id desc')->limit($limit)->select();
        foreach($list as $k => $v){
            if($v["investor_uid"] != $user["id"] && $v["debt_status"] == 1){
                $list[$k]['debt_status'] = 0;
            }
            $list[$k]['add_time'] = date("Y-m-d H:i",$v['add_time']);

        }
        $currentPage = $page;
        $pageSize = $pagesize;
        $maxCount = $count;
        $maxPage = ceil($count/$pagesize);
        $output["event"] = is_array($list)?88:0;
        $output["msg"] = is_array($list)?'success':'暂无数据';
        $output["data"]=$list;
        $output["currentPage"]=$currentPage;
        $output["pageSize"]=$pageSize;
        $output["maxCount"]=$maxCount;
        $output["maxPage"]=$maxPage;
        exit($this->decodeUnicode(json_encode($output)));
    }

    /**
     * 加息券列表
     * 参数传值   状态，标号，投资金额
     */
    public function interest_log(){
        $obj = $_POST;
        $pre = C('DB_PREFIX');
        $output = array();
        $jwt = $obj["token"];
        $uinfo = $this->decode_token($jwt);

        $uid = $uinfo["ids"];
        $uname = $uinfo["nam"];
        $uphone = $uinfo["pho"];
        $status = $obj['status'];


        $page = $obj['page']==""?1:$obj['page'];
        $pagesize = $obj['pagesize']==""?6:$obj['pagesize'];
        $page_start = $pagesize*($page-1);
        $page_end = $pagesize;
        $limit = "$page_start,$page_end";
        $model = M('interestratecoupon_detail d');
        //可使用
        if($status == 1){

            $map = array();
            $map['i.online_time'] = array("elt",time());
            $map['i.deadline'] = array("egt",time());
            $map['i.status'] = array("eq",$status);
            $map["d.uid"] = $uid;
            $map['d.utility_time'] = array("eq",0);

            $count = M('interestratecoupon_detail d')
                ->join("{$pre}interestratecoupon i on i.id=d.cid")
                ->where($map)->count("d.id");

            $field = "d.*,i.title,i.interest_rate,i.online_time,i.deadline,i.status,i.min_duration,i.max_duration,i.min_invest_money";
            $list = M('interestratecoupon_detail d')
            ->join("{$pre}interestratecoupon i on i.id=d.cid")
            ->field($field)
            ->where($map)
            ->order("d.id DESC")
            ->limit($limit)
            ->select();
        }
        //已过期
        if($status == 3){

            $map = array();
            $map['i.deadline'] = array("lt",time());
            $map['i.status'] = array("eq",1);
            $map["d.uid"] = $uid;
            $map['d.utility_time'] = array("eq",0);

            $count = M('interestratecoupon_detail d')
                ->join("{$pre}interestratecoupon i on i.id=d.cid")
                ->where($map)->count("d.id");
           
            $field = "d.*,i.title,i.interest_rate,i.online_time,i.deadline,i.status,i.min_duration,i.max_duration,i.min_invest_money";
            $list = M("interestratecoupon_detail d")
                ->join("{$pre}interestratecoupon i on i.id=d.cid")
                ->field($field)
                ->where($map)
                ->order("d.id DESC")
                ->limit($limit)
                ->select();

         }
         //使用中
        if($status == 2){



            $map = array();
            $map['i.status'] = array("eq",1);
            $map["d.uid"] = $uid;
            $map['d.utility_time'] = array("gt",0);
            $map['b.borrow_status'] = array("in","2,4,6");

            $count = M('interestratecoupon_detail d')
            ->join("{$pre}interestratecoupon i on i.id=d.cid")
            ->join("{$pre}borrow_investor bi on bi.id=d.iid")
            ->join("{$pre}borrow_info b on b.id=d.bid")
            ->where($map)->count("d.id");

            $field = "d.*";
            $field.= ",i.title,i.interest_rate,i.online_time,i.deadline,i.status,i.min_duration,i.max_duration,i.min_invest_money";
            $field.= ",b.id bid,b.borrow_name";
            $field.= ",bi.id iid,bi.investor_capital money";

            $list = M('interestratecoupon_detail d')
                ->join("{$pre}interestratecoupon i on i.id=d.cid")
                ->join("{$pre}borrow_info b on b.id=d.bid")
                ->join("{$pre}borrow_investor bi on bi.id=d.iid")
                ->field($field)
                ->where($map)
                ->order("d.id DESC")
                ->limit($limit)
                ->select();

        }
        if($status == 4){

        $map = array();
        $map['i.status'] = array("eq",1);
        $map["d.uid"] = $uid;
        $map['d.utility_time'] = array("gt",0);
        $map['b.borrow_status'] = array("in","7,9");

        
        $count = M('interestratecoupon_detail d')
            ->join("{$pre}borrow_info b on b.id=d.bid")
            ->join("{$pre}interestratecoupon i on i.id=d.cid")
            ->where($map)->count("d.id");
        
        $field = "d.*";
        $field.= ",i.title,i.interest_rate,i.online_time,i.deadline,i.status,i.min_duration,i.max_duration,i.min_invest_money";
        $field.= ",b.id bid,b.borrow_name";
        $field.= ",bi.id iid,bi.investor_capital money";

        $list = M('interestratecoupon_detail d')
            ->join("{$pre}interestratecoupon i on i.id=d.cid")
            ->join("{$pre}borrow_info b on b.id=d.bid")
            ->join("{$pre}borrow_investor bi on bi.id=d.iid")
            ->field($field)
            ->where($map)
            ->order("d.id DESC")
            ->limit($limit)
            ->select();

        }


        $currentPage = $page;
        $pageSize = $pagesize;
        $maxCount = $count;
        $maxPage = ceil($count/$pagesize);



        $output["event"] = is_array($interestlist)?88:0;
        $output["msg"] = is_array($interestlist)?'success':'暂无数据';
        $output["data"]=$list;
        $output["currentPage"]=$currentPage;
        $output["pageSize"]=$pageSize;
        $output["maxCount"]=$maxCount;
        $output["maxPage"]=$maxPage;
        exit($this->decodeUnicode(json_encode($output)));

    }

    /**
     * 加息券过期处理
     */
    private function interest_overdue(){
        $map["status"] = 1;
        $map["deadline"] = array("lt",time());
        $list = M("interest_log")->where($map)->select();
        foreach($list as $k =>$v){
            $data["id"]=$v["id"];
            $data["status"] = 3;
            M("interest_log")->save($data);
        }
    }

    /**
     * 公告列表
     */
    public function gonggaos(){
        $obj = $_POST;
        $map['type_id'] = 9;
        $page = $obj['page']==""?1:$obj['page'];
        $pagesize = $obj['pagesize']==""?6:$obj['pagesize'];
        $page_start = $pagesize*($page-1);
        $page_end = $pagesize;
        $limit = "$page_start,$page_end";

        $count = M('article')->where($map)->count('id');
        $data = M('article')->field("id,title,FROM_UNIXTIME(art_time,'%Y-%m-%d %H:%i') as art_time,art_img,art_info")
            ->where($map)->order('sort_order desc,id desc')->limit($limit)->select();

        $currentPage = $page;
        $pageSize = $pagesize;
        $maxCount = $count;
        $maxPage = ceil($count/$pagesize);
        $output["event"] = is_array($data)?88:0;
        $output["msg"] = is_array($data)?'success':'暂无数据';
        $output["data"]=$data;
        $output["currentPage"]=$currentPage;
        $output["pageSize"]=$pageSize;
        $output["maxCount"]=$maxCount;
        $output["maxPage"]=$maxPage;
        exit($this->decodeUnicode(json_encode($output)));
    }

    /**
     * 公告详细
     */
    public function gonggaobyid(){
        $obj = $_POST;
        $map['id'] = $obj['id'];
        $data = M('article')
            ->field("title,art_content,art_writer,FROM_UNIXTIME(art_time,'%Y-%m-%d %H:%i') as art_time,art_img")
            ->where($map)->find();
        $data['art_content'] = $this->setimgsrc($data['art_content']);
        $output["event"] = 88;
        $output["msg"] = 'success';
        $output["data"]=$data;
        exit($this->decodeUnicode(json_encode($output)));

    }
    /**
     * @param $content
     * @return mixed
     * 正则替换图片地址
     */
    private function setimgsrc($content){
        if ($_SERVER['HTTPS'] != "on") {
            $st = 'http://';
        }else{
            $st = 'https://';
        }
        return preg_replace('/(<img.+?src=")(.*?)/','$1'.$st.$_SERVER['SERVER_NAME'].'$2', $content);
    }

    public function x(){
        $obj = $_POST;
        $pre = C('DB_PREFIX');
        $output = array();
        $jwt = $obj["token"];
        $uinfo = $this->decode_token($jwt);

        $uid = $uinfo["ids"];
        $uname = $uinfo["nam"];
        $uphone = $uinfo["pho"];


        exit($this->decodeUnicode(json_encode($output)));
    }
    //轮播图
    public function index_banner(){
        $output["event"] = 88;
        $output["msg"]   = 'success';
        $output["data"]  = get_ad(4);
        exit($this->decodeUnicode(json_encode($output)));
    }
    //投资记录详情
    public function money_log_detail(){
        $obj = $_POST;
        $output = array();
        $jwt = $obj["token"];
        $uinfo = $this->decode_token($jwt);
        $id = $obj["id"];

        $list = M("member_moneylog")->where("id = {$id}")->select();
        foreach($list as $k => $v){
            unset($list[$k]['uid']);
            unset($list[$k]['name']);
            unset($list[$k]['target_uid']);
            unset($list[$k]['target_uname']);
            unset($list[$k]['add_ip']);
            $list[$k]['add_time'] = date("Y-m-d H:i",$v['add_time']);
            $list[$k]['type'] = $logtype[$v['type']];
        }
        $output["event"] = is_array($list)?88:0;
        $output["msg"] = is_array($list)?'success':'暂无数据';
        $output["data"]=$list;
        exit($this->decodeUnicode(json_encode($output)));
    }
    /*
    * 修改手机号
    * token、验证码、新手机号、验证码是否过期
    * token、pcode、phone、verify_code
    */
    public function up_phone(){
       
        $obj = $_POST;
        
        $pcode = $obj['pcode'];
        $phone = $obj['phone'];
        $jwt = $obj["token"];
        $uinfo = $this->decode_token($jwt);


        $uid = $uinfo["ids"];

        /*
        $output["event"] = 0;
        $output["msg"] = "新密码长度太短";
        exit($this->decodeUnicode(json_encode($output)));
        */

        if($uid==0){
            $output = array('event'=>0,'msg'=>'请重新登录');
            exit($this->decodeUnicode(json_encode($output)));
        }

        $info = M("members")->field("user_name,user_phone")->where("id = {$uid}")->find();
        if($info['user_phone']==$phone){
            $output = array('event'=>3,'msg'=>'新手机号与原手机号一致');
            exit($this->decodeUnicode(json_encode($output)));
        }
        $pcount = M("members")->where("id <> {$uid} and user_phone = {$phone}")->count();
        if($pcount!=0){
            $output = array('event'=>4,'msg'=>'新手机号已被使用');
            exit($this->decodeUnicode(json_encode($output)));
        }
        /*$res1 = $this->is_PToken($obj['verify_code']);
        if($res1["res"]==0){
            $output = array('event'=>1,'msg'=>'验证码已过期');
            exit($this->decodeUnicode(json_encode($output)));
        }
        if ($res1['pcode'] != $pcode||$res1['phone'] != $phone) {
            $output = array('event'=>2,'msg'=>'验证码错误');
            exit($this->decodeUnicode(json_encode($output)));
        }*/
        $data['user_name'] = $info['user_name']==$info['user_phone']?$phone:$info['user_name'];
        $data['user_phone'] = $phone;
        $data['id'] = $uid;
        $result = M("members")->save($data);
        if($result!==false){
            $updata['cell_phone'] = $phone;
            M("member_info")->where("uid = {$uid}")->save($updata);
            $output = array('event'=>88,'msg'=>'success');
            exit($this->decodeUnicode(json_encode($output)));
        }else{
            $output = array('event'=>90,'msg'=>'修改失败');
            exit($this->decodeUnicode(json_encode($output)));
        }
    }
    /*
    * 可用加息券列表
    * 标号：id     投资金额：money    token:token
    */
    public function interest_ticket(){
        $obj = $_POST;
        
        $money = $obj['money'];
        $id = $obj['id'];
        $jwt = $obj["token"];
        $uinfo = $this->decode_token($jwt);
        $uid = $uinfo["ids"];
        ######################## 获取当前可用的加息券列表 开始 ########################
        # 标号 $id
        # 投资金额 $money
        $list = get_unused_interestratecoupon_list($uid,$id,intval($money));
        $output = array('event'=>88,'msg'=>$list);
        if($list == null){
             $output = array('event'=>0,'msg'=>$list);
        }
        exit($this->decodeUnicode(json_encode($output)));
        ######################## 获取当前可用的加息券列表 结束 ########################

    }
    /*
    * 投资记录列表详情
    * id：列表id
    */
    public function userinvestor_detail(){
        $id   = $_POST['id'];
        $map = array();
        $map['bi.id'] = $id;
        $pre = C('DB_PREFIX');
        $list = M("borrow_investor bi")->field('bi.id as id,
                    bi.borrow_id as borrow_id,bi.investor_uid as investor_uid,
                    sbi.borrow_name as borrow_name,bi.investor_capital as investor_capital,
                    bi.investor_interest as investor_interest,bi.receive_capital as receive_capital,
                    bi.receive_interest as receive_interest,bi.add_time as add_time,
                    bi.is_auto as is_auto,sbi.borrow_interest_rate as rate
                    ')
        ->join("{$pre}borrow_info sbi on bi.borrow_id = sbi.id")
        ->join("{$pre}members m on bi.borrow_uid = m.id")
        ->join("{$pre}invest_debt id on bi.id = id.invest_id")
        ->where($map)->select();
        $output = array('event'=>88,'msg'=>$list);
        exit($this->decodeUnicode(json_encode($output)));
    }
   /*
    *   特权金统计
    *   token
    */
    public function summary(){
    $obj = $_POST;
    $isopen['isopen']=array('neq',1);
        $isopen['size']=$obj['pagesize'];
        $_GET['p'] = $obj['page'];
        $list = getTqjlist($isopen);

        for($i=0;$i<count($list['list']);$i++){
            $status=explode("-",$list['list'][$i]['status_approve']);
            for($j=0;$j<count($status);$j++){
                if($status[$j]==0){
                    $list['list'][$i]['shouji']="手机认证";
                }
                if($status[$j]==1){
                    $list['list'][$i]['shiming']="实名认证";
                }
                if($status[$j]==2){
                    $list['list'][$i]['youxiang']="邮箱认证";
                }
                if($status[$j]==3){
                    $list['list'][$i]['daishou']="待收本金";
                }
            }
            if($list['list'][$i]['over_times'] < time()){
                $list['list'][$i]['tqj_status']=0; //已结束 
            }else{
                $list['list'][$i]['tqj_status']=1; //进行中
            }
        }
		$count = M('tqj_config')->count();
		$maxPage = ceil($count/$obj['page']);
		$pagesize = $obj['pagesize'];
		
        $output = array('event'=>88,'msg'=>$list['list'],'maxPage'=>$maxPage,'pagesize'=>$pagesize);
        exit($this->decodeUnicode(json_encode($output)));
    }
    /*
    *   特权金记录
    *   token
    */
    public function summary_detail(){
        $obj = $_POST;
        $jwt = $obj["token"];
        $uinfo = $this->decode_token($jwt);
        $uid['user_id'] = $uinfo["ids"];
        
        $tqj=M('tqj_user')->where($uid)->select();


        for($i=0;$i<count($tqj);$i++){
            $tqj[$i]['get_time'];//开始时间
            $tqj[$i]['over_time']=$tqj[$i]['get_time']+$tqj[$i]['get_the_number']*3600*24;//领取次数
            $tqj[$i]['over_time']=strtotime(date("Y-m-d",$tqj[$i]['over_time']));


            if($tqj[$i]['get_the_number']>$tqj[$i]['actual_the_number']){
                $tqj[$i]['tqj_status']=1; 
            }else{
                $tqj[$i]['tqj_status']=0;
            }

        }

        $output = array('event'=>88,'msg'=>$tqj);
        exit($this->decodeUnicode(json_encode($output)));
    }
    /*
    * 特权金领取
    */
    public function sunmmary_get(){
        $obj = $_POST;
        $jwt = $obj["token"];
        $uinfo = $this->decode_token($jwt);
        $uid = $uinfo["ids"]; //用户ID
        $tid=$obj['tid'];//特权金ID
        $underway=M('tqj_config')->find($tid);
        if($underway['isopen']==1){
          $output = array('event'=>0,'msg'=>'活动已经关闭');
          exit($this->decodeUnicode(json_encode($output)));
        }
        if($underway['begin_time']>time()){
          $output = array('event'=>0,'msg'=>'活动还未开始');
          exit($this->decodeUnicode(json_encode($output)));
        }
        if($underway['over_time']<time()){
          $output = array('event'=>0,'msg'=>'活动已经结束');
          exit($this->decodeUnicode(json_encode($output)));
        }
        $test['tqj_id']=$tid;
        $test['user_id']=$uid;
        $cou=M('tqj_user')->where($test)->count(id);
        if($cou==1){
            $output = array('event'=>0,'msg'=>'已领取');
            exit($this->decodeUnicode(json_encode($output)));
        }else{  
            $data=M('tqj_config')->find($tid);
            $status=M('members_status')->find($uid);
            $sta=explode("-",$data['status_approve']);
            for($i=0;$i<count($sta);$i++){
                //手机认证
                if($sta[$i]==0){
                    if($status['phone_status']!=1){
                            $output = array('event'=>0,'msg'=>'你还没有进行手机认证');
                            exit($this->decodeUnicode(json_encode($output)));
                    }
                    //file_put_contents(mt_rand(1,99).".txt","通过手机认证");
                }
                //实名认证
                if($sta[$i]==1){
                    if($status['id_status']!=1){
                            $output = array('event'=>0,'msg'=>'你还没有进行实名认证');
                            exit($this->decodeUnicode(json_encode($output)));
                    }
                    //file_put_contents(mt_rand(1,99).".txt","通过实名认证");

                }
                //邮箱认证
                if($sta[$i]==2){
                    if($status['email_status']!=1){
                        $output = array('event'=>0,'msg'=>'你还没有进行邮箱认证');
                        exit($this->decodeUnicode(json_encode($output)));
                    }
                    // file_put_contents(mt_rand(1,99).".txt","通过邮箱认证");
                }
                //待收本金
                if($sta[$i]==3){
                    $benefit=get_personal_benefit($uid);
                    if($benefit['capital_collection']<$data['status_due_money']){
                        $output = array('event'=>0,'msg'=>'待收本金不足');
                        exit($this->decodeUnicode(json_encode($output)));
                    }
                    // file_put_contents(mt_rand(1,99).".txt","通过待收本金");
                }
            }
        }
        $user_tqj['tqj_id']=$tid;
        $user_tqj['user_id']=$uid;
        $user_tqj['get_time']=time();
        $user_tqj['get_the_number']=$data['biggest'];
        $user_tqj['tqj_money']=$data['money'];
        $user_tqj['tqj_rate']=$data['rate'];
        $user_tqj['status']=1;
        $user_tqj['title']=$data['name'];
        $user_tqj['affect_money']=round($data['money']*$data['rate']*0.01/365,2);//每天收益
        //var_dump($user_tqj);
        $list = M('tqj_user')->add($user_tqj);
        
        if($list){
           $output = array('event'=>88,'msg'=>'领取成功');
           exit($this->decodeUnicode(json_encode($output)));
        }
    }
    //回收中优计划
    public function tendbacking()
    {
        $obj = $_POST;
        $jwt = $obj["token"];
        $uinfo = $this->decode_token($jwt);
        $map['i.investor_uid']=$uinfo["ids"];
        $map['i.status'] = 1;
        //$map['i.is_jijin'] = 1;
        $size = 15;
        
        
        
        
        $pre = C("DB_PREFIX");
        $Bconfig = require(C("APP_ROOT")."Conf/borrow_config.php");
        if(empty($map['i.investor_uid']))
        {
            return;
        }
        if($size)
        {
            import( "ORG.Util.Page" );
            $count = M("transfer_borrow_investor i")->where($map)->count("i.id");
            $p = new Page($count,$size);
            $page = $p->show(1);
            $Lsql = "{$p->firstRow},{$p->listRows}";
        }else{
            $page = "";
            $Lsql = "{$parm['limit']}";
        }
        $type_arr = $Bconfig['BORROW_TYPE'];
        $field = "i.*,i.add_time as invest_time,m.user_name as borrow_user,b.borrow_duration,b.borrow_interest_rate,b.add_time as borrow_time,b.borrow_money,b.borrow_name,m.credits";
        $list = M("transfer_borrow_investor i")->field($field)->where($map)->join("{$pre}transfer_borrow_info b ON b.id=i.borrow_id")->join( "{$pre}members m ON m.id=b.borrow_uid")->order("i.id DESC")->limit($Lsql)->select();
        foreach($list as $key => $v )
        {
            if($map['i.status'] == 4 )
            {
                $list[$key]['total'] = $v['borrow_type'] == 3 ? "1" : $v['borrow_duration'];
                $list[$key]['back'] = $v['has_pay'];
            }
            $list[$key]['receive'] = $list[$key]['investor_capital']+$list[$key]['investor_interest']-$list[$key]['invest_fee'];
        }
        $row = array();
        $row['list'] = $list;
        
        
        
        
        
        
        
        
        
        
        $output = array('event'=>88,'msg'=>$row['list']);
        exit($this->decodeUnicode(json_encode($output)));
    }
    //已回收优计划
    public function tenddone()
    {   $obj = $_POST;
        $jwt = $obj["token"];
        $uinfo = $this->decode_token($jwt);
        $map['i.investor_uid'] = $uinfo["ids"];
        $map['i.is_jijin'] = 1;
        $map['i.status'] = array("exp","in(1,2) and (i.receive_interest > 0 or i.receive_capital > 0) ");
        $size = 15;
        
        
        
        $pre = C("DB_PREFIX");
        $Bconfig = require(C("APP_ROOT")."Conf/borrow_config.php");
        if(empty($map['i.investor_uid']))
        {
            return;
        }
        if($size)
        {
            import( "ORG.Util.Page" );
            $count = M("transfer_borrow_investor i")->where($map)->count("i.id");
            $p = new Page($count,$size);
            $page = $p->show(1);
            $Lsql = "{$p->firstRow},{$p->listRows}";
        }else{
            $page = "";
            $Lsql = "{$parm['limit']}";
        }
        $type_arr = $Bconfig['BORROW_TYPE'];
        $field = "i.*,i.add_time as invest_time,m.user_name as borrow_user,b.borrow_duration,b.borrow_interest_rate,b.add_time as borrow_time,b.borrow_money,b.borrow_name,m.credits";
        $list = M("transfer_borrow_investor i")->field($field)->where($map)->join("{$pre}transfer_borrow_info b ON b.id=i.borrow_id")->join( "{$pre}members m ON m.id=b.borrow_uid")->order("i.id DESC")->limit($Lsql)->select();
        foreach($list as $key => $v )
        {
            if($map['i.status'] == 4 )
            {
                $list[$key]['total'] = $v['borrow_type'] == 3 ? "1" : $v['borrow_duration'];
                $list[$key]['back'] = $v['has_pay'];
            }
            $list[$key]['receive'] = $list[$key]['receive_capital']+$list[$key]['receive_interest'];
        }
        $row = array();
        $row['list'] = $list;
        
        
        
        $output = array('event'=>88,'msg'=>$row['list']);
        exit($this->decodeUnicode(json_encode($output)));
    }
    
}
?>
