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
	<title>RM资质查询</title>
	<%@ include file="../../../main/jsp/top.jsp" %>
</head>
<body class="page-body skin-facebook">
	<div class="page-container">    
		
		<div class="main-content">
			<%@ include file="../../../main/jsp/nav.jsp" %>
			<div class="row">
				<div class="col-sm-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<form action="" method="" role="form" class="form-horizontal" id="form-plus">
								<div class="form-group">
									
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3">Region</label>
										<div class="col-sm-7">
											<select class="form-control" id="RegionId" name="RegionId">
												<option></option>
											</select>
										</div>
										
									</div>
									
									
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3">Location Code</label>
										<div class="col-sm-7">
											<select class="form-control" id="LocationId" name="LocationId" >
												<option></option>
											</select>
										</div>
										
										
									</div>
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3">City</label>
										<div class="col-sm-7">
											<select class="form-control" id="CityId" name="CityId" onchange="showCompanyName()">
												<option></option>
											</select>
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3">Subbranch</label>
										<div class="col-sm-7">
											<select class="form-control" id="SubbranchId" name="SubbranchId" >
												<option></option>
											</select>
										</div>
										
										
									</div>
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3">Company Name</label>
										<div class="col-sm-7">
											<select class="form-control" id="CompanyNameId" name="CompanyNameId" onchange="showDepartment()">
												<option></option>
											</select>
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3">Department</label>
										<div class="col-sm-7"  >
											 	<select class="form-control" id="DepartmentId" name="DepartmentId">
												<option></option>
											</select>
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3">Staff Id</label>
										<div class="col-sm-7">
										
											<input type="text" class="form-control" name="staffid" id="staffid" data-validate="required" placeholder="">
										</div>
									
										
										<!-- <div class="col-sm-2">
											<button type="button" class="btn btn-primary" id="detail">明细查询</button>
										</div> -->
										
									</div>
								</div>
								<div class="form-group-separator"></div>
							</form>
						</div>
						<div align="center">
											<button type="button" class="btn btn-primary" id="search">查询</button>
						</div>
						<table class="table table-hover" id="cusTable">
						</table>
					</div>
				</div>
			</div>
			<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3"></label>
										<%-- <div class="col-sm-2">
											<button type="button" class="btn btn-primary" id="search">险种录入</button>
										</div>--%>
									
										
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
    <script src="<%=request.getContextPath() %>/application/customermanager/newCustomermanager/res/js/select.js" type="text/javascript" charset="utf-8"></script>
	
</body>
</html>