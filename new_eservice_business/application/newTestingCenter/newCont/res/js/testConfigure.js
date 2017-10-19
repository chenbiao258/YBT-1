var tab_d = $('#cusTable');

var init_url = "/application/newTestingCenter/cancelCont/res/json/employee.json";
	
var url_d = "/testConfigure/queryTest.do";

var col;

var uniqueId;

var sortOrder;

var contNo = 1;

// 页面初始化
$(document).ready(function() {
	
	/**加载页面表格cusTable*/
	col = [{field: 'state',align: 'center',valign : 'middle',checkbox: true,visible: true},
			{field: 'metentid',title: '序号',formatter: function (value, row, index) {  
					return index+1;  
			}},         
			{field: 'transName',title: '投保单号',align: 'center',valign : 'middle',visible: true},  
			{field: 'transDir',title: '保单号',align: 'center',sortable: true,valign : 'middle'},
			{field: 'transPriNo',title: '保单印刷号',align: 'center',sortable: true,valign : 'middle'},
			{field: 'transType',title: '交易类型',align: 'center',sortable: true,valign : 'middle'},
			{field: 'transRes',title: '交易結果',align: 'center',sortable: true,valign : 'middle'},
			{field: 'transResInfor',title: '响应信息',align: 'center',sortable: true,valign : 'middle'},
			{title: '操作',align: 'center',formatter: actionFormatter,events: actionEvents}
		];  	
	
	uniqueId = "metentid";
	sortOrder = "metentid asc";
	tableInit3(init_url,tab_d,col,uniqueId,sortOrder,queryParams);
	
	$("#test").click(function() {
		
	/*	{bankName:bankName,contNo:contNo,
		mainInsuredGet:mainInsuredGet,cusManaCode:cusManaCode,
		contPrintNo:contPrintNo}*/		
		
		if($("#he").attr('checked')){   
			alert("核保");
			$.ajax({
				type : "POST",
				url : path + "/testConfigure/saveHBTest.do",// 后台请求URL地址
				data : {contNo:contNo,contPrintNo:$("#transPriNo").val()},
				dataType : "json",
				success : function(data) {
					
					if(data=="1"){
						
						alert("核保测试成功");					
						$("#he").attr("checked", false);
						$("#cheng").attr("checked", true);
						
						if($("#cheng").attr('checked')){   
							alert("承保");
							$.ajax({
								type : "POST",
								url : path + "/testConfigure/saveCBTest.do",// 后台请求URL地址
								data : {contNo:contNo,contPrintNo:$("#transPriNo").val()},
								dataType : "json",
								success : function(data) {
									
									if(data=="1"){
						
										alert("承保测试成功");						
										$("#he").attr("checked", false);
										$("#cheng").attr("checked", false);
										$("#chong").attr("checked", true);
										
										if($("#chong").attr('checked')){   
											alert("自动冲正");
											$.ajax({
												type : "POST",
												url : path + "/testConfigure/saveCZTest.do",// 后台请求URL地址
												data : {contNo:contNo,contPrintNo:$("#transPriNo").val()},
												dataType : "json",
												success : function(data) {
													
													if(data=="1"){
						
														alert("自动冲正测试成功");	
													
														//参数
												   		var data  = new Object();
												   		
												   		data.transPriNo = $("#transPriNo").val(),
														data.transName = contNo
												   
												   		queryTable(url_d , tab_d ,data);
															
														}																									
													
												},
												error : function() {
													alert("ChongZheng failed");
												}
											});
										}
										
									}																		
									
								},
								error : function() {
									alert("ChengBao failed");
								}
							});
						}
						
					}
															
				},
				error : function() {
					alert("HeBao failed");
				}
			});
		}
		
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
	        pageNumber:params.pageNumber
	        
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

$(function(){
	
	$("#add").click(function(){
        	var url = "addCase.jsp";
        	toadd(url);
	});
	$("#he").attr("checked", true);//设置为选中状态
	
});

function actionFormatter(value, row, index) {
	return [
		'<button class="btn btn-primary trans">交易报文</button>'+
		'<button class="btn btn-primary print">保单打印预览</button>'
	].join('');
}
window.actionEvents = {
	'click .trans' : function(e, value, row, index) {     
		var url = "transction.jsp?tContNo=" + row.transName+"&contNo="+row.transDir;
        toedit(url);
	},
	'click .print' : function(e, value, row, index) {
		 alert("待完成")
	}
};