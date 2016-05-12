<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*,javax.mail.*,javax.mail.internet.*,javax.activation.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.io.*" %>
<html>
<head>
<title>环境登陆权限赋予添加</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>
<script language=javascript>
function closemyself() {
 window.opener=self;
 window.close();
 //self.close();
}
</script>
<body onLoad="setTimeout('closemyself()',5000);">
<%
DBean db = new DBean();
String sql_temp = new String();
String sql = new String();
String sql_query = new String();
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
DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
Date date = new java.util.Date();
datestr = df.format(date);


staff_name = Tools.toGB(request.getParameter("staff_name").trim());
customer_ip = Tools.toGB(request.getParameter("customer_ip").trim());
visit_type = Tools.toGB(request.getParameter("visit_type").trim());



String[] envIds=request.getParameterValues("env_id");
		
for(int j=0;j<envIds.length;j++){
 if(!"".equals(envIds[j])&&envIds[j]!=null){
	env_id = envIds[j];


sql_temp = "select s_ftp_record__id.nextval as id from dual";
rs = db.execSQL(sql_temp);
if(rs.next()){
	id = rs.getInt("id");
}

sql_temp = "select * from a_proj_env_svr where env_id = " + env_id;
rs = db.execSQL(sql_temp);
while(rs.next()){
	mac_ip = rs.getString("mac_ip").trim();
	env_ip = rs.getString("env_ip").trim();
	proj_env = rs.getString("proj_env").trim();
}
rs.close();

sql_query = "select 1 from a_env_access_privi where app_ip='"+env_ip+"' and guest_ip='"+customer_ip+"' and privi_type='"+visit_type+"'";
System.out.print(sql_query);
rs = db.execSQL(sql_query);
if (rs.next()) {
	count= rs.getInt(1);
}
if (count==1) {
	System.out.println("existed!");
	message_info+=env_ip+" privilege existed and regranted again!";
} else {
	System.out.println("Not existed!");
	sql="insert into a_env_access_privi(staff_name,guest_ip,app_ip,privi_type) values('"+staff_name+"','"+customer_ip+"','"+env_ip+"','"+visit_type+"')";
	System.out.print(sql);
	db.execUpdate(sql);

	sql = "insert into a_ftp_record(id,ts_user,it_user,pc_ip,mac_ip,env_ip,proj_env,login_way,grant_date)values(" + id + ",'" + session.getAttribute("username") + "','" + staff_name + "','" + customer_ip + "','" + mac_ip + "','" + env_ip + "','" + proj_env + "','" + visit_type + "',to_date('" + datestr + "','yyyy-mm-dd hh24:mi:ss'))";
	//out.println(sql + "<br>");
  	i = db.execUpdate(sql);
  	if(i==1){
		 message_info+=env_ip+" Succeed! ";
	 }else{
		 message_info+=env_ip+" Failed!";
	 }  
	//out.println(i + "<br>");
  }
	path = request.getRealPath("");
	System.out.println("------------"+path+"===========");
	File f = new File(path,"env_access_grant.tmp");
	//out.println(path + "/env_access_grant.tmp");
	if(f.exists()){
		System.out.println(path+"/env_access_grant.tmp existed!");
		f.delete();
	}
	f.createNewFile();
	System.out.println(path+"/env_access_grant.tmp created!");
	FileWriter fw = new FileWriter(path + "/env_access_grant.tmp");
	BufferedWriter bw = new BufferedWriter(fw);
	bw.write(env_ip + " " + staff_name + " " + customer_ip + " " + visit_type + " " + session.getAttribute("username") );
	System.out.println(env_ip + " " + staff_name + " " + customer_ip + " " + visit_type + " " + session.getAttribute("username") );
	//bw.newLine();
	//bw.write("bbb");
	bw.flush();
	fw.close();
	try{
//              shell = "sh /usr/local/ts_op/Oracle/Middleware/user_projects/domains/base_domain/scripts/privi_mana.sh";
                shell = "sh /usr/local/ts_op/Oracle/Middleware/user_projects/domains/base_domain/scripts/privi_mana.sh "+env_ip + " " + staff_name + " " + customer_ip + " " + visit_type + " " + session.getAttribute("username");
                Runtime.getRuntime().exec(shell);
                System.out.println(shell);
	} catch(Exception e)
	{
        	System.err.println(e.getMessage());
	}
	
}
	
}
%>
<script type="text/javascript">
        history.go(-1);
        alert('<%out.print(message_info);%>');
</script>
<%
	//response.sendRedirect("env_access_privi_do.jsp?info=Create Succeed!&staff_name="+staff_name+"&customer_ip="+customer_ip);
   %>
	<form name="form1" action="env_access_privi_do.jsp" method="post">
		<input type="hidden" name="info" value="<%=message_info%>">
		<input type="hidden" name="staff_name" value="<%=request.getParameter("staff_name")%>">
		<input type="hidden" name="customer_ip" value="<%=request.getParameter("customer_ip")%>">
		<input type="hidden" name="visit_type" value="<%=request.getParameter("visit_type")%>">
		<input type="hidden" name="flag" value="y">
		<input type="hidden" name="env_ip" value="<%=Tools.toGB(request.getParameter("env_ip"))%>">
		<input type="hidden" name="txt_env_ip" value="<%=request.getParameter("txt_env_ip")%>">
		<input type="hidden" name="col_name" value="<%=request.getParameter("col_name")%>">
		<input type="hidden" name="col_value" value="<%=request.getParameter("col_value")%>">
	</form>
	<script language="javascript">
		form1.submit();
	</script>
	
<jsp:include page="includes/copyright.jsp" /></body>
<%db.close();%>
</html>
