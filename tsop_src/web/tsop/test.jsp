<%@ page contentType="text/html; charset=gbk" import="java.sql.*" errorPage="" %>
<%@ page import="org.apache.log4j.Logger" %>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c_rt" %>
<%@ page import="java.io.*" %>
<%@ page  import="ebao.DBean" %>
<%@ page  import="ebao.Tools" %>
<%@ page  import="java.net.*" %>
<html>
<head>
<title>Test</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
</head>
<body><%@include file="includes/head.html" %>
<%
DBean db = new DBean();
String sql = new String();
ResultSet rs = null;
//sql = "select a.db_ip,b.login_db_sid,a.proj_env,a.db_user_type,b.login_db_user,b.login_ip,b.login_os_user from a_db_svr a, a_login_control b where upper(a.db_user(+)) = upper(b.login_db_user) and upper(a.db_sid(+)) = upper(b.login_db_sid) and rownum<11";
sql = "select * from a_login_control where rownum<11";
rs = db.execSQL(sql);
while(rs.next()){
	out.print("OK" + "<br>");
}
PropertyConfigurator.configure(log4j.properties);
Logger log3 = Logger.getRootLogger();
log3.info("Test3 Logger.getRootLogger()");

String host = "192.168.1.181";
int timeOut = 3000;
//InetAddress Address; 
//InetAddress Address = InetAddress.getLocalHost(); 
//out.print(Address);
//boolean status = InetAddress.getByName("172.18.6.4").isReachable(timeOut);
//boolean status1 = InetAddress.getByAddress("172.18.6.4").isReachable(timeOut);
//if (status1) {
//	out.print("OK");
//}
try{ 
String s=InetAddress.getByName("www.sina.com.cn").toString(); 
out.println(s+"<br>"); 
} 
catch(UnknownHostException e){ 
out.println("无法解析<br>"); 
} 

Socket s=null;

try{
	s=new Socket(InetAddress.getByName("172.16.9.222"),22);
	out.println("Open");
	System.out.println("Open");	 
	//SocketAddress sockaddr = new InetSocketAddress("172.16.9.222", 22);
	//Socket sock = new Socket();
	//sock.connect(sockaddr, 5000);
	//out.println("Open");


           }
           catch(IOException e){	
		out.println("closed");
           }finally{
                try{s.close();}catch(Exception e){}
           }


%>
<%db.close();%>
<%rs.close();%>
<jsp:include page="includes/copyright.jsp" /></body>
</html>
