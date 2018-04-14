<?php

class PhpTools {

    //C("APP_ROOT") . "Lib/Pay/allinpay/libs/ArrayXml.class.php"
    const certFile = './Static/data/allinpay-pds.pem'; //通联公钥证书
    const privateKeyFile = './Static/data/20045200001581304.pem'; //商户私钥证书
    const password = '111111'; //商户私钥密码以及用户密码

//	const  apiUrl = 'http://172.16.1.11:8080/aipg/ProcessServlet';//通联系统对接请求地址（内网）

    public $arrayXml;

//    const apiUrl = 'http://113.108.182.3:8083/aipg/ProcessServlet';//通联系统对接请求地址（外网,商户测试时使用）
    const apiUrl = 'https://tlt.allinpay.com/aipg/ProcessServlet'; //（生产环境地址，上线时打开该注释）

    public function __construct() {
        $this->arrayXml = new ArrayAndXml();
    }

    /**
     * PHP版本低于 5.4.1 的在通联返回的是 GBK编码环境使用
     * 但是本地文件编码是 UTF-8
     *
     * @param string $hexstr
     * @return binary string
     */
    public function hextobin($hexstr) {
        $n = strlen($hexstr);
        $sbin = "";
        $i = 0;

        while ($i < $n) {
            $a = substr($hexstr, $i, 2);
            $c = pack("H*", $a);
            if ($i == 0) {
                $sbin = $c;
            } else {
                $sbin .= $c;
            }

            $i+=2;
        }

        return $sbin;
    }

    /**
     * 验签
     */
    public function verifyXml($xmlResponse){
        $xmlData=$xmlResponse;
        // 本地反馈结果验证签名开始
        $signature = '';
        if (preg_match('/<SIGNED_MSG>(.*)<\/SIGNED_MSG>/i', $xmlResponse, $matches)) {
            $signature = $matches[1];
        }

        $xmlResponseSrc = preg_replace('/<SIGNED_MSG>.*<\/SIGNED_MSG>/i', '', $xmlResponse);
//        $publicKey = file_get_contents(PhpTools::certFile);
//        print_r($publicKey);
        $xmlResponseSrc1 = mb_convert_encoding(str_replace('<', '&lt;', $xmlResponseSrc), "UTF-8", "GBK");
//        print_r('验签原文');
//        print_r($xmlResponseSrc1);
        $pubKeyId = openssl_get_publickey(file_get_contents(PhpTools::certFile));
//        print_r($pubKeyId);
        $flag = (bool) openssl_verify($xmlResponseSrc, hex2bin($signature), $pubKeyId);
        openssl_free_key($pubKeyId);
        //echo '<br/>'+$flag;
        if ($flag) {
//		    echo '<br/>Verified: <font color=green>Passed</font>.';
            // 变成数组，做自己相关业务逻辑
            $xmlResponse = mb_convert_encoding(str_replace('<?xml version="1.0" encoding="GBK"?>', '<?xml version="1.0" encoding="UTF-8"?>', $xmlResponseSrc), 'UTF-8', 'GBK');

            $arr = $this->arrayXml->parseString($xmlData);
            header("Content-type: text/html; charset=utf-8");
            //            print_r($arr);
            $trx_code = $arr['AIPG']['INFO']['TRX_CODE'][0];
            if($trx_code=="220001"){
                if(preg_match("/<RET_CODE>\d*<\/RET_CODE>/", $xmlData,$codeData)){
                    $code = str_replace("<RET_CODE>","",str_replace("</RET_CODE>","",$codeData[0]));
                    if($code=='0000'&&$arr['AIPG']['VALIDRET']['RET_CODE'][0]=='0000'){
                        return true;
                    }else{
                        return FALSE;
                    }
                }

            }elseif($trx_code=="100014"){
                $allinpay_code = $arr['AIPG']['INFO']['RET_CODE'][0];
                $allinpay_msg = $arr['AIPG']['INFO']['ERR_MSG'][0];
                $end_code = $arr['AIPG']['TRANSRET']['RET_CODE'][0];
                $end_msg = $arr['AIPG']['TRANSRET']['ERR_MSG'][0];
                $allinpay_code_success_arr = "0000";
                $allinpay_code_load_arr = array("2003","2008","2000","2007","2005","2001");
                if($allinpay_code==$allinpay_code_success_arr){
                    $allinpay_status = 1;
                    $end_status = 1;
                    return array("status"=>$allinpay_status,"msg"=>$allinpay_msg,"state"=>$end_status,"end_msg"=>$end_msg);
                }elseif(in_array($allinpay_code,$allinpay_code_load_arr)){
                    $allinpay_status = 1;
                    $end_status = 0;
                    return array("status"=>$allinpay_status,"msg"=>$allinpay_msg,"state"=>$end_status,"end_msg"=>$end_msg);
                }else{
                    $allinpay_status = 0;
                    $end_status = 0;
                    return array("status"=>$allinpay_status,"msg"=>$allinpay_msg,"state"=>$end_status,"end_msg"=>$end_msg);
                }
            }elseif($trx_code=="200004"){
                return $arr;
            }else{
                return FALSE;
            }
        } else {
            return FALSE;
        }
    }

