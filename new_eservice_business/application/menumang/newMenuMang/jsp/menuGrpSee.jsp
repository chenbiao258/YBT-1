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

		<title>用户添加</title>
		<%@ include file="../../../main/jsp/top.jsp" %>
		<link rel="stylesheet" href="<%=request.getContextPath() %>/include/css/xenon-core.css">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/include/css/xenon-forms.css">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/include/css/common.css">

	<script type="text/javascript">
		var path = "<%=request.getContextPath() %>";
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
								<h3 class="panel-title">添加用户</h3>
							</div>
							<div class="panel-body">
								<form id="form-plus" action="" method="" role="form" class="form-horizontal">
								
									<div class="form-group">
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="field-3"><span class="red">*</span>菜单组名称</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="menugrpname" id="menugrpname" onkeyup="onbl()">
											    <label id='la'></label>
											</div>
										</div>
										<!-- <div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="field-3"><span class="red">*</span>菜单组描述</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="menugrpdescription" id="menugrpdescription" data-validate="required" placeholder="">
											</div>
										</div> -->
										
										
									<!-- 	<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="field-3"><span class="red">*</span>菜单组状态</label>
											<div class="col-sm-6">
											<select class="form-control" id="menustate" name="menustate">
												<option></option>
												<option value="0">有效</option>
												<option value="1">无效</option>
											</select>
											</div>
										</div> -->
										
										
										
										
									



										<div class="col-lg-12 col-md-12 col-xs-12 marginbottom15" style="margin-top: 5%">
											<label class="col-sm-2 control-label" for="field-3"></label>
											<div class="col-sm-1">
												<button type="button" class="btn btn-primary serach" id="serach">查看</button>
											</div>
											<div class="col-sm-1">
												<button type="reset" class="btn btn-primary" id="reset">重置</button>
											</div>
											<div class="col-sm-1">
												<button type="button" class="btn btn-primary" id="deletes">删除</button>
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
		<!-- Imported styles on this page -->
		<%@ include file="../../../main/jsp/bottom.jsp" %>
		<!-- Imported scripts on this page -->
		
		<script src="<%=request.getContextPath() %>/include/js/select2/select2.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=request.getContextPath() %>/include/js/datepicker/bootstrap-datepicker.js"></script>
		<script src="<%=request.getContextPath() %>/application/menumang/newMenuMang/res/js/menuGrpSee.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=request.getContextPath() %>/include/json/area.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=request.getContextPath() %>/include/json/newlocation.js" type="text/javascript" charset="utf-8"></script>
	</body>
</html>