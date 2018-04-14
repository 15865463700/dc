<?php
/**
 *                             _ooOoo_
 *                            o8888888o
 *                            88" . "88
 *                            (| -_- |)
 *                            O\  =  /O
 *                         ____/`---'\____
 *                       .'  \\|     |//  `.
 *                      /  \\|||  :  |||//  \
 *                     /  _||||| -:- |||||-  \
 *                     |   | \\\  -  /// |   |
 *                     | \_|  ''\---/''  |   |
 *                     \  .-\__  `-`  ___/-. /
 *                   ___`. .'  /--.--\  `. . __
 *                ."" '<  `.___\_<|>_/___.'  >'"".
 *               | | :  `- \`.;`\ _ /`;.`/ - ` : | |
 *               \  \ `-.   \_ __\ /__ _/   .-` /  /
 *          ======`-.____`-.___\_____/___.-`____.-'======
 *                             `=---='
 *          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 *                     佛祖保佑        永无BUG
 *            佛曰:
 *                   写字楼里写字间，写字间里程序员；
 *                   程序人员写程序，又拿程序换酒钱。
 *                   酒醒只在网上坐，酒醉还来网下眠；
 *                   酒醉酒醒日复日，网上网下年复年。
 *                   但愿老死电脑间，不愿鞠躬老板前；
 *                   奔驰宝马贵者趣，公交自行程序员。
 *                   别人笑我忒疯癫，我笑自己命太贱；
 *                   不见满街漂亮妹，哪个归得程序员？
 */

/**
 * Class MembersModel
 * @Author LiuKeTao
 * 会员模型
 */
class MembersModel extends BaseModel
{
    protected $tableName = 'members';
    protected $pk = 'id';
    protected $tableName1 = 'member_apply';
    protected $tableName2 = 'member_login';
    /**
     * $_link  使用于关系模型
     * @var array
     */
    protected $_link = array(
        'Money' => array(
            'mapping_type' => HAS_ONE,
            'class_name' => 'MemberMoney',
            'foreign_key' => 'uid',
            'as_fields' => 'account_money,back_money,money_collect,money_freeze',
        ),
        'Extra' => array(
            'mapping_type' => HAS_ONE,
            'class_name' => 'MemberMoney',
            'foreign_key' => 'uid',
            'as_fields' => 'credit_cuse,credit_limit,borrow_vouch_cuse,borrow_vouch_limit,invest_vouch_cuse,invest_vouch_limit',
        ),
        'Verify' => array(
            'mapping_type' => HAS_ONE,
            'class_name' => 'MemberStatus',
            'foreign_key' => 'uid',
            'as_fields' => 'phone_status,id_status,email_status,account_status,safequestion_status,vip_status',
        ),
        'MemberInfo' => array(
            'mapping_type' => HAS_ONE,
            'class_name' => 'member_info',
            'foreign_key' => 'uid',
        ),
        'MemberContact' => array(
            'mapping_type' => HAS_ONE,
            'class_name' => 'member_contact_info',
            'foreign_key' => 'uid',
        ),
        'MemberDepartment' => array(
            'mapping_type' => HAS_ONE,
            'class_name' => 'member_department_info',
            'foreign_key' => 'uid',
        ),
        'Financial' => array(
            'mapping_type' => HAS_ONE,
            'class_name' => 'member_financial_info',
            'foreign_key' => 'uid',
        ),
        'House' => array(
            'mapping_type' => HAS_ONE,
            'class_name' => 'member_house_info',
            'foreign_key' => 'uid',
        ),
        'Ensure' => array(
            'mapping_type' => HAS_ONE,
            'class_name' => 'member_ensure_info',
            'foreign_key' => 'uid',
        ),
        'Question' => array(
            'mapping_type' => HAS_ONE,
            'class_name' => 'member_safequestion',
            'foreign_key' => 'uid',
        ),
        'NameApply' => array(
            'mapping_type' => HAS_ONE,
            'class_name' => 'name_apply',
            'foreign_key' => 'uid',
        ),
        'MoneyDetail' => array(
            'mapping_type' => HAS_ONE,
            'class_name' => 'MemberMoneyDetail',
            'foreign_key' => 'uid',
        ),
        'Bank' => array(
            'mapping_type' => HAS_ONE,
            'class_name' => 'member_banks',
            'foreign_key' => 'uid',
        ),
        'MemberLogin' => array(
            'mapping_type' => HAS_MANY,
            'class_name' => 'member_login',
            'foreign_key' => 'uid',
        ),
        'RepayInfo' => array(
            'mapping_type' => HAS_ONE,
            'class_name' => 'borrow_repay_info',
            'foreign_key' => 'uid',
        ),
    );

