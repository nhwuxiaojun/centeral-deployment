<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.ebao.ts.*"	 %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.Query" %>
<%@ page import="org.hibernate.cfg.*" %>
<%@ page import="org.hibernate.Transaction" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>


<html>
<head>
<title>Untitled Document</title>
    <link rel="stylesheet" type="text/css" href="jQueryInAction/styles/core.css">
    <link rel="stylesheet" type="text/css" href="jQueryInAction/themes/cupertino/jquery-ui-1.8.custom.css">
    <script type="text/javascript" src="jQueryInAction/scripts/jquery-1.4.js"></script>
    <script type="text/javascript" src="jQueryInAction/scripts/jquery-ui-1.8.custom.min.js"></script>
    <script type="text/javascript" src="jQueryInAction/scripts/jqia2.support.js"></script>
    <script type="text/javascript">
      $(function(){
$("#keyword").autocomplete(["c++","java", "php", "coldfusion","javascript"], { 
width: 320, 
max: 4, 
highlight: false, 
multiple: true, 
multipleSeparator: "", 
scroll: true, 
scrollHeight: 300 
}); 
      });
    </script>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
</head>
<script type="text/javascript">  
function update_print(tmp_no,tmp_id,tmp_ip,tmp_user,tmp_pass,print_act){    
//	alert(tmp_no);
	if (confirm('Please confirm update '+tmp_ip+' print info?')) {
		if (tmp_no >1) {
			var printForms=document.getElementsByName("printForm");
			printForm[tmp_no-1].action="ts_print_query.jsp?print_act=update";
			printForm[tmp_no-1].submit();
		} else {
        	        printForm.action="ts_print_query.jsp?print_act=update";
               	 	printForm.submit();
		}
	}
}  

function delete_print(tmp_no,tmp_id,tmp_ip){
	if (confirm('Please confirm delete '+tmp_ip+' print info?')) {
		var printForms=document.getElementsByName("printForm");
		printForm[tmp_no-1].action="ts_print_query.jsp?print_act=delete";
		printForm[tmp_no-1].submit();
	}
}  


function add_print(tmp_ip,tmp_act){
	if (tmp_ip == null || tmp_ip == '' || tmp_ip.length < 7 || tmp_ip.indexOf('.')<0 ) {
		alert("Please input correct IP address!");
		document.getElementById("edit_print_ip").focus();
	} else {
	    addsearchForm.action="ts_print_query.jsp?print_ip="+tmp_ip+"&print_act="+tmp_act;
		addsearchForm.submit();	
	}
}

function search_print(tmp_ip,tmp_act){
        if (tmp_ip == null || tmp_ip == '') {
                alert("Please input correct IP address!");
                document.getElementById("edit_print_ip").focus();
        } else {
            addsearchForm.action="ts_print_query.jsp?print_ip="+tmp_ip+"&print_act="+tmp_act;
                addsearchForm.submit();
        }
}

</script>  
<body><%@include file="includes/head.html" %>
<%
Socket s=null;
//DBean db = new DBean();
//String sql = new String();
//ResultSet rs = null;

String streditprintIP=request.getParameter("edit_print_ip");
String strprintIP=request.getParameter("print_ip");
String strprintID=request.getParameter("print_id");
String strprintAct=request.getParameter("print_act");
String strprintUser=request.getParameter("print_user");
String strprintPwd=request.getParameter("print_pwd");
String searchsql="";
System.out.println(streditprintIP);
System.out.println("Action:"+strprintAct);
System.out.println(strprintIP+strprintID+strprintUser+strprintPwd);
//try {
//	SessionFactory sf=
//		new Configuration().configure().buildSessionFactory();
//	Session ss = sf.openSession();
if ( "update".equals(strprintAct) ) {
	System.out.println("Update");
	SessionFactory sf=new Configuration().configure().buildSessionFactory();
	Session ss = sf.openSession();
//    Session session = HibernateSessionFactory.getSession();  
    Transaction tx = ss.beginTransaction();  
    TsPrint stu = new TsPrint(strprintIP, strprintUser, strprintPwd);  
    Long id=new Long(strprintID);
    stu.setPrintId(id);
    try {  
        ss.update(stu);  
        tx.commit();  
    } catch (Exception e) {  
        tx.rollback();  
        e.printStackTrace();  
    }finally{  
        ss.close();  
    }  
//	searchsql="where print_ip like '%"+strprintIP+"%'";
	}
if ( "delete".equals(strprintAct) ) {
	System.out.println("Delete");
	SessionFactory sf=new Configuration().configure().buildSessionFactory();
	Session ss = sf.openSession();
//    Session session = HibernateSessionFactory.getSession();  
    Transaction tx = ss.beginTransaction();  
    TsPrint stu = new TsPrint(strprintIP, strprintUser, strprintPwd);  
    Long id=new Long(strprintID);
    stu.setPrintId(id);
    try {  
        ss.delete(stu);  
        tx.commit();  
    } catch (Exception e) {  
        tx.rollback();  
        e.printStackTrace();  
    }finally{  
        ss.close();  
    }  
	}
