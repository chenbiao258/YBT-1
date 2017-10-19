<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
  	<meta http-equiv="x-ua-compatible" content="IE=edge" >
    <base href="<%=basePath%>">

    <title>My JSP 'Test.jsp' starting page</title>
    
  </head>
 <script type="text/javascript">

</script>
  <body>
 <h1>欢迎${userLoginInfo.emplID}登陆 </h1>


</body>

</html>
