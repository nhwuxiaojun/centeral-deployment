<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@page import="java.io.*" %>
<%@page import="java.util.List" %>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="org.apache.commons.fileupload.util.Streams" %>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%
    response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1
    request.setCharacterEncoding("UTF-8");
    System.out.println(request.getParameter("env_id"));
    System.out.println(request.getParameter("email"));
    System.out.println("autotest is:"+request.getParameter("autotest"));
    System.out.println(request.getParameter("env_name"));
    System.out.println(request.getParameter("file"));
    System.out.println(request.getParameter("deploy_type"));
    System.out.println(request.getParameter("deploy_con"));
    String fileName = new String();
%>
<%
    java.io.File f = new java.io.File("/usr/local/deploy/" + request.getParameter("env_name"));
    System.out.println(f.mkdirs() ? "Folder created" : "Create failed!");
%>
<%
    // Check that we have a file upload request
    if (ServletFileUpload.isMultipartContent(request)) {
// Create a new file upload handler 
        ServletFileUpload upload = new ServletFileUpload();

// Parse the request 
        FileItemIterator iter = upload.getItemIterator(request);
        while (iter.hasNext()) {
            FileItemStream item = iter.next();
            String fieldName = item.getFieldName();
            String pkgFileName = item.getName();
            InputStream is = item.openStream();
            if (item.isFormField()) //regular form field
            {
%>

<!-- read a FileItemStream's content into a string. -->
<%=fieldName%> --> <%=Streams.asString(is)%>
<%
} else { //file upload
    fileName = item.getName();
//File uploadedFile = new File(config.getServletContext().getRealPath("/") + "/deploy/" + File.separator + fieldName + "_" + fileName); 
    int pos = fileName.lastIndexOf("\\");
    if (pos > 0) {
        fileName = fileName.substring(pos + 1);
    }
    File uploadedFile = new File("/usr/local/deploy/" + request.getParameter("env_name") + "/" + fileName);
    OutputStream os = new FileOutputStream(uploadedFile);
// write file to disk and close outputstream. 
    Streams.copy(is, os, true);
%>
<html>
<head>
    <title>Deployment Done - <%=request.getParameter("env_name")%>
    </title>
</head>
<body>
<h4>Package <%=uploadedFile.getName()%> was deployed on env <%=request.getParameter("env_name")%>.</h4>
Please review the deployment log as below. &nbsp;&nbsp;
<button name="Close" value="Close" onclick="window.close()">Close</button>
<button name="Back" value="Back" onclick="history.go(-1)">Back</button>
<hr>
<%
            }
        }
    }
    System.out.println("Start to deploy package" + fileName + "to environment " + request.getParameter("env_name"));
    String shell = new String();
    try {
        shell = "/usr/local/ts_op/Oracle/Middleware/user_projects/domains/base_domain/scripts/tsop_deploy.sh " + request.getParameter("env_name") + " " + fileName + " " + request.getParameter("deploy_type") + " " + session.getAttribute("username") + " " + request.getParameter("deploy_con") + " " + request.getParameter("email") + " " + request.getParameter("autotest");
        System.out.println("Deployment command: " + shell);
        Process process = Runtime.getRuntime().exec(shell);

// 
        InputStream stderr = process.getErrorStream();
        InputStreamReader isr = new InputStreamReader(stderr);
        BufferedReader br1 = new BufferedReader(isr);
/*
	String line1 = null;
	while ((line1=br1.readLine())!=null) System.out.println("Stderr is : "+line1);
//

        int exitValue = process.waitFor();  

        if (0 != exitValue) {  
            System.out.println("call shell failed. error code is :" + exitValue);  
        }  

	BufferedReader br=new BufferedReader(new InputStreamReader(new FileInputStream("/usr/local/deploy/logs/"+request.getParameter("env_name")+"_"+fileName+".log")));
	StringBuffer ret=new StringBuffer();
	String line = ""; 
	while ((line = br.readLine()) != null) { 
		ret.append(line+"<br>"); 
	} 
	br.close();
	out.println(ret.toString()); 
*/
        Thread.sleep(3000);
        response.sendRedirect("/tsop/realtime_show_log.jsp?env_id=" + request.getParameter("env_id") + "&env_name=" + request.getParameter("env_name") + "&filename=" + fileName);
//	System.out.println("return:" + ret.toString()); 

    } catch (Exception e) {
        System.err.println(e.getMessage());
    }
%>
<hr>
<center>
    <button name="Close" value="Close" onclick="window.close()">Close</button>
</center>
</body>
</html>
