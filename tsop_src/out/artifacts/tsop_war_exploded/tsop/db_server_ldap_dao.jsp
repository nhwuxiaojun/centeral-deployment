<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java"
	import="java.sql.*" errorPage=""%>
<%@ page import="ebao.DBean"%>
<%@ page import="ebao.Tools"%>
<%@ page import="java.util.*" %>
<%@ page import="com.unboundid.ldap.sdk.*"%>
<%@ page import="com.unboundid.ldap.sdk.controls.*"%>
<html>
	<head>
		<title>数据库环境LDAP DAO</title>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-35589746-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
		<link href="css/ebao.css" rel="stylesheet" type="text/css">
	</head>
<script language="JavaScript">
function check() {
	addsearchForm.submit();
}
function deleteAct(tmp_no,tmp_id) {
	if (confirm('Please confirm delete '+tmp_id+' LDAP info?')) {
		if ( tmp_no == '1') {
			printForm.action="db_server_ldap_dao.jsp?act=delete";
			printForm.submit();
		} else {
			var printForms=document.getElementsByName("printForm");
			printForm[tmp_no-1].action="db_server_ldap_dao.jsp?act=delete";
			printForm[tmp_no-1].submit();
		}
	}
}
function updateAct(tmp_no,tmp_id) {
	if (confirm('Please confirm update '+tmp_id+' LDAP info?')) {
		if ( tmp_no == '1') {
			printForm.action="db_server_ldap_dao.jsp?act=update";
			printForm.submit();
		} else {
			var printForms=document.getElementsByName("printForm");
			printForm[tmp_no-1].action="db_server_ldap_dao.jsp?act=update";
			printForm[tmp_no-1].submit();
		}
	}
}
function addAct(tmp_id,tmp_act) {
	if (tmp_id == null || tmp_id == '') {
		alert("Please input LDAP name to add!");
		document.getElementById("col_value").focus();
	} else {
	    addsearchForm.action="db_server_ldap_dao.jsp?cn="+tmp_id+"&act="+tmp_act;
		addsearchForm.submit();	
	}
}
</script>
	<script language="JavaScript" for="document" event="onkeypress">
if (event.keyCode == 13) {
	check();
}
</script>
	<body><%@include file="includes/head.html" %>		
<br>
<%
DBean db = new DBean();
String sql = new String();
ResultSet rs;
ResultSet rs2;
sql = "select * from a_db_svr_main where rownum<11 order by db_sid,db_user";
System.out.print(sql);
rs = db.execSQL(sql);
%>

		<%if("".equals(request.getParameter("info"))){%>

		<%}else{%>
		<div align="left">
			<font color="#FF0000" style="font-size: 9pt;"><%=Tools.toGB(request.getParameter("info"))%></font>
		<%}%>
		<form name="addsearchForm" action="db_server_ldap_dao.jsp" method="post" class="en">
						<strong><font color=blue>DB LDAP Query </font></strong> - Search: 
						<%if("".equals(request.getParameter("col_value"))||request.getParameter("col_value")==null){%>
						<input type="text" name="col_value" value="" class="en" size="25">
						<%}else{%>
						<input type="text" name="col_value"
							value="<%=request.getParameter("col_value")%>" class="en"
							size="25">
						<%}%>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" name="button1" value="查询" class="en"
							onClick="check()">
						<%sql="select * from a_user where usr='"+session.getAttribute("username")+"'";%>
						<%rs2=db.execSQL(sql);%>
						<%while(rs2.next()){%>
						<%if("2".equals(rs2.getString("valid"))){%>
						&nbsp;&nbsp;
						<input type="button" name="button2" value="新增" class="en"
							onClick=addAct(col_value.value,'add')>
						<%}else{%>

						<%}%>
						<%}%>
			<input type="hidden" name="flag" value="y">
		</form>
		</div>
	<table style="table-layout: fixed" width="98%" border="1"
			cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E"
			bordercolordark="#EFEFEF" align="center">
			<tr height=30 bgcolor=blue>
			<td width=6%><font color=white>NO</font></td>
			<td width=10%><font color=white>TNSNAME</td>
			<td width=60%><font color=white>TNS Description</td>
                                                <%sql="select * from a_user where usr='"+session.getAttribute("username")+"'";%>
                                                <%rs2=db.execSQL(sql);%>
                                                <%while(rs2.next()){%>
                                                <%if("2".equals(rs2.getString("valid"))){%>
			<td width=6%><font color=white>Delete</td>
			<td width=6%><font color=white>Update</td>
                                                <%}else{%>
                                                <%}%>
                                                <%}%>

			</tr>
<%
String ldapHost = "172.16.7.50";  
int ldapPort = 389;  
String ldapBindDN = "cn=Manager,cn=OracleContext";
	String ldapPassword = "tssecret";
