<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.jdom.input.DOMBuilder"%>
<%@page import="com.sinosoft.service.business.ui.contprint.XmlExportNew"%>
<%@page import="org.jdom.Document"%>
<%@page import="java.util.*"%>
<%@page import="com.f1j.util.*"%>
<%@page import="com.f1j.ss.*"%>

<%@page import="com.sinosoft.service.business.ui.contprint.XmlExportNew,
	com.sinosoft.service.business.ui.contprint.TransferData,
	com.sinosoft.service.business.ui.contprint.VData"%>

<%
	//String contNo =(String)request.getAttribute("contNo");
	String contNo =request.getParameter("contNo");
	String TransNo=request.getParameter("TransNo");//交易号
	String payDate=request.getParameter("payDate");//转账日期
	String payMoney=request.getParameter("payMoney");//转账金额
	String AgentCom =request.getParameter("insurancecom");
	boolean Flag=true;
	String content = "";
	//String sql = "select disputedflag from lccont where TransNo='"+TransNo+"'";
	//ExeSQL exeSQL= new  ExeSQL();
//	String disputeflag =exeSQL.execSQL(sql).GetText(1,1);
	//if("9".equals(disputeflag)){
		//Flag=false;
		//content="该投保单 已经成功核保！  成功核保后不允许打印投保单";
	//}else{

		String path = request.getContextPath();//    /sinoSpringMVC   /new_eservice_business
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		System.out.println(basePath);
		//          http://localhost:8080/new_eservice_business/
	%>

	<%

		VData tVData = new VData();
		tVData.addElement(contNo);
		tVData.addElement(application.getRealPath("").replace('\\', '/'));//获得路径
		tVData.addElement(TransNo);
		tVData.addElement(payDate);
		tVData.addElement(payMoney);
		
		VData mResult = new VData();
		
		System.out.println("开始执行打印操作");
		
		Class<?> fc   = Class.forName("com.sinosoft.service.business.ui.contprint.metLife.IreportPLTestMetLife");
		Object tIreportTestBL = fc.newInstance();
		boolean fg =(Boolean)fc.getMethod("setPrintData",VData.class).invoke(tIreportTestBL,tVData);
		
		if(!fg)
		{
		content = "发生错误";
		Flag=false;
		
		%>

	<%
		return;
		}
		else
		{
			XmlExportNew txmlExport = new XmlExportNew(); 
			mResult =(VData)fc.getMethod("getResult").invoke(tIreportTestBL); 
			txmlExport=(XmlExportNew)mResult.getObjectByObjectName("XmlExportNew",0);
			if(txmlExport==null)
	      	      {
	      	        Flag=false;
	      	        content="没有得到要显示的数据文件";	  
	      	      }
	      	      
	      	      int BUFSIZE = 1024 * 8;        
	              int rtnPos = 0;
	              byte[] buffs = new byte[ BUFSIZE ];
	              
	              try
	              {
	      		       ByteArrayOutputStream buffer = new ByteArrayOutputStream();  
	      		       int nRead; 
	      		       byte[] data = new byte[16384];  
	      		       while ((nRead = txmlExport.getInputStream().read(data, 0, data.length)) != -1) 
	      		       {   
	      		          buffer.write(data, 0, nRead); 
	      		       }  
	      		       buffer.flush();		       
	      		       byte[] reportContent = buffer.toByteArray(); ;//获取打印数据
	               	   int length = reportContent.length;  	
	               	   response.reset();//重定向，否则会报异常：java.net.ProtocolException: Exceeded stated content-length of:
	               	    
	               	   response.setContentType("application/pdf");
	                   response.setHeader("Content-Disposition", "inline;filename=bbb.pdf");
	                   response.setContentLength(length);
	                   response.getOutputStream().write(reportContent, 0, length);
	                   response.flushBuffer();
	                   out.clear();
	                   out = pageContext.pushBody();
	                   response.flushBuffer();     

	      	      
	              
			
			}catch(Exception ex)
			{
				ex.printStackTrace();
				Flag=false;
				content = "失败，原因是:" + ex.toString();
	          	 	  
			}
		}
		
		
	
		
	if(!Flag)
	{
%>
	<script language="javascript">
		alert('<%=content%>');
		window.opener = null;
		window.close();
</script>
<%
	}

%>