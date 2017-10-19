
// 页面初始化
$(document).ready(function() {

	$(".back").click(function(){
		var url ="menuauto.jsp?a=1";
		toback(url);
	});

	seltype();
	  $('form').bootstrapValidator({
          message: 'This value is not valid',
          feedbackIcons: {
              valid: 'glyphicon glyphicon-ok',
              invalid: 'glyphicon glyphicon-remove',
              validating: 'glyphicon glyphicon-refresh'
          },
          fields: {
              usercode: {
                  message: '用户编码验证失败',
                  validators: {
                      notEmpty: {
                          message: '用户编码不能为空'
                      } ,
                      remote:{
                    	  message: '用户编码不存在，请重新输入',
                    	  url : path + "/menuController/distinctAgentCom.do",
                    	  delay:2000
                      }
                      
                     
                  }
              },
              menugrpcode: {
                  validators: {
                      notEmpty: {
                          message: '菜单组编码不能为空'
                      }
                  }
              },
         
          },
          
       
        submitHandler: function (validator, form, submitButton) {
      	  var ids1 =form.serialize();
      	 
      		  addproduct(ids1);
      	  
           
		
		
        }
    });
	  
	
	 function addproduct(ids1){
			$.ajax({
				type : "POST",
				url:path+"/menuController/ldusertomenugrpinsert.do",// 后台请求URL地址
				data : ids1,
				dataType : "json",
				success : function(data) {
					
					if(data=="1"){
						alert("新增成功");
						var url ="menuauto.jsp";
						toback(url);
					}else if(data=="0"){
						alert("新增失败");
					}
				},
				error : function() {
					alert("plus failed");
				}
			});
		}
	 
 function seltype(){
			$.ajax({
				type : "POST",
				url : path + "/menuController/selectldmenugrpa.do",// 后台请求URL地址
				success : function(data) {
				var select2=document.getElementById("menugrpcode");
					for(var i=0;i<data.length;i++){
					var select=document.getElementById("menugrpcode");
		            var option=document.createElement("option");
					option.value=data[i].menugrpcode;
					option.innerHTML=data[i].menugrpname;
					select.appendChild(option);
					
					
					}
					
						
				},
				
			});
			
		}




});



