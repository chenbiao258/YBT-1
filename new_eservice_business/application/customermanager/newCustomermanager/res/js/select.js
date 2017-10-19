
var tab_d = $('#cusTable');
var init_url =  "/UserSearchController/queryLduserA.do";

// 页面初始化
$(document).ready(function() {

	
	/**加载页面表格*/
	var col = [{field: 'state',align: 'center',valign : 'middle',checkbox: true,visible: true},
	  			   {field: 'metentid',title: '序号',formatter: function (value, row, index) {  
	  				   row.metentid=index;
                       return index+1;  
                   }},
                    {field: 'emplID',title: 'Empl ID',align: 'center',valign : 'middle',visible: true},
	   				{field: 'name',title: 'Name',align: 'center',sortable: true,valign : 'middle',visible: true},
	   				{field: 'department',title: 'Department',align: 'center',sortable: true,valign : 'middle',visible: false},
	   				{field: 'jobCode',title: 'Job Code',align: 'center',valign : 'middle',visible: true},
	   				{field: 'companyCode',title: 'Company Code',align: 'center',sortable: true,valign : 'middle',visible: true},
	   				{field: 'companyName',title: 'Company Name',align: 'center',valign : 'middle',visible: true},
	   				{field: 'location',title: 'Location',align: 'center',sortable: true,valign : 'middle'},
	   				{field: 'status',title: 'Status',align: 'center',valign : 'middle',visible: true},
	   				{field: 'salesrole1',title: 'Sales Role1',align: 'center',valign : 'middle',visible: false},
	   				{field: 'salesrole2',title: 'Sales Role2',align: 'center',valign : 'middle',visible: false},	   				
	   				{title: '操作',align: 'center',formatter: actionFormatter,events: actionEvents}
	   				];
	
	
	showReg();
	showCity();
	showLocationCode();
	showsub();
	var uniqueId = "metentid";
	var sortOrder = "metentid asc";

	 $("#search").click(function() {
   		//参数
   		var data  = new Object();
   		data.RegionId=$('#RegionId option:selected').text();
   		data.location=$('#LocationId option:selected').text();
   		data.city=$('#CityId option:selected').text();
   		data.SubbranchId=$('#SubbranchId option:selected').text();
   		data.companyName=$('#CompanyNameId option:selected').text();
   		data.department=$('#DepartmentId option:selected').text();
   		data.emplID=$("#staffid").val();
   	  $("#cusTable").bootstrapTable('destroy');
		var url_d = "/UserSearchController/queryLduserA.do";
		tableInit3(url_d,tab_d,col,uniqueId,sortOrder,queryParams);
		//queryTable(url_d , tab_d ,data);
   });

	 
	 //明细查询
	 $("#detail").click(function() {
		 var url ="Detail.jsp";
			toback(url);
	   });

});





//获取CheckBox选中的行
function mycheckbox(state){
	 //审核
	 var arr=$('#cusTable').bootstrapTable('getSelections');
	 for(var i=0;i<arr.length;i++){
		 mycheck(arr[i].qualiinfono,arr[i].othersign,state);
	 }
	
}

