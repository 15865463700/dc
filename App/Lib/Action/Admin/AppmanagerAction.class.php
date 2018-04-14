<?php
class AppmanagerAction extends ACommonAction
{

	public function banner(){
        $info = M("app_manager")->field("banner_img")->where("id=1")->find();
        $this->assign("vo",$info);
        $this->display();
    }
    public function bannersave(){
        if(!empty($_POST['swfimglist'])){
            foreach($_POST['swfimglist'] as $key=>$v){
                $row[$key]['img'] = substr($v,1);
                $row[$key]['info'] = $_POST['picinfo'][$key];
            }
            $data["banner_img"]=serialize($row);
        }
        $data["id"] =1;
        $count = M("app_manager")->where("id = 1")->count();
        if($count==0){
            $res = M("app_manager")->add($data);
        }else{
            $res = M("app_manager")->where("id = 1")->save($data);
        }
        if($res){
            alogs("app_manager",0,1,'成功执行了banner图添加操作！');//管理员操作日志
            $this->success("修改成功");
        }else{
            alogs("app_manager",0,0,'banner图添加操作失败！');//管理员操作日志
            $this->error("修改失败");
        }
    }
    public function more(){
        $info = M("app_manager")->where("id=1")->find();
        $this->assign("vo",$info);
        $this->display();
    }
    public function moresave(){
        if(!empty($_FILES['more_img']['name'])){
            $this->saveRule = date("YmdHis",time()).rand(0,1000);
            $this->savePathNew = C('ADMIN_UPLOAD_DIR').'App/' ;
            $this->thumbMaxWidth = C('ARTICLE_UPLOAD_W');
            $this->thumbMaxHeight = C('ARTICLE_UPLOAD_H');
            $info = $this->CUpload();
            $more_img= $info[0]['savepath'].$info[0]['savename'];
        }
        $data['more_img'] = $more_img;
        $data['text_content'] = $_POST['text_content'];
        $data['weixin'] = $_POST['weixin'];
        $data['weibo'] = $_POST['weibo'];
        $data['kefu'] = $_POST['kefu'];
        $data['kefu_time'] = $_POST['kefu_time'];
        $data['kefu_time'] = $_POST['kefu_time'];
        $count = M("app_manager")->where("id = 1")->count();
        if($count==0){
            $res = M("app_manager")->add($data);
        }else{
            $res = M("app_manager")->where("id = 1")->save($data);
        }
        if($res){
            alogs("app_manager",0,1,'成功执行了修改App的更多操作！');//管理员操作日志
            $this->success("修改成功");
        }else{
            alogs("app_manager",0,0,'修改App的更多操作失败！');//管理员操作日志
            $this->error("修改失败");
        }
    }
    public function erweima(){
        $info = M("app_manager")->field("erweima")->where("id=1")->find();
        $this->assign("vo",$info);
        $this->display();
    }
    public function erweimasave(){
        if(!empty($_FILES['erweima']['name'])){
            $this->saveRule = date("YmdHis",time()).rand(0,1000);
            $this->savePathNew = C('ADMIN_UPLOAD_DIR').'App/' ;
            $this->thumbMaxWidth = C('ARTICLE_UPLOAD_W');
            $this->thumbMaxHeight = C('ARTICLE_UPLOAD_H');
            $info = $this->CUpload();
            $erweima= $info[0]['savepath'].$info[0]['savename'];
        }
        $data['erweima'] = $erweima;
        $count = M("app_manager")->where("id = 1")->count();
        if($count==0){
            $res = M("app_manager")->add($data);
        }else{
            $res = M("app_manager")->where("id = 1")->save($data);
        }
        if($res){
            alogs("app_manager",0,1,'成功执行了修改App二维码操作！');//管理员操作日志
            $this->success("修改成功");
        }else{
            alogs("app_manager",0,0,'修改App二维码操作失败！');//管理员操作日志
            $this->error("修改失败");
        }
    }
    public function swfUpload( )
    {
        if ( $_POST['picpath'] )
        {
            $imgpath = substr( $_POST['picpath'], 1 );
            if ( in_array( $imgpath, $_SESSION['imgfiles'] ) )
            {
                unlink( C( "WEB_ROOT" ).$imgpath );
                $thumb = get_thumb_pic( $imgpath );
                $res = unlink(C("WEB_ROOT").$thumb );
                if ( $res )
                {
                    alogs("app_manager",0,1,'成功执行了删除banner图操作！');//管理员操作日志
                    $this->success("删除成功", "", $_POST['oid'] );
                }
                else
                {
                    alogs("app_manager",0,0,'删除banner图操作失败！');//管理员操作日志
                    $this->error( "删除失败", "", $_POST['oid'] );
                }
            }
            else
            {
                $this->error( "图片不存在", "", $_POST['oid'] );
            }
        }
        else
        {
            $this->savePathNew = C( "ADMIN_UPLOAD_DIR" )."App/";
            $this->thumbMaxWidth = "100";
            $this->thumbMaxHeight = "100";
            $this->saveRule = date( "YmdHis", time()).rand(0,1000);
            $info = $this->CUpload();
            $data['product_thumb'] = $info[0]['savepath'].$info[0]['savename'];
            if ( !isset( $_SESSION['count_file'] ) )
            {
                $_SESSION['count_file'] = 1;
            }
            else
            {
                ++$_SESSION['count_file'];
            }
            $_SESSION['imgfiles'][$_SESSION['count_file']] = $data['product_thumb'];
            echo "{$_SESSION['count_file']}:/".$data['product_thumb'];
        }
    }
}

?>
