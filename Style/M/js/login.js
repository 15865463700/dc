function LoginSubmit() {
	var ii = layer.load();
	$.ajax({
		url: curpath+"/actlogin/",
		data: {"sUserName": $("#txtUser").val(),"sPassword": $("#txtPwd").val()},
		timeout: 5000,
		cache: false,
		type: "post",
		dataType: "json",
		success: function (d, s, r) {
            layer.close(ii);
            if(d.status==1){
                layer.msg("登录成功",{icon:6,shade:0.3},function(){
                    if(d.url==''){
                        window.location.href= '/user';
                    }else{
                        window.location.href= d.url;
                    }
                });
            }else{
                layer.msg(d.message,{icon:5,shade:0.3});
            }
		}
	});
}
