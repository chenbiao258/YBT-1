var tab_d = $('#cusTable');

// 页面初始化
$(document).ready(function() {
	
	var init_url = "";
	
	var url_d = "/newContApply/query.do";
	
	/**加载页面表格*/
	var col = [{field: 'state',align: 'center',valign : 'middle',checkbox: true,visible: true},
	  			   {field: 'metentid',title: '序号',formatter: function (value, row, index) {  
                       return index+1;  
                   }},
	   				{field: 'riskCode',title: '险种编码',align: 'center',valign : 'middle',visible: true},
	   				{field: 'riskName',title: '险种名称',align: 'center',sortable: true,valign : 'middle'},
	   				{field: 'insuranceCom',title: '保险公司',align: 'center',sortable: true,valign : 'middle'},
	   				{field: 'subRiskFlag',title: '主副险标志',align: 'center',sortable: true,valign : 'middle'},
	   				{field: 'riskType',title: '险种类别',align: 'center',sortable: true,valign : 'middle'},
	   				{field: 'checkFlag',title: '审核状态',align: 'center',sortable: true,valign : 'middle'},
	   				{field: 'insuAccFlag',title: '保险公司编码',align: 'center',sortable: true,valign : 'middle'},
	   				
	   				{title: '操作',align: 'center',formatter: actionFormatter,events: actionEvents}
	  			   ];
	
	var uniqueId = "metentid";
	var sortOrder = "metentid asc";
	sel('riskinputtype','riskType');
	selLacom('insuranceCom');
	 $("#search").click(function() {
	 	
   		//参数
   		var data  = new Object();
   		
   		data.insuranceCom = $("#insuranceCom").val(),
		data.riskType = $("#riskType").val(),
		data.StartDate = $("#StartDate").val(),
		data.endDate = $("#endDate").val();
        date.riskCode="";
		  	var url_d = "/LmriskAController/selectByAgentComAll.do";
		  	 $("#cusTable").bootstrapTable('destroy');
		   	tableInit3(url_d,tab_d,col,uniqueId,sortOrder,queryParams);
		   		
   		
   });
	
	
});


function selLacom(id){
	$.ajax({
		type : "POST",
		url : path + "/InsuComController/QueryAll.do",// 后台请求URL地址
		success : function(data) {
		var select2=document.getElementById(id);
			for(var i=0;i<data.length;i++){
			var select=document.getElementById(id);
            var option=document.createElement("option");
			option.value=data[i].agentcom;
			option.innerHTML=data[i].name;
			select.appendChild(option);
			
			
			}
			
				
		},
		
	});
	
}


function query(){

		//参数
		var data  = new Object();
		
		data.insuranceCom = $("#insuranceCom").val(),
	data.riskType = $("#riskType").val(),
	data.StartDate = $("#StartDate").val(),
	data.endDate = $("#endDate").val()
    date.riskCode="";
	if(!data.insuranceCom ==""||!data.insuranceCom ==null||!data.riskType==""||!data.riskType==""||!data.startDate ==""||!data.startDate ==null||!data.endDate==""||!data.endDate==""){
    	var url_d = "/LmriskAController/selectByAgentComAll.do";
		}
    queryTable(url_d , tab_d ,data);
	
	
}
function sel(mytype,id){
	$.ajax({
					type : "POST",
					url : path + "/LdcodeController/selectByParam.do",// 后台请求URL地址
					data : "userCode=" +mytype,
					success : function(data) {
					var select2=document.getElementById(id);
						for(var i=0;i<data.length;i++){
						var select=document.getElementById(id);
	                    var option=document.createElement("option");
						option.value=data[i].code;
						option.innerHTML=data[i].codename;
						select.appendChild(option);
						
						
						}
							
					},
					
				});
}
//公共代码
function queryTable(url , obj , data){
	obj.bootstrapTable('refresh', {
		  url: path+url,
		  query: data
	 });  

};
window.actionEvents = {

		//修改
		'click .update': function (e, value, row, index) {
			//alert(row.insuranceCom);
			var url = "update2.jsp?insuranceCom=" +row.insuAccFlag+"&riskCode="+row.riskCode;
	        toedit(url);
			
			
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

	   		insuranceCom :$("#insuranceCom").val(),
		    riskPeriod : $("#riskPeriod").val(),
			StartDate : $("#StartDate").val(),
			endDate: $("#endDate").val(),
	        riskCode:"",
	    }; 
	    return param; 
}

function actionFormatter(value, row, index) {      
	return [
		'<button class="btn btn-primary update">修改</button>'
	].join('');
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
		return row.contNo;
	});
}

$(function(){
	$("#add").click(function(){
		window.location.href='sh2.jsp';
	});
});
