var cusManaCode;
var manaName;
var contNum;
var bankCode;
var now = new Date(); 
var num=0;
var sum=0;
/*$(function(){
	
$('#fwv-1').bootstrapValidator({
           message: '输入值不合法',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
			  fields: {
              insurancecom: {
                  message: '保险公司效验失败',
                  validators: {
                      notEmpty: {
                          message: '保险公司不能为空'
                      }
                  }
              },proposalcontno:{
              	 message: '投保单号效验失败',
              	 validators: {
                      notEmpty: {
                          message: '投保单号不能为空'
                      },
                      stringLength:{
                      	min:10,
                      	max:25,
                      	 message: '投保单号长度应在10-25之间'
                      }
                  }
              },receivetime:{
              	message: '客户经理手续费比例',
              	 notEmpty: {
                          message: '客户经理手续费比例不能为空'
                 }
              }
              
          }
      });

$('#fwv-2').bootstrapValidator({
       　message: 'This value is not valid',
            　feedbackIcons: {  
            required: 'glyphicon glyphicon-asterisk requiredStar',  
            valid: 'glyphicon glyphicon-ok',  
            invalid: 'glyphicon glyphicon-remove',  
            validating: 'glyphicon glyphicon-refresh'  
        },   live:'enabled' ,
          fields: {
              appntname: {
                  message: '投保人姓名效验失败',
                  validators: {
                      notEmpty: {
                          message: '投保人姓名不能为空'
                      },
                      stringLength:{
                      	min:2,
                      	max:6,
                      	message: '投保人姓名长度范围2-6'
                      }
                  }
              },
              idtype:{
              	message: '投保人证件类型效验失败',
              	     validators: {
                      notEmpty: {
                          message: '投保人证件类型不能为空'
                      }
                  }
              },
              idno:{
              	 	message: '投保人证件号码效验失败',
              	     validators: {
                      notEmpty: {
                          message: '投保人证件号码不能为空'
                      },
                      callback: {  
                         message: '投保人证件类型为身份证的时候证件号码长度必须是15或18',  
                         callback: function(value, validator) {  
							var flag = true;
							var idtype=$("#field-9").val();
							var idno=$("#field-10").val();
							if(idtype=="1"){
								if(idno.length!=15&&idno.length!=18){
									flag= false;
								}
								
							}
                            return flag;  
                         }  
                     }  
                      
                  }
              },
              appntsex:{
              	message: '投保人性别效验失败',
              	     validators: {
                      notEmpty: {
                          message: '投保人性别不能为空'
                      }
              	     }
              },
              appntbirthday:{
              	message: '投保人生日效验失败',
              	     validators: {
                      notEmpty: {
                          message: '投保人生日不能为空'
                      }
                   
              	     }
              }
  
              
          }
      });
});
*/

	

 //setTimeout("self.location=self.location",10);

