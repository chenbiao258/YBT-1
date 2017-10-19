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
	
	<title>RM资质上传</title>
	<%@ include file="../../../main/jsp/top.jsp" %>

		<script type="text/javascript">
	var suc="<%= request.getAttribute("suc")%>"; 
	if(suc=="上传成功"||suc=="上传失败"){
	alert(suc);
	}
	
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
						

<form action="${pageContext.request.contextPath}/laqualidetailsController/uploadRM.do" method="post" role="form" class="form-horizontal" enctype="multipart/form-data">
		<table style="margin:5px;height:20px;" border=0>
           <tr style="height:20px">
                <td colspan="4" align="left"><font style="font-family:黑体;font-size:30px;color: red">RM内部资质上传：</font></td>
         </tr>

            <tr>
            <tr style="height:20px">
                <td>RM内部资质文档：</td>
                <td width="5px;"></td>
                <td><input type="file" class="easyui-filebox" id="file" name="file" style="width:260px;">
                </td>
                <td style="padding-top: 10px;width: 65px" align="right"><button type="submit" class="btn btn-primary" id="search" style="height:3%">上传</button></td></tr>    
               
        </table>
       
</form>
						


		</div>			
					</div>
				</div>
			</div>
		
			<%@ include file="../../../main/jsp/footer.jsp" %>
		</div>
		
	</div>
	
	
	<%@ include file="../../../main/jsp/bottom.jsp" %>

	
</body>
</html>