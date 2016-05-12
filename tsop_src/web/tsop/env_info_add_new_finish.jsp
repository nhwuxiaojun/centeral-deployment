<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.DecimalFormat" %>
<html>
<head>
<title>Environment Info Add</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>

<body>
<%
DBean db = new DBean();
String sql = new String();
String sql1 = new String();
String sql2 = new String();
String sql3 = new String();
String sql4 = new String();
ResultSet rs;
ResultSet rs1;
ResultSet rs2;
int i = 0;
int i1 = 0;
String mac_ip = new String();
String env_ip = new String();
String proj_env = new String();
String web_inst_path = new String();
String html_path = new String();
String app_name = new String();
String app_inst_path = new String();
String app_port = new String();
String debug_port = new String();
String app_console = new String();
String db_info = new String();
String db_usr = new String();
String db_pwd = new String();
String env_usr = new String();
String env_pwd = new String();
String con_usr = new String();
String con_pwd = new String();
String inc_deploy_para = new String();
String full_deploy_para = new String();
String proj_grp = new String();
String proj_dns = new String();
String creater = new String();
String crt_date = new String();
String proposer = new String();
String env_state = new String();
String proj_code = new String();
String env_id = new String();
//String backup_dir = new String();
String note = new String();
String dms_type = new String();
String print_type = new String();
String apply_type = new String();

String print_ip =  new String();
//String print_user =  new String();
//String print_pwd =  new String();
String print_dir =  new String();

int count_env=0;


String datestr = new String();
DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
Date date = new java.util.Date();
datestr = df.format(date);


mac_ip = request.getParameter("MAC_IP");
env_ip = request.getParameter("ENV_IP");
proj_env = request.getParameter("PROJ_ENV").trim().toUpperCase();
web_inst_path = request.getParameter("WEB_INST_PATH");
html_path = request.getParameter("HTML_PATH");
app_name = request.getParameter("APP_NAME");
app_inst_path = request.getParameter("APP_INST_PATH");
app_port = request.getParameter("APP_PORT");
debug_port = request.getParameter("DEBUG_PORT");
app_console = request.getParameter("APP_CONSOLE");
env_usr = request.getParameter("ENV_USR");
env_pwd = request.getParameter("ENV_PWD");
con_usr = request.getParameter("CON_USR");
con_pwd = request.getParameter("CON_PWD");
inc_deploy_para = request.getParameter("INC_DEPLOY_PARA").trim();
full_deploy_para = request.getParameter("FULL_DEPLOY_PARA").trim();
proj_dns = request.getParameter("PROJ_DNS");
creater = request.getParameter("CREATER");
crt_date = request.getParameter("CRT_DATE");
proposer = request.getParameter("PROPOSER");
env_state = request.getParameter("ENV_STATE").toLowerCase();
//env_id = request.getParameter("ENV_ID");
//note = Tools.toGB(request.getParameter("NOTE"));
note = request.getParameter("NOTE");
dms_type = request.getParameter("DMS_TYPE");
print_type = request.getParameter("PRINT_TYPE");
String operater = (String)session.getAttribute("username");
print_ip = request.getParameter("print_ip").trim();
print_dir = request.getParameter("print_dir");

sql3=" select count(1) count_env from a_proj_env_svr where proj_env= '" + proj_env + "' " ;
 rs = db.execSQL(sql3);
while(rs.next()){
  count_env = rs.getInt("count_env");
 }

	if(count_env==0){

		sql1="select * from a_db_svr where db_status='running' and db_user_type='owner' and proj_env='" + proj_env + "' ";
		rs1 = db.execSQL(sql1);
		while(rs1.next()){
			db_info = rs1.getString("db_ip")+':'+rs1.getString("db_port_num")+':'+rs1.getString("db_sid");
			db_usr = rs1.getString("db_user");
			db_pwd = rs1.getString("db_user_passwd");
			proj_code = rs1.getString("proj_code");
		}

		sql2="select * from a_env_name  where proj_code = '" + proj_code + "' ";
		rs2 = db.execSQL(sql2);
		while(rs2.next()){
			proj_grp = rs1.getString("proj_grp");
		}

		sql = "insert into a_proj_env_svr(mac_ip,env_ip,proj_env,web_inst_path,html_path,app_name,app_inst_path,app_port,debug_port,app_console,db_info,db_usr,db_pwd,env_usr,env_pwd,con_usr,con_pwd,proj_grp,proj_dns,creater,crt_date,proposer,env_state,proj_code,env_id,note,inc_deploy_para,full_deploy_para,print_type,dms_type,print_ip,print_dir)"+
			  "values('" + mac_ip + "','" + env_ip + "','" + proj_env + "','" + web_inst_path+ "','" + html_path + "','" + app_name + "','" + app_inst_path + "','" + app_port + "','" + debug_port + "','"+app_console + "','" + db_info + "','" + db_usr + "','"+ db_pwd + "','" + env_usr + "','" + env_pwd + "','" + con_usr + "','" + con_pwd + "','" + proj_grp + "','" + proj_dns + "','" + creater + "',to_date('" + crt_date + "','yyyy-mm-dd hh24:mi:ss'),'" + proposer + "','running','" + proj_code + "',s_db__id.nextval,'"+ note + "','" + inc_deploy_para + "','" + full_deploy_para +"','" + print_type + "','" + dms_type + "','" + print_ip + "','"+print_dir+"')";

		try {
			System.out.println("sql="+sql);
			db.execSQL(sql);%>
	<script type="text/javascript">
	alert('App Env <% out.print(proj_env); %> was updated successfully!');
	window.close();
	</script>
	<%	} catch (Exception e) { %>
	<script type="text/javascript">
	history.go(-1);
	history.go(-1);
	alert('App Env <% out.print(proj_env); %> failed to update!');
	</script>
<%			e.printStackTrace();
		}
	}
%>
<%
rs.close();
db.close();
%>
</body>
</html>