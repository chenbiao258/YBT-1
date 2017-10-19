$(function(){
	
	$("#back").click(function(){
		/*var tContNo = $("#contNo").val();
		alert("tContNo=="+tContNo);
		var url ="partNewContEnter.jsp?contNo="+tContNo;
		toback(url);*/
		window.history.back();
	});
	
	$("#save").click(function(){
		var sectionData = $("#form-plus").serialize();
		var matter="告知录入保存";
		$.ajax({
				 url:path + '/newContEnter/saveInputImpart.do',  
		         type: "POST",
		         dataType: 'json',
            	 data: sectionData+"&matter="+matter,
				 success: function(data){
					alert(data.msg);
					window.close();
				 }
			})
		
		
	})
});
		
		
