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
	
	<title>资质类型</title>
	<%@ include file="../../../main/jsp/top.jsp" %>
<script type="text/javascript">

	var staffid="<%= request.getParameter("staffid")%>"; 



/* $(document).ready(function(){ 

$.ajax({
				type : "POST",
				url : path + "/LatrainingController/selectAll.do",// 后台请求URL地址
				
				success : function(data) {
				var select2=document.getElementById("cc");
					for(var i=0;i<data.length;i++){
					var select=document.getElementById("cc");
                    var option=document.createElement("option");
					option.value=data[i].staffid;
					option.innerHTML=data[i].staffid;
					select.appendChild(option);
				
					}
						
				},
				
			});

}); */ 

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
										<label class="col-sm-5 control-label" for="field-3">staffid</label>
										<div class="col-sm-7">
                                           <input type="text" class="form-control" name="staffid" id="staffid" data-validate="required" placeholder="" readonly="readonly" value="<%= request.getParameter("staffid")%>">   

<!-- <select id="cc"  style="width:200px;" onchange="selLdcode()">
  <option></option>
</select> -->

										</div>
										
										
									
									</div>
									
									
									 
									 
									 
									 
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3"></label>
										<!-- <div class="col-sm-2">
											<button type="button" class="btn btn-primary" id="search" disabled="disabled">下载</button>
										</div> -->
										<!-- <div class="col-sm-2">
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
	<script src="<%=request.getContextPath() %>/application/customermanager/newCustomermanager/res/js/latraining.js" type="text/javascript" charset="utf-8"></script>

	
</body>
</html>