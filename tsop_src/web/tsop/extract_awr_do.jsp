<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java"%> 
<%@page import="java.io.*"%> 
<%@page import="java.util.Date"%> 
<%@page import="java.text.SimpleDateFormat"%> 
<%@page import="java.util.List"%> 
<%@page import="org.apache.commons.fileupload.*"%> 
<%@page import="org.apache.commons.fileupload.util.Streams"%> 
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%> 
<% 
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1    
request.setCharacterEncoding("UTF-8"); 
System.out.println(request.getParameter("env_name"));
System.out.println(request.getParameter("db_ldap_name"));
System.out.println(request.getParameter("db_sid"));
System.out.println(request.getParameter("start_time"));
System.out.println(request.getParameter("end_time"));
SimpleDateFormat format= new SimpleDateFormat("yyyy-MM-dd H:m");
SimpleDateFormat out_format= new SimpleDateFormat("yyyyMMddHHmm");
Date start_time=format.parse(request.getParameter("start_time"));
Date end_time=format.parse(request.getParameter("end_time"));
System.out.println(out_format.format(start_time));
System.out.println(out_format.format(end_time));
//System.out.println(format.format(request.getParameter("start_time")));
//System.out.println(format.format(request.getParameter("end_time")));
String fileName = new String();
%>
<%
//java.io.File f = new java.io.File( "/usr/local/deploy/awr/"+request.getParameter("env_name") ) ;
//System.out.println( f.mkdirs() ? "Folder created" : "Create failed!" ) ;
%>
<html>
<head>
<title>AWR - <%=request.getParameter("env_name")%></title>

<script type="text/javascript" language="javascript" src="scripts/jquery-1.11.1.min.js"></script>
<script type="text/javascript" language="javascript" src="scripts/jquery-ui-1.11.1/jquery-ui.js"></script>
<script type="text/javascript">
$(function () {
            window.resizeTo(800,600);  
});
</script>

</head>
<body>
<h4><%=request.getParameter("env_name")%> AWR</h4> 
<button name="Close" value="Close" onclick="window.close()">Close</button>
<button name="Back" value="Back" onclick="history.go(-1)">Back</button>
<hr>
<% 
System.out.println("Start to extract AWR "+request.getParameter("env_name"));
String shell = new String();
try
{
	String file_name=new String();
	file_name="/usr/local/deploy/awr/"+request.getParameter("db_sid")+"_"+out_format.format(start_time)+"_"+out_format.format(end_time)+".html";
	Runtime.getRuntime().exec("touch "+file_name);
	Runtime.getRuntime().exec("chmod 775 "+file_name);
//	shell = "/usr/local/ts_op/Oracle/Middleware/user_projects/domains/base_domain/scripts/extract_awr.sh " + out_format.format(start_time) + " " + out_format.format(end_time) + " "+request.getParameter("db_ldap_name")+" " +request.getParameter("db_sid") +" " +request.getParameter("env_name")+" "+session.getAttribute("username");
	shell = "nohup sh /usr/local/ts_op/Oracle/Middleware/user_projects/domains/base_domain/scripts/extract_awr.sh " + out_format.format(start_time) + " " + out_format.format(end_time) + " "+request.getParameter("db_ldap_name")+" " +request.getParameter("db_sid") +" " +request.getParameter("env_name")+" "+session.getAttribute("username")+" &";
        System.out.println("Extract command: " + shell );
        Process process = Runtime.getRuntime().exec(shell);
// 
//	Thread.sleep(2000);
/* 20150427 
//	InputStream stderr=process.getErrorStream();
//	InputStreamReader isr=new InputStreamReader(stderr);
//	BufferedReader br1=new BufferedReader(isr);
*/

/*
	String line1 = null;
	while ((line1=br1.readLine())!=null) System.out.println("Stderr is : "+line1);
//
        int exitValue = process.waitFor();  
        if (0 != exitValue) {  
            System.out.println("call shell failed. error code is :" + exitValue);  
        }  

	BufferedReader br=new BufferedReader(new InputStreamReader(new FileInputStream("/usr/local/deploy/awr/"+request.getParameter("db_ldap_name")+"_"+out_format.format(start_time)+"_"+out_format.format(end_time)+".html")));
	StringBuffer ret=new StringBuffer();
	String line = ""; 
	while ((line = br.readLine()) != null) { 
		ret.append(line+"<br>"); 
	} 
	br.close();
	out.println(ret.toString()); 
*/
	//System.out.println("return:" + ret.toString()); 
	System.out.println("redirecting...");
	Thread.sleep(20000);
	response.sendRedirect("/deploy/awr/"+request.getParameter("db_ldap_name")+"_"+out_format.format(start_time)+"_"+out_format.format(end_time)+".html");

}
catch(Exception e)
{
        System.err.println(e.getMessage());
}

%> 
<hr>
<center><button name="Close" value="Close" onclick="window.close()">Close</button></center>
</body>
</html>