$(function(){
	
	//告知录入
	$("#save15").click(function(){
		var sectionData = $("#fwv-20").serialize();
		$.ajax({
				 url:path + '/newContEnter/saveInputImpart.do',  
		         type: "POST",
		         dataType: 'json',
            	 data: sectionData,
				 success: function(data){
					alert(data.msg);
					window.close();
				 }
			})
		
		
	})
	
	//alert(bankName+"="+salesChl+"="+tContNo+"="+riskCode);
	
	selectCity('loc_province-sub1','loc_city-sub1','loc_town-sub1');
	selectCity('loc_province-sub2','loc_city-sub2','loc_town-sub2');
	selectCity('loc_province-sub5','loc_city-sub5','loc_town-sub5');
	createTable();	
	
	 $.ajax({
				 url:path + '/newContEnter/selectAccNo.do',  
		         type: "POST",
		         data:{"cifid":grpcontno},
				 success: function(data){
				  for(var i=0;i<data.length;i++){
					var select=document.getElementById("newbankaccno");
				    var option=document.createElement("option");
					option.value=data[i].accountnumber.replace(/^\s+|\s+$/g, '');
					option.innerHTML=data[i].accountnumber;
					
					select.appendChild(option);	
				 	 }
				 }
			})
	
		//投保人国籍查询
		$.ajax({
				 url:path + '/LdcodeController/selectLcodeByCodetype.do',  
		         type: "POST",
		         data:{"codetype":"iss_country"},
				 success: function(data){
				 for(var i=0;i<data.length;i++){
					var select=document.getElementById("field-16");
				    var option=document.createElement("option");
					option.value=data[i].code.replace(/^\s+|\s+$/g, '');
					option.innerHTML=data[i].code+"-"+data[i].codename;
					select.appendChild(option);	
					
				 	 }
				 }
			})
		//投被保人关系
		$.ajax({
				 url:path + '/LdcodeController/selectLcodeByCodetype.do',  
		         type: "POST",
		        
		         data:{"codetype":"relationformanu"},
				 success: function(data){
				 for(var i=0;i<data.length;i++){
					var select=document.getElementById("relationtoappnt");
				    var option=document.createElement("option");
					option.value=data[i].code.replace(/^\s+|\s+$/g, '');
					option.innerHTML=data[i].code+"-"+data[i].codename;
					select.appendChild(option);	
					
				 	 }
				 }
			})
					//受益人与被保人的关系
		$.ajax({
				 url:path + '/LdcodeController/selectLcodeByCodetype.do',  
		         type: "POST",
		        
		         data:{"codetype":"relationformanu"},
				 success: function(data){
				 for(var i=0;i<data.length;i++){
					var select=document.getElementById("relationtoinsured");
				    var option=document.createElement("option");
					option.value=data[i].code.replace(/^\s+|\s+$/g, '');
					option.innerHTML=data[i].code+"-"+data[i].codename;
					select.appendChild(option);	
					
				 	 }
				 }
			})
		
		//被保人国籍查询
		$.ajax({
				 url:path + '/LdcodeController/selectLcodeByCodetype.do',  
		         type: "POST",
		          
		         data:{"codetype":"iss_country"},
				 success: function(data){
				 for(var i=0;i<data.length;i++){
					var select=document.getElementById("LCInsurednativeplace");
				    var option=document.createElement("option");
					option.value=data[i].code.replace(/^\s+|\s+$/g, '');
					option.innerHTML=data[i].code+"-"+data[i].codename;
					select.appendChild(option);	
				 	 }
				 }
			})
		/*	//受益人国籍
				
		$.ajax({
				 url:path + '/LdcodeController/selectLcodeByCodetype.do',  
		         type: "POST",
		        
		         data:{"codetype":"iss_country"},
				 success: function(data){
				 for(var i=0;i<data.length;i++){
					var select=document.getElementById("beneCountry");
				    var option=document.createElement("option");
					option.value=data[i].code.replace(/^\s+|\s+$/g, '');
					option.innerHTML=data[i].code+"-"+data[i].codename;
					select.appendChild(option);	
					
				 	 }
				 }
			})*/
		//投保人证件类型
		$.ajax({
				 url:path + '/LdcodeController/selectLcodeByCodetype.do',  
		         type: "POST",
		          
		         data:{"codetype":"idtype"},
				 success: function(data){
				 for(var i=0;i<data.length;i++){
					var select=document.getElementById("field-9");
				    var option=document.createElement("option");
					option.value=data[i].code.replace(/^\s+|\s+$/g, '');
					option.innerHTML=data[i].code+"-"+data[i].codename;
					select.appendChild(option);	
					
				 	 }
				 }
			})
		//被保人证件类型
		$.ajax({
				 url:path + '/LdcodeController/selectLcodeByCodetype.do',  
		         type: "POST",
		        
		         data:{"codetype":"idtype"},
				 success: function(data){
				 for(var i=0;i<data.length;i++){
					var select=document.getElementById("LCInsuredidtype");
				    var option=document.createElement("option");
					option.value=data[i].code.replace(/^\s+|\s+$/g, '');
					option.innerHTML=data[i].code+"-"+data[i].codename;
					select.appendChild(option);	
					
				 	 }
				 }
			})
		
		//受益人证件类型
			$.ajax({
				 url:path + '/LdcodeController/selectLcodeByCodetype.do',  
		         type: "POST",
		        
		         data:{"codetype":"idtype"},
				 success: function(data){
				 for(var i=0;i<data.length;i++){
					var select=document.getElementById("beneIdCard");
				    var option=document.createElement("option");
					option.value=data[i].code.replace(/^\s+|\s+$/g, '');
					option.innerHTML=data[i].code+"-"+data[i].codename;
					select.appendChild(option);	
					
				 	 }
				 }
			})	
		
			//保险公司
			$.ajax({
				 url:path + '/newContEnter/selectFromLacom.do',  
		         type: "POST",
		          async: false,
				 success: function(data){
				 for(var i=0;i<data.length;i++){
					var select=document.getElementById("field-1");
				    var option=document.createElement("option");
					option.value=data[i].agentcom.replace(/^\s+|\s+$/g, '');;
					option.innerHTML=data[i].agentcom+"-"+data[i].name;
					select.appendChild(option);	
					
				 	 }
				 }
			})
			//保险产品查询
			
	/*		$.ajax({
				 url:path + '/newContEnter/searchrisk.do',  
		         type: "POST",
		        
		         data:{"insurancecom":tContNo},
				 success: function(data){
				 for(var i=0;i<data.length;i++){
					var select=document.getElementById("riskcode");
				    var option=document.createElement("option");
					option.value=data[i].riskCode.replace(/^\s+|\s+$/g, '');;
					option.innerHTML=data[i].riskCode+"-"+data[i].riskName;
					select.appendChild(option);
				 }
				
			}
		})		*/		
		//投保人职业代码
			$.ajax({
				
				 url:path + '/newContEnter/selectByLdoccupationVo.do',  
		         type: "POST",
				 success: function(data){
				 for(var i=0;i<data.length;i++){
					var select=document.getElementById("field-17");
				    var option=document.createElement("option");
					option.value=data[i].occupationcode.replace(/^\s+|\s+$/g, '');;
					option.innerHTML=data[i].occupationcode+"-"+data[i].occupationname;
					select.appendChild(option);
				 }
				
			}
		})				
			//被保人职业代码
			$.ajax({
				 url:path + '/newContEnter/selectByLdoccupationVo.do',  
		         type: "POST",
				 success: function(data){
				 for(var i=0;i<data.length;i++){
					var select=document.getElementById("LCInsuredoccupationcode");
				    var option=document.createElement("option");
					option.value=data[i].occupationcode.replace(/^\s+|\s+$/g, '');;
					option.innerHTML=data[i].occupationcode+"-"+data[i].occupationname;
					select.appendChild(option);
				 }
				
			}
		})		
		
		


	
	$("#beneIsTrue").click(function(){
		var beneIsTrue=$("#beneIsTrue").val();
		if(beneIsTrue=="N"){
			addbenefer();
			$("#addbene").show();
		}else{
			$("#addbene").hide() //添加受益人
		}
		
	});

	
	
	
	

	
	
	
	$("#tabValidata").click(function(){
		return LccontValidata();
	})
	
	
	
	$("#nextValidata").click(function(){
		return LccontValidata();
	});
	
	$("#save1").click(function(){
		
		 $("#proposalcontno5").val($("#field-2").val());
		var matter="保存税收";
		var sectionData1 = $("#fwv-5").serialize();
		$.ajax({
            url:path + '/newContEnter/saverevenue.do',  
            type: "POST",
            dataType: 'json',
            data: sectionData1+"&matter="+matter,
            success: function(data){
            	if(data.success==true){
            	  alert("添加成功");
            	$("#save3").removeAttr("disabled"); 
            	if(data.parm!=null){
            		$("#field-2").val(data.parm);
         
            	}
            
            	}else{
            		alert(data.msg);
            	}
	
            },
            error:function(){
            	alert("save failed");
            }
        });  
		
		
	});
	
	
	//form局部提交2--投保人
	$("#save2").click(function(){
	/*	$("#fwv-2").data('bootstrapValidator').validate();
		var flag=$("#fwv-2").data('bootstrapValidator').isValid();
		alert(flag);
		if(!flag){
			return;
		}*/
		 //$('#fwv-2').data('bootstrapValidator').resetForm(true);

		var sectionData1 = $("#fwv-1").serialize();
		var sectionData = $("#fwv-2").serialize();
		var matter="投保单和投保人信息保存";
		var flag=LcappntValidata();
		if(flag==false){
			return;
		}
		$.ajax({
            url:path + '/newContEnter/saveNewCont.do',  
            type: "POST",
            dataType: 'json',
            data: sectionData1+"&"+sectionData+"&matter="+matter,
            success: function(data){
            	if(data.success==true){
            	  alert("添加成功");
            	$("#save3").removeAttr("disabled"); 
            	if(data.parm!=null){

            		$("#field-2").val(data.parm);
            		$("contNo").val(data.parm);
            	}
            
            	}else{
            		alert(data.msg);
            	}
	
            },
            error:function(){
            	alert("save failed");
            }
        });    
	
	});
	//form局部提交3--被保人
	$("#save3").click(function(){
	
		var matter="被保人信息保存";
		var flag=LcinsuredValidata();
		if(flag==false){
			return;
		}
		$("#proposalContNo1").val($("#field-2").val());
		var sectionData11 = $("#fwv-3").serialize();
	
		
		$.ajax({
            url:path + '/newContEnter/saveBBREnter.do',  
            type: "POST",
            dataType: 'json',
            data: sectionData11+"&matter="+matter,
            success: function(data){
            	alert(data.msg);
            	if(data.success==true){
            	$("#save4").removeAttr("disabled"); 
            	
            	console.log(data);
            	}
            	
            },
            error:function(){
            	alert("save failed");
            }
        });       
	
	});
	//被保人选择本人
	$("#relationtoappnt").click(function(){
		
		var tbRelation= $("#relationtoappnt").val();//投被保人是否为同一个人
		var appntName=$("#field-8").val();//投保人姓名
		var company=$("#company").val();
		var Responsibility=$("#Responsibility").val();
		var appntIDType=$("#field-9").val();//投保人证件类型
		var appntIDNo=$("#field-10").val();//投保人证件号码
		var appntSex=$("#field-11").val();//投保人性别
		var appntBirthday=$("#field-12").val();//投保人出生日期
		
		var appntIDStartDate=$("#field-14").val();//证件有效起期
		var appntIDEndDate=$("#field-15").val();//证件有效止期
		var appntCountry=$("#field-16").val();//国籍
		var appntOccupationCode=$("#field-17").val();//职业代码
		
		var appntMarry=$("#field-18").val();//婚姻状况
		var salary=$("#field-19").val();//工资
		var addressno=$("#field-20").val();//联系地址 省份
		var appntPostCode=$("#field-21").val();//邮编
		var appntPhone=$("#field-22").val();//移动电话
		var appntEmail=$("#field-23").val();//E-main
		var phone=$("#field-24").val();//联系电话
		var phonenumber=$("#field-25").val();//家庭邮编
		//var position=$("#field-26").val();//职业告知编码
		var nationality=$("#field-27").val();//民族
		var smokeflag=$("#field-28").val();//是否吸烟
		var appntHigh=$("#field-29").val();//身高
		var appntWeight=$("#field-30").val();//体重
		var health=$("#field-31").val();//有无健康标识
		var creditgrade=$("#field-32").val();//居民类型
		var rgtaddress=$("#field-33").val();//个人年收入
		var areaCall=$("#areaCall").val();//办公电话区号
		var call=$("#call").val();//办公电话
		
		var postalProvince=$("#loc_province-sub1").val();
		var postalCity=$("#loc_city-sub1").val();
		var postalArea=$("#loc_town-sub1").val();
		var postaladdress=$("#postaladdress").val();
	
		var homeProvince=$("#loc_province-sub2").val();
		var homeCity=$("#loc_city-sub2").val();
		var homeArea=$("#loc_town-sub2").val();
		var homeaddress=$("#homeaddress").val();
		
		var otherProvince=$("#loc_province-sub5").val();
		var otherCity=$("#loc_city-sub5").val();
		var otherArea=$("#loc_town-sub5").val();
		var otheraddress=$("#otheraddress1").val();
	
		
		
		
		
		if(tbRelation=="01"){
			
			
			$("#LCInsuredname").val(appntName);
			$("#LCInsuredidno").val(appntIDNo);
			
			$("#LCInsuredidtype").select2("val",appntIDType);
			$("#LCInsuredsex").select2("val",appntSex);
			$("#LCInsuredbirthday").val(appntBirthday);
			$("#LCInsurednativeplace").select2("val",appntCountry);
			$("#insureidstartdate").val(appntIDStartDate);
			$("#insureidenddate").val(appntIDEndDate);
			$("#Lcinsuredcompany").val(company);
			$("#lcinsuredresponsibility").val(Responsibility);
			$("#LCInsurede_mail").val(appntEmail);
			$("#LCInsuredzipcode").val(appntPostCode);//邮编
			$("#LCInsuredmarriage").select2("val",appntMarry);//婚姻状况
			$("#LCInsurednationality").select2("val",nationality);//民族
			
			$("#LCInsuredstature").val(appntHigh);//身高
			$("#LCInsuredavoirdupois").val(appntWeight);//体重
			$("#LCInsuredsmokeflag").select2("val",smokeflag);//是否吸烟
			$("#LCInsuredhealth").select2("val",health);//有无健康标识
			$("#LCInsuredoccupationcode").select2("val",appntOccupationCode);//职业代码
			//$("#LCInsuredposition").select2("val",position);//职业告知
			$("#LCInsuredmobile").val(appntPhone);//移动电话
			$("#LCInsuredareaCall").val(areaCall);//固定电话区号
			$("#LCInsuredcall").val(call);//固定电话
			
		    selectByCity1('loc_province-sub3','loc_city-sub3','loc_town-sub3', postalProvince , postalCity , postalArea) ;//前三个参数为三个下拉列表控件的ID，后三个参数可以不传值，如果不传值那么最后下拉列表的结果就是默认的每一个列表的第一个值，如果要设置默认值的话那么就需要对应这三个参数传递相应的省市区的值。
			$("#LCInsuredpostaladdress").val(postaladdress);//详细地址
			selectByCity1('loc_province-sub4','loc_city-sub4','loc_town-sub4', homeProvince , homeCity , homeArea) ;//前三个参数为三个下拉列表控件的ID，后三个参数可以不传值，如果不传值那么最后下拉列表的结果就是默认的每一个列表的第一个值，如果要设置默认值的话那么就需要对应这三个参数传递相应的省市区的值。
			$("#LCInsuredhomeaddress").val(homeaddress);//详细地址
			selectByCity1('loc_province-sub6','loc_city-sub6','loc_town-sub6', otherProvince , otherCity , otherArea) ;
			$("#otheraddress").val(otheraddress);

		}else{
			$("#LCInsuredname").val("");
			$("#LCInsuredidno").val("");
			$("#LCInsuredidtype").select2("val","");
			$("#LCInsuredsex").select2("val","");
			$("#LCInsuredbirthday").val("");
			$("#LCInsurednativeplace").select2("val","");
			$("#insureidstartdate").val("");
			$("#insureidenddate").val("");
			$("#age").val("");
			$("#Lcinsuredcompany").val("");
			$("#lcinsuredresponsibility").val("")
			$("#LCInsurede_mail").val("");
			$("#LCInsuredzipcode").val("");//邮编
			$("#LCInsuredmarriage").select2("val","");//婚姻状况
			$("#LCInsurednationality").select2("val","");//民族
			$("#LCInsuredstature").val("");//身高
			$("#LCInsuredavoirdupois").val("");//体重
			$("#LCInsuredsmokeflag").select2("val","");//是否吸烟
			$("#LCInsuredhealth").select2("val","");//有无健康标识
			$("#LCInsuredoccupationcode").select2("val","");//职业代码
			//$("#LCInsuredposition").select2("val","");//职业告知
			$("#LCInsuredmobile").val("");//移动电话
			$("#LCInsuredareaCall").val("");//固定电话区号
			$("#LCInsuredcall").val("");//固定电话
			selectCity('loc_province-sub3','loc_city-sub3','loc_town-sub3');
			$("#LCInsuredhomeaddress").val("");//详细地址
			selectCity('loc_province-sub4','loc_city-sub4','loc_town-sub4');
			$("#LCInsuredpostaladdress").val("");//详细地址
			selectCity('loc_province-sub6','loc_city-sub6','loc_town-sub6');
			$("#otheraddress").val("");//详细地址
		}

	});
		//判断受益人状态
		$("#beneIsTrue").click(function(){
		
			
			
			var beneIsTrue=$("#beneIsTrue").val();
			if(beneIsTrue=="Y"){
				$("#addbene").attr("disabled",true); //添加受益人按钮
				$("#beneferdiv").empty();//清空div内容
			}else if(beneIsTrue=="N"){
				$("#addbene").removeAttr("disabled"); 
			}
			
		});
	
	
	//form局部提交4--受益人
	$("#save4").click(function(){
		
		var matter="受益人信息保存";
		var flag=lcbnfValidata();
	
		if(flag==false){
			return;
		}
		
		$("#proposalContNo2").val($("#field-2").val());
	
		
		var sectionData = $("#fwv-4").serialize();
		console.log(sectionData);
		$.ajax({
            url:path + '/newContEnter/saveBeneEnterBean.do',  
            type: "POST",
            dataType: 'json',
            data: sectionData+"&matter="+matter,
            success: function(data){
            	alert(data.msg);
		        if(data.success==true){
            	$("#save5").removeAttr("disabled"); 
            	
//            	console.log(data);
            	}
				
            },
            error:function(){
            	alert("save failed");
            }
        });       
	});
	//form局部提交5--主险和附加险 产品信息
	$("#save5").click(function(){
		var flag=lcpolValidata();
		var matter="险种信息保存";
		if(flag==false){
			return;
		}
		
		/* var rows = document.getElementById("acount").rows.length; 
		 for (var index = 1; index <= rows-2; index++) {
		 	alert($("#a"+index).val()+"");
		 }*/
		$("#proposalContNo3").val($("#field-2").val());
		var sectionData = $("#fwv-7").serialize();
		//alert(sectionData);
		$.ajax({
            url:path + '/newContEnter/saveLcpol.do',  
            type: "POST",
            dataType: 'json',
            data: sectionData+"&matter="+matter,
            success: function(data){
            	alert(data.msg);
            	if(data.success==true){
            	$("#notify").removeAttr("disabled"); 
            	$("#save6").removeAttr("disabled"); 
            	console.log(data);
            	}
            	
            },
            error:function(){
            	alert("save failed");
            }
        });       
		
	});
	//试算
	$("#save6").click(function() {
		var proposalcontno=$("#field-2").val();
		var r=confirm("请确认投保单，产品说明书，投保提示书及其他投保所须资料已经完整提供，之后选择双面打印并请客户在相关文件上签字");
		var matter="试算保存";
		if (r==false)
		{
		   return false;
		}
		
		$.ajax({
			type : "POST",
			url:path+"/TentativeController/tentativeSend.do",// 后台请求URL地址
			data : {"proposalcontno":proposalcontno,"matter":matter},
			dataType : "json",
			success : function(data) {
				if(data.success==true){
					
					if(data.msg=="非实时交易"){
//						alert("此单是非实时交易，你还需要继续投保吗?");
						var r = confirm('此单需非实时核保，继续投保点击"确定",放弃投保点击"取消"');
						if(r==false){
							//将此单取消投保
							$.ajax({
					            url:path + '/newContApply/cancelInsure.do',  
					            type: "POST",
					            data: {"proposalcontno":proposalcontno},
					            success: function(data){
					            	alert("取消投保成功!");
					            },
					            error:function(){
					            	alert("取消投保失败!");
					            }
					        });       
						}else{
							//将此单的状态置为09-->非实时交易
							$.ajax({
					            url:path + '/newContApply/resetAppFlagStatus.do',  
					            type: "POST",
					            data: {"proposalcontno":proposalcontno,"status":"09"},
					            dataType : "json",
					            success: function(data){
					            	if(data.success==true){
					            		alert(data.msg);
						            	$("#additional").hide();//隐藏添加附加险按钮
										$("#save2").attr("disabled",true); //被保险人
										$("#save3").attr("disabled",true); //被保险人
										$("#save4").attr("disabled",true); //受益人信息
										$("#addbene").hide(); //添加受益人
										$("#save5").attr("disabled",true); //产品信息保存
										$("#notify").attr("disabled",true);//告知录入
										$("#save6").attr("disabled",true);//试算
										$("#save7").removeAttr("disabled");
										$("#save9").removeAttr("disabled");
					            	}else{
					            		alert(data.msg);
					            	}
					            },
					            error:function(){
					            	alert("重置状态失败");
					            }
					        }); 
						}
					}else{
						alert(data.msg);
					}
					
					$("#additional").hide();//隐藏添加附加险按钮
					$("#save2").attr("disabled",true); //被保险人
					$("#save3").attr("disabled",true); //被保险人
					$("#save4").attr("disabled",true); //受益人信息
					$("#addbene").hide(); //添加受益人
					$("#save5").attr("disabled",true); //产品信息保存
					$("#notify").attr("disabled",true);//告知录入
					$("#save6").attr("disabled",true);//试算
					$("#save7").removeAttr("disabled");
					$("#save9").removeAttr("disabled");
					
				}else{
					alert(data.msg);
				}
			}
		});
	});
	//扣款
	$("#save7").click(function() {
		var r=confirm("线上核保成功，请确认客户同意扣款保费");
			var matter="扣款保存";
		if (r==false)
		{
		   return false;
		}

		var proposalcontno=$("#field-2").val();
		$.ajax({
			type : "POST",
			url:path+'/debitcontroller/debitSend.do',// 后台请求URL地址  
			data : {"proposalcontno":proposalcontno,"matter":matter},
			dataType : "json",
			success : function(data) {
			}
		});
	});
	
	
	if(flag=="1"){
		$("#field-6").val(new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate());//投保日期	
		$("#grpcontno").val(grpcontno);
		                //$("#save2").attr("disabled",true); //被保险人
						$("#save3").attr("disabled",true); //被保险人
						$("#save4").attr("disabled",true); //受益人信息
						$("#addbene").hide(); //添加受益人
						$("#save5").attr("disabled",true); //产品信息保存
						$("#notify").attr("disabled",true);//告知录入
						$("#save6").attr("disabled",true);//试算
						$("#save7").attr("disabled",true);//扣款
						$("#save8").attr("disabled",true);//承保
						$("#save9").attr("disabled",true);//延迟扣款
						$("#save10").attr("disabled",true);//延迟扣款
//						alert(riskCode);
			if(riskCode!=null&&riskCode!=""){
				//$("#grpcontno").val(grpcontno);
				
				//$("#riskcode10").val(riskCode);
				
				$.ajax({
				 url:path + '/newContEnter/searchRiskTypeBean.do',  
		         type: "POST",
		         data:{"riskcode":riskCode},
				 success: function(data){
				 	
					if(data.riskCode==null){
					alert("该产品YBT系统没有数据,请联系YBT工作人员");
					 $("#save2").attr("disabled",true);
					}else{
						var select=document.getElementById("riskcode");
					    var option=document.createElement("option");
						option.value=data.riskCode;
						option.innerHTML=data.riskCode+"-"+data.riskName;
						select.appendChild(option);
						
						
					}
				 }
			})
		
		
			//selectRiskcode(riskCode);
		}else{   //未传过来保险产品
			//查询保险产品
			$.ajax({
				 url:path + '/newContEnter/searchrisk.do',  
		         type: "POST",
		         data:{"insurancecom":tContNo},
				 success: function(data){
				 for(var i=0;i<data.length;i++){
					var select=document.getElementById("riskcode");
				    var option=document.createElement("option");
					option.value=data[i].riskCode;
					option.innerHTML=data[i].riskCode+"-"+data[i].riskName;
					select.appendChild(option);
				 }
				
			}
		})		
			
	}
	
	$("#save2").removeAttr("disabled"); //被保险人
	$("#field-1").select2("val",tContNo);
	}else if(flag==2){//
				
			selectCont(transno);
			
		       
	}else if(flag==3){
		
		selectCont(transno);
		$("#save2").hide(); //被保险人
		$("#additional").hide();//隐藏添加附加险按钮
		$("#save3").hide(); //被保险人
		$("#save4").hide(); //受益人信息
		$("#addbene").hide(); //添加受益人
		$("#save5").hide(); //产品信息保存
		$("#notify").hide();//告知录入
		$("#save6").hide();//试算
		$("#save7").hide();//扣款
		$("#save8").hide();//承保
		$("#save9").hide();//延迟扣款
		$("#save10").hide();//投保单打印
		$("#save11").attr("disabled",true);//提交
		$("input[type='text'").attr("disabled",true);
		$("select").attr("disabled",true);
		
	}
	
})

