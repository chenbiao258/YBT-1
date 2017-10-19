$(document).ready(function(){
	
	$("#formlogin").submit(function(){
		
		$.ajax({
			url:path + "/login/checkLogin.do",
			data:$('#formlogin').serialize(),
			async :false,
			type:'post',
			dataType:'json',
			error:function(XMLHttpRequest, textStatus, errorThrown){
				alert("系统访问异常，请联系管理员");
			},
			success:function(checkRes){
				
				//登录失败，提示错误信息
				if(checkRes.success !="true" && checkRes.success != true){
					
					$("#login-message").empty();
					$("#login-message").append(checkRes.msg);
					$("#login-message").show();
					
				}
				else{
					var msg = checkRes.msg;
					msg = $.trim(msg);
					
					//如果有提示信息，则弹出信息
					if(msg != null && msg !="" && msg !="null" && msg != undefined && msg != "undefined"){
						alert(msg);
					}
					/*window.location = path + "/application/newTestingCenter/newCont/jsp/forms-wizard.html"; */
					//window.location = path + "/application/main/jsp/main.jsp";
					var url=path + "/application/main1/jsp/main.jsp";
					window.location = url;
				}
			}
		});
		
		return false;
	});
});
