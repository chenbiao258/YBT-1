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
	<title>保险产品审核</title>
	<%@ include file="../../../main/jsp/top.jsp" %>
	
			<script type="text/javascript">
	
	var insuranceCom ="<%= request.getParameter("insuranceCom")%>"; 
	var riskCode = "<%= request.getParameter("riskCode")%>"; 

	$(document).ready(function() {
	sel(insuranceCom,riskCode);
	//initQuery(agentcom);
	 for(var i=1;i<=5;i++){
    sels('riskinputtype01','a'+i);
    }
	QueryParam();
	});
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
							<form action="" method="" role="form" class="form-horizontal" id="form-plus">
								<div class="form-group">
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3">保险公司</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="insuranceCom" readonly="ture" id="insuranceCom" data-validate="required" placeholder="">
										</div>
									</div>
									
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3">销售起期</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="StartDate" readonly="ture" id="StartDate" data-validate="required" placeholder="">
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3">销售止期</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="endDate" readonly="ture" id="endDate" data-validate="required" placeholder="">
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3">险种代码</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="riskCode" readonly="ture" id="riskCode" data-validate="required" placeholder="">
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3">险种代码简称</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="subRiskVer" id="subRiskVer" data-validate="required" placeholder="" readonly="readonly">
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3">险种状态</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="riskShortName" readonly="ture" id="riskShortName" data-validate="required" placeholder="">
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3">保费计算方式</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="char1" readonly="ture" id="char1" data-validate="required" placeholder="">
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3">保单打印类型</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="char3" readonly="ture" id="char3" data-validate="required" placeholder="">
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3">险种类型</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="riskPeriod" readonly="ture" id="riskPeriod" data-validate="required" placeholder="">
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3">风险等级</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="risk" id="risk" data-validate="required" placeholder="" readonly="readonly">
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3">操作员</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="operator" id="operator" data-validate="required" placeholder="" value="${userLoginInfo.emplID}" readonly="readonly">
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3">审批</label>
										<div class="col-sm-7">
											<select class="form-control" id="checkFlag" name="checkFlag">
												<option></option>
												<option value="Y">审核通过</option>
												<option value="N">审核不通过</option>
											</select>
										</div>
									</div>
								</div>
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3"></label>
										<div class="col-sm-2">
											<button type="button" class="btn btn-primary" id="save">提交</button>
										</div>
										 <div class="col-sm-2">
											<button type="button" class="btn btn-primary back" id="back">返回</button>
										</div>
										
			</div>
							</form>
						</div>
						<table style="width: 60%;border:1px solid #ececea;margin-top: 3%"  cellpadding="0" cellspacing="0" align="center">
					  <tr style="height: 30px">
					     <th><font style="color: black;">参数名称</font></th>
					     <th><font style="color: black;">参数显示</font></th>
					 </tr>
					  <tr>
					     <td>
					        <select class="form-control" id="a1" name="a1" onchange="selByCodealias('a1','b1','c1')"  disabled="disabled">
							</select>
						</td>
					    <td>
					        <select class="form-control" id="b1" name="b1" onchange="mychan2('b1','c1')"  disabled="disabled">
							 
						    </select></td>
					   
					  </tr>
					 <tr>
					     <td>
					        <select class="form-control" id="a2" name="a2"  onchange="selByCodealias('a2','b2','c2')"  disabled="disabled">
				
						   </select>
						</td>
					     <td>
					     <select class="form-control" id="b2" name="b2" onchange="mychan2('b2','c2')"  disabled="disabled">
							
						</select></td>
					    
					  </tr>
					   <tr>
					     <td>
					        <select  class="form-control" id="a3" name="a3" onchange="selByCodealias('a3','b3','c3')"  disabled="disabled">
						
						   </select>
						</td>
					     <td><select  class="form-control" id="b3" name="b3" onchange="mychan2('b3','c3')"  disabled="disabled">
							
						</select></td>
					   
					  </tr>
					   <tr>
					     <td>
					        <select class="form-control" id="a4" name="a4" onchange="selByCodealias('a4','b4','c4')"  disabled="disabled">
						   </select>
						</td>
					     <td>
					     <select  class="form-control" id="b4" name="b4" onchange="mychan2('b4','c4')"  disabled="disabled">
							
						</select></td>
					    
					  </tr>
					   <tr>
					     <td>
					        <select class="form-control" id="a5" name="a5"   onchange="selByCodealias('a5','b5','c5')"  disabled="disabled">
						   </select>
						</td>
					     <td><select class="form-control" id="b5" name="b5" onchange="mychan2('b5','c5')" disabled="disabled">
							
						</select>
						</td>
					    
					  </tr>
					  
					</table>
					</div>
				</div>
			</div>
			
			<%@ include file="../../../main/jsp/footer.jsp" %>
		</div>
	</div>
	<%@ include file="../../../main/jsp/bottom.jsp" %>
	  <script src="<%=request.getContextPath() %>/application/insuranceproducts/newinsuranceproducts/res/js/sh2.js" type="text/javascript" charset="utf-8"></script>
</body>
</html>