    public function getList($field = '*', $obj = array(), $join = array())
    {

        $map = $obj['map'];
        $group = $obj['group'];
        $order = $obj['order'];
        $limit = $obj['limit'];

        $per = C('DB_PREFIX');
        $table = "{$per}" . $this->tableName;
        if ($order == '') {
            $order = '`id` desc';
            if (is_array($join)) {
                $order = 'm.`id` desc';
            }
        }
        if (is_array($join)) {
            $table = "{$per}" . $this->tableName . ' as m';
        }
        return $this->_getList($field, $table, $map, $join, $group, $order, $limit);
    }

    /**
     * 使用关系模型查询用户信息
     * @param string $field
     * @param $uid
     * @param $link
     * @return mixed
     */
    public function getMemberInfo($uid, $link = '', $field = '*')
    {
        if (empty($link)) {
            $user = $this->field($field)->find($uid);
        } else {
            $members = $this->switchModel("Relation");
            $members->setProperty("_link", $this->_link);
            $user = $members->field($field)->relation($link)->find($uid);
        }
        return $user;
    }

    /**
     * 使用关系模型更新用户信息
     * @param $uid
     * @param $data
     * @return mixed
     */
    public function updateMemberInfo($uid, $data)
    {
        $members = $this->switchModel("Relation");
        $members->setProperty("_link", $this->_link);
        $data[$this->pk] = $uid;
        $data['update_sign'] = time() . mt_rand(1000, 9999);
        return $members->relation(true)->save($data);
    }

    /**
     * 使用关系模型新增用户信息
     * @param $data
     * @return mixed
     */
    public function addMemberInfo($data)
    {
        $members = $this->switchModel("Relation");
        $members->setProperty("_link", $this->_link);
        $link = array_keys($data);
        return $members->relation($link)->add($data);
    }

    /**
     * 判断用户支付密码是否正确
     * @param $uid
     * @param $pin_pass
     * @return int
     */
    public function checkPinPass($uid, $pin_pass)
    {
        $status = 0;
        $pin = $this->getFieldById($uid, 'pin_pass');
        $pin == md5($pin_pass) && $status = 1;
        return $status;
    }

    /**
     * 根据原密码修改登录密码,做判断用
     * @param $uid
     * @param $user_pass
     * @param $oldPwd
     * @return array
     */
    public function updateUserPassByOld($uid, $user_pass, $oldPwd)
    {

        $old = md5($oldPwd);
        $map['id'] = $uid;
        $map['user_pass'] = $old;
        $count = $this->where($map)->count();
        if (empty($count)) {
            return array('status' => 0, 'msg' => '原密码错误，请重新输入！');
        }
        if ($user_pass == $oldPwd) {
            return array('status' => 0, 'msg' => '填入的新旧密码相同，请重新输入！');
        }
        $data['user_pass'] = md5($user_pass);
        $res = $this->updateMemberInfo($uid, $data);
        if ($res) {
            return array('status' => 1, 'msg' => '密码更新成功');
        } else {
            return array('status' => 0, 'msg' => '原密码与新密码相同或者操作失败');
        }
    }

