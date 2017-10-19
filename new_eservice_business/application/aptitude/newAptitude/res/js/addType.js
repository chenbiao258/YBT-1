
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
     	  codename: {
               message: 'codename验证失败',
               validators: {
                   notEmpty: {
                       message: 'codename不能为空'
                   } ,
                 }
           },
           code: {
               message: '编码验证失败',
               validators: {
                   notEmpty: {
                       message: '编码不能为空'
                   } ,
                   remote:{
                 	  message: '编码已存在，请重新输入',
                 	  url : path + "/LdcodeController/distinctlaqualiinfo.do",
                 	  delay:2000
                   }
                 }
           },
        
       },
       
      
       submitHandler: function (validator, form, submitButton) {
     	 var ids1 =form.serialize();
     		addproduct(ids1);
     	 
		
		
       }
   });
	 // seltype();
	
	 function addproduct(ids1){
			$.ajax({
				type : "POST",
				url:path+"/LdcodeController/SaveAddBeans.do",// 后台请求URL地址
				data : ids1,
				dataType : "json",
				success : function(data) {
					
					if(data=="1"){
						alert("新增成功");
						var url ="addType.jsp";
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
	 


	 
	 //生成编号
	 function seltype(){
			$.ajax({
						type : "POST",
						url : path + "/LdcodeController/SelectByCodetype.do",// 后台请求URL地址
						data : "userCode=" +"laqualiinfo",
						success : function(data) {
							var s=parseInt(data[data.length-1].code)+1;
							var n=0;
							n=s;
							if(s<10){
								n='00'+s;
							}else if(s<100){
								n='0'+s;
							}
							
							$('#code').val(n);
							
							}
						
				});
			

		}
	 

});



