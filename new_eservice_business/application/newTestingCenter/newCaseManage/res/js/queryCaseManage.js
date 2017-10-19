var tab_d = $('#cusTable'),
$remove = $('#remove');

// 页面初始化
$(document).ready(function() {
	
	var init_url = "/newCaseSearch/queryList.do";
	
	var url_d = "/newCaseSearch/queryByCase.do";
	
	/**加载页面表格*/
	var col = [{field: 'state',align: 'center',valign : 'middle',checkbox: true,visible: true},
	  			   {field: 'metentid',title: '序号',formatter: function (value, row, index) {  
                       return index+1;  
                   }},
	   				{field: 'caseCode',title: '案例编码',align: 'center',valign : 'middle',visible: true},
	   				{field: 'caseName',title: '案例名称',align: 'center',sortable: true,valign : 'middle'},
	   				{field: 'caseTypeName',title: '案例类型',align: 'center',sortable: true,valign : 'middle'},
	   				{field: 'caseStateName',title: '案例状态',align: 'center',sortable: true,valign : 'middle'},
	   				{field: 'caseDesc',title: '案例描述',align: 'center',sortable: true,valign : 'middle'},
	   				{field: 'caseTester',title: '测试者',align: 'center',sortable: true,valign : 'middle'},
	   				{title: '操作',align: 'center',formatter: actionFormatter,events: actionEvents}
	  			   ];
	  			   
	var uniqueId = "metentid";
	var sortOrder = "metentid asc";
	tableInit3(init_url,tab_d,col,uniqueId,sortOrder,queryParams);
	
	$("#search").click(function() {
	 	
   		//参数
   		var data  = new Object();
   		
   		data.caseCode = $("#caseCode").val(),
		data.caseName = $("#caseName").val(),
		data.caseTester = $("#caseTester").val()
   
   		queryTable(url_d , tab_d ,data);
   });
   
});

//公共代码
function queryTable(url , obj , data){
	obj.bootstrapTable('refresh', {
		  url: path+url,
		  query: data
	 });  
};

/**
 * 设置表格查询参数
 * @param params
 */
function queryParams(params){
	//设置查询参数 
    var param = {
    		limit : params.limit,
	        offset: params.offset,
	        
	        sortName:params.sortName,//排序列名
	        sortOrder:params.sortOrder,//排位命令（desc，asc）
	        
	        pageSize: params.pageSize,
	        pageNumber:params.pageNumber,
	        caseCode : $("#caseCode").val(),
			caseName : $("#caseName").val(),
			caseTester : $("#caseTester").val()
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
		 clickToSelect: true, // 是否启用点击选中行
		 // height: 500, //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
		 uniqueId: "ID", // 每一行的唯一标识，一般为主键列
		 uniqueId: uniqueId, // 每一行的唯一标识，一般为主键列
		 showToggle:true, // 是否显示详细视图和列表视图的切换按钮
		 cardView: false	, // 是否显示详细视图
		 detailView: false // 是否显示父子表
	 });
};

//获取ID
function getIdSelections() {
	return $.map($cusTable.bootstrapTable('getSelections'), function(row) {
		return row.uid;
	});
}


$(function(){
	//增加
	$("#add").click(function(){
        	var url = "newCaseManage.jsp";
        	toadd(url);
	});
	
});

function actionFormatter(value, row, index) {      
	return [
		'<button class="btn btn-primary edit">修改</button>'+
        '<button class="btn btn-red remove">删除</button>' 
	].join('');
}

window.actionEvents = {
	//修改
	'click .edit' : function(e, value, row, index) {
		alert("待完成");
		
		/*var url = "userModify.jsp?id=" + row.uid;
        toedit(url);*/
	},
	//删除
	'click .remove': function (e, value, row, index) {
		alert("待完成");
		
		/*var r=confirm("确认要删除么？");
		if (r==true)
		  {
		  	alert(row.uid);
			$.ajax({
				type : "POST",
				url : path + "/UserDeleteController/deleteByUid.do",// 后台请求URL地址
				data : "ids=" + row.uid,
				success : function(dateReturn) {
					if (dateReturn == "success") {
						alert("删除成功");
						initTableSelect();
						$remove.attr('disabled',true);
					} else {
						alert("删除失败");
					}
				},
				error : function() {
					alert("Delete error");
				}
			});
		  }
		else
		  {
			$remove.attr('disabled',true);
			initTableSelect();
		  }*/
 }
};