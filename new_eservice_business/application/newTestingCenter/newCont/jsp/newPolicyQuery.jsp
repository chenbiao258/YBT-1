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
	
	<title>投保单查询</title>
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
										<label class="col-sm-5 control-label" for="field-3">投保单号</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="contNo" id="contNo" data-validate="required" placeholder="">
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3">投保人CIF：</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="grpcontNo" id="grpcontNo" data-validate="required" placeholder="">
										</div>
									</div>
									<!--  
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3">交易流水号</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="transactionNo" id="transactionNo" data-validate="required" placeholder="">
										</div>
									</div>
									-->
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3">投保日期</label>
										<div class="col-sm-7">
											<div class="input-group">
											<input type="text" name="tBRBirth"  id="tBRBirth" class="form-control datepicker" data-format="yyyy-mm-dd">
											<div class="input-group-addon">
												<a href="#"><i class="linecons-calendar"></i></a>
											</div>
										</div>
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3"></label>
										<div class="col-sm-2">
											<button type="button" class="btn btn-primary" id="search" style="margin-top:20%;">投保单查询</button>
										</div>
										
									</div>
								</div>

								<div class="form-group-separator"></div>
							
							</form>
						</div>
						
						
						<table class="table table-hover" id="cusTable">
							<div class="col-sm-2" style="padding-top: 2%">
								<!-- <button type="button" class="btn btn-primary" id="search" style="width:70%">投保单查看</button> -->
								<button type="button" class="btn btn-primary" id="selectCont" style="width:70%">投保单查看</button>
							</div>
							<div class="col-sm-2" style="padding-top: 2%;margin-left:-5%">
								<button type="reset" class="btn btn-primary" id="reset" style="width:70%">继续录入</button>
							</div>
							<div class="col-sm-2" style="padding-top: 2%;margin-left:-5%">
								<button type="button" class="btn btn-primary" id="copyCont" disabled="true" style="width:70%">投保单复制</button>
							</div>
							<div class="col-sm-2" style="padding-top: 2%;margin-left:-5%">
								<button type="copyCont" class="btn btn-primary" id="print"  style="width:70%">投保单打印Test</button>
							</div>
							<div class="col-sm-2" style="padding-top: 2%;margin-left:-5%">
								<button type="button" class="btn btn-primary" id="applyOutcontNo"  style="width:75%">申请犹豫期退保</button>
							</div>
							<div class="col-sm-2" style="padding-top: 2%;margin-left:-5%">
								<button type="button" class="btn btn-primary" id="cancelcontNo" disabled="true"  style="width:75%">当日撤单</button>
							</div>
							<div class="col-sm-2" style="padding-top: 2%;margin-left:-5%">
								<button type="button" class="btn btn-primary" id="cancelInsure" disabled="true"  style="width:75%">取消投保</button>
							</div>
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
	<script src="<%=request.getContextPath() %>/include/js/selectboxit/jquery.selectBoxIt.min.js"></script>
	<script src="<%=request.getContextPath() %>/include/json/area.js" type="text/javascript" charset="utf-8"></script>
    <script src="<%=request.getContextPath() %>/include/json/newarea.js" type="text/javascript" charset="utf-8"></script> 
	<script src="<%=request.getContextPath() %>/include/json/newlocation.js" type="text/javascript" charset="utf-8"></script>
	<script src="<%=request.getContextPath() %>/application/newTestingCenter/newCont/res/js/newPolicyQuery.js" type="text/javascript" charset="utf-8"></script>

	
</body>
</html>