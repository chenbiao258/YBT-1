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

	<title>当日测单</title>
	
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
												<input type="text" class="form-control" name="bankName" id="bankName" data-validate="required" placeholder="">
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="field-3">保险公司</label>
											<div class="col-sm-6">
												<select class="form-control" id="insuredCompany" name="insuredCompany">
													<option></option>
													<option>新华保险</option>
													<option>人寿保险</option>
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
								
								</form>
							</div>
							<div class="panel-body panel-border">
								<table class="table table-hover" id="cusTable">
									
								</table>
							</div>
							<div class="panel-body panel-border">
								<table class="table table-hover" id="cusTable1">
									
								</table>
							</div>
						</div>
					</div>
				</div>

				<%@ include file="../../../main/jsp/footer.jsp" %>
			</div>

		</div>
		<%@ include file="../../../main/jsp/bottom.jsp" %>
		<!-- Imported scripts on this page -->
		<script src="<%=request.getContextPath() %>/application/newTestingCenter/cancelCont/res/js/cancelCont.js" type="text/javascript" charset="utf-8"></script>

	</body>

</html>