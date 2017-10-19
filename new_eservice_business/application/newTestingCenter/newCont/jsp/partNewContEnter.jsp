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
		<link rel="stylesheet" href="<%=request.getContextPath() %>/include/css/bootstrap.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/include/css/bootstrapValidator.css"/>
	<title>新契约录入</title>
	<%@ include file="../../../main/jsp/top.jsp" %>
	<style>
		label{
			white-space: nowrap;
		}
		.input-group-addon{
			padding: 6px 7px;
		}
		@media (min-width: 1400px ) {
			.col-bg-4{
				width: 33.33333333%;
				position: relative;
			    min-height: 1px;
			    padding-right: 0px;
			    padding-left: 0px;
			    float: left;
			}
			.col-bg-45{
				width: 13.07395467%;
				position: relative;
			    min-height: 1px;
			    padding-right: 15px;
			    padding-left: 15px;
			    float: left;
			}
			.col-bg-87{
				width: 86.92604533%;
				padding-left: 0px;
				padding-right: 0px;
				float: left;
			}
		}
		@media (max-width: 1400px ) {
			.col-bg-45{
				width: 20.16460025%;
				position: relative;
			    min-height: 1px;
			    padding-right: 15px;
			    padding-left: 15px;
			    float: left;
			}
			.col-bg-87{
				width: 79.83539975%;
				padding-left: 0px;
				padding-right: 0px;
				float: left;
			}
			.col-bg-0{
				display: none;
			}
		}
		.form-horizontal .form-group{
			margin-left: 0px;
			margin-right: 0px;
			margin-bottom: 0px;
		}
	</style>
	
	<script type="text/javascript">

		var grpcontno = "<%= request.getParameter("grpcontno")%>"; 
		
		var salesChl = "<%= request.getParameter("salesChl")%>"; 
		var tContNo = "<%= request.getParameter("tContNo")%>"; 
		var riskCode = "<%= request.getParameter("riskCode")%>";  
		var flag = "<%= request.getParameter("flag")%>"; 
		var transno = "<%=request.getParameter("transno")%>"; 
		
	</script>
	
