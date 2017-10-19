var tab_d = $('#cusTable'),
$remove = $('#remove');

var init_url = "";
	

var col;

var uniqueId;
var sortOrder;



// 页面初始化
$(document).ready(function() {
	
	/**加载页面表格*/
	col = [{field: 'state',align: 'center',valign : 'middle',checkbox: true,visible: true},
	  			   {field: 'id',title: '序号',formatter: function (value, row, index) {  
                       return index+1;  
                   }},
                    {field: 'riskCode',title: '险种代码',align: 'center',sortable: true,valign : 'middle'},
	   				{field: 'riskName',title: '险种名称',align: 'center',sortable: true,valign : 'middle'}
	  			   ];
	
	uniqueId = "id";
	sortOrder = "id asc";
	tableInit3(init_url,tab_d,col,uniqueId,sortOrder,queryParams);
//	$("#char4").val(chk());
	$("#search").click(function() {
		
		
   });
	

	
	 $('form').bootstrapValidator({
         message: 'This value is not valid',
         feedbackIcons: {
             valid: 'glyphicon glyphicon-ok',
             invalid: 'glyphicon glyphicon-remove',
             validating: 'glyphicon glyphicon-refresh'
         },
         fields: {
        	 riskCode: {
                 message: '险种代码验证失败',
                 validators: {
                     notEmpty: {
                         message: '险种代码不能为空'
                     } ,
                     remote:{
                   	  message: '险种代码已存在，请重新输入',
                   	  url : path + "/LmriskAController/distinctByRiskCode.do",
                   	  delay:2000
                     }
                     
                     /*
                     stringLength: {
                         min: 1,
                         max: 5,
                         message: '保险公司编码必须在1到5位之间'
                     },
                     regexp: {
                         regexp: /^[a-zA-Z0-9_]+$/,
                         message: '用户名只能包含大写、小写、数字和下划线'
                     } */
                 }
             },
             insuranceCom: {
                 validators: {
                     notEmpty: {
                         message: '保险公司名称不能为空'
                     }
                 }
             },
             subRiskFlag:{
               validators: {
                     notEmpty: {
                         message: '主附险状态不能为空'
                     }
                 }
              },
              riskName: {
                 validators: {
                     notEmpty: {
                         message: '险种名称不能为空'
                     }
                 }
             },
            /*  makedate:{
           	   validators: {
           		   date:{
           		format:'yyyy-mm-dd', 
           		message:'The format is yyyy-mm-dd'
           		   },
           		  notEmpty: {
                          message: '成立日期不能为空'
                      },
           	   },
              },*/
             char3: {
            	  validators: {
                      notEmpty: {
                          message: '投保单打印类型不能为空'
                      }
                  }
               },    
          riskProp:{
               validators: {
                     notEmpty: {
                         message: '保险产品外部代码不能为空'
                     }
                 }
              },
              risk:{
                  validators: {
                        notEmpty: {
                            message: '风险等级不能为空'
                        }
                    }
                 },
                 
              
              riskType:{
               validators: {
                     notEmpty: {
                         message: '险种类型不能为空'
                     }
                 }
              },
              
              
              
              char1:{
               validators: {
                     notEmpty: {
                         message: '保费计算方式不能为空'
                     }
                 }
              },
              
              
              char6:{
               validators: {
                     notEmpty: {
                         message: '险种状态不能为空'
                     }
                 }
              },  
         },
         
        
         submitHandler: function (validator, form, submitButton) {
            var ids1 =form.serialize();
 			mycheckbox();
    		addParam();
    		riskVerSel();
    		addProduct(ids1);
         }
     });
	
	
	

});




//获取CheckBox选中的行
function mycheckbox(){

	 //01  附加险关系
	 var arr=$('#cusTable').bootstrapTable('getSelections');
	 var riskcode=$("#riskCode").val();
	 for(var i=0;i<arr.length;i++){
		 addDef(arr[i].riskCode,riskcode,'01',arr.length-1,i);
	 }
	
}







