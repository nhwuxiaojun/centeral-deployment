<%@ include file="../interface/check_non_ts.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>TS项目支持信息查询</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="../css/ebao_no_ts.css" rel="stylesheet" type="text/css">
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
	var form11 = document.getElementById("form1");
	var act1=document.getElementById("flag");
	act1.value="y";
	//form11.target="_blank";
	form11.action="ts_project_support_query.jsp?proj_grp="+pname+"&s_name=all";
	form11.method="post";
	form11.submit();	
}
	
function query_proj(){
	var form11 = document.getElementById("form1");
	var act1=document.getElementById("flag");
	act1.value="y";
	//form11.target="_blank";
	form11.action="ts_project_support_query.jsp?proj_grp=%";
	form11.method="post";
	form11.submit();
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
<body><%@include file="includes/head.html" %>
<jsp:include page="menu.jsp" />
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

sql3="select NO,ACCOUNT from ts_member order by account";
rs3=db.execSQL(sql3);
while(rs3.next()) {
	array1[i][0]=rs3.getString("NO");
	array1[i][1]=rs3.getString("ACCOUNT");
	i++;
}
System.out.println("s_name is:"+request.getParameter("s_name"));
System.out.println(request.getParameter("col_value1")+request.getParameter("col_name1"));


if("y".equals(request.getParameter("flag"))||"print".equals(request.getParameter("flag"))){
	if("".equals(request.getParameter("col_value1"))||request.getParameter("col_value1")==null){
		if ("all".equals(request.getParameter("s_name"))) {
			sql = "select * from ts_proj where valid=1 order by proj_grp,proj_name";
		}else {
			sql = "select * from ts_proj where valid=1 and (owner1="+request.getParameter("s_name")+" or owner2="+request.getParameter("s_name")+") order by proj_grp,proj_name ";
		}
			
	}else{
		sql = "select * from ts_proj where valid=1 and upper(" + request.getParameter("col_name1").toString() + ") like '%" + request.getParameter("col_value1").toString().trim().toUpperCase() + "%' order by proj_grp,proj_name";
	}
}else{
		sql = "select * from ts_proj where valid=1 and rownum<20 order by proj_grp,proj_name ";
}

if (("%".equals(tmpproj_grp)&&(request.getParameter("col_value1")==null))||!"%".equals(tmpproj_grp)) {
	sql="select * from ts_proj where valid=1 and proj_grp like '"+tmpproj_grp+"' order by proj_grp,proj_name";
}

if (!"all".equals(request.getParameter("s_name"))) {
	sql = "select * from ts_proj where valid=1 and (owner1="+request.getParameter("s_name")+" or owner2="+request.getParameter("s_name")+") order by proj_grp,proj_name ";
}

if (request.getParameter("flag")==null) {
	sql = "select * from ts_proj where valid=1 and rownum<20 order by proj_grp,proj_name ";					
}


System.out.println(sql);
rs = db.execSQL(sql);
%>

<table align="center" cellpadding="0" cellspacing="0" border="0" width="98%">
<tr><td>&nbsp;</td></tr>
<form name="form1" action="ts_project_support_query.jsp" method="post" class="en">
		<input name="flag" value="y" type=hidden>
	<tr>
		<td align="left" class="en" width="20%">
        &nbsp;<strong><font color="#3333cc" class="MenuBarItemSubmenu">项目支持查询</font></strong> &nbsp;&nbsp;

     	<SELECT name="proj_grp" onChange="change_proj(document.form1.proj_grp.options[document.form1.proj_grp.selectedIndex].value)" > 
  	 <option 
     <%
	if ("".equals(request.getParameter("proj_grp"))) {
		out.print("selected=selected ");
		}
	 %>
     value="%">项目属组</option>
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
		<select name="col_name1" class="en">
			<%if("".equals(request.getParameter("col_name1"))||request.getParameter("col_name1")==null){%>
				<option value="proj_name">项目名称</option>
				<option value="proj_grp">项目属组</option>
				<option value="proj_code">项目代码</option>
			<%}else{%>
				<option value="proj_name">项目名称</option>
				<option value="proj_grp">项目属组</option>
				<option value="proj_code">项目代码</option>
			<%}%>
		</select>
		<%if("".equals(request.getParameter("col_value1"))||request.getParameter("col_value1")==null){%>
			<input type="text" name="col_value1" value="" class="en" size="15">&nbsp;
		<%}else{%>
			<input type="text" name="col_value1" value="<%=request.getParameter("col_value1")%>" class="en" size="15">&nbsp;
		<%}%>
		<select name="s_name" onChange="query_proj()" onkeyup="this.blur();this.focus();">
        <%
		for (int j=0;j<i;j++) {
			if (array1[j][0].equals(request.getParameter("s_name"))) {
			out.print("<option selected=selected value="+array1[j][0]+">"+array1[j][1]+"</option>");
			} else {
			out.print("<option value="+array1[j][0]+">"+array1[j][1]+"</option>");
			}
				
		}		
		%>
        <option 
     <%
	if ("all".equals(request.getParameter("s_name"))||"".equals(request.getParameter("s_name"))||request.getParameter("s_name")==null) {
		out.print("selected=selected ");
		}
	 %>
        value="all">all</option>
        </select>
        <input type="button" name="button1" value="查询" class="en" onClick="query_proj();">
        
        <input type="button" name="button2" value="返回" class="en" onClick="history.go(-1);">
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
        项目名称：<input name="a_proj_name" size=15>
        项目代码：<input name="a_proj_id" size=10>
		OWNER1:<select name="a_owner1">
        <%
		for (int j=0;j<i;j++) {
			out.print("<option value="+array1[j][0]+">"+array1[j][1]+"</option>");
		}		
		%>
        </select> 
        <input type="submit" name="button2" value="新增" class="en">
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
<table style="table-layout: fixed" width="98%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
<%sql="select * from a_user where usr='"+session.getAttribute("username")+"'";%>
<%rs2=db.execSQL(sql);%>
<%while(rs2.next()){%>
  <%if("0".equals(rs2.getString("valid")) && (!"print".equals(request.getParameter("flag")))){%>
	<tr bgcolor="#0000FF">
	  <td align="center" class="en" width="6%"><font color="#ffffff"><strong>项目组</strong></font></td>
	  <td align="center" class="en" width="8%"><font color="#ffffff"><strong>项目名称</strong></font></td>
	  <td align="center" class="en" width="8%"><font color="#ffffff"><strong>项目代码</strong></font></td>
	  <td align="center" class="en" width="10%"><font color="#ffffff"><strong>OWNER1</strong></font></td>
	  <td align="center" class="en" width="4%"><font color="#ffffff"><strong>COST1</strong></font></td>
	  <td align="center" class="en" width="10%"><font color="#ffffff"><strong>OWNER2</strong></font></td>
	  <td align="center" class="en" width="4%"><font color="#ffffff"><strong>COST2</strong></font></td>
	  <td align="center" class="en" width="5%"><font color="#ffffff"><strong>更新</strong></font></td>
	  <td align="center" class="en" width="5%"><font color="#ffffff"><strong>删除</strong></font></td>
	</tr>
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
	  	sql1="select NO,ACCOUNT from ts_member where no="+rs.getLong("OWNER1");
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
	  	sql1="select ACCOUNT from ts_member where no="+rs.getLong("OWNER2");
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
      <button class="en" onClick="update_proj(<%=rs.getString("PROJ_ID")%>,'update')">更新</button></td>
	  <td align="center" class="en"><font color="#FF6600">
      <button class="en" onClick="del_proj(<%=rs.getString("PROJ_ID")%>,'del')">删除</button></td>
	</tr>
	<%}%>

	<tr bgcolor="#D2D2D2">
    	<td></td>
        <td></td>
        <td></td>
    	<td></td>
        <td align="center" class="en">合计：<%=sum1%></td>
        <td></td>
        <td align="center" class="en">合计：<%=sum2%></td>  
        <td></td>
        <td></td>        
    </tr>
  <%}else{%>
	<tr bgcolor="#3333cc" height="24">
	  <td align="center" class="en" width="6%"><font color="#ffffff">项目组</font></td>
	  <td align="center" class="en" width="8%"><font color="#ffffff">项目名称</font></td>
	  <td align="center" class="en" width="8%"><font color="#ffffff">项目代码</font></td>
	  <td align="center" class="en" width="10%"><font color="#ffffff">OWNER1</font></td>
      <% /*
	  <td align="center" class="en" width="4%"><font color="#FF6600"><strong>COST1</strong></font></td>
	  */ %>
	  <td align="center" class="en" width="10%"><font color="#ffffff">OWNER2</font></td>
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
	  <td align="center" class="en"><%=rs.getString("PROJ_GRP")%></td>
	  <td align="center" class="en"><%=rs.getString("PROJ_NAME")%></td>
	  <td align="center" class="en"><%=rs.getString("PROJ_ID")%></td> 
	  <td align="center" class="en">
	  <%
	  	sql1="select NO,ACCOUNT from ts_member where no="+rs.getLong("OWNER1");
		rs1 = db.execSQL(sql1);

		while(rs1.next()) {
			out.println(rs1.getString("ACCOUNT"));
		}
		rs1.close();
      %>
      </td>

      <td align="center" class="en">
	  <%
	  	sql1="select ACCOUNT from ts_member where no="+rs.getLong("OWNER2");
		rs1 = db.execSQL(sql1);
		//rs1.last();
		//System.out.println(rs1.getRow());
		//rs1.beforeFirst();
		//System.out.println(sql1);
		while(rs1.next()) {
			out.println(rs1.getString("ACCOUNT"));
			//out.println(rs.getLong("OWNER2"));
		}
      %>
      </td>

	</tr>
    	<%}%>
	<tr bgcolor="#D2D2D2">
    	<td></td>
        <td></td>
        <td></td>
    	<td></td>
        <td></td>    
    </tr>	
	<%}%>

<%}%>
</table>
</form>
<%db.close();%>
<%rs.close();%>
<%rs2.close();%>
<jsp:include page="includes/copyright.jsp" /></body>
</html>
