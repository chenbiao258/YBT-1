var $cusTable = $('#cusTable');

// 页面初始化
$(document).ready(function() {
	// 调用函数，初始化表格
	initTable();
});

// 加载初始化
function initTable() {
	// 先销毁表格
	$cusTable.bootstrapTable('destroy');
	// 初始化表格,动态从服务器加载数据
	$cusTable.bootstrapTable({
		method : "post", // 使用get请求到服务器获取数据
		url : path+"/application/newTestingCenter/cancelCont/res/json/employee.json", // 获取数据的Servlet地址
		striped : true, // 表格显示条纹
		pagination : true, // 启动分页
		pageSize : 5, // 每页显示的记录数
		pageNumber : 0, // 当前第几页
		pageList : [ 5, 10, 15, 20, 25 ], // 记录数可选列表 默认[10, 25, 50, 100]
		search : false, // 是否启用查询
		//showColumns : false, // 显示下拉框勾选要显示的列
		//showRefresh : false, // 显示刷新按钮
		sidePagination : "server", // client表示客户端分页
		//toolbar : '#toolbar', // 工具按钮用哪个容器
		responseHandler: responseHandler,
		// 设置为undefined可以获取pageNumber，pageSize，searchText，sortName，sortOrder
		// 设置为limit可以获取limit, offset, search, sort, order
		queryParamsType : "undefined",
		dataType: "json",
		contentType: "application/x-www-form-urlencoded",
		queryParams : function queryParams(params) { // 设置查询参数
			var param = {
				pageNumber : params.pageNumber,
				pageSize : params.pageSize
			};
			return param;
		}
	});
	
	function responseHandler(res) {
    	if (res[0].total!=0) {
	    	return {
		    	"rows": res[0].rows,
		    	"total": res[0].total
	    	}
    	} else {
	    	return {
		    	"rows": [],
		    	"total": 0
	    	}
    	}
    }

};

$(function(){
	$(".back").click(function(){
		var url ="cancelCont.jsp";
		toback(url);
	});
});

function actionFormatter(value, row, index) {
	return [
		'<button class="btn btn-primary show">预览</button>'+
        '<button class="btn btn-red download">下载</button>' 
	].join('');
}

window.actionEvents = {
	'click .show' : function(e, value, row, index) {
		alert("待完成");
		/*var url = "menuModify.jsp?id=" + row.strId;
        toedit(url);*/
	},
	'click .download': function (e, value, row, index) {
		alert("待完成");
		/*var r=confirm("确认要删除么？");
		if (r==true)
		  {
			$.ajax({
				type : "POST",
				url : "common/ClientScreeningAction!deleteClientScreening.action",// 后台请求URL地址
				data : "ids=" + row.CUSTOMERNO,
				success : function(dateReturn) {
					if (dateReturn == "ok") {
						alert("删除成功");
						initTablesub();
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
			initTablesub();
		  }*/
 	}
};