$("#add").click(function() { 
	
	addLcaccountinfo();
});
$("#del").click(function() {
	 //获取表格行数

	 var rows = document.getElementById("acount").rows.length; 
	 //判断，根据行数保留表头
	
	 if(rows>2){
		$("#div").find("tr:last").remove();
		num=num-1;
	 }
	 if(rows==2){
	 	alert("最后一行无法删除");
		 num=0;
	 }
});






$(function(){
	
	$("#notify").click(function(){
		
		var bankName = $("#bankName").val();
		var salesChl = $("#salesChl").val();
		var tContNo = $("#proposalContNo").val();
		var riskCode = $("#riskCode").val();
		
		
		var contno=$("#field-2").val();
        var url = "inputImpart.jsp?contNo="+contno+"&null="+null;
        window.open(url,'newwindow')   //该句写成一行代码
	});
	
	
	
	//延迟扣款
	$("#save9").click(function(){
		var matter="延迟扣款";
		var DelayedDate=$("#DelayedDate").val();
		alert(DelayedDate);
		if(DelayedDate==""||DelayedDate==""){
			alert("请输入延迟扣款时间");
			return false;
		}
		var contno=$("#field-2").val();
		alert(contno);
		$.ajax({
				 url:path + '/newContEnter/Delayed.do',  
		         type: "POST",
		         data:{"DelayedDate":DelayedDate,"proposalcontno":contno,"matter":matter},
				 success: function(data){
				 alert(data.msg);
				
			}
		})	
		
	});

	
});
/**
 * 如果没有传过来保险产品代码，选中保险产品
 */
function selectLmrisk(){
	$("#div").hide();
	$("#insuyear").find("option").remove();
	$("#insuyear").select2("val","");
	$("#prem").val("");
	$("#amnt").val("");
	$("#mult").val("");
	$("#insuyearflag").find("option").remove();
	$("#insuyearflag").select2("val","");
	$("#payendyear").find("option").remove();
	$("#payendyear").select2("val","");
	$("#payendyearflag").find("option").remove();
	$("#payendyearflag").select2("val","");
	$("#payintv").find("option").remove();
	$("#payintv").select2("val","");
	$("#getform").find("option").remove();
	$("#getform").select2("val","");
	$("#getage").val("");
	$("#riskcode2").find("option").remove();
	$("#riskcode2").select2("val","");
	$("#riskcode3").find("option").remove();
	$("#riskcode3").select2("val","");
	$("#riskcode4").find("option").remove();
	$("#riskcode4").select2("val","");
	var riskcode=$("#riskcode").val();
	
	if(riskcode!=null&&riskcode!=""){
		//获取保险期间
			$.ajax({
				 url:path + '/newContEnter/searchRiskTypeBean.do',  
		         type: "POST",
		         data:{"riskcode":riskcode},
				 success: function(data){
						if(data.riskType=='00'){
							$("#div").show();
					}
				 }
			})
				$.ajax({
							 url:path + '/LmriskparamsdefaController/selectByLmriskparamsdefaVo.do',  
						         type: "POST",
						         data:{"riskcode":riskcode,"paramstype":"insuyear"},
								 success: function(data){
								 for(var i=0;i<data.length;i++){
									var select=document.getElementById("insuyear");
								    var option=document.createElement("option");
									option.value=data[i].paramscode;
									option.innerHTML=data[i].paramsname;
									select.appendChild(option);	
									
								 	 }
								 }
				})			
				//获取保险期间分类
					$.ajax({
							 url:path + '/LmriskparamsdefaController/selectByLmriskparamsdefaVo.do',  
						         type: "POST",
						         
						         data:{"riskcode":riskcode,"paramstype":"insuyearflag"},
								 success: function(data){
								 for(var i=0;i<data.length;i++){
									var select=document.getElementById("insuyearflag");
								    var option=document.createElement("option");
									option.value=data[i].paramscode;
									option.innerHTML=data[i].paramsname;
									select.appendChild(option);	
									
								 	 }
								 }
				})			
				//获取缴费期间
				$.ajax({
							 url:path + '/LmriskparamsdefaController/selectByLmriskparamsdefaVo.do',  
						         type: "POST",
						         data:{"riskcode":riskcode,"paramstype":"payendyear"},
								 success: function(data){
								 for(var i=0;i<data.length;i++){
									var select=document.getElementById("payendyear");
								    var option=document.createElement("option");
									option.value=data[i].paramscode;
									option.innerHTML=data[i].paramsname;
									select.appendChild(option);	
									
								 	 }
								 }
				})			
				
				//获取缴费期间分类
				$.ajax({
							 url:path + '/LmriskparamsdefaController/selectByLmriskparamsdefaVo.do',  
						         type: "POST",
						         data:{"riskcode":riskcode,"paramstype":"payendyearflag"},
								 success: function(data){
								 for(var i=0;i<data.length;i++){
									var select=document.getElementById("payendyearflag");
								    var option=document.createElement("option");
									option.value=data[i].paramscode;
									option.innerHTML=data[i].paramsname;
									select.appendChild(option);	
									
								 	 }
								 }
				})			
				
				//获取缴费方式
				$.ajax({
							 url:path + '/LmriskparamsdefaController/selectByLmriskparamsdefaVo.do',  
						         type: "POST",
						         data:{"riskcode":riskcode,"paramstype":"payintv"},
								 success: function(data){
								 for(var i=0;i<data.length;i++){
									var select=document.getElementById("payintv");
								    var option=document.createElement("option");
									option.value=data[i].paramscode;
									option.innerHTML=data[i].paramsname;
									select.appendChild(option);	
									
								 	 }
								 }
				})			
				
				$.ajax({
				 url:path + '/LdcodeController/selectLcodeByCodetype.do',  
		         type: "POST",
		         data:{"codetype":"bonusgetmode"},
				 success: function(data){
				for(var i=0;i<data.length;i++){
							var select=document.getElementById("getform");
						    var option=document.createElement("option");
							option.value=data[i].code;
							option.innerHTML=data[i].codename;
							select.appendChild(option);	
							
						 	 }
						
				 }
			})
			/**
			 * 附加险信息查询
			 */
			$.ajax({
				 url:path + '/newContEnter/selectlmrisk.do',  
		         type: "POST",
		         data:{"riskcode":riskcode},
				 success: function(data){
				 if(data.length==0){
				 		$("#riskcode1").find("option").remove();
						$("#riskcode1").select2("val","");
						// reportTable.style.display="none";
				 }else{
				
				 	for(var i=0;i<data.length;i++){
					var select=document.getElementById("riskcode1");
				    var option=document.createElement("option");
					option.value=data[i].riskCode;
					option.innerHTML=data[i].riskCode+"-"+data[i].riskName;
					select.appendChild(option);	
				 	}
					
					 	
				 }	 
				 
				
			}
		})		
			
	}
}
			
/**附加险
 * 
 */

