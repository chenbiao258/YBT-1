<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="description" content="Xenon Boostrap Admin Panel" />
	<meta name="author" content="" />

		<title>修改菜单</title>
		<%@ include file="../../../main/jsp/top.jsp" %>
		
		
		<link rel="stylesheet" href="<%=request.getContextPath() %>/include/css/xenon-core.css">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/include/css/xenon-forms.css">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/include/css/common.css">

	</head>

	<body class="page-body">

		<div class="page-container">
			


			<div class="main-content">

				<%@ include file="../../../main/jsp/nav.jsp"  %>
				<%
					String menuname=new  String( request.getParameter("menuname").getBytes("ISO-8859-1"),"utf-8");
					//String menudesc=new  String(request.getParameter("menudesc").getBytes("ISO-8859-1"),"utf-8");
					//String menulink=new  String(request.getParameter("menulink").getBytes("ISO-8859-1"),"utf-8");
				 //String menuname=request.getParameter("menuname");
				 String menulink=request.getParameter("menulink");
				 %>
				 
				<div class="row">
					<div class="col-sm-12">
						<div class="panel panel-default">
							<div class="panel-body">
								<form action="<%=request.getContextPath() %>/menuController/updateAddBean.do" method="post" role="form" class="form-horizontal" id="frm">
									<input type="hidden"  name="id" value=<%=request.getParameter("id") %>>
									<input type="hidden"  name="submenu" value=<%=request.getParameter("submenu")%>>
									<div class="form-group">
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="field-3">菜单名称</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="menuName" value=<%=menuname%> id="field-3" data-validate="required" placeholder="">
											</div>
										</div>
										<%-- <div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="field-3">菜单描述</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="menudesc" value=<%=menudesc%> id="field-3" data-validate="required" placeholder="">
											</div>
										</div> --%>
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="field-3">菜单链接</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="menuLink" value=<%=menulink%> id="field-3" data-validate="required" placeholder="">
											</div>
										</div>
										<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="field-3">创建日期</label>
											<div class="col-sm-6">
												<div class="input-group">
													<input type="date" name="date" id="date" value=<%=request.getParameter("crtTime") %> class="form-control datepicker" data-format="dd-MM-yyyy">
													<div class="input-group-addon">
														<a href="#"><i class="linecons-calendar"></i></a>
													</div>
												</div>
											</div>
										</div>
										<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="field-3">修改日期</label>
											<div class="col-sm-6">
												<div class="input-group">
													<input type="date" name="datea" id="datea"  value=<%=request.getParameter("updTime") %>  class="form-control datepicker" data-format="dd-MM-yyyy">
													<div class="input-group-addon">
														<a href="#"><i class="linecons-calendar"></i></a>
													</div>
												</div>
											</div>
										</div>
										<div class="col-lg-12 col-md-12 col-xs-12 marginbottom15">
											<label class="col-sm-2 control-label" for="field-3"></label>
											<div class="col-sm-1">
												<button class="btn btn-primary" id="save">保存</button>
											</div>
											<div class="col-sm-1">
												<button type="button" class="btn btn-primary back" id="">返回</button>
											</div>
										</div>
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
		<!-- Imported scripts on this page -->
		<script src="<%=request.getContextPath() %>/application/newSystemManage/menuManage/res/js/menuModify.js" type="text/javascript" charset="utf-8"></script>

	</body>

</html>