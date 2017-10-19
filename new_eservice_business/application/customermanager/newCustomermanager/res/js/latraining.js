var tab_d = $('#cusTable'),
$remove = $('#remove');

var init_url = "";
	
var url_d = "/LatrainingController/selectBystaffid.do";

var col;

var uniqueId;
var sortOrder;



// 页面初始化
$(document).ready(function() {
	
	
	
	/**加载页面表格*/
	col = [{field: 'state',align: 'center',valign : 'middle',checkbox: true,visible: false},
	  			   {field: 'metentid',title: '序号',formatter: function (value, row, index) {  
                       return index+1;  
                   }},
                   {field: 'id',title: 'id',align: 'center',sortable: true,valign : 'middle',visible: false},
                   {field: 'staffid',title: 'staffid',align: 'center',sortable: true,valign : 'middle',visible: true},
                    {field: 'name',title: 'name',align: 'center',sortable: true,valign : 'middle'},
	   				{field: 'courseCode',title: 'coursecode',align: 'center',sortable: true,valign : 'middle'},
	   				{field: 'courseTitle',title: 'coursetitle',align: 'center',sortable: true,valign : 'middle'},
	   				{field: 'insuranceType',title: 'insuranceType',align: 'center',sortable: true,valign : 'middle'},
	   				{field: 'getstartdate',title: 'startdate',align: 'center',sortable: true,valign : 'middle'},
	   				{field: 'getenddate',title: 'enddate',align: 'center',sortable: true,valign : 'middle'}
	   				];
	
	uniqueId = "metentid";
	sortOrder = "metentid asc";

	tableInit3(url_d,tab_d,col,uniqueId,sortOrder,queryParams);
	
	 $(".back").click(function(){
			location.href="select.jsp";
		});
	
	$("#search").click(function() {
		mycheckbox();
	
   });
	
	
});

var array;
//获取CheckBox选中的行
function mycheckbox(){
	 //审核
	 var arr=$('#cusTable').bootstrapTable('getSelections');
	 array=new Array([arr.length-1]);

	 if(arr.length==0){
		 alert('请选择要下载的行！');
	 }else{
		 
	 
	 for(var i=0;i<arr.length;i++){
		 array[i]=arr[i].id;
		 
	 }
	
	 download(array);
	 }
}


function download(array){
	//newwin=window.open("../../../latraining/newlatraining/download.jsp");
	
	
	//newwin.moveTo(0,0);
		//newwin.resizeTo(screen.width,screen.height);
$.ajax({
		type : "POST",
		url:path+"/LatrainingController/download.do",// 后台请求URL地址
		data:"id="+array,
		dataType : "json",
		success : function(data) {
			var docpath='courseDownload';
			var modifiedname=data+'.xml';
			var url ="download.jsp?path=D:/"+docpath+"/"+modifiedname+"&a="+'sdf';
			toback(url);
			
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


//select选中事件
function selLdcode(){
//	$("#search").attr("disabled", false);
	
	//var staffid=$('#cc option:selected') .val();//选中的值
	//var data  = new Object();
		
		//data.staffid = staffid,
		//queryTable(url_d , tab_d ,data);
	
	
}



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
	        staffid :staffid
			
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
		  pageSize: 20, //每页的记录行数（*）
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
		/*
			var ids1 = $("#form-plus").serialize();
			$.ajax({
				type : "POST",
				url:path+"/userAddController/saveAddBean.do",// 后台请求URL地址
				data : ids1,
				dataType : "json",
				success : function(data) {
					
					if(data=="1"){
						alert("添加成功");
						var url ="userSearch.jsp";
						toback(url);
					}
				},
				error : function() {
					alert("plus failed");
				}
			});
		});*/
		
	});
	// 查询
	$(".search").click(function(){
		$("#cusTable").bootstrapTable('refresh', {
            url: 'employee.json'
        });
	});
});

function actionFormatter(value, row, index) {      
	return [
        
	].join('');
}




//查询
function showUser(a,b){

	$.ajax({
			type : "POST",
			url : path+"/LatrainingController/selectBytypeAndinfo.do",// 后台请求URL地址
			data:"qualiinfo="+ a+"&qualifitype="+ b + "",    
			success : function(data) {
		if(data.length>0){
			var url = "laqualiinfoUpdate.jsp?qualifitype=" +b+"&qualiinfo="+a;
	        toedit(url);
			
		}else{
			alert("数据不存在!");
		}
				
			},
			error : function() {
				alert("plus failed");
			}
	});
	
	

}

window.actionEvents = {

	//删除
	'click .remove': function (e, value, row, index) {
		var r=confirm("确认要删除么？");
		if (r==true)
		  {
			var staffid=$('#cc option:selected') .val();//选中的值
			alert(staffid);
			$.ajax({
				type : "POST",
				url:path+"/LatrainingController/deleteBytypeAndinfo.do",// 后台请求URL地址
				data : "staffid="+staffid+"&courseCode="+ row.courseCode + "&courseTitle="+row.courseTitle+"&id="+row.id,
				dataType : "json",
				success : function(data) {
					if(data=="1"){
						alert("删除成功");
						
					}
					if(data==2){
						alert("删除失败！");
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
 }
	
};
