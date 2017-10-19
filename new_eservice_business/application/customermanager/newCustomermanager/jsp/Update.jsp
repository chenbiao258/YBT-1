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
	<title>明细查询</title>
	<%@ include file="../../../main/jsp/top.jsp" %>
	<script type="text/javascript">
	var staffid="<%= request.getParameter("staffid")%>"; 
	
	var qualifitype="<%= request.getParameter("qualifitype")%>"; 
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
							<form action="" method="" role="form" class="form-horizontal">
								<div class="form-group">
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3">Staffid</label>
										<div class="col-sm-7">
											 <input type="text" class="form-control" name="staffid" id="staffid" data-validate="required" placeholder="" readonly="readonly" value="<%= request.getParameter("staffid")%>">
									   </div>
									</div>
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3">qualifitype</label>
										<div class="col-sm-7">
											 <input type="text" class="form-control" name="qualifitype" id="qualifitype" data-validate="required" placeholder="" readonly="readonly" value="<%= request.getParameter("qualifitype")%>">
									   </div>
									</div>
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="issueDate">生效日期</label>
										<div class="col-sm-7">
											<input type="text" name="makedate"  id="issueDate" class="form-control datepicker" data-format="yyyy-mm-dd"  >
										</div>
									</div>
										<div class="col-lg-9 col-lg-offset-3" style="margin-top:2%">
										<div class="col-sm-1">
											<button type="button" class="btn btn-primary save" id="">保存</button>
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
	<script src="<%=request.getContextPath() %>/application/customermanager/newCustomermanager/res/js/DetailQuery.js" type="text/javascript" charset="utf-8"></script>
	
</body>
</html>