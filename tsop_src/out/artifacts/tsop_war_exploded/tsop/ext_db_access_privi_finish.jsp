<%@ include file="./interface/check_ext.jsp"%>
<%@ page contentType="text/html; charset=gbk" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*,javax.mail.*,javax.mail.internet.*,javax.activation.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.io.*" %>
<html>
<head>
<title>数据库登陆权限赋予添加</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>
<body><%@include file="includes/head.html" %>
<%
DBean db = new DBean();
String sql_temp = new String();
String sql = new String();
ResultSet rs;
int j = 0;

String staff_name = new String();
String customer_ip = new String();

String proj_env = new String();
String db_sche = new String();
String db_sid = new String();
String message_info = new String();
String datestr = new String();
String ext_username =(String)session.getAttribute("ext_username");
DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
Date date = new java.util.Date();
datestr = df.format(date);

//db_id = request.getParameter("db_id");
staff_name = Tools.toGB(request.getParameter("staff_name").trim().toLowerCase());
customer_ip = Tools.toGB(request.getParameter("customer_ip").trim());

  if(!"".equals(ext_username)&&ext_username!=null){
   
	   String[] newString=request.getParameterValues("selectStr");
		//Integer[] artTypeIds=new Integer[newString.length];
		String[] temp_db_str = new String[newString.length];
		for(int i=0;i<newString.length;i++){
			
			 String selectStr =	newString[i];
			 if(!"".equals(selectStr)&&selectStr!=null){
		        temp_db_str = selectStr.split("/");
				  db_sche =temp_db_str[0].toUpperCase();
                  db_sid = temp_db_str[1];
					
				if(!"".equals(db_sche)&&!"".equals(db_sid)){
				 sql = "insert into a_login_control (login_ip,login_os_user,login_db_user,login_db_sid,RECORDER_USER,UPDATER_USER) values("+"'" + customer_ip + "','" + staff_name + "','"  + db_sche+ "','" + db_sid + "','" + ext_username + "','"+ext_username  +"')" ;
				 
				   j = 0;
				   j = db.execUpdate(sql);
		          //if success 
				   if(j==1){
				     message_info+=db_sche+"赋权成功! ";
				    }else{
				     message_info+=db_sche+"赋权失败! ";
				    }  
		        // System.out.print("message_info="+message_info);
	           }	 	
		    }
	   }
   }else{
      message_info="登录用户信息有误,请重新登录! ";
   }
   
	%>
	<form name="form1" action="ext_db_access_privi.jsp" method="post">
		<input type="hidden" name="info"  value="<%=message_info%>">
		<input type="hidden" name="staff_name" value="<%=request.getParameter("staff_name")%>">
		<input type="hidden" name="customer_ip" value="<%=request.getParameter("customer_ip")%>">
		<input type="hidden" name="flag" value="y">
		<input type="hidden" name="col_name" value="<%=request.getParameter("col_name")%>">
		<input type="hidden" name="col_name1" value="<%=request.getParameter("col_name1")%>">
		<input type="hidden" name="col_value" value="<%=request.getParameter("col_value")%>">
		<input type="hidden" name="col_value1" value="<%=request.getParameter("col_value1")%>">
	</form>
	<script language="javascript">
		form1.submit();
	</script>
<jsp:include page="includes/copyright.jsp" /></body>
<%db.close();%>
</html>
