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
	
	<title>投保单录入</title>
	<%@ include file="../../../main/jsp/top.jsp" %>
	<script type="text/javascript">

		var grpcontno = "<%= request.getParameter("grpcontno")%>";  
		var tContNo = "<%= request.getParameter("tContNo")%>"; 
		var riskcode = "<%= request.getParameter("riskCode")%>"; 
		var flag = "<%= request.getParameter("flag")%>"; 
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
										<label class="col-sm-5 control-label" for="field-3">投保人客户号</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="grpcontno" id="grpcontno" data-validate="required" placeholder="">
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3">银行机构</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="YH" id="YH" data-validate="required" placeholder="">
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3">保险公司</label>
										<div class="col-sm-7">
										<select class="form-control" name="BX" id="BX" onchange="selectRisk()">
											<option></option>
										</select>
										</div>
									</div>
									
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3">保险产品</label>
										<div class="col-sm-7">
										<select class="form-control" name="riskcode" id="riskcode" >
											<option></option>
										</select>
										</div>
									</div>
									<table border="0" style="margin-top:10%;margin-left: 15%" width="80%">
									 <tr>									  
									   <td colspan="4"><button type="button" class="btn btn-primary" id="add" style="width:20%">新单录入</button>
									 </tr>
 									 <tr>									  
									   <td colspan="4"><button type="button" class="btn btn-primary" id="add1" style="width:20%">新单录入1</button>
									 </tr>
									  <tr>									  
									   <td colspan="4"><button type="button" class="btn btn-primary" id="add2" style="width:20%">新单录入2</button>
									 </tr>
									  <tr>									  
									   <td colspan="4"><button type="button" class="btn btn-primary" id="add3" style="width:20%">新单录入3</button>
									 </tr>
									</table>
									
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
	
	
	<%@ include file="../../../main/jsp/bottom.jsp" %>
	
	<!-- Imported scripts on this page -->
	<script src="<%=request.getContextPath() %>/application/newTestingCenter/newCont/res/js/newContApply.js" type="text/javascript" charset="utf-8"></script>

	
</body>
</html>