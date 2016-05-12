<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" import="java.sql.*"
	errorPage=""%>
<%@ page
	import="java.util.*,javax.mail.*,javax.mail.internet.*,javax.activation.*"%>
<%@ page import="ebao.DBean"%>
<%@ page import="ebao.Tools"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.io.*"%>
<html>
<head>
<title>环境登陆权限赋予添加</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>

<script language=javascript>
function SetWindow()
{
     var height = 400;                      //Set height
     var width = 400;                        //Set width
     var name = "winname";             //Set window name
     var top = 20;                             //Set distance from top
     var left = 20;                             //Set distance from bottom

     if(document.location.search=='')  {
       newwin=window.open(document.location + "?newwin=true", name, "fullscreen=no,toolbar=no,status=no,menubar=no,scrollbars=no,resizable=no,directories=no,location=no,width=" + width + ",height=" + height + ",left=" + left + ",top=" + top);
     }
}

function closemyself() {
window.resizeTo(500,300);
window.opener=self;
//window.open(document.location,"Title","fullscreen=no,toolbar=no,status=no,menubar=no,scrollbars=no,resizable=no,directories=no,location=no,height=500,width=300");
window.close();
//self.close();
// <body onLoad="SetWindow();">
}
</script>
<body onLoad="setTimeout('closemyself()',5000);">
<div align="left"><font color="#FF0000" style="{font-size:9pt;}">

<%
	DBean db = new DBean();
	String sql_temp = new String();
	String sql = new String();
	ResultSet rs;
	int i = 0;
	int id = 0;
	int count = 0;

	String path = new String();

	String env_id = new String();
	String staff_name = new String();
	String customer_ip = new String();
	String visit_type = new String();
	String mac_ip = new String();
	String env_ip = new String();
	String proj_env = new String();
	String message_info = new String();

	String shell = new String();

	String datestr = new String();
	DateFormat df = new java.text.SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");
	Date date = new java.util.Date();
	datestr = df.format(date);

	String[] newString2 = request.getParameterValues("useriplist");
	String[] newString3 = request.getParameterValues("dblist");
	String[] newString1 = newString2[0].split("\r\n");




		//staff_name = Tools.toGB(request.getParameter("staff_name").trim());
		//customer_ip = Tools.toGB(request.getParameter("customer_ip").trim());
	visit_type = Tools.toGB(request.getParameter("visit_type").trim());



	String[] envIds=request.getParameterValues("env_id");
	//String[] envIds = request.getParameterValues("dblist");

        out.println("<font color=black><h3>Result:</h3></font><br>");
for (int k = 0; k < newString1.length; k++) {
	String[] tmp = newString1[k].split(":");
	staff_name = tmp[0];
	customer_ip = tmp[1];
	for (int j = 0; j < envIds.length; j++) {
		if (!"".equals(envIds[j]) && envIds[j] != null) {
			env_id = envIds[j];

			sql_temp = "select s_ftp_record__id.nextval as id from dual";
					//out.print(sql_temp+"<br>");
			rs = db.execSQL(sql_temp);
			if (rs.next()) {
				id = rs.getInt("id");
			}
			sql_temp = "select * from a_proj_env_svr where env_id = "+ env_id;
			rs = db.execSQL(sql_temp);
			while (rs.next()) {
				mac_ip = rs.getString("mac_ip").trim();
				env_ip = rs.getString("env_ip").trim();
				proj_env = rs.getString("proj_env").trim();
			}

			rs.close();
					
sql_temp = "select 1 from a_env_access_privi where app_ip='"+env_ip+"' and guest_ip='"+customer_ip+"' and privi_type='"+visit_type+"'";
System.out.print(sql_temp+"\n");
rs = db.execSQL(sql_temp);
if (rs.next()) {
	count= rs.getInt(1);
}
if (count==1) {
	System.out.print("existed!\n");
	out.println("<h4><font color=red>staff_name:"+staff_name+",IP:"+customer_ip+",Env IP:"+env_ip+",existed and re-granted! </h4></font>");
	message_info+=env_ip+"privilege existed! ";
} else {
	System.out.print("Not existed!\n");
	sql="insert into a_env_access_privi(staff_name,guest_ip,app_ip,privi_type) values('"+staff_name+"','"+customer_ip+"','"+env_ip+"','"+visit_type+"')";
	System.out.print(sql+"\n");
	db.execUpdate(sql);

	sql = "insert into a_ftp_record(id,ts_user,it_user,pc_ip,mac_ip,env_ip,proj_env,login_way,grant_date)values("
							+ id
							+ ",'"
							+ session.getAttribute("username")
							+ "','"
							+ staff_name
							+ "','"
							+ customer_ip
							+ "','"
							+ mac_ip
							+ "','"
							+ env_ip
							+ "','"
							+ proj_env
							+ "','"
							+ visit_type
							+ "',to_date('"
							+ datestr + "','yyyy-mm-dd hh24:mi:ss'))";
	System.out.println(sql);					//out.println(sql + "<br>");
	i = db.execUpdate(sql);
	if (i == 1) {
		out.println("<h4><font color=green>staff_name:"+staff_name+",IP:"+customer_ip+",Env IP:"+env_ip+",Grant Succeed!</h4></font>");
	} else {
		out.println("<h4><font color=red>staff_name:"+staff_name+",IP:"+customer_ip+",Env IP:"+env_ip+",Grant Failed! </h4></font><br>");
	}
} //end of else
	//out.println(i + "<br>");
	System.out.println(env_ip + " " + staff_name + " " + customer_ip + " " + visit_type);
	try {
//		shell = "sh /usr/local/ts_op/bea_tsop/user_projects/domains/mydomain/privi_mana.sh";
       	        shell = "sh /usr/local/ts_op/Oracle/Middleware/user_projects/domains/base_domain/scripts/privi_mana.sh "+env_ip + " " + staff_name + " " + customer_ip + " " + visit_type + " " + session.getAttribute("username");
		System.out.println(shell);
		Runtime.getRuntime().exec(shell);
	} catch (Exception e) {
		System.err.println(e.getMessage());
	}
	Thread.sleep(1000);
}// end of if
}// end of j
}// end of k

//response.sendRedirect("env_access_privi_do.jsp?info=Create Succeed!&staff_name="+staff_name+"&customer_ip="+customer_ip);
%>

<hr>
<a href="#" type="button" name="button1" value="Return" class="button1" onClick="window.history.go(-1); return false;">Return</a>
<a href="#" type="button" name="button1" value="Return" class="button1" onClick="parent.document.getElementById('iframe1').contentWindow.history.back(); return false;">Return</a>
</div>
<jsp:include page="includes/copyright.jsp" /></body>
<%
	db.close();
%>
</html>