if ( "insert".equals(strprintAct) ) {
	SessionFactory sf=new Configuration().configure().buildSessionFactory();
	Session ss = sf.openSession();
//    Session session = HibernateSessionFactory.getSession();  
    Transaction tx = ss.beginTransaction();  
    TsPrint stu = new TsPrint(strprintIP, "admin_print", "admin_print250");  
    try {  
        ss.save(stu);  
        tx.commit();  
    } catch (Exception e) {  
        tx.rollback();  
        e.printStackTrace();  
    }finally{  
        ss.close();  
    }  
	System.out.println("insert");
	}
if ( "search".equals(strprintAct) ) {
	System.out.println("Search");
	searchsql="where print_ip like '%"+strprintIP+"%'";
	}
//	} catch (Exception e) {
//				e.printStackTrace();
//	}
%>

<br>
<div align="center"><span class="s105">TS Print Server Query (ts_print)</span></div>

<form name="addsearchForm" method="post" action="ts_print_query.jsp">
		<input name="print_act" type=hidden>
&nbsp;<center>Print Server IP:&nbsp;<input value="" name="edit_print_ip" size=20 id="keyword">
&nbsp;<button style="height: 20px; width: 60px" onclick=add_print(edit_print_ip.value,'insert')>New</button>
&nbsp;<button style="height: 20px; width: 60px" onclick=search_print(edit_print_ip.value,'search')>Search</button>
&nbsp;</center></center>
</form>
<br>
<table width="680" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
<tr bgcolor="#aaaaaa">
<td align="left" class="en"><font color="#0000EE">No</font></td>
<td align="left" class="en"><font color="#0000EE">Print Server IP</font></td>
<td align="left" class="en"><font color="#0000EE">Status</font></td>
<td align="left" class="en"><font color="#0000EE">RDP Username</font></td>
<td align="left" class="en"><font color="#0000EE">RDP Password</font></td>
<td align="left" class="en"><font color="#0000EE">&nbsp;Action&nbsp;</font></td>
<td align="left" class="en"><font color="#0000EE">&nbsp;Action&nbsp;</font></td>
</tr>

		<%
		try {
			SessionFactory sf=new Configuration().configure().buildSessionFactory();
			Session ss = sf.openSession();
			Transaction tx= ss.beginTransaction();
			//	TsPrint tp= new TsPrint();
				
			List list = null;
			//list = TsPrintDAO.findAll();
				
			String queryString = "from TsPrint "+searchsql;
			Query queryObject =ss.createQuery(queryString);
		//String queryString="select * from ts_print";
		//Query queryObject=ss.createSQLQuery(queryString);
			list =queryObject.list();
			int sum=0;
			for (Iterator it=list.iterator();it.hasNext();){
				TsPrint tp=(TsPrint)it.next();
				sum++;
				%>
	<form name="printForm" method="post" action="ts_print_query.jsp">
		<input name="print_act" type=hidden>
		<input name="print_ip" type=hidden value="<%=tp.getPrintIp()%>">
		<input name="print_id" type=hidden value="<%=tp.getPrintId()%>">
<tr bgcolor="#FCFCFC">
<td align="left" class="en"><font color="#0000EE"><%=sum%></font></td>
<td align="left" class="en"><font color="#0000EE"><%=tp.getPrintIp()%></font></td>
<td align="left" class="en"><font color="#0000EE">
      <%
           try{
                //System.out.print("Trying SSH to "+rs.getString("ENV_IP")+"...");
// With performance issue need to optimization.
                //s=new Socket(InetAddress.getByName(rs.getString("ENV_IP")),3389);
                InetAddress theAddress = InetAddress.getByName(tp.getPrintIp());
                InetSocketAddress inetSocketAddress = new InetSocketAddress(theAddress, 3389);
                s=new Socket();
                s.connect(inetSocketAddress, 1000);
                out.print("<font color=green>Alive</font>");
                                 //System.out.println(" Alive!\n");
           }
           catch(IOException e){
                 out.print("<font color=red>Dead</font>");
                                 System.out.println("Host "+tp.getPrintIp()+" unreachable.\n");
           }finally{
                try{s.close();}catch(Exception e){}
           }
          %>
</font></td>
<td align="left" class="en"><font color="#0000EE"><input name="print_user" size="20" value="<%=tp.getPrintUser()%>"/></font></td>
<td align="left" class="en"><font color="#0000EE"><input name="print_pwd" size="20" value="<%=tp.getPrintPwd()%>"/></font></td>
<td class="en"><button style="height: 22px; width: 60px" onclick=update_print('<%=sum%>','<%=tp.getPrintId()%>','<%=tp.getPrintIp()%>','<%=tp.getPrintUser()%>','<%=tp.getPrintPwd()%>','update')>Update</button></font></td>
<td class="en"><button style="height: 22px; width: 60px" onclick=delete_print('<%=sum%>','<%=tp.getPrintId()%>','<%=tp.getPrintIp()%>','delete')>Delete</button></font></td>
</tr>
</form>
				<%
				//System.out.println(tp.getPrintUser());	
			}
				System.out.println("ts_print"+ list.size());

			//ss.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		 %>
		</table>
		<%//db.close();%>
		<%//rs.close();%>
		<jsp:include page="includes/copyright.jsp" /></body>
		</html>
