
var tab_d = $('#cusTable');
var init_url = "/laqualidetailsController/QueryAlls.do";

// 页面初始化
$(document).ready(function() {

	
	/**加载页面表格*/
	var col = [{field: 'state',align: 'center',valign : 'middle',checkbox: true,visible: true},
	           {field: 'staffid',title: 'Staffid',align: 'center',valign : 'middle',visible: true},
  				{field: 'licensesCode',title: 'licensesCode',align: 'center',sortable: true,valign : 'middle',visible: true},
  					{field: 'licensesCertificationsDescr',title: 'licensesCertificationsDescr',align: 'center',sortable: true,valign : 'middle',visible: true},
  				{field: 'checkflag',title: 'checkflag',align: 'center',valign : 'middle',visible: true},
  				{field: 'getissueDate',title: 'getissueDate',align: 'center',sortable: true,valign : 'middle'},
  				{field: 'getexpirationDate',title: 'getexpirationDate',align: 'center',valign : 'middle',visible: true},
  				{field: 'verified',title: 'verified',align: 'center',sortable: true,valign : 'middle',visible: true},
  				{field: 'renewal',title: 'renewal',align: 'center',valign : 'middle',visible: true},
  				{field: 'country',title: 'country',align: 'center',valign : 'middle',visible: true},
  			
	   				];
	

	var uniqueId = "metentid";
	var sortOrder = "metentid asc";
	tableInit3(init_url,tab_d,col,uniqueId,sortOrder,queryParams);
	 $("#search").click(function() {
   		//参数
   		var data  = new Object();
   		data.checkflag = $("#checkflag").val(),
		data.staffid = $("#staffid").val();
		
		var url_d = "/laqualidetailsController/QueryAlls.do";
	    queryTable(url_d , tab_d ,data);
		/*if(!data.qualiinfono ==""||!data.qualiinfono ==null||!data.comcode==""||!data.comcode==null||!data.username==""||!data.username==null){
		var url_d = "/LDQUALIINFOAController/queryByPrimaryKey.do";
		    queryTable(url_d , tab_d ,data);
   		}
		if(data.qualiinfono ==""||data.qualiinfono ==null&&data.comcode==""||data.comcode==null&&data.username==""||data.username==null){
			var url_d = "/LDQUALIINFOAController/queryByPrimaryKey.do";
			queryTable(url_d , tab_d ,data);
	   	} 		*/
   });
	 


	 $("#check").click(function() {
		 mycheckbox("Y");
	   });
	 
	 $("#nocheck").click(function() {
		 mycheckbox("N");
	   });


});


function changes(){
    var data  = new Object();
		data.checkflag = $("#checkflag").val(),
	data.staffid = $("#staffid").val();
	
	var url_d = "/laqualidetailsController/QueryAlls.do";
    queryTable(url_d , tab_d ,data);
}


//获取CheckBox选中的行
function mycheckbox(state){
	 //审核
	 var arr=$('#cusTable').bootstrapTable('getSelections');
	 for(var i=0;i<arr.length;i++){
		 mycheck(arr[i].staffid,arr[i].licensesCode,state);
	 }
	
}

function mycheck(staffid,licensesCode,checkflag){
	$.ajax({
		type : "POST",
		url:path+"/laqualidetailsController/CheckAlls.do",// 后台请求URL地址
		data : "staffid="+staffid+"&licensesCode="+licensesCode+"&checkflag="+checkflag,
		dataType : "json",
		success : function(data) {
			if(data=="1"){
				alert("已审核");
				var url ="LAFRBankAgentManageAgreeInput.jsp";
				toback(url);
				
			}
			if(data==2){
				alert("审核失败！");
			}
		},
		error : function() {
			alert("plus failed");
		}
	});
}

//公共代码
function queryTable(url , obj , data){
	obj.bootstrapTable('refresh', {
		  url: path+url,
		  query: data
	 });  
};
function actionFormatter(value, row, index) {      
	return [
        '<button class="btn btn-red remove">删除</button>' +
		'<button class="btn btn-primary update">审核</button>'
	].join('');
}

