<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="ebao.DBean" %>
<html>
<head>
  <title>DB info update</title>
  <meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>

<body>
<%
  DBean db = new DBean();
  String sql = new String();
  String sql_temp = new String();
  ResultSet rs_temp;
  String db_ip = new String();
  String os_db_user = new String();
  String os_db_passwd = new String();
  String db_sid = new String();
  String db_ldap_name = new String();
  String db_user = new String();
  String db_user_passwd = new String();
  String db_user_type = new String();
  String proj_env = new String();
  String proposer = new String();
  String creater = new String();
  String create_date = new String();
  String db_version = new String();
  int db_port_num = 0;
  String db_listener = new String();
  String db_status = new String();
  String proj_code = new String();
  int flag = 0;

  db_ip = request.getParameter("DB_IP");
  db_sid = request.getParameter("db_sid");
  db_ldap_name = request.getParameter("db_ldap_name");
  sql_temp = "select * from a_db_svr_main where db_ip = '" + db_ip + "' and db_sid = '" + db_sid + "'";
  System.out.println(sql_temp);
  rs_temp = db.execSQL(sql_temp);

  while(rs_temp.next()){
    os_db_user = rs_temp.getString("OS_DB_USER");
    os_db_passwd = rs_temp.getString("OS_DB_PASSWD");
    db_version = rs_temp.getString("DB_VERSION");
    db_port_num = rs_temp.getInt("DB_PORT_NUM");
    db_listener = rs_temp.getString("DB_LISTENER");
  }

  db_user = request.getParameter("DB_USER");
  db_user_passwd = request.getParameter("DB_USER_PASSWD");
  db_user_type = request.getParameter("DB_USER_TYPE").trim();
  proj_env = request.getParameter("PROJ_ENV").toUpperCase().trim();
  proposer = request.getParameter("PROPOSER");
  creater = request.getParameter("CREATER");
  create_date = request.getParameter("CREATE_DATE");
  db_status = request.getParameter("DB_STATUS").toLowerCase();
  proj_code = request.getParameter("PROJ_CODE");

  sql = "insert into a_db_svr(db_ip,os_db_user,os_db_passwd,db_sid,db_user,db_user_passwd,db_user_type,proj_env,proposer,creater,create_date,db_version,db_port_num,db_listener,db_status,proj_code,db_ldap_name,db_id)" +
        "values('"+db_ip+"','"+os_db_user+"','"+os_db_passwd+"','"+db_sid+"','"+db_user+"','"+db_user_passwd+"','"+db_user_type+"','"+proj_env+"','"+proposer+"','"+creater+"',to_date('" + create_date + "','yyyy-MM-dd'),'"+db_version+"','"+db_port_num+"','"+db_listener+"','"+db_status+"','"+proj_code+"','"+db_ldap_name+"',s_db__id.nextval"+")";
  try {
    System.out.println("sql="+sql);
    db.execSQL(sql);
  } catch (Exception e) {
    e.printStackTrace();
  }
%>
<%
  String sql_temp1 = new String();
  ResultSet rs_temp1;
  sql_temp1 = "select * from a_db_svr where db_status='running' and db_user_type='owner' and proj_env='"+proj_env+"'";
  rs_temp1 = db.execSQL(sql_temp1);
  while(rs_temp1.next()){
    flag = 1;
  }
%>
<%if(flag == 0){ %>
<script type="text/javascript">
  history.go(-1);
  history.go(-1);
  alert('DB Env <% out.print(proj_env); %> failed to update!');
</script>
<% }else if(flag == 1){ %>
<script type="text/javascript">
  alert('DB Env <% out.print(proj_env); %> was updated successfully!');
  window.close();
</script>
<% } %>

<%
  db.close();
%>
</body>
</html>