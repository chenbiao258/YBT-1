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
	<title>资质类型维护</title>
	<%@ include file="../../../main/jsp/top.jsp" %>
	
	<script type="text/javascript">
	
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
							<form id="form-plus">
								
									<div class="form-group">
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3">用户编码</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="usercode" id="usercode" data-validate="required" placeholder="">
										</div>
								   </div>
								  
									 </div>
									 
									 <div class="form-group">
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3">菜单组编码</label>
										<div class="col-sm-7">
										<select id="menugrpcode"  name="menugrpcode">
											<option></option>
											</select>
										</div>
								   </div>
								  
									 </div>
							 
								 <div  class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
								<button type="submit" class="btn btn-primary" >提交</button>
								<button type="button" class="btn btn-primary back" id="">返回</button>
								</div>
							</form>
						</div>
						
						
					</div>
					
				</div>
			</div>
			<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3"></label>
									
										
										
									
			</div>
			<%@ include file="../../../main/jsp/footer.jsp" %>
		</div>
	</div>
	<%@ include file="../../../main/jsp/bottom.jsp" %>
	<script src="<%=request.getContextPath() %>/include/js/datepicker/bootstrap-datepicker.js"></script>
	
	
	
	<script src="<%=request.getContextPath() %>/include/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath() %>/include/js/bootstrapValidator.js"></script>
	<script src="<%=request.getContextPath() %>/include/js/bootstrapValidator.min.js"></script>
		<script src="<%=request.getContextPath() %>/application/menumang/newMenuMang/res/js/usermenuAdd.js" type="text/javascript" charset="utf-8"></script>

</body>
</html>