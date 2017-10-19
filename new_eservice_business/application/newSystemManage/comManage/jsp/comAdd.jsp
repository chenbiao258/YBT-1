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

		<title>新增保险公司</title>
		<%@ include file="../../../main/jsp/top.jsp" %>
		<link rel="stylesheet" href="<%=request.getContextPath() %>/include/css/xenon-core.css">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/include/css/xenon-forms.css">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/include/css/common.css">
 
  <script type="text/javascript">
		var path = "<%=request.getContextPath() %>";
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
								<form id="form-plus" action="" method="" role="form" class="form-horizontal">
									
									<div class="form-group">
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="field-3">保险公司名称</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="field-3" id="field-3" data-validate="required" placeholder="">
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="field-3">保险公司简称</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="field-3" id="field-3" data-validate="required" placeholder="">
											</div>
										</div>
										
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="field-3">机构代码</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="field-3" id="field-3" data-validate="required" placeholder="">
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="field-3">上级机构</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="field-3" id="field-3" data-validate="required" placeholder="">
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="field-3">机构级别</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="field-3" id="field-3" data-validate="required" placeholder="">
											</div>
										</div>
										
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="field-3">电话</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="field-3" id="field-3" data-validate="required" placeholder="">
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="field-3">电子邮箱</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="field-3" id="field-3" data-validate="required" placeholder="">
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="field-3">地址</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="field-3" id="field-3" data-validate="required" placeholder="">
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="field-3">数据版本</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="field-3" id="field-3" data-validate="required" placeholder="">
											</div>
										</div>
										<div class="col-lg-12 col-md-12 col-xs-12 marginbottom15">
											<label class="col-sm-2 control-label" for="field-3"></label>
											<div class="col-sm-1">
												<button type="button" class="btn btn-primary" id="save">添加</button>
											</div>
											<div class="col-sm-1">
												<button type="reset" class="btn btn-primary" id="reset">重置</button>
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
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/include/js/select2/select2.css" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/include/js/select2/select2-bootstrap.css" />
		<%@ include file="../../../main/jsp/bottom.jsp" %>
		<!-- Imported scripts on this page -->
		<script src="<%=request.getContextPath() %>/include/js/select2/select2.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=request.getContextPath() %>/include/js/datepicker/bootstrap-datepicker.js"></script>
		<script src="<%=request.getContextPath() %>/application/newSystemManage/comManage/res/js/comAdd.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=request.getContextPath() %>/include/json/area.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=request.getContextPath() %>/include/json/newlocation.js" type="text/javascript" charset="utf-8"></script>
	</body>
</html>