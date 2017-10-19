var tab_d = $('#cusTable');

// 页面初始化
$(document).ready(function() {
	
	var init_url = "/menuController/queryByGrpNotMenu.do";
	
  var url_d ="/menuController/queryByGrpNotMenu.do";
	
	/**加载页面表格*/
	var col = [{field: 'state',align: 'center',valign : 'middle',checkbox: true,visible: true},
	  			   {field: 'metentid',title: '序号',formatter: function (value, row, index) {  
                       return index+1;  
                   }},
	   				{field: 'submenuname',title: '一级菜单名称',align: 'center',valign : 'middle',visible: true},
	   				{field: 'submenu',title: '一级菜单代码',align: 'center',sortable: true,valign : 'middle',visible: false},
	   				{field: 'meddlemenuname',title: '二级菜单名称',align: 'center',sortable: true,valign : 'middle'},
	   				{field: 'meddlemenu',title: '二级菜单代码',align: 'center',valign : 'middle',visible: true,visible: false},
	   				{field: 'menuName',title: '三级菜单名称',align: 'center',valign : 'middle',visible: true},
	   				{field: 'menuDesc',title: '三级菜单代码',align: 'center',sortable: true,valign : 'middle'}
	   				
	  			   ];
	var uniqueId = "metentid";
	var sortOrder = "metentid asc";

		 tableInit3(init_url,tab_d,col,uniqueId,sortOrder,queryParams);
		
	
});


function query(){
	
	//参数
		var data  = new Object();
		data.menugrpcode=$('#menugrpcode').val();
		queryTable(url_d , tab_d ,data);
	
	
}



$(function(){
	
	showLocation('loc_province-sub1','loc_city-sub1','loc_town-sub1');

	$(".back").click(function(){
		var url ="menuGrpCheck.jsp";
		toback(url);
	});


	
	
	$("#save").click(function() {
		var ids1 = $("#form-plus").serialize();
		
		$.ajax({
			type : "POST",
			url:path+"/LdmenuGrpController/saveAddBean.do",// 后台请求URL地址
			data : ids1,
			dataType : "json",
			success : function(data) {
				
				if(data!=""){
					alert(data);
					
					
				}else if(data==0){
					alert('新增失败！');
				}
			},
			error : function() {
				alert("plus failed");
			}
		});
	
		

	});
	
	 
	 
	 $('form').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            
        	menugrpname: {
                validators: {
                    notEmpty: {
                        message: '菜单组名称不能为空'
                    }
                }
            },
            menugrpdescription:{
              validators: {
                    notEmpty: {
                        message: '菜单组描述不能为空'
                    }
                }
             },
             
             operator:{
              validators: {
                    notEmpty: {
                        message: '操作员不能为空'
                    }
                }
             },
             menustate:{
              validators: {
                    notEmpty: {
                        message: '状态不能为空'
                    }
                }
             },    
        },
        
       
        submitHandler: function (validator, form, submitButton) {
           var ids1 =form.serialize();
           addproduct(ids1);
          

		
        }
    });
	

	
});



function addproduct(ids1) {
	
	$.ajax({
		type : "POST",
		url:path+"/LdmenuGrpController/Update.do",// 后台请求URL地址
		data : ids1,
		dataType : "json",
		success : function(data) {
			
			if(data!=0){
				 var arr=$('#cusTable').bootstrapTable('getSelections');
				if(arr.length>0){
					mycheckbox(menugrpcode);
				}
				else
				{
					alert('修改成功！');
					var url ="menuGrpCheck.jsp";
					toback(url);
				}
				
			}else if(data==0){
				alert('修改失败！');
			}
		},
		error : function() {
			alert("plus failed");
		}
	});
}

//获取CheckBox选中的行
function mycheckbox(menugrpcode){

	 //菜单
	 var arr=$('#cusTable').bootstrapTable('getSelections');
	
	 for(var i=0;i<arr.length;i++){
		 insertLDUserTOMenuGrpA(arr[i].submenu,arr[i].meddlemenu,arr[i].menuDesc,menugrpcode,i,arr.length);
	 }
	
}



//给用户添加已选菜单UserCode,MenuGrpCode 
function insertLDUserTOMenuGrpA(nodecode,meddlemenu,menuDesc,menugrpcode,i,j){

	$.ajax({
		type : "POST",
		url:path+"/ldmenugrptomenuaController/saveAddBean.do",// 后台请求URL地址
		data :  "menugrpcode="+menugrpcode+"&nodecode="+nodecode+"&meddlemenu="+meddlemenu+"&menuDesc="+menuDesc,
		dataType :"json",
		success : function(data) {
			
			if(data=="1"&&i==j-1){
				alert('已添加');
				var url ="menuGrpCheck.jsp";
				toback(url);
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
	        menugrpname:menugrpname,
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
		  //pageNumber:1, //初始化加载第一页，默认第一页
		  //pageSize: 10, //每页的记录行数（*）
		 pageList: [10, 25, 50, 100], // 可供选择的每页的行数（*）
		 search: false, // 是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
		 strictSearch: true,//设置为 true启用 全匹配搜索，否则为模糊搜索
		 showColumns: true, // 是否显示所有的列
		 showRefresh: true, // 是否显示刷新按钮
		 minimumCountColumns: 2, // 最少允许的列数
		 editable:true,//开启编辑模式 
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