    /**
     * 注册
     * @param $obj
     * @return array
     */
    public function register($obj)
    {
        $data['user_phone'] = text($obj['phone']);
        $data['user_name'] = text($obj['phone']);
        $user_name = $data['user_name'];
        $data['user_pass'] = md5($obj['password']);
        if ($obj['invite_user_id'] == 0) {
            if ($obj["invite"] != "") {
                $map['user_phone'] = $obj["invite"];
                $infop = $this->where($map)->find();
                $data['recommend_id'] = $infop["id"];
                $data['recommend_time'] = time();
            }
        } else {
            $data['recommend_id'] = $obj['invite_user_id'];
            $data['recommend_time'] = time();
        }
        $data['reg_time'] = time();
        $data['reg_ip'] = get_client_ip();
        $data['last_log_time'] = time();
        $data['last_log_ip'] = get_client_ip();
        $data['is_business'] = $obj['is_business'];

        $member_money['money_freeze'] = 0;
        $member_money['money_collect'] = 0;
        $member_money['account_money'] = 0;
        $member_money['back_money'] = 0;
        $member_info['cell_phone'] = text($obj['phone']);
        $data['Money'] = $member_money;
        $data['MemberInfo'] = $member_info;
        $money_detail['net_interest'] = 0;
        $data['MoneyDetail'] = $money_detail;
        $newid = $this->addMemberInfo($data);
        if ($newid) {
            session('u_id', $newid);
            session('u_user_name', $user_name);
            $sl = new SmsLogModel();
            $sl->unsetTemp();
            setMemberStatus($newid, 'phone', 1, 10, '手机');
            $wf = new WebsiteFlowsModel();
            $wf->regNumber();
            $cl = new CouponListModel();
            $cl->userCouponList($newid, 1);
            $cl->userCouponList($newid, 2);
            if ($data['recommend_id']) {
                $sp = new SpreadModel();
                $sp_data['uid'] = $newid;
                $sp_data['rid'] = $data['recommend_id'];
                $sp_data['suc_capital'] = 0;
                $sp_data['suc_num'] = 0;
                $sp_data['reward'] = 0;
                $sp_data['update'] = time();
                $sp->add($sp_data);
            }
            return array('status' => 1, 'msg' => '注册成功，请进行实名认证');
        } else {
            return array('status' => 0, 'msg' => '注册失败，请重试');
        }
    }

    /**
     * 注册普通会员
     * @param $obj
     * @return array
     */
    public function registerUser($obj)
    {
        $data['user_phone'] = text($obj['phone']);
        $data['user_name'] = text($obj['phone']);
        $user_name = $data['user_name'];
        $data['user_pass'] = md5($obj['pwd']);
        if ($obj['invite_user_id'] == 0) {
            if ($obj["invite"] != "") {
                $map['user_phone'] = $obj["invite"];
                $infop = $this->where($map)->find();
                $data['recommend_id'] = $infop["id"];
                $data['recommend_time'] = time();
            }
        } else {
            $data['recommend_id'] = $obj['invite_user_id'];
            $data['recommend_time'] = time();
        }
        $data['reg_time'] = time();
        $data['reg_ip'] = get_client_ip();
        $data['last_log_time'] = time();
        $data['last_log_ip'] = get_client_ip();
        $data['is_business'] = 0;

        $member_money['money_freeze'] = 0;
        $member_money['money_collect'] = 0;
        $member_money['account_money'] = 0;
        $member_money['back_money'] = 0;
        $member_info['cell_phone'] = text($obj['phone']);
        $data['Money'] = $member_money;
        $data['MemberInfo'] = $member_info;
        $money_detail['net_interest'] = 0;
        $data['MoneyDetail'] = $money_detail;
        $newid = $this->addMemberInfo($data);
        if ($newid) {
            session('u_id', $newid);
            session('u_user_name', $user_name);
            $sl = new SmsLogModel();
            $sl->unsetTemp();
            setMemberStatus($newid, 'phone', 1, 10, '手机');
            setMemberStatus($newid, 'id', 2, 0, '普通用户');
            $wf = new WebsiteFlowsModel();
            $wf->regNumber();
            $cl = new CouponListModel();
            $cl->userCouponList($newid, 1);
            $cl->userCouponList($newid, 2);
            if ($data['recommend_id']) {
                $sp = new SpreadModel();
                $sp_data['uid'] = $newid;
                $sp_data['rid'] = $data['recommend_id'];
                $sp_data['suc_capital'] = 0;
                $sp_data['suc_num'] = 0;
                $sp_data['reward'] = 0;
                $sp_data['update'] = time();
                $sp->add($sp_data);
            }
            return array('status' => 1, 'msg' => '注册成功，请进行实名认证');
        } else {
            return array('status' => 0, 'msg' => '注册失败，请重试');
        }
    }