LDAPConnection connection = null;  
if (connection == null) {  
    try {  
        connection = new LDAPConnection(ldapHost, ldapPort, ldapBindDN, ldapPassword);  
    } catch (Exception e) {  
        System.out.println("连接LDAP出现错误：\n" + e.getMessage());  
    }  
}  
String search_key=request.getParameter("col_value");
String strAct=request.getParameter("act");
String strCN=request.getParameter("cn");
String strDESC=request.getParameter("desc");

System.out.println("Action:cn:"+strAct+":"+strCN+":"+strDESC+"\n");

if ( "delete".equals(strAct) ) {
	String entryDN = "cn=" + strCN + ",cn=OracleContext";  
    try {  
        SearchResultEntry entry = connection.getEntry(entryDN);  
        if (entry == null) {  
            System.out.println(strCN + " user: " + strCN + "Not existed");  
            System.out.println(entryDN);  
            return;  
        }  
        connection.delete(entryDN);  
        System.out.println(entryDN + "was deleted by "+session.getAttribute("username"));  
    } catch (Exception e) {  
        System.out.println(entryDN + "was deleted with error：\n" + e.getMessage());  
    }  
}
if ( "add".equals(strAct) ) {
	String entryDN = "cn=" + strCN + ",cn=OracleContext";  
    try {  
         
        SearchResultEntry entry = connection.getEntry(entryDN);  
        if (entry == null) {  
            ArrayList<Attribute> attributes = new ArrayList<Attribute>();  
            attributes.add(new Attribute("objectClass", "top", "orclNetService"));  
            attributes.add(new Attribute("cn", strCN));  
            connection.add(entryDN, attributes);  
            System.out.println("Create" + entryDN + "successfully by " + session.getAttribute("username"));  
        } else {  
            System.out.println("DN" + entryDN + "existed！");  
        }  
    } catch (Exception e) {  
        System.out.println("Failed to create DN \n" + e.getMessage());  
    }  
}
if ( "update".equals(strAct) ) {
	String requestDN = "cn=" + strCN + ",cn=OracleContext";  
	HashMap<String,String> data = new HashMap<String,String>(0);  
	data.put("cn",strCN);
	data.put("orclNetDescString", strDESC);
    try {  
        SearchResultEntry entry = connection.getEntry(requestDN);  
        if (entry == null) {  
            System.out.println(requestDN + " DN:" + requestDN + " Not existed");  
            return;  
        }  
        ArrayList<Modification> md = new ArrayList<Modification>();  
        for(String key : data.keySet()) {  
            md.add(new Modification(ModificationType.REPLACE, key, data.get(key)));  
        }  
        connection.modify(requestDN, md);  
  
        System.out.println(requestDN+" was updated by " + session.getAttribute("username"));  
    } catch (Exception e) {  
        System.out.println("Failed to update DN:\n" + requestDN + e.getMessage());  
    }  
}

try {  

if("".equals(request.getParameter("col_value"))||request.getParameter("col_value")==null){ search_key="*"; } else { search_key="*"+search_key+"*"; }
String filter="&(objectClass=orclNetService)(cn="+search_key+")";
// search all  
SearchRequest searchRequest = new SearchRequest("cn=OracleContext", SearchScope.SUB, "(" + filter + ")");  
searchRequest.addControl(new SubentriesRequestControl());  
SearchResult searchResult = connection.search(searchRequest);  
//System.out.println("Total records:" + searchResult.getSearchEntries().size());  
out.println("Total records:" + searchResult.getSearchEntries().size());  
int index = 1;  
for (SearchResultEntry entry : searchResult.getSearchEntries()) {  
	%>
	<form name="printForm" method="post" action="db_server_ldap_dao.jsp">
		<input name="act" type=hidden>
		<input name="cn" type=hidden value="<%=entry.getAttributeValue("cn")%>">
	<tr>
	<td><% out.println(index); %></td>
	<td><input size="24" name="cn" readonly value="<% out.println(entry.getAttributeValue("cn")); %>"</td>
	<td><input size="135" name="desc" value="<% out.println(entry.getAttributeValue("orclNetDescString")); %>"</td>
                                                <%sql="select * from a_user where usr='"+session.getAttribute("username")+"'";%>
                                                <%rs2=db.execSQL(sql);%>
                                                <%while(rs2.next()){%>
                                                <%if("2".equals(rs2.getString("valid"))){%>
	<td><button name="delete" onClick=deleteAct('<%=index%>','<%=entry.getAttributeValue("cn")%>')>Delete</button></td>
	<td><button name="update" onClick=updateAct('<%=index%>','<%=entry.getAttributeValue("cn")%>')>Update</button></td>
                                                <%}else{%>
                                                <%}%>
                                                <%}%>
	</tr>
	</form>
<%
	index ++;
    //System.out.println((index++) + "\t" + entry.getDN());  
}  
} catch (Exception e) {  
	System.out.println("查询错误，错误信息如下：\n" + e.getMessage());  
}  

%>
	
		<%db.close();%>
		<%rs.close();%>
		</table>
	<jsp:include page="includes/copyright.jsp" /></body>
</html>
