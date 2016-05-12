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

<html>
<head>
    <title>Deployment Done - <%=request.getParameter("env_name")%>
    </title>
</head>
<body>
<%
    String shell = new String();
    try {
        shell = "/usr/local/ts_op/Oracle/Middleware/user_projects/domains/base_domain/scripts/tsop_terminate_deploy.sh " + request.getParameter("env_name") + " " + request.getParameter("file") + " " + request.getParameter("deploy_type") + " " + session.getAttribute("username") + " " + request.getParameter("deploy_con") + " " + request.getParameter("email");
        System.out.println("Deployment command: " + shell);
        Process process = Runtime.getRuntime().exec(shell);

//	InputStream stderr=process.getErrorStream();
//	InputStreamReader isr=new InputStreamReader(stderr);
//	BufferedReader br1=new BufferedReader(isr);

//	response.sendRedirect("/tsop/realtime_show_log.jsp?env_id="+request.getParameter("env_id")+"&env_name="+request.getParameter("env_name")+"&filename="+request.getParameter("file"));
//	System.out.println("return:" + ret.toString()); 

    } catch (Exception e) {
        System.err.println(e.getMessage());
    }
%>
<script type="text/javascript" language="javascript">
    alert("The deployment is going to be terminated!");
    window.history.go(-1);
</script>
</body>
</html>