window.actionEvents = {
		//审核通过
		'click .remove': function (e, value, row, index) {
			var r=confirm("确认要删除么？");
			if (r==true)
			  {
				$.ajax({
					type : "POST",
					url:path+"/LDQUALIINFOAController/updateByPrimaryKeySelective.do",// 后台请求URL地址
					data : "qualiinfono="+ row.qualiinfono+"&othersign="+row.othersign +"&state="+"Y",
					dataType : "json",
					success : function(data) {
						if(data=="1"){
							alert("已审核");
							var url ="LAFRBankAgentManageAgreeInput.jsp";
							toback(url);
							
						}
						if(data==2){
							alert("审核失败！");
						}
					},
					error : function() {
						alert("plus failed");
					}
				});
			  }
			else
			  {
				$remove.attr('disabled',true);
				
				//参数
				var data  = new Object();
					   		
				data.userCode = $("#userCode").val(),
				data.userName = $("#userName").val()
					   
				queryTable(url_d , tab_d ,data);
			  }
	 },
		//审核
		'click .update': function (e, value, row, index) {
			$.ajax({
				type : "POST",
				url:path+"/LDQUALIINFOAController/updateByPrimaryKeySelective.do",// 后台请求URL地址
				data : "qualiinfono="+ row.qualiinfono+"&othersign="+row.othersign +"&state="+"N",
				dataType : "json",
				success : function(data) {
					if(data=="1"){
						alert("已审核");
						var url ="LAFRBankAgentManageAgreeInput.jsp";
						toback(url);
						
					}
					if(data==2){
						alert("审核失败！");
					}
				},
				error : function() {
					alert("plus failed");
				}
			});
			
	 }
		
	};


/**
 * 设置表格查询参数
 * @param params
 */
function queryParams(params){
	//设置查询参数 
    var param = {
	        //这里是在ajax发送请求的时候设置一些参数 params有什么东西，
	    	//自己看看源码就知道了 limit: params.pageSize,
    		limit : params.limit,
	        offset: params.offset,
	        
	        sortName:params.sortName,//排序列名
	        sortOrder:params.sortOrder,//排位命令（desc，asc）
	        
	        pageSize: params.pageSize,
	        pageNumber:params.pageNumber,
	        checkflag:$("#checkflag").val(),
			staffid:$("#staffid").val()
	    }; 
	    return param; 
}

/**
 * 翻页带查询参数及列排序
 * @param url
 * @param obj
 * @param col
 * @param uniqueId 行主键
 * @param sortOrder 排序方式
 * @param queryParams
 * @author TKW
 */
function tableInit3( url,obj,col,uniqueId,sortOrder,queryParams){
	 obj.bootstrapTable({
		 url: path+url, // 请求后台的URL（*）
		 dataType: "json",
		 method: 'post', // 请求方式（*）
		
		 contentType: "application/x-www-form-urlencoded",
		 toolbar: '#toolbar',
		 toolbar: '#toolbar2',// 工具按钮用哪个容器
		 columns:  col,
		 striped: true, // 是否显示行间隔色
		 cache: false, // 是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
		 pagination: true, // 是否显示分页（*）
		 sortable: true, // 是否启用排序
		 sortOrder: "asc", // 排序方式
		 sortOrder: sortOrder, // 排序方式
		 queryParamsType : "limit",// undefined/limit
		 queryParams: queryParams,//传递参数（*）
		 sidePagination: "server", //
		 
		 //分页方式：client客户端分页，server服务端分页（*）
		 // pageNumber:1, //初始化加载第一页，默认第一页
		 // pageSize: 10, //每页的记录行数（*）
		 pageList: [10, 25, 50, 100], // 可供选择的每页的行数（*）
		 search: false, // 是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
		 strictSearch: true,//设置为 true启用 全匹配搜索，否则为模糊搜索
		 showColumns: true, // 是否显示所有的列
		 showRefresh: true, // 是否显示刷新按钮
		 minimumCountColumns: 2, // 最少允许的列数
		 //editable:true,//开启编辑模式 
		 clickToSelect: true, // 是否启用点击选中行
		 // height: 500, //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
		 uniqueId: "ID", // 每一行的唯一标识，一般为主键列
		 uniqueId: uniqueId, // 每一行的唯一标识，一般为主键列
		 showToggle:true, // 是否显示详细视图和列表视图的切换按钮
		 cardView: false	, // 是否显示详细视图
		 detailView: false,// 是否显示父子表
	     onEditableSave: function (field, row,oldValue, $el) {
	    	 	{
	              $.ajax({
	                   type: "post",
	                   url: path+"/LaagentController/updateByPrimaryKeySelective.do",
	                   data:"preferredfirstname="+row.preferredfirstname+"&name="+row.name+"&staffid="+row.staffid,
	                   dataType: 'JSON',
	                   success: function (data, status) {
	                       if (status == "success") {
	                           alert('提交数据成功');
	                       }
	                   },
	                   error: function () {
	                       alert('编辑失败');
	                   },
	                   complete: function () {

	                   }

	               });
	    	 }
	   
	   },
		
			 }); 
	 

}



//获取ID
function getIdSelections() {
	return $.map($cusTable.bootstrapTable('getSelections'), function(row) {
		return row.contNo;
	});
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