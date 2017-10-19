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
										<label class="col-sm-5 control-label" for="saffid">Staff Id</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="staffid" id="staffid">
                                  		</div>
									</div>
								</div>
									<div class="form-group">
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="licensesCode">Licenses Code</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="licensesCode" id="licensesCode" >
										</div>
									</div>
									</div>
								<div class="form-group">
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="licensesCertificationsDescr">Licenses Descr</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="licensesCertificationsDescr" id="licensesCertificationsDescr">
                                  		</div>
									</div>
								</div>
									<div class="form-group">
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="licenseCertificationNo">License No</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="licenseCertificationNo" id="licenseCertificationNo">
                                  		</div>
									</div>
								</div>
									<div class="form-group">
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="issuedBy">Issued By</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="issuedBy" id="issuedBy">
                                  		</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="verified">Verified</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="verified" id="verified">
                                  		</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="renewal">Renewal</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="renewal" id="renewal">
                                  		</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="country">Country</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="country" id="country">
                                  		</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="states">States</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="states" id="states">
                                  		</div>
									</div>
								</div>
								
									<div class="form-group">
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="issueDate">Issue Date</label>
										<div class="col-sm-7">
											<input type="text" name="issueDate"  id="issueDate" class="form-control datepicker" data-format="yyyy-mm-dd"  >
										</div>
									</div>
									
									</div>
									
									<div class="form-group">
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="expirationDate">Expiration Date</label>
										<div class="col-sm-7">
											<input type="text" name="expirationDate"  id="expirationDate" class="form-control datepicker" data-format="yyyy-mm-dd"  >
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
									
								  
           			    <div  class="col-lg-6 col-md-6 col-xs-6 marginbottom15"  style="margin-top: 5%;margin-left: 45%">
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
	
   <script src="<%=request.getContextPath() %>/application/customermanager/newCustomermanager/res/js/innerAdd.js" type="text/javascript" charset="utf-8"></script>
	
</body>
</html>