var num = 0;
$("#add").click(function() {
	num++;
	
	//获取表格行数
	 var rows = document.getElementById("lacoms").rows.length; 
	 //判断，根据行数清空序号
	if(rows==0){
		 num=1;
	 }
	
					var tr = "<tr>" +
								"<td >"+"<input type='text' value="+num+" id=" + 'row'+ num + ''+ " readonly='readonly' style='text-align:center'>" +"</td>"+
							    "<td id=" + 'type'+ num + ''+ ">"+"<select class='form-control' style='width:200px;' id="+ 'a'+ num+ ''+ " name="+ 'a'+ num+ ''+ "  onchange="+ 'selByCodealias(this.value,'+ num+")>+  "+"<option>请选择</option>"+"</select>"+"</td>"+
							    "<td id=" + 'type'+ num + ''+ ">"+"<select class='form-control' style='width:200px;' id="+ 'b'+ num+ ''+ " name="+ 'b'+ num+ ''+ "  >+ "+"<option>请选择</option>"+"</select>"+"</td>"+
								  
					         "</tr>";											
					$("#lacoms").append(tr);// 在table最后面添加一行
					
					sel('riskinputtype01','a'+ num,num);
					var a=0;
					a=num-1;
					
					// 加载类型
					$.ajax({
						url : path + "/InsuComController/QueryAll.do",// 后台请求URL地址
						type : "POST",
						dataType : "json",
						success : function(data) {
							for (var i = 0; i < data.length; i++) {
								$("#S" + num).append("<option value="+ data[i].agentcom+ ">"+ data[i].name+ "</option>")
								
									}
								},
						error : function() {
								alert("加载类型失败!");
						}
					});
				});


$("#del").click(function() {
	 //获取表格行数
	 var rows = document.getElementById("lacoms").rows.length; 
	 //判断，根据行数保留表头
	 if(rows>0){
		$("#lacoms").find("tr:last").remove();
		num=num-1;
	 }
	 if(rows==1){
		 num=0;
	 }
});





//查询所有产品
function myquery(){
			var a=$('#insuranceCom option:selected').val();
			var b=$('#subRiskFlag option:selected').val();
			if(b=="S"){
				var data  = new Object();
 		   	//保险公司代码	
		   		data.agentcom =a;
		   		var url_d = "/LmriskAController/queryProduct.do";
		   		queryTable(url_d , tab_d ,data);
	
			}else{
			var data  = new Object();
 		   	//保险公司代码	
		   		data.agentcom ="";
		   		var url_d = "/LmriskAController/queryProduct.do";
		   		queryTable(url_d , tab_d ,data);
		}

}
//新增产品
function addProduct(ids1){
    $.ajax({
		type : "POST",
		url:path+"/LmriskAController/saveAddBean.do",// 后台请求URL地址
		data :ids1,
		dataType : "json",
		success : function(data) {
			if(data=="1"){
				alert("产品添加成功");
				var url ="add.jsp";
				toback(url);
			}
		},
		error : function() {
			alert("plus failed");
		}
	});
}

function riskVerSel(){
	var a=$('#char3').find("option:selected").text();
	$("#riskVer").val(a);
	var b=$('#char6').find("option:selected").text();
	$("#riskShortName").val(b);
}



/*
$('input[type="checkbox"]').on('change', function() {
	   $(this).siblings('input[type="checkbox"]').prop('checked', false);
	   $("#char4").val(chk());
	});
*/



/*//获取复选框选中的值
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
}*/

//新增参数
function myadds(){
	for(var i=1;i<=5;i++){

	var paramstype=$('#a'+i+' option:selected').val();
	var paramscode=$('#b'+i+' option:selected').val();
	var paramsname=$('#b'+i).find("option:selected").text();
	var riskcode=$("#riskCode").val();

	insertParam(paramstype,paramscode,paramsname,riskcode);
}

}


