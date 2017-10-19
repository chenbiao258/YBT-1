<%@page import="com.sinosoft.service.business.ui.login.bean.LoginInfoBean"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
  	<meta http-equiv="x-ua-compatible" content="IE=edge" >
    <base href="<%=basePath%>">
 
    <title>YBT</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
 <frameset rows="0px,*,0px" border="0" frameborder="0" framespacing="0" marginwidth="0" marginheight="0">
<frame name="header"  scrolling="yes">
<frameset cols="300px,*" border="0" frameborder="0" framespacing="0">
<frame name="menu"  src="application/main1/jsp/menu.jsp" scrolling="auto">
<frame name="main"  scrolling="auto" src="application/main1/jsp/Test.jsp">
</frameset>
</frameset>
<noframes>
<body>  
</body>
</noframes> 



</html>