function mycheck(qualiinfono,othersign,state){
	$.ajax({
		type : "POST",
		url:path+"/LDQUALIINFOAController/updateByPrimaryKeySelective.do",// 后台请求URL地址
		data : "qualiinfono="+qualiinfono+"&othersign="+othersign +"&state="+state,
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
        '<button class="btn btn-red remove">资质查询</button>'+
        '<button class="btn btn-red select">training查询</button>' 
	].join('');
}

window.actionEvents = {
		//资质查询
		'click .remove': function (e, value, row, index) {
			var url ="Detail.jsp?emplID="+row.emplID+"&salesrole1="+row.salesrole1+"&salesrole2="+row.salesrole2;
			tomyback(url);
	   },
	   //training查询
	   'click .select': function (e, value, row, index) {
			var url ="latraining.jsp?staffid="+row.emplID;
			tomyback(url);
	   },
		
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
	        RegionId:$('#RegionId option:selected').val(),
	        location:$('#LocationId option:selected').val(),
			city:$('#CityId option:selected').val(),
			SubbranchId:$('#SubbranchId option:selected').val(),
			companyName:$('#CompanyNameId option:selected').val(),
			department:$('#DepartmentId option:selected').val(),
			emplID:$("#staffid").val()
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
		 pageSize: 10, //每页的记录行数（*）
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
	    	 if(field!="othersign"){
	              $.ajax({
	                   type: "post",
	                   url: path+"/LDQUALIINFOAController/update.do",
	                   data:"qualiinfono="+row.qualiinfono+"&othersign="+row.othersign+"&approval="+row.approval+"&approvalno="+row.approvalno,
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
	    	 }else{
              $.ajax({
                   type: "post",
                   url: path+"/LDQUALIINFOAController/update.do",
                   data:"qualiinfono="+row.qualiinfono+"&othersign="+row.othersign+"&myothersign="+oldValue+"&approval="+row.approval+"&approvalno="+row.approvalno,
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


//查询Region
function showReg(){
document.getElementById("RegionId").options.length = 1;
	$.ajax({
		url : path + "/LaagentController/SelectByRegionAll.do",// 后台请求URL地址
		type : "POST",
		success : function(data) {
		
			for(var i=0;i<data.length;i++){
			var select=document.getElementById("RegionId");
            var option=document.createElement("option");
			option.value=data[i].regionId;
			option.innerHTML=data[i].region;
			select.appendChild(option);
			
			
			}
			
			
				},
		error : function() {
				alert("加载类型失败!");
		}
	});
	
}



//查询LocationId
function showLocationCode(){
	var a=$('#RegionId option:selected').val();
	document.getElementById("LocationId").options.length = 1;
	$.ajax({
		url : path + "/LaagentController/selectByLocationCodeId.do",// 后台请求URL地址
		type : "POST",
		data:"userCode="+a,
		success : function(data) {
	
			for(var i=0;i<data.length;i++){
			var select=document.getElementById("LocationId");
            var option=document.createElement("option");
			option.value=data[i].locationId;
			option.innerHTML=data[i].locationCode;
			select.appendChild(option);
			
			
			}
			
			
				},
		error : function() {
				alert("加载类型失败!");
		}
	});
	
}



//查询CityId
function showCity(){
	var a=$('#LocationId option:selected').val();
	document.getElementById("CityId").options.length = 1;
	$.ajax({
		url : path + "/LaagentController/selectByCityId.do",// 后台请求URL地址
		type : "POST",
		data:"userCode="+a,
		success : function(data) {

			for(var i=0;i<data.length;i++){
			var select=document.getElementById("CityId");
            var option=document.createElement("option");
			option.value=data[i].cityId;
			option.innerHTML=data[i].city;
			select.appendChild(option);
			
			
			}
			
			
				},
		error : function() {
				alert("加载类型失败!");
		}
	});
	
}



//查询SubbranchId
function showsub(){
var a=$('#CityId option:selected').val();
document.getElementById("SubbranchId").options.length = 1;
	$.ajax({
		url : path + "/LaagentController/SelectBySubbranchId.do",// 后台请求URL地址
		type : "POST",
		data:"userCode="+a,
		success : function(data) {
		
			for(var i=0;i<data.length;i++){
			var select=document.getElementById("SubbranchId");
            var option=document.createElement("option");
			option.value=data[i].subbranchId;
			option.innerHTML=data[i].subbranch;
			select.appendChild(option);
			}
			  },
		error : function() {
				alert("加载类型失败!");
		}
	});
	
}



//查询CompanyNameId
function showCompanyName(){
	var a=$('#CityId option:selected').val();
	document.getElementById("CompanyNameId").options.length = 1;
	$.ajax({
		url : path + "/LaagentController/selectByCompanyNameId.do",// 后台请求URL地址
		type : "POST",
		data:"userCode="+a,
		success : function(data) {
		
			for(var i=0;i<data.length;i++){
				
			var select=document.getElementById("CompanyNameId");
            var option=document.createElement("option");
			option.value=data[i].companyNameId;
			option.innerHTML=data[i].companyName;
			select.appendChild(option);
			
			
			}
		
				},
		error : function() {
				alert("加载类型失败!");
		}
	});
	
	
}



//查询DepartmentId
function showDepartment(){
	var a=$('#CompanyNameId option:selected').val();
	document.getElementById("DepartmentId").options.length = 1;
	$.ajax({
		url : path + "/LaagentController/selectByDepartmentId.do",// 后台请求URL地址
		type : "POST",
		data:"userCode="+a,
		success : function(data) {
	
			for(var i=0;i<data.length;i++){
			var select=document.getElementById("DepartmentId");
           var option=document.createElement("option");
			option.value=data[i].departmentId;
			option.innerHTML=data[i].department;
			select.appendChild(option);
			
			
			}
			
			
				},
		error : function() {
				alert("加载类型失败!");
		}
	});
	
}







//---时间显示
$(function() {
	showLeftTime();
});
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