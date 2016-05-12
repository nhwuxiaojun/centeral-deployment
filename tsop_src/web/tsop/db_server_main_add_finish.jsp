<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="java.util.Date" %>
<%@ page import="ebao.Tools" %>
<%@ page import="java.util.*,javax.mail.*,javax.mail.internet.*,javax.activation.*" %>
<%@ page import="com.unboundid.ldap.sdk.*"%>
<%@ page import="com.unboundid.ldap.sdk.controls.*"%>
<html>
<head>
<title>数据库实例名提交处理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>
<body>
<%
DBean db = new DBean();
ResultSet rs_temp;
String sql = new String();
String sql2 = new String();
String sql_temp = new String();
int i = 0;
int j = 0;
int id = 0;
int flag = 0;
String db_ip = new String();
String os_db_user = new String();
String os_db_passwd = new String();
String db_sid = new String();
String db_user = new String();
String db_user_passwd = new String();
String db_user_type = new String();
String proposer = new String();
String creater = new String();
String create_date = new String();
String db_manager = new String();
String db_version = new String();
String db_character = new String();
String db_port_num = new String();
String db_listener = new String();
String db_status = new String();
String db_type = new String();
String db_ldap_name = new String();

db_ip = request.getParameter("db_input").trim();
os_db_user = request.getParameter("os_db_user").trim();
os_db_passwd = request.getParameter("os_db_passwd").trim();
db_sid = request.getParameter("db_sid").trim();
db_user = request.getParameter("db_user").trim();
db_user_passwd = request.getParameter("db_user_passwd").trim();
db_user_type = request.getParameter("db_user_type").trim();
proposer = request.getParameter("proposer").trim();
creater = request.getParameter("creater").trim();
create_date = request.getParameter("create_date").trim();
db_manager = request.getParameter("db_manager").trim();
db_version = request.getParameter("db_version").trim();
db_character = request.getParameter("db_character").trim();
db_port_num = request.getParameter("db_port_num").trim();
db_listener = request.getParameter("db_listener").trim();
db_ldap_name = request.getParameter("db_ldap_name").trim();
db_status = request.getParameter("db_status").trim();
db_type=request.getParameter("db_type").trim();
String error_msg = new String();

//sql_temp = "select s_db__id.nextval as id from dual";
//rs_temp = db.execSQL(sql_temp);
//if(rs_temp.next()){
//	id = rs_temp.getInt("id");
//}
//rs_temp.close();

try {
sql = "insert into a_db_svr_main(db_ip,os_db_user,os_db_passwd,db_sid,db_user,db_user_passwd,db_user_type,proposer,creater,db_manager,db_version,db_character,db_port_num,db_listener,db_status,db_id,db_ldap_name,db_type) values('" + db_ip + "','" + os_db_user + "','" + os_db_passwd + "','" + db_sid + "','" + db_user + "','" + db_user_passwd + "','" + db_user_type + "','" + proposer + "','" + creater + "','" + db_manager + "','" + db_version + "','" + db_character + "'," + db_port_num + ",'" + db_listener + "','" + db_status + "',s_db__id.nextval,'" + db_ldap_name+"','"+db_type +"')";

//sql2 = "insert into ts_db(db_ip,os_db_user,os_db_passwd,db_sid,db_user,db_user_passwd,db_user_type,proposer,creater,create_date,db_manager,db_version,db_character,db_port_num,db_listener,db_status,db_id) values('" + db_ip + "','" + os_db_user + "','" + os_db_passwd + "','" + db_sid + "','" + db_user + "','" + db_user_passwd + "','" + db_user_type + "','" + proposer + "','" + creater + "',to_date('" + create_date + "','yyyy-MM-dd'),'" + db_manager + "','" + db_version + "','" + db_character + "'," + db_port_num + ",'" + db_listener + "','" + db_status + "'," + id + ")";

//out.print(sql);//
//i = db.execUpdate(sql2);
System.out.println("");
System.out.println(sql);

i = db.execUpdate(sql);
} catch (Exception e) {
	e.printStackTrace();
	error_msg=e.toString();
	flag=0;
} finally {
	flag=1;
}

if (!"-".equals(db_ldap_name)) {

String ldapHost = "172.16.7.50";                
int ldapPort = 389;                             
String ldapBindDN = "cn=Manager,cn=OracleContext";
    String ldapPassword = "tssecret";
LDAPConnection connection = null;               
if (connection == null) {                       
    try {                                       
        connection = new LDAPConnection(ldapHost, ldapPort, ldapBindDN, ldapPassword);  
    } catch (Exception e) {                     
        System.out.println("Failed to connect to LDAP Server \n" + e.getMessage());  
	flag=0;
    } finally {
	flag=1;
    }
}                 

String strAct="add";     
String strCN=db_ldap_name;       
String strDESC="(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST="+db_ip+")(PORT="+db_port_num+")))(CONNECT_DATA=(SERVICE_NAME="+db_sid+")))";
System.out.println(strCN+"="+strDESC);

if ( "add".equals(strAct) ) {
        String entryDN = "cn=" + strCN + ",cn=OracleContext";
    try {

        SearchResultEntry entry = connection.getEntry(entryDN);
        if (entry == null) {
            ArrayList<Attribute> attributes = new ArrayList<Attribute>();
            attributes.add(new Attribute("objectClass", "top", "orclNetService"));
            attributes.add(new Attribute("cn", strCN));
            attributes.add(new Attribute("orclNetDescString", strDESC));
            connection.add(entryDN, attributes);
            System.out.println("Create" + entryDN + "successfully by " + session.getAttribute("username"));
        } else {
            System.out.println("DN" + entryDN + "existed！");
        }
    } catch (Exception e) {
        System.out.println("Failed to create DN \n" + e.getMessage());
	flag=0;
    } finally {
	flag=1;
   }
}

} // end of LDAP ADD

ResultSet rs_temp2;
sql_temp = "select * from a_db_sid where db_sid = '" + db_sid + "' and db_ip = '" + db_ip + "'";
try {
rs_temp2 = db.execSQL(sql_temp);
if(rs_temp2.next()){
	flag = 0;
}else{
	flag = 1;
}
if(flag==1){
	sql_temp = "insert into a_db_sid(db_sid,db_ip) values('" + db_sid + "','" + db_ip + "')";
	//out.print(sql_temp);
//	j = db.execUpdate(sql_temp);
	rs_temp2.close();
}

db.close();
} catch (Exception e) {
	e.printStackTrace();
}

if(i==1){
	response.sendRedirect("db_server_main_query.jsp?info=Succeed!");
}else{
	response.sendRedirect("db_server_main_query.jsp?info=Failed!<br>"+error_msg);
}

%>
</body>
</html>
