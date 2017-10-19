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
	
	<title>新案例录入</title>
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
							客户经理
							<span>1</span>
						</a>
					</li>
					<li>
						<a href="#fwv-2" data-toggle="tab">
							投保人信息
							<span>2</span>
						</a>
					</li>
					<li>
						<a href="#fwv-3" data-toggle="tab">
							被保人信息
							<span>3</span>
						</a>
					</li>
					<li>
						<a href="#fwv-4" data-toggle="tab">
							受益人
							<span>4</span>
						</a>
					</li>
					<li>
						<a href="#fwv-5" data-toggle="tab">
							产品信息
							<span>5</span>
						</a>
					</li>
					<li>
						<a href="#fwv-6" data-toggle="tab">
							投保事项
							<span>6</span>
						</a>
					</li>
				</ul>
				
				<div class="progress-indicator">
					<span></span>
				</div>
				
				<div class="tab-content no-margin">
					
					<!-- 客户经理 -->
					<form class="tab-pane with-bg section active" id="fwv-1">
						<div class="form-group">
							<label class="col-sm-2 control-label" for="field-1"><span class="red">*</span>客户经理代码</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="cusManaCode" id="cusManaCode" data-validate="required" placeholder="客户经理代码">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="field-2">客户经理姓名</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="manaName" id="manaName" data-validate="required" placeholder="客户经理姓名">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="field-3"><span class="red">*</span>投保单号码</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="contNum" id="contNum" data-validate="required" placeholder="投保单号码">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-2 col-sm-offset-5">
								<button type="button" class="btn btn-primary  save" id="save1">保存</button>
							</div>
						</div>
					</form>
					<!-- 客户经理结束 -->
					
					<!-- 投保人信息 -->
					<form class="tab-pane with-bg section" id="fwv-2">
						<div class="row">
							<div class="form-group">
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3"><span class="red">*</span>姓名</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="tBRName" id="tBRName" data-validate="required" placeholder="姓名">
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3"><span class="red">*</span>性别</label>
									<div class="col-sm-7">
										<select class="form-control" id="tBRSex" name="tBRSex">
											<option></option>
											<option value="0">男</option>
										  	<option value="1">女</option>
										  	<option value="2">未知</option>
										</select>
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">年龄</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="tBRAge" id="tBRAge" data-validate="required" placeholder="年龄">
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3"><span class="red">*</span>出生日期</label>
									<div class="col-sm-7">
										<div class="input-group">
											<input type="text" name="tBRBirth"  id="tBRBirth" class="form-control datepicker" data-format="yyyy-mm-dd">
											<div class="input-group-addon">
												<a href="#"><i class="linecons-calendar"></i></a>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3"><span class="red">*</span>证件类型</label>
									<div class="col-sm-7">
										<select class="form-control" id="tBRIdCard" name="tBRIdCard">
											<option></option>
										  	<option value="1">户口簿</option>
										  	<option value="2">临时身份证</option>
										  	<option value="3">第二代居民身份证</option>
										  	<option value="4">军官证</option>
										  	<option value="5">中国护照</option>
										  	<option value="6">第一代居民身份证</option>
										</select>
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3"><span class="red">*</span>证件号码</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="tBRIdNumber" id="tBRIdNumber" data-validate="required" placeholder="证件号码">
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3"><span class="red">*</span>证件长期有效</label>
									<div class="col-sm-7">
										<select class="form-control" id="tBRIdCardTrue" name="tBRIdCardTrue">
											<option></option>
											<option value="Y">是</option>
										  	<option value="N">否</option>
										</select>
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">证件有效起期</label>
									<div class="col-sm-7">
										<div class="input-group">
											<input type="text" name="tBRIdStartime"  id="tBRIdStartime"  class="form-control datepicker" data-format="yyyy-mm-dd">
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
											<input type="text" name="tBRIdEndtime"  id="tBRIdEndtime"  class="form-control datepicker" data-format="yyyy-mm-dd">
											<div class="input-group-addon">
												<a href="#"><i class="linecons-calendar"></i></a>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">国籍</label>
									<div class="col-sm-7">
										<select class="form-control"  id="tBRCountry" name="tBRCountry">  <!-- id="s2example-3"  -->
											<option></option>
											<option value="al">Albania</option>
											<option value="au">Australia</option>
											<option value="bd">Bandgladesh</option>
											<option value="br">Brasil</option>
											<option value="ca">Canada</option>
											<option value="cn">China</option>
											<option value="de">Germany</option>
											<option value="fr">France</option>
											<option value="gr">Greece</option>
											<option value="jp">Japan</option>
											<option value="xk">Kosovo</option>
											<option value="nl">Netherlands</option>
											<option value="no">Norway</option>
											<option value="ru">Russia</option>
											<option value="se">Sweden</option>
											<option value="tr">Turkey</option>
											<option value="uk">United Kingdom</option>
											<option value="us">United States</option>
										</select>
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">民族</label>
									<div class="col-sm-7">
										<select class="form-control" id="minzu" name="tBRNation">
											<option></option>
										</select>
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3"><span class="red">*</span>居民类型</label>
									<div class="col-sm-7">
										<select class="form-control" id="tBResType" name="tBResType">
											<option></option>
										  	<option value="T">农村</option>
										  	<option value="C">城镇</option>
										  	<option value="O">其他</option>
										</select>
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">身高(cm)</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="tBRHigh" id="tBRHigh" data-validate="required" placeholder="身高">
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">体重(kg)</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="tBRWeight" id="tBRWeight" data-validate="required" placeholder="体重">
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">婚姻状况</label>
									<div class="col-sm-7">
										<select class="form-control" id="tBRMarry" name="tBRMarry">
											<option></option>
											<option value="W">未婚</option>
											<option value="Y">已婚</option>
										  	<option value="S">丧偶</option>
										  	<option value="L">离婚</option>
										  	<option value="N">未说明</option>
										</select>
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">最高学历</label>
									<div class="col-sm-7">
										<select class="form-control" id="tBRHighEducation" name="tBRHighEducation">
											<option></option>
											<option value="L">高中及以下</option>
											<option value="Z">专科</option>
										  	<option value="B">本科</option>
										  	<option value="Y">研究生</option>										  	
										  	<option value="O">博士</option>										  	
										</select>
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">驾照类型</label>
									<div class="col-sm-7">
										<select class="form-control" id="tBRDriverType" name="tBRDriverType">
											<option></option>
										  	<option value="1">大型货车</option>
										  	<option value="2">大型客车</option>
										  	<option value="3">普通客车</option>
										  	<option value="4">普通轿车</option>
										  	<option value="5">小型货车</option>
										</select>
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">邮编</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="tbPost" id="tbPost" data-validate="required" placeholder="邮编">
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">工作单位</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="tBRWorkAddr" id="tBRWorkAddr" data-validate="required" placeholder="工作单位">
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3"><span class="red">*</span>职业代码</label>
									<div class="col-sm-7">
										<select class="form-control" id="tBRWorkNo" name="tBRWorkNo">
											<option></option>
										  	<option value="1">事业单位负责人</option>
										  	<option value="2">国家公务员</option>
										  	<option value="3">国家公务员及企事业单位</option>
										  	<option value="4">负责人</option>
										  	<option value="5">科学研究人员</option>
										  	<option value="6">专业技术人员</option>
										  	<option value="7">企业负责人</option>
										</select>
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">E-mail</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="tBemail" id="tBemail" data-validate="email" placeholder="请输入E-mail">
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">个人年收入(万元)</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="tBRGrYearIn" id="tBRGrYearIn" data-validate="required" placeholder="0.00">
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">家庭年收入(万元)</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="tBRJtYearIn" id="tBRJtYearIn" data-validate="required" placeholder="0.00">
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">移动电话</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="tBphone" id="tBphone" data-validate="number" placeholder="phonenumber">
									</div>
								</div>
								<div class="marginbottom15" style="width: 100%;float: left;padding-right: 15px;padding-left: 15px;">
									<label class="col-bg-45 control-label" for="field-3">固定电话</label>
									<div class="col-bg-87">
										<div class="col-lg-4 col-md-4 col-xs-4">
											<input type="text" class="form-control" name="areaCall" id="areaCall" data-validate="required" placeholder="区号">
										</div>
										<div class="col-lg-4 col-md-4 col-xs-4">
											<input type="text" class="form-control" name="call" id="call" data-validate="required" placeholder="电话">
										</div>
										<div class="col-lg-4 col-md-4 col-xs-4">
											<input type="text" class="form-control" name="partCall" id="partCall" data-validate="required" placeholder="分机号">
										</div>
									</div>
								</div>
								<div class="marginbottom15" style="width: 100%;float: left;padding-right: 15px;padding-left: 15px;">
									<label class="col-bg-45 control-label" for="field-3">联系地址</label>
									<div class="col-bg-87">
										<center>
											<div class="col-lg-3 col-md-3 col-xs-6">
												<select id="loc_province-sub1" name="tBRAddProvince"></select>
											</div>
											<div class="col-lg-3 col-md-3 col-xs-6">
												<select id="loc_city-sub1" name="tBRAddCity"></select>
											</div>
											<div class="col-lg-3 col-md-3 col-xs-6">
												<select id="loc_town-sub1" name="tBRAddArea"></select>
											</div>
											<div class="col-lg-3 col-md-3 col-xs-6">
												<input type="text" class="form-control" name="tBRDetailAddr" id="tBRDetailAddr" data-validate="required" placeholder="详细地址">
											</div>
										</center>
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">投保人领款账号</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="tBRGetNo" id="tBRGetNo" data-validate="required" placeholder="投保人领款账号">
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">风险评估</label>
									<div class="col-sm-7">
										<select class="form-control" id="tBRiskAssess" name="tBRiskAssess">
											<option></option>
										  	<option value="Y">未通过</option>
										  	<option value="N">通过</option>
										</select>
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">风险等级</label>
									<div class="col-sm-7">
										<select class="form-control" id="tBRiskType" name="tBRiskType">
											<option></option>
										  	<option value="3">三级</option>
										  	<option value="2">二级</option>
										  	<option value="1">一级</option>
										</select>
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
					<form class="tab-pane with-bg section" id="fwv-3">
						<div class="row">
							<div class="form-group">
								<div style="width: 100%;float: left;">
									<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
										<label class="col-sm-5 control-label" for="field-3">与投保人关系</label>
										<div class="col-sm-7">
											<select class="form-control" id="tbRelation" name="tbRelation">
												<option></option>
											  	<option value="Y">非本人</option>
											  	<option value="N">本人</option>
											</select>
										</div>
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3"><span class="red">*</span>姓名</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="bBRName" id="bBRName" data-validate="required" placeholder="姓名">
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3"><span class="red">*</span>性别</label>
									<div class="col-sm-7">
										<select class="form-control" id="bBRSex" name="bBRSex">
											<option></option>
											<option value="0">男</option>
										  	<option value="1">女</option>
										  	<option value="2">未知</option>
										</select>
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">年龄</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="bBRAge" id="bBRAge" data-validate="required" placeholder="年龄">
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3"><span class="red">*</span>出生日期</label>
									<div class="col-sm-7">
										<div class="input-group">
											<input type="text" name="bBRBirth"  id="bBRBirth" class="form-control datepicker" data-format="yyyy-mm-dd">
											<div class="input-group-addon">
												<a href="#"><i class="linecons-calendar"></i></a>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3"><span class="red">*</span>证件类型</label>
									<div class="col-sm-7">
										<select class="form-control" id="bBRIdCard" name="bBRIdCard">
											<option></option>
										  	<option value="1">户口簿</option>
										  	<option value="2">临时身份证</option>
										  	<option value="3">第二代居民身份证</option>
										  	<option value="4">军官证</option>
										  	<option value="5">中国护照</option>
										  	<option value="6">第一代居民身份证</option>
										</select>
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3"><span class="red">*</span>证件号码</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="bBRIdNumber" id="bBRIdNumber" data-validate="required" placeholder="证件号码">
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3"><span class="red">*</span>证件长期有效</label>
									<div class="col-sm-7">
										<select class="form-control" id="bBRIdCardTrue" name="bBRIdCardTrue">
											<option></option>
											<option value="Y">是</option>
										  	<option value="N">否</option>									  	
										</select>
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">证件有效起期</label>
									<div class="col-sm-7">
										<div class="input-group">
											<input type="text" name="bBRIdStartime" id="bBRIdStartime" class="form-control datepicker" data-format="yyyy-mm-dd">
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
											<input type="text" name="bBRIdEndtime" id="bBRIdEndtime"  class="form-control datepicker" data-format="yyyy-mm-dd">
											<div class="input-group-addon">
												<a href="#"><i class="linecons-calendar"></i></a>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">国籍</label>
									<div class="col-sm-7">
										<select class="form-control" id="bBRCountry" name="bBRCountry">
											<option></option>
											<option value="al">Albania</option>
											<option value="au">Australia</option>
											<option value="bd">Bandgladesh</option>
											<option value="br">Brasil</option>
											<option value="ca">Canada</option>
											<option value="cn">China</option>
											<option value="de">Germany</option>
											<option value="fr">France</option>
											<option value="gr">Greece</option>
											<option value="jp">Japan</option>
											<option value="xk">Kosovo</option>
											<option value="nl">Netherlands</option>
											<option value="no">Norway</option>
											<option value="ru">Russia</option>
											<option value="se">Sweden</option>
											<option value="tr">Turkey</option>
											<option value="uk">United Kingdom</option>
											<option value="us">United States</option>
										</select>
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">民族</label>
									<div class="col-sm-7">
										<select class="form-control" id="minzu1" name="bBRNation">
											<option></option>
										</select>
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3"><span class="red">*</span>居民类型</label>
									<div class="col-sm-7">
										<select class="form-control" id="bBResType" name="bBResType">
											<option></option>										  	
										  	<option value="T">农村</option>
										  	<option value="C">城镇</option>
										  	<option value="O">其他</option>
										</select>
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">身高(cm)</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="bBRHigh" id="bBRHigh" data-validate="required" placeholder="身高">
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">体重(kg)</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="bBRWeight" id="bBRWeight" data-validate="required" placeholder="体重">
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">婚姻状况</label>
									<div class="col-sm-7">
										<select class="form-control" id="bBRMarry" name="bBRMarry">
											<option></option>
										  	<option value="W">未婚</option>
											<option value="Y">已婚</option>
										  	<option value="S">丧偶</option>
										  	<option value="L">离婚</option>
										  	<option value="N">未说明</option>
										</select>
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">最高学历</label>
									<div class="col-sm-7">
										<select class="form-control" id="bBRHighEducation" name="bBRHighEducation">
											<option></option>
										  	<option value="L">高中及以下</option>
											<option value="Z">专科</option>
										  	<option value="B">本科</option>
										  	<option value="Y">研究生</option>										  	
										  	<option value="O">博士</option>	
										</select>
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">驾照类型</label>
									<div class="col-sm-7">
										<select class="form-control" id="bBRDriverType" name="bBRDriverType">
											<option></option>
										  	<option value="1">大型货车</option>
										  	<option value="2">大型客车</option>
										  	<option value="3">普通客车</option>
										  	<option value="4">普通轿车</option>
										  	<option value="5">小型货车</option>
										</select>
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">邮编</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="bbPost" id="bbPost" data-validate="required" placeholder="邮编">
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">工作单位</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="bBRWorkAddr" id="bBRWorkAddr" data-validate="required" placeholder="工作单位">
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3"><span class="red">*</span>职业代码</label>
									<div class="col-sm-7">
										<select class="form-control" id="bBRWorkNo" name="bBRWorkNo">
											<option></option>
										  	<option value="1">事业单位负责人</option>
										  	<option value="2">国家公务员</option>
										  	<option value="3">国家公务员及企事业单位</option>
										  	<option value="4">负责人</option>
										  	<option value="5">科学研究人员</option>
										  	<option value="6">专业技术人员</option>
										  	<option value="7">企业负责人</option>
										</select>
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">E-mail</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="bBemail" id="bBemail" data-validate="email" placeholder="请输入E-mail">
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">个人年收入(万元)</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="bBRGrYearIn" id="bBRGrYearIn" data-validate="required" placeholder="0.00">
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">家庭年收入(万元)</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="bBRJtYearIn" id="bBRJtYearIn" data-validate="required" placeholder="0.00">
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">移动电话</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="bBphone" id="bBphone" data-validate="number" placeholder="phonenumber">
									</div>
								</div>
								<div class="marginbottom15" style="width: 100%;float: left;padding-right: 15px;padding-left: 15px;">
									<label class="col-bg-45 control-label" for="field-3">固定电话</label>
									<div class="col-bg-87">
										<div class="col-lg-4 col-md-4 col-xs-4">
											<input type="text" class="form-control" name="bBareaCall" id="bBareaCall" data-validate="required" placeholder="区号">
										</div>
										<div class="col-lg-4 col-md-4 col-xs-4">
											<input type="text" class="form-control" name="bBcall" id="bBcall" data-validate="required" placeholder="电话">
										</div>
										<div class="col-lg-4 col-md-4 col-xs-4">
											<input type="text" class="form-control" name="bBpartCall" id="bBpartCall" data-validate="required" placeholder="分机号">
										</div>
									</div>
								</div>
								<div class="marginbottom15" style="width: 100%;float: left;padding-right: 15px;padding-left: 15px;">
									<label class="col-bg-45 control-label" for="field-3">联系地址</label>
									<div class="col-bg-87">
										<center>
											<div class="col-lg-3 col-md-3 col-xs-6">
												<select id="loc_province-sub2"  name="bBRAddProvince"></select>
											</div>
											<div class="col-lg-3 col-md-3 col-xs-6">
												<select id="loc_city-sub2" name="bBRAddCity"></select>
											</div>
											<div class="col-lg-3 col-md-3 col-xs-6">
												<select id="loc_town-sub2" name="bBRAddArea"></select>
											</div>
											<div class="col-lg-3 col-md-3 col-xs-6">
												<input type="text" class="form-control" name="bBRDetailAddr" id="bBRDetailAddr" data-validate="required" placeholder="详细地址">
											</div>
										</center>
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">被保人领款账号</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="bBRGetNo" id="bBRGetNo" data-validate="required" placeholder="被保人领款账号">
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">健康告知</label>
									<div class="col-sm-7">
										<select class="form-control" id="bBRHealthShow" name="bBRHealthShow">
											<option></option>
										  	<option value="N">未告知</option>
										  	<option value="Y">已告知</option>
										</select>
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">职业告知</label>
									<div class="col-sm-7">
										<select class="form-control" id="bBRWorkShow" name="bBRWorkShow">
											<option></option>
										  	<option value="N">未告知</option>
										  	<option value="Y">已告知</option>
										</select>
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
										<select class="form-control" id="beneIsTrue">
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
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3"></label>
									<div class="col-sm-7">
									    <button type="button" class="btn btn-primary" onclick="addbenefer();">添加受益人</button>
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
					
					<!-- 产品信息 -->
					<form class="tab-pane with-bg section" id="fwv-5">
									
						<div class="row">
							<div class="form-group">
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">主险险种名称</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="insuredName" id="mainInsuredName" data-validate="required" placeholder="主险险种名称">
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">份数</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="number" id="mainnumber" data-validate="required" placeholder="份数">
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">主险险种保费(元)</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="insuredPay" id="mainInsuredPay" data-validate="required" placeholder="0.00">
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">主险险种保额(元)</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="insuredGet" id="mainInsuredGet" data-validate="required" placeholder="0.00">
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">缴费方式</label>
									<div class="col-sm-7">
										<select class="form-control" id="mainpayType" name="payType">
											<option></option>
										  	<option value="Y">年缴</option>
										  	<option value="M">月缴</option>
										  	<option value="O">趸缴</option>
										</select>
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">缴费年期类型</label>
									<div class="col-sm-7">
										<select class="form-control" id="mainpayYearType" name="payYearType">
											<option></option>
										  	<option value="Y">年缴</option>
										  	<option value="M">月缴</option>
										  	<option value="O">趸缴</option>
										</select>
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">缴费年期</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="payYear" id="mainpayYear" data-validate="required" placeholder="缴费年期">
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">保险年期类型</label>
									<div class="col-sm-7">
										<select class="form-control" id="mainInsureYearType" name="insureYearType">
											<option></option>
										  	<option value="Z">保至终生</option>
										  	<option value="M">保至某确定年龄</option>
										</select>
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">保险年期</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="insureYear" id="maininsureYear" data-validate="required" placeholder="保险年期">
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3"></label>
									<div class="col-sm-7">
										<button type="button" class="btn btn-primary" onclick="additionalRisk();">添加附加险</button>
									</div>
								</div>
							</div>
							
							<div id="sub-risk"></div>
							
							<div class="form-group">
								<div class="col-sm-2 col-sm-offset-5">
									<button type="button" class="btn btn-primary save" id="save5">保存</button>
								</div>
							</div>
						</div>	
					</form>
					<!-- 产品信息结束 -->
					
					<!-- 投保事项 -->
					<form class="tab-pane with-bg section" id="fwv-6">
						<div class="row">
							<div class="form-group">
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">红利领取方式</label>
									<div class="col-sm-7">
										<select class="form-control" id="diviGetType" name="diviGetType">
											<option></option>
										  	<option value="1">1</option>
										  	<option value="2">2</option>
										  	<option value="3">3</option>
										  	<option value="4">4</option>
										  	<option value="5">5</option>
										</select>
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">保单递送方式</label>
									<div class="col-sm-7">
										<select class="form-control" id="contDeliverType" name="contDeliverType">
											<option></option>
										  	<option value="1">1</option>
										  	<option value="2">2</option>
										  	<option value="3">3</option>
										  	<option value="4">4</option>
										  	<option value="5">5</option>
										</select>
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">首期缴费形式</label>
									<div class="col-sm-7">
										<select class="form-control" id="firstPayType" name="firstPayType">
											<option></option>
										  	<option value="1">1</option>
										  	<option value="2">2</option>
										  	<option value="3">3</option>
										  	<option value="4">4</option>
										  	<option value="5">5</option>
										</select>
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">续费交费形式</label>
									<div class="col-sm-7">
										<select class="form-control" id="afterPayType" name="afterPayType">
											<option></option>
										  	<option value="1">1</option>
										  	<option value="2">2</option>
										  	<option value="3">3</option>
										  	<option value="4">4</option>
										  	<option value="5">5</option>
										</select>
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">续期账号</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="afterNo" id="afterNo" data-validate="required" placeholder="续期账号">
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">缴费账号</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="payNo" id="payNo" data-validate="required" placeholder="续费账号">
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">贷款合同号</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="loanContNo" id="loanContNo" data-validate="required" placeholder="贷款合同号">
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">贷款金额(元)</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="loanMoney" id="loanMoney" data-validate="required" placeholder="0.00">
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">贷款凭证号</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" name="loanPingNo" id="loanPingNo" data-validate="required" placeholder="贷款凭证号">
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">放款日期</label>
									<div class="col-sm-7">
										<div class="input-group">
											<input type="text" name="loanGoTime" id="loanGoTime"  class="form-control datepicker" data-format="yyyy-mm-dd">
											<div class="input-group-addon">
												<a href="#"><i class="linecons-calendar"></i></a>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">货款起期</label>
									<div class="col-sm-7">
										<div class="input-group">
											<input type="text" name="loanStartTime"  id="loanStartTime" class="form-control datepicker" data-format="yyyy-mm-dd">
											<div class="input-group-addon">
												<a href="#"><i class="linecons-calendar"></i></a>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
									<label class="col-sm-5 control-label" for="field-3">货款止期</label>
									<div class="col-sm-7">
										<div class="input-group">
											<input type="text" name="loanEndTime" id="loanEndTime"  class="form-control datepicker" data-format="yyyy-mm-dd">
											<div class="input-group-addon">
												<a href="#"><i class="linecons-calendar"></i></a>
											</div>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-2 col-sm-offset-5">
										<button type="button" class="btn btn-primary" id="save6">保存为案例</button>
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
							<a href="#">Next <i class="entypo-right-open"></i></a>
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
								<input type="text" class="form-control" id="beneSort" data-validate="required" placeholder="受益人顺序">
							</div>
						</div>
						<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
							<label class="col-sm-5 control-label" for="field-3">受益人比例</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="benePart" data-validate="required" placeholder="受益人比例">
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
									<option value="2">未知</option>
								</select>
							</div>
						</div>
						<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
							<label class="col-sm-5 control-label" for="field-3">年龄</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="beneAge"  data-validate="required" placeholder="年龄">
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
								  	<option value="1">户口簿</option>
									<option value="2">临时身份证</option>
									<option value="3">第二代居民身份证</option>
									<option value="4">军官证</option>
									<option value="5">中国护照</option>
									<option value="6">第一代居民身份证</option>
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
							<label class="col-sm-5 control-label" for="field-3"><span class="red">*</span>证件长期有效</label>
							<div class="col-sm-7">
								<select class="form-control" id="beneIdCardTrue" >
									<option></option>
								  	<option value="Y">是</option>
									<option value="N">否</option>
								</select>
							</div>
						</div>
						<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
							<label class="col-sm-5 control-label" for="field-3">证件有效起期</label>
							<div class="col-sm-7">
								<div class="input-group">
									<input type="text"  id="beneIdStartime" class="form-control datepicker" data-format="yyyy-mm-dd">
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
									<input type="text"  id="beneIdEndtime"  class="form-control datepicker" data-format="yyyy-mm-dd">
									<div class="input-group-addon">
										<a href="#"><i class="linecons-calendar"></i></a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
							<label class="col-sm-5 control-label" for="field-3">国籍</label>
							<div class="col-sm-7">
								<select class="form-control" id="beneCountry" >
									<option></option>
									<option value="al">Albania</option>
									<option value="au">Australia</option>
									<option value="bd">Bandgladesh</option>
									<option value="br">Brasil</option>
									<option value="ca">Canada</option>
									<option value="cn">China</option>
									<option value="de">Germany</option>
									<option value="fr">France</option>
									<option value="gr">Greece</option>
									<option value="jp">Japan</option>
									<option value="xk">Kosovo</option>
									<option value="nl">Netherlands</option>
									<option value="no">Norway</option>
									<option value="ru">Russia</option>
									<option value="se">Sweden</option>
									<option value="tr">Turkey</option>
									<option value="uk">United Kingdom</option>
									<option value="us">United States</option>
								</select>
							</div>
						</div>
						<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
							<label class="col-sm-5 control-label" for="field-3">民族</label>
							<div class="col-sm-7">
								<select class="form-control" id="minzu" >
									<option></option>
								</select>
							</div>
						</div>
						<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
							<label class="col-sm-5 control-label" for="field-3"><span class="red">*</span>居民类型</label>
							<div class="col-sm-7">
								<select class="form-control" id="beneResType" >
									<option></option>
								  	<option value="T">农村</option>
									<option value="C">城镇</option>
									<option value="O">其他</option>
								</select>
							</div>
						</div>
						<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
							<label class="col-sm-5 control-label" for="field-3">最高学历</label>
							<div class="col-sm-7">
								<select class="form-control" id="beneHighEducation" >
									<option></option>
								  	<option value="L">高中及以下</option>
									<option value="Z">专科</option>
									<option value="B">本科</option>
									<option value="Y">研究生</option>										  	
									<option value="O">博士</option>
								</select>
							</div>
						</div>
						<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
							<label class="col-sm-5 control-label" for="field-3">工作单位</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="beneWorkAddr" data-validate="required" placeholder="工作单位">
							</div>
						</div>
						<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
							<label class="col-sm-5 control-label" for="field-3">婚姻状况</label>
							<div class="col-sm-7">
								<select class="form-control" id="beneMarry" >
									<option></option>
								  	<option value="W">未婚</option>
									<option value="Y">已婚</option>
									<option value="S">丧偶</option>
									<option value="L">离婚</option>
									<option value="N">未说明</option>
								</select>
							</div>
						</div>
						<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
							<label class="col-sm-5 control-label" for="field-3">邮编</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="benePost"  data-validate="required" placeholder="邮编">
							</div>
						</div>
						<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
							<label class="col-sm-5 control-label" for="field-3">E-mail</label>
							<div class="col-sm-7">
								<input type="text" id="beneEmail" class="form-control" data-validate="email" placeholder="请输入E-mail">
							</div>
						</div>
						<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
							<label class="col-sm-5 control-label" for="field-3">移动电话</label>
							<div class="col-sm-7">
								<input type="text" id="benePhone" class="form-control" data-validate="number" placeholder="phonenumber">
							</div>
						</div>
						<div class="marginbottom15" style="width: 100%;float: left;padding-right: 15px;padding-left: 15px;">
							<label class="col-bg-45 control-label" for="field-3">固定电话</label>
							<div class="col-bg-87">
								<div class="col-lg-4 col-md-4 col-xs-4">
									<input type="text" id="beneAreaCall" class="form-control" data-validate="required" placeholder="区号">
								</div>
								<div class="col-lg-4 col-md-4 col-xs-4">
									<input type="text" id="beneCall" class="form-control" data-validate="required" placeholder="电话">
								</div>
								<div class="col-lg-4 col-md-4 col-xs-4">
									<input type="text" id="benePartCall" class="form-control" data-validate="required" placeholder="分机号">
								</div>
							</div>
						</div>
						<!-- <div class="marginbottom15" style="width: 100%;float: left;padding-right: 15px;padding-left: 15px;">
							<label class="col-bg-45 control-label" for="field-3">联系地址</label>
							<div class="col-bg-87">
								<center>
									<div class="col-lg-3 col-md-3 col-xs-6">
										<select id="loc_province-sub3" name=""></select>
									</div>
									<div class="col-lg-3 col-md-3 col-xs-6">
										<select id="loc_city-sub3" name=""></select>
									</div>
									<div class="col-lg-3 col-md-3 col-xs-6">
										<select id="loc_town-sub3" name=""></select>
									</div>
									<div class="col-lg-3 col-md-3 col-xs-6">
										<input type="text" id="beneDetailAddr" class="form-control" data-validate="required" placeholder="详细地址">
									</div>
								</center>
							</div>
						</div> -->
					
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
							<a href="#">
								&times;
							</a>
						</div>
					</div>
					<div class="panel-body">
						<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
							<label class="col-sm-5 control-label" for="field-3">附加险险种名称</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="insuredName" id="fjInsuredName" data-validate="required" placeholder="主险险种名称">
							</div>
						</div>
						<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
							<label class="col-sm-5 control-label" for="field-3">份数</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="number" id="fjnumber" data-validate="required" placeholder="份数">
							</div>
						</div>
						<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
							<label class="col-sm-5 control-label" for="field-3">附加险险种保费(元)</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="insuredPay" id="fjInsuredPay" data-validate="required" placeholder="0.00">
							</div>
						</div>
						<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
							<label class="col-sm-5 control-label" for="field-3">附加险险种保额(元)</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="insuredGet" id="fjInsuredGet" data-validate="required" placeholder="0.00">
							</div>
						</div>
						<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
							<label class="col-sm-5 control-label" for="field-3">缴费方式</label>
							<div class="col-sm-7">
								<select class="form-control" id="fjpayType" name="payType">
									<option></option>
								  	<option value="Y">年缴</option>
									<option value="M">月缴</option>
									<option value="O">趸缴</option>
								</select>
							</div>
						</div>
						<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
							<label class="col-sm-5 control-label" for="field-3">缴费年期类型</label>
							<div class="col-sm-7">
								<select class="form-control" id="fjpayYearType" name="payYearType">
									<option></option>
								  	<option value="Y">年缴</option>
									<option value="M">月缴</option>
									<option value="O">趸缴</option>
								</select>
							</div>
						</div>
						<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
							<label class="col-sm-5 control-label" for="field-3">缴费年期</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="payYear" id="fjpayYear" data-validate="required" placeholder="缴费年期">
							</div>
						</div>
						<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
							<label class="col-sm-5 control-label" for="field-3">保险年期类型</label>
							<div class="col-sm-7">
								<select class="form-control" id="fjInsureYearType" name="insureYearType">
									<option></option>
								  	<option value="Z">保至终生</option>
									<option value="M">保至某确定年龄</option>
								</select>
							</div>
						</div>
						<div class="col-lg-6 col-bg-4 col-md-6 col-xs-6 marginbottom15">
							<label class="col-sm-5 control-label" for="field-3">保险年期</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="insureYear" id="fjinsureYear" data-validate="required" placeholder="保险年期">
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
	<script src="<%=request.getContextPath() %>/include/json/area.js" type="text/javascript" charset="utf-8"></script>
    <script src="<%=request.getContextPath() %>/include/json/newarea.js" type="text/javascript" charset="utf-8"></script> 
	<script src="<%=request.getContextPath() %>/include/json/newlocation.js" type="text/javascript" charset="utf-8"></script>
	<script src="<%=request.getContextPath() %>/application/newTestingCenter/newCaseManage/res/js/newCaseManage.js" type="text/javascript" charset="utf-8"></script>
	
</body>
</html>					