function selectLmrisk1(){
	$("#riskcode2").find("option").remove();
	$("#riskcode2").select2("val","");
	$("#riskcode3").find("option").remove();
	$("#riskcode3").select2("val","");
	$("#riskcode4").find("option").remove();
	$("#riskcode4").select2("val","");
	
	$("#prem1").val("");
	$("#amnt1").val("");
	$("#mult1").val("");
	$("#insuyear1").find("option").remove();
	$("#insuyear1").select2("val","");
	$("#insuyearflag1").find("option").remove();
	$("#insuyearflag1").select2("val","");
	$("#payendyear1").find("option").remove();
	$("#payendyear1").select2("val","");
	$("#payendyearflag1").find("option").remove();
	$("#payendyearflag1").select2("val","");
	$("#payintv1").find("option").remove();
	$("#payintv1").select2("val","");
	$("#getform1").find("option").remove();
	$("#getform1").select2("val","");
	$("#getage1").val("");

	$("#prem2").val("");
	$("#amnt2").val("");
	$("#mult2").val("");
	$("#insuyear2").find("option").remove();
	$("#insuyear2").select2("val","");
	$("#insuyearflag2").find("option").remove();
	$("#insuyearflag2").select2("val","");
	$("#payendyear2").find("option").remove();
	$("#payendyear2").select2("val","");
	$("#payendyearflag2").find("option").remove();
	$("#payendyearflag2").select2("val","");
	$("#payintv2").find("option").remove();
	$("#payintv2").select2("val","");
	$("#getform2").find("option").remove();
	$("#getform2").select2("val","");
	$("#getage2").val("");
	
	$("#prem3").val("");
	$("#amnt3").val("");
	$("#mult3").val("");
	$("#insuyear3").find("option").remove();
	$("#insuyear3").select2("val","");
	$("#insuyearflag3").find("option").remove();
	$("#insuyearflag3").select2("val","");
	$("#payendyear3").find("option").remove();
	$("#payendyear3").select2("val","");
	$("#payendyearflag3").find("option").remove();
	$("#payendyearflag3").select2("val","");
	$("#payintv3").find("option").remove();
	$("#payintv3").select2("val","");
	$("#getform3").find("option").remove();
	$("#getform3").select2("val","");
	$("#getage3").val("");
	
	$("#prem4").val("");
	$("#amnt4").val("");
	$("#mult4").val("");
	$("#insuyear4").find("option").remove();
	$("#insuyear4").select2("val","");
	$("#insuyearflag4").find("option").remove();
	$("#insuyearflag4").select2("val","");
	$("#payendyear4").find("option").remove();
	$("#payendyear4").select2("val","");
	$("#payendyearflag4").find("option").remove();
	$("#payendyearflag4").select2("val","");
	$("#payintv4").find("option").remove();
	$("#payintv4").select2("val","");
	$("#getform4").find("option").remove();
	$("#getform4").select2("val","");
	$("#getage4").val("");
	var riskcode=$("#riskcode1").val();

	if(riskcode!=null&&riskcode!=""){
		//获取保险期间
		
		
				$.ajax({
							 url:path + '/LmriskparamsdefaController/selectByLmriskparamsdefaVo.do',  
						         type: "POST",
						        async: false,
						         data:{"riskcode":riskcode,"paramstype":"insuyear"},
								 success: function(data){
								 for(var i=0;i<data.length;i++){
									var select=document.getElementById("insuyear1");
								    var option=document.createElement("option");
									option.value=data[i].paramscode;
									option.innerHTML=data[i].paramsname;
									select.appendChild(option);	
									
								 	 }
								 }
				})			
				//获取保险期间分类
					$.ajax({
							 url:path + '/LmriskparamsdefaController/selectByLmriskparamsdefaVo.do',  
						         type: "POST",
						         async: false,
						         data:{"riskcode":riskcode,"paramstype":"insuyearflag"},
								 success: function(data){
								 for(var i=0;i<data.length;i++){
									var select=document.getElementById("insuyearflag1");
								    var option=document.createElement("option");
									option.value=data[i].paramscode;
									option.innerHTML=data[i].paramsname;
									select.appendChild(option);	
									
								 	 }
								 }
				})			
				//获取缴费期间
				$.ajax({
							 url:path + '/LmriskparamsdefaController/selectByLmriskparamsdefaVo.do',  
						         type: "POST",
						         async: false,
						         data:{"riskcode":riskcode,"paramstype":"payendyear"},
								 success: function(data){
								 for(var i=0;i<data.length;i++){
									var select=document.getElementById("payendyear1");
								    var option=document.createElement("option");
									option.value=data[i].paramscode;
									option.innerHTML=data[i].paramsname;
									select.appendChild(option);	
									
								 	 }
								 }
				})			
				
				//获取缴费期间分类
				$.ajax({
							 url:path + '/LmriskparamsdefaController/selectByLmriskparamsdefaVo.do',  
						         type: "POST",
						         async: false,
						         data:{"riskcode":riskcode,"paramstype":"payendyearflag"},
								 success: function(data){
								 for(var i=0;i<data.length;i++){
									var select=document.getElementById("payendyearflag1");
								    var option=document.createElement("option");
									option.value=data[i].paramscode;
									option.innerHTML=data[i].paramsname;
									select.appendChild(option);	
									
								 	 }
								 }
				})			
				
				//获取缴费方式
				$.ajax({
							 url:path + '/LmriskparamsdefaController/selectByLmriskparamsdefaVo.do',  
						         type: "POST",
						       async: false,
						         data:{"riskcode":riskcode,"paramstype":"payintv"},
								 success: function(data){
								 for(var i=0;i<data.length;i++){
									var select=document.getElementById("payintv1");
								    var option=document.createElement("option");
									option.value=data[i].paramscode;
									option.innerHTML=data[i].paramsname;
									select.appendChild(option);	
									
								 	 }
								 }
				})			
				
				$.ajax({
				 url:path + '/LdcodeController/selectLcodeByCodetype.do',  
		         type: "POST",
		       async: false,
		         data:{"codetype":"bonusgetmode"},
				 success: function(data){
				 for(var i=0;i<data.length;i++){
					var select=document.getElementById("getform1");
				    var option=document.createElement("option");
					option.value=data[i].code;
					option.innerHTML=data[i].codename;
					select.appendChild(option);	
					
				 	 }
				 }
			})
			
	/*			$.ajax({
				 url:path + '/newContEnter/selectlmrisk1.do',  
		         type: "POST",
		         data:{"riskcode":riskcode},
				 success: function(data){
				 if(data.length==0){
				 		$("#riskcode1").find("option").remove();
						$("#riskcode1").select2("val","");
				 }else{
				
				 	for(var i=0;i<data.length;i++){
					var select=document.getElementById("riskcode1");
				    var option=document.createElement("option");
					option.value=data[i].riskCode;
					option.innerHTML=data[i].riskName;
					select.appendChild(option);	
				 	}
					
					 	
				 }	 
				 
				
			}
		})	*/	
		var riskcode=$("#riskcode").val();
		$.ajax({
				 url:path + '/newContEnter/selectlmrisk.do',  
		         type: "POST",
		        async: false,
		         data:{"riskcode":riskcode},
				 success: function(data){
				 	for(var i=0;i<data.length;i++){
					var select=document.getElementById("riskcode2");
				    var option=document.createElement("option");
					option.value=data[i].riskCode;
					option.innerHTML=data[i].riskCode+"-"+data[i].riskName;
					select.appendChild(option);	
				 	}
					
					 	
				 }	 
				 
				
			
		})			
			
			
			
			
	}
		
		
	
	
}
function selectLmrisk2(){
	$("#riskcode3").find("option").remove();
	$("#riskcode3").select2("val","");

	$("#riskcode4").find("option").remove();
	$("#riskcode4").select2("val","");
	$("#insuyear2").find("option").remove();
	$("#insuyear2").select2("val","");
	$("#prem2").val("");
	$("#amnt2").val("");
	$("#mult2").val("");
	$("#insuyearflag2").find("option").remove();
	$("#insuyearflag2").select2("val","");
	$("#payendyear2").find("option").remove();
	$("#payendyear2").select2("val","");
	$("#payendyearflag2").find("option").remove();
	$("#payendyearflag2").select2("val","");
	$("#payintv2").find("option").remove();
	$("#payintv2").select2("val","");
	$("#getform2").find("option").remove();
	$("#getform2").select2("val","");
	$("#getage2").val("");
	
	$("#prem3").val("");
	$("#amnt3").val("");
	$("#mult3").val("");
	$("#insuyear3").find("option").remove();
	$("#insuyear3").select2("val","");
	$("#insuyearflag3").find("option").remove();
	$("#insuyearflag3").select2("val","");
	$("#payendyear3").find("option").remove();
	$("#payendyear3").select2("val","");
	$("#payendyearflag3").find("option").remove();
	$("#payendyearflag3").select2("val","");
	$("#payintv3").find("option").remove();
	$("#payintv3").select2("val","");
	$("#getform3").find("option").remove();
	$("#getform3").select2("val","");
	$("#getage3").val("");
	$("#prem4").val("");
	$("#amnt4").val("");
	$("#mult4").val("");
	$("#insuyear4").find("option").remove();
	$("#insuyear4").select2("val","");
	$("#insuyearflag4").find("option").remove();
	$("#insuyearflag4").select2("val","");
	$("#payendyear4").find("option").remove();
	$("#payendyear4").select2("val","");
	$("#payendyearflag4").find("option").remove();
	$("#payendyearflag4").select2("val","");
	$("#payintv4").find("option").remove();
	$("#payintv4").select2("val","");
	$("#getform4").find("option").remove();
	$("#getform4").select2("val","");
	$("#getage4").val("");
	var riskcode=$("#riskcode2").val();
	if(riskcode!=null&&riskcode!=""){
		//获取保险期间
				$.ajax({
							 url:path + '/LmriskparamsdefaController/selectByLmriskparamsdefaVo.do',  
						         type: "POST",
						          async: false,
						         data:{"riskcode":riskcode,"paramstype":"insuyear"},
								 success: function(data){
								 for(var i=0;i<data.length;i++){
									var select=document.getElementById("insuyear2");
								    var option=document.createElement("option");
									option.value=data[i].paramscode;
									option.innerHTML=data[i].paramsname;
									select.appendChild(option);	
									
								 	 }
								 }
				})			
				//获取保险期间分类
					$.ajax({
							 url:path + '/LmriskparamsdefaController/selectByLmriskparamsdefaVo.do',  
						         type: "POST",
						         async: false,
						         data:{"riskcode":riskcode,"paramstype":"insuyearflag"},
								 success: function(data){
								 for(var i=0;i<data.length;i++){
									var select=document.getElementById("insuyearflag2");
								    var option=document.createElement("option");
									option.value=data[i].paramscode;
									option.innerHTML=data[i].paramsname;
									select.appendChild(option);	
									
								 	 }
								 }
				})			
				//获取缴费期间
				$.ajax({
							 url:path + '/LmriskparamsdefaController/selectByLmriskparamsdefaVo.do',  
						         type: "POST",
						      async: false,
						         data:{"riskcode":riskcode,"paramstype":"payendyear"},
								 success: function(data){
								 for(var i=0;i<data.length;i++){
									var select=document.getElementById("payendyear2");
								    var option=document.createElement("option");
									option.value=data[i].paramscode;
									option.innerHTML=data[i].paramsname;
									select.appendChild(option);	
									
								 	 }
								 }
				})			
				
				//获取缴费期间分类
				$.ajax({
							 url:path + '/LmriskparamsdefaController/selectByLmriskparamsdefaVo.do',  
						         type: "POST",
						         async: false,
						         data:{"riskcode":riskcode,"paramstype":"payendyearflag"},
								 success: function(data){
								 for(var i=0;i<data.length;i++){
									var select=document.getElementById("payendyearflag2");
								    var option=document.createElement("option");
									option.value=data[i].paramscode;
									option.innerHTML=data[i].paramsname;
									select.appendChild(option);	
									
								 	 }
								 }
				})			
				
				//获取缴费方式
				$.ajax({
							 url:path + '/LmriskparamsdefaController/selectByLmriskparamsdefaVo.do',  
						         type: "POST",
						         async: false,
						         data:{"riskcode":riskcode,"paramstype":"payintv"},
								 success: function(data){
								 for(var i=0;i<data.length;i++){
									var select=document.getElementById("payintv2");
								    var option=document.createElement("option");
									option.value=data[i].paramscode;
									option.innerHTML=data[i].paramsname;
									select.appendChild(option);	
									
								 	 }
								 }
				})			
				
				$.ajax({
				 url:path + '/LdcodeController/selectLcodeByCodetype.do',  
		         type: "POST",
		        async: false,
		         data:{"codetype":"bonusgetmode"},
				 success: function(data){
				 for(var i=0;i<data.length;i++){
					var select=document.getElementById("getform2");
				    var option=document.createElement("option");
					option.value=data[i].code;
					option.innerHTML=data[i].codename;
					select.appendChild(option);	
					
				 	 }
				 }
			})
			var riskcode=$("#riskcode").val();
			$.ajax({
				 url:path + '/newContEnter/selectlmrisk.do',  
		         type: "POST",
		         async: false,
		         data:{"riskcode":riskcode},
				 success: function(data){
				 if(data.length==0){
				 		$("#riskcode3").find("option").remove();
						$("#riskcode3").select2("val","");
				 }else{
				
				 	for(var i=0;i<data.length;i++){
					var select=document.getElementById("riskcode3");
				    var option=document.createElement("option");
					option.value=data[i].riskCode;
					option.innerHTML=data[i].riskCode+"-"+data[i].riskName;
					select.appendChild(option);	
				 	}
					
					 	
				 }	 
				 
				
			}
		})			
	}
	
}

function selectLmrisk3(){
	$("#riskcode4").find("option").remove();
	$("#riskcode4").select2("val","");
	$("#insuyear3").find("option").remove();
	$("#insuyear3").select2("val","");
	$("#prem3").val("");
	$("#amnt3").val("");
	$("#mult3").val("");
	$("#insuyearflag3").find("option").remove();
	$("#insuyearflag3").select2("val","");
	$("#payendyear3").find("option").remove();
	$("#payendyear3").select2("val","");
	$("#payendyearflag3").find("option").remove();
	$("#payendyearflag3").select2("val","");
	$("#payintv3").find("option").remove();
	$("#payintv3").select2("val","");
	$("#getform3").find("option").remove();
	$("#getform3").select2("val","");
	$("#getage3").val("");
	
	$("#prem4").val("");
	$("#amnt4").val("");
	$("#mult4").val("");
	$("#insuyear4").find("option").remove();
	$("#insuyear4").select2("val","");
	$("#insuyearflag4").find("option").remove();
	$("#insuyearflag4").select2("val","");
	$("#payendyear4").find("option").remove();
	$("#payendyear4").select2("val","");
	$("#payendyearflag4").find("option").remove();
	$("#payendyearflag4").select2("val","");
	$("#payintv4").find("option").remove();
	$("#payintv4").select2("val","");
	$("#getform4").find("option").remove();
	$("#getform4").select2("val","");
	$("#getage4").val("");
	var riskcode=$("#riskcode3").val();
	if(riskcode!=null&&riskcode!=""){
		//获取保险期间
	
				$.ajax({
							 url:path + '/LmriskparamsdefaController/selectByLmriskparamsdefaVo.do',  
						         type: "POST",
						         async: false,
						         data:{"riskcode":riskcode,"paramstype":"insuyear"},
								 success: function(data){
								 for(var i=0;i<data.length;i++){
									var select=document.getElementById("insuyear3");
								    var option=document.createElement("option");
									option.value=data[i].paramscode;
									option.innerHTML=data[i].paramsname;
									select.appendChild(option);	
									
								 	 }
								 }
				})			
				//获取保险期间分类
					$.ajax({
							 url:path + '/LmriskparamsdefaController/selectByLmriskparamsdefaVo.do',  
						         type: "POST",
						         async: false,
						         data:{"riskcode":riskcode,"paramstype":"insuyearflag"},
								 success: function(data){
								 for(var i=0;i<data.length;i++){
									var select=document.getElementById("insuyearflag3");
								    var option=document.createElement("option");
									option.value=data[i].paramscode;
									option.innerHTML=data[i].paramsname;
									select.appendChild(option);	
									
								 	 }
								 }
				})			
				//获取缴费期间
				$.ajax({
							 url:path + '/LmriskparamsdefaController/selectByLmriskparamsdefaVo.do',  
						         type: "POST",
						         async: false,
						         data:{"riskcode":riskcode,"paramstype":"payendyear"},
								 success: function(data){
								 for(var i=0;i<data.length;i++){
									var select=document.getElementById("payendyear3");
								    var option=document.createElement("option");
									option.value=data[i].paramscode;
									option.innerHTML=data[i].paramsname;
									select.appendChild(option);	
									
								 	 }
								 }
				})			
				
				//获取缴费期间分类
				$.ajax({
							 url:path + '/LmriskparamsdefaController/selectByLmriskparamsdefaVo.do',  
						         type: "POST",
						          async: false,
						         data:{"riskcode":riskcode,"paramstype":"payendyearflag"},
								 success: function(data){
								 for(var i=0;i<data.length;i++){
									var select=document.getElementById("payendyearflag3");
								    var option=document.createElement("option");
									option.value=data[i].paramscode;
									option.innerHTML=data[i].paramsname;
									select.appendChild(option);	
									
								 	 }
								 }
				})			
				
				//获取缴费方式
				$.ajax({
							 url:path + '/LmriskparamsdefaController/selectByLmriskparamsdefaVo.do',  
						         type: "POST",
						      async: false,
						         data:{"riskcode":riskcode,"paramstype":"payintv"},
								 success: function(data){
								 for(var i=0;i<data.length;i++){
									var select=document.getElementById("payintv3");
								    var option=document.createElement("option");
									option.value=data[i].paramscode;
									option.innerHTML=data[i].paramsname;
									select.appendChild(option);	
									
								 	 }
								 }
				})			
				
				$.ajax({
				 url:path + '/LdcodeController/selectLcodeByCodetype.do',  
		         type: "POST",
		         async: false,
		         data:{"codetype":"bonusgetmode"},
				 success: function(data){
				 for(var i=0;i<data.length;i++){
					var select=document.getElementById("getform3");
				    var option=document.createElement("option");
					option.value=data[i].code;
					option.innerHTML=data[i].codename;
					select.appendChild(option);	
					
				 	 }
				 }
			})
			
			var riskcode=$("#riskcode").val();
			$.ajax({
				 url:path + '/newContEnter/selectlmrisk.do',  
		         type: "POST",
		         async: false,
		         data:{"riskcode":riskcode},
				 success: function(data){
				 if(data.length==0){
				 		$("#riskcode4").find("option").remove();
						$("#riskcode4").select2("val","");
				 }else{
				
				 	for(var i=0;i<data.length;i++){
					var select=document.getElementById("riskcode4");
				    var option=document.createElement("option");
					option.value=data[i].riskCode;
					option.innerHTML=data[i].riskCode+"-"+data[i].riskName;
					select.appendChild(option);	
				 	}
					
					 	
				 }	 
				 
				
			}
		})			
	}
	
}

