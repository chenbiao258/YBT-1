<%@page import="com.sinosoft.eservice.api.bean.UserLoginInfoBean"%>
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

		<title>用户修改</title>
		<%@ include file="../../../main/jsp/top.jsp" %>
		<link rel="stylesheet" href="<%=request.getContextPath() %>/include/css/xenon-core.css">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/include/css/xenon-forms.css">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/include/css/common.css">

	<script type="text/javascript">
		var path = "<%=request.getContextPath() %>";
	</script>
	
	<script type="text/javascript">
	
		var userCode = "<%= request.getParameter("id")%>"; 

	var emplID = "<%= request.getParameter("emplID")%>"; 
	var status = "<%= request.getParameter("status")%>"; 
	var checkFlag = "<%= request.getParameter("checkFlag")%>"; 

	</script>
	<script type="text/javascript">

	</script>

	</head>

	<body class="page-body  skin-facebook">

		<div class="page-container">
			
			

			<div class="main-content">

				<%@ include file="../../../main/jsp/nav.jsp" %>
				
				<div class="row">
					<div class="col-sm-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">用户修改</h3>
							</div>
							<div class="panel-body" validate>
								<form id="form-plus" action="" method="" role="form" class="form-horizontal">
									
									<div class="form-group">
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="emplID"><span class="red">*</span>用户编码</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="emplID" id="emplID" data-validate="required" placeholder="" readonly="readonly">
											</div>
										</div>
										
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="name"><span class="red">*</span>用户姓名</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="name" id="name" data-validate="required" placeholder="">
											</div>
										</div>
										
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="companyName"><span class="red">*</span>Company Name</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="companyName" id="companyName" data-validate="required" placeholder="" >
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="companyCode"><span class="red">*</span>机构代码</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="companyCode" id="companyCode" data-validate="required" placeholder="" >
											</div>
										</div>
										
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="department"><span class="red">*</span>Department</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="department" id="department" data-validate="required" placeholder="" >
											</div>
										</div>
										
										
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="status"><span class="red">*</span>状态</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="status" id="status">
											</div>
										</div>
										
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="jobCode"><span class="red">*</span>Job Code</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="jobCode" id="jobCode" data-validate="required" placeholder="" >
										    </div>
										</div>
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="location"><span class="red">*</span>Location</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="location" id="location" data-validate="required" placeholder="">
										    </div>
										</div>
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="hireDate"><span class="red">*</span>HireDate</label>
											<div class="col-sm-6">
												<input type="text" name="hireDate"  id="hireDate" class="form-control datepicker" data-format="yyyy-mm-dd"  >
										    </div>
										</div>
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="rehireDate"><span class="red">*</span>RehireDate</label>
											<div class="col-sm-6">
												<input type="text" name="rehireDate"  id="rehireDate" class="form-control datepicker" data-format="yyyy-mm-dd"  >
										    </div>
										</div>
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="makeDate"><span class="red">*</span>MakeDate</label>
											<div class="col-sm-6">
												<input type="text" name="makeDate"  id="makeDate" class="form-control datepicker" data-format="yyyy-mm-dd"  >
										  
										    </div>
										</div>
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="makeTime"><span class="red">*</span>MakeTime</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="makeTime" id="makeTime" data-validate="required" placeholder="" >
										    </div>
										</div>
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="checkFlag"><span class="red">*</span>审核状态</label>
											<div class="col-sm-6">
									
											    <input type="text" class="form-control" name="checkFlag" id="checkFlag" data-validate="required" placeholder="" readonly="readonly">
											</div>
										</div>
										
									    <div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="operator"><span class="red">*</span>操作员</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="operator" id="operator" value="${userLoginInfo.emplID}" readonly="readonly">
											</div>
										</div>
										
										<div class="col-lg-12 col-md-12 col-xs-12 marginbottom15">
											<label class="col-sm-2 control-label" for="field-3"></label>
											<div class="col-sm-1">
												<button type="button" class="btn btn-primary" id="save">保存</button>
											</div>
											<!-- <div class="col-sm-1">
												<button type="reset" class="btn btn-primary" id="reset">重置</button>
											</div> -->
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
	<script src="<%=request.getContextPath() %>/include/js/selectboxit/jquery.selectBoxIt.min.js"></script>
	
	<script src="<%=request.getContextPath() %>/include/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath() %>/include/js/bootstrapValidator.js"></script>
	<script src="<%=request.getContextPath() %>/include/js/bootstrapValidator.min.js"></script>
	
		<script src="<%=request.getContextPath() %>/application/newSystemManage/userManage/res/js/userModify.js" type="text/javascript" charset="utf-8"></script>
	</body>

</html>