</head>
<body class="page-body skin-facebook">
		
	<div class="page-container">    <!-- add class "sidebar-collapsed" to close sidebar by default, "chat-visible" to make chat appear always -->
			
		<!-- Add "fixed" class to make the sidebar fixed always to the browser viewport. -->

		
		
		<div class="main-content">
					
			<%@ include file="../../../main/jsp/nav.jsp" %>
				
			<div role="forl" id="rootwizard" class="form-wizard form-horizontal">
							
								<ul class="tabs">
					<li class="active">
						<a href="#fwv-1" data-toggle="tab">
							投保单信息
							<span>1</span>
						</a>
					</li>
					<li>
						<a href="#fwv-2" data-toggle="tab" id="tabValidata">
							投保人信息
							<span>2</span>
						</a>
					</li>
					<li>
						<a href="#fwv-5" data-toggle="tab" >
							税收信息
							<span>3</span>
						</a>
					</li>
					<li>
						<a href="#fwv-3" data-toggle="tab">
							被保人信息
							<span>4</span>
						</a>
					</li>
					<li>
						<a href="#fwv-4" data-toggle="tab">
							受益人
							<span>5</span>
						</a>
					</li>
			<!-- 		<li>
						<a href="#fwv-5" data-toggle="tab" >
							产品信息
							<span>5</span>
						</a>
						
					</li> -->
					<li>
						<a href="#fwv-7" data-toggle="tab" >
							产品信息
							<span>6</span>
						</a>
						
					</li> 
					<!--  
					<li>
						<a href="#fwv-5" data-toggle="tab" >
							税收信息
							<span>6</span>
						</a>
						
					</li> 
					-->
					<li>
						<a href="#fwv-20" data-toggle="tab" >
							告知录入
							<span>7</span>
						</a>
						
					</li> 
					
					
					<li>
						<a href="#fwv-6" data-toggle="tab" >
							保单试算
							<span>8</span>
						</a>
						
					</li> 
				</ul>
				
				<div class="progress-indicator">
					<span></span>
				</div>
				
				<div class="tab-content no-margin">
					
					
					
					
					
					
					<!-- 投保单信息 -->
					<form class="tab-pane with-bg section active" id="fwv-1">
					    <div class="row">
							<div class="form-group">							
								
							     <input type="hidden" name="grpcontno" id="grpcontno">
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-2" ><span class="red">*</span>保险公司代码</label>
									<div class="col-sm-7">
										<select class="form-control" id="field-1" name="insurancecom" >
											<option></option>
										</select>
									</div>
									
								</div>
								<input type="hidden" name="riskcode10" id="riskcode10">
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-2"><span class="red">*</span>投保单号码</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="proposalcontno" id="field-2"  readonly="readonly" >
									</div>
								</div>		
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3"><span class="red">*</span>客户经理代码</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" readonly="readonly" name="agentcode" id="field-3" value="${userLoginInfo.emplID}" data-validate="required" placeholder="客户经理代码">
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-4"><span class="red">*</span>客户经理姓名</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" readonly="readonly" name="agentname" id="field-4" value="${userLoginInfo.name}" data-validate="required" placeholder="客户经理姓名">
									</div>
								</div>
								<!--  
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-5"><span class="red">*</span>客户经理手续费比例</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="receivetime" id="field-5" data-validate="required" placeholder="100%" >
									</div>
								</div>
								-->
													
							 	<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-6"><span class="red">*</span>投保日期</label>
									<div class="col-sm-7">
										<div class="input-group">
											<input type="text" name="polapplydate"  id="field-6" class="form-control datepicker" data-format="yyyymmdd" readonly="readonly">
											<div class="input-group-addon">
												<a href="#"><i class="linecons-calendar"></i></a>
											</div>
										</div>
									</div>
								</div> 
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15" style="display: none;">
									<label class="col-sm-5 control-label" for="field-7"><span class="red">*</span>客户账户</label>
									<div class="col-sm-7">
										<select class="form-control" id="newbankaccno" name="newbankaccno" >
											<option></option>
											
										</select>
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-5"><span class="red" style="display: none;">*</span>账户余额</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="accountbalance" id="accountbalance" data-validate="required" placeholder="100%" readonly="readonly">
									</div>
								</div>
								
								
								
								
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-7"><span class="red">*</span>保单递送方式</label>
									<div class="col-sm-7">
										<select class="form-control" id="field-7" name="getpolmode" >
											<option></option>
											<option value="1">纸质保单</option>
										  	<option value="2">电子保单</option>
										</select>
									</div>
								</div>
								
									
								
							</div>	
						</div>	
					</form>
					<!-- 投保单信息结束 -->
					
					<!-- 投保人信息 -->
					<form class="tab-pane with-bg section" id="fwv-2">
						<div class="row">
							<div class="form-group">
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-8"><span class="red">*</span>姓名</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="appntname" id="field-8" data-validate="required:true" placeholder="姓名" >
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-9"><span class="red">*</span>证件类型</label>
									<div class="col-sm-7">
										<select class="form-control" id="field-9" name="idtype">
											<option></option>
										</select>
									</div>
								</div>
									<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-10"><span class="red">*</span>证件号码</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="idno" id="field-10" data-validate="required" placeholder="证件号码">
									</div>
								</div>
								
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-11"><span class="red">*</span>性别</label>
									<div class="col-sm-7">
										<select class="form-control" id="field-11" name="appntsex">
											<option></option>
											<option value="0">男</option>
										  	<option value="1">女</option>
										</select>
									</div>
								</div>
									 <div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-12"><span class="red">*</span>出生日期</label>
									<div class="col-sm-7">
										<div class="input-group">
											<input type="text" name="appntbirthday"  id="field-12" class="form-control datepicker" data-format="yyyy-mm-dd">
											<div class="input-group-addon">
												<a href="#"><i class="linecons-calendar"></i></a>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-14"><span class="red">*</span>证件有效起期</label>
									<div class="col-sm-7">
										<div class="input-group">
											<input type="text" name="appntidstartdate"  id="field-14"  class="form-control datepicker" data-format="yyyy-mm-dd">
											<div class="input-group-addon">
												<a href="#"><i class="linecons-calendar"></i></a>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-15"><span class="red">*</span>证件有效止期</label>
									<div class="col-sm-7">
										<div class="input-group">
											<input type="text" name="appntidenddate"  id="field-15"  class="form-control datepicker" data-format="yyyy-mm-dd">
											<div class="input-group-addon">
												<a href="#"><i class="linecons-calendar"></i></a>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-16"><span class="red">*</span>国籍</label>
									<div class="col-sm-7">
										<select class="form-control"  id="field-16" name="nativeplace">  <!-- id="s2example-3"  -->
											<option></option>
											
										</select>
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-17"><span class="red">*</span>职业代码</label>
									<div class="col-sm-7">
										<select class="form-control" id="field-17" name="occupationcode">
												<option value="">--请选择--</option>
										</select>
									</div>
								</div>
				
							<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-19"><span class="red">*</span>家庭年收入(万)</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="salary" id="field-19" data-validate="required" placeholder="工资">
									</div>
								</div>
								
							
								
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-21">邮寄编码</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="zipcode" id="field-21" data-validate="required" placeholder="邮编">
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-22"><span class="red">*</span>移动电话</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="mobile" id="field-22" data-validate="number" placeholder="phonenumber">
									</div>
								</div>
								
									<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-23">E-mail</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="e_mail" id="field-23" data-validate="email" placeholder="请输入E-mail">
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for=""field-24""><span class="red">*</span>联系电话</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="phone" id="field-24" data-validate="number" placeholder="phonenumber">
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-25">家庭邮编</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="homezipcode" id="field-25" data-validate="number" placeholder="phonenumber">
									</div>
								</div>
									
							
								
								
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-29">身高(cm)</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="stature" id="field-29" data-validate="required" placeholder="身高">
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-30">体重(kg)</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="avoirdupois" id="field-30" data-validate="required" placeholder="体重">
									</div>
								</div>
								
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-31"><span class="red">*</span>有无健康标识</label>
									<div class="col-sm-7">
										<select class="form-control" id="field-31" name="health">
											<option></option>
										  	<option value="N">无</option>
										  	<option value="Y">有</option>										  	
										</select>
									</div>
								</div>
								
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-32"><span class="red">*</span>居民类型</label>
									<div class="col-sm-7">
										<select class="form-control" id="field-32" name="creditgrade">
											<option></option>
										  	<option value="1">农村</option>
										  	<option value="2">城镇</option>										  	
										</select>
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-33"><span class="red">*</span>个人年收入(万元)</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="rgtaddress" id="field-33" data-validate="required" placeholder="0.00">
									</div>
								</div>
								
									<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-33">工作单位及名称</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="company" id="company" data-validate="required" placeholder="工作单位">
									</div>
								</div>
								
								
									<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-33">职位及工作内容</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="Responsibility" id="Responsibility" data-validate="required" placeholder="职位">
									</div>
								</div>
							
								
								<div class="marginbottom15" style="width: 100%;float: left;padding-right: 15px;padding-left: 15px;">
									<label class="col-bg-45 control-label" for="field-31"><span class="red">*</span>办公电话</label>
									<div class="col-bg-87">
										<div class="col-lg-4 col-md-4 col-xs-4">
											<input type="text" class="form-control" name="areaCall" id="areaCall" data-validate="required" placeholder="区号">
										</div>
										<div class="col-lg-4 col-md-4 col-xs-4">
											<input type="text" class="form-control" name="call" id="call" data-validate="required" placeholder="电话">
										</div>
										
									</div>
								</div>
									<div class="marginbottom15" style="width: 100%;float: left;padding-right: 15px;padding-left: 15px;">
									<label class="col-bg-45 control-label" for="field-32"><span class="red">*</span>邮编地址</label>
									<div class="col-bg-87">
										<center>
											<div class="col-lg-3 col-md-3 col-xs-6">
												<select id="loc_province-sub1" name="postalProvince">
													<option value="">--请选择--</option>
												</select>
											</div>
											<div class="col-lg-3 col-md-3 col-xs-6">
												<select id="loc_city-sub1" name="postalCity">
													<option value="">--请选择--</option>
												</select>
											</div>
											<div class="col-lg-3 col-md-3 col-xs-6">
												<select id="loc_town-sub1" name="postalArea">
													<option value="">--请选择--</option>
												</select>
											</div>
											<div class="col-lg-3 col-md-3 col-xs-6">
												<input type="text" class="form-control" name="postaladdress" id="postaladdress" data-validate="required" placeholder="详细地址">
											</div>
										</center>
									</div>
								</div>
								
								<div class="marginbottom15" style="width: 100%;float: left;padding-right: 15px;padding-left: 15px;">
									<label class="col-bg-45 control-label" for="field-33"><span class="red">*</span>家庭地址</label>
									<div class="col-bg-87">
										<center>
											<div class="col-lg-3 col-md-3 col-xs-6">
												<select id="loc_province-sub2" name="homeProvince">
													<option value="">--请选择--</option>
												</select>
											</div>
											<div class="col-lg-3 col-md-3 col-xs-6">
												<select id="loc_city-sub2" name="homeCity">
													<option value="">--请选择--</option>
												</select>
											</div>
											<div class="col-lg-3 col-md-3 col-xs-6">
												<select id="loc_town-sub2" name="homeArea">
													<option value="">--请选择--</option>
												</select>
											</div>
											<div class="col-lg-3 col-md-3 col-xs-6">
												<input type="text" class="form-control" name="homeaddress" id="homeaddress" data-validate="required" placeholder="详细地址">
											</div>
										</center>
									</div>
								</div>
									<div class="marginbottom15" style="width: 100%;float: left;padding-right: 15px;padding-left: 15px;">
									<label class="col-bg-45 control-label" for="field-33"><span class="red">*</span>其他地址</label>
									<div class="col-bg-87">
										<center>
											<div class="col-lg-3 col-md-3 col-xs-6">
												<select id="loc_province-sub5" name="otherProvince">
													<option value="">--请选择--</option>
												</select>
											</div>
											<div class="col-lg-3 col-md-3 col-xs-6">
												<select id="loc_city-sub5" name="otherCity">
													<option value="">--请选择--</option>
												</select>
											</div>
											<div class="col-lg-3 col-md-3 col-xs-6">
												<select id="loc_town-sub5" name="otherArea">
													<option value="">--请选择--</option>
												</select>
											</div>
											<div class="col-lg-3 col-md-3 col-xs-6">
												<input type="text" class="form-control" name="otheraddress" id="otheraddress1" data-validate="required" placeholder="详细地址">
											</div>
										</center>
									</div>
								</div>
								
								<div class="form-group">
									<div class="col-sm-2 col-sm-offset-5">
										<button type="button" class="btn btn-primary  save" id="save2">保存</button>
									</div>
								</div>
							</div>
						</div>
					</form>
					<!-- 投保人信息结束 -->
					<!-- 被保人信息 -->
					<form class="tab-pane with-bg section" id="fwv-3" >
						<div class="row">
							<div class="form-group">
								<div style="width: 100%;float: left;">
									<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3">与投保人关系</label>
										<div class="col-sm-7">
											<select class="form-control" id="relationtoappnt" name="relationtoappnt">
												<option></option>
											</select>
										</div>
									</div>
								</div>
									
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3"><span class="red">*</span>姓名</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="LCInsuredname" id="LCInsuredname" data-validate="required" placeholder="姓名">
									</div>
								</div>
								
								<input type="hidden" name="proposalContNo1" id="proposalContNo1">
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3"><span class="red">*</span>证件类型</label>
									<div class="col-sm-7">
										<select class="form-control" id="LCInsuredidtype" name="LCInsuredidtype">
											<option></option>
										  	
										</select>
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3"><span class="red">*</span>证件号码</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="LCInsuredidno" id="LCInsuredidno" data-validate="required" placeholder="证件号码">
									</div>
								</div>
								
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3"><span class="red">*</span>性别</label>
									<div class="col-sm-7">
										<select class="form-control" id="LCInsuredsex" name="LCInsuredsex">
											<option></option>
											<option value="0">男</option>
										  	<option value="1">女</option>
										</select>
									</div>
								</div>
									<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3"><span class="red">*</span>出生日期</label>
									<div class="col-sm-7">
										<div class="input-group">
											<input type="text" name="LCInsuredbirthday"  id="LCInsuredbirthday" class="form-control datepicker" data-format="yyyy-mm-dd">
											<div class="input-group-addon">
												<a href="#"><i class="linecons-calendar"></i></a>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">国籍</label>
									<div class="col-sm-7">
										<select class="form-control" id="LCInsurednativeplace" name="LCInsurednativeplace">
											<option></option>
											
										</select>
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">证件有效起期</label>
									<div class="col-sm-7">
										<div class="input-group">
											<input type="text" name="insureidstartdate" id="insureidstartdate" class="form-control datepicker" data-format="yyyy-mm-dd">
											<div class="input-group-addon">
												<a href="#"><i class="linecons-calendar"></i></a>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">证件有效止期</label>
									<div class="col-sm-7">
										<div class="input-group">
											<input type="text" name="insureidenddate" id="insureidenddate"  class="form-control datepicker" data-format="yyyy-mm-dd">
											<div class="input-group-addon">
												<a href="#"><i class="linecons-calendar"></i></a>
											</div>
										</div>
									</div>
								</div>
								
							
							
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">E-mail</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="LCInsurede_mail" id="LCInsurede_mail" data-validate="email" placeholder="请输入E-mail">
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">邮编</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="LCInsuredzipcode" id="LCInsuredzipcode" data-validate="required" placeholder="邮编">
									</div>
								</div>
								
							
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">身高(cm)</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="LCInsuredstature" id="LCInsuredstature" data-validate="required" placeholder="身高">
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">体重(kg)</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="LCInsuredavoirdupois" id="LCInsuredavoirdupois" data-validate="required" placeholder="体重">
									</div>
								</div>
							
									<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-18"><span class="red">*</span>有无健康标识</label>
									<div class="col-sm-7">
										<select class="form-control" id="LCInsuredhealth" name="LCInsuredhealth">
											<option></option>
										  	<option value="N">无</option>
										  	<option value="Y">有</option>										  	
										</select>
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3"><span class="red">*</span>职业代码</label>
									<div class="col-sm-7">
										<select class="form-control" id="LCInsuredoccupationcode" name="LCInsuredoccupationcode">
											<option value="">--请选择--</option>
										</select>
									</div>
								</div>
								
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">移动电话</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="LCInsuredmobile" id="LCInsuredmobile" data-validate="number" placeholder="phonenumber">
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-33">工作单位及名称</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="Lcinsuredcompany" id="Lcinsuredcompany" data-validate="required" placeholder="工作单位">
									</div>
								</div>
								
								
									<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-33">职位及工作内容</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="lcinsuredresponsibility" id="lcinsuredresponsibility" data-validate="required" placeholder="职位">
									</div>
								</div>
							
								
								
								
								
								<div class="marginbottom15" style="width: 100%;float: left;padding-right: 15px;padding-left: 15px;">
									<label class="col-bg-45 control-label" for="field-3">固定电话</label>
									<div class="col-bg-87">
										<div class="col-lg-4 col-md-4 col-xs-4">
											<input type="text" class="form-control" name="LCInsuredareaCall" id="LCInsuredareaCall" data-validate="required" placeholder="区号">
										</div>
										<div class="col-lg-4 col-md-4 col-xs-4">
											<input type="text" class="form-control" name="LCInsuredcall" id="LCInsuredcall" data-validate="required" placeholder="电话">
										</div>
								
									</div>
								</div>
									<div class="marginbottom15" style="width: 100%;float: left;padding-right: 15px;padding-left: 15px;">
									<label class="col-bg-45 control-label" for="field-3">联系地址</label>
									<div class="col-bg-87">
										<center>
											<div class="col-lg-3 col-md-3 col-xs-6">
												<select id="loc_province-sub3"  name="LCInsuredpostalProvince">
													<option value="">--请选择--</option>
												</select>
											</div>
											<div class="col-lg-3 col-md-3 col-xs-6">
												<select id="loc_city-sub3" name="LCInsuredpostalCity">
													<option value="">--请选择--</option>
												</select>
											</div>
											<div class="col-lg-3 col-md-3 col-xs-6">
												<select id="loc_town-sub3" name="LCInsuredpostalArea">
													<option value="">--请选择--</option>
												</select>
											</div>
											<div class="col-lg-3 col-md-3 col-xs-6">
												<input type="text" class="form-control" name="LCInsuredpostaladdress" id="LCInsuredpostaladdress" data-validate="required" placeholder="详细地址">
											</div>
										</center>
									</div>
								</div>
								<div class="marginbottom15" style="width: 100%;float: left;padding-right: 15px;padding-left: 15px;">
									<label class="col-bg-45 control-label" for="field-3">邮编地址</label>
									<div class="col-bg-87">
										<center>
											<div class="col-lg-3 col-md-3 col-xs-6">
												<select id="loc_province-sub4"  name="LCInsuredhomeProvince">
													<option value="">--请选择--</option>
												</select>
											</div>
											<div class="col-lg-3 col-md-3 col-xs-6">
												<select id="loc_city-sub4" name="LCInsuredhomeCity">
													<option value="">--请选择--</option>
												</select>
											</div>
											<div class="col-lg-3 col-md-3 col-xs-6">
												<select id="loc_town-sub4" name="LCInsuredhomeArea">
													<option value="">--请选择--</option>
												</select>
											</div>
											<div class="col-lg-3 col-md-3 col-xs-6">
												<input type="text" class="form-control" name="LCInsuredhomeaddress" id="LCInsuredhomeaddress" data-validate="required" placeholder="详细地址">
											</div>
										</center>
									</div>
								</div>
								<div class="marginbottom15" style="width: 100%;float: left;padding-right: 15px;padding-left: 15px;">
									<label class="col-bg-45 control-label" for="field-33"><span class="red">*</span>其他地址</label>
									<div class="col-bg-87">
										<center>
											<div class="col-lg-3 col-md-3 col-xs-6">
												<select id="loc_province-sub6" name="otherProvince">
													<option value="">--请选择--</option>
												</select>
											</div>
											<div class="col-lg-3 col-md-3 col-xs-6">
												<select id="loc_city-sub6" name="otherCity">
													<option value="">--请选择--</option>
												</select>
											</div>
											<div class="col-lg-3 col-md-3 col-xs-6">
												<select id="loc_town-sub6" name="otherArea">
													<option value="">--请选择--</option>
												</select>
											</div>
											<div class="col-lg-3 col-md-3 col-xs-6">
												<input type="text" class="form-control" name="otheraddress" id="otheraddress" data-validate="required" placeholder="详细地址">
											</div>
										</center>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-2 col-sm-offset-5">
										<button type="button" class="btn btn-primary save" id="save3">保存</button>
									</div>
								</div>
							</div>
						</div>
					</form>
					<!-- 被保人信息结束 -->
					
					<!-- 受益人信息 -->
					<form class="tab-pane with-bg section" id="fwv-4">
						
						<div class="row">
							<div class="form-group">
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">是否法定</label>
									<div class="col-sm-7">
										<select class="form-control" id="beneIsTrue" name="getForm">
											<option></option>
										  	<option value="N">非法定</option>
										  	<option value="Y">法定</option>
										</select>
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3"></label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="" id="" data-validate="" placeholder="" style="visibility: hidden;">
									</div>
								</div>
								<input type="hidden" name="proposalContNo2" id="proposalContNo2">	
								
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3"></label>
									<div class="col-sm-7">
									    <button type="button" class="btn btn-primary" onclick="addbenefer();" id="addbene">添加受益人</button>
									</div>
								</div>
							</div>
							
							<div id="beneferdiv"></div>
							
							<div class="form-group">
								<div class="col-sm-2 col-sm-offset-5">
									<button type="button" class="btn btn-primary save" id="save4">保存</button>
								</div>
							</div>
						</div>
						
					</form>
					<!-- 受益人信息结束 -->
					
					<!-- 税收信息 -->
				<form class="tab-pane with-bg section" id="fwv-5">
									
						<div class="row" style="color: gray">
										<h3 align="center">税收居民信息</h3>
							<div class="form-group">
							<input type="hidden" id="proposalcontno5" name="proposalcontno5" >
							<div class="marginbottom15" id="marginbottom15" style="width: 100%;float: left;padding-right: 15px;padding-left: 15px; margin-top: 20px" >
								
											
												<span >投保人声明:</span>&nbsp;&nbsp;&nbsp;
											
									
											
												&nbsp;&nbsp;&nbsp;<input type="radio" id="statement4" name="statement" value="1"/><span >1.仅为中国税收居民</span>
											
											
												&nbsp;&nbsp;&nbsp;  <input type="radio" id="statement2" name="statement" value="2"/><span >2.仅为非居民 </span>&nbsp;&nbsp;&nbsp;
											
										
												  <input type="radio" name="statement" id="statement3" value="3"/> <span >3.既是中国税收居民又是其他国家（地区）税收居民</span>
											

							</div>
							
							<div >
								
								&nbsp;&nbsp;&nbsp;<label >如在以上选项中勾选第2项或者第3项，请填写下列信息:</label>
							</div>
							<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
								<label class="col-sm-5 control-label" for="field-33">姓（英文或拼音）:</label>
								<div class="col-sm-7">
									<input type="text" name="firstname" id="firstname" style="width:250px;border:0; border-bottom:2px solid;" />
								</div>
							</div>
							
							<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
								<label class="col-sm-5 control-label" for="field-33">名（英文或拼音）:</label>
								<div class="col-sm-7">
									<input type="text" name="lastname" id="lastname" style="width:250px;border:0; border-bottom:2px solid ;" />
								</div>
							</div>
							<div style="margin: 5px 10px 5px 2px;">
								
								&nbsp;&nbsp;&nbsp;<label >  现居地址（中文）：<input type="checkbox" name="liveheath" value="1"/>&nbsp;同投保人居住地址:</label>
								<div class="marginbottom15" style="width: 100%;float: left;padding-right: 15px;padding-left: 15px;">
									<label class="col-bg-45 control-label" for="field-3">（英文或拼音）:</label>
									<div class="col-bg-87">
												<input type="text" name="living_isscountry" id="living_isscountry"  style="width:120px;border:0; border-bottom:2px solid ;" />
								
												（国家）<input type="text" name="living_province" id="living_province" style="width:120px;border:0; border-bottom:2px solid ;" />
										
											
										
												（省）<input type="text" name="living_city" id="living_city" style="width:120px;border:0; border-bottom:2px solid ;" />
											
												 （市）<input type="text" name="living_address" id="living_address" style="width:150px;border:0; border-bottom:2px solid ;" />
										
									</div>
								</div>
							</div>
							<br/>
						
					
						
						
							<div style="margin: 5px 10px 5px 2px;">
								
							&nbsp;&nbsp;&nbsp;<label >出生地（中文）: <input type="checkbox" name="tiveheath" value="1"/><span > 同投保人居住地址</label>
								<div class="marginbottom15" style="width: 100%;float: left;padding-right: 15px;padding-left: 15px;">
									<label class="col-bg-45 control-label" for="field-3">（中文）:</label>
									<div class="col-bg-87">
								
												<input type="text" name="cnnativeheath_isscountry" id="cnnativeheath_isscountry"  style="width:120px;border:0; border-bottom:2px solid ;" />
								
												（国家）<input type="text" name="cnnativeheath_province" id="cnnativeheath_province" style="width:120px;border:0; border-bottom:2px solid ;" />
												（省）<input type="text" name="cnnativeheath_city" id="cnnativeheath_city" style="width:120px;border:0; border-bottom:2px solid ;" />
											
												 （市）<input type="text" name="cnnativeheath_address" id="cnnativeheath_address" style="width:150px;border:0; border-bottom:2px solid ;" />（境外地址可不填此项）
										
									</div>
									<br>
								</div>
							</div>
						
							<div style="margin: 5px 10px 5px 2px;">
									<label class="col-bg-45 control-label" for="field-3">（英文或拼音）:</label>
									<div class="col-bg-87">
								
												<input type="text" name="ennativeheath_isscountry" id="ennativeheath_isscountry"  style="width:120px;border:0; border-bottom:2px solid ;" />
								
												（国家）<input type="text" name="ennativeheath_province" id="ennativeheath_province"   style="width:120px;border:0; border-bottom:2px solid ;" />
												（省）<input type="text" name="ennativeheath_city" id="ennativeheath_city"   style="width:120px;border:0; border-bottom:2px solid ;" />
											
												 （市）<input type="text" name="ennativeheath_address" id="ennativeheath_address"   style="width:150px;border:0; border-bottom:2px solid;" />
										
									</div>
							
							</div>
							<div>
							<br/>
					
								<div  style="margin-top: 100px">
									<table align="center" width="80%" border="1" style="text-align: center;border-top: none;" >
										<thead>
										
											 <tr height="30">
											  	<td>序号</td>
												<td >税收居民国（地区）</td>
												<td style="min-width: 200px">纳税识别号码（TIN）（如果您无法提供纳税识别号码，请详述原因）</td>
											 </tr>
										 </thead>
										 <tbody >
											<tr>
												<td>1</td>
												<td><input type="text" style="width:100%; height: 35px;text-align:center"  id="residentcountry0" name="residentcountry" ></td>
												<td><input type="text" style="width:100%; height: 35px;text-align:center"  id="residentnumber0" name="residentnumber" ></td>
											
											</tr>
												<tr>
												<td>2</td>
												<td><input type="text" style="width:100%; height: 35px;text-align:center"  id="residentcountry1" name="residentcountry" ></td>
												<td><input type="text" style="width:100%; height: 35px;text-align:center"  id="residentnumber1" name="residentnumber" ></td>
											
											</tr>
												<tr>
												<td>3</td>
												<td><input type="text" style="width:100%; height: 35px;text-align:center"  id="residentcountry2" name="residentcountry" ></td>
												<td><input type="text" style="width:100%; height: 35px;text-align:center"  id="residentnumber2" name="residentnumber" ></td>
											
											</tr>
										</tbody>
									</table>
		             
								</div>		
							</div>
						
						<div style="margin-top: 20px">
								
								&nbsp;&nbsp;&nbsp;<label >如不能提供居民国（地区）纳税人识别号，请选择原因：</label><br>
								&nbsp;
								<div class="col-sm-7">
										<select class="form-control" id="reason" name="getForm" >
											<option></option>
										  	<option value="1">居民国（地区）不发放纳税人识别号</option>
										  	<option value="2">账户持有人未能取得纳税人识别号，如选此项，请解释具体原因：</option>
										</select>
								</div><br>
								<!-- <label ><input type="checkbox" name="reason" value="1"/><span > 居民国（地区）不发放纳税人识别号</label><br>
								&nbsp;&nbsp;&nbsp;<label ><input type="checkbox" name="reason" value="2"/><span > 账户持有人未能取得纳税人识别号，如选此项，请解释具体原因：</label> -->
								<input type="text" name="reason2desc" id="reason2desc" style="width:543px;border:0; border-bottom:2px solid ; margin-left:15Px;margin-top:10px;" />
							</div>
							
						 <div class="col-sm-2" style="padding-top: 2%;margin-left:30%">
								<button type="button" class="btn btn-primary" id="save1" style="width:70%">保存</button>
							</div>
						
						

							</div>
						</div>	
					</form>
					<!-- 税收信息结束 -->
					
					
					
					<!-- 告知开始 -->
					<form class="tab-pane with-bg section" id="fwv-20">

								<table width="98%" align="center" class="FormTable">
									<caption>保单</caption>
									<tr>
										<td width="20%" align="left">&nbsp;投保单号码：<font
											color="red">(*必填)</font>
										</td>
										<td width="35%" align="left"><input name="contNo"
											readonly="readonly" id="contNo" ></td>
										<td width="15%"></td>
										<td width="35%"></td>
									</tr>
								</table>
								<br>
								<div id="fullImpart" style="display: ''">
									<table width="98%" align="center" class="ExtTable" style="border:1px solid #ccc;">
										<caption>告知信息</caption>

										<tr style="border:1px solid #ccc;">
											<td width="100%" align="left" colspan="4" >
												被保险人/投保人已拥有之保险（投保保障类产品时填写）Other policy owned by insuredyesorno (For full underwriting products)<br>
												如申请豁免保险费重大疾病保险，且投保人、被保险人非同一人，请投保人同时完成告知如申请豁免保险费重大疾病保险，且投保人、被保险人非同一人，请投保人同时完成告知</td>
										</tr>
										<tr style="border:1px solid #ccc;">
											<td width="5%" align="center" style="border:1px solid #ccc;">序号</td>
											<td width="75%" align="center" style="border:1px solid #ccc;">告知项</td>
											<td width="10%" align="center" style="border:1px solid #ccc;">投保人<br>insuredyesorno</td>
											<td width="10%" align="center" style="border:1px solid #ccc;">被保险人<br>insuredyesorno</td>
										</tr>
										<tr>
											<td width="5%" align="center" rowspan="2" style="border:1px solid #ccc;">1<input
												type="hidden" name="impartBeanList[28].impartNo" value="19" />
												<input type="hidden" name="impartBeanList[29].impartNo"
												value="19" /> <input type="hidden"
												name="impartBeanList[30].impartNo" value="19" /> <input
												type="hidden" name="impartBeanList[31].impartNo" value="19" />
												<input type="hidden" name="impartBeanList[32].impartNo"
												value="19" /> <input type="hidden"
												name="impartBeanList[33].impartNo" value="19" /> <input
												type="hidden" name="impartBeanList[34].impartNo" value="19" />
												<input type="hidden" name="impartBeanList[35].impartNo"
												value="19" /></td>
											<td width="75%" align="left" rowspan="2" style="border:1px solid #ccc;">
												是否已购买或正申请投保其他保险公司的人寿保险、意外保险、健康保险?若是，请详列<br> 
												Does insuredyesorno already have or is applying for other company’s life, accident or health insurance?<br> 
												公司名称：<input
												type="hidden" name="impartBeanList[28].impartcode"
												value="IA0028" /> <input type="text"
												name="impartBeanList[28].insuredyesornoimpart"
												style="width:80px;border:0; border-bottom:1px solid #ccc;" />
												投保日期：<input type="hidden"
												name="impartBeanList[29].impartcode" value="IA0029" /> <input
												type="text" name="impartBeanList[29].insuredyesornoimpart"
												style="width:80px;border:0; border-bottom:1px solid #ccc;" />
												<br> <input type="hidden"
												name="impartBeanList[30].impartcode" value="IA0030" /> <input
												type="checkbox"
												name="impartBeanList[30].insuredyesornoimpart">
												寿险总保额：<input type="hidden"
												name="impartBeanList[31].impartcode" value="IA0031" /> <input
												type="text" name="impartBeanList[31].insuredyesornoimpart"
												style="width:80px;border:0; border-bottom:1px solid #ccc;" />

												<input type="hidden" name="impartBeanList[32].impartcode"
												value="IA0032" /> <input type="checkbox"
												name="impartBeanList[32].insuredyesornoimpart">
												意外险总保额：<input type="hidden"
												name="impartBeanList[33].impartcode" value="IA0033" /> <input
												type="text" name="impartBeanList[33].insuredyesornoimpart"
												style="width:80px;border:0; border-bottom:1px solid #ccc;" />

												<input type="hidden" name="impartBeanList[34].impartcode"
												value="IA0034" /> <input type="checkbox"
												name="impartBeanList[34].insuredyesornoimpart">
												重大疾病总保额：<input type="hidden"
												name="impartBeanList[35].impartcode" value="IA0035" /> <input
												type="text" name="impartBeanList[35].insuredyesornoimpart"
												style="width:80px;border:0; border-bottom:1px solid #ccc;" />
											</td>
											<td width="10%" align="center"
												style="border-left:1px solid #ccc;" rowspan="2"></td>
											<td width="10%" align="center" style="border:1px solid #ccc;">B01</td>
										</tr>
										<tr>
											<td width="10%" align="center"><select
												name="impartBeanList[28].insuredyesorno" style="width:100%;">

													<option value="Y">是</option>
													<option value="N" selected="selected">否</option>
											</select></td>
										</tr>
										<tr>
											<td width="5%" align="center" rowspan="2" style="border:1px solid #ccc;">2<input
												type="hidden" name="impartBeanList[36].impartNo" value="20" />
												<input type="hidden" name="impartBeanList[37].impartNo"
												value="20" /> <input type="hidden"
												name="impartBeanList[38].impartNo" value="20" /></td>
											<td width="75%" align="left" rowspan="2" style="border:1px solid #ccc;">
												任何投保人为您投保的人寿保险、意外或健康保险是否曾被拒保、延迟承保、加费承保、部分保险责任限制或降低保额承保？若“是”，请说明<br>
												Have you ever had other insurance applications declined,
												postponed, accepted with extra premium or modified terms? If
												”Yes”, please complete<br> a.被保险人insuredyesorno： 保险品种Product
												Name <input type="hidden"
												name="impartBeanList[36].impartcode" value="IA0036" /> <input
												type="text" name="impartBeanList[36].insuredyesornoimpart"
												style="width:80px;border:0; border-bottom:1px solid #ccc;" />
												投保日期Application Date<input type="hidden"
												name="impartBeanList[37].impartcode" value="IA0037" /> <input
												type="text" name="impartBeanList[37].insuredyesornoimpart"
												style="width:80px;border:0; border-bottom:1px solid #ccc;" />
												原因Reason <input type="hidden"
												name="impartBeanList[38].impartcode" value="IA0038" /> <input
												type="text" name="impartBeanList[38].insuredyesornoimpart"
												style="width:80px;border:0; border-bottom:1px solid #ccc;" />
												<br> b.投保人Policy Owner： 保险品种Product Name<input
												type="text" name="impartBeanList[36].ownerimpart"
												style="width:80px;border:0; border-bottom:1px solid #ccc;" />
												投保日期Application Date<input type="text"
												name="impartBeanList[37].ownerimpart"
												style="width:80px;border:0; border-bottom:1px solid #ccc;" />
												原因Reason<input type="text"
												name="impartBeanList[38].ownerimpart"
												style="width:80px;border:0; border-bottom:1px solid #ccc;" />
											<td width="10%" align="center" colspan="2" style="border:1px solid #ccc;">B02</td>
										</tr>
										<tr>

											<td width="10%" align="center"
												style="border:1px solid #ccc;"><select
												name="impartBeanList[36].owneryesorno" style="width:100%;">

													<option value="Y">是</option>
													<option value="N" selected="selected">否</option>
											</select></td>
											<td width="10%" align="center" ><select
												name="impartBeanList[36].insuredyesorno" style="width:100%;">

													<option value="Y">是</option>
													<option value="N" selected="selected">否</option>
											</select></td>
										</tr>
										<tr>
											<td width="100%" align="left" colspan="4" style="border:1px solid #ccc;">
												被保险人/投保人情况告知（投保保障类产品时填写）Details of insuredyesorno/policy owner (For
												full underwriting products)<br>
												如投保的保险产品含有保险费豁免责任，且投保人、被保险人非同一人，请投保人同时完成告知<br></td>
										</tr>
										<tr>
											<td width="5%" align="center" style="border:1px solid #ccc;">序号</td>
											<td width="75%" align="center" colspan="3" style="border:1px solid #ccc;">告知项</td>

										</tr>
										<tr>
											<td width="5%" align="center" style="border:1px solid #ccc;">1<input type="hidden"
												name="impartBeanList[1].impartNo" value="1" /><input
												type="hidden" name="impartBeanList[2].impartNo" value="1" />
											</td>
											<td width="75%" align="left" clospan="2" style="border:1px solid #ccc;">a.被保险人身高
												insuredyesorno Height：<input type="hidden"
												name="impartBeanList[1].impartcode" value="IA0001" /> <input
												id="number" type="text"
												name="impartBeanList[1].insuredyesornoimpart"
												style="width:50px;border:0; border-bottom:1px solid #ccc;" />厘米cm&nbsp;&nbsp;
												b.被保险人体重 insuredyesorno Weight：<input type="hidden"
												name="impartBeanList[2].impartcode" value="IA0002" /> <input
												id="number1" type="text"
												name="impartBeanList[2].insuredyesornoimpart" class="input"
												style="width:50px;border:0; border-bottom:1px solid #ccc;" />公斤kg<br>
												c.投保人身高 Policy Owner Height：<input id="number2" type="text"
												name="impartBeanList[1].ownerimpart" class="input"
												style="width:50px;border:0; border-bottom:1px solid #ccc;" />厘米cm&nbsp;&nbsp;
												d.投保人体重Policy Owner Weight：<input id="number3" type="text"
												name="impartBeanList[2].ownerimpart" class="input"
												style="width:50px;border:0; border-bottom:1px solid #ccc;" />公斤kg
											</td>
											<td width="10%" align="center" style="border:1px solid #ccc;">投保人<br>Policyowner</td>
											<td width="10%" align="center" style="border:1px solid #ccc;">被保险人<br>insuredyesorno</td>
										</tr>
										<tr>
											<td width="5%" align="center" rowspan="2" style="border:1px solid #ccc;">2<input
												type="hidden" name="impartBeanList[3].impartNo" value="2" /><input
												type="hidden" name="impartBeanList[4].impartNo" value="2" />
											</td>
											<td width="75%" align="left" rowspan="2" style="border:1px solid #ccc;">
												您是否计划未来一年内前往国外定居或工作或自助旅游一个月以上？ 若“是”，请注明地区、时间。<br> Are
												you planning to reside or work abroad or travel for more
												than 30days within one year? If the answer is “YES”, please
												give a clear<br> indication of the area and time. <br>
												a.被保险人insuredyesorno：地区area<input type="hidden"
												name="impartBeanList[3].impartcode" value="IA0003" /> <input
												type="text" name="impartBeanList[3].insuredyesornoimpart"
												class="input"
												style="width:80px;border:0; border-bottom:1px solid #ccc;" />
												时间time<input type="hidden"
												name="impartBeanList[4].impartcode" value="IA0004" /> <input
												type="text" name="impartBeanList[4].insuredyesornoimpart"
												class="input"
												style="width:60px;border:0; border-bottom:1px solid #ccc;" />&nbsp;&nbsp;
												b.投保人Policy Owner：地区area<input type="text"
												name="impartBeanList[3].ownerimpart" class="input"
												style="width:80px;border:0; border-bottom:1px solid #ccc;" />&nbsp;
												时间time<input type="text"
												name="impartBeanList[4].ownerimpart" class="input"
												style="width:60px;border:0; border-bottom:1px solid #ccc;" />
											</td>

											<td width="10%" align="center" colspan="2" style="border:1px solid #ccc;">A01</td>
										</tr>
										<tr>
											<td width="10%" align="center"
												style="border:1px solid #ccc;"><select
												name="impartBeanList[3].owneryesorno" style="width:100%;">

													<option value="Y">是</option>
													<option value="N" selected="selected">否</option>
											</select></td>
											<td width="10%" align="center"><select
												name="impartBeanList[3].insuredyesorno" style="width:100%;">

													<option value="Y">是</option>
													<option value="N" selected="selected">否</option>
											</select></td>
										</tr>

										<tr style="background-color:;">
											<td width="5%" align="center" rowspan="2" style="border:1px solid #ccc;">3<input
												type="hidden" name="impartBeanList[5].impartNo" value="3" />
											</td>
											<td width="75%" align="left" rowspan="2" style="border:1px solid #ccc;">
												您是否正在或计划参加危险运动，如深度潜水（超过20米）、跳伞、攀岩、野外探险、打猎、赛车、赛马、冲浪等？<br>
												Are you planning to take part in risky activity, such as
												diving to a depth of over 20 meters, parachuting,
												mountaineering or rock k climbing,<br> exploration in
												field, hunting, motor-racing, horse racing, surfing<br>
												<input type="hidden" name="impartBeanList[5].impartcode"
												value="IA0005" /></td>

											<td width="10%" align="center" colspan="2">A02</td>
										</tr>
										<tr>
											<td width="10%" align="center"
												style="border:1px solid #ccc;"><select
												name="impartBeanList[5].owneryesorno" style="width:100%;">

													<option value="Y">是</option>
													<option value="N" selected="selected">否</option>
											</select></td>
											<td width="10%" align="center"><select
												name="impartBeanList[5].insuredyesorno" style="width:100%;">

													<option value="Y">是</option>
													<option value="N" selected="selected">否</option>
											</select></td>
										</tr>

										<tr>
											<td width="5%" align="center" rowspan="2" style="border:1px solid #ccc;">4<input
												type="hidden" name="impartBeanList[6].impartNo" value="4" />
											<td width="75%" align="left" rowspan="2" style="border:1px solid #ccc;">
												目前是否有失明、聋哑或言语、咀嚼、四肢机能障碍或缺损或畸形、智能障碍？<br> At present,
												does the insuredyesorno suffer for blindness, deaf-mute,
												dysfunction or impairment with dysphonia, dysmasesis,
												dyskinesia,<br> or abnormality, intellectual
												impairment?</td>
											<input type="hidden" name="impartBeanList[6].impartcode"
												value="IA0006" />
											<td width="10%" align="center" colspan="2">A04</td>
										</tr>
										<tr>

											<td width="10%" align="center"
												style="border:1px solid #ccc;"><select
												name="impartBeanList[6].owneryesorno" style="width:100%;">

													<option value="Y">是</option>
													<option value="N" selected="selected">否</option>
											</select></td>
											<td width="10%" align="center"><select
												name="impartBeanList[6].insuredyesorno" style="width:100%;">

													<option value="Y">是</option>
													<option value="N" selected="selected">否</option>
											</select></td>
										</tr>

										<tr>
											<td width="5%" align="center" rowspan="2" style="border:1px solid #ccc;">5<input
												type="hidden" name="impartBeanList[7].impartNo" value="5" /><input
												type="hidden" name="impartBeanList[8].impartNo" value="5" />
											</td>
											<td width="75%" align="left" rowspan="2" style="border:1px solid #ccc;">
												您是否有直系亲属因疾病在60岁前身故？若“是”，请列明具体人员和疾病：<br> Do you have any
												family history relevant in those your immediate family
												members died under age 60? If tick “Yes”, please give the
												detail<br> of the relationship and. <br>
												a.被保险人insuredyesorno：具体人员relationship<input type="hidden"
												name="impartBeanList[7].impartcode" value="IA0007" /> <input
												type="text" name="impartBeanList[7].insuredyesornoimpart"
												class="input"
												style="width:80px;border:0; border-bottom:1px solid #ccc;" />
												疾病the cause of death<input type="hidden"
												name="impartBeanList[8].impartcode" value="IA0008" /> <input
												type="text" name="impartBeanList[8].insuredyesornoimpart"
												class="input"
												style="width:80px;border:0; border-bottom:1px solid #ccc;" /><br>
												b.投保人Policy Owner：具体人员relationship <input type="text"
												name="impartBeanList[7].ownerimpart" class="input"
												style="width:80px;border:0; border-bottom:1px solid #ccc;" />
												疾病the cause of death <input type="text"
												name="impartBeanList[8].ownerimpart" class="input"
												style="width:80px;border:0; border-bottom:1px solid #ccc;" />
											</td>
											<td width="10%" align="center" colspan="2">A08</td>
										</tr>
										<tr>
											<td width="10%" align="center"
												style="border:1px solid #ccc;"><select
												name="impartBeanList[7].owneryesorno" style="width:100%;">

													<option value="Y">是</option>
													<option value="N" selected="selected">否</option>
											</select></td>
											<td width="10%" align="center"><select
												name="impartBeanList[7].insuredyesorno" style="width:100%;">

													<option value="Y">是</option>
													<option value="N" selected="selected">否</option>
											</select></td>
										</tr>


										<tr>
											<td width="5%" align="center" rowspan="2" style="border:1px solid #ccc;">6<input
												type="hidden" name="impartBeanList[9].impartNo" value="6" />
											</td>
											<td width="75%" align="left" rowspan="2" style="border:1px solid #ccc;">
												过去二年内是否曾因健康检查有异常而被建议接受其他检查或治疗或是否曾接到医生对您有关吸烟、饮酒的建议和告诫?<br>
												In the past 2 years, have you been suggested having other
												check-up or treatment, or received suggestion and advices
												from the doctor<br> about drinking and smoking, because
												of medical check-up anomaly? <input type="hidden"
												name="impartBeanList[9].impartcode" value="IA0009" /></td>
											<td width="10%" align="center" colspan="2">A09</td>
										</tr>
										<tr>

											<td width="10%" align="center"
												style="border:1px solid #ccc;"><select
												name="impartBeanList[9].owneryesorno" style="width:100%;">

													<option value="Y">是</option>
													<option value="N" selected="selected">否</option>
											</select></td>
											<td width="10%" align="center"><select
												name="impartBeanList[9].insuredyesorno" style="width:100%;">

													<option value="Y">是</option>
													<option value="N" selected="selected">否</option>
											</select></td>
										</tr>


										<tr>
											<td width="5%" align="center" rowspan="2" style="border:1px solid #ccc;">7<input
												type="hidden" name="impartBeanList[10].impartNo" value="7" />
											<td width="75%" align="left" rowspan="2" style="border:1px solid #ccc;">
												过去三个月内是否曾因受伤或生病接受医生治疗、诊疗或用药？<br> In the past 3 months,
												have you received diagnosis and treat or medicines because
												of illness or injury? <input type="hidden"
												name="impartBeanList[10].impartcode" value="IA0010" /></td>
											<td width="10%" align="center" colspan="2">A10</td>
										</tr>
										<tr>

											<td width="10%" align="center"
												style="border:1px solid #ccc;"><select
												name="impartBeanList[10].owneryesorno" style="width:100%;">

													<option value="Y">是</option>
													<option value="N" selected="selected">否</option>
											</select></td>
											<td width="10%" align="center"><select
												name="impartBeanList[10].insuredyesorno" style="width:100%;">

													<option value="Y">是</option>
													<option value="N" selected="selected">否</option>
											</select></td>
										</tr>

										<tr>
											<td width="5%" align="center" rowspan="2" style="border:1px solid #ccc;">8<input
												type="hidden" name="impartBeanList[11].impartNo" value="8" />
											</td>
											<td width="75%" align="left" rowspan="2" style="border:1px solid #ccc;">
												过去或现在是否患有下列“注一”之疾病，或曾因受伤或生病住院治疗七天以上？<br> In the past or
												at present, did/do you suffer from the diseases listed below
												as “Note 1”? Or have you been in hospital for more than 7
												days <br>because of illness or injury？ <input
												type="hidden" name="impartBeanList[11].impartcode"
												value="IA0011" /></td>
											<td width="10%" align="center" colspan="2">A12</td>
										</tr>
										<tr>

											<td width="10%" align="center"
												style="border:1px solid #ccc;"><select
												name="impartBeanList[11].owneryesorno" style="width:100%;">

													<option value="Y">是</option>
													<option value="N" selected="selected">否</option>
											</select></td>
											<td width="10%" align="center"><select
												name="impartBeanList[11].insuredyesorno" style="width:100%;">

													<option value="Y">是</option>
													<option value="N" selected="selected">否</option>
											</select></td>
										</tr>

										<tr>
											<td width="5%" align="center" rowspan="2" style="border:1px solid #ccc;">9<input
												type="hidden" name="impartBeanList[12].impartNo" value="9" />
											</td>
											<td width="75%" align="left" rowspan="2" style="border:1px solid #ccc;">
												过去一年内是否曾患有下列“注二”之疾病？<br> In the past year, did you
												suffer from the diseases listed below as “Note 2”?<br>
												<input type="hidden" name="impartBeanList[12].impartcode"
												value="IA0012" /></td>
											<td width="10%" align="center" colspan="2">A13</td>
										</tr>
										<tr>

											<td width="10%" align="center"
												style="border:1px solid #ccc;"><select
												name="impartBeanList[12].owneryesorno" style="width:100%;">

													<option value="Y">是</option>
													<option value="N" selected="selected">否</option>
											</select></td>
											<td width="10%" align="center"><select
												name="impartBeanList[12].insuredyesorno" style="width:100%;">

													<option value="Y">是</option>
													<option value="N" selected="selected">否</option>
											</select></td>
										</tr>

										<tr>
											<td width="5%" align="center" style="border:1px solid #ccc;">10</td>
											<td width="75%" align="left" colspan="2" style="border:1px solid #ccc;">
												被保险人投保年龄在≤12周岁时，且您申请购买住院补贴健康保险，请补充告知：<br> If the
												insuredyesorno is younger than age 12 and applies Hospital Income
												rider, please answer the following questions：</td>
											<td width="10%" align="center" style="border:1px solid #ccc;">被保险人<br>insuredyesorno</td>
										</tr>
										<tr>
											<td width="5%" align="center" rowspan="2" style="border:1px solid #ccc;">a<input
												type="hidden" name="impartBeanList[13].impartNo" value="10" />
											</td>
											<td width="75%" align="left" rowspan="2" colspan="2" style="border:1px solid #ccc;">
												被保险人出生时是否难产或早产或有窒息史、抢救史或置于保温箱史？<br> Was the insuredyesorno
												dystocia or premature delivery? Or did he (or she) have a
												history of asphyxia, emergency treatment or
												infant-incubation <br>when he (or she) was born?<br>
												<input type="hidden" name="impartBeanList[13].impartcode"
												value="IA0013" /></td>
											<td width="10%" align="center">A19</td>
										</tr>
										<tr>
											<td width="10%" align="center" style="border:1px solid #ccc;"><select
												name="impartBeanList[13].insuredyesorno" style="width:100%;">

													<option value="Y">是</option>
													<option value="N" selected="selected">否</option>
											</select></td>
										</tr>
										<tr>
											<td width="5%" align="center" rowspan="2" style="border:1px solid #ccc;">b<input
												type="hidden" name="impartBeanList[14].impartNo" value="11" />
											</td>
											<td width="75%" align="left" rowspan="2" colspan="2" style="border:1px solid #ccc;">
												被保险人是否被告知患有先天性疾病、遗传性疾病、先天性畸形或缺陷或曾因此接受治疗？<br> Does the
												insuredyesorno have congenital disease, genetic disease, congenital
												abnormalities or impairment? Or had he (or she) been treated
												due<br> to the above diseases?<br> <input
												type="hidden" name="impartBeanList[14].impartcode"
												value="IA0014" /></td>
											<td width="10%" align="center">A20</td>
										</tr>
										<tr>
											<td width="10%" align="center"><select
												name="impartBeanList[14].insuredyesorno" style="width:100%;">

													<option value="Y">是</option>
													<option value="N" selected="selected">否</option>
											</select></td>
										</tr>


										<tr id='healthPec' style="border:1px solid #ccc;">
											<td width="100%" align="left" colspan="4" name="impartcode"
												value="30">
												（注一）：高血压病、冠心病、心肌梗塞、心肌病变、心内膜炎、风湿性心脏病、先天性心脏病、主动脉血管瘤、心律失常、心脏瓣膜疾病(狭窄、闭锁不全、畸型)、短暂性脑缺血、脑中风、脑瘤、脑动脉血管瘤、癫痫、脑积水、脑炎、脑膜炎、老年痴呆（阿尔茨海默病）、肌肉萎缩、重症肌无力、多发性硬化症、运动神经元疾病（如进行性肌萎缩、肌萎缩性侧索硬化）、进行性球麻痹、震颤麻痹（帕金森氏）综合征、智能障碍、精神疾病、肺气肿、哮喘、支气管扩张症、尘肺、肺结核、肺栓塞、肝炎(除甲型、戊型)、肝硬化、肝功能异常、肝脾肿大、溃疡性结肠炎、克隆病、肾炎、肾病综合征、肾功能异常、尿毒症、视网膜出血或剥离、视神经病变、癌症、血友病、白血病、再生障碍性贫血、紫癜、糖尿病、类风湿性关节炎、肢端肥大症、垂体机能亢进或减退、甲状腺或甲状旁腺机能亢进或减退、硬皮病、红斑狼疮、混合结缔组织病、系统性硬化病、艾滋病或艾滋病毒携带者、未经证实为良性或恶性之肿瘤。<br>
												(Note 1): hypertension; coronary heart disease; myocardial
												infarction; myocardium pathological changes; endocarditic;
												rheumatic heart disease; congenital heart disease; aorta
												haemangioma; arrhythmia; heart valve disorders(stenosis,
												insufficiency, abnormality); transient cerebral ischemia;
												cerebral apoplexy; brain tumor; cerebral arterial
												haemangioma; epilepsy; hydrocephalus; encephalitis;
												meningitis; senile dementia (Alzheimer’s disease); muscular
												atrophy; multiple sclerosis motor neuron disease(for
												example, progressive muscular atrophy, amyotrophic lateral
												sclerosis); progressive bulbar paralysis; Parkinson’s
												disease; intellectual impairment; mental disorder;
												emphysema; asthma; bronchiectasis; pneumoconiosis; pulmonary
												tuberculosis; hepatitis (except hepatitis A, hepatitis E);
												cirrhosis; hepatic dysfunction; hepatosplenomegaly;
												ulcerative colitis; Crohn′s disease; nephritis; nephrotic
												syndrome; kidney dysfunction; uremia; retinal detachment;
												optic nerve disease; cancer; hemophilia; leukemia; aplastic
												anemia; purpura; diabetes mellitus; rheumatoid arthritis;
												acromegaly; hyperpituitarism or hypopituitarism;
												hyperthyroidism or hypothyroidism, hyperparathyroidism or
												hypoparathyroidism; scirrhosarca; lupus erythematosus; mixed
												connective tissue disease; systemic sclerosis; aids or aids
												virus carrier; un-identified tumor.<br></td>
										</tr>
										<tr style="border:1px solid #ccc;">
											<td width="100%" align="left" colspan="4"><input
												type="hidden" name="impartBeanList[15].impartNo" value="12" />
												（注二）：酒精或药物滥用成瘾、脊髓灰质炎、眩晕症、食道、胃、十二指肠溃疡或出血或穿孔、胰腺炎、肝炎病毒携带者、脂肪肝、肝脓肿、肝血管瘤、肝内结石、疝、慢性阑尾炎、痔疮或肛周疾病、痛风、慢性支气管炎、肺脓肿、青光眼、白内障、心肌炎、脑膜炎、梅尼尔氏症、中耳炎、鼻窦炎、鼻中隔弯曲、慢性扁桃体炎、肺炎、胸膜炎、气胸、胆结石、胆囊炎、息肉、便血、泌尿系统结石或炎症、蛋白尿(泡沫尿)、血尿、肾囊肿、盆腔炎、前列腺肥大、前列腺炎、性病、关节炎、椎间盘突出、坐骨神经痛、蚕豆病、贫血、静脉曲张、良性肿瘤(以下请女性被保险人回答)乳房疾病、子宫内膜异位症、阴道异常出血、子宫肌瘤、妊娠并发症、习惯性流产或其他生殖系统疾病或妇科检查异常、怀孕，若怀孕，请告知孕周。<br>
												(Note 2): alcohol or drug abuse; poliomyelitis; vertigo;
												esophageal, gastric or duodenal ulcer, bleeding or
												perforation; pancreatitis; hepatic virus carrier; fatty
												liver; liver abscess; hepatic haemangioma; intrahepatic
												stone; hernia; chronic appendicitis; hemorrhoid or anal
												diseases; gout; chronic bronchitis; lung abscess; glaucoma;
												cataract; myocarditis; meningitis; meniere's syndrome;
												otitis media; nasosinusitis; deviation of nasal septum;
												chronic tonsillitis; pneumonia; pleurisy; pneumothorax;
												gallstones; cholecystitis; polyp; haematochezia; urological
												system's lithiasis or urinary system inflammation;
												proteinuria (bubble-urine); haematuria; renal cyst; pelvic
												inflammatory disease; prostatic hypertrophy; prostatitis;
												STDS; arthritis; intervertebral disc herniation; sciatica;
												avism; anemia; varicose veins; benign tumor; (if the
												insurant is a female, please answer the following questions)
												breast diseases; endometriosis; vaginal bleeding;
												hysteromyoma; pregnancy complications; habitual abortion, or
												other reproductive system disease, or gynecologic exam
												anomaly; pregnant; if pregnant, please tell gestational
												weeks.<br> a.被保险人insuredyesorno：孕周gestational weeks<input
												type="hidden" name="impartBeanList[15].impartcode"
												value="IA0015" /><input type="text"
												name="impartBeanList[15].insuredyesornoimpart" class="input"
												style="width:100px;border:0; border-bottom:1px solid #ccc;" />
												b.投保人Policy Owner：孕周gestational weeks<input type="text"
												name="impartBeanList[15].ownerimpart" class="input"
												style="width:100px;border:0; border-bottom:1px solid #ccc;" />
											</td>
										</tr>
										<tr>
											<td width="100%" align="left" colspan="4" style="border:1px solid #ccc;"><input
												type="hidden" name="impartBeanList[16].impartNo" value="13" />
												<input type="hidden" name="impartBeanList[17].impartNo"
												value="13" /> <input type="hidden"
												name="impartBeanList[18].impartNo" value="13" /> <input
												type="hidden" name="impartBeanList[19].impartNo" value="13" />
												上述“被保险人告知”栏中若有回答为“是”者，请在本栏具体说明：If the answer is “Yes” for
												the above questions, please give the details as follows:<br>
												疾病名称Disease:<input type="hidden"
												name="impartBeanList[16].impartcode" value="IA0016" /> <input
												type="text" name="impartBeanList[16].insuredyesornoimpart"
												class="input"
												style="width:100px;border:0; border-bottom:1px solid #ccc;" />
												医院名称Name of the Hospital： <input type="hidden"
												name="impartBeanList[17].impartcode" value="IA0017" /> <input
												type="text" name="impartBeanList[17].insuredyesornoimpart"
												class="input"
												style="width:100px;border:0; border-bottom:1px solid #ccc;" /><br>
												患病时间Date of attack and diagnosis： <input type="hidden"
												name="impartBeanList[18].impartcode" value="IA0018" /> <input
												type="text" name="impartBeanList[18].insuredyesornoimpart"
												class="input"
												style="width:100px;border:0; border-bottom:1px solid #ccc;" />
												目前情况Present Condition： <input type="hidden"
												name="impartBeanList[19].impartcode" value="IA0019" /> <input
												type="text" name="impartBeanList[19].insuredyesornoimpart"
												class="input"
												style="width:100px;border:0; border-bottom:1px solid #ccc;" />
											</td>
										</tr>

										<tr>
											<td width="100%" align="left" colspan="4">

												上述“投保人告知”栏中若有回答为“是”者，请在本栏具体说明：If the answer is “Yes” for the
												above questions, please give the details as follows:<br>
												疾病名称Disease:<input type="text"
												name="impartBeanList[16].ownerimpart" class="input"
												style="width:100px;border:0; border-bottom:1px solid #ccc;" />
												医院名称Name of the Hospital：<input type="text"
												name="impartBeanList[17].ownerimpart" class="input"
												style="width:100px;border:0; border-bottom:1px solid #ccc;" /><br>
												患病时间Date of attack and diagnosis：<input type="text"
												name="impartBeanList[18].ownerimpart" class="input"
												style="width:100px;border:0; border-bottom:1px solid #ccc;" />
												目前情况Present Condition：<input type="text"
												name="impartBeanList[19].ownerimpart" class="input"
												style="width:100px;border:0; border-bottom:1px solid #ccc;" />
											</td>
										</tr>

									</table>
								</div>
								<div id="simpleImpart" style="display: 'none'">
									<table width="98%" align="center" class="ExtTable">
										<caption>告知信息</caption>
										<tr>
											<td width="100%" align="left" colspan="4" style="border:1px solid #ccc;">
												被保险人告知（投保投资类产品及金贷宝时填写）Details of insuredyesorno (For simple
												underwriting products)<br></td>
										</tr>
										<tr>
											<td width="5%" align="center" style="border:1px solid #ccc;">序号</td>
											<td width="75%" align="center" colspan="3" style="border:1px solid #ccc;">告知项</td>

										</tr>
										<tr>
											<td width="5%" align="center" rowspan="2" style="border:1px solid #ccc;">1<input
												type="hidden" name="impartBeanList[20].impartNo" value="14" />
												<input type="hidden" name="impartBeanList[21].impartNo"
												value="14" /> <input type="hidden"
												name="impartBeanList[22].impartNo" value="14" />
											</td>
											<td width="75%" align="left" rowspan="2" colspan="2" style="border:1px solid #ccc;">
												任何投保人为您投保的人寿保险、意外或健康保险是否曾被拒保、延迟承保、加费承保、部分保险责任限制或降低保额承保？<br>
												Have you ever had other insurance applications declined,
												postponed, accepted with extra premium or modified terms?<br>
												若“是”，请说明
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;保险品种：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;投保日期：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;原因：<br>
												If tick ”Yes”, please complete Product Name: <input
												type="hidden" name="impartBeanList[20].impartcode"
												value="IA0020" /> <input type="text"
												name="impartBeanList[20].insuredyesornoimpart" class="input"
												style="width:100px;border:0; border-bottom:1px solid #ccc;" />
												Application Date: <input type="hidden"
												name="impartBeanList[21].impartcode" value="IA0021" /> <input
												type="text" name="impartBeanList[21].insuredyesornoimpart"
												class="input"
												style="width:100px;border:0; border-bottom:1px solid #ccc;" />
												Reason: <input type="hidden"
												name="impartBeanList[22].impartcode" value="IA0022" /> <input
												type="text" name="impartBeanList[22].insuredyesornoimpart"
												class="input"
												style="width:100px;border:0; border-bottom:1px solid #ccc;" />
											</td>
											<td width="10%" align="center" style="border:1px solid #ccc;">B02</td>
										</tr>
										<tr style="border:1px solid #ccc;">
											<td width="10%" align="center"><select
												name="impartBeanList[21].insuredyesorno" style="width:100%;border:1px solid #ccc;">

													<option value="Y">是</option>
													<option value="N" selected="selected">否</option>
											</select></td>
										</tr>

										<tr>
											<td width="5%" align="center" rowspan="2" style="border:1px solid #ccc;">2 <input
												type="hidden" name="impartBeanList[23].impartNo" value="15" /><input
												type="hidden" name="impartBeanList[24].impartNo" value="15" />
											</td>
											<td width="75%" align="left" rowspan="2" colspan="2" style="border:1px solid #ccc;">
												您是否计划未来一年内前往国外定居或工作或自助旅游一个月以上？若“是”，请注明地区 <input
												type="hidden" name="impartBeanList[23].impartcode"
												value="IA0023" /> <input type="text"
												name="impartBeanList[23].insuredyesornoimpart" class="input"
												style="width:100px;border:0; border-bottom:1px solid #ccc;" />
												时间<input type="hidden" name="impartBeanList[24].impartcode"
												value="IA0024" /> <input type="text"
												name="impartBeanList[24].insuredyesornoimpart" class="input"
												style="width:100px;border:0; border-bottom:1px solid #ccc;" /><br>
												Have you ever had other insurance applications declined,
												postponed, accepted with extra premium or modified terms?<br>
												Are you planning to reside or work abroad or travel for more
												than 30days within one year? If the answer is “YES”, please
												give a clear indication of the area and time</td>
											<td width="10%" align="center" style="border:1px solid #ccc;">A01</td>
										</tr>
										<tr>
											<td width="10%" align="center" style="border:1px solid #ccc;"><select
												name="impartBeanList[23].insuredyesorno" style="width:100%;">

													<option value="Y">是</option>
													<option value="N" selected="selected">否</option>
											</select></td>
										</tr>

										<tr>
											<td width="5%" align="center" rowspan="2" style="border:1px solid #ccc;">3<input
												type="hidden" name="impartBeanList[25].impartNo" value="16" />
											</td>
											<td width="75%" align="left" rowspan="2" colspan="2" style="border:1px solid #ccc;">
												您是否正在或计划参加危险运动，如深度潜水（超过20米）、跳伞、攀岩、野外探险、打猎、赛车、赛马、冲浪等？<br>
												Are you planning to take part in risky activity, such as
												diving to a depth of over 20 meters, parachuting,
												mountaineering or rock climbing, exploration in field,
												hunting, motor-racing, horse racing, surfing <input
												type="hidden" name="impartBeanList[25].impartcode"
												value="IA0025" /></td>
											<td width="10%" align="center" style="border:1px solid #ccc;">A02</td>
										</tr>
										<tr style="border:1px solid #ccc;">
											<td width="10%" align="center"><select
												name="impartBeanList[25].insuredyesorno" style="width:100%;">
													<option value="Y">是</option>
													<option value="N" selected="selected">否</option>
											</select></td>
										</tr>

										<tr>
											<td width="5%" align="center" rowspan="2" style="border:1px solid #ccc;">4<input
												type="hidden" name="impartBeanList[26].impartNo" value="17" />
											</td>
											<td width="75%" align="left" rowspan="2" colspan="2" style="border:1px solid #ccc;">
												目前身体机能是否有失明、聋哑或言语、咀嚼、四肢机能障碍或缺损或畸形、智能障碍？<br> At present,
												does the insuredyesorno suffer for blindness, deaf-mute,
												dysfunction or impairment with dysphonia, dysmasesis,
												dyskinesia, or abnormality,intellectual impairment? <input
												type="hidden" name="impartBeanList[26].impartcode"
												value="IA0026" /></td>
											<td width="10%" align="center" style="border:1px solid #ccc;">A04</td>
										</tr>
										<tr style="border:1px solid #ccc;">
											<td width="10%" align="center"><select
												name="impartBeanList[26].insuredyesorno" style="width:100%;">

													<option value="Y">是</option>
													<option value="N" selected="selected">否</option>
											</select></td>
										</tr>

										<tr>
											<td width="5%" align="center" rowspan="2" style="border:1px solid #ccc;">5<input
												type="hidden" name="impartBeanList[27].impartNo" value="18" />
											</td>
											<td width="75%" align="left" rowspan="2" colspan="2">
												您是否曾住院10天以上或曾经患有下列疾病：重度高血压、心脏病（包括冠心病、心肌梗塞）、心律失常、糖尿病、慢性酒精中毒、慢性肝病、肾衰竭、脑中风、脑血管畸形、恶性肿瘤、帕金森病、精神疾患影响生活？<br>
												Have you been ever admitted in hospital for more than 10
												days or ever suffered below diseases; severe hypertension,
												heart disease(including coronary heart disease, heart
												attack),cardiac arrhythmia, diabetes, chronic alcoholism,
												chronic liver disease, kidney failure, stroke, cerebral
												vascular malformation, malignant tumor, Parkinson's disease,
												mental disease which influence daily activities? <input
												type="hidden" name="impartBeanList[27].impartcode"
												value="IA0027" /></td>
											<td width="10%" align="center" style="border:1px solid #ccc;">A12</td>
										</tr>
										<tr style="border:1px solid #ccc;">
											<td width="10%" align="center"><select
												name="impartBeanList[27].insuredyesorno" style="width:100%;">

													<option value="Y">是</option>
													<option value="N" selected="selected">否</option>
											</select></td>
										</tr>

									</table>
								</div>


								<table width="98%" align="center" class="ExtTable">
									<tr>
										<td width="100%" align="left" colspan="5" style="border:1px solid #ccc;"><input
											type="hidden" name="impartBeanList[39].impartcode"
											value="IA0039" /> FATCA告知事项 FATCA Details
											（请投保人告知您本人是否存在以下美国身份表征，如您本人符合以下任何一种情况，则请勾选“是”，如申请年金保险，请被保险人同时完成本项告知）
										</td>
									</tr>
									<tr>
										<td width="5%" align="center" style="border:1px solid #ccc;">序号</td>
										<td width="75%" align="center" colspan="4" style="border:1px solid #ccc;">告知项</td>
									</tr>
									<tr>
										<td width="5%" align="center" rowspan="3" style="border:1px solid #ccc;">1<input
											type="hidden" name="impartBeanList[39].impartNo" value="21" />
										<td width="65%" align="left" rowspan="3" colspan="2" style="border:1px solid #ccc;">
											1）本人持有美国护照或美国绿卡；I hold a US green card or US passport.
											2）本人是美国纳税人；I am a US tax payer. 3）本人的出生地是美国；My place of birth
											is the United States. 4）本人在美国有常住地址、联系地址、联系电话。I have
											residential address, mailing address and telephone numbers in
											the United States.</td>
										<td width="10%" align="center" style="border:1px solid #ccc;">投保人<br>Policyowner</td>
										<td width="10%" align="center" style="border:1px solid #ccc;">被保险人<br>insuredyesorno</td>
									</tr>
									<tr>
										<td width="10%" align="center"
											style="border:1px solid #ccc;"><select
											name="impartBeanList[39].owneryesorno" style="width:100%;">

												<option value="Y">是</option>
												<option value="N" selected="selected">否</option>
										</select></td>
										<td width="10%" align="center" style="border:1px solid #ccc;"><select
											name="impartBeanList[39].insuredyesorno" style="width:100%;">

												<option value="Y">是</option>
												<option value="N" selected="selected">否</option>
										</select></td>
									</tr>
								</table>
									<br>
                               <!--  <div class="col-sm-1">
												<button type="button" class="btn btn-primary back" id="back">返回</button>
												
								</div> -->
								    <div class="col-sm-1/">
										<button type="button" class="btn btn-primary back" id="save15">保存</button>
									</div>
								
								<input type="hidden" name=infoLength value='39'>
							</form>
					
					<!-- 告知结束 -->
					
					<form class="tab-pane with-bg section" id="fwv-7">
									
						<div class="row">
							<div class="form-group">
							
							 		
						<div  id="reportTable"> 
						<input type="hidden" name="proposalContNo3" id="proposalContNo3">
	     				 <table class="table table-striped table-hover" id="riskTable">
							
						
								  <thead>
								    <tr>
								      <th style="width: 200px">序号</th>
								      <th style="width: 200px">险种名称</th>
								      <th style="width: 200px">保费</th>
								      <th style="width: 200px">基本保险金额（1000）</th>
								      <th style="width: 200px">份数</th>
								      <th style="width: 200px">保险期间</th>
								      <th style="width: 200px">保险期间分类</th>
								      <th style="width: 200px">缴费期间</th>
								      <th style="width: 200px">缴费期间分类</th>
								      <th style="width: 200px">缴费方式</th>
								      <th style="width: 200px">年金/约定领取年龄</th>
								      <th style="width: 200px">年金领取方式</th>
								    </tr>
								  </thead>
								  <tbody>
								   			   	    <tr>
								    	  <td>1</td>
								    	<td>
								    	
						  					   <select class="form-control" id="riskcode" name="riskcode" onchange="selectLmrisk()" >
												<option></option>
						  					 </select>
								    	</td>
								    	
								    	<td>
								    		 <input type="text" name="prem" id="prem" class="form-control">
								    	</td>
								    	<td>
								    		 <input type="text" name="amnt" id="amnt" class="form-control">
								    	</td>
								    	<td>
								    		 <input type="text" name="mult" id="mult" class="form-control">
								    	</td>
								    	
								    	<td>
								    		 <select class="form-control"  id="insuyear" name="insuyear" >
												<option></option>
						  					 </select>
								    	</td>
								    	<td>
								    		 <select class="form-control" id="insuyearflag" name="insuyearflag" >
													<option></option>
						  					 </select>
								    	</td>
								    	<td>
								    		 <select class="form-control" id="payendyear" name="payendyear" >
													<option></option>
						  					 </select>
								    	</td>
								    	<td>
								    		 <select class="form-control" id="payendyearflag" name="payendyearflag" >
													<option></option>
						  					 </select>
								    	</td>
								    	<td>
								    		 <select class="form-control" id="payintv" name="payintv" >
													<option></option>
						  					 </select>
								    	</td>
								    	<td>
								    		  <input type="text" name="getage" id="getage" class="form-control">
								    	</td>
								    	<td>
								    		 <select class="form-control" id="getform" name="getform" >
													<option></option>
						  					 </select>
								    	</td>
								   </tr>
								    <tr>
								    	  <td>2</td>
								    	<td>
								    		 <select class="form-control" id="riskcode1" name="riskcode1" onchange="selectLmrisk1()" >
												<option></option>
						  					 </select>
								    	</td>
								    	
								    	<td>
								    		 <input type="text" name="prem1" id="prem1"  style="width: 200px" class="form-control">
								    	</td>
								    	<td>
								    		 <input type="text" name="amnt1" id="amnt1"  style="width: 200px" class="form-control">
								    	</td>
								    	<td>
								    		 <input type="text" name="mult1" id="mult1"  style="width: 200px" class="form-control">
								    	</td>
								    	
								    	<td>
								    		 <select class="form-control" id="insuyear1" name="insuyear1"  >
												<option></option>
						  					 </select>
								    	</td>
								    	<td>
								    		 <select class="form-control" id="insuyearflag1" name="insuyearflag1"   >
													<option></option>
						  					 </select>
								    	</td>
								    	<td>
								    		 <select class="form-control" id="payendyear1" name="payendyear1"  >
													<option></option>
						  					 </select>
								    	</td>
								    	<td>
								    		 <select class="form-control" id="payendyearflag1" name="payendyearflag1"  >
													<option></option>
						  					 </select>
								    	</td>
								    	<td>
								    		 <select class="form-control" id="payintv1" name="payintv1"  >
													<option></option>
						  					 </select>
								    	</td>
								    	<td>
								    		  <input type="text" name="getage1" id="getage1"   class="form-control" style="width: 200px">
								    	</td>
								    	<td>
								    		 <select class="form-control" id="getform1" name="getform1"  >
													<option></option>
						  					 </select>
								    	</td>
								   </tr>
								   	    <tr>
								    	  <td>3</td>
								    	<td>
								    		 <select class="form-control" id="riskcode2" name="riskcode2" onchange="selectLmrisk2()" >
												<option></option>
						  					 </select>
								    	</td>
								    	
								    	<td>
								    		 <input type="text" name="prem2" id="prem2" class="form-control" > 
								    	</td>
								    	<td>
								    		 <input type="text" name="amnt2" id="amnt2" class="form-control">
								    	</td>
								    	<td>
								    		 <input type="text" name="mult2" id="mult2" class="form-control">
								    	</td>
								    	
								    	<td>
								    		 <select class="form-control" id="insuyear2" name="insuyear2" >
												<option></option>
						  					 </select>
								    	</td>
								    	<td>
								    		 <select class="form-control" id="insuyearflag2" name="insuyearflag2" >
													<option></option>
						  					 </select>
								    	</td>
								    	<td>
								    		 <select class="form-control" id="payendyear2" name="payendyear2" >
													<option></option>
						  					 </select>
								    	</td>
								    	<td>
								    		 <select class="form-control" id="payendyearflag2" name="payendyearflag2" >
													<option></option>
						  					 </select>
								    	</td>
								    	<td>
								    		 <select class="form-control" id="payintv2" name="payintv2" >
													<option></option>
						  					 </select>
								    	</td>
								    	<td>
								    		  <input type="text" name="getage2" id="getage2" class="form-control">
								    	</td>
								    	<td>
								    		 <select class="form-control" id="getform2" name="getform2" >
													<option></option>
						  					 </select>
								    	</td>
								   </tr>
								   	    <tr>
								    	  <td>4</td>
								    	<td>
								    		 <select class="form-control" id="riskcode3" name="riskcode3" onchange="selectLmrisk3()">
												<option></option>
						  					 </select>
								    	</td>
								    	
								    	<td>
								    		 <input type="text" name="prem3" id="prem3" class="form-control">
								    	</td>
								    	<td>
								    		 <input type="text" name="amnt3" id="amnt3" class="form-control">
								    	</td>
								    	<td>
								    		 <input type="text" name="mult3" id="mult3" class="form-control">
								    	</td>
								    	
								    	<td>
								    		 <select class="form-control" id="insuyear3" name="insuyear3" >
												<option></option>
						  					 </select>
								    	</td>
								    	<td>
								    		 <select class="form-control" id="insuyearflag3" name="insuyearflag3" >
													<option></option>
						  					 </select>
								    	</td>
								    	<td>
								    		 <select class="form-control" id="payendyear3" name="payendyear3" >
													<option></option>
						  					 </select>
								    	</td>
								    	<td>
								    		 <select class="form-control" id="payendyearflag3" name="payendyearflag3" >
													<option></option>
						  					 </select>
								    	</td>
								    	<td>
								    		 <select class="form-control" id="payintv3" name="payintv3" >
													<option></option>
						  					 </select>
								    	</td>
								    	<td>
								    		  <input type="text" name="getage3" id="getage3" class="form-control">
								    	</td>
								    	<td>
								    		 <select class="form-control" id="getform3" name="getform3" >
													<option></option>
						  					 </select>
								    	</td>
								   </tr>
								   	    <tr>
								    	  <td>5</td>
								    	<td>
								    		 <select class="form-control" id="riskcode4" name="riskcode4" onchange="selectLmrisk4()">
												<option></option>
						  					 </select>
								    	</td>
								    	
								    	<td>
								    		 <input type="text" name="prem4" id="prem4" class="form-control">
								    	</td>
								    	<td>
								    		 <input type="text" name="amnt4" id="amnt4" class="form-control">
								    	</td>
								    	<td>
								    		 <input type="text" name="mult4" id="mult4" class="form-control">
								    	</td>
								    	
								    	<td>
								    		 <select class="form-control" id="insuyear4" name="insuyear4" >
												<option></option>
						  					 </select>
								    	</td>
								    	<td>
								    		 <select class="form-control" id="insuyearflag4" name="insuyearflag4" >
													<option></option>
						  					 </select>
								    	</td>
								    	<td>
								    		 <select class="form-control" id="payendyear4" name="payendyear4" >
													<option></option>
						  					 </select>
								    	</td>
								    	<td>
								    		 <select class="form-control" id="payendyearflag4" name="payendyearflag4" >
													<option></option>
						  					 </select>
								    	</td>
								    	<td>
								    		 <select class="form-control" id="payintv4" name="payintv4" >
													<option></option>
						  					 </select>
								    	</td>
								    	<td>
								    		  <input type="text" name="getage4" id="getage4" class="form-control">
								    	</td>
								    	<td>
								    		 <select class="form-control" id="getform4" name="getform4" >
													<option></option>
						  					 </select>
								    	</td>
								   </tr>
					
								  </tbody>
	     				 </table>
	     				 </div>	
	     				 <br>
	     				 <div  style="display:none" id="div">
							<table align="center" width="80%" border="1" style="text-align: center;border-top: none" id="acount">
										<thead>
										<tr>
										   <td align="left" style="border:0;" width="20%" id="one">	<button type="button"  style="width:15%" id="add">+</button></td>
										   <td style="border:0;"></td>
										   <td align="right" style="border:0;" width="20%">	<button type="button"  style="width:15%" id="del">—</button></td>
										 </tr>
										 <tr height="30">
										  	<td>序号</td>
											<td style="min-width: 200px">投资账户</td>
											<td>投资比例</td>
										 </tr>
										 </thead>
										 <tbody id="castAccount">
	
									</tbody>
										</table>
		                <table class="table table-hover" id="cusTable">
						</table>
							</div>
							
							
							
					
							
							
	     				 <div class="col-sm-2" style="padding-top: 2%;margin-left:30%">
								<button type="button" class="btn btn-primary" id="save5" style="width:70%">保存</button>
							</div>
						</div>
						</div>	 
					</form>
							<!-- 	<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3"></label>
									<div class="col-sm-7">
										<button type="button" class="btn btn-primary" onclick="additionalRisk();" id="additional">添加附加险</button>
									</div>
								</div>
							</div>
							
							<div id="sub-risk"></div>
							<div  style="display:none;" id="div">
							<div class="container">
								<button type="button" class="btn btn-info btn-xs" id="add">+</button>
								<button type="button" class="btn btn-info btn-xs" id="del">—</button>
							</div>
							
								
							
							<div class = "table-responsive">
								<table class="table table-bordered" id="acount">
									<thead>
										<tr>
											<th>序号</th>
											<th style="min-width: 200px">投资账户</th>
											<th>投资比例</th>
										</tr>
									</thead>
									<tbody id="castAccount">
	
									</tbody>
								</table>
							</div>
							</div>
							<div class="form-group">
								<div class="col-sm-2 col-sm-offset-5">
									<button type="button" class="btn btn-primary save" id="save5">保存</button>
								</div>
							</div> -->
							<!-- <div class="form-group">
								<div class="col-sm-2 col-sm-offset-5">
									<button type="button" class="btn btn-primary save" id="baofei">新单试算</button>
									<button type="button" class="btn btn-primary save" id="baofei">当日撤单</button>
								</div>
							</div>
							<table class="table table-hover" id="cusTable">
							<div class="col-sm-2" style="padding-top: 2%;margin-left:30%">
								<button type="button" class="btn btn-primary" id="save5" style="width:70%">保存</button>
							</div>
							<div class="col-sm-2" style="padding-top: 2%;margin-left:-5%">
								<button type="reset" class="btn btn-primary" id="shisuan" style="width:70%">新单试算</button>
							</div>
							<div class="col-sm-2" style="padding-top: 2%;margin-left:-5%">
								<button type="reset" class="btn btn-primary" id="chedan" style="width:70%">当日撤单</button>
							</div>
							
							--!>
						    </table>
							
				
					 
					

					<!-- 投保事项 -->
					<form class="tab-pane with-bg section" id="fwv-6">
						<div class="row">
							<div class="form-group">
								
						<!-- <div class="panel">

							<font>
								请确认投保单，产品说明书，投保提示书及其他投保所须资料已经完整提供，之后选择"双面打印"并请客户在相关文件上签字
							</font>
						   <p class="flip">请点击这里</p>
						</div> -->
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-6">延迟扣款时间</label>
									<div class="col-sm-7">
										<div class="input-group">
											<input type="text" name="DelayedDate"  id="DelayedDate" class="form-control datepicker" data-format="yyyy-mm-dd" readonly="readonly">
											<div class="input-group-addon">
												<a href="#"><i class="linecons-calendar"></i></a>
											</div>
										</div>
									</div>
								</div> 	
								<!--  
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-2"></label>
									<div class="col-sm-7">
										<button type="button" class="btn btn-primary" id="notify" style="width:70%">告知录入</button>
									</div>
								</div>	
								-->
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-2"></label>
									<div class="col-sm-7">
										<button type="button" class="btn btn-primary" id="save6" style="width:70%">试算</button>
									</div>
								</div>	
					
						
						
						
					<!-- 	<div class="panel1">

							<font>
								线上核保成功，请确认客户同意扣款保费
							</font>
						   <p class="flip1">请点击这里</p>
						</div>
						 -->

						
									<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-2"></label>
									<div class="col-sm-7">
										<button type="button" class="btn btn-primary" id="save7" style="width:70%">扣款</button>
									</div>
								</div>		
									
								 	
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-2"></label>
									<div class="col-sm-7">
										<button type="button" class="btn btn-primary" id="save9" style="width:70%">延迟扣款</button>
									</div>
								</div>	
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-2"></label>
									<div class="col-sm-7">
										<button type="button" class="btn btn-primary" id="save10" style="width:70%">投保单打印</button>
									</div>
								</div>	
							</div>
						</div>
					</form>
					<!-- 投保事项结束 -->
					<!-- Tabs Pager -->
					
					<ul class="pager wizard">
						<li class="previous">
							<a href="#"><i class="entypo-left-open"></i> Previous</a>
						</li>
						
						<li class="next">
							<a href="#" id="nextValidata">Next <i class="entypo-right-open"></i></a>
						</li>
					</ul>
					
				</div>
				
			</div>
		
			<%@ include file="../../../main/jsp/footer.jsp" %>
			<!--添加受益人-->
			<div style="display:none;" id="benefertpl">
				<div class="form-group panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title"></h4>
						<div class="panel-options">
							<a href="#" data-toggle="panel">
								<span class="collapse-icon">&ndash;</span>
								<span class="expand-icon">+</span>
							</a>
							<a href="javascript:void(0)" onclick="delbenefer(this);">
								&times;
							</a>
						</div>
					</div>
					<div class="panel-body">
						<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
							<label class="col-sm-5 control-label" for="field-3">受益人顺序</label>
							<div class="col-sm-7">
								<!-- <input type="text" class="form-control" id="beneSort"   data-validate="required" placeholder="受益人顺序"> -->
								<select class="form-control" id="beneSort" >
									<option></option>
								  	<option value="0">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
								</select>
							</div>
						</div>
						<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
							<label class="col-sm-5 control-label" for="field-3">受益人比例100%</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="benePart" data-validate="required" placeholder="受益人比例100%">
							</div>
						</div>
						<div class="col-bg-4 col-bg-0 marginbottom15">
							<label class="col-sm-5 control-label" for="field-3"></label>
							<div class="col-sm-7">
								<input type="text" class="form-control" data-validate="" placeholder="" style="visibility: hidden;">
							</div>
						</div>
						<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
							<label class="col-sm-5 control-label" for="field-3"><span class="red">*</span>姓名</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="beneName" data-validate="required" placeholder="姓名">
							</div>
						</div>
						 <div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
							<label class="col-sm-5 control-label" for="field-3"><span class="red">*</span>性别</label>
							<div class="col-sm-7">
								<select class="form-control" id="beneSex" >
									<option></option>
								  	<option value="0">男</option>
									<option value="1">女</option>
								</select>
							</div>
						</div> 
						
						<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
							<label class="col-sm-5 control-label" for="field-3"><span class="red">*</span>出生日期</label>
							<div class="col-sm-7">
								<div class="input-group">
									<input type="text"  id="beneBirth"  class="form-control datepicker" data-format="yyyy-mm-dd">
									<div class="input-group-addon">
										<a href="#"><i class="linecons-calendar"></i></a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
							<label class="col-sm-5 control-label" for="field-3"><span class="red">*</span>证件类型</label>
							<div class="col-sm-7">
								<select class="form-control" id="beneIdCard" >
									<option></option>
								</select>
							</div>
						</div>
						<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
							<label class="col-sm-5 control-label" for="field-3"><span class="red">*</span>证件号码</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="beneIdNumber"  data-validate="required" placeholder="证件号码">
							</div>
						</div>
						<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
							<label class="col-sm-5 control-label" for="field-3"><span class="red">*</span>与被保人的关系</label>
							<div class="col-sm-7">
								<select class="form-control" id="relationtoinsured"  >
									<option></option>
								</select>
							</div>
						</div> 
					
					
					</div>
				</div>
			</div>
			
			<!--添加附加险-->
			<div style="display:none;" id="sub-riskl">
				<div class="form-group panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title"></h4>
						<div class="panel-options">
							<a href="#" data-toggle="panel">
								<span class="collapse-icon">&ndash;</span>
								<span class="expand-icon">+</span>
							</a>
							<a href="javascript:void(0)" onclick="delbenefer(this);" >
								&times;
							</a>
						</div>
					</div>
						
						<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15" id="test">
									<label class="col-sm-5 control-label" for="fjriskcode">主险险种代码</label>
									<div class="col-sm-7">
										<select class="form-control" id="fjriskcode" onchange="selectLmrisk1()">
											<option></option>
										</select>
									</div>
								</div>
                        		
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">份数</label>
									<div class="col-sm-7">
										<input type="text" class="form-control"  id="fjmunt" data-validate="required" placeholder="份数">
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">主险险种保费(元)</label>
									<div class="col-sm-7">
										<input type="text" class="form-control"  id="fjprem" data-validate="required" placeholder="1000的整数倍">
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">主险险种保额(元)</label>
									<div class="col-sm-7">
										<input type="text" class="form-control"  id="fjamnt" data-validate="required" placeholder="0.00">
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">保险期间</label>
									<div class="col-sm-7">
										<select class="form-control" id="fjinsuyear" >
											<option></option>
										</select>
									</div>
								</div>
								
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">保险期间分类</label>
									<div class="col-sm-7">
										<select class="form-control" id="fjinsuyearflag" >
											<option></option>
										</select>
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">缴费期间 </label>
									<div class="col-sm-7">
										<select class="form-control" id="fjpayendyear" >
											<option></option>
										</select>
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">缴费期间分类</label>
									<div class="col-sm-7">
										<select class="form-control" id="fjpayendyearflag" >
											<option></option>
										</select>
									</div>
								</div>
							<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">缴费方式</label>
									<div class="col-sm-7">
										<select class="form-control" id="fjpayintv" >
											<option></option>
										</select>
									</div>
								</div>
							<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">年金/约定领取年龄</label>
									<div class="col-sm-7">
										<input type="text" class="form-control"  id="fjgetage" data-validate="required" placeholder="0.00">
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">年金领取方式</label>
									<div class="col-sm-7">
										<select class="form-control" id="fjgetform" >
											<option></option>
										</select>
									</div>
								</div>
					
					</div>					
				</div>
			</div>
			
		</div>
	</div>
	<!-- Imported styles on this page -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/include/js/multiselect/css/multi-select.css">
	
	<%@ include file="../../../main/jsp/bottom.jsp" %>
	
	<!-- Imported scripts on this page -->
	
	<script src="<%=request.getContextPath() %>/include/js/jquery-validate/jquery.validate.min.js"></script>
	<script src="<%=request.getContextPath() %>/include/js/inputmask/jquery.inputmask.bundle.js"></script>
	<script src="<%=request.getContextPath() %>/include/js/formwizard/jquery.bootstrap.wizard.min.js"></script>
	<script src="<%=request.getContextPath() %>/include/js/datepicker/bootstrap-datepicker.js"></script>
	<script src="<%=request.getContextPath() %>/include/js/multiselect/js/jquery.multi-select.js"></script>
	<script src="<%=request.getContextPath() %>/include/js/jquery-ui/jquery-ui.min.js"></script>
	<script src="<%=request.getContextPath() %>/include/js/selectboxit/jquery.selectBoxIt.min.js"></script>
	<script src="<%=request.getContextPath() %>/include/json/city.js" type="text/javascript" charset="utf-8"></script>
	<script src="<%=request.getContextPath() %>/include/json/area.js" type="text/javascript" charset="utf-8"></script>
    <script src="<%=request.getContextPath() %>/include/json/newarea.js" type="text/javascript" charset="utf-8"></script> 
	<script src="<%=request.getContextPath() %>/include/json/newlocation.js" type="text/javascript" charset="utf-8"></script>
	
	<script src="<%=request.getContextPath() %>/include/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath() %>/include/js/bootstrapValidator.js"></script>
	<script src="<%=request.getContextPath() %>/include/js/bootstrapValidator.min.js"></script>
	<script src="<%=request.getContextPath() %>/include/jquery/jquery.tips.js"></script>
	
	
	
	
	 <script src="<%=request.getContextPath() %>/application/newTestingCenter/newCont/res/js/partNewContEnter.js" type="text/javascript" charset="utf-8"></script> 
	<%-- <script src="<%=request.getContextPath() %>/application/newTestingCenter/newCont/res/js/test.js" type="text/javascript" charset="utf-8"></script> --%>
	
</body>
</html>