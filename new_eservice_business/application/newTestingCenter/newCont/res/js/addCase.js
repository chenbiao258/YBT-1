$(function(){
	
	$(".back").click(function(){
		var url ="testConfigure.jsp";
		toback(url);
	});
	
	$("#save").click(function() {
		var ids1 = $("#form-plus").serialize();
		
		$.ajax({
			type : "POST",
			url:path+"/newCaseManage/addCase.do",// 后台请求URL地址
			data : ids1,
			dataType : "json",
			success : function(data) {
				
				if(data=="1"){
					alert("添加成功");
					var url ="testConfigure.jsp";
					toback(url);
				}
			},
			error : function() {
				alert("plus failed");
			}
		});
	});
	
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