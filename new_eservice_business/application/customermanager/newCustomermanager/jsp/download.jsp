
<%@ page contentType="text/html;charset=GBK"%>
<%@page import="java.io.*"%>
<%
out.clear();
out = pageContext.pushBody();
%>
<%
	String path = request.getContextPath();
	String separator = System.getProperties().getProperty("file.separator");
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + separator;
	//String realPath = request.getRealPath("/");//路径
	String realPath =request.getSession().getServletContext().getRealPath("/");
	//FileFolderPath = /home/weblogic/Oracle/Middleware/user_projects/domains/app_domain/servers/bass/bassprd
	
	String message = "";
	try {
		
		response.setContentType("text/html");
		javax.servlet.ServletOutputStream ou = response
				.getOutputStream();
		String filepath = (String) request.getParameter("path");
		System.out.println("xiazaipath = " + filepath);
		//filepath = "d:/a.txt";
		//String xiazaipath = String.valueOf(request.getRealPath("/file/"))+"\\";
		//System.out.println("xiazaipath = " + xiazaipath);
		if(!realPath.endsWith("/") && !realPath.endsWith("\\")){
			realPath += separator;
		}
		File file = new File(filepath);//new File(basePath + filepath);
		System.out.println("file.getAbsolutePath() = " + file.getAbsolutePath());
		System.out.println("filepath = " + filepath);
		System.out.println("basePath = " + basePath);
		System.out.println("realPath = " + realPath);
		if (!file.exists()) {
			System.out.println(file.getAbsolutePath() + " 文件不存在!");
			message = "文件不存在!";
			return;
		}
		System.out.println();
		FileInputStream fileInputStream = new FileInputStream(file);
		out.clear();//清空输出流中的字节  zhangd 20091027
		BufferedOutputStream bos = new BufferedOutputStream(ou);
		if (filepath != null && filepath.length() > 0) {
			response.setContentType("application/x-msdownload");
			response.setHeader("Content-Disposition",
					"attachment; filename="
							+ new String(file.getName().getBytes(
									"GBK"), "ISO8859_1") + "");
			try{
				byte[] b = new byte[1];
		        int intLength; 
		        while((intLength=fileInputStream.read(b))>0)
		        {
			          bos.write(b,0,intLength); 
		        }
				fileInputStream.close();
				bos.flush();
				bos.close();
			}catch(Exception e){
				System.out.println("取消附件下载");
			}finally{
				try{
					fileInputStream.close();
					ou.close();
					out.clear();
					out = pageContext.pushBody();
				}catch(Exception ex){
					
				}
			}
		}
	} catch (Exception e) {
		System.out.println("取消2");
		e.printStackTrace();
	}
	//finally{
	//	out.write("<script type='text/javascript'>alert();window.close();");
	//}
%>