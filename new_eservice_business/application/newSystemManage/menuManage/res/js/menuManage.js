var tab_d = $('#cusTable');
$remove = $('#remove');
var $cusTable = $('#cusTable');


$("#reset").off().on("click",function(){ 
	$("#menuName").val(""); 
	}); 




$(document).ready(function() {
	var init_url ="/MenuManageController/select.do";
	var url_d ="/MenuManageController/selectBymenuName.do";
	var col = [ {
		field : 'id',
		title : '序号',
		formatter : function(value, row, index) {
			return index + 1;
		}
	}, {
		field : 'menuName',
		title : '菜单名称',
		align : 'center',
		valign : 'middle',
		visible : true
	}, {
		field : 'submenuname',
		title : '父菜单名称',
		align : 'center',
		sortable : true,
		valign : 'middle'
	}, {
		field : 'menuLink',
		title : '菜单链接',
		align : 'center',
		sortable : true,
		valign : 'middle'
	}, {
		field : 'crtTime',
		title : '创建时间',
		align : 'center',
		sortable : true,
		valign : 'middle'
	}, {
		field : 'updTime',
		title : '修改时间',
		align : 'center',
		sortable : true,
		valign : 'middle'
	},{
		title : '操作',
		align : 'center',
		formatter : actionFormatter,
		events : actionEvents
	},
	
	];
	var uniqueId ="metentid";
	var sortOrder ="metentid asc";
	tableInit3(init_url, tab_d, col, uniqueId, sortOrder, queryParams);
	$("#search").click(function() {
			 var menuName = $("#menuName").val().trim();
			 var submenuName = $("#submenuName").val().trim();
			 var data = new Object();
			 data.menuName = menuName;
			 data.submenuName = submenuName;
			 console.log(menuName);
			 console.log(submenuName);
			 console.log(url_d);
			 if((data.menuName==null || data.menuName=="")&&(data.submenuName==null || data.submenuName=="")){
				 url_d = init_url;
			 }
			 else{
				 url_d = "/MenuManageController/selectBymenuName.do";
			 }
			 console.log(url_d);
			 queryTable(url_d , tab_d ,data);
	});
});
//公共代码
function queryTable(url, obj, data) {
	obj.bootstrapTable('refresh', {
		url : path + url,
		query : data
	});
};
function queryParams(params) {
	// 设置查询参数
	var param = {
		limit : params.limit,
		offset : params.offset,
		sortName : params.sortName,// 排序列名
		sortOrder : params.sortOrder,// 排位命令（desc，asc）
		pageSize : params.pageSize,
		pageNumber : params.pageNumber,
	};
	return param;
}
function tableInit3(url, obj, col, uniqueId, sortOrder, queryParams) {
	obj.bootstrapTable({
		url : path + url, // 请求后台的URL（*）
		dataType : "json",
		method : 'post', // 请求方式（*）
		contentType : "application/x-www-form-urlencoded",
		toolbar : '#toolbar',// 工具按钮用哪个容器
		columns : col,
		striped : true, // 是否显示行间隔色
		cache : false, // 是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
//		sortable : true, // 是否启用排序
//		sortOrder : "asc", // 排序方式
//		sortOrder : sortOrder, // 排序方式
		queryParamsType : "limit",// undefined/limit
		queryParams : queryParams,// 传递参数（*）
		pagination: true, // 是否显示分页（*）
		sidePagination : "server", //// 分页方式：client客户端分页，server服务端分页（*）
		pageNumber:1, //初始化加载第一页，默认第一页
		pageSize: 5, //每页的记录行数（*）
		pageList : [ 5, 10, 15, 20, 25], // 可供选择的每页的行数（*）
		search : false, // 是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
		strictSearch : true,// 设置为 true启用 全匹配搜索，否则为模糊搜索
		showColumns : true, // 是否显示所有的列
		showRefresh : true, // 是否显示刷新按钮
		minimumCountColumns : 2, // 最少允许的列数
		clickToSelect : true, // 是否启用点击选中行
		// height: 500, //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
		uniqueId : uniqueId, // 每一行的唯一标识，一般为主键列
		showToggle : true, // 是否显示详细视图和列表视图的切换按钮
		cardView : false, // 是否显示详细视图
		detailView : false
	// 是否显示父子表
	});
};
$(function(){
	//增加
	$("#add").click(function(){
        	var url = "menuAdd.jsp";
        	toadd(url);
		//location.href="employeeadd.html";
	});
	$("#add2").click(function(){
    	var url2 = "menuAdd2.jsp";
    	toadd(url2);
	//location.href="employeeadd.html";
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
		var id=row.id;
		var menuname=row.menuName;
		var menudesc=row.menuDesc;
		var menulink=row.menuLink;
		var crtTime=row.crtTime;
		var updTime=row.updTime;
		var submenu=row.submenu;
		
		
		var url ="./menuModify.jsp?id="+id+"&menuname=" +menuname+"&menudesc="+menudesc+"&menulink="+menulink+"&crtTime="+crtTime+"&updTime="+updTime+"&submenu="+submenu+"";
       // toedit(url);
	},
	//删除
	'click .remove': function (e, value, row, index) {
		var r=confirm("确认要删除么？");
	
		if (r==true)
		  {
			$.ajax({
				type : "POST",
				url : path + "/menuController/deleteByUid.do",// 后台请求URL地址
				data : {"id":row.id,"menuDesc":row.menuDesc,"submenu":row.submenu,"meddlemenu":row.meddlemenu},
				dataType:"json",
				success : function(dateReturn) {
					if (dateReturn == true) {
						alert("删除成功");
						//initTable();
						window.location.href="menuManage.jsp";
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
		  }
 }
};


function initTable() {
	// 先销毁表格
	$cusTable.bootstrapTable('destroy');
	// 初始化表格,动态从服务器加载数据
	$cusTable.bootstrapTable({ 
		method : "get", // 使用get请求到服务器获取数据
    	url : path+"/MenuManageController/select.do", // 获取数据的Servlet地址/
		striped : true, // 表格显示条纹
		pagination : true, // 启动分页
		dataType: "json",
		pageSize :5, // 每页显示的记录数
		pageNumber : 1, // 当前第几页
		pageList : [ 5, 10, 15, 20, 25 ], // 记录数可选列表 默认[10, 25, 50, 100]
		search : false, // 是否启用查询 
		showColumns : true, // 显示下拉框勾选要显示的列
		showRefresh : true, // 显示刷新按钮
		sidePagination : "server", // client表示客户端分页
		toolbar : '#toolbar', // 工具按钮用哪个容器
		responseHandler: responseHandler,
		// 设置为undefined可以获取pageNumber，pageSize，searchText，sortName，sortOrder
		// 设置为limit可以获取limit, offset, search, sort, order
		queryParamsType : "limit",
		contentType: "application/x-www-form-urlencoded",
		queryParams : function queryParams(params) { // 设置查询参数
			var param = {
				limit : params.limit,
				offset : params.offset,
				pageNumber : params.pageNumber,
				pageSize : params.pageSize
			};
			return param;
		},
		columns: [
			{field: 'state',align: 'center',valign : 'middle',checkbox: true,visible: true},
			{field: 'uid',title: '菜单uid',align: 'center',valign : 'middle',visible: false},
			{field: 'menuName',title: '菜单名称',align: 'center',sortable: true,valign : 'middle'},
			{field: 'submenuname',title: '父菜单名称',align: 'center',sortable: true,valign : 'middle'},
			{field: 'menuLink',title: '菜单链接',align: 'center',sortable: true,valign : 'middle'},
			{field: 'crtTime',title: '创建时间',align: 'center',sortable: true,valign : 'middle'},
			{field: 'updTime',title: '修改时间',align: 'center',sortable: true,valign : 'middle'},
			{title: '操作',align: 'center',formatter: actionFormatter,events: actionEvents}
		]
	});
	// 点击表格里的checkbox的时候 改变删除按钮的默认不能选状态
	$cusTable.on('check.bs.table uncheck.bs.table '
			+ 'check-all.bs.table uncheck-all.bs.table', function() {
		$remove.prop('disabled',
				!$cusTable.bootstrapTable('getSelections').length);
		// 保存您的数据，在这里只保存当前页面
		selections = getIdSelections();
		// 如果你想保存所有数据选择，推或拼接的选择
	});
	
	 function responseHandler(res) {
		 alert(res);
    	if (res.total!=0) {
	    	return {
		    	"rows": res.rows,
		    	"total": res.total
	    	};
    	} else {
	    	return {
		    	"rows": [],
		    	"total": 0
	    	};
    	}
    }
};


