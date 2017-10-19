var tab_d = $('#cusTable');
// 页面初始化
$(document).ready(function() {

	 $("#reset").click(function() {
		 $('#forms')[0].reset();
	 });
});



$(function(){

	  $('form').bootstrapValidator({
          message: 'This value is not valid',
          feedbackIcons: {
              valid: 'glyphicon glyphicon-ok',
              invalid: 'glyphicon glyphicon-remove',
              validating: 'glyphicon glyphicon-refresh'
          },
          fields: {
        	  emplID: {
                  message: 'emplID验证失败',
                  validators: {
                      notEmpty: {
                          message: 'emplID不能为空'
                      } ,
                    }
              },
              department: {
                  validators: {
                      notEmpty: {
                          message: 'department不能为空'
                      }
                  }
              },
              name:{
                validators: {
                      notEmpty: {
                          message: 'name不能为空'
                      }
                  }
               },
               jobCode: {
                  validators: {
                      notEmpty: {
                          message: 'jobCode不能为空'
                      }
                  }
              },
             /*  makedate:{
            	   validators: {
            		   date:{
            		format:'yyyy-mm-dd', 
            		message:'The format is yyyy-mm-dd'
            		   },
            		  notEmpty: {
                           message: '成立日期不能为空'
                       },
            	   },
               },*/
               
           
              companyCode:{
                validators: {
                      notEmpty: {
                          message: 'companyCode不能为空'
                      }
                  }
               },
               
               
               companyName:{
                validators: {
                      notEmpty: {
                          message: 'companyName不能为空'
                      }
                  }
               },
               
               operator:{
                validators: {
                      notEmpty: {
                          message: '操作员不能为空'
                      }
                  }
               },
               
               status:{
                   validators: {
                         notEmpty: {
                             message: 'status不能为空'
                         }
                     }
                  },
                  
               location:{
                validators: {
                      notEmpty: {
                          message: 'location不能为空'
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
			url:path+"/UserManageController/insertA.do",// 后台请求URL地址
			data : ids1,
			dataType : "json",
			success : function(data) {
			  if(data=="1"){
				  alert("添加成功，数据已添加到中间表");
				  url="userAdd.jsp";
				  toback(url);
			  }
			  if(data=="2"){
				  alert("添加成功");
				  url="userAdd.jsp";
				  toback(url);
			  }
			  
			  
			},
			error : function() {
				alert("plus failed");
			}
		});
	}

	  function addParam(ids1){
	  		// 去取参数
	  		var qualificationInfo = $("#com").children(
	  				"tr");
	  		 var ic=$("#agentcom").val();
	  		var count=false;
	  		for (var i = 0; i < qualificationInfo.length; i++) {

	  			var tdArr = qualificationInfo.eq(i).find("td");
	  			
	  			var fundname = tdArr.eq(0).find('input').val();
	  			var fundcode = tdArr.eq(1).find('input').val();
	  			var riskrating = tdArr.eq(2).find('input').val();
	  			
	  			//校验
	  			if(riskrating == ''||riskrating == null){
	  				alert("风险等级不能为空");
	  				$('#form').bootstrapValidator('disableSubmitButtons', false);  
	  				count=false;
	  				return;
	  			}if(riskrating != ''||riskrating !=null){
	  				count=true;
	  				
	  			}
	  		
	   }
	  		if(count){
	  			for (var i = 0; i < qualificationInfo.length; i++) {

		  			var tdArr = qualificationInfo.eq(i).find("td");
		  			var fundname = tdArr.eq(0).find('input').val();
		  			var fundcode = tdArr.eq(1).find('input').val();
		  			var riskrating = tdArr.eq(2).find('input').val();
		  		insertParam(ic,fundname,fundcode,riskrating,qualificationInfo.length-1,i,ids1);
	  			}
	  		}else{
  				alert('false');
  			}
	  }


	  function insertParam(ic,fundname,fundcode,riskrating,i,j,ids1){
	  	
	  	$.ajax({
	  			type : "POST",
	  			url:path+"/JoinaccountaController/saveAddBean.do",// 后台请求URL地址
	  			data :"ic="+ic+"&fundname="+fundname+"&fundcode="+fundcode+"&riskrating="+riskrating,
	  			dataType : "json",
	  			success : function(data) {
	  				if(data=="1"&&i==j){
	  					alert("投连险账户添加成功");
	  					addproduct(ids1);
	  				}
	  			},
	  			error : function() {
	  				alert("plus failed");
	  			}
	  		});
	  }
	  

});
