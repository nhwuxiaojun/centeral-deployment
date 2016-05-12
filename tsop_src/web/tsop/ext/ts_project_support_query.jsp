<%@ include file="../interface/check_non_ts.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>TS Project Support Query</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="../css/ebao_no_ts.css" rel="stylesheet" type="text/css">
<script src="../scripts/jquery-1.11.1.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function() {
$("#maintable tbody tr").hover(function() {
        // $("#orderedlist li:last").hover(function() {
                $(this).addClass("blue");
        }, function() {
                $(this).removeClass("blue");
        });
});
</script>
<style>
.blue {
        background:#ffff00;  
}
</style>
</head>
<%
DBean db = new DBean();
String sql = new String();
String sql1= new String();
String sql2= new String();
String sql3= new String();
int i=0;
int sum=0;
float sum1=0;
float sum2=0;
String array1[][];
array1=new String[50][2];
ResultSet rs;
ResultSet rs1;
ResultSet rs2;
ResultSet rs3;
%>
<script language="JavaScript">
var subcat = [];
   subcat.length=0;
   <% 
   sql1="select * from a_env_name order by proj_grp,proj_name";
rs1=db.execSQL(sql1);
        int count = 0; 
        while(rs1.next()){ 
    %> 
        subcat[<%=count%>] = ["<%=rs1.getString("proj_grp")%>","<%=rs1.getString("proj_name")%>","<%=rs1.getString("proj_code")%>"];
    <% 
        count++; 
        } 
       rs1.close(); 
    %> 
function change_proj(pname) 
{
	//var form11 = document.getElementById("form1");
	//var act1=document.getElementById("flag");
	//act1.value="y";
	//form11.target="_blank";
	//form11.action="ts_project_support_query.jsp?proj_grp="+pname+"&s_name=all";
	//form11.method="post";
	form1.submit();	
        //form1.proj_grp.selectedIndex=0;
        //form1.proj_name.selectedIndex=0;
        //form1.s_name.selectedIndex=0;
	//form1.col_value1.value="";
}

function change_grp(team_id)
{
        document.form1.proj_name.length = 0;
        document.form1.proj_name.options[0] = new Option('Please select','');
        var team_id=team_id; 
        for (i=0;i < subcat.length ; i++)
        {    
                if (subcat[i][0] == team_id)
                {
                        document.form1.proj_name.options[document.form1.proj_name.length] = new Option(subcat[i][1], subcat[i][2]);
                }        
        } 
        // document.form1.proj_name.options[0].selected = true;
}
	
function query_proj(){
        if(form1.col_value1.value.length<3){
                alert("Please input more letters!");
                form1.col_value1.select();

        } else {
        form1.proj_grp.selectedIndex=0;
        form1.proj_name.selectedIndex=0;
        //form1.s_name.selectedIndex=0;
	form1.submit();
	form1.col_value1.select();
	}
}
function check(){
        if(form1.col_value1.value.length<2){
                alert("Please input more letters!");
                form1.col_value1.select();

        } else {
                form1.submit();
        }
}
</script>
<script language="JavaScript" for="document" event="onkeypress">
        if(event.keyCode==13){
                check();
        }
</script>
<script language="JavaScript" for="window" event="onload">
        form1.col_value1.select();
</script>
<body>
<%@include file="head.jsp" %>
<%

// For search
String tmpact=request.getParameter("act");
String tmpid=request.getParameter("proj_id");
String tmpproj_name=request.getParameter("proj_name");
String tmpproj_grp=request.getParameter("proj_grp");
// For print
String tmpflag=request.getParameter("flag");
System.out.println("Flag is:"+tmpflag);

System.out.println("proj_name:"+tmpproj_name);
System.out.println("proj_grp:"+tmpproj_grp);

