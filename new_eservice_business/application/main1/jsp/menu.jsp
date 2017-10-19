<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<META HTTP-EQUIV="pragma" CONTENT="no-cache"> 
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"> 
<META HTTP-EQUIV="expires" CONTENT="0">

  	<meta http-equiv="x-ua-compatible" content="IE=edge" >
	<meta charset="utf-8">
		
	<title>投保单查询</title>

</head>
<%@ include file="top.jsp" %>
<%@ include file="bottom1.jsp" %>
<!-- #DCDCDC -->
<body class="page-body skin-facebook" style="background-color: #376798">
	<div class="sidebar-menu toggle-others fixed" >
	<!--  -->
	<div class="page-container" style="background-color: #376798" >	
		<header >
			
			<!-- logo -->
			<div class="logo">
				<a href="#" class="logo-expanded">
					<img src="<%=request.getContextPath() %>/include/images/hsbc_logo_sc.png" width="150" alt="" />
				</a>
			</div>
			
		</header>
												
		<ul id="main-menu" class="main-menu">

		</ul>	
	</div>		


	<script src="<%=request.getContextPath() %>/include/js/jquery.js"></script>
	<script type="text/javascript">
		$(function(){
			$(".page-body").css("border")
		});
		 var path="<%=request.getContextPath()%>";
		
		 $(function(){
		 	var submenu="<%=request.getParameter("submenu")%>";
			 $.ajax({
					url:path+"/menuController/selectsubMenuAll.do",
					tyep:"post",
					dataType:"json",
					success:function(result){
						var mainmenu=$("#main-menu");
						mainmenu.empty();
						var str="";
						for(var i=0;i<result.length;i++){
							var beanlist=result[i];
							str+="<li><a href=\"#\" onclick='fmenuclick(this)'><span class='title'>"+beanlist[0][0].submenuname+"</span></a><ul class='menuul2'>";
							for(var j=0;j<beanlist.length;j++){
								var meddleBeanlist=beanlist[j];
								str+="<a href=\"#\" onclick='mmenuclick(this)'><span class='title'>&nbsp;&nbsp;&nbsp;"+meddleBeanlist[0].meddlemenuname+"</span></a><ul class='menuul2'>";
								for(var k=0;k<meddleBeanlist.length;k++){
									var bean=meddleBeanlist[k];
									str+="<li><a href="+(path+bean.menuLink)+"?submenu="+bean.submenu+"' target='main'  onclick='font(this)'> <span class=\"title\" >&nbsp;&nbsp;&nbsp;"+bean.menuName+"</span> </a> </li>";
								}
							str+="</ul>";
						}
						str+="</ul></li>";
					}	
						
					//alert(str)	;
					
					mainmenu.append(str);
					
					
					}
				});
		}); 
		 
		
	
	function fmenuclick(obj){
		var ul= $(obj).next("ul");
		//alert(ul.css("display")=="block")
		if(ul.css("display")=="block"){
			ul.css("display","none");
		} else{
			$("#main-menu ul").css("display","none");
			ul.css("display","block");
		}
		
	}
	function mmenuclick(obj){
		var ul= $(obj).next("ul");
		if(ul.css("display")=="block"){
			$(obj).parent().find("ul").css("display","none");
		} else{
			$("#main-menu ul ul").css("display","none");
			ul.css("display","block");
		}
	}
		
		/* function showul(obj){
			if($(obj).parent().find("ul").css("display")=="none"){
				$(".menuul").css("display","none");
				$(obj).parent().find("ul").css("display","block");
			}else{
				$(obj).parent().find("ul").css("display","none");
			}
		};
		function showul2(obj){
			if($(obj).parent().find("ul").css("display")=="none"){
					$(".menuul2").css("display","none");
					$(obj).parent().find("ul").css("display","block");
				}else{
					$(obj).parent().find("ul").css("display","none");
				}
		}; */
		
		
		function font(obj){
			
			
			var spans = document.getElementsByTagName("a");
			for (var i = 0; i < spans.length; i++) {
		           if(obj == spans[i]){
		        	   obj.style.color = "#E9A115";
		        	   obj.style.textDecoration = "underline";
		        	   continue;
		           }
		           spans[i].style.color = "#FFFFFF";
		     }
			
		}
	</script>
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

</div>

</body>
</html>