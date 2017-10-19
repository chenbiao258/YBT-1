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
        	  staffid: {
                  message: 'staffid验证失败',
                  validators: {
                      notEmpty: {
                          message: 'staffid不能为空'
                      } ,
                    }
              },
              licensesCode: {
                  validators: {
                      notEmpty: {
                          message: 'licensesCode不能为空'
                      }
                  }
              },
              licensesCertificationsDescr:{
                validators: {
                      notEmpty: {
                          message: 'licensesCertificationsDescr不能为空'
                      }
                  }
               },
               verified: {
                  validators: {
                      notEmpty: {
                          message: 'verified不能为空'
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
               
           
           renewal:{
                validators: {
                      notEmpty: {
                          message: 'renewal不能为空'
                      }
                  }
               },
               
               
               country:{
                validators: {
                      notEmpty: {
                          message: 'country不能为空'
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
               
               
            /*   states:{
                validators: {
                      notEmpty: {
                          message: '保险公司状态不能为空'
                      }
                  }
               }, */   
          },
          
         
          submitHandler: function (validator, form, submitButton) {
        	 var ids1 =form.serialize();
        		addproduct(ids1);
        	 
  		
  		
          }
      });
	  
	function addproduct(ids1){
		$.ajax({
			type : "POST",
			url:path+"/externalgiftsController/insert.do",// 后台请求URL地址
			data : ids1,
			dataType : "json",
			success : function(data) {
			  if(data=="1"){
				  alert("添加成功，数据已添加到中间表");
				  url="externalAdd.jsp";
				  toback(url);
			  }
			  if(data=="2"){
				  alert("添加失败，资质表不存在此licensesCode");
				  url="innerAdd.jsp";
				  toback(url);
			  }
			  if(data=="3"){
				  alert("添加失败，用户表不存在此staffid");
				  url="innerAdd.jsp";
				  toback(url);
			  }
			  if(data=="4"){
				  alert("添加成功");
				  url="innerAdd.jsp";
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
