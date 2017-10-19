var tab_d = $('#cusTable');

// 页面初始化
$(document).ready(function() {
	
	
	
$("#search").click(function() {
	    if(deletes()){
	    	alert('true');
	    	addParam();
	    	addProduct();
	    	
	    }else{
	    	
	    	alert('false');
	    }
	    
		mycheckbox();
		//addParam();
		//addDef();
		riskVerSel();
		//addProduct();
   });
	
	 
	
});

function deletes(){
	alert('deletes');
	var riskCode = $("#riskCode").val();
	var insuranceCom = $("#insuranceCom").val();
	$.ajax({
		type : "POST",
		url:path+"/LmriskAController/deleteAll.do",// 后台请求URL地址
		data :"riskCode="+riskCode+"&insuranceCom="+insuranceCom,
		dataType : "json",
		success : function(data) {
			alert(data);
			return true;
		},
		error : function() {
			alert("plus failed");
		}
	});
	
	return false;
	
}
//删除产品
function deleteAll(){
	alert('deleteAll');
	var riskCode = $("#riskCode").val();
	var insuranceCom = $("#insuranceCom").val();
	
	$.ajax({
		type : "POST",
		url:path+"/LmriskAController/deleteAll.do",// 后台请求URL地址
		data :"riskCode="+riskCode+"&insuranceCom="+insuranceCom,
		dataType : "json",
		success : function(data) {
			alert(data);
			return true;
		},
		error : function() {
			alert("plus failed");
		}
	});
	
	return false;
}

//新增产品
function addProduct(){
    
	var ids1 = $("#form-plus").serialize();
	$.ajax({
		type : "POST",
		url:path+"/LmriskAController/saveAddBean.do",// 后台请求URL地址
		data :ids1,
		dataType : "json",
		success : function(data) {
			if(data=="1"){
				alert("添加成功");
				//var url ="add.jsp";
				//toback(url);
			}
		},
		error : function() {
			alert("plus failed");
		}
	});
}



//新增参数
function addParam(){
	for(var i=1;i<=5;i++){

	var paramstype=$('#a'+i+' option:selected').val();
	var paramscode=$('#b'+i+' option:selected').val();
	var paramsname=$('#b'+i).find("option:selected").text(); 
	var riskcode=$("#riskCode").val();

	insertParam(paramstype,paramscode,paramsname,riskcode);
}

}



function insertParam(paramstype,paramscode,paramsname,riskcode){
	
	$.ajax({
			type : "POST",
			url:path+"/LmriskparamsdefaController/saveAddBean.do",// 后台请求URL地址
			data :"paramstype="+paramstype+"&paramscode="+paramscode+"&paramsname="+paramsname+"&riskcode="+riskcode,
			dataType : "json",
			success : function(data) {
				if(data=="1"){
					alert("添加成功");
					//var url ="add.jsp";
					//toback(url);
				}
			},
			error : function() {
				alert("plus failed");
			}
		});
}
//获取CheckBox选中的行
function mycheckbox(){

	 //01  附加险关系
	 var arr=$('#cusTable').bootstrapTable('getSelections');
	 var riskcode=$("#riskCode").val();
	 for(var i=0;i<arr.length;i++){
		 addDef(arr[i].riskCode,riskcode,'01')
	 }
	
}


function riskVerSel(){
	var a=$('#char3').find("option:selected").text(); 
	$("#riskVer").val(a);
	var b=$('#char6').find("option:selected").text(); 
	$("#riskShortName").val(b);
}



function sel(insuranceCom,riskCode){
$.ajax({
		type : "POST",
		url:path+"/LmriskAController/selectByInsu.do",// 后台请求URL地址
		data : "insuranceCom="+insuranceCom+"&riskCode="+riskCode,
		dataType : "json",
		success : function(data) {
			var json=eval(data);
			$("#insuranceCom").val(json[0].insuranceCom); 
			$("#endDate").val(json[0].endDate); 
			$("#StartDate").val(json[0].startDate); 
			$("#riskCode").val(json[0].riskCode); 
			$("#riskShortName").val(json[0].riskShortName);
			$("#riskName").val(json[0].riskName);
			
			$("#riskProp").val(json[0].riskProp);
			$("#operator").val(json[0].operator); 
			$("#char1").val(json[0].char1); 
			$("#char3").val(json[0].char3); 
			$("#riskPeriod").val(json[0].riskPeriod); 
			$("#s1").val(json[0].char3); 
			$("#s2").val(json[0].char6); 
			$("#s3").val(json[0].subRiskFlag); 
			$("#s4").val(json[0].riskType); 
			$("#s5").val(json[0].char1); 
			
			var char4=json[0].char4;
			var char5=json[0].char5;
			var cha=";"
			if(char4==""){
				cha=char5;
			}
			cha=char4;
			$("#char4").val(cha); 
			//选择资质类型
			change1(cha);
		},
		error : function() {
			alert("plus failed");
		}
	});
	
	
}

