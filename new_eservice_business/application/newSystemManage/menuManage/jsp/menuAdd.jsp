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

		<title>添加菜单</title>
		<%@ include file="../../../main/jsp/top.jsp" %>
		<link rel="stylesheet" href="<%=request.getContextPath() %>/include/css/xenon-core.css">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/include/css/xenon-forms.css">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/include/css/common.css">
 
  <script type="text/javascript">
		var path = "<%=request.getContextPath() %>";
  </script>
	</head>

<body class="page-body">

		<div class="page-container">

			

			<div class="main-content">

			<%@ include file="../../../main/jsp/nav.jsp" %>

				<div class="row">
					<div class="col-sm-12">
						<div class="panel panel-default">
							<div class="panel-body">
								<form id="form-plus" action="" method="" role="form" class="form-horizontal">
									
									<div class="form-group">
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="field-3">三级菜单名称</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="menuName" id="menuName" data-validate="required" placeholder="">
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="field-3">一级菜单名称</label>
											<div class="col-sm-6">
												<!-- <input type="text" class="form-control" name="submenuname" id="submenuname" data-validate="required" placeholder=""> -->
												<select id="selectx"  name="submenu">
												<option></option>
												</select>
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="field-3">二级菜单名称</label>
											<div class="col-sm-6">
												<select id="selecty"  name="meddlemenu">
												
												</select>
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="field-3">三级菜单链接</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="menuLink" id="menuLink" data-validate="required" placeholder="">
											</div>
										</div>
										
										<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="field-3">创建日期</label>
											<div class="col-sm-6">
												<div class="input-group">
													<input type="text" name="crtTime" id="crtTime" class="form-control datepicker" data-format="yyyy-mm-dd">
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
													<input type="text" name="updTime" id="updTime" class="form-control datepicker" data-format="yyyy-mm-dd">
													<div class="input-group-addon">
														<a href="#"><i class="linecons-calendar"></i></a>
													</div>
												</div>
											</div>
										</div> 
										<div class="col-lg-12 col-md-12 col-xs-12 marginbottom15">
											<label class="col-sm-2 control-label" for="field-3"></label>
											<div class="col-sm-1">
												<button type="button" class="btn btn-primary" id="save">保存</button>
											</div>
											<div class="col-sm-1">
												<button type="reset" class="btn btn-primary" id="reset">重置</button>
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
		<!-- Imported styles on this page -->
		<script src="<%=request.getContextPath() %>/include/js/datepicker/bootstrap-datepicker.js"></script>
		
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/include/js/select2/select2.css" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/include/js/select2/select2-bootstrap.css" />
		<%@ include file="../../../main/jsp/bottom.jsp" %>
		<!-- Imported scripts on this page -->
		<script src="<%=request.getContextPath() %>/application/newSystemManage/menuManage/res/js/menuAdd.js" type="text/javascript" charset="utf-8"></script>
	</body>
</html>