sql3="select NO,ACCOUNT from ts_member where resign=0 order by account";
rs3=db.execSQL(sql3);
while(rs3.next()) {
	array1[i][0]=rs3.getString("NO");
	array1[i][1]=rs3.getString("ACCOUNT");
	i++;
}
System.out.println("s_name is:"+request.getParameter("s_name"));
System.out.println(request.getParameter("col_value1")+request.getParameter("col_name1"));

	System.out.println("--------sql1---------");
String common_sql="select * from ts_proj a, ts_member b, ts_member c where a.owner1=b.no(+) and a.owner2=c.no(+) and a.valid=1 and b.resign=0 ";

if("y".equals(request.getParameter("flag"))||"print".equals(request.getParameter("flag"))){
	if("".equals(request.getParameter("col_value1"))||request.getParameter("col_value1").trim()==null){
			sql = "select * from ts_proj where valid=1 and proj_id = "+tmpproj_name+" order by proj_grp,proj_name";
			System.out.println("--------sql2---------");
	}else{
		String field_name=request.getParameter("col_name1").toString();
		String field_value=request.getParameter("col_value1").toString().trim().toUpperCase();
		if ("name".equals(field_name)&&field_value.length()>1) {
			// search by username
		            sql = common_sql+" and (upper(b." + field_name + ") like '%" + field_value + "%' or upper(c." + field_name + ") like '%" + field_value + "%') order by proj_name";
		} else if ("proj_name".equals(field_name)) {
			//search by proj_name
				sql=common_sql+" and "+field_name+" like '%" + field_value + "%' order by proj_name";
			}
			else sql = common_sql+" and 1=0 order by proj_grp,proj_name";
	System.out.println("--------sql3---------");
	}
}else{
	sql = "select * from ts_proj where valid=1 and rownum<20 order by proj_grp,proj_name ";
	System.out.println("--------sql4---------");
}

if (("%".equals(tmpproj_grp)&&(request.getParameter("col_value1")==null))||!"%".equals(tmpproj_grp)) {
	sql="select * from ts_proj where valid=1 and proj_id="+tmpproj_name+" order by proj_grp,proj_name";
	System.out.println("--------sql5---------");
}

if (request.getParameter("flag")==null) {
	sql = "select * from ts_proj where 1=0 and valid=1 and rownum<20 order by proj_grp,proj_name ";					
	System.out.println("--------sql7---------");
}


System.out.println(sql);
rs = db.execSQL(sql);
%>
<center>

