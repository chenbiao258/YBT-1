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

	<title>菜单页面查询</title>
	
	<%@ include file="../../../main/jsp/top.jsp" %>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/include/css/common.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/include/css/bootstrap-table.min.css"/>

	</head>

	<body class="page-body skin-facebook">

		<div class="page-container">
		


			<div class="main-content">

				<%@ include file="../../../main/jsp/nav.jsp" %>

				<div class="row">
					<div class="col-sm-12">
						<div class="panel panel-default">
							<div class="panel-body">
								<form action="" method="" role="form" class="form-horizontal">
									<input type="hidden"  name="id" value=<%=request.getParameter("id") %>>
									<div class="form-group">
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="field-3">三级菜单名称</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="menuName" id="menuName" data-validate="required" placeholder="">
											</div>
										</div>
										
										
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="field-3">二级菜单名称</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="submenuName" id="submenuName" data-validate="required" placeholder="">
											</div>
										</div>
										
									</div>
									
									<div class="form-group-separator"></div>
								</form>
								<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="field-3"></label>
											<div class="col-sm-2">
												<button class="btn btn-primary" id="search">查询</button>
											</div>
											<div class="col-sm-2">
												<button type="reset" class="btn btn-primary" id="reset">重置</button>
											</div>
											<!-- <div class="col-sm-2">
												<button type="reset" class="btn btn-primary" id="reset">重置</button>
												<a href=""></a>
											</div> -->
								</div>
							</div>
							<div id="toolbar" class="btn-group">
								<button type="button" class="btn btn-default" id="add" title="添加子级菜单">
							        <i class="glyphicon glyphicon-plus">添加三级菜单</i>
							    </button>
							    <button type="button" class="btn btn-default" id="add2" title="添加父级菜单">
							        <i class="glyphicon glyphicon-plus">添加二级菜单</i> 
							        	
							    </button>
							</div>
							<table class="table table-hover" id="cusTable" data-show-toggle="true">
								<!-- 获取数据库返回查询菜单list结果 -->
							</table>
						</div>
					</div>
				</div>

				<%@ include file="../../../main/jsp/footer.jsp" %>
			</div>

		</div>
		<%@ include file="../../../main/jsp/bottom.jsp" %>
		<!-- Imported scripts on this page -->
		<script src="<%=request.getContextPath() %>/include/js/bootstrap-table.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=request.getContextPath() %>/include/js/bootstrap-table-zh-CN.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=request.getContextPath() %>/application/newSystemManage/menuManage/res/js/menuManage.js" type="text/javascript" charset="utf-8"></script>

	</body>

</html>