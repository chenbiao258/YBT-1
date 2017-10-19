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

	<title>案例查询</title>
	
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
								<h3 class="panel-title">查询案例</h3>
							</div>
							<div class="panel-body">
								<form action="" method="" role="form" class="form-horizontal">
									
									<div class="form-group">
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="field-3"><span class="blue">*</span>案例编码</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="caseCode" id="caseCode" data-validate="required" placeholder="">
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="field-3"><span class="blue">*</span>案例名称</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="caseName" id="caseName" data-validate="required" placeholder="">
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="field-3"><span class="blue">*</span>测试者</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="caseTester" id="caseTester" data-validate="required" placeholder="">
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="field-3">案例类型</label>
											<div class="col-sm-6">
												<select class="form-control" id="caseType" name="caseType">
													<option></option>													
													<option value="Q">其他</option>
													<option value="X">续期</option>
												  	<option value="N">新单</option>
												</select>
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="field-3">案例状态</label>
											<div class="col-sm-6">
												<select class="form-control" id="caseState" name="caseState">
													<option></option>
													<option value="N">新建</option>
												  	<option value="Y">已执行</option>
												</select>
											</div>
										</div>
										<div class="col-lg-12 col-md-12 col-xs-12 marginbottom15">
											<label class="col-sm-2 control-label" for="field-3"></label>
											<div class="col-sm-1">
												<button type="button" class="btn btn-primary" id="search">查询</button>
											</div>
											<div class="col-sm-1">
												<button type="reset" class="btn btn-primary" id="reset">重置</button>
											</div>
											<div class="col-sm-1">
												<button type="button" class="btn btn-primary" id="add">添加案例</button>
											</div>
										</div>
									</div>
	
									<div class="form-group-separator"></div>
								
								</form>
							</div>
							<div id="toolbar" class="btn-group">
								<button type="button" class="btn btn-default" id="add" title="添加数据">
							        <i class="glyphicon glyphicon-plus"></i>
							    </button>
								<button type="button" class="btn btn-default" id="remove" disabled title="删除数据">
							        <i class="glyphicon glyphicon-trash"></i>
							    </button>
								<button type="button" class="btn btn-default" id="export" title="导出数据">
							        <i class="glyphicon glyphicon-export"></i>
							    </button>
								<button type="button" class="btn btn-default" id="save" title="下载excel">
							        <i class=" glyphicon glyphicon-save"></i>
							    </button>
								<button type="button" class="btn btn-default" id="import" data-toggle="modal" data-target="#my-modal-alert" title="导入数据">
							        <i class="glyphicon glyphicon-import"></i>
							    </button>
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
		<script src="<%=request.getContextPath() %>/application/newTestingCenter/newCaseManage/res/js/queryCaseManage.js" type="text/javascript" charset="utf-8"></script>

	</body>

</html>