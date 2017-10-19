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
	<title>保险产品新增</title>
	
	<%@ include file="../../../main/jsp/top.jsp" %>

<script type="text/javascript">
 $(document).ready(function(){ 
selLacom('insuranceCom');
sel('subriskflag','subRiskFlag');
sel('calculateprem','char1');
sel('riskinputtype','riskType');

}); 

 
</script>
</head>
<body class="page-body skin-facebook" >
	<div class="page-container">    
		
		<div class="main-content">
			<%@ include file="../../../main/jsp/nav.jsp" %>
			<div class="row">
				<div class="col-sm-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<form>
								<div class="form-group">
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3">保险公司</label>
										<div class="col-sm-7"><!--  onchange="selLower('insuranceCom','char3')"  -->
										<select class="form-control" id="insuranceCom" name="insuranceCom">
										<option></option>
										</select>
									</div>
										</div>
									</div>
									<div class="form-group">
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3">险种代码(SFP险种代码)</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="riskCode" id="riskCode" data-validate="required" placeholder="" >
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3">险种代码简称</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="subRiskVer" id="subRiskVer" data-validate="required" placeholder="" >
										</div>
									</div>
									
									</div>
									<div class="form-group">
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3">主附险标志</label>
										<div class="col-sm-7">
										<select class="form-control" name="subRiskFlag" id="subRiskFlag" onchange="myquery()">
										<option> </option>
										</select>
								
										</div>
									</div>
									</div>
									<div class="form-group">
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3">险种名称</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="riskName" id="riskName" data-validate="required" placeholder="">
										</div>
									</div>
									</div>
									<div class="form-group">
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3">保险产品外部代码</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="riskProp" id="riskProp" data-validate="required" placeholder="">
										</div>
									</div>
									</div>
									<div class="form-group">
							 <div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3">险种类型</label>
										<div class="col-sm-7">
											<select class="form-control" id="riskType" name="riskType" >
											</select>
										</div>
									</div>
						</div>
							<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3">销售起期</label>
										<div class="col-sm-7">
											<input type="text" name="StartDate"  id="StartDate" class="form-control datepicker" data-format="yyyy-mm-dd">
										</div>
										
									</div>
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3">销售止期</label>
										<div class="col-sm-7">
											<input type="text" name="endDate"  id="endDate" class="form-control datepicker" data-format="yyyy-mm-dd">
										</div>
									</div>
									
									<div class="form-group">
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3">保费计算方式</label>
										<div class="col-sm-7">
											<select class="form-control" id="char1" name="char1" >
												
											</select>
										</div>
									</div>
									</div>
									<div class="form-group">
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3">险种状态</label>
										<div class="col-sm-7">
											<select class="form-control" id="char6" name="char6">
											<option></option>
											<option value="Y">有效</option>
											<option value="N">无效</option>
											</select>
										
										</div>
									</div>
									</div>
									<div class="form-group">
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3">投保单打印类型</label>
										<div class="col-sm-7">
											<select class="form-control" id="char3" name="char3">
												<option>  </option>
												<option value="S">复杂类</option>
												<option value="I">投连类</option>
											</select>
										</div>
									</div>
									</div>
									<div class="form-group">
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3">风险等级</label>
										<div class="col-sm-7">
										<select class="form-control" id="risk" name="risk">
										   <option></option>
										   <option value="1">一级</option>
										   <option value="2">二级</option>
										   <option value="3">三级</option>
										   <option value="4">四级</option>
										   <option value="5">五级</option>
										</select>
										</div>
									</div>
									</div>
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3">操作员</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="operator" id="operator" data-validate="required" placeholder="" value="${userLoginInfo.emplID}" readonly="readonly">
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										
										<div class="col-sm-7">
											<input type="hidden" class="form-control" name="char4" id="char4" data-validate="required" placeholder="">
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										
										<div class="col-sm-7">
											<input type="hidden" class="form-control" name="riskVer" id="riskVer" data-validate="required" placeholder="">
										</div>
									</div>
										<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										
										<div class="col-sm-7">
											<input type="hidden" class="form-control" name="riskShortName" id="riskShortName" data-validate="required" placeholder="">
										</div>
									</div>
								
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3"></label>
										<%-- <div class="col-sm-2">
											<button type="button" class="btn btn-primary" id="search">险种录入</button>
										</div>--%>
										
										<div class="col-sm-2">
											<button type="reset" class="btn btn-primary" id="reset">清空</button>
										</div>
										<div class="col-sm-2">
											<button type="submit" class="btn btn-primary"  >提交</button>
										</div>
			                    
			                     
								<div class="form-group-separator"></div>
							
						</div>
				<!-- 	<div style="margin-left: 10%">
					    本产品适用于：<br><br>
										<input type="checkbox" value="ALE" name="checks" checked="checked">ALE
										<input type="checkbox" value="ILP" name="checks" >ILP
				    </div> -->
					</form>
 </div>
						<table align="center" width="80%" border="1" style="text-align: center;border-top: none" class="table table-bordered">
										<thead>
										<tr>
										   <td align="left" style="border:0;" width="20%" id="one"><button id="add"  style="width:15%" class="btn btn-info btn-xs">+</button></td>
										   <td style="border:0;"></td>
										   <td align="right" style="border:0;" width="20%"><button id="del" style="width:15%" class="btn btn-info btn-xs">-</button></td>
										 </tr>
										 <tr height="30">
										   <td>序号</td>
										   <td>参数名称</td>
										   <td>参数显示</td>
										 </tr>
										 </thead>
										 <tbody id="lacoms">
	
									</tbody>
						</table>
		                <table class="table table-hover" id="cusTable">
						</table>
					</div>
				</div>
			</div>
			
			<%@ include file="../../../main/jsp/footer.jsp" %>
		</div>
	</div>
	<%@ include file="../../../main/jsp/bottom.jsp" %>
	<script src="<%=request.getContextPath() %>/include/js/datepicker/bootstrap-datepicker.js"></script>
	
		
	<script src="<%=request.getContextPath() %>/include/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath() %>/include/js/bootstrapValidator.js"></script>
	<script src="<%=request.getContextPath() %>/include/js/bootstrapValidator.min.js"></script>
	
	 <script src="<%=request.getContextPath() %>/application/insuranceproducts/newinsuranceproducts/res/js/Add.js" type="text/javascript" charset="utf-8"></script>
	
</body>
</html>