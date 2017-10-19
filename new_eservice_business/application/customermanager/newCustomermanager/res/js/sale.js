

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
          
        	staffid: {
                validators: {
                    notEmpty: {
                        message: 'staffid不能为空'
                    }
                }
            },
            
            riskcode:{
              validators: {
                    notEmpty: {
                        message: 'riskcode不能为空'
                    }
                }
             },    
        },
        
       
        submitHandler: function (validator, form, submitButton) {
        	var ids1 =form.serialize();
      		  addproduct(ids1);
      	  
           
		
		
        }
    });
		
	function addproduct(ids1) {
			$.ajax({
				type : "POST",
				url:path+"/LaqualificationController/sale.do",// 后台请求URL地址
				data : ids1,
				dataType : "json",
				success : function(data) {
					alert(data);
					for(var i=0;i<data.length;i++){
						alert(date[i].mystr);
						
					}
					if(data=="1"){
						alert("可以销售此产品");
						
					}else if(data=="0"){
						alert("不可以销售此产品");
					}
				},
				error : function() {
					alert("plus failed");
				}
			});
		
		}
	 

	
});


//---时间显示
$(function() {
	showLeftTime();
})
var initializationTime = (new Date()).getTime();

function showLeftTime() {
	var now = new Date();
	var year = now.getFullYear();
	var month = now.getMonth() + 1;
	var day = now.getDate();
	var hours = now.getHours();
	var minutes = now.getMinutes();
	var seconds = now.getSeconds();
	var showTime = document.getElementById("showTime");
	showTime.innerHTML = "" + year + "年" + month + "月" + day + "日 " + hours + ":" + minutes + ":" + seconds + "";
	showTime.style.fontSize = "16px";
	showTime.style.marginBottom = "0px";
	//一秒刷新一次显示时间
	var timeID = setTimeout(showLeftTime, 1000);
}





