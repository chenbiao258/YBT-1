var tab_d = $('#cusTable');

// 页面初始化
$(document).ready(function() {

					var col = [{
						checkbox:true
					},
					 {
						field : 'metentid',
						title : '序号',
						formatter : function(value, row, index) {
							return index + 1;
						}
					}, {
						field : 'proposalcontno',
						title : '投保单号',
						align : 'center',
						valign : 'middle',
						visible : true
					}, {
						field : 'polapplydateString',
						title : '投保日期',
						align : 'center',
						valign : 'middle'
					}, {
						field : 'grpcontno',
						title : '投保人CIF',
						align : 'center',
						valign : 'middle'
					}, {
						field : 'appntname',
						title : '投保人姓名',
						align : 'center',
						valign : 'middle',
						visible : true
					}, {
						field : 'insurancecom',
						title : '保险公司',
						align : 'center',
						sortable : true,
						valign : 'middle'
					}, {
						field : 'appflag',
						title : '投保单状态',
						align : 'center',
						valign : 'middle'
					}, {
						field : 'executecom',
						title : '交易类型',
						align : 'center',
						valign : 'middle'
					} ];

					var uniqueId = "metentid";

			$("#search").click(function() {
//				$("#copyCont").disabled = false;
				$("#copyCont").attr("disabled", false);
				$("#cancelcontNo").attr("disabled", false);
				$("#cancelInsure").attr("disabled", false);
				$("#cusTable").bootstrapTable('destroy');
				var url_d = "/newContApply/selectCont.do";
				tableInit3(url_d, tab_d, col,uniqueId, queryParams);
			});
			
			
			$("#selectCont").click(function(){
				var lineData = tab_d.bootstrapTable('getSelections');
				if(lineData.length==null){
					alert("请选中1一条数据!");
					return;
				}
				if(lineData.length==0){
					alert("请选中一条数据!");
					return;
				}
				if(lineData.length>1){
					alert("只能选择一条数据进行继续录入!");
					return;
				}
				
				window.location.href="partNewContEnter.jsp?flag=3&transno="+lineData[0].transno;
				
				
			})
			
			$("#reset").click(function(){
			
				var lineData = tab_d.bootstrapTable('getSelections');
				if(lineData.length==null){
					alert("请选中一条数据!");
					return;
				}
				if(lineData.length==0){
					alert("请选中一条数据!");
					return;
				}
				if(lineData.length>1){
					alert("只能选择一条数据进行继续录入!");
					return;
				}
				
				window.location.href="partNewContEnter.jsp?flag=2&transno="+lineData[0].transno;
				
				
			})
			

				$("#applyOutcontNo").click(function(){
				
				
				var lineData = tab_d.bootstrapTable('getSelections');
				if(lineData.length==null){
					alert("请选中一条数据!");
					return;
				}
				if(lineData.length==0){
					alert("请选中一条数据!");
					return;
				}
				if(lineData.length>1){
					alert("只能选择一条数据进行犹豫期退保!");
					return;
				}

				$.ajax({
					url  : path + "/newContEnter/hesitation.do",
					type : "POST",
					data : {"transno":lineData[0].transno},
					dataType : "json",
					success : function(data) {
						alert(data.msg);
						
					},
					error : function() {
						alert("申请核保失败!");
					}
				});
				
				
			})
			
			
			//取消投保
			$("#cancelInsure").click(function(){
				var lineData = tab_d.bootstrapTable('getSelections');
				if(lineData.length==0){
					alert("请选中一条数据取消投保!");
					return;
				}
				if(lineData.length>1){
					alert("只能选择一条数据取消投保!");
					return;
				}
				$.ajax({
					url  : path + "/newContApply/cancelInsure.do",
					type : "POST",
					data : {"proposalcontno":lineData[0].proposalcontno},
					dataType : "json",
					success : function(data) {
						if(data.success==true){
							alert(data.msg);
							window.location.href="newPolicyQuery.jsp";
						}
					},
					error : function() {
						alert("取消投保单失败!");
					}
				});
				
				
				
			});
			
			
			
			
			

			$("#copyCont").click(function(){
				var lineData = tab_d.bootstrapTable('getSelections');
				if(lineData.length==0){
					alert("请选中一条数据!");
					return;
				}
				if(lineData.length>1){
					alert("只能选择一条数据进行复制!");
					return;
				}
				
				console.log(lineData[0].proposalcontno);
				$.ajax({
					url  : path + "/newContApply/copyCont.do",
					type : "POST",
					data : {"proposalcontno":lineData[0].proposalcontno,"transno":lineData[0].transno},
					dataType : "json",
					success : function(data) {
						var transno = data.msg;
						console.log(transno);
						window.location.href = "partNewContEnter.jsp?flag=2&transno="+transno
					},
					error : function() {
						alert("复制投保单失败!");
					}
				});
				
				
			});
			
			$("#cancelcontNo").click(function(){
				var lineData = tab_d.bootstrapTable('getSelections');
				if(lineData.length==0){
					alert("请选中一条数据进行撤单!");
					return;
				}
				if(lineData.length>1){
					alert("只能选择一条数据进行撤单!");
					return;
				}
				var transno = lineData[0].transno;
				$.ajax({
					url  : path + "/cancelcontroller/delectorder.do",
					type : "POST",
					data : {"transno":transno},
					dataType : "json",
					success : function(data) {
						alert(data.success);
					},
					error : function() {
						
					}
				});
				
				
			});
			
			$("#print").click(function(){
				var lineData = tab_d.bootstrapTable('getSelections');
				if(lineData.length==0){
					alert("请选中一条数据打印!");
					return;
				}
				if(lineData.length>1){
					alert("只能选择一条数据进行打印!");
					return;
				}
				
//				console.log(lineData);
				
				if(confirm("您确定要打印投保单号："+lineData[0].proposalcontno+"?")){ 
					var url = "../../contprint/jsp/printPL.jsp?contNo="+
						lineData[0].proposalcontno+"&AgentCom="+lineData[0].insurancecom+"&TransNo="+
						lineData[0].transno;
					window.location.href = url;
//					window.open("../../contprint/jsp/printPL.jsp?contNo="+
//						lineData[0].proposalcontno+"&AgentCom="+lineData[0].insurancecom+"&TransNo="+
//						lineData[0].transno);
				}
			
				
//				$.ajax({
//					url  : path + "/contprint/print.do",
//					type : "POST",
//					data : {"proposalcontno":lineData[0].proposalcontno},
//					dataType : "json",
//					success : function(data) {
//						alert(data.success);
//					},
//					error : function() {
//						alert("复制投保单失败!");
//					}
//				});
				
				
				
			});

	

});