<table align="center" cellpadding="0" cellspacing="0" border="0" width="98%">
<tr><td>&nbsp;</td></tr>
<form name="form1" action="ts_project_support_query.jsp" method="post" class="en">
		<input name="flag" value="y" type=hidden>
	<tr>
		<td align="left" class="en" width="20%">
        &nbsp;<strong><font color="#3333cc" class="MenuBarItemSubmenu">Project Support Query</font></strong> &nbsp;&nbsp;

     	<SELECT name="proj_grp" onChange="change_grp(document.form1.proj_grp.options[document.form1.proj_grp.selectedIndex].value)" > 
  	 <option 
     <%
	if ("".equals(request.getParameter("proj_grp"))) {
		out.print("selected=selected ");
		}
	 %>
     value="%">Project Group</option>
	 <%
	 sql3="select distinct proj_grp from ts_proj where valid=1";
	 System.out.println(sql3);
	 rs3=db.execSQL(sql3);
	   while(rs3.next()){%>
	<option <%
	if (rs3.getString("proj_grp").equals(request.getParameter("proj_grp"))) {
		out.print("selected=selected ");
		}
	%>
    value="<%=rs3.getString("proj_grp")%>"><%=rs3.getString("proj_grp")%></option>
	<%}%>
	</select>
	&nbsp;
        <select name="proj_name" onChange="change_proj(document.form1.proj_name.options[document.form1.proj_name.selectedIndex].value)">
                <option 
        <%
        if ("".equals(request.getParameter("proj_name"))) {
                out.print("selected=selected ");
                }
         %>
                value="">Project Name</option>
                                <%
                                sql1="select * from ts_proj where valid=1 order by proj_name ";
                                System.out.println(sql1);
                                rs3 = db.execSQL(sql1);
                                while(rs3.next()){
                                        %>
                                                <option
<%
        if (rs3.getString("proj_id").equals(request.getParameter("proj_name"))) {
                out.print("selected=selected ");
                }
        %>
        value="<%=rs3.getString("proj_id")%>"  ><%=rs3.getString("proj_name")%></option>
        <%}%>   
        </select> 
        &nbsp;
		<select name="col_name1" class="en">
			<%if("".equals(request.getParameter("col_name1"))||request.getParameter("col_name1")==null){%>
				<option value="name" <% if ("name".equals(request.getParameter("col_name1"))) out.print("selected"); %>>TS Name</option>
				<option value="proj_name" <% if ("proj_name".equals(request.getParameter("col_name1"))) out.print("selected"); %>>Project Name</option>
			<%}else{%>
				<option value="name" <% if ("name".equals(request.getParameter("col_name1"))) out.print("selected"); %>>TS Name</option>
				<option value="proj_name" <% if ("proj_name".equals(request.getParameter("col_name1"))) out.print("selected"); %>>Project Name</option>
			<%}%>
		</select>
		<input type="text" name="col_value1" value="<%if ("y".equals(request.getParameter("flag"))) out.print(request.getParameter("col_value1"));%>" class="en" size="15">&nbsp;


        <input type="button" name="button1" value="Query" class="en" onClick="query_proj();">
        
        <input type="button" name="button2" value="Back" class="en" onClick="history.go(-1);">
		</td>
	</tr>
    </form>
    
<%sql="select * from a_user where usr='"+session.getAttribute("username")+"'";%>
<%rs2=db.execSQL(sql);%>
<%while(rs2.next()){%>
  <%if("0".equals(rs2.getString("valid"))){%>
    <tr><td>&nbsp;</td></tr>
    <tr>
    <td align="center">
    <form name="form3" action="../ts_project_support_query.jsp">
    	项目属组：<select name="a_proj_grp">
        <%
		sql="select distinct proj_grp from ts_proj order by proj_grp";
		rs3=db.execSQL(sql);
		while (rs3.next()) {
			out.print("<option value="+rs3.getString("PROJ_GRP")+">"+rs3.getString("PROJ_GRP")+"</option>");
		}
		
		%></select>
        Project Name：<input name="a_proj_name" size=15>
        Project Code：<input name="a_proj_id" size=10>
		Primary TS support:<select name="a_owner1">
        <%
		for (int j=0;j<i;j++) {
			out.print("<option value="+array1[j][0]+">"+array1[j][1]+"</option>");
		}		
		%>
        </select> 
        <input type="submit" name="button2" value="Add" class="en">
        </form>
        </td>
      </tr>
<%}}%>
</table>
<input type="hidden" name="flag" value="y">
</form>
    <form name="form2">
		<input name="act" type=hidden>
		<input name="proj_id" type=hidden>
		<input name="s_owner1" type=hidden>
		<input name="s_owner2" type=hidden>
		<input name="cost1" type=hidden>
		<input name="cost2" type=hidden>