function addParam(){
	
	if (num != 0) {
		// 去取参数
		var qualificationInfo = $("#lacoms").children(
				"tr");
		for (var i = 0; i < qualificationInfo.length; i++) {

			var tdArr = qualificationInfo.eq(i).find("td");
			var paramstype = tdArr.eq(1).find("select").children('option:selected').val();
			var paramscode = tdArr.eq(2).find("select").children('option:selected').val();
			var paramsname = tdArr.eq(2).find("select").children('option:selected').text();
			var riskcode=$("#riskCode").val();
			
			//校验
			if(paramstype == '请选择'||paramscode == '请选择'){
				alert("类型选择错误!!!");
			}
			insertParam(paramstype,paramscode,paramsname,riskcode,qualificationInfo.length-1,i);

		}
	}
}


function insertParam(paramstype,paramscode,paramsname,riskcode,i,j){
	
	$.ajax({
			type : "POST",
			url:path+"/LmriskparamsdefaController/saveAddBean.do",// 后台请求URL地址
			data :"paramstype="+paramstype+"&paramscode="+paramscode+"&paramsname="+paramsname+"&riskcode="+riskcode,
			dataType : "json",
			success : function(data) {
				if(data=="1"&&i==j){
					alert("参数添加成功");
					var url ="add.jsp";
					toback(url);
				}
			},
			error : function() {
				alert("plus failed");
			}
		});
}
//新增险种
function addDef(riskcode,relariskcode,relacode,j,i){

	//var ids1 = $("#form-def").serialize();
	$.ajax({
		type : "POST",
		url:path+"/lmriskrelaAController/saveAddBean.do",// 后台请求URL地址
		data :"riskcode="+riskcode+"&relariskcode="+relariskcode+"&relacode="+relacode,
		dataType : "json",
		success : function(data) {
			if(data=="1"&&j==i){
				alert("险种添加成功");
				var url ="add.jsp";
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

//根据保险公司查出对应的投保单打印类型
function selLower(mytype,id){
	var b=$('#'+mytype+' option:selected').val();
	
	document.getElementById(id).options.length = 1;
	$.ajax({
		type : "POST",
		url : path + "/LdcodeController/selectBylower.do",// 后台请求URL地址
		data : "userCode=" +b,
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



function mychange(mytype,param){
	var a=$('#'+mytype+' option:selected').val();
	var b=$('#'+param+' option:selected').val();
	if(a=="S"){
		$.ajax({
			type : "POST",
			url : path + "/LmriskController/queryProduct.do",// 后台请求URL地址
			data : "agentcom=" +b,
			success : function(data) {
			
			},
			
		});
		
	}
}



function sel(mytype,id,num){
	if(mytype=='riskinputtype01'){
		document.getElementById(id).options.length =0;
		$('#b'+num+'').attr("disabled","disabled");
	}else{
		document.getElementById(id).options.length = 1;
	}
	
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


function selByCodealias(param,show){
	id='b'+show;
	$('#'+id+'').removeAttr("disabled");
	//var b=$('#'+param+' option:selected').val();
	var b=param;
	show='c'+show;

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

function mychan2(param,id){
	var a=$('#'+param).find("option:selected").text();
	var b=$('#'+param+' option:selected').val();
	
}


function selByThree(param,myval){
	
	var b=$('#'+param+' option:selected').val();
  
sub(b,myval);
}



function sub(str,myval){
	var i = str.length;
	var num =str.substring(0,(i-1));
	
	var myyear = str.substring((i-1), i);

	
	$('#'+myval+'').val(myyear);
	
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
	        userCode : $("#userCode").val(),
			userName : $("#userName").val()
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
	
	// 查询
	$(".search").click(function(){
		$("#cusTable").bootstrapTable('refresh', {
            url: 'employee.json'
        });
	});
});





//查询
function showUser(a,b,c){

	$.ajax({
			type : "POST",
			url : path+"/LaqualiinfoController/selectBytypeAndinfo.do",// 后台请求URL地址
			data:"qualiinfo="+ a+"&qualifitype="+ b + "",    
			success : function(data) {
		if(data.length>0){
			var url = "laqualiinfoUpdate.jsp?qualifitype=" +b+"&qualiinfo="+a+"&flag="+c;
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