    public function registerBusiness($obj)
    {
        $data['user_phone'] = text($obj['phone']);
        $data['user_name'] = text($obj['phone']);
        $user_name = $data['user_name'];
        $data['user_pass'] = md5($obj['pwd']);
        if ($obj['invite_user_id'] == 0) {
            if ($obj["invite"] != "") {
                $map['user_phone'] = $obj["invite"];
                $infop = $this->where($map)->find();
                $data['recommend_id'] = $infop["id"];
                $data['recommend_time'] = time();
            }
        } else {
            $data['recommend_id'] = $obj['invite_user_id'];
            $data['recommend_time'] = time();
        }
        $data['reg_time'] = time();
        $data['reg_ip'] = get_client_ip();
        $data['last_log_time'] = time();
        $data['last_log_ip'] = get_client_ip();
        $data['is_business'] = 1;

        $member_money['money_freeze'] = 0;
        $member_money['money_collect'] = 0;
        $member_money['account_money'] = 0;
        $member_money['back_money'] = 0;
        $member_info['cell_phone'] = text($obj['phone']);
        $data['Money'] = $member_money;
        $data['MemberInfo'] = $member_info;
        $money_detail['net_interest'] = 0;
        $data['MoneyDetail'] = $money_detail;
        $newid = $this->addMemberInfo($data);
        if ($newid) {
            session('u_id', $newid);
            session('u_user_name', $user_name);
            $sl = new SmsLogModel();
            $sl->unsetTemp();
            setMemberStatus($newid, 'phone', 1, 10, '手机');
            setMemberStatus($newid, 'business', 1, 10, '企业用户');
            setMemberStatus($newid, 'id', 2, 0, '普通用户');
            $wf = new WebsiteFlowsModel();
            $wf->regNumber();
            $cl = new CouponListModel();
            $cl->userCouponList($newid, 1);
            $cl->userCouponList($newid, 2);
            if ($data['recommend_id']) {
                $sp = new SpreadModel();
                $sp_data['uid'] = $newid;
                $sp_data['rid'] = $data['recommend_id'];
                $sp_data['suc_capital'] = 0;
                $sp_data['suc_num'] = 0;
                $sp_data['reward'] = 0;
                $sp_data['update'] = time();
                $sp->add($sp_data);
            }
            return array('status' => 1, 'msg' => '注册成功，请进行实名认证');
        } else {
            return array('status' => 0, 'msg' => '注册失败，请重试');
        }
    }

