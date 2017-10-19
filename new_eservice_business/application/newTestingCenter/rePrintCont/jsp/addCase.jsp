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

	<title>增加案例</title>
	
	<%@ include file="../../../main/jsp/top.jsp" %>

	</head>

	<body class="page-body skin-facebook">

		<div class="page-container">
		
			

			<div class="main-content">

				<%@ include file="../../../main/jsp/nav.jsp" %>

				<div class="row">
					<div class="col-sm-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">新增案例</h3>
							</div>
							<div class="panel-body">
								<form id="form-plus" action="" method="" role="form" class="form-horizontal">
									
									<div class="form-group">
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="field-3"><span class="red">*</span>案例编码</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="caseCode" id="caseCode" data-validate="required" placeholder="">
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="field-3"><span class="red">*</span>案例名称</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="caseName" id="caseName" data-validate="required" placeholder="">
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="field-3"><span class="red">*</span>测试者</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="caseTester" id="caseTester" data-validate="required" placeholder="">
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="field-3">案例类型</label>
											<div class="col-sm-6">
												<select class="form-control" id="caseTypeName" name="caseTypeName">
													<option></option>
													<option  value="X">续期</option>
													<option  value="N">新单</option>
												  	<option  value="Q">其他</option>
												</select>
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="field-3">案例状态</label>
											<div class="col-sm-6">
												<select class="form-control" id="caseStateName" name="caseStateName">
													<option></option>
													<option  value="Y">已执行</option>
												  	<option  value="N">新建</option>
												</select>
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="field-3">案例内容</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="caseContName" id="caseContName" data-validate="required" placeholder="">
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="field-3">案例描述</label>
											<div class="col-sm-8">
												<textarea class="form-control autogrow" name="caseDesc" id="caseDesc" data-validate="minlength[10]" rows="5" placeholder=""></textarea>
											</div>
										</div>
										<div class="col-lg-12 col-md-12 col-xs-12 marginbottom15">
											<label class="col-sm-2 control-label" for="field-3"></label>
											<div class="col-sm-1">
												<button type="button" class="btn btn-primary" id="save">保存</button>
											</div>
											<div class="col-sm-1">
												<button type="reset" class="btn btn-primary" id="reset">重置</button>
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
		<script src="<%=request.getContextPath() %>/application/newTestingCenter/rePrintCont/res/js/addCase.js" type="text/javascript" charset="utf-8"></script>

	</body>

</html>