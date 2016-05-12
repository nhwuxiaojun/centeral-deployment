<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="javax.mail.*, javax.mail.internet.*, javax.activation.*, java.util.*" %>
<%@ page import="com.unboundid.ldap.sdk.*"%>
<%@ page import="com.unboundid.ldap.sdk.controls.*"%>

<html>
<head>
<title>数据库申请表修改处理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>

<body><%@include file="includes/head.html" %>
<%
DBean db = new DBean();
String sql = new String();
String sql2 = new String();
String sql_user = new String();
ResultSet rs_user;
int i = 0;

String db_ip = new String();
String os_db_user = new String();
String os_db_passwd = new String();
String db_sid = new String();
String db_ldap_name = new String();
String old_db_ldap_name = new String();
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
String error_msg=new String();

db_ip = request.getParameter("db_ip").trim();
os_db_user = request.getParameter("os_db_user").trim();
os_db_passwd = request.getParameter("os_db_passwd").trim();
db_sid = request.getParameter("db_sid").trim();
db_ldap_name = request.getParameter("db_ldap_name").trim();
old_db_ldap_name = request.getParameter("old_db_ldap_name").trim();
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
db_status = request.getParameter("db_status").trim();
db_type = request.getParameter("db_type").trim();

sql = "update a_db_svr_main set db_ip = '" + db_ip + "',os_db_user = '" + os_db_user + "',os_db_passwd = '" + os_db_passwd + "',db_sid = '" + db_sid + "',db_ldap_name = '" + db_ldap_name  + "',db_user = '" + db_user + "',db_user_passwd = '" + db_user_passwd + "',db_user_type = '" + db_user_type + "',proposer = '" + proposer + "',creater = '" + creater + "',create_date = to_date('" + create_date + "','yyyy-MM-dd'),db_manager = '" + db_manager + "',db_type = '" + db_type + "',db_version = '" + db_version + "',db_character = '" + db_character + "',db_port_num = " + Integer.parseInt(db_port_num) + ",db_listener = '" + db_listener + "',db_status = '" + db_status + "' where db_id = " + request.getParameter("db_id");
//sql2 = "update ts_db set db_ip = '" + db_ip + "',os_db_user = '" + os_db_user + "',os_db_passwd = '" + os_db_passwd + "',db_sid = '" + db_sid + "',db_user = '" + db_user + "',db_user_passwd = '" + db_user_passwd + "',db_user_type = '" + db_user_type + "',proposer = '" + proposer + "',creater = '" + creater + "',create_date = to_date('" + create_date + "','yyyy-MM-dd'),db_manager = '" + db_manager + "',db_version = '" + db_version + "',db_character = '" + db_character + "',db_port_num = " + Integer.parseInt(db_port_num) + ",db_listener = '" + db_listener + "',db_status = '" + db_status + "' where db_id = " + request.getParameter("db_id");
//out.println(sql+"<br>");
System.out.println(sql+"\n");
sql_user = "select * from a_user where usr = '" + session.getAttribute("username") + "'";
rs_user = db.execSQL(sql_user);
while(rs_user.next()){
	if("2".equals(rs_user.getString("valid"))){		
		try {
	//	i = db.execUpdate(sql2);
			i = db.execUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
			error_msg=e.toString();
		}

if (!"-".equals(db_ldap_name)) {
// start LDAP update
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
	error_msg=e.toString();
    }  
}  

String strAct="delete";     
String strCN=db_ldap_name;       
String old_strCN=old_db_ldap_name;       
String strDESC="(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST="+db_ip+")(PORT="+db_port_num+")))(CONNECT_DATA=(SERVICE_NAME="+db_sid+")))";
System.out.println(strCN+"="+strDESC);

if ( "delete".equals(strAct) ) {
        String entryDN = "cn=" + old_strCN + ",cn=OracleContext";
    try {
        SearchResultEntry entry = connection.getEntry(entryDN);
        if (entry == null) {
            System.out.println(old_strCN + " user: " + old_strCN + "Not existed");
            System.out.println(entryDN);
            return;
        }
        connection.delete(entryDN);
        System.out.println(entryDN + "was deleted by "+session.getAttribute("username"));
    } catch (Exception e) {
        System.out.println(entryDN + "was deleted with error：\n" + e.getMessage());
	error_msg=e.toString();
    }
}

strAct="add";     
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
	error_msg=e.toString();
    }
}

// End of LDAP update

	}else{
		System.out.println(sql+"\n");
	}
}

} // end of if

db.close();
rs_user.close();

if(i==1){
	response.sendRedirect("db_server_main_query.jsp?info=Update Succeed!");
}else{
	response.sendRedirect("db_server_main_query.jsp?info=Update Failed!<br>"+error_msg);
}
%>
<jsp:include page="includes/copyright.jsp" /></body>
</html>
