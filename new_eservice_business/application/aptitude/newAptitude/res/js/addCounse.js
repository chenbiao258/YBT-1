
// 页面初始化
$(document).ready(function() {

	$('form').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	courseCode: {
                message: '课程编码验证失败',
                validators: {
                    notEmpty: {
                        message: '课程编码不能为空'
                    } ,
                    remote:{
                  	  message: '课程编码已存在，请重新输入',
                  	  url : path + "/ldtrainingController/distinctAgentCom.do",
                  	  delay:2000
                    }
                  
                }
            },
            courseTitle: {
                validators: {
                    notEmpty: {
                        message: '课程名称不能为空'
                    }
                }
             },    
        },
            
        submitHandler: function (validator, form, submitButton) {
      	  var ids1 =form.serialize();
      	$.ajax({
			type : "POST",
			url:path+"/ldtrainingController/saveAddBean.do",// 后台请求URL地址
			data : ids1,
			dataType : "json",
			success : function(data) {
				
				if(data=="1"){
					alert("新增成功");
					var url ="addCounse.jsp";
					toback(url);
				}else if(data=="2"){
					alert("新增失败");
				}
			},
			error : function() {
				alert("plus failed");
			}
		});
        }
    });
	
	 

});



