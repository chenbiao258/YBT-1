<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<% String tContNo=  request.getParameter("contNo"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="Xenon Boostrap Admin Panel" />
<meta name="author" content="" />

<title>告知录入</title>

<%@ include file="../../../main/jsp/top.jsp"%>

</head>

<body class="page-body skin-facebook">

	<div class="page-container">

		

		<div class="main-content">

			<%@ include file="../../../main/jsp/nav.jsp"%>

			<div class="row">
				<div class="col-sm-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">告知录入</h3>
						</div>
						<div class="panel-body">
							<form id="form-plus" action="" method="" role="form"
								class="form-horizontal">


								<table width="98%" align="center" class="FormTable">
									<caption>保单</caption>
									<tr>
										<td width="20%" align="left">&nbsp;投保单号码：<font
											color="red">(*必填)</font>
										</td>
										<td width="35%" align="left"><input name="contNo"
											readonly="readonly" id="contNo" value="<%=tContNo%>"></td>
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
								    <div class="col-sm-1">
												<button type="button" class="btn btn-primary back" id="save">保存</button>
												
								</div>
								
								<input type="hidden" name=infoLength value='39'>
							</form>
						</div>
					</div>
				</div>
			</div>
			<%@ include file="../../../main/jsp/footer.jsp"%>
		</div>

	</div>

	<%@ include file="../../../main/jsp/bottom.jsp"%>
	<!-- Imported scripts on this page -->
	<script
		src="<%=request.getContextPath()%>/application/newTestingCenter/newCont/res/js/inputImpart.js"
		type="text/javascript" charset="utf-8"></script>

</body>

</html>