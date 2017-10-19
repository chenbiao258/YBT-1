$(function(){
	
	/*showLocation('loc_province-sub2','loc_city-sub2','loc_town-sub2');*/
	
	showUser();
	
	$(".back").click(function(){
		var url ="userSearch.jsp";
		toback(url);
	});
	
	$("#save").click(function() {

		var ids1 = $("#form-plus").serialize();
		
		$.ajax({
			type : "POST",
			url:path+"/UserModifyController/checkUser.do",// 后台请求URL地址
			data : ids1,  //    {"uid":uid,"ids1":ids1},
			dataType : "json",
			success : function(data) {
				
				if(data=="1"){
					alert("已审核");
					var url ="userSearch.jsp";
					toback(url);
				}			
			},
			error : function() {
				alert("plus failed");
			}
		});
	});
	
});

function showUser(){
	
	$.ajax({
			type : "POST",
			url : path+"/UserSearchController/selectByUid.do",// 后台请求URL地址
			data:"userCode="+emplID,    
			success : function(data) {
			
				var json=eval(data);
				$("#emplID").val(data.emplID); 
				$("#department").val(data.department);   
				$("#name").val(data.name);    
				 
				$("#jobCode").val(data.jobCode);    
				$("#companyCode").val(data.companyCode);    
				$("#companyName").val(data.companyName);  
				$("#location").val(data.location); 
				$("#status").val(data.status); 
				$("#hireDate").val(data.hireDates);    
				$("#rehireDate").val(data.rehireDates);    
				$("#makeDate").val(data.makeDates);    
				$("#makeTime").val(data.makeTime);    
				$("#operator").val(data.operator);    
			
	
			},
			error : function() {
				alert("plus failed");
			}
	});
}

function showLocation1(province , city , town) {
	var loc	= new Location();
	var aaa = loc.find('0');
	var aaa1 = aaa[province];
	var bbb = loc.find('0,'+province);
	var bbb1 = bbb[city];
	var ccc = loc.find('0,'+province+','+city);
	var ccc1 = ccc[town];
	var title	= [aaa1 , bbb1 , ccc1];
	$.each(title , function(k , v) {
		title[k]	= '<option value="">'+v+'</option>';
	})
	
	$('#loc_province-sub2').append(title[0]);
	$('#loc_city-sub2').append(title[1]);
	$('#loc_town-sub2').append(title[2]);
	
	$("#loc_province-sub2,#loc_city-sub2,#loc_town-sub2").select2()
	$('#loc_province-sub2').change(function() {
		$('#loc_city-sub2').empty();
		$('#loc_city-sub2').append(title[1]);
		loc.fillOption('loc_city-sub2' , '0,'+$('#loc_province-sub2').val());
		$('#loc_city-sub2').change()
	})
	
	$('#loc_city-sub2').change(function() {
		$('#loc_town-sub2').empty();
		$('#loc_town-sub2').append(title[2]);
		loc.fillOption('loc_town-sub2' , '0,' + $('#loc_province-sub2').val() + ',' + $('#loc_city-sub2').val());
	})
	
	$('#loc_town-sub2').change(function() {
		//$('input[@name=location_id]').val($(this).val());
	})
	
	if (province) {
		loc.fillOption('loc_province-sub2' , '0' , province);
		
		if (city) {
			loc.fillOption('loc_city-sub2' , '0,'+province , city);
			
			if (town) {
				loc.fillOption('loc_town-sub2' , '0,'+province+','+city , town);
			}
		}	
	} else {
		loc.fillOption('loc_province-sub2' , '0');
	}		
}

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