    /**
     * 实名认证
     * @param $uid
     * @param $obj
     * @return array
     */
    public function realNameAuth($uid, $obj)
    {
        $real_name = text($obj['real_name']);
        $id_card = text($obj['idcard']);
        if (empty($real_name) || empty($id_card))
            return array('status' => 0, 'msg' => "请填写真实姓名和身份证号码");
        $xuid = M('member_info')->getFieldByIdcard($id_card, 'uid');
        if ($xuid > 0 && $xuid != $uid)
            return array('status' => 0, 'msg' => "此身份证号码已被人使用");
        $minfo['id'] = $uid;
        $mdata['real_name'] = $real_name;
        $mdata['idcard'] = $id_card;
        $mdata['up_time'] = time();
        $minfo['MemberInfo'] = $mdata;
        $ndata['idcard'] = $id_card;
        $ndata['up_time'] = time();
        $id5liu = FS("Dynamic/id5");
        if ($id5liu['enable'] == 1) {
            $host = "http://idcard.market.alicloudapi.com"; //请求地址
            $path = "/lianzhuo/idcard";
            $method = "GET";
            $appcode = $id5liu['AppCode'];
            $headers = array();
            array_push($headers, "Authorization:APPCODE " . $appcode);
            $querys = "cardno={$id_card}&name=" . urlencode($real_name);
            $url = $host . $path . "?" . $querys;

            $curl = curl_init();
            curl_setopt($curl, CURLOPT_CUSTOMREQUEST, $method);
            curl_setopt($curl, CURLOPT_URL, $url);
            curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);
            curl_setopt($curl, CURLOPT_FAILONERROR, false);
            curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($curl, CURLOPT_HEADER, 0);
            if (1 == strpos("$" . $host, "https://")) {
                curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
                curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
            }
            $result = curl_exec($curl);
            $id5_rs = json_decode($result, true);

            if ($id5_rs['resp']['code'] == 0) {
                $ndata['status'] = 1;
                $ndata['deal_info'] = "三方实名认证成功";
                $minfo['NameApply'] = $ndata;
                $res = $this->updateMemberInfo($uid, $minfo);
                if ($res) {
                    setMemberStatus($uid, 'id', 1, 10, '实名');
                    return array('status' => 1, 'msg' => "认证成功");
                } else {
                    return array('status' => 0, 'msg' => "保存失败，请重试");
                }
            } else {
                return array('status' => 0, 'msg' => "实名认证失败。错误原因:" . $id5_rs['resp']['desc']);
            }
        } else {
            $member_status['id_status'] = 3;
            $ndata['status'] = 0;
            $minfo['NameApply'] = $ndata;
            $minfo['Verify'] = $member_status;
            $res = $this->updateMemberInfo($uid, $minfo);
            if ($res) {
                return array('status' => 1, 'msg' => "提交成功，等待审核");
            } else {
                return array('status' => 0, 'msg' => "保存失败，请重试");
            }
        }
    }

    /**
     * 企业认证
     */

    public function realBusinessAuth($uid, $obj)
    {
        $real_name = text($obj['real_name']);
        $real_code = $id_card = text($obj['idcard']);
        $business_name = text($obj['business_name']);
        $business_code = text($obj['business_code']);

        if (empty($real_name))
            return array('status' => 0, 'msg' => "请填写法人姓名");
        if (empty($real_code))
            return array('status' => 0, 'msg' => "请填写法人身份证号码");
        if (empty($business_name))
            return array('status' => 0, 'msg' => "请填写企业名称");
        if (empty($business_code))
            return array('status' => 0, 'msg' => "请填写营业执照");

        //region 个人认证
        $real_name = text($obj['real_name']);
        $id_card = text($obj['idcard']);

		if (empty($real_name) || empty($id_card))
            return array('status' => 0, 'msg' => "请填写真实姓名和身份证号码");
        $xuid = M('member_info')->getFieldByIdcard($id_card, 'uid');
		
        if ($xuid > 0 && $xuid != $uid)
            return array('status' => 0, 'msg' => "此身份证号码已被人使用");
        $minfo['id'] = $uid;
        $mdata['real_name'] = $real_name;
        $mdata['idcard'] = $id_card;
        $mdata['up_time'] = time();
        $minfo['MemberInfo'] = $mdata;
        $ndata['idcard'] = $id_card;
        $ndata['up_time'] = time();
        $id5liu = FS("Dynamic/id5");
        if ($id5liu['enable'] == 1) {
            $host = "http://idcard.market.alicloudapi.com"; //请求地址
            $path = "/lianzhuo/idcard";
            $method = "GET";
            $appcode = $id5liu['AppCode'];
            $headers = array();
            array_push($headers, "Authorization:APPCODE " . $appcode);
            $querys = "cardno={$id_card}&name=" . urlencode($real_name);
            $url = $host . $path . "?" . $querys;

            $curl = curl_init();
            curl_setopt($curl, CURLOPT_CUSTOMREQUEST, $method);
            curl_setopt($curl, CURLOPT_URL, $url);
            curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);
            curl_setopt($curl, CURLOPT_FAILONERROR, false);
            curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($curl, CURLOPT_HEADER, 0);
            if (1 == strpos("$" . $host, "https://")) {
                curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
                curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
            }
            $result = curl_exec($curl);
            $id5_rs = json_decode($result, true);

            if ($id5_rs['resp']['code'] == 0) {
                $ndata['status'] = 1;
                $ndata['deal_info'] = "三方实名认证成功";
                $minfo['NameApply'] = $ndata;
                $res = $this->updateMemberInfo($uid, $minfo);
                if (!$res) {
                    return array('status' => 0, 'msg' => "保存失败，请重试");
                }
            } else {
                return array('status' => 0, 'msg' => "实名认证失败。错误原因:" . $id5_rs['resp']['desc']);
            }
        } else {
            $member_status['id_status'] = 3;
            $ndata['status'] = 0;
            $minfo['NameApply'] = $ndata;
            $minfo['Verify'] = $member_status;
            $res = $this->updateMemberInfo($uid, $minfo);
            if (!$res) {
                return array('status' => 0, 'msg' => "保存失败，请重试");
            }
        }
        //endregion

        //region 添加企业认证
        $modelBusiness = new BusinessApplyModel();
        $dataBusiness = array(
            'uid'=>$uid,
            'add_time'=>time(),
            'status'=>0,
            'real_name' => $real_name,
            'real_code' => $real_code,
            'business_name' => $business_name,
            'business_code' => $business_code
        );

        if($modelBusiness->verityEmpty($dataBusiness['uid'],'缺少 uid'))
            return array('status'=>0,'msg'=>$modelBusiness->getError());
        if($modelBusiness->verityEmpty($dataBusiness['add_time'],'缺少 add_time'))
            return array('status'=>0,'msg'=>$modelBusiness->getError());
        if($modelBusiness->verityEmpty($dataBusiness['status'],'缺少 status'))
            return array('status'=>0,'msg'=>$modelBusiness->getError());

        $uinfo = $modelBusiness->where(array('uid'=>$uid))->find();

        if(!$uinfo){


            if(!$modelBusiness->add($dataBusiness))
                return array('status'=>0,'msg'=>'企业信息添加失败！');
            else{
                setMemberStatus($uid, 'id', 1, 10, '实名');
                return array('status'=>1,'msg'=>'企业信息添加成功！');
            }
        }else{
            return array('status'=>0,'msg'=>'该企业已被添加！');
        }
        //endregion
    }

    /**
     * 设置支付密码
     * @param $uid
     * @param $pin
     * @return array
     */
    public function setPinPass($uid, $pin)
    {
        $pin = MD5($pin);
        $map['id'] = $uid;
        $newid = $this->where($map)->setField('pin_pass', $pin);
        if ($newid) {
            return array('status' => 1, 'msg' => "设置成功");
        } else {
            return array('status' => 0, 'msg' => "设置失败，请重试");
        }
    }

    /**
     * 登录判断，全局通用
     * @param $obj
     * @param $token -  为1的时候不生成session  APP用
     * @return array
     */
    public function memberLogin($obj, $token = 0)
    {
        if (preg_match("/^1[34578]\d{9}$/", text($obj['sUserName']))) {
            $data['user_phone'] = text($obj['sUserName']);
        } else {
            (false !== strpos($obj['sUserName'], "@")) ? $data['user_email'] = text($obj['sUserName']) : $data['user_name'] = text($obj['sUserName']);
        }
        $field = "id,user_name,user_email,user_pass,is_ban,user_phone";
        $vo = $this->field($field)->where($data)->find();
        if ($vo['is_ban'] == 1)
            return array('status' => 0, 'msg' => '您的账户已被冻结，请联系客服处理！');

        if (!is_array($vo)) {
            return array('status' => 0, 'msg' => '用户名或者密码错误');
        } else {
            if ($vo['user_pass'] == md5($obj['sPassword'])) {
                $res = $this->_memberLogin($vo['id'], $token);
                if ($res) {
                    $wf = new WebsiteFlowsModel();
                    $wf->loginNumber();
                    return array('status' => 1, 'msg' => '登陆成功');
                } else {
                    return array('status' => 0, 'msg' => '系统繁忙请重试');
                }
            } else {
                return array('status' => 0, 'msg' => '用户名或者密码错误');
            }

        }
    }

    /**
     * 更新登录数据并生成session
     * @param $uid
     * @param int $token
     */
    public function _memberLogin($uid, $token = 0)
    {
        $per = C('DB_PREFIX');
        $table = "{$per}" . $this->tableName2;
        $field = "id,user_name,user_email,user_phone";
        $vo = $this->field($field)->find($uid);
        if (empty($token)) {
            foreach ($vo as $key => $v) {
                session("u_{$key}", $v);
            }
        }
        $data['last_log_ip'] = get_client_ip();
        $data['last_log_time'] = time();

        $up['add_time'] = time();
        $up['uid'] = $vo['id'];
        $up['ip'] = get_client_ip();
        $this->table($table)->add($up);

        return $this->updateMemberInfo($uid, $data);
    }

    public function bindBank($uid, $obj = array())
    {
        $link = array("Bank");
        $datag = get_global_setting();
        $bank_info = $this->getMemberInfo($uid, $link, "id");
        if (intval($datag['edit_bank']) != 1 && $bank_info['bank_num'] != '') {
            return array('status' => 0, 'msg' => "为了您的账户资金安全，银行卡已锁定，如需修改，请联系客服");
        }
        if (isset($obj['oldaccount']) && $obj['oldaccount'] != '') {
            if ($obj['oldaccount'] != decode_ts($bank_info['bank_num'], getcode())) {
                return array('status' => 0, 'msg' => "原银行卡号不对");
            }
        }

        $data['bank_num'] = encode_ts(text($obj['account']), getcode());
        $data['bank_name'] = text($obj['bankname']);
        $data['bank_address'] = text($obj['bankaddress']);
        $data['bank_province'] = $obj['province'];
        $data['bank_city'] = $obj['cityName'];
        $data['add_ip'] = get_client_ip();
        $data['add_time'] = time();
        $savedata['Bank'] = $data;
        $res = $this->updateMemberInfo($uid, $savedata);
        if ($res) {
            MTip('chk2', $uid);
            return array('status' => 1, 'msg' => "银行卡更新成功");
        } else {
            return array('status' => 0, 'msg' => "操作失败，请重试");
        }
    }

    /**
     * 用户登录记录
     * @param $uid
     * @param $field
     * @param int $limit
     * @return mixed
     */
    public function getMemberLogin($uid, $field, $limit = 20)
    {
        $map['m.id'] = $uid;
        $where['map'] = $map;
        $where['limit'] = $limit;
        $join[] = "__MEMBER_LOGIN__ ml on ml.uid = m.id";
        $list = $this->getList($field, $where, $join);
        foreach ($list['list'] as $k => $v) {
            $list['list'][$k]['address'] = sinaIPApi($v['ip']);
        }
        return $list;
    }

    /**
     * 额度申请
     * @param $uid
     * @param $apply_money
     * @param $apply_info
     * @param int $apply_type
     * @return array
     */
    public function memberApply($uid, $apply_money, $apply_info, $apply_type = 1)
    {
        $status = 0;
        $per = C('DB_PREFIX');
        $table = "{$per}" . $this->tableName1;
        $xtime = strtotime("-1 month");
        $map['uid'] = $uid;
        $vo = $this->table($table)->where($map)->order("id DESC")->find();
        $map['add_time'] = array('gt', $xtime);
        $xcount = $this->table($table)->where($map)->find();
        if (is_array($vo) && $vo['apply_status'] == 0) {
            $xs = "您的申请正在审核，请等待此次审核结束再提交新的申请";
        } elseif (is_array($xcount)) {
            $timex = date("Y-m-d", $xcount['add_time']);
            $xs = "一个月内只能进行一次额度申请，您已在{$timex}申请过了，如急需额度，请直接联系客服";
        } else {
            $apply['uid'] = $uid;
            $apply['apply_type'] = intval($apply_type);
            $apply['apply_money'] = floatval($apply_money);
            $apply['apply_info'] = text($apply_info);
            $apply['add_time'] = time();
            $apply['apply_status'] = 0;
            $apply['add_ip'] = get_client_ip();
            $nid = $this->table($table)->add($apply);
            if ($nid) {
                $status = 1;
                $xs = "申请已提交，请等待审核";
            } else {
                $xs = "申请提交失败，请重试";
            }
        }
        return array('status' => $status, 'msg' => $xs);
    }

    /**
     * 获取额度申请列表
     * @param string $field
     * @param array $obj
     * @param array $join
     * @return mixed
     */
    public function getApplyList($field = '*', $obj = array(), $join = array())
    {
        $map = $obj['map'];
        $group = $obj['group'];
        $order = $obj['order'];
        $limit = $obj['limit'];
        $per = C('DB_PREFIX');
        $table = "{$per}" . $this->tableName1;
        if ($order == '') {
            $order = '`id` desc';
            if (is_array($join)) {
                $order = 'ma.`id` desc';
            }
        }
        if (is_array($join)) {
            $table = "{$per}" . $this->tableName1 . " as ma";
        }
        return $this->_getList($field, $table, $map, $join, $group, $order, $limit);
    }

    /**
     * 查询出所有流转会员
     * @return array
     */
    public function getTransferUser()
    {
        $map['is_transfer'] = 1;
        $vo = $this->where($map)->getField("id,user_name");
        return $vo;
    }
}

?>