<table id="maintable" style="table-layout: fixed" width="98%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
<thead>
<%sql="select * from a_user where usr='"+session.getAttribute("username")+"'";%>
<%rs2=db.execSQL(sql);%>
<%while(rs2.next()){%>
  <%if("0".equals(rs2.getString("valid")) && (!"print".equals(request.getParameter("flag")))){%>
	<tr bgcolor="#0000FF">
	  <td align="center" class="en" width="6%"><font color="#ffffff"><strong>Project Group</strong></font></td>
	  <td align="center" class="en" width="8%"><font color="#ffffff"><strong>Project Name</strong></font></td>
	  <td align="center" class="en" width="8%"><font color="#ffffff"><strong>Project Code</strong></font></td>
	  <td align="center" class="en" width="10%"><font color="#ffffff"><strong>OWNER1</strong></font></td>
	  <td align="center" class="en" width="4%"><font color="#ffffff"><strong>COST1</strong></font></td>
	  <td align="center" class="en" width="10%"><font color="#ffffff"><strong>OWNER2</strong></font></td>
	  <td align="center" class="en" width="4%"><font color="#ffffff"><strong>COST2</strong></font></td>
	  <td align="center" class="en" width="5%"><font color="#ffffff"><strong>Update </strong></font></td>
	  <td align="center" class="en" width="5%"><font color="#ffffff"><strong>Delete</strong></font></td>
	</tr>
</thead>
<tbody>
	<%while(rs.next()){
		sum++;
		if ((sum%2)==1) {
			out.println("<tr bgcolor=#ffffff>");
		} else {
			out.println("<tr bgcolor=#ffeeff>");
		}
		sum1=sum1+rs.getFloat("TS_COST1");
		sum2=sum2+rs.getFloat("TS_COST2");
		%>
	  <td align="center" class="en"><font color="#FF6600"><%=rs.getString("PROJ_GRP")%></font></td>
	  <td align="center" class="en"><font color="#FF6600"><%=rs.getString("PROJ_NAME")%></font></td>
	  <td align="center" class="en"><font color="#FF6600"><%=rs.getString("PROJ_ID")%></font></td>  
	  <td align="center" class="en"><font color="#FF6600">
	  <%
	  	sql1="select NO,ACCOUNT from ts_member where resign=0 and no="+rs.getLong("OWNER1");
		rs1 = db.execSQL(sql1);
		//System.out.println(sql1);
		while(rs1.next()) {
		//	out.println(rs1.getString("ACCOUNT"));

      		%>
       	<select name=<%out.print(rs.getString("PROJ_ID")+"_1");%>>
        <%
		for (int j=0;j<i;j++) {
			if (array1[j][1].equals(rs1.getString("ACCOUNT"))) {
				out.print("<option selected=selected value="+array1[j][0]+">"+array1[j][1]+"</option>");			
			} else {
			out.print("<option value="+array1[j][0]+">"+array1[j][1]+"</option>");
			}
		}	
				}
		%>
        </select>
      </font></td>

	  <td align="center" class="en"><input name=<%out.print(rs.getString("PROJ_ID")+"_cost1");%> value=<%=rs.getFloat("TS_COST1")%> size=3></td> 
	  <td align="center" class="en"><font color="#FF6600">
	  	  <%
	  	sql1="select ACCOUNT from ts_member where resign=0 and no="+rs.getLong("OWNER2");
		rs1 = db.execSQL(sql1);
		//System.out.println(sql1);
		while(rs1.next()) {
			//out.println(rs1.getString("ACCOUNT"));
      		%>
       	<select name=<%out.print(rs.getString("PROJ_ID")+"_2");%>>
        <%
		for (int j=0;j<i;j++) {
			if (array1[j][1].equals(rs1.getString("ACCOUNT"))) {
				out.print("<option selected=selected value="+array1[j][0]+">"+array1[j][1]+"</option>");			
			} else {
			out.print("<option value="+array1[j][0]+">"+array1[j][1]+"</option>");
			}
		}	
				}
		%>
        </select>
        </td>

	  <td align="center" class="en"><input name=<%out.print(rs.getString("PROJ_ID")+"_cost2");%> value=<%=rs.getFloat("TS_COST2")%> size=3></td> 

	  <td align="center" class="en"><font color="#FF6600">
      <button class="en" onClick="update_proj(<%=rs.getString("PROJ_ID")%>,'update')">Update</button></td>
	  <td align="center" class="en"><font color="#FF6600">
      <button class="en" onClick="del_proj(<%=rs.getString("PROJ_ID")%>,'del')">Delete</button></td>
	</tr>
	<%}%>

	<tr bgcolor="#D2D2D2">
    	<td></td>
        <td></td>
        <td></td>
    	<td></td>
        <td align="center" class="en">Sum：<%=sum1%></td>
        <td></td>
        <td align="center" class="en">Sum：<%=sum2%></td>  
        <td></td>
        <td></td>        
    </tr>
  <%}else{%>
	<tr bgcolor="#3333cc" height="24">
	  <td align="center" class="en" width="3%"><font color="#ffffff">No</font></td>
	  <td align="center" class="en" width="6%"><font color="#ffffff">Project Group</font></td>
	  <td align="center" class="en" width="8%"><font color="#ffffff">Project Name</font></td>
	  <td align="center" class="en" width="8%"><font color="#ffffff">Project Code</font></td>
	  <td align="center" class="en" width="10%"><font color="#ffffff">Primary TS Support</font></td>
	  <td align="center" class="en" width="10%"><font color="#ffffff">Cell Phone</font></td>
      <% /*
	  <td align="center" class="en" width="4%"><font color="#FF6600"><strong>COST1</strong></font></td>
	  */ %>
	  <td align="center" class="en" width="10%"><font color="#ffffff">Backup TS Support</font></td>
	  <td align="center" class="en" width="10%"><font color="#ffffff">Cell Phone</font></td>
      <% /*
	  <td align="center" class="en" width="4%"><font color="#FF6600"><strong>COST2</strong></font></td>
	  */ %>

	</tr>
	<%while(rs.next()){
				sum++;
		if ((sum%2)==1) {
			out.println("<tr bgcolor=#eeeeee height=20>");
		} else {
			out.println("<tr bgcolor=#ffffff height=20>");
		}
		//sum1=sum1+rs.getFloat("TS_COST1");
		//sum2=sum2+rs.getFloat("TS_COST2");
		//System.out.println(rs.getString("PROJ_NAME")+rs.getString("OWNER2")+rs.getString("OWNER1"));
		%>
	  <td align="center" class="en"><%=sum%></td>
	  <td align="center" class="en"><%=rs.getString("PROJ_GRP")%></td>
	  <td align="center" class="en"><%=rs.getString("PROJ_NAME")%></td>
	  <td align="center" class="en"><%=rs.getString("PROJ_ID")%></td> 
	  <%
	  	sql1="select NO,ACCOUNT,MOBILE1 from ts_member where resign=0 and no="+rs.getLong("OWNER1");
		rs1 = db.execSQL(sql1);

		while(rs1.next()) {
			out.println("<td align=center class=en><a href=mailto:"+rs1.getString("ACCOUNT")+"@ebaotech.com>"+rs1.getString("ACCOUNT")+"</td>");
			out.println("<td align=center class=en>"+rs1.getString("MOBILE1")+"</td>");
		}
		rs1.close();
      %>

	  <%
	  	sql1="select NO,ACCOUNT,MOBILE1 from ts_member where resign=0 and no="+rs.getLong("OWNER2");
		rs1 = db.execSQL(sql1);
		//rs1.last();
		//System.out.println(rs1.getRow());
		//rs1.beforeFirst();
		//System.out.println(sql1);
		while(rs1.next()) {
			out.println("<td align=center class=en><a href=mailto:"+rs1.getString("ACCOUNT")+"@ebaotech.com>"+rs1.getString("ACCOUNT")+"</td>");
			out.println("<td align=center class=en>"+rs1.getString("MOBILE1")+"</td>");
		}
      %>

	</tr>
    	<%}%>
	<%}%>

<%}%>
</tbody>
</table>
</center>
</form>
<%db.close();%>
<%rs.close();%>
<%rs2.close();%>
<jsp:include page="copyright.jsp" />
</body>
</html>