/**
 * 设置表格查询参数
 * 
 * @param params
 */
function queryParams(params) {
	// 设置查询参数
	var param = {
		limit : params.limit,
		offset : params.offset,
//		transactionNo : $("#transactionNo").val().trim(),
		grpcontNo : $("#grpcontNo").val().trim(),
		contNo : $("#contNo").val().trim(),
		tBRBirth : $("#tBRBirth").val()
	};
	return param;
}

/**
 * 翻页带查询参数及列排序
 */
function tableInit3(url, obj, col, uniqueId,queryParams) {
	obj.bootstrapTable({
		url : path + url, // 请求后台的URL（*）
		dataType : "json",
		method : 'post', // 请求方式（*）
		contentType : "application/x-www-form-urlencoded",
		toolbar : '#toolbar',
		columns : col,
		striped : true, // 是否显示行间隔色
		cache : false, // 是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
		pagination : true, // 是否显示分页（*）
		queryParamsType : "limit",// undefined/limit
		queryParams : queryParams,// 传递参数（*）
		sidePagination : "server", //
		pageList : [ 10, 25, 50, 100 ], // 可供选择的每页的行数（*）
		search : false, // 是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
		strictSearch : true,// 设置为 true启用 全匹配搜索，否则为模糊搜索
		showColumns : true, // 是否显示所有的列
		showRefresh : true, // 是否显示刷新按钮
		minimumCountColumns : 2, // 最少允许的列数
		clickToSelect : true, // 是否启用点击选中行
		// height: 500, //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
		// uniqueId: "ID", // 每一行的唯一标识，一般为主键列
		uniqueId : uniqueId, // 每一行的唯一标识，一般为主键列
		showToggle : true, // 是否显示详细视图和列表视图的切换按钮
		cardView : false, // 是否显示详细视图
		detailView : false
	});
};

//$(function() {
//	$("#add").click(
//			function() {
//
//				var bankName = $("#bankName").val();
//				var salesChl = $("#salesChl").val();
//				var tContNo = $("#contNo").val();
//				var riskCode = $("#riskCode").val();
//
//				// alert(bankName+"="+salesChl+"="+tContNo+"="+riskCode);
//
//				var url = "partNewContEnter.jsp?bankName=" + bankName
//						+ "&salesChl=" + salesChl + "&tContNo=" + tContNo
//						+ "&riskCode=" + riskCode;
//				toadd(url);
//			});
//});