function selectLmrisk4(){
	$("#insuyear4").find("option").remove();
	$("#insuyear4").select2("val","");
	$("#prem4").val("");
	$("#amnt4").val("");
	$("#mult4").val("");
	$("#insuyearflag4").find("option").remove();
	$("#insuyearflag4").select2("val","");
	$("#payendyear4").find("option").remove();
	$("#payendyear4").select2("val","");
	$("#payendyearflag4").find("option").remove();
	$("#payendyearflag4").select2("val","");
	$("#payintv4").find("option").remove();
	$("#payintv4").select2("val","");
	$("#getform4").find("option").remove();
	$("#getform4").select2("val","");
	$("#getage4").val("");
	var riskcode=$("#riskcode4").val();
	if(riskcode!=null&&riskcode!=""){
		//获取保险期间
	
				$.ajax({
							 url:path + '/LmriskparamsdefaController/selectByLmriskparamsdefaVo.do',  
						         type: "POST",
						        async: false,
						         data:{"riskcode":riskcode,"paramstype":"insuyear"},
								 success: function(data){
								 for(var i=0;i<data.length;i++){
									var select=document.getElementById("insuyear4");
								    var option=document.createElement("option");
									option.value=data[i].paramscode;
									option.innerHTML=data[i].paramsname;
									select.appendChild(option);	
									
								 	 }
								 }
				})			
				//获取保险期间分类
					$.ajax({
							 url:path + '/LmriskparamsdefaController/selectByLmriskparamsdefaVo.do',  
						         type: "POST",
						         async: false,
						         data:{"riskcode":riskcode,"paramstype":"insuyearflag"},
								 success: function(data){
								 for(var i=0;i<data.length;i++){
									var select=document.getElementById("insuyearflag4");
								    var option=document.createElement("option");
									option.value=data[i].paramscode;
									option.innerHTML=data[i].paramsname;
									select.appendChild(option);	
									
								 	 }
								 }
				})			
				//获取缴费期间
				$.ajax({
							 url:path + '/LmriskparamsdefaController/selectByLmriskparamsdefaVo.do',  
						         type: "POST",
						        async: false,
						         data:{"riskcode":riskcode,"paramstype":"payendyear"},
								 success: function(data){
								 for(var i=0;i<data.length;i++){
									var select=document.getElementById("payendyear4");
								    var option=document.createElement("option");
									option.value=data[i].paramscode;
									option.innerHTML=data[i].paramsname;
									select.appendChild(option);	
									
								 	 }
								 }
				})			
				
				//获取缴费期间分类
				$.ajax({
							 url:path + '/LmriskparamsdefaController/selectByLmriskparamsdefaVo.do',  
						         type: "POST",
						        async: false,
						         data:{"riskcode":riskcode,"paramstype":"payendyearflag"},
								 success: function(data){
								 for(var i=0;i<data.length;i++){
									var select=document.getElementById("payendyearflag4");
								    var option=document.createElement("option");
									option.value=data[i].paramscode;
									option.innerHTML=data[i].paramsname;
									select.appendChild(option);	
									
								 	 }
								 }
				})			
				
				//获取缴费方式
				$.ajax({
							 url:path + '/LmriskparamsdefaController/selectByLmriskparamsdefaVo.do',  
						         type: "POST",
						         async: false,
						         data:{"riskcode":riskcode,"paramstype":"payintv"},
								 success: function(data){
								 for(var i=0;i<data.length;i++){
									var select=document.getElementById("payintv4");
								    var option=document.createElement("option");
									option.value=data[i].paramscode;
									option.innerHTML=data[i].paramsname;
									select.appendChild(option);	
									
								 	 }
								 }
				})			
				
				$.ajax({
				 url:path + '/LdcodeController/selectLcodeByCodetype.do',  
		         type: "POST",
		         async: false,
		         data:{"codetype":"bonusgetmode"},
				 success: function(data){
				 for(var i=0;i<data.length;i++){
					var select=document.getElementById("getform4");
				    var option=document.createElement("option");
					option.value=data[i].code;
					option.innerHTML=data[i].codename;
					select.appendChild(option);	
					
				 	 }
				 }
			})
			
	}

	
}

function createTable(){
	$('#reportTable').bootstrapTable({
			striped:true
			
				
	});
}

