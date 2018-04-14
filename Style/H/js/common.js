function plus(id){
	var cnum = parseInt($("#tnum_"+id).val());
	cnum++;
	$("#tnum_"+id).val(cnum+'份');
}
function minus(id){
	var cnum = parseInt($("#tnum_"+id).val());
	cnum=(cnum-1)>0?(cnum-1):1;
	$("#tnum_"+id).val(cnum+'份');
}


function FTransfer(id){
	var tnum = parseInt($(".tnum").val());
	var chooseWay = $("input[name='radios']:checked").val();
	if(chooseWay==null){
        layer.msg("请选择利息使用方式",{icon:5,shade:0.3});
    	return;
	}
  	$.ajax({
	  url: Transfer_invest_url+"/investcheck",
	  type: "post",
	  dataType: "json",
	  data: {"tnum":tnum,'borrow_id':id},
	  success: function(d) {
          if(d.status == 1){
              var ii = layer.load();
              $.get(Transfer_invest_url+"/ajax_invest?id="+id+"&num="+tnum+"&chooseWay="+chooseWay,
                  {},
                  function(e){
                      layer.close(ii);
                      if(e.status==0){
                          layer.msg(e.message+"1",{icon:5,shade:0.3});
                      }else{
                          layer.open({
                              type:1,
                              title:"立即投标",
                              area:['440px','300px'],
                              content: e.content,
                              resize:false,
                              zindex:66,
                              skin:"layui-layer-blue"
                          })
                      }
                  },
                  "json"
              );
          }else{
              layer.msg(d.message+"2",{icon:5,shade:0.3});
          }
	  }
  });
}
function T_PostData() {
	var tnum = parseInt($("#transfer_invest_num").val());
  var pin = $("#T_pin").val();
  var borrow_id = $("#T_borrow_id").val();
  if(pin==""){
      layer.msg("请输入支付密码",{icon:5,shade:0.3});
	return false;
  }
  $.ajax({
	  url: Transfer_invest_url+"/investcheck1",
	  type: "post",
	  dataType: "json",
	  data: {'pin':pin,'tnum':tnum,'borrow_id':borrow_id},
	  success: function(d) {
			   if (d.status == 1) {
                   layer.confirm(
                       d.message,
                       {icon:3,title:"会员投标提示",zindex:99,btn:['确定','取消']},
                       function(){
                           document.forms.investForm.submit();
                       }
                   );
			  }else{
                   layer.msg(d.message,{icon:5,shade:0.3});
			  }

	  }
  });
}
