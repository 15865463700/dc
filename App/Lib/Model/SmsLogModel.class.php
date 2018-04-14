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
 * Class SmsLogModel
 * 手机信息记录模型
 */
class SmsLogModel extends BaseModel {
	protected $tableName = 'xbo_smslog';
    protected $pk = "id";


    /**
     * 发送信息
     * @param $phone
     * @param $type
     * @param array $obj
     * @return bool
     */
    public function sendSms($phone,$type,$obj=array()){


        $smsTxt = FS("Dynamic/smstxt");
        $smsTxt = de_xie($smsTxt);
        $code = '';
        $str = $smsTxt[$type]['content'];
        if(isset($smsTxt[$type]['enable'])&&$smsTxt[$type]['enable']!=1){
            return false;
        }
        $m = new MembersModel();
        $map['user_phone'] = $phone;
        $vo = $m->field("id,user_name")->where($map)->find();
        $content = '';
        switch($type){
            case 'verify_phone':
            case 'safecode':
                $code = rand_string(6, 1);
                $content = str_replace(array("#CODE#"),array($code),$str);
                break;
            case 'vip':
                $content = str_replace(array("#USERNAME#"),array($vo['user_name']),$str);
                break;
            case 'approve_invest':
            case 'approve':
            case 'firstV':
            case 'refuse':
                $content = str_replace(array("#USERNAME#","#ID#"),array($vo['user_name'],$obj['borrow_id']),$str);
                break;
            case 'payback':
                $content = str_replace(array("#DATA#","#ID#","#ORDER#","#MONEY#"),array('',$obj['borrow_id'],$obj['sort_order'],$obj['money']),$str);
                break;
            case 'withdraw':
            case 'payonline':
                $content = str_replace(array("#USERNAME#","#DATE#","#MONEY#"),array($vo['user_name'],$obj['add_time'],$obj['money']),$str);
                break;
        }
        $data = array();
        $data['to_user_id'] = $vo['id'];
        $data['to_user_name'] = $vo['user_name'];
        $data['content'] = $content;
        $data['to_phone'] = $phone;
        $data['addtime'] = time();
        $data['addtime_des'] = date('Y-m-d=H-i-s');
        $data['back_status'] = 1;
        $data['add_ip']=get_client_ip();
        $cid = $this->add($data);
        if($cid){
            $res = sendsms($phone,$content);
            if($res){
                session("code_temp",$code);
                return true;
            }else{
                return false;
            }
        }else{
            return false;
        }
    }

    /**
     * 判断手机验证码session
     * @param $code
     * @param string $phone
     * @return bool
     */
    public function checkPhoneCode($code,$phone=''){
        if($code!=$_SESSION['code_temp']){
            return true;
        }
        if($phone!=''&&$_SESSION['temp_phone']!=$phone){
            return true;
        }
        return false;
    }

    /**
     * 删除无用session
     */
    public function unsetTemp(){
        session('code_temp',null);
        session('temp_phone',null);
    }

    /**
     * 验证码发送限制
     * @param $phone
     * @param $limit
     * @return bool
     */
    public function sendLimit($phone,$limit){
        $start = time()-1800;
        $end = time();
        $data['to_phone']=$phone;
        $data['addtime']=array("between", "{$start},{$end}");
        $result=$this->where($data)->count();
        if($result>=$limit){
            return true;
        }else{
            return false;
        }
    }
}
?>