function selectRiskcode(riskCode){
	//获取保险期间
				$.ajax({
							 url:path + '/LmriskparamsdefaController/selectByLmriskparamsdefaVo.do',  
						         type: "POST",
						         data:{"riskcode":riskCode,"paramstype":"insuyear"},
								 success: function(data){
								 for(var i=0;i<data.length;i++){
									var select=document.getElementById("insuyear");
								    var option=document.createElement("option");
									option.value=data[i].paramscode;
									option.innerHTML=data[i].paramsname;
									select.appendChild(option);	
									
								 	 }
								 }
				})			
				//获取保险期间分类
					$.ajax({
							 url:path + '/LmriskparamsdefaController/selectByLmriskparamsdefaVo.do',  
						         type: "POST",
						         data:{"riskcode":riskCode,"paramstype":"insuyearflag"},
								 success: function(data){
								 for(var i=0;i<data.length;i++){
									var select=document.getElementById("insuyearflag");
								    var option=document.createElement("option");
									option.value=data[i].paramscode;
									option.innerHTML=data[i].paramsname;
									select.appendChild(option);	
									
								 	 }
								 }
				})			
				//获取缴费期间
				$.ajax({
							 url:path + '/LmriskparamsdefaController/selectByLmriskparamsdefaVo.do',  
						         type: "POST",
						       
						         data:{"riskcode":riskCode,"paramstype":"payendyear"},
								 success: function(data){
								 for(var i=0;i<data.length;i++){
									var select=document.getElementById("payendyear");
								    var option=document.createElement("option");
									option.value=data[i].paramscode;
									option.innerHTML=data[i].paramsname;
									select.appendChild(option);	
									
								 	 }
								 }
				})			
				
				//获取缴费期间分类
				$.ajax({
							 url:path + '/LmriskparamsdefaController/selectByLmriskparamsdefaVo.do',  
						         type: "POST",
						        
						         data:{"riskcode":riskCode,"paramstype":"payendyearflag"},
								 success: function(data){
								 for(var i=0;i<data.length;i++){
									var select=document.getElementById("payendyearflag");
								    var option=document.createElement("option");
									option.value=data[i].paramscode;
									option.innerHTML=data[i].paramsname;
									select.appendChild(option);	
									
								 	 }
								 }
				})			
				//获取缴费方式
				$.ajax({
							 url:path + '/LmriskparamsdefaController/selectByLmriskparamsdefaVo.do',  
						         type: "POST",
						         
						         data:{"riskcode":riskCode,"paramstype":"payintv"},
								 success: function(data){
								 for(var i=0;i<data.length;i++){
									var select=document.getElementById("payintv");
								    var option=document.createElement("option");
									option.value=data[i].paramscode;
									option.innerHTML=data[i].paramsname;
									select.appendChild(option);	
									
								 	 }
								 }
				})			
			$.ajax({
				 url:path + '/newContEnter/selectlmrisk.do',  
		         type: "POST",
		        
		         data:{"riskcode":riskCode},
				 success: function(data){
				 if(data.length==0){
				 		$("#riskcode1").find("option").remove();
						$("#riskcode1").select2("val","");
						 //reportTable.style.display="none";
				 }else{
				
				 	for(var i=0;i<data.length;i++){
					var select=document.getElementById("riskcode1");
				    var option=document.createElement("option");
					option.value=data[i].riskCode;
					option.innerHTML=data[i].riskCode+"-"+data[i].riskName;
					select.appendChild(option);	
				 	}
					
					 	
				 }	 
				 
				
			}
		})	
				$.ajax({
				 url:path + '/LdcodeController/selectLcodeByCodetype.do',  
		         type: "POST",
		        
		         data:{"codetype":"bonusgetmode"},
				 success: function(data){
				 for(var i=0;i<data.length;i++){
					var select=document.getElementById("getform");
				    var option=document.createElement("option");
					option.value=data[i].code;
					option.innerHTML=data[i].codename;
					select.appendChild(option);	
					
				 	 }
				 }
			})
}
function selectCont(transno){
	//投保单信息
				$.ajax({
				 url:path + '/newContEnter/selectBylccont.do',  
		         type: "POST",
		         data:{"transno":transno},
				 success: function(data){
				 $("#save3").removeAttr("disabled"); 	
				 $("#save2").removeAttr("disabled"); 	
				 $("#field-1").select2("val",data.insurancecom);//保险公司
				 $("#field-2").val(data.proposalcontno);//投保单号
				 $("#contNo").val(data.proposalcontno);//投保单号
//				 $("#field-5").val(data.receivetime);//客户经理手续费比例
				 $("#field-6").val(dateToString(data.polapplydate));//投保单日期
				 $("#field-7").select2("val",data.getpolmode);//保险公司 

					if(data.state=="00"){//险种未录入
						$("#save5").removeAttr("disabled");
					}else if(data.state=="01"){//未试算
						$("#save6").removeAttr("disabled");
					}else if(data.state=="02"){
						$("#additional").hide();//隐藏添加附加险按钮
						$("#save2").attr("disabled",true); //被保险人
						$("#save3").attr("disabled",true); //被保险人
						$("#save4").attr("disabled",true); //受益人信息
						$("#addbene").hide(); //添加受益人
						$("#save5").attr("disabled",true); //产品信息保存
						$("#notify").attr("disabled",true);//告知录入
						$("#save6").attr("disabled",true);//试算
					}else if(data.state=="04"){
						$("#save2").attr("disabled",true); //被保险人
						$("#save3").attr("disabled",true); //被保险人
						$("#save4").attr("disabled",true); //受益人信息
						$("#addbene").hide(); //添加受益人
						$("#save5").attr("disabled",true); //产品信息保存
						$("#notify").attr("disabled",true);//告知录入
						$("#save6").attr("disabled",true);//试算
						$("#save7").attr("disabled",true);//扣款
						$("#save8").attr("disabled",true);//承保
						$("#save9").attr("disabled",true);//延迟扣款
					}
				 if(data.riskcode==null||data.riskcode==""){
				 
						$.ajax({
						 url:path + '/newContEnter/searchrisk.do',  
				         type: "POST",
				         data:{"insurancecom":data.insurancecom},
						 success: function(data){
						 for(var i=0;i<data.length;i++){
							var select=document.getElementById("riskcode");
						    var option=document.createElement("option");
							option.value=data[i].riskCode;
							option.innerHTML=data[i].riskCode+"-"+data[i].riskName;
							select.appendChild(option);
						 }
						
					}
				})	
				 }else{
				 	
				 $("#riskcode").val(data.riskcode);//保险产品
				$.ajax({
				 url:path + '/newContEnter/searchRiskTypeBean.do',  
		         type: "POST",
		         data:{"riskcode":data.riskcode},
				 success: function(data){
						var select=document.getElementById("riskcode");
					    var option=document.createElement("option");
						option.value=data.riskCode;
						option.innerHTML=data.riskCode+"-"+data.riskName;
						select.appendChild(option);
						if(data.riskType=='00'){
							$("#div").show();
						var AccNo=document.getElementsByName("AccNo");
		      		    var AccRate=document.getElementsByName("AccRate");
						$.ajax({
							 url:path + '/newContEnter/selectlcaccountInfo.do',  
							  type: "POST",
		         			 data:{"transno":transno},
							  success: function(data){
							  	if(data.length!=0){
							  		
							  		for (var i = 0; i < data.length; i++) {
							  			
							  			addLcaccountinfo();
							  			AccRate[num-1].value=data[i].accrate;
							  			AccNo[num-1].value=data[i].accno;
							  		}
							  			
							  	}
							  	$(AccNo[0]).select2("val",data[1].accno);
							  	
							  }
							 
							 
						});	
						}
					
				 }
			})
				 selectRiskcode(data.riskcode);
				 }
				
				
				 //账户查询
				  $.ajax({
					 url:path + '/newContEnter/selectAccNo.do',  
			         type: "POST",
			         data:{"cifid":data.grpcontno},
			         async: false,
					 success: function(data){
					  for(var i=0;i<data.length;i++){
						var select=document.getElementById("newbankaccno");
					    var option=document.createElement("option");
						option.value=data[i].accountnumber.replace(/^\s+|\s+$/g, '');
						option.innerHTML=data[i].accountnumber;
						select.appendChild(option);	
					 	 }
					 }
				})
		
				
			 $("#newbankaccno").select2("val",data.bankaccno);
			 $("#accountbalance").val(data.accountbalance);
			
			     }
		       })	 
		      
		       //投保人信息
		       $.ajax({
				 url:path + '/newContEnter/selectBylcappnt.do',  
		         type: "POST",
		         data:{"transno":transno},
				 success: function(data){
				 	
					$("#field-8").val(data.appntname);//投保人姓名
					$("#field-9").select2("val",data.idtype);//证件类型
					$("#field-10").val(data.idno);//证件号码
					$("#field-11").select2("val",data.appntsex);//性别
					$("#field-12").val(dateToString(data.appntbirthday));//出生日期
					$("#field-14").val(dateToString(data.appntstartdate));//证件有效起期
					$("#field-15").val(dateToString(data.appntenddate));//证件有效止期
					$("#field-16").select2("val",data.nativeplace);//国籍
					$("#field-17").select2("val",data.occupationcode);//职业代码
					$("#field-19").val(data.salary);//工资
					$("#field-31").select2("val",data.health);//有无健康标识
					$("#field-29").val(data.stature);//身高
					$("#field-30").val(data.avoirdupois);//体重
					$("#field-32").select2("val",data.creditgrade);//居民类型
					$("#field-33").val(data.rgtaddress);//个人年收入
					$("#company").val(data.company);//工作单位及名称
					$("#Responsibility").val(data.responsibility);//职位及工作内容
			      }
		       })
		         
		       //投保人地址
		         $.ajax({
				 url:path + '/newContEnter/selectBylcaddress0.do',  
		         type: "POST",
		         data:{"transno":transno},
				 success: function(data){
					$("#field-21").val(data.zipcode);//邮寄编码
					$("#field-22").val(data.mobile);//移动电话
					$("#field-23").val(data.email);//e_main
					$("#field-24").val(data.phone);//电话phone
					$("#field-25").val(data.homezipcode);//homezipcode家庭邮编
					var homephone=data.homephone.split("-");
					$("#areaCall").val(homephone[0]);//区号
					$("#call").val(homephone[1]);//电话
					var postaladdress=data.postaladdress.split("&");
					//selectCity('loc_province-sub1','loc_city-sub1','loc_town-sub1');
					selectByCity1('loc_province-sub1','loc_city-sub1','loc_town-sub1', postaladdress[0] , postaladdress[1] , postaladdress[2]) ;
					$("#postaladdress").val(postaladdress[3])
					var homeaddress=data.homeaddress.split("&");
					selectByCity1('loc_province-sub2','loc_city-sub2','loc_town-sub2', homeaddress[0] , homeaddress[1] , homeaddress[2]) ;
					$("#homeaddress").val(homeaddress[3]);
					var otheraddress=data.otheraddress.split("&");
					selectByCity1('loc_province-sub5','loc_city-sub5','loc_town-sub5', otheraddress[0] , otheraddress[1] , otheraddress[2]) ;
					$("#otheraddress1").val(otheraddress[3]);
			      }
		       })
		     	
		       //被保人信息
		       $.ajax({
				 url:path + '/newContEnter/selectBylcinsured.do',  
		         type: "POST",
		         data:{"transno":transno},
				 success: function(data){
				 	if(data.transno!=null){
				 	
				 		$("#relationtoappnt").select2("val",data.relationtoappnt);//与投保人的关系
				 		$("#LCInsuredname").val(data.lcinsuredname);//投保人姓名
				 		$("#LCInsuredidtype").select2("val",data.lcinsuredidtype);//证件类型
				 		$("#LCInsuredidno").val(data.lcinsuredidno);//证件号码
				 		$("#LCInsuredsex").select2("val",data.lcinsuredsex);//性别
				 		$("#LCInsuredbirthday").val(dateToString(data.lcinsuredbirthday));//出生日期
				 		$("#LCInsurednativeplace").select2("val",data.lcinsurednativeplace);//国籍
				 		$("#insureidstartdate").val(dateToString(data.insureidstartdate));//证件有效起期
				 		$("#insureidenddate").val(dateToString(data.insureidenddate));//证件有效止期
				 		$("#LCInsuredstature").val(data.stature);//身高
				 		$("#LCInsuredavoirdupois").val(data.stature);//体重
				 		$("#LCInsuredhealth").select2("val",data.health);//有无健康标识
				 		$("#LCInsuredoccupationcode").select2("val",data.lcinsuredroccupationcode);//职业代码	
				 		$("#Lcinsuredcompany").val(data.lcinsuredcompany);//工作单位及名称
				 		$("#lcinsuredresponsibility").val(data.lcinsuredresponsibility);//职位
						 		  //被保人人地址
				         $.ajax({
						 url:path + '/newContEnter/selectBylcaddress1.do',  
				         type: "POST",
				         data:{"transno":transno},
						 success: function(data){
							$("#LCInsuredzipcode").val(data.zipcode);//邮寄编码
							$("#LCInsuredmobile").val(data.mobile);//移动电话
							$("#LCInsurede_mail").val(data.email);//e_main
							
							var homephone=data.homephone.split("-");
							$("#LCInsuredareaCall").val(homephone[0]);//区号
							$("#LCInsuredcall").val(homephone[1]);//电话
							var postaladdress=data.postaladdress.split("&");
							//selectCity('loc_province-sub1','loc_city-sub1','loc_town-sub1');
							selectByCity1('loc_province-sub3','loc_city-sub3','loc_town-sub3', postaladdress[0] , postaladdress[1] , postaladdress[2]) ;
							$("#LCInsuredpostaladdress").val(postaladdress[3])
							var homeaddress=data.homeaddress.split("&");
							selectByCity1('loc_province-sub4','loc_city-sub4','loc_town-sub4', homeaddress[0] , homeaddress[1] , homeaddress[2]) ;
							$("#LCInsuredhomeaddress").val(homeaddress[3]);
							
							var otheraddress=data.otheraddress.split("&");
							selectByCity1('loc_province-sub6','loc_city-sub6','loc_town-sub6', otheraddress[0] , otheraddress[1] , otheraddress[2]) ;
							$("#otheraddress").val(otheraddress[3]);
							
					      }
				       })
				 	}
			      }
		       })
		       
		       //每秒执行一次,showTime() 
			
				$.ajax({
				 url:path + '/newContEnter/selectrevenue.do',  
		         type: "POST",
		         data:{"transno":transno},
				 success: function(data){
				 	
				 
				 	var statement=data.statement;
				 	
				 		if(statement==1){
				 			$("input[type=radio][name=statement][value=1]").attr("checked",'true');
				 		}else if(statement==2){
				 			$("input[type=radio][name=statement][value=2]").attr("checked",'true');
				 		}else{
				 			$("input[type=radio][name=statement][value=3]").attr("checked",'true');
				 		}
				 	
				 	$("#firstname").val(data.firstname);
				 	$("#lastname").val(data.lastname);
				 	if(data.liveheath==1){
				 		$("input:checkbox[value='1']").eq(1).attr('checked','true');
				 	}
				 	var livingaddress=data.livingaddress.split("&"); 
				 	$("#living_isscountry").val(livingaddress[0]);
				 	$("#living_province").val(livingaddress[1]);
				 	$("#living_city").val(livingaddress[2]);
				 	$("#living_address").val(livingaddress[3]);
				 	if(data.tiveheath==1){
				 		$("input:checkbox[value='1']").eq(2).attr('checked','true');
				 	}
				 	
				 	var cnnativeheath =data.cnnativeheath.split("&");
				 	$("#cnnativeheath_isscountry").val(cnnativeheath[0]);
				 	$("#cnnativeheath_province").val(cnnativeheath[1]);
				 	$("#cnnativeheath_city").val(cnnativeheath[2]);
				 	$("#cnnativeheath_address").val(cnnativeheath[3]);
				 	
				 	var ennativeheath =data.ennativeheath.split("&");
				 	$("#ennativeheath_isscountry").val(ennativeheath[0]);
				 	$("#ennativeheath_province").val(ennativeheath[1]);
				 	$("#ennativeheath_city").val(ennativeheath[2]);
				 	$("#ennativeheath_address").val(ennativeheath[3]);
				 	var reason1=data.reason1.split(","); 
				 	for (var index = 0; index < reason1.length; index++) {
				 		if(reason1[index]==1){
				 			$("input:checkbox[value='1']").eq(3).attr('checked','true');
				 		}else if(statement[index]==2){
				 			$("input:checkbox[value='2']").eq(1).attr('checked','true');
				 			$("#reason2desc").val(data.reason2desc);
				 		}
				 	}
				 	
	  		$.ajax({
				 url:path + '/newContEnter/selectTaxrevenue.do',  
		         type: "POST",
		         data:{"transno":transno},
				 success: function(data){
				
				 for (var index = 0; index < data.length; index++) {
				 	$("#residentnumber"+index).val(data[index].residentnumber);
				 	$("#residentcountry"+index).val(data[index].residentcountry);
				 }
				 	
				 	
				 }
				}); 	
				 }
				 

				 
				});
		       var beneSort=document.getElementsByName("beneSort");
		       var benePart=document.getElementsByName("benePart");
		       var beneName=document.getElementsByName("beneName");
		       var beneBirth=document.getElementsByName("beneBirth");
		       var beneIdNumber=document.getElementsByName("beneIdNumber");
		       var beneSex=document.getElementsByName("beneSex");
		       var beneIdCard=document.getElementsByName("beneIdCard");
		       var relationtoinsured=document.getElementsByName("relationtoinsured");
		       //受益人1
		         $.ajax({
				 url:path + '/newContEnter/selectlcbnf.do',  
		         type: "POST",
		         data:{"transno":transno,"bnfno":"1"},
				 success: function(data){
				 	
					if(data.getform==1){//法定
					
						$("#beneIsTrue").select2("val","Y");
						$("#addbene").hide() //添加受益人按钮隐藏
					}else if(data.getform==2){
						$("#save5").removeAttr("disabled");//保存被保人
						$("#addbene").show();
						$("#beneIsTrue").select2("val","N");
						
						addbenefer();
						beneSort[0].value=data.bnfno;//受益人顺序
						benePart[0].value=data.bnflot;//受益人比例
						beneName[0].value=data.name;//姓名
						$(beneSex[0]).select2("val",data.sex);//性别
						beneBirth[0].value=dateToString(data.birthday);//出生日期
						$(beneIdCard[0]).select2("val",data.idtype);//证件类型
						beneIdNumber[0].value=data.idno;//证件号码
						$(relationtoinsured[0]).select2("val",data.relationtoinsured);//关系
						
						//受益人2
				         $.ajax({
						 url:path + '/newContEnter/selectlcbnf.do',  
				         type: "POST",
				         data:{"transno":transno,"bnfno":"2"},
						 success: function(data){
						 		if(data.getform!=null&&data.getform!=""){
						 			addbenefer();
									beneSort[1].value=data.bnfno;//受益人顺序
									benePart[1].value=data.bnflot;//受益人比例
									beneName[1].value=data.name;//姓名
									$(beneSex[1]).select2("val",data.sex);//性别
									beneBirth[1].value=dateToString(data.birthday);//出生日期
									$(beneIdCard[1]).select2("val",data.idtype);//证件类型
									beneIdNumber[1].value=data.idno;//证件号码
									$(relationtoinsured[1]).select2("val",data.relationtoinsured);//关系
						
						 		}
						 		
						 		//受益人3
				         $.ajax({
						 url:path + '/newContEnter/selectlcbnf.do',  
				         type: "POST",
				         data:{"transno":transno,"bnfno":"3"},
						 success: function(data){
						 		if(data.getform!=null&&data.getform!=""){
						 			addbenefer();
									beneSort[2].value=data.bnfno;//受益人顺序
									benePart[2].value=data.bnflot;//受益人比例
									beneName[2].value=data.name;//姓名
									$(beneSex[2]).select2("val",data.sex);//性别
									beneBirth[2].value=dateToString(data.birthday);//出生日期
									$(beneIdCard[2]).select2("val",data.idtype);//证件类型
									beneIdNumber[2].value=data.idno;//证件号码
									$(relationtoinsured[2]).select2("val",data.relationtoinsured);//关系
						
						 		}
						 		
						 		    //受益人4
				         $.ajax({
						 url:path + '/newContEnter/selectlcbnf.do',  
				         type: "POST",
				         data:{"transno":transno,"bnfno":"4"},
						 success: function(data){
						 		if(data.getform!=null&&data.getform!=""){
						 			addbenefer();
									beneSort[3].value=data.bnfno;//受益人顺序
									benePart[3].value=data.bnflot;//受益人比例
									beneName[3].value=data.name;//姓名
									$(beneSex[3]).select2("val",data.sex);//性别
									beneBirth[3].value=dateToString(data.birthday);//出生日期
									$(beneIdCard[3]).select2("val",data.idtype);//证件类型
									beneIdNumber[3].value=data.idno;//证件号码
									$(relationtoinsured[3]).select2("val",data.relationtoinsured);//关系
						
						 		}
						 		
						 		
				         //受益人5
				         $.ajax({
						 url:path + '/newContEnter/selectlcbnf.do',  
				         type: "POST",
				         data:{"transno":transno,"bnfno":"5"},
						 success: function(data){
						 		if(data.getform!=null&&data.getform!=""){
						 			addbenefer();
									beneSort[4].value=data.bnfno;//受益人顺序
									benePart[4].value=data.bnflot;//受益人比例
									beneName[4].value=data.name;//姓名
									$(beneSex[4]).select2("val",data.sex);//性别
									beneBirth[4].value=dateToString(data.birthday);//出生日期
									$(beneIdCard[4]).select2("val",data.idtype);//证件类型
									beneIdNumber[4].value=data.idno;//证件号码
									$(relationtoinsured[4]).select2("val",data.relationtoinsured);//关系
						
						 		}
					      }
				       })		
					      }
				       })
				       		
					      }
				       })
						 			
					      }
				       })
					}
			      }
		       })  
		       
		       showTime(); 
}

			//设置3秒倒计时异步读取lcpol数据
				//设定倒数秒数 
				var t = 3; 
				//显示倒数秒数 
				function showTime(){ 
				
				t -= 1; 
				
				if(t==0){ 
				//主险种信息查询
		           //被保人人地址
		         $.ajax({
				 url:path + '/newContEnter/selectLcpol.do',  
		         type: "POST",
		         data:{"transno":transno,"grpcontno":"1"},
				 success: function(data){
					if(data.proposalno!=null&&data.proposalno!=""){
						$("#riskcode").select2("val",data.riskcode);//保险公司 
						$("#prem").val(data.prem);//保费
						$("#amnt").val(data.amnt);//保额
						$("#mult").val(data.mult);//份数
						$("#insuyear").select2("val",data.insuyear);//保险期间
						$("#insuyearflag").select2("val",data.insuyearflag);//保险期间分类
						$("#payendyear").select2("val",data.payendyear);//缴费期间
						$("#payendyearflag").select2("val",data.payendyearflag);//缴费期间分类
						$("#payintv").select2("val",data.payintv);//缴费方式
						$("#getage").val(data.getyear);//年金/约定领取年龄
						$("#getform").select2("val",data.getform);//年金领取方式
						selectLmrisk1();
						
						$.ajax({
							 url:path + '/newContEnter/selectLcpol.do',  
					         type: "POST",
					         async: false,
					         data:{"transno":transno,"grpcontno":"2"},
							 success: function(data){
								if(data.proposalno!=null&&data.proposalno!=""){
									$("#riskcode1").select2("val",data.riskcode);//保险期间
									selectLmrisk1();
									$("#prem1").val(data.prem);//保费
									$("#amnt1").val(data.amnt);//保额
									$("#mult1").val(data.mult);//份数
									$("#insuyear1").select2("val",data.insuyear);//保险期间
									$("#insuyearflag1").select2("val",data.insuyearflag);//保险期间分类
									$("#payendyear1").select2("val",data.payendyear);//缴费期间
									$("#payendyearflag1").select2("val",data.payendyearflag);//缴费期间分类
									$("#payintv1").select2("val",data.payintv);//缴费方式
									$("#getage1").val(data.getyear);//年金/约定领取年龄
									$("#getform1").select2("val",data.getform);//年金领取方式
									
									$.ajax({
									 url:path + '/newContEnter/selectLcpol.do',  
							         type: "POST",
							         async: false,
							         data:{"transno":transno,"grpcontno":"3"},
									 success: function(data){
										if(data.proposalno!=null&&data.proposalno!=""){
											$("#riskcode2").select2("val",data.riskcode);//保险期间
											selectLmrisk2();
											$("#prem2").val(data.prem);//保费
											$("#amnt2").val(data.amnt);//保额
											$("#mult2").val(data.mult);//份数
											$("#insuyear2").select2("val",data.insuyear);//保险期间
											$("#insuyearflag2").select2("val",data.insuyearflag);//保险期间分类
											$("#payendyear2").select2("val",data.payendyear);//缴费期间
											$("#payendyearflag2").select2("val",data.payendyearflag);//缴费期间分类
											$("#payintv2").select2("val",data.payintv);//缴费方式
											$("#getage2").val(data.getyear);//年金/约定领取年龄
											$("#getform2").select2("val",data.getform);//年金领取方式
											 $.ajax({
												 url:path + '/newContEnter/selectLcpol.do',  
										         type: "POST",
										         async: false,
										         data:{"transno":transno,"grpcontno":"4"},
												 success: function(data){
													if(data.proposalno!=null&&data.proposalno!=""){
														$("#riskcode3").select2("val",data.riskcode);//保险期间
														selectLmrisk3();
														$("#prem3").val(data.prem);//保费
														$("#amnt3").val(data.amnt);//保额
														$("#mult3").val(data.mult);//份数
														$("#insuyear3").select2("val",data.insuyear);//保险期间
														$("#insuyearflag3").select2("val",data.insuyearflag);//保险期间分类
														$("#payendyear3").select2("val",data.payendyear);//缴费期间
														$("#payendyearflag3").select2("val",data.payendyearflag);//缴费期间分类
														$("#payintv3").select2("val",data.payintv);//缴费方式
														$("#getage3").val(data.getyear);//年金/约定领取年龄
														$("#getform3").select2("val",data.getform);//年金领取方式
														 	 $.ajax({
																 url:path + '/newContEnter/selectLcpol.do',  
														         type: "POST",
														         async: false,
														         data:{"transno":transno,"grpcontno":"5"},
																 success: function(data){
																	if(data.proposalno!=null&&data.proposalno!=""){
																		$("#riskcode4").select2("val",data.riskcode);//保险期间
																		selectLmrisk4();
																		$("#prem4").val(data.prem);//保费
																		$("#amnt4").val(data.amnt);//保额
																		$("#mult4").val(data.mult);//份数
																		$("#insuyear4").select2("val",data.insuyear);//保险期间
																		$("#insuyearflag4").select2("val",data.insuyearflag);//保险期间分类
																		$("#payendyear4").select2("val",data.payendyear);//缴费期间
																		$("#payendyearflag4").select2("val",data.payendyearflag);//缴费期间分类
																		$("#payintv4").select2("val",data.payintv);//缴费方式
																		$("#getage4").val(data.getyear);//年金/约定领取年龄
																		$("#getform4").select2("val",data.getform);//年金领取方式
																		
																	}
															      }
														       }) 
													}
											      }
										       })
										}
								      }
							       })
						
								}
						      }
					       })
						
	
					}
			      }
		       })
				} 
				//每秒执行一次,showTime() 
				setTimeout("showTime()",1000); 
				} 
				//执行showTime() 
	
			
