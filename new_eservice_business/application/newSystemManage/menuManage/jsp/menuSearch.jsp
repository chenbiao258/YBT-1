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

	<title>菜单查询</title>
	
	<%@ include file="../../../main/jsp/top.jsp" %>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/include/css/common.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/include/css/bootstrap-table.min.css"/>

	</head>

	<body class="page-body skin-facebook">

		<div class="page-container">
		
<<<<<<< .mine
=======
			
>>>>>>> .r1139

			<div class="main-content">

				<%@ include file="../../../main/jsp/nav.jsp" %>

				<div class="row">
					<div class="col-sm-12">
						<div class="panel panel-default">
							<div class="panel-body">
								<form action="" method="" role="form" class="form-horizontal">
									
									<div class="form-group">
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="field-3">用户代码</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="field-3" id="field-3" data-validate="required" placeholder="">
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="field-3">用户姓名</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="field-3" id="field-3" data-validate="required" placeholder="">
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
											<label class="col-sm-4 control-label" for="field-3"></label>
											<div class="col-sm-2">
												<button class="btn btn-primary" id="search">查询</button>
											</div>
											<div class="col-sm-2">
												<button type="reset" class="btn btn-primary" id="search">重置</button>
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
							<table class="table table-hover" id="cusTable" data-show-toggle="true">
								<thead>
									<tr>
										<th data-field="state" data-checkbox="true"></th>
										<th data-field="CUSTOMERNO" data-sortable="true">客户号</th>
										<th data-field="CUSTOMERNAME">客户姓名</th>
										<th data-field="SEX" data-sortable="true">性别</th>
										<th data-field="LEVELCODE">客户级别</th>
										<th data-field="action" data-formatter="actionFormatter" data-events="actionEvents">Action</th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<%@ include file="../../../main/jsp/footer.jsp" %>
			</div>

		</div>
		<%@ include file="../../../main/jsp/bottom.jsp" %>
		<!-- Imported scripts on this page -->
		<script src="<%=request.getContextPath() %>/include/js/bootstrap-table.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=request.getContextPath() %>/include/js/bootstrap-table-zh-CN.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=request.getContextPath() %>/application/newSystemManage/menuManage/res/js/menuSearch.js" type="text/javascript" charset="utf-8"></script>

	</body>

</html>