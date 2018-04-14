var leftsecond = 30;
var timer = null;
function phone_onblur(){
    var phone = $.trim($("#phone").val());
    var pat = new RegExp("^1[3|4|5|8|7][0-9]\\d{8}$", "i");
    if(pat.test(phone)){
        show_result('load','phone');
        $.ajax({
                type: "post",
                url: curpath_new+"/checkphone",
                dataType: "json",
                data: {phone:phone},
                success:function(d){
                    if(d.status==1){
                        show_result('yes','phone');
                    }else{
                        show_result('no','phone');
                    }
                }
            }
        );
    }else{
        show_result('no','phone');
    }
}
function invite_onblur(){
    var invite = $.trim($("#invite").val());
    if(invite==''){
        $('#invite_err').removeClass('confirm_yes').removeClass('confirm_load').removeClass('confirm_no');
        return;
    }
    var pat = new RegExp("^1[3|4|5|8|7][0-9]\\d{8}$", "i");
    if(pat.test(invite)){
        show_result('load','invite');
        $.ajax({
                type: "post",
                url: curpath_new+"/checkphone",
                dataType: "json",
                data: {phone:invite},
                success:function(d){
                    if(d.status==1){
                        show_result('no','invite');
                    }else{
                        show_result('yes','invite');
                    }
                }
            }
        );
    }else{
        show_result('no','invite');
    }
}
function img_code_onblur(){
    var img_code = $("#img_code").val();
    show_result('load','img_code');
    $.ajax({
            type: "post",
            url: curpath_new+"/checkimgcode",
            dataType: "json",
            data: {img_code:img_code},
            success:function(d){
                if(d.status==1){
                    show_result('yes','img_code');
                }else{
                    show_result('no','img_code');
                }
            }
        }
    );
}
function phone_code_onblur(){
    var phone_code = $("#phone_code").val();
    show_result('load','phone_code');
    $.ajax({
            type: "post",
            url: curpath_new+"/checkphonecode",
            dataType: "json",
            data: {phone_code:phone_code},
            success:function(d){
                if(d.status==1){
                    show_result('yes','phone_code');
                }else{
                    show_result('no','phone_code');
                }
            }
        }
    );
}
function pin_onblur() {
    var pin = $.trim($("#pin").val());
    var pat = new RegExp("^.{6,16}$", "i"); 
    if (pat.test(pin)) {
        show_result('yes','pin');
    }
    else {
        show_result('no','pin');
    }
}
function pin_c_onblur() {
    var pin = $("#pin").val();
    var pin_c = $("#pin_c").val();
    if (pin == pin_c&&pin_c!='') {
        show_result('yes','pin_c');
    }
    else {
        show_result('no','pin_c');
    }
}
function password_onblur() {
    var password = $.trim($("#password").val());
    var pat = new RegExp("^.{6,20}$", "i");
    if (pat.test(password)) {
        show_result('yes','password');
    }
    else {
        show_result('no','password');
    }
}
function password_c_onblur() {
    var password = $("#password").val();
    var password_c = $("#password_c").val();
    if (password == password_c&&password_c!='') {
        show_result('yes','password_c');
    }
    else {
        show_result('no','password_c');
    }
}
function smssend(){
    if("获取短信验证码" !=$("#sms-btn").val())
    {
        return;
    }
    var mobile = $("#phone").val();
    if(!$('#phone_err').hasClass('confirm_yes')){
        return;
    }
    //if(!$('#img_code_err').hasClass('confirm_yes')){
    //    return;
    //}
    var ii = layer.load();
    $.ajax({
        url: curpath_new+"/sendphone/",
        type: "post",
        dataType: "json",
        data: {"phone":mobile,"code":$("#img_code").val()},
        success: function(d) {
            leftsecond = 60;
            layer.close(ii);
            if (d.status == 1) {
                layer.msg('发送成功',{icon:6,shade:0.3});
                $("#sms-btn").val("发送成功");
                clearInterval(timer);
                timer = setInterval(setLeftTime, 1000, "1");
            }else if(d.status == 3){
                layer.msg(d.message,{icon:5,shade:0.3});
                $("#imVcode").trigger("click");
            }else {
                layer.msg(d.message,{icon:5,shade:0.3});
                $("#imVcode").trigger("click");
            }
        }
    });
}
function setLeftTime() {
    var second = Math.floor(leftsecond);
    $("#sms-btn").val(second+"秒");
    leftsecond--;
    if (leftsecond < 1) {
        $("#sms-btn").val("可重新发送！");
        clearInterval(timer);
        try {
            $("#sms-btn").val("获取短信验证码");
        } catch (E) { }
        return;
    }
}
function submit_reg(){
    if(!$('#xieyi').is(':checked')){
        layer.msg('请先阅读《注册服务协议》并确认',{icon:5,shade:0.3});
        return;
    }
    if($(".confirm_no").length > 0){
        layer.msg('请更改错误的注册信息',{icon:5,shade:0.3});
        return;
    }
    if($(".confirm_yes").length >= 5){

        var phone = $('#phone').val();
        var phone_code = $('#phone_code').val();
        var password = $('#password').val();
        var invite = $('#invite').val();
        var invite_user_id = $('#invite_user_id').val();

        var ii = layer.load();
        $.ajax({
            url: curpath_new+"/reg_action/",
            data: {phone:phone,phone_code:phone_code,password:password,invite:invite,invite_user_id:invite_user_id},
            type: "post",
            dataType: "json",
            success: function (d) {
                layer.close(ii);
                if(d.status==1){
                    layer.msg(d.message,{icon:6,shade:0.3});
                    $("#cd-next").trigger("click");
                }else{
                    layer.msg(d.message,{icon:5,shade:0.3});
                }
            }
        });

    }else{
        layer.msg("请更改错误的注册信息",{icon:5,shade:0.3});
        return;
    }


}