//投保单信息效验
function LccontValidata(){
		if($("#field-1").val()==""||$("#field-1").val()==null){
			
			var id="field-1";
			var msg="请选择保险公司";
            return Selecttips(id,msg);
			
			
		}
	/*	if($("#field-2").val()==""||$("#field-2").val()==null){
			var id="field-2";
			var msg="请输入投保单号";
			 return tips(id,msg);
		}*/
//		if($("#field-5").val()==""||$("#field-5").val()==null){
//			var id="field-5";
//			var msg="请输入客户经理手续费比例";
//			return tips(id,msg);
//		}
//		if($("#field-5").val()!="100"){
//		
//			
//			var id="field-5";
//			var msg="客户经理手续费比例为100";
//			return tips(id,msg);
//			
//			
//		}
		if($("#field-7").val()==""||$("#field-7").val()==null){
			
			var id="field-7";
			var msg="请选择保单递送方式";
            return Selecttips(id,msg);
		}
		return true;
}
//投保人效验
function LcappntValidata(){
	if($("#field-8").val()==""||$("#field-8").val()==null){
		

			var id="field-8";
			var msg="请输入投保人姓名";
			return tips(id,msg);
			
			
		}
		if($("#field-9").val()==""||$("#field-9").val()==null){
			var id="field-9";
			var msg="请选择证件类型";
            return Selecttips(id,msg);
		}
		if($("#field-10").val()==""||$("#field-10").val()==null){
			
			var id="field-10";
			var msg="请输入证件号码";
			return tips(id,msg);
		}
		if($("#field-9").val()=="1"){
			if($("#field-10").val().length!=15&&$("#field-10").val().length!=18){
				
			var id="field-10";
			var msg="证件为身份证的时候证件号码长度必须为15或18位";
			return tips(id,msg);
		}
		}
		
		if($("#field-11").val()==""||$("#field-11").val()==null){
		
			var id="field-11";
			var msg="请选择性别";
            return Selecttips(id,msg);
		}
		if($("#field-12").val()==""||$("#field-12").val()==null){
			
			var id="field-12";
			var msg="请选择出生日期";
			return tips(id,msg);
			
		}
		if($("#field-14").val()==""||$("#field-14").val()==null){
			
	
			var id="field-14";
			var msg="请选择证件有效起期";
			return tips(id,msg);
		}
		if($("#field-15").val()==""||$("#field-15").val()==null){
			
			var id="field-15";
			var msg="请选择证件有效止期";
			return tips(id,msg);
		}
	
		
		/*var date=new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate();
	
		if(dateToString($("#field-14")).val()<date){
			var id="field-14";
			var msg="证件有效起期必须大于今天";
			return tips(id,msg);
			
		}
		if(dateToString($("#field-14").val())>dateToString($("#field-15").val())){
			
			var id="field-14";
			var msg="证件有效起期必须小于证件有效止期";
			return tips(id,msg);
		}*/
		if($("#field-16").val()==""||$("#field-16").val()==null){
             var id="field-16";
			var msg="请选择投保人国籍";
            return Selecttips(id,msg);
		}
		if($("#field-17").val()==""||$("#field-17").val()==null){
			
			  var id="field-17";
			var msg="请选择投保人职业代码";
            return Selecttips(id,msg);
		}
		if($("#field-19").val()==""||$("#field-19").val()==null){
			var id="field-19";
			var msg="请输入工资";
			return tips(id,msg);
		
		}
	
		if($("#field-7").val()==1){
			if($("#field-21").val()==null||$("#field-21").val()==""){
				
				var id="field-21";
				var msg="保单递送方式为邮寄,邮寄编码不能为空";
				return tips(id,msg);
			}
			if($("#field-21").val().length!=6){
	
				var id="field-21";
				var msg="邮寄编码长度必须是6位";
				return tips(id,msg);
			}
			
		}
		if($("#field-22").val()==""||$("#field-22").val()==null){
				var id="field-22";
				var msg="请输入移动电话";
				return tips(id,msg);
		}
		var RegMolibe = /^0{0,1}(13[0-9]|14[0-9]|15[0-9]|17[0-9]|18[0-9])[0-9]{8}$/;
		
		if(!RegMolibe.test($("#field-22").val())){
				var id="field-22";
				var msg="移动电话格式有误";
				return tips(id,msg);
		}

		if($("#field-24").val()!=""&&$("#field-24").val()!=null){
			if(!RegMolibe.test($("#field-24").val())){
				var id="field-24";
				var msg="联系电话格式有误";
				return tips(id,msg);
		}
		}
			var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/; 
			if($("#field-7").val()==2){
			if($("#field-23").val()==null||$("#field-23").val()==""){
				
			
			
				var id="field-23";
				var msg="保单递送方式为电子,电子邮件不能为空";
				return tips(id,msg);
			}
			if(!reg.test($("#field-23").val())){
				var id="field-23";
				var msg="电子邮件格式有误";
				return tips(id,msg);
			}
		}

		if($("#field-31").val()==""||$("#field-31").val()==null){
			
			var id="field-31";
			var msg="请选择有无健康标识";
            return Selecttips(id,msg);
		}
		if($("#field-32").val()==""||$("#field-32").val()==null){
			
			var id="field-32";
			var msg="请选择居民居住类型";
            return Selecttips(id,msg);
		}
		if($("#field-33").val()==""||$("#field-33").val()==null){
			
			
			var id="field-33";
			var msg="请输入个人年收入";
			return tips(id,msg);
		}
		if($("#areaCall").val()==""||$("#areaCall").val()==null){
			var id="areaCall";
			var msg="请输入区号";
			return tips(id,msg);
		}
		
		if($("#call").val()==""||$("#call").val()==null){
			var id="call";
			var msg="请输入区号后面的号码";
			return tips(id,msg);
		}
		if($("#loc_province-sub1").val()==""||$("#loc_province-sub1").val()==null){
			var id="loc_province-sub1";
			var msg="请选择邮编地址省份";
            return CitySelecttips(id,msg);
		}
		if($("#loc_city-sub1").val()==""||$("#loc_city-sub1").val()==null){
			var id="loc_city-sub1";
			var msg="请选择邮编地址地级市";
            return CitySelecttips(id,msg);
		}
		if($("#loc_town-sub1").val()==""||$("#loc_town-sub1").val()==null){
			var id="loc_town-sub1";
			var msg="请选择邮编地址市县区";
            return CitySelecttips(id,msg);
		}
		if($("#postaladdress").val()==""||$("#postaladdress").val()==null){
			
			
			var id="postaladdress";
			var msg="请输入邮编地址详细地址";
			return tips(id,msg);
		}
		
		if($("#loc_province-sub2").val()==""||$("#loc_province-sub2").val()==null){
			var id="loc_province-sub2";
			var msg="请选择家庭地址省份";
            return CitySelecttips(id,msg);
		}
		if($("#loc_city-sub2").val()==""||$("#loc_city-sub2").val()==null){
				var id="loc_city-sub2";
			var msg="请选择家庭地址地级市";
            return CitySelecttips(id,msg);
		}
		if($("#loc_town-sub2").val()==""||$("#loc_town-sub2").val()==null){
			var id="loc_town-sub2";
			var msg="请选择家庭地址市县区";
            return CitySelecttips(id,msg);
		}
		if($("#homeaddress").val()==""||$("#homeaddress").val()==null){
				
			var id="homeaddress";
			var msg="请输入家庭地址详细地址";
			return tips(id,msg);
		}
	
		
		return true;
		
		
		
}
//被保人效验	
	function LcinsuredValidata(){
		if($("#relationtoappnt").val()==""||$("#relationtoappnt").val()==null){
			var id="relationtoappnt";
			var msg="请选择与投保人的关系";
            return Selecttips(id,msg);
		}
		if($("#LCInsuredname").val()==""||$("#LCInsuredname").val()==null){
			var id="LCInsuredname";
			var msg="请输入被保人姓名";
			return tips(id,msg);
		}
		if($("#LCInsuredidtype").val()==""||$("#LCInsuredidtype").val()==null){
			var id="LCInsuredidtype";
			var msg="请选择被保人的证件类型";
            return Selecttips(id,msg);
		}
		if($("#LCInsuredidno").val()==""||$("#LCInsuredidno").val()==null){
			var id="LCInsuredidno";
			var msg="请输入被保人证件号码";
			return tips(id,msg);
		}
		if($("#LCInsuredidtype").val()=="1"){
			if($("#LCInsuredidno").val().length!=15&&$("#LCInsuredidno").val().length!=18){
				var id="LCInsuredidno";
				var msg="证件类型是身份证，证件号码长度必须是15或18位";
				return tips(id,msg);
			}
		}
		if($("#LCInsuredsex").val()==""||$("#LCInsuredsex").val()==null){
			var id="LCInsuredsex";
			var msg="请选择被保人性别";
			return Selecttips(id,msg);
		}
		if($("#LCInsuredbirthday").val()==""||$("#LCInsuredbirthday").val()==null){
			var id="LCInsuredbirthday";
			var msg="请输入被保人出生日期";
			return tips(id,msg);
		}
		if($("#insureidstartdate").val()==""||$("#insureidstartdate").val()==null){
			var id="insureidstartdate";
			var msg="请输入被保人证件有效起期";
			return tips(id,msg);
		}
		
		if($("#insureidenddate").val()==""||$("#insureidenddate").val()==null){
			var id="insureidenddate";
			var msg="请输入被保人证件有效止期";
			return tips(id,msg);
		}
		if($("#LCInsuredhealth").val()==""||$("#LCInsuredhealth").val()==null){
			var id="LCInsuredhealth";
			var msg="请选择有无健康标识";
			return Selecttips(id,msg);
		}
		if($("#LCInsuredoccupationcode").val()==""||$("#LCInsuredoccupationcode").val()==null){
			var id="LCInsuredoccupationcode";
			var msg="请选择职业代码";
			return Selecttips(id,msg);
		}
		if($("#loc_province-sub3").val()==""||$("#loc_province-sub1").val()==null){
			var id="loc_province-sub3";
			var msg="请选择邮编地址省份";
            return CitySelecttips(id,msg);
		}
		if($("#loc_city-sub3").val()==""||$("#loc_city-sub1").val()==null){
			var id="loc_city-sub3";
			var msg="请选择邮编地址地级市";
            return CitySelecttips(id,msg);
		}
		if($("#loc_town-sub3").val()==""||$("#loc_town-sub1").val()==null){
			var id="loc_town-sub3";
			var msg="请选择邮编地址市县区";
            return CitySelecttips(id,msg);
		}
		if($("#LCInsuredpostaladdress").val()==""||$("#LCInsuredpostaladdress").val()==null){
			
			
			var id="LCInsuredpostaladdress";
			var msg="请输入邮编地址详细地址";
			return tips(id,msg);
		}
		
		if($("#loc_province-sub4").val()==""||$("#loc_province-sub2").val()==null){
			var id="loc_province-sub4";
			var msg="请选择家庭地址省份";
            return CitySelecttips(id,msg);
		}
		if($("#loc_city-sub4").val()==""||$("#loc_city-sub2").val()==null){
				var id="loc_city-sub4";
			var msg="请选择家庭地址地级市";
            return CitySelecttips(id,msg);
		}
		if($("#loc_town-sub4").val()==""||$("#loc_town-sub2").val()==null){
			var id="loc_town-sub4";
			var msg="请选择家庭地址市县区";
            return CitySelecttips(id,msg);
		}
		if($("#LCInsuredhomeaddress").val()==""||$("#LCInsuredhomeaddress").val()==null){
			var id="LCInsuredhomeaddress";
			var msg="请输入家庭地址详细地址";
			return tips(id,msg);
		}
		
		
		
		
		
		
		
		
		return true;	
		
		
		
	}
	//受益人效验
	function lcbnfValidata(){
	
		
		if($("#beneIsTrue").val()==""||$("#beneIsTrue").val()==null){
			var id="beneIsTrue";
			var msg="请选择是否法定受益人";
            return CitySelecttips(id,msg);
            
		}
		
		if($("#beneIsTrue").val()=="N"){
			 $("input[name='beneSort']").each(function(index,item){
				if($(this).val()==""||$(this).val()==null){
					$(this).tips({
					side:2,
		            msg:"请输入受益人顺序",
		            bg:'#AE81FF',
		            time:2
		       	});
					$(this).focus();
					$(this).val('');
					$(this).css("background-color","white");
					flag=false;
					return false;
				}else{
					return true;
					flag=true;
				}
			
			 });
				if(flag==false){
					return false;
				}
			
			 $("input[name='benePart']").each(function(index,item){
				if($(this).val()==""||$(this).val()==null){
					$(this).tips({
					side:2,
		            msg:"请输入受益人比例",
		            bg:'#AE81FF',
		            time:2
		       	});
					$(this).focus();
					$(this).val('');
					$(this).css("background-color","white");
					flag=false;
					return false;
				}else{
					return true;
					flag=true;
				}
					
			 });
			if(flag==false){
				return false;
			}
			
			 $("input[name='beneName']").each(function(index,item){
				if($(this).val()==""||$(this).val()==null){
					$(this).tips({
					side:2,
		            msg:"请输入受益人姓名",
		            bg:'#AE81FF',
		            time:2
		       	});
					$(this).focus();
					$(this).val('');
					$(this).css("background-color","white");
					flag=false;
					return false;
				}else{
					return true;
					flag=true;
				}
					
			 });
			
			if(flag==false){
				return false;
			}
		
		$("select[name='beneSex']").each(function(){
			
				if($(this).val()==""||$(this).val()==null){
					$(this).tips({
					side:2,
		            msg:"请选择受益人性别",
		            bg:'#AE81FF',
		            time:2,
		           	x:10,
		            y:300
		       	});
					$(this).focus();
					$(this).val('');
					$(this).css("background-color","white");
					flag=false;
					return false;
				}else{
					return true;
					flag=true;
				}
					
			 });
			if(flag==false){
				return false;
			}	
		
			 $("input[name='beneBirth']").each(function(index,item){
				if($(this).val()==""||$(this).val()==null){
					$(this).tips({
					side:2,
		            msg:"请输入受益人生日",
		            bg:'#AE81FF',
		            time:2
		       	});
					$(this).focus();
					$(this).val('');
					$(this).css("background-color","white");
					flag=false;
					return false;
				}else{
					return true;
					flag=true;
				}
					
			 });
			
			if(flag==false){
				return false;
			}
			
			$("select[name='beneIdCard']").each(function(){
			
				if($(this).val()==""||$(this).val()==null){
					$(this).tips({
					side:2,
		            msg:"请选择受益人证件类型",
		            bg:'#AE81FF',
		            time:2,
		           	x:10,
		            y:300
		       	});
					$(this).focus();
					$(this).val('');
					$(this).css("background-color","white");
					flag=false;
					return false;
				}else{
					return true;
					flag=true;
				}
					
			 });
			if(flag==false){
				return false;
			}	
			
			 $("input[name='beneIdNumber']").each(function(index,item){
				if($(this).val()==""||$(this).val()==null){
					$(this).tips({
					side:2,
		            msg:"请输入受益人证件号码",
		            bg:'#AE81FF',
		            time:2
		       	});
					$(this).focus();
					$(this).val('');
					$(this).css("background-color","white");
					flag=false;
					return false;
				}else{
					return true;
					flag=true;
				}
					
			 });
			
			if(flag==false){
				return false;
			}
			
			$("select[name='relationtoinsured']").each(function(){
			
				if($(this).val()==""||$(this).val()==null){
					$(this).tips({
					side:2,
		            msg:"请选择与被保人的关系",
		            bg:'#AE81FF',
		            time:2,
		           	x:10,
		            y:300
		       	});
					$(this).focus();
					$(this).val('');
					$(this).css("background-color","white");
					flag=false;
					return false;
				}else{
					return true;
					flag=true;
				}
					
			 });
			return flag;
		}
	}
	
	function lcpolValidata(){
		
		if($("#prem").val()==""||$("#prem").val()==null){
			alert("请输入保费");
			$("#prem").focus();
			return false;
		}
		if($("#amnt").val()==""||$("#amnt").val()==null){
				alert("请输入保额");
				$("#amnt").focus();
				return false;
		}
		if($("#mult").val()==""||$("#mult").val()==null){
				alert("请输入分数");
				$("#mult").focus();
				return false;
		}
		if($("#insuyear").val()==""||$("#insuyear").val()==null){
			alert("请选择保险期间");
			$("#insuyear").focus();
			return false;
		}
		
		if($("#insuyearflag").val()==""||$("#insuyearflag").val()==null){
			alert("请选择保险期间分类");
			$("#insuyearflag").focus();
			return false;
						
		}
		
		if($("#payendyear").val()==""||$("#payendyear").val()==null){
			alert("请选择缴费期间");
			$("#payendyear").focus();
			return false;
						
		}
		
		if($("#payendyearflag").val()==""||$("#payendyearflag").val()==null){
			alert("请选择缴费期间分类");
			$("#payendyearflag").focus();
			return false;
						
		}
		if($("#insuyearflag").val()=="A"){
			if($("#payendyearflag").val()!="A"){
				alert("保险期间分类为岁保的时候缴费期间分类必须是岁缴");
				return false;
			}
		}
		if($("#insuyearflag").val()=="Y"){
			if($("#payendyearflag").val()!="Y"){
				alert("保险期间分类为年保的时候缴费期间分类必须是年缴");
				return false;
			}
		}
		
		if($("#payintv").val()==""||$("#payintv").val()==null){
			alert("请选择缴费方式");
			$("#payintv").focus();
			return false;
						
		}
		if($("#getage").val()==""||$("#getage").val()==null){
			alert("请输入年金/约定领取方式");
			$("#getage").focus();
			return false;
						
		}
		if($("#getform").val()==""||$("#getform").val()==null){
			alert("请选择年金领取方式");
			$("#getform").focus();
			return false;				
		}
		
		if($("#riskcode1").val()!=null&&$("#riskcode1").val()!=""){
			if($("#prem1").val()==""||$("#prem1").val()==null){
			alert("请输入保费");
			$("#prem1").focus();
			return false;
		}
		if($("#amnt1").val()==""||$("#amnt1").val()==null){
				alert("请输入保额");
				$("#amnt1").focus();
				return false;
		}
		if($("#mult1").val()==""||$("#mult1").val()==null){
				alert("请输入分数");
				$("#mult1").focus();
				return false;
		}
		if($("#insuyear1").val()==""||$("#insuyear1").val()==null){
			alert("请选择保险期间");
			$("#insuyear1").focus();
			return false;
		}
		
		if($("#insuyearflag1").val()==""||$("#insuyearflag1").val()==null){
			alert("请选择保险期间分类");
			$("#insuyearflag1").focus();
			return false;
						
		}
		
		if($("#payendyear1").val()==""||$("#payendyear1").val()==null){
			alert("请选择缴费期间");
			$("#payendyear1").focus();
			return false;
						
		}
		
		if($("#payendyearflag1").val()==""||$("#payendyearflag1").val()==null){
			alert("请选择缴费期间分类");
			$("#payendyearflag1").focus();
			return false;
						
		}
		if($("#insuyearflag1").val()=="A"){
			if($("#payendyearflag1").val()!="A"){
				alert("保险期间分类为岁保的时候缴费期间分类必须是岁缴");
				return false;
			}
		}
		if($("#insuyearflag1").val()=="Y"){
			if($("#payendyearflag1").val()!="Y"){
				alert("保险期间分类为年保的时候缴费期间分类必须是年缴");
				return false;
			}
		}
		
		if($("#payintv1").val()==""||$("#payintv1").val()==null){
			alert("请选择缴费方式");
			$("#payintv1").focus();
			return false;
						
		}
		if($("#getage1").val()==""||$("#getage1").val()==null){
			alert("请输入年金/约定领取方式");
			$("#getage1").focus();
			return false;
						
		}
		if($("#getform1").val()==""||$("#getform1").val()==null){
			alert("请选择年金领取方式");
			$("#getform1").focus();
			return false;				
		}
		}

		return true;
	}
	//添加投连账户
	function addLcaccountinfo(){
		if(num=='5'){
		alert("不能超过5个投连账户");
		return false;
	}
	num++;
	var tr = "<tr>" +
								"<td >"+"<input type='text' value="+num+" id=" + 'row'+ num + ''+ " readonly='readonly' style='text-align:center'>" +"</td>"+
							    "<td id=" + 'type'+ num + ''+ ">"+"<select class='form-control' style='width:90%;' id="+ 'a'+ num+ ''+ " name="+ 'AccNo'+ " >+  "+"<option value=''>--请选择--</option>"+"</select>"+"</td>"+
							    	"<td >"+"<input type='text'  id=" + 'b'+ num + ''+ " name="+'AccRate'+" style='text-align:center'>" +"</td>"+
								  
					         "</tr>";											
	$("#castAccount").append(tr);// 在table最后面添加一行
			//投保人国籍查询	
				//投保人证件类型
				$.ajax({
						 url:path + '/LdcodeController/selectLcodeByCodetype.do',  
				         type: "POST",
				         async: false,
				         data:{"codetype":"investaccformanulife"},
						 success: function(data){
						 for(var i=0;i<data.length;i++){
							var select=document.getElementById("a"+num);
						    var option=document.createElement("option");
							option.value=data[i].code.replace(/^\s+|\s+$/g, '');
							option.innerHTML=data[i].code+"-"+data[i].codename;
							select.appendChild(option);	
							
						 	 }
						 }
					})
	}


	