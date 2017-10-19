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

	<title>用户审核</title>
	
	<%@ include file="../../../main/jsp/top.jsp" %>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/include/css/common.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/include/css/bootstrap-table.min.css"/>
	
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
							<div class="panel-heading">
								<h3 class="panel-title">用户审核</h3>
							</div>
							<div class="panel-body">
								<form action="" method="" role="form" class="form-horizontal">
									
									<div class="form-group">
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="field-3">用户代码</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="userCode" id="userCode" data-validate="required" placeholder="">
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="field-3">用户姓名</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="userName" id="userName" data-validate="required" placeholder="">
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="field-3"></label>
											<div class="col-sm-2">
												<button type="button" class="btn btn-primary" id="search">查询</button>
											</div>
											<div class="col-sm-2">
												<button type="reset" class="btn btn-primary" id="reset">重置</button>
											</div>
										</div>
									</div>
	
									<div class="form-group-separator"></div>
								
								</form>
							</div>
							
							<table class="table table-hover" id="cusTable" data-show-toggle="true">
								
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
		<script src="<%=request.getContextPath() %>/application/newSystemManage/userManage/res/js/UserAddInputCheck.js" type="text/javascript" charset="utf-8"></script>

	</body>

</html>