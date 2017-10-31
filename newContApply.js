
$(function(){
var riskType =-1;

//加载参数
if(grpcontno!=null && grpcontno !="" && grpcontno !="null"){
	$("#grpcontno").val(grpcontno);
}
if(riskcode!=null && riskcode!="" && riskcode !="null"){
	$("#riskcode").val(riskcode);
}
	//保险公司
	$.ajax({
		 url:path + '/newContEnter/selectFromLacom.do',  
         type: "POST",
		 success: function(data){
		 for(var i=0;i<data.length;i++){
			var select=document.getElementById("BX");
		    var option=document.createElement("option");
			option.value=data[i].agentcom.replace(/^\s+|\s+$/g, '');;
			option.innerHTML=data[i].agentcom+"-"+data[i].name;
			select.appendChild(option);	
			
		 	 }
		 }
	})
	
})
	
		

			
	$("#add1").click(function() {
		$.ajax({
			type : "POST",
			url:path+"/customerIDController/selectcustomerID1.do",// 后台请求URL地址
			
			dataType : "json",
			success : function(data) {
				alert(data.msg);
				
			}
		});
	});
	$("#add2").click(function() {
			$.ajax({
			type : "POST",
			url:path+"/customerIDController/selectcustomerID2.do",// 后台请求URL地址
		
			dataType : "json",
			success : function(data) {
				alert(data.msg);
				
			}
		});
	});		
	$("#add3").click(function() {
		alert("789");
			$.ajax({
			type : "POST",
			url:path+"/customerIDController/selectcustomerID3.do",// 后台请求URL地址
		
			dataType : "json",
			success : function(data) {
				alert(data.msg);
				
				
			}
		});
	});		
			
			
	$("#add").click(function() {

		var grpcontno = $("#grpcontno").val();
		
		var tContNo=$("#BX").val();
		if(grpcontno==""||grpcontno==null){
			alert("投保人客户号不能为空");
			return false;
		}
		if(tContNo==""||tContNo==null){
			alert("保险公司不能为空");
			return false;
		}
		
		if($("#riskcode").val()==""||$("#riskcode").val()==null){
			alert("保险产品不能为空");
			return false;
		}
		
		var YH = $("#YH").val();
		var BX = $("#BX").val();
		$(function(){
			/*$.ajax({
			type : "POST",
			url:path+"/customerIDController/selectcustomerID.do",// 后台请求URL地址
			data : {"bankName":$("#grpcontno").val(),"YH":YH,"BX":BX},
			dataType : "json",
			success : function(data) {
				alert(data.msg);
				
				var riskCode = $("#riskcode").val();
				//var grpcontno=data.parm;
				//Cifid;
				var parm = data.parm;
			
				var url = "partNewContEnter.jsp?grpcontno="+grpcontno+"&tContNo="+tContNo+"&riskCode="+riskCode+"&parm="+parm+"&flag=1";
		        //toadd(url);
		       window.location.href=url;
			}
		});*/
		var salesChl = "";
		var grpcontno = "00000000";
		var riskCode ="@MA";
		var tContNo="MELI";
		var parm = "123;1;210320201710310099;0";
        var url = "partNewContEnter.jsp?grpcontno="+grpcontno+"&salesChl="+salesChl+"&tContNo="+tContNo+"&riskCode="+riskCode+"&parm="+parm+"&flag=1";
        window.location.href=url;

	});

	
})


function selectRisk(){
		var tContNo = $("#BX").val();
			$.ajax({
				// url:path + '/newContEnter/searchrisk.do',  
				 url:path + '/newContEnter/searchmainrisk.do',
		         type: "POST",
		         data:{"insurancecom":tContNo},
				 success: function(data){
				 for(var i=0;i<data.length;i++){
					var select=document.getElementById("riskcode");
				    var option=document.createElement("option");
					option.value=data[i].riskCode;
					option.innerHTML=data[i].riskCode+"-"+data[i].riskName;
					select.appendChild(option);
				 }
				
			}
		})
}
