    /**
     * 验签
     */
    public function verifyStr($orgStr, $signature) {
        echo '签名原文:' . $orgStr;
        $pubKeyId = openssl_get_publickey(file_get_contents(PhpTools::certFile));
        $flag = (bool) openssl_verify($orgStr, hex2bin($signature), $pubKeyId);
        openssl_free_key($pubKeyId);

        if ($flag) {
            echo '<br/>Verified: <font color=red>SUCC</font>.';
            return TRUE;
        } else {
            echo '<br/>Verified: <font color=red>Failed</font>.';
            return FALSE;
        }
    }

    /**
     * 签名
     */
    public function signXml($params) {

        $xmlSignSrc = $this->arrayXml->toXmlGBK($params, 'AIPG');
        $xmlSignSrc = str_replace("TRANS_DETAIL2", "TRANS_DETAIL", $xmlSignSrc);
//		echo ($xmlSignSrc);
        $privateKey = file_get_contents(PhpTools::privateKeyFile);

        $pKeyId = openssl_pkey_get_private($privateKey, PhpTools::password);
        openssl_sign($xmlSignSrc, $signature, $pKeyId);
        openssl_free_key($pKeyId);

        $params['INFO']['SIGNED_MSG'] = bin2hex($signature);

        $xmlSignPost = $this->arrayXml->toXmlGBK($params, 'AIPG');

        return $xmlSignPost;
    }

    /**
     * 发送请求
     */
    public function send($params){
//        print_r($params);
        $xmlSignPost=$this->signXml($params);
        $xmlSignPost=str_replace("TRANS_DETAIL2", "TRANS_DETAIL",$xmlSignPost);
//		$xmlSignPost=str_replace("TRANS_DETAIL3", "TRANS_DETAIL",$xmlSignPost);
//		$this->writelog($xmlSignPost);
        //echo $xmlSignPost;
        //echo "<br>";
        $response = cURL::factory()->post(PhpTools::apiUrl, $xmlSignPost);
//		echo "<br>";
        if (! isset($response['body'])) {
            return FALSE;
//		    die('Error: HTTPS REQUEST Bad.');
        }
        //获取返回报文
        $xmlResponse = $response['body'];
        //验证返回报文
        $result=$this->verifyXml($xmlResponse);
        return $result;
    }

    /**
     * 提交报文写入日志log.txt
     */
    public function writelog($str){
        $open=fopen("log.txt","a" );
        fwrite($open,$str);
        fclose($open);
    }

    public function getArrStr($arr){
        foreach($arr as $x=>$x_value) {
            $bufSignSrc = $bufSignSrc.$x_value."&";
        }
        $bufSignSrc= substr($bufSignSrc,0,strlen($bufSignSrc)-1);
        return $bufSignSrc;
    }

    public function signArr($arr){
        $str=$this->getArrStr($arr);
        $signature=$this->signStr($str);
        return $signature;
    }
//verify数组
    public function verifyArr($arr){
        $signature=$arr['signMsg'];
        unset($arr["signMsg"]);
        $orgStr=$this->getArrStr($arr);
        return $this->verifyStr($orgStr,$signature);;
    }

}

?>