var tab_d = $('#cusTable');

// 页面初始化
$(document).ready(function() {
	
	var init_url = "/menuController/queryByGrpMenutwo.do";
	
  var url_d ="/menuController/queryByGrpMenutwo.do";
	
	/**加载页面表格*/
	var col = [{field: 'state',align: 'center',valign : 'middle',checkbox: true,visible: true},
	  			   {field: 'metentid',title: '序号',formatter: function (value, row, index) {  
                       return index+1;  
                   }},
                    {field: 'submenuname',title: '一级菜单名称',align: 'center',valign : 'middle',visible: true},
	   				{field: 'submenu',title: '一级菜单代码',align: 'center',sortable: true,valign : 'middle',visible: false},
	   				{field: 'meddlemenuname',title: '二级菜单名称',align: 'center',sortable: true,valign : 'middle'},
	   				{field: 'meddlemenu',title: '二级菜单代码',align: 'center',valign : 'middle',visible: true,visible: true},
	   			
	   				
	  			   ];
	
	var uniqueId = "metentid";
	var sortOrder = "metentid asc";

		 tableInit3(init_url,tab_d,col,uniqueId,sortOrder,queryParams);
		
		 

			$(".back").click(function(){
				var url ="menuGrp.jsp";
				toback(url);
			});

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
		/*var url ="userSearch.jsp";
		toback(url);*/
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
              message: '菜单组名称验证失败',
              validators: {
                  notEmpty: {
                      message: '菜单组名称不能为空'
                  } ,
                  remote:{
                	  message: '菜单组名称已存在，请重新输入',
                	  url : path + "/LdmenuGrpController/distinctAgentCom.do",
                	  delay:2000
                  }
                  
                }
          },
          menugrpdescription: {
              message: '菜单组描述验证失败',
              validators: {
                  notEmpty: {
                      message: '菜单组描述不能为空'
                  } ,
                }
          },
          menustate: {
              message: '菜单组状态验证失败',
              validators: {
                  notEmpty: {
                      message: '菜单组状态不能为空'
                  } ,
                }
          },
       
      },
      
     
      submitHandler: function (validator, form, submitButton) {
    	 var ids1 =form.serialize();
    		addproduct(ids1);
    	 
		
		
      }
  });
	
	
	function addproduct(ids1) {
		
		$.ajax({
			type : "POST",
			url:path+"/LdmenuGrpController/saveAddBean.do",// 后台请求URL地址
			data : ids1,
			dataType : "json",
			success : function(data) {
				
				if(data!=0){
					 var arr=$('#cusTable').bootstrapTable('getSelections');
						if(arr.length>0){
							mycheckbox(data);
						}
						else
						{
							alert('新增成功！');
							var url ="menuGrpTwo.jsp";
							toback(url);
						}
					
					
					
				}else if(data==0){
					alert('新增失败！');
				}
			},
			error : function() {
				alert("plus failed");
			}
		});
	}
	
	//获取CheckBox选中的行
	function mycheckbox(seq){

		 //菜单
		 var arr=$('#cusTable').bootstrapTable('getSelections');
		
		 for(var i=0;i<arr.length;i++){
			 insertLDUserTOMenuGrpA(arr[i].submenu,arr[i].meddlemenu,seq,i,arr.length);
		 }
		
	}
	
	

	//给用户添加已选菜单UserCode,MenuGrpCode 
	function insertLDUserTOMenuGrpA(nodecode,meddlemenu,menugrpcode,i,j){

		$.ajax({
			type : "POST",
			url:path+"/ldmenugrptomenuaController/saveAddtwo.do",// 后台请求URL地址
			data :  "menugrpcode="+menugrpcode+"&nodecode="+nodecode+"&meddlemenu="+meddlemenu,
			dataType :"json",
			success : function(data) {
				
				if(data=="1"&&i==j-1){
					alert('已添加');
					var url ="menuGrpTwo.jsp";
					toback(url);
				}
			},
			error : function() {
				alert("plus failed");
			}
		});
			
		}
	
	
	//添加userCode,phone,chinaName到lduserotherinfoa表
	function insertLduserotherinfoa(){
		 var userCode=$("#userCode").val();
		 var phone=$("#phone").val();
		 var chinaName=$("#chinaName").val();
		$.ajax({
			type : "POST",
			url:path+"/LduserotherinfoaController/insertA.do",// 后台请求URL地址
			data :"userCode="+userCode+"&phone="+phone+"&chinaName="+chinaName,
			dataType : "json",
			success : function(data) {
				
				if(data=="1"){
					
				}
			},
			error : function() {
				alert("plus failed");
			}
		});
		
	}


	
	
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
	        //这里是在ajax发送请求的时候设置一些参数 params有什么东西，
	    	//自己看看源码就知道了 limit: params.pageSize,
    		limit : params.limit,
	        offset: params.offset,
	        
	        sortName:params.sortName,//排序列名
	        sortOrder:params.sortOrder,//排位命令（desc，asc）
	        
	        pageSize: params.pageSize,
	        pageNumber:params.pageNumber,
	        usercode : '222',
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


//用户状态
function selflag(){

		$.ajax({
					type : "POST",
					url : path + "/LdcodeController/SelectByCodetype.do",// 后台请求URL地址
					data : "userCode=" +"riskstate",
					success : function(data) {
					
						for(var i=0;i<data.length;i++){
						
						var select=document.getElementById("UserState");
	                    var option=document.createElement("option");
						option.value=data[i].code;
						option.innerHTML=data[i].codename;
						select.appendChild(option);
						
						}
						
						
						}
					
			});
		

	}

//查询银行网点
function showbank(){
	
	$.ajax({
		url : path + "/bankInstitutionAddController/selectByComcode.do",// 后台请求URL地址
		type : "POST",
		dataType : "json",
		success : function(data) {
			
			var select2=document.getElementById("ComCode");
			for(var i=0;i<data.length;i++){
			var select=document.getElementById("ComCode");
            var option=document.createElement("option");
			option.value=data[i].bankCode;
			option.innerHTML=data[i].bankName;
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