function real_name_onblur(){
    var real_name = $.trim($('#real_name').val());
    if(real_name==''){
        show_result('no','real_name');
    }else{
        show_result('yes','real_name');
    }
}
function idcard_onblur(){
    var idcard = $.trim($('#idcard').val());
    if(idcard==''){
        show_result('no','idcard');
    }else{
        var area = { 11: "北京", 12: "天津", 13: "河北", 14: "山西", 15: "内蒙古", 21: "辽宁", 22: "吉林", 23: "黑龙江", 31: "上海", 32: "江苏", 33: "浙江", 34: "安徽", 35: "福建", 36: "江西", 37: "山东", 41: "河南", 42: "湖北", 43: "湖南", 44: "广东", 45: "广西", 46: "海南", 50: "重庆", 51: "四川", 52: "贵州", 53: "云南", 54: "西藏", 61: "陕西", 62: "甘肃", 63: "青海", 64: "宁夏", 65: "xinjiang", 71: "台湾", 81: "香港", 82: "澳门", 91: "国外" }
        var Y, JYM;
        var S, M;
        var idcard_array = new Array();
        idcard_array = idcard.split("");
        if (area[parseInt(idcard.substr(0, 2))] == null) show_result('no','idcard');
        switch (idcard.length) {
            case 15:
                if ((parseInt(idcard.substr(6, 2)) + 1900) % 4 == 0 || ((parseInt(idcard.substr(6, 2)) + 1900) % 100 == 0 && (parseInt(idcard.substr(6, 2)) + 1900) % 4 == 0)) {
                    ereg = /^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$/; //测试出生日期的合法性
                }
                else {
                    ereg = /^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$/; //测试出生日期的合法性
                }
                if (ereg.test(idcard))
                    show_result('yes','idcard');
                else
                    show_result('no','idcard');
                break;
            case 18:
                if (parseInt(idcard.substr(6, 4)) % 4 == 0 || (parseInt(idcard.substr(6, 4)) % 100 == 0 && parseInt(idcard.substr(6, 4)) % 4 == 0)) {
                    ereg = /^[1-9][0-9]{5}[0-9]{4}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$/; //闰年出生日期的合法性正则表达式
                }
                else {
                    ereg = /^[1-9][0-9]{5}[0-9]{4}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$/; //平年出生日期的合法性正则表达式
                }
                if (ereg.test(idcard)) {
                    S = (parseInt(idcard_array[0]) + parseInt(idcard_array[10])) * 7 + (parseInt(idcard_array[1]) + parseInt(idcard_array[11])) * 9 + (parseInt(idcard_array[2]) + parseInt(idcard_array[12])) * 10 + (parseInt(idcard_array[3]) + parseInt(idcard_array[13])) * 5 + (parseInt(idcard_array[4]) + parseInt(idcard_array[14])) * 8 + (parseInt(idcard_array[5]) + parseInt(idcard_array[15])) * 4 + (parseInt(idcard_array[6]) + parseInt(idcard_array[16])) * 2 + parseInt(idcard_array[7]) * 1 + parseInt(idcard_array[8]) * 6 + parseInt(idcard_array[9]) * 3;
                    Y = S % 11;
                    M = "F";
                    JYM = "10X98765432";
                    M = JYM.substr(Y, 1);
                    if (M == idcard_array[17])
                        show_result('yes','idcard');
                    else
                        show_result('no','idcard');
                }
                else
                    show_result('no','idcard');
                break;
            default:
                show_result('no','idcard');
                break;
        }
    }
}
function submit_real(){
    var real = $('#real_name_err').hasClass('confirm_yes');
    var idcard_err = $('#idcard_err').hasClass('confirm_yes');
    if(real&&idcard_err){

        var real_name = $('#real_name').val();
        var idcard = $('#idcard').val();
        var ii = layer.load();
        $.ajax({
            url: curpath_new+"/checkidcard/",
            data: {real_name:real_name,idcard:idcard},
            type: "post",
            dataType: "json",
            success: function (d) {
                layer.close(ii);
                if(d.status==1){
                    layer.msg(d.message,{icon:6,shade:0.3});
                    $("#cd-next").trigger("click");
                }else{
                    layer.msg(d.message,{icon:5,shade:0.3});
                }
            }
        });

    }else{
        layer.msg("请更改错误的实名信息",{icon:5,shade:0.3});
        return;
    }
}

function submit_pin(){
    var pin_err = $('#pin_err').hasClass('confirm_yes');
    var pin_c_err = $('#pin_c_err').hasClass('confirm_yes');
    if(pin_err&&pin_c_err){

        var pin = $('#pin').val();
        var tt = layer.load();
        $.ajax({
            url: curpath_new+"/savepinpass/",
            type: "post",
            dataType: "json",
            data: {"pin":pin},
            success: function(d) {
                layer.close(tt);
                if(d.status==1){
                    layer.msg(d.message,{icon:6,shade:0.3});
                    $("#cd-next").trigger("click");
                }else{
                    layer.msg(d.message,{icon:5,shade:0.3});
                }
            }
        });

    }else{
        layer.msg("交易密码填写有误",{icon:5});
        return;
    }
}
function show_result(status,id){
    $('#'+id+'_err').removeClass('confirm_yes').removeClass('confirm_load').removeClass('confirm_no').addClass('confirm_'+status);
}