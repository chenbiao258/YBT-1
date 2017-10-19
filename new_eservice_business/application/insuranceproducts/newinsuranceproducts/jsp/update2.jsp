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
	
	<link rel="stylesheet" href="<%=request.getContextPath() %>/include/css/bootstrap.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/include/css/bootstrapValidator.css"/>
	<%@ include file="../../../main/jsp/top.jsp" %>
		
<script type="text/javascript">
	
	var insuranceCom ="<%= request.getParameter("insuranceCom")%>"; 
	var riskCode = "<%= request.getParameter("riskCode")%>"; 



	
$(function()
{

	sels('riskinputtype','riskType');
 
    for(var i=1;i<=5;i++){
    sels('riskinputtype01','a'+i);
    }
    



	
     
    
   
});



	</script>
</head>
<body class="page-body skin-facebook" onload="">
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
										<div class="col-sm-7">
										<input type="text" class="form-control" name="insuranceCom" id="insuranceCom" data-validate="required" placeholder="" readonly="readonly">
										
									</div>
										</div>
									</div>
									<div class="form-group">
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3">险种代码</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" name="riskCode" id="riskCode" data-validate="required" placeholder="" readonly="readonly">
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
										<option value="M">主险</option>
										<option value="S">附加险</option>
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
										
												<option value="1">由保费计算保额</option>
												<option value="2">由保额计算保费</option>
												<option value="3">保费保额均已知</option>
											</select>
										</div>
									</div>
									</div>
									<div class="form-group">
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3">险种状态</label>
										<div class="col-sm-7">
											<select class="form-control" id="char6" name="char6">
									
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
											<input type="text" class="form-control" name="operator" id="operator" data-validate="required" placeholder="" readonly="readonly">
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
								
										<input type="hidden" class="form-control" name="s1" id="s1" data-validate="required" placeholder="">
										<input type="hidden" class="form-control" name="s2" id="s2" data-validate="required" placeholder="">
										<input type="hidden" class="form-control" name="s3" id="s3" data-validate="required" placeholder="">
										<input type="hidden" class="form-control" name="s4" id="s4" data-validate="required" placeholder="">
										<input type="hidden" class="form-control" name="s5" id="s5" data-validate="required" placeholder="">
										<input type="hidden" class="form-control" name="checkFlag" id="checkFlag" data-validate="required" placeholder="">
									<div class="col-lg-6 col-md-6 col-xs-6 marginbottom15" >
									
										<div class="col-sm-2" >
											<button type="reset" class="btn btn-primary" id="reset">清空</button>
										</div>
										<div class="col-sm-2" >
											<button type="submit" class="btn btn-primary">提交</button>
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
					        <select class="form-control" id="a1" name="a1" onchange="selByCodealias('a1','b1','c1')">
							</select>
						</td>
					    <td>
					        <select class="form-control" id="b1" name="b1" onchange="mychan2('b1','c1')">
							 
						    </select></td>
					   
					  </tr>
					 <tr>
					     <td>
					        <select class="form-control" id="a2" name="a2"  onchange="selByCodealias('a2','b2','c2')">
				
						   </select>
						</td>
					     <td>
					     <select class="form-control" id="b2" name="b2" onchange="mychan2('b2','c2')">
							
						</select></td>
					    
					  </tr>
					   <tr>
					     <td>
					        <select  class="form-control" id="a3" name="a3" onchange="selByCodealias('a3','b3','c3')">
						
						   </select>
						</td>
					     <td><select  class="form-control" id="b3" name="b3" onchange="mychan2('b3','c3')">
							
						</select></td>
					   
					  </tr>
					   <tr>
					     <td>
					        <select class="form-control" id="a4" name="a4" onchange="selByCodealias('a4','b4','c4')">
						   </select>
						</td>
					     <td>
					     <select  class="form-control" id="b4" name="b4" onchange="mychan2('b4','c4')">
							
						</select></td>
					    
					  </tr>
					   <tr>
					     <td>
					        <select class="form-control" id="a5" name="a5"   onchange="selByCodealias('a5','b5','c5')">
						   </select>
						</td>
					     <td><select class="form-control" id="b5" name="b5" onchange="mychan2('b5','c5')">
							
						</select>
						</td>
					    
					  </tr>
					  
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
	<script src="<%=request.getContextPath() %>/include/js/jquery-validate/jquery.validate.min.js"></script>

	<script src="<%=request.getContextPath() %>/include/js/datepicker/bootstrap-datepicker.js"></script>
	
		
	<script src="<%=request.getContextPath() %>/include/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath() %>/include/js/bootstrapValidator.js"></script>
	<script src="<%=request.getContextPath() %>/include/js/bootstrapValidator.min.js"></script>
	
	 <script src="<%=request.getContextPath() %>/application/insuranceproducts/newinsuranceproducts/res/js/update2.js" type="text/javascript" charset="utf-8"></script>
	
</body>
</html>