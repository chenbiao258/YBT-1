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
	
	<title>RM内部资质新增</title>
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
						
								<form >
								<div class="form-group">
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="emplID">Empl ID</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="emplID" id="emplID">
                                  		</div>
									</div>
								</div>
									<div class="form-group">
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="department">Department</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="department" id="department" >
										</div>
									</div>
									</div>
								<div class="form-group">
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="name">Name</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="name" id="name">
                                  		</div>
									</div>
								</div>
									<div class="form-group">
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="jobCode">Job Code</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="jobCode" id="jobCode">
                                  		</div>
									</div>
								</div>
									<div class="form-group">
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="companyCode">Company Code</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="companyCode" id="companyCode">
                                  		</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="companyName">Company Name</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="companyName" id="companyName">
                                  		</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="location">Location</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="location" id="location">
                                  		</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="status">Status</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="status" id="status">
                                  		</div>
									</div>
								</div>
								
								
									<div class="form-group">
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="hireDate">HireDate</label>
										<div class="col-sm-7">
											<input type="text" name="hireDate"  id="hireDate" class="form-control datepicker" data-format="yyyy-mm-dd"  >
										</div>
									</div>
									
									</div>
									
									<div class="form-group">
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="rehireDate">RehireDate</label>
										<div class="col-sm-7">
											<input type="text" name="rehireDate"  id="rehireDate" class="form-control datepicker" data-format="yyyy-mm-dd"  >
										</div>
									</div>
									
									</div>
								
									
									<div class="form-group">
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="operator">操作员</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="operator" id="operator" value="${userLoginInfo.emplID}" readonly="readonly">
										</div>
										</div>
										
									</div>
									
								  
           			    <div class="col-lg-6 col-md-6 col-xs-6 marginbottom15" style="margin-top: 5%;margin-left: 45%">
                            <button type="submit" class="btn btn-primary" >提交</button>
                            <button type="reset" class="btn btn-primary" id="reset">清空</button>
                        </div>
                        
        </form>
					</div>	
						
					</div>
				</div>
			</div>
			<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3"></label>
										<!-- <div class="col-sm-2">
											<button type="submit" class="btn btn-primary" id="add">提交</button>
										</div>
										<div class="col-sm-2">
											<button type="reset" class="btn btn-primary" id="reset">清空</button>
										</div> -->
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
	
		
	<script src="<%=request.getContextPath() %>/include/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath() %>/include/js/bootstrapValidator.js"></script>
	<script src="<%=request.getContextPath() %>/include/js/bootstrapValidator.min.js"></script>
	
   <script src="<%=request.getContextPath() %>/application/newSystemManage/userManage/res/js/userAdd.js" type="text/javascript" charset="utf-8"></script>
	
</body>
</html>