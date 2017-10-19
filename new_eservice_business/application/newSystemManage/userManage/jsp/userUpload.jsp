<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="description" content="Xenon Boostrap Admin Panel" />
	<meta name="author" content="" />
	
	<title>用户新增</title>
	<%@ include file="../../../main/jsp/top.jsp" %>

<script type="text/javascript">
	var sua="<%= request.getAttribute("sua")%>"; 
		if(sua=="上传成功"||sua=="上传失败"){
			  	alert(sua);
				}
</script>

<script language="javascript" type="text/javascript">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

</script>
	<script type="text/javascript">

	
	
		var over = false;
		var inter;
		var c=0;
		var t;
		function counttime(){
		document.getElementById("time").value=c;
		c=c+1;
		t=setTimeout("counttime()",1000);
		}
		function upload(){
		
		
		//showdiv();
		     counttime();
			over = false;
			$("#state").html("");
			$("#progress").css("width","0");
			$("input[type=submit]").attr("disabled",true);
			$("#progress").css("width","0%");
			$("#state").html("正在上传... 总大小：0条，已上传：0条，0%，已用时：0秒");
			inter = setInterval(req,2000);
		}
		function req(){
			//如果上传已经完成
	  
	   var count=0;
	 $.ajax({
		type : "POST",
		url:path+"/UserManageController/retuenstatus.do",// 后台请求URL地址
		dataType : "json",
		success : function(data) {
			var json=eval(data);
			var mysum=json[0].sum;//6796
			var sum=mysum/2;//3398
			var size=json[0].size;//3498
			var copysize=size;//3498
			if(sum>=size){
			  size=sum-size;
			  count=size/sum*100;
			  	if(sua=="上传成功"){
			  	alert("上传成功");
					over = true;
					$("input[type=submit]").attr("disabled",false);
					$("#state").html("上传已完成，总大小："+sum+"条，已上传："+size+"条，"+count.toFixed(2)+"%，已用时："+$("#time").val()+"秒");
					document.getElementById("file").value="";
					//var url ="../../../newSystemManage/userManage/jsp/userAdd.jsp";
			       // toback(url);
			       
				}else{
				alert("正在上传... 总大小："+sum+"条，已上传："+size+"条，"+count.toFixed(2)+"%，已用时："+$("#time").val()+"秒");
				 //$("#state").html("正在上传... 总大小："+sum+"条，已上传："+size+"条，"+count.toFixed(2)+"%，已用时："+$("#time").val()+"秒");
				
		        // $("#progress").animate({width:count*0.7+"%"},500);
		        
				
				}
		
			  } else{
			  
					$("#state").html("正在审核... 总大小："+sum+"条，已用时："+$("#time").val()+"秒");
		            $("#progress").animate({width:count*0.7-30+"%"},500);
				
			  }
			if(over){
				clearInterval(inter);
				return;
			}
			
		
			
		},
		error : function() {
			alert("plus failed");
		}
	});
	
			
		}
/* 		
//新增
function add(){
	 top.jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="新增";
	 diag.URL = path+"/UserManageController/goAddU.do";
	 diag.Width = 469;
	 diag.Height = 510;
	 diag.CancelEvent = function(){ //关闭事件
		 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			 if('${page.currentPage}' == '0'){
				 top.jzts();
				 setTimeout("self.location=self.location",100);
			 }else{
				 nextPage(${page.currentPage});
			 }
		}
		diag.close();
	 };
	 diag.show();
} */
	</script>
</head>
<body class="page-body skin-facebook">
	<div class="page-container">    
		
		
		<div class="main-content">
					
			<%@ include file="../../../main/jsp/nav.jsp" %>
				
			<div class="row">
				<div class="col-sm-12">
					<div class="panel panel-default">
						<div class="panel-body">
<!--  <input id="btnshow" type="button" value="Show" onclick="showdiv();"/>
<div id="bg"></div>
 <div id="show">测试
<input id="btnclose" type="button" value="Close" onclick="hidediv();"/>
 </div> -->
						<form action="${pageContext.request.contextPath}/UserManageController/uploadRM.do" method="post" role="form" class="form-horizontal" enctype="multipart/form-data">
					<input type="hidden" id="time">		

        <table style="margin:5px;height:20px;" border=0>
           <tr style="height:20px">
                <td colspan="4" align="left"><font style="font-family:黑体;font-size:30px;color: red">用户信息上传：</font></td>
         </tr>

            <tr>
            <tr style="height:20px">
                <td>用户信息文档</td>
                <td width="5px;"></td>
                <td><input type="file" class="easyui-filebox" id="file" name="file" style="width:260px;">
                </td>
                <td style="padding-top: 10px;width: 65px" align="right"><button type="submit" class="btn btn-primary" id="search" style="height:3%" onclick="upload()">上传</button></td></tr>    
               
        </table>
 <div id="state">

 </div>
  <div id="progress" style="background: #00bb00; height: 30px; width: 0">
  	</div>
  	
								
						<div class="form-group-separator"></div>
							
							</form>
						</div>


					
					</div>
				</div>
			</div>
		
			<%@ include file="../../../main/jsp/footer.jsp" %>
		</div>
		
	</div>
	
	
	<%@ include file="../../../main/jsp/bottom.jsp" %>
			<script src="<%=request.getContextPath() %>/include/js/jquery-validate/jquery.validate.min.js"></script>
	<script src="<%=request.getContextPath() %>/include/js/inputmask/jquery.inputmask.bundle.js"></script>
	<script src="<%=request.getContextPath() %>/include/js/formwizard/jquery.bootstrap.wizard.min.js"></script>
	<script src="<%=request.getContextPath() %>/include/js/datepicker/bootstrap-datepicker.js"></script>
	<script src="<%=request.getContextPath() %>/include/js/multiselect/js/jquery.multi-select.js"></script>
	<script src="<%=request.getContextPath() %>/include/js/jquery-ui/jquery-ui.min.js"></script>
	<script src="<%=request.getContextPath() %>/include/js/selectboxit/jquery.selectBoxIt.min.js"></script>
	<script src="<%=request.getContextPath() %>/include/json/area.js" type="text/javascript" charset="utf-8"></script>
    <script src="<%=request.getContextPath() %>/include/json/newarea.js" type="text/javascript" charset="utf-8"></script> 
	<script src="<%=request.getContextPath() %>/include/json/newlocation.js" type="text/javascript" charset="utf-8"></script>
	<!-- Imported scripts on this page 
	<script src="<%=request.getContextPath() %>/application/accountManage/newAccountManage/res/js/certificateManagement.js" type="text/javascript" charset="utf-8"></script>
-->
	
</body>
</html>