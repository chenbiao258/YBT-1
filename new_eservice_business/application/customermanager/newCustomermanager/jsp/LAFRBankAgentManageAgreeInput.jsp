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
	<link href="https://cdn.bootcss.com/x-editable/1.5.1/bootstrap-editable/css/bootstrap-editable.css"  rel="stylesheet">
	<link href="<%=request.getContextPath() %>/include/css/bootstrap.min.css"  rel="stylesheet">
	<link href="<%=request.getContextPath() %>/include/css/bootstrap-table.min.css"  rel="stylesheet">
	<title>RM资质审批</title>
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
							<form action="" method="" role="form" class="form-horizontal">
								<div class="form-group">
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3">Staffid</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="staffid" id="staffid" data-validate="required" placeholder="">
										</div>
									</div>
									
										
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="field-3"><span class="red">*</span>CheckFlag</label>
											<div class="col-sm-6">
												<select id="checkflag" name="checkflag" style="width:80%" onchange="changes()">
												<option></option>
												<option value="N">N</option>
												<option value="W">W</option>
												</select>
											</div>
										</div>
									
									
								</div>
								<div class="form-group-separator"></div>
								<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15" >
										<label class="col-sm-5 control-label" for="field-3"></label>
										<div class="col-sm-2">
											<button type="button" class="btn btn-primary" id="search">查询</button>
										</div>
										<div class="col-sm-2">
											<button type="button" class="btn btn-primary check" id="check">审核通过</button>
										</div>
										<div class="col-sm-2">
											<button type="button" class="btn btn-primary nocheck" id="nocheck">审核不通过</button>
										</div>
										
									</div>
								
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
	<%@ include file="../../../main/jsp/bottom.jsp" %>
	<!-- Imported scripts on this page -->
	<script src="<%=request.getContextPath() %>/include/js/jquery-validate/jquery.validate.min.js"></script>
	<script src="<%=request.getContextPath() %>/include/js/inputmask/jquery.inputmask.bundle.js"></script>
	<script src="<%=request.getContextPath() %>/include/js/formwizard/jquery.bootstrap.wizard.min.js"></script>
	<script src="<%=request.getContextPath() %>/include/js/datepicker/bootstrap-datepicker.js"></script>
	<script src="<%=request.getContextPath() %>/include/js/multiselect/js/jquery.multi-select.js"></script>
	<script src="<%=request.getContextPath() %>/include/js/jquery-ui/jquery-ui.min.js"></script>
	<script src="<%=request.getContextPath() %>/include/js/bootstrap-select.js"></script>
	<script src="<%=request.getContextPath() %>/include/js/bootstrap-table.min.js"></script>
	<script src="<%=request.getContextPath() %>/include/js/bootstrap-table-editable.js"></script>
	<script src="<%=request.getContextPath() %>/include/js/bootstrap-table-zh-CN.min.js"></script>
	<script src="<%=request.getContextPath() %>/include/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath() %>/include/js/bootstrap-editable.js"></script>

	<script src="<%=request.getContextPath() %>/include/js/selectboxit/jquery.selectBoxIt.min.js"></script>
	<script src="<%=request.getContextPath() %>/include/json/area.js" type="text/javascript" charset="utf-8"></script>
    <script src="<%=request.getContextPath() %>/include/json/newarea.js" type="text/javascript" charset="utf-8"></script> 
	<script src="<%=request.getContextPath() %>/include/json/newlocation.js" type="text/javascript" charset="utf-8"></script>
	<script src="<%=request.getContextPath() %>/application/customermanager/newCustomermanager/res/js/LAFRBankAgentManageAgreeInput.js" type="text/javascript" charset="utf-8"></script>
	
</body>
</html>