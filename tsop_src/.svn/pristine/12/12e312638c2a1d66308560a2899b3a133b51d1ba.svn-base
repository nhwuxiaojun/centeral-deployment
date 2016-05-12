<%
System.out.println(session.getAttribute("username"));
String shell= new String();
shell = "/usr/local/ts_op/Oracle/Middleware/user_projects/domains/base_domain/scripts/tsop_deploy.sh " + request.getParameter("file") + " " + " "+request.getParameter("deploy_type")+" " + session.getAttribute("username") + " "+request.getParameter("deploy_con");
out.println(shell);
System.out.println(shell);
%>
<a href=# onClick=window.history(-1)> back </a>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java"%> 
<%@page import="java.io.*"%> 
<%@page import="java.util.List"%> 
<%@page import="org.apache.commons.fileupload.*"%> 
<%@page import="org.apache.commons.fileupload.util.Streams"%> 
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%> 
<% 
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1    
request.setCharacterEncoding("UTF-8"); 
System.out.println(request.getParameter("env_id"));
System.out.println(request.getParameter("env_name"));
System.out.println(request.getParameter("file"));
System.out.println(request.getParameter("deploy_type"));
System.out.println(request.getParameter("deploy_con"));
String fileName = new String();
%>
<%
java.io.File f = new java.io.File( "/usr/local/deploy/"+request.getParameter("env_name") ) ;
System.out.println( f.mkdirs() ? "Folder created" : "Create failed!" ) ;
%>
<%
// Check that we have a file upload request 
if(ServletFileUpload.isMultipartContent(request)) 
{ 
// Create a new file upload handler 
ServletFileUpload upload = new ServletFileUpload(); 

// Parse the request 
FileItemIterator iter = upload.getItemIterator(request); 
while(iter.hasNext()) 
{ 
FileItemStream item = iter.next(); 
String fieldName = item.getFieldName(); 
String pkgFileName = item.getName();
InputStream is = item.openStream(); 
if(item.isFormField()) //regular form field 
{ 
%> 

<!-- read a FileItemStream's content into a string. --> 
<h3><%=fieldName%> --> <%=Streams.asString(is)%></h3> 
<% 
} 
else 
{ //file upload 
fileName = item.getName(); 
//File uploadedFile = new File(config.getServletContext().getRealPath("/") + "/deploy/" + File.separator + fieldName + "_" + fileName); 
int pos=fileName.lastIndexOf("\\");
if (pos>0){
	fileName=fileName.substring(pos+1);
}
File uploadedFile = new File("/usr/local/deploy/" +request.getParameter("env_name")+"/"+ fileName); 
OutputStream os = new FileOutputStream(uploadedFile); 
// write file to disk and close outputstream. 
Streams.copy(is, os, true); 
Thread.sleep(5000);
%> 
<html>
<head>
<title>Deployment Done - <%=request.getParameter("env_name")%></title>
</head>
<body>
<h4>Package <%=uploadedFile.getName()%> was deployed on env <%=request.getParameter("env_name")%>.</h4> 
Please review the deployment log as below.  &nbsp;&nbsp;
<button name="Close" value="Close" onclick="window.close()">Close</button>
<button name="Back" value="Back" onclick="history.go(-1)">Back</button>
<hr>
<% 
} 
} 
} 
%> 
<hr>
<center><button name="Close" value="Close" onclick="window.close()">Close</button></center>
</body>
</html>
