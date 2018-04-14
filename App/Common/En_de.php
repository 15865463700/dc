<?php
/**
 * Created by PhpStorm.
 * User: dell
 * Date: 2017-03-26
 * Time: 11:02
 */
function getcode(){
    $code = "asdjkhawj112";
    return $code['code'];
}
/**
 * @param $string
 * @param $key
 * @return string
 */
function encode_ts($string,$key){
    return authcode_ts($string,'ENCODE',$key);
}
/**
 * @param $string
 * @param $key
 * @return string
 */
function decode_ts($string,$key){
    return authcode_ts($string,'DECODE',$key);
}
/**
 * dz经典加解密函数
 * 来源：Discuz! 7.0
 * 依赖性：可独立提取使用
 *
 * @param string $string 要加密/解密的字符串
 * @param string $operation 操作类型，可选为'DECODE'（默认）或者'ENCODE'
 * @param string $key 密钥，必须传入，否则将中断php脚本运行。
 * @param int $expiry 有效期
 * @return string
 */
function authcode_ts($string, $operation = 'DECODE', $key, $expiry = 0) {
    $ckey_length = 4;	// 随机密钥长度 取值 0-32;
    // 加入随机密钥，可以令密文无任何规律，即便是原文和密钥完全相同，加密结果也会每次不同，增大破解难度。
    // 取值越大，密文变动规律越大，密文变化 = 16 的 $ckey_length 次方
    // 当此值为 0 时，则不产生随机密钥

    //取消UC_KEY，改为必须传入$key才能运行
    if(empty($key)){
        exit('PARAM $key IS EMPTY! ENCODE/DECODE IS NOT WORK!');
    }else{
        $key = md5($key);
    }


    $keya = md5(substr($key, 0, 16));
    $keyb = md5(substr($key, 16, 16));
    $keyc = $ckey_length ? ($operation == 'DECODE' ? substr($string, 0, $ckey_length): substr(md5(microtime()), -$ckey_length)) : '';

    $cryptkey = $keya.md5($keya.$keyc);
    $key_length = strlen($cryptkey);

    $string = $operation == 'DECODE' ? base64_decode(substr($string, $ckey_length)) : sprintf('%010d', $expiry ? $expiry + time() : 0).substr(md5($string.$keyb), 0, 16).$string;
    $string_length = strlen($string);

    $result = '';
    $box = range(0, 255);

    $rndkey = array();
    for($i = 0; $i <= 255; $i++) {
        $rndkey[$i] = ord($cryptkey[$i % $key_length]);
    }

    for($j = $i = 0; $i < 256; $i++) {
        $j = ($j + $box[$i] + $rndkey[$i]) % 256;
        $tmp = $box[$i];
        $box[$i] = $box[$j];
        $box[$j] = $tmp;
    }

    for($a = $j = $i = 0; $i < $string_length; $i++) {
        $a = ($a + 1) % 256;
        $j = ($j + $box[$a]) % 256;
        $tmp = $box[$a];
        $box[$a] = $box[$j];
        $box[$j] = $tmp;
        $result .= chr(ord($string[$i]) ^ ($box[($box[$a] + $box[$j]) % 256]));
    }

    if($operation == 'DECODE') {
        if((substr($result, 0, 10) == 0 || substr($result, 0, 10) - time() > 0) && substr($result, 10, 16) == substr(md5(substr($result, 26).$keyb), 0, 16)) {
            return substr($result, 26);
        } else {
            return '';
        }
    } else {
        return $keyc.str_replace('=', '', base64_encode($result));
    }

}