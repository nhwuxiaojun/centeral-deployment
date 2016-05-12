<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java"%> 
<%@page import="java.io.*"%> 
<%@page import="java.util.List"%> 
<%@page import="org.apache.commons.fileupload.*"%> 
<%@page import="org.apache.commons.fileupload.util.Streams"%> 
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%> 
<% 
request.setCharacterEncoding("UTF-8"); 
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
InputStream is = item.openStream(); 
if(item.isFormField()) //regular form field 
{ 
%> 
<!-- read a FileItemStream's content into a string. --> 
<h1><%=fieldName%> --> <%=Streams.asString(is)%></h1> 
<% 
} 
else 
{ //file upload 
String fileName = item.getName(); 
//File uploadedFile = new File(config.getServletContext().getRealPath("/") + "/deploy/" + File.separator + fieldName + "_" + fileName); 
File uploadedFile = new File(config.getServletContext().getRealPath("/") + "/deploy/" + fileName); 
OutputStream os = new FileOutputStream(uploadedFile); 
// write file to disk and close outputstream. 
Streams.copy(is, os, true); 
%> 
<h1>upload file <%=uploadedFile.getName()%> done!</h1> 
<% 
} 
} 
} 
%> 
