var cusManaCode;
var manaName;
var contNum;

$(function(){
	//alert(bankName+"="+salesChl+"="+tContNo+"="+riskCode);
	
	showLocation('loc_province-sub1','loc_city-sub1','loc_town-sub1');
	showLocation('loc_province-sub2','loc_city-sub2','loc_town-sub2');
	
	//form局部提交1--客户经理
	$("#save1").click(function(){
		
		cusManaCode = $("#cusManaCode").val();
		manaName = $("#manaName").val();
		contNum = $("#contNum").val();
		
		alert(cusManaCode+"="+manaName+"="+contNum);
        
	});
	
	//form局部提交2--投保人
	$("#save2").click(function(){
		var sectionData = $("#fwv-2").serialize();
		$.ajax({
            url:path + '/newContEnter/saveTBREnter.do',  
            type: "POST",
            dataType: 'json',
            data: sectionData,
            success: function(data){
            	alert(data);
            },
            error:function(){
            	alert("save failed");
            }
        });       
	});
	
	//form局部提交3--被保人
	$("#save3").click(function(){
		var sectionData = $("#fwv-3").serialize();
		$.ajax({
            url:path + '/newContEnter/saveBBREnter.do',  
            type: "POST",
            dataType: 'json',
            data: sectionData,
            success: function(data){
            	alert(data);
            },
            error:function(){
            	alert("save failed");
            }
        });       
	});
	
	//form局部提交4--受益人
	$("#save4").click(function(){
		var sectionData = $("#fwv-4").serialize();
		console.log(sectionData);
		$.ajax({
            url:path + '/newContEnter/saveBeneEnterBean.do',  
            type: "POST",
            dataType: 'json',
            data: sectionData,
            success: function(data){
            	alert(data);
            },
            error:function(){
            	alert("save failed");
            }
        });       
	});
		
	//form局部提交5--主险和附加险
	$("#save5").click(function(){
		var sectionData = $("#fwv-5").serialize();
		console.log(sectionData);
		$.ajax({
            url:path + '/newContEnter/saveRiskEnterBean.do',  
            type: "POST",
            dataType: 'json',
            data: sectionData,
            success: function(data){
            	alert(data);
            },
            error:function(){
            	alert("save failed");
            }
        });       
	});
	
	/*//form局部提交6--页末信息
	$("#save6").click(function(){
		var sectionData = $("#fwv-6").serialize();
		$.ajax({
			url:path + '/newContEnter/saveLastEnterBean.do?contNum='+contNum+'&channelCode='+salesChl+'&cusManaCode='+cusManaCode,
            type: "POST",
            dataType: 'json',
            data: sectionData,
            success: function(data){
            	alert(data);
            	var url = "testConfigure.jsp";
        		toadd(url);
            },
            error:function(){
            	alert("save failed");
            }
        });       
	});
	*/
	
	//form局部提交的最后一步
	$("#save6").click(function(){

			var url = "addCase.jsp";
        	toadd(url);
        	
	});
})