//选择资质类型
function change1(cha){
    
    var inputs = document.getElementsByName("checks");

    for(var i=0;i<inputs.length;i++){
       var val = inputs[i].value;
       console.info(i);
       if(cha==val){
           inputs[i].checked=true;
       }else{
           inputs[i].checked=false;
       }
    }  
}

function checkall(id,id2){
    var a=$("#"+id+"").val();
	var select=document.getElementById(id2);
			for(var i=0;i<select.options.length;i++){
			if(select.options[i].value==a){
			select.options[i].selected=true;
			break;
			
			}
			
			}
    }



function checkdef(param,id2){
 
	var select=document.getElementById(id2);
			for(var i=0;i<select.options.length;i++){
			if(select.options[i].value==param){
			select.options[i].selected=true;
			break;
			
			}
			
			}
    }



function QueryParam(){
	var a=$('#riskCode').val();
$.ajax({
		type : "POST",
		url:path+"/LmriskAController/QueryParam.do",// 后台请求URL地址
		data : "riskCode="+a,
		dataType : "json",
		success : function(data) {
			var json=eval(data);
			//alert(data.length);
			
			for(var i=1;i<=data.length;i++){
				checkdef(json[i-1].paramstype,'a'+i);
				selCodealias(json[i-1].paramstype,'b'+i);
				
			}
		
		},
		error : function() {
			alert("plus failed");
		}
	});
	
	
}


$('input[type="checkbox"]').on('change', function() {
	   $(this).siblings('input[type="checkbox"]').prop('checked', false);
	   $("#char4").val(chk());
	});




//获取复选框选中的值
function chk(){ 
	var obj=document.getElementsByName('checks'); //选择所有name="'checkbox1'"的对象，返回数组 
	//取到对象数组后，我们来循环检测它是不是被选中 
	var s=''; 
	for(var i=0; i<obj.length; i++){ 
	if(obj[i].checked) s+=obj[i].value; //如果选中，将value添加到变量s中 
	} 
	//那么现在来检测s的值就知道选中的复选框的值了 
	//alert(s==''?'你还没有选择任何内容！':s); 
	
	return s;
}
//根据保险公司查出对应的投保单打印类型
function selLower(b){
document.getElementById('char3').options.length = 0;
	$.ajax({
		type : "POST",
		url : path + "/LdcodeController/selectBylower.do",// 后台请求URL地址
		data : "userCode=" +b,
		success : function(data) {
		var select2=document.getElementById('char3');
			for(var i=0;i<data.length;i++){
			var select=document.getElementById('char3');
            var option=document.createElement("option");
			option.value=data[i].code;
			option.innerHTML=data[i].codename;
			select.appendChild(option);
			//alert(data[i].code);
			
			}
			
//			/$("#char3").val(a);
		
		},
		
	});
	
}




function selByCodealias(param,id,show){
	var b=$('#'+param+' option:selected').val();
	//清空
	document.getElementById(id).options.length = 0; 
	$.ajax({
					type : "POST",
					url : path + "/LdcodeController/QueryByCodetype.do",// 后台请求URL地址
					data : "userCode="+b,
					success : function(data) {
					var select2=document.getElementById(id);
						for(var i=0;i<data.length;i++){
						var select=document.getElementById(id);
	                    var option=document.createElement("option");
						option.value=data[i].code;
						option.innerHTML=data[i].codename;
						select.appendChild(option);
						$("#"+show).val(data[0].codename);
						}
							
					},
					
		});
}




function selCodealias(b,id){
	
	//清空
	document.getElementById(id).options.length = 0; 
	$.ajax({
					type : "POST",
					url : path + "/LdcodeController/QueryByCodetype.do",// 后台请求URL地址
					data : "userCode="+b,
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






function sels(mytype,id){
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

		//审核
		'click .update': function (e, value, row, index) {
			
			var url = "sh2.jsp?insuranceCom=" +row.insuranceCom+"&riskCode="+row.riskCode;
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
	        bankName : $("#bankName").val(),
			salesChl : $("#salesChl").val(),
			tContNo : $("#contNo").val(),
			riskCode : $("#riskCode").val()
	    }; 
	    return param; 
}

function actionFormatter(value, row, index) {      
	return [
		'<button class="btn btn-primary update">审核</button>'
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
