<?php
    /**
    * 分享有礼
    */
    class ShareAction extends Action
    {
        
         public function share()
         {
			$uid = $_GET['uid'];
			$url = "http://".$_SERVER['HTTP_HOST']."/m/pub/regist.html?fxid={$uid}";
			$file = "Static/share/qrcode_{$uid}.png";
			if(!session('u_id')){
				header('location:'.$url);
			}

			if(!file_exists($file))
			{
				require_once( C("APP_ROOT")."Lib/Phpqrcode/phpqrcode.php");
				$errorCorrectionLevel = 'L';//容错级别
				$matrixPointSize = 6;//生成图片大小
				QRcode::png(text($url),"Static/share/qrcode_{$uid}.png", $errorCorrectionLevel, $matrixPointSize, 2);
			}
			$info["img_src"] = "http://".$_SERVER['HTTP_HOST']."/Static/share/qrcode_{$uid}.png";
			$info["img_link"] = $url;
			$info["fxid"] = $uid;
			$this->assign("info",$info);
            $this->display();
         }
         
    }
?>
