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

	<title>保单重打</title>
	
	<%@ include file="../../../main/jsp/top.jsp" %>

	</head>

	<body class="page-body skin-facebook">

		<div class="page-container">
		
			

			<div class="main-content">

				<%@ include file="../../../main/jsp/nav.jsp" %>

				<div class="row">
					<div class="col-sm-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">查询条件</h3>
							</div>
							<div class="panel-body">
								<form action="" method="" role="form" class="form-horizontal">
									
									<div class="form-group">
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="field-3">银行</label>
											<div class="col-sm-6">
												<select class="form-control" id="bankCode">
													<option></option>
													<option>农业银行</option>
													<option>中国银行</option>
												  	<option>招商银行</option>
												  	<option>光大银行</option>
													<option>中信银行</option>
												  	<option>建设银行</option>
												</select>
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="field-3">保险公司</label>
											<div class="col-sm-6">
												<select class="form-control" id="insuredCompany">
													<option></option>
													<option>安康保险</option>
												  	<option>人寿保险</option>
												  	<option>平安保险</option>
												  	<option>新华保险</option>
												</select>
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="field-3"><span class="blue">*</span>投保单号</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="tContNo" id="tContNo" data-validate="required" placeholder="">
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="field-3"><span class="blue">*</span>保单号</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="contNo" id="contNo" data-validate="required" placeholder="">
											</div>
										</div>
										<div class="col-lg-12 col-md-12 col-xs-12 marginbottom15">
											<label class="col-sm-2 control-label" for="field-3"></label>
											<div class="col-sm-1">
												<button type="button" class="btn btn-primary" id="search">查询</button>
											</div>
											<div class="col-sm-1">
												<button type="reset" class="btn btn-primary" id="reset">重置</button>
											</div>
										</div>
									</div>
	
									<div class="form-group-separator"></div>
								
								</form>
							</div>
							<table class="table table-hover" id="cusTable">
								
							</table>
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
		<script src="<%=request.getContextPath() %>/include/js/bootstrap-table.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=request.getContextPath() %>/include/js/bootstrap-table-zh-CN.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=request.getContextPath() %>/application/newTestingCenter/rePrintCont/res/js/rePrintApply.js" type="text/javascript" charset="utf-8"></script>

	</body>

</html>