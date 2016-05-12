<%@ include file="interface/check_non_ts.jsp" %>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.MySQLDBean" %>
<%@ page import="ebao.Tools" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.net.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="includes/common.js"></script>
<html>
<head>
  <title>
    TS Package Deployer - <%=request.getParameter("env_name")%>
  </title>
  <script type="text/javascript" src="scripts/jquery-1.11.1.js"></script>
  <script type="text/javascript" src="scripts/jquery-ui-1.11.1/jquery-ui.js"></script>
  <script type="text/javascript" src="scripts/spin.min.js"></script>
  <link href="scripts/jquery-ui-1.11.1/jquery-ui.css" rel="stylesheet" type="text/css">
  <style type="text/css">
    body {
      font-family: verdana, sans-serif;
      font-size: small;
    }
  </style>

  <SCRIPT LANGUAGE="JavaScript">
  <!--
//  var WshShell=new ActiveXObject("WScript.Shell");
//  WshShell.RegWrite("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Internet Settings\\ZoneMap\\Domains\\ebaotech.com","");
//  WshShell.RegWrite("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Internet Settings\\ZoneMap\\Domains\\ebaotech.com\\ts","");
//  WshShell.RegWrite("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Internet Settings\\ZoneMap\\Domains\\ebaotech.com\\ts\\http","2","REG_DWORD");
//  alert("写入成功");
  -->
  </SCRIPT>

  <% response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1  %>
</head>
<body><%@include file="includes/head.html" %>
<%
  System.out.println("User Authentication:" + session.getAttribute("username"));
  DBean db = new DBean();
  MySQLDBean db1 = new MySQLDBean();
  String sql = new String();
  String sql1 = new String();
  String dm = new String();
  String cm = new String();
  String user = new String();
  int i = 0;
  int j = 0;
  int k = 0;
  ResultSet rs;
  ResultSet rs1;
  user = session.getAttribute("username").toString();
// Record access history
//sql="insert into ts_recent_envs(env_id,user_name) values("+request.getParameter("env_id")+",'"+session.getAttribute("username")+"')";
//sql="insert into ts_recent_env(env_id,user_name) select 1445,'jiangtao.chen' from dual where not exists ( select * from ts_recent_env where user_name='jiangtao.chen' and env_id=1445)";
  sql = "insert into ts_recent_env(env_id,user_name) select " + request.getParameter("env_id") + ",'" + session.getAttribute("username") + "' from dual where not exists ( select * from ts_recent_env where user_name='" + session.getAttribute("username") + "' and env_id=" + request.getParameter("env_id") + ")";
  System.out.println(sql);
  try {
    i = db.execUpdate(sql);
  } catch (Exception e) {
    e.printStackTrace();
  }

  sql = "update ts_recent_env set last_access=sysdate where user_name='" + session.getAttribute("username") + "' and env_id=" + request.getParameter("env_id");
  System.out.println(sql);
  try {
    i = db.execUpdate(sql);
  } catch (Exception e) {
    e.printStackTrace();
  }

  try {
//    sql="select a.proj_name, a.dm from ts_proj a, ts_env b where a.proj_id=b.proj_id and b.env_id="+request.getParameter("env_id");
    sql = "select a.proj_name,d.inc_deploy_para, d.full_deploy_para, a.cm, a.dm,c.account from ts_proj a, ts_env b, ts_member c, ts_env_app d where b.env_id=d.env_id and  a.proj_id=b.proj_id and a.owner1=c.no and b.env_id=" + request.getParameter("env_id");
    sql1 = "select * from a_user where valid<>3 and usr='" + user + "'";
    rs1 = db.execSQL(sql1);
    System.out.println(sql1);
    while (rs1.next()) {
      j = 1;
    }
    System.out.println(sql);
%>
<div align="center"><br>
<h2>Test Server Maintenance</h2>
  <br>
<hr width="60%">
  <br>

<%
  java.io.File f1 = new java.io.File("/usr/local/deploy/test_server_list.txt");
  System.out.println(f1.mkdirs() ? "Folder created" : "Create failed!");
  Runtime.getRuntime().exec("chmod 775 " + "/usr/local/deploy/" + request.getParameter("env_name"));
  //写文件
  String file_properties = "/usr/local/deploy/test_server_list.txt";
  String path = "/deploy/";
  String filename = request.getRealPath(path + "/test_server_list.txt");
  java.io.File f = new java.io.File(filename);
//f.setWritable(true);

  if (!f.exists()) {
    f.createNewFile();
  }

  if (request.getParameter("new") != null) {
    try {
      java.util.Date date = new java.util.Date();
      System.out.println("file.properties updated by:" + session.getAttribute("username"));
      PrintWriter pw = new PrintWriter(new FileOutputStream(filename));
      pw.println("# Updated by " + session.getAttribute("username") + " - " + date);//写内容
      pw.println(request.getParameter("content"));//写内容
      pw.close();
    } catch (IOException e) {
      out.println(e.getMessage());
    }
  } // end of if
  //Runtime.getRuntime().exec("chmod 664 test_server_list.txt");

//读文件
  java.io.FileReader fr = new java.io.FileReader(f);
  char[] buffer = new char[10];
  int length;
//out.write(filename+"<br>");
%>
<form action="<%=request.getRequestURI()%>" method="POST">
  <font color=blue>Modify test_server_list.txt</font> (<%=filename%>)</input>
  &nbsp;&nbsp;
  <button type="submit" id="savebtn" >Save</button>
  <br>
<textarea id="content" name="content" rows=30 cols=90>
<%
  while ((length = fr.read(buffer)) != -1) {
    out.write(buffer, 0, length);
  }
  fr.close();
%>
</textarea>
  <input type="hidden" name="new" value="new">

  <div id="info"></div>
  <div id="foo"></div>


<%

} catch(Exception e) {
	e.printStackTrace();
} finally {
    db.close();
}
%></div>
<jsp:include page="includes/copyright.jsp" />
</body>
</html> 
