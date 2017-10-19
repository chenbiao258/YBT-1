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

	<title>交易报文</title>
	
	<%@ include file="../../../main/jsp/top.jsp" %>
	
	<script type="text/javascript">
	
		var tContNo = "<%= request.getParameter("tContNo")%>"; 
		var contNo = "<%= request.getParameter("contNo")%>"; 
	 	
	</script>

	</head>

	<body class="page-body skin-facebook">

		<div class="page-container">
		
			

			<div class="main-content">

				<%@ include file="../../../main/jsp/nav.jsp" %>

				<div class="row">
					<div class="col-sm-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">报文列表</h3>
							</div>
							<div class="panel-body panel-border">
								<div class="row">
									<div class="col-sm-12">
										<table class="table table-hover" id="cusTable">
											<thead>
												<tr>
													<th data-field="state" data-checkbox="true"></th>
													<th data-field="transId" data-sortable="true">序号</th>
													<th data-field="transName">报文名称</th>
													<th data-field="transDir">交易方向</th>
													<th data-field="action" data-formatter="actionFormatter" data-events="actionEvents">操作</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<div class="panel-heading">
								<h3 class="panel-title">报文预览</h3>
							</div>
							<div class="panel-body panel-border">
								<div class="row">
									<div class="col-sm-6 marginbottom15">
										<textarea class="form-control autogrow" name="transArea" id="transArea" rows="5" placeholder=""></textarea>
									</div>
									<div class="col-lg-12 col-md-12 col-xs-12 marginbottom15">
										<div class="col-sm-1 col-sm-offset-5">
											<button type="button" class="btn btn-primary back" id="back">返回</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<%@ include file="../../../main/jsp/footer.jsp" %>
			</div>

		</div>
		<%@ include file="../../../main/jsp/bottom.jsp" %>
		<!-- Imported scripts on this page -->
		<script src="<%=request.getContextPath() %>/application/newTestingCenter/cancelCont/res/js/transction.js" type="text/javascript" charset="utf-8"></script>

	</body>

</html>