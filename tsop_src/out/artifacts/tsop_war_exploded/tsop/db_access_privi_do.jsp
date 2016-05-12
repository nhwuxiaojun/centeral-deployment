<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<html>
<head>
<title>数据库登陆权限赋予管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="includes/common.js"></script>
<script type="text/javascript" src="scripts/jquery-1.11.1.js"></script>
<script type="text/javascript">
$(document).ready(function() {
$(":text").focus ( function() {
                $(this).css("background","yellow");
        }).blur(function() {
                $(this).css("background","#fff");
        });
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

String sql1=new String();
ResultSet rs1;

String sql2=new String();
ResultSet rs2;
ResultSet rs3;

sql1="select * from a_env_name order by proj_grp,proj_name";
rs1=db.execSQL(sql1);
%>
<script language="JavaScript">

var subcat = [];
   subcat.length=0;
   <%
        int count = 0;
        while(rs1.next()){
    %>
        subcat[<%=count%>] = ["<%=rs1.getString("proj_grp").trim()%>","<%=rs1.getString("proj_name").trim()%>","<%=rs1.getString("proj_code").trim()%>"];
    <%
        count++;
        }
       rs1.close();
    %>
function checkAll(field)
{
for (i = 0; i < field.length; i++)
	field[i].checked = true ;
}
 

function uncheckAll(field)
{
for (i = 0; i < field.length; i++)
	field[i].checked = false ;
}

function change(team_id)
    {
    document.form2.proj_name.length = 0;
        document.form2.proj_name.options[0] = new Option('请选择','');
    var team_id=team_id;
    for (i=0;i < subcat.length ; i++)
        {
            if (subcat[i][0] == team_id)
            {
                document.form2.proj_name.options[document.form2.proj_name.length] = new Option(subcat[i][1], subcat[i][2]);
            }
        }
       // document.form2.proj_name.options[0].selected = true;
    }
String.prototype.trim=function(){      
    return this.replace(/(^\s*)|(\s*$)/g, '');   
};

function check(){
	if(form2.col_value1.value.trim()==""&&form2.col_value.value.trim()==""&&form2.proj_name.value.trim()==""){
		alert("请至少输入一项查询条件！");
		form2.col_value.select();
		return;
	}
	/*
	alert(form2.col_name1.value);
	alert(form2.col_value1.value);
	alert(form2.col_name.value);	
	alert(form2.col_value.value);
	*/
	form2.col_name.value = form2.col_name.value.trim();
	form2.col_name1.value = form2.col_name1.value.trim();
	form2.col_value.value = form2.col_value.value.trim();
	form2.col_value1.value = form2.col_value1.value.trim();

	form2.submit();
}

</script>
<script language="JavaScript" for="document" event="onkeypress">
	if(event.keyCode==13){
//		check();
	}
</script>
<body><%@include file="includes/head.html" %>
<script language="JavaScript" for="window" event="onload">
	                form2.col_value.select();
</script>
<%

String sql = new String();
ResultSet rs;

   String proj_code_sql="";
   String proj_name=(String)request.getParameter("proj_name");
   if (proj_name != null&& !"".equals(proj_name)) {
                        proj_code_sql=" and  a.proj_code= " + proj_name.trim() + "  ";
        }


String common_sql=new String();
common_sql="select b.proj_env,b.env_ip,a.db_ip,a.db_sid,a.db_user_type,a.db_user,a.db_id,a.db_ldap_name,b.env_id from a_db_svr a, a_proj_env_svr b where ";
if("y".equals(request.getParameter("link"))){
      sql=common_sql+"rownum<6  and upper(db_status) = 'RUNNING' and upper(db_user)<>'DBADMIN' and a.proj_env = '" + request.getParameter("proj_env") + "' and db_user_type='"+request.getParameter("txt_db_user_type")+"' and a.proj_env=b.proj_env(+) order by db_sid,db_user";
}else{
if("y".equals(request.getParameter("flag"))){
	if("".equals(request.getParameter("col_value1"))){
		System.out.println("----------if1------------");
		if("".equals(request.getParameter("col_value"))){
	sql=common_sql+"upper(db_status) = 'RUNNING' and upper(db_user)<>'DBADMIN' and db_user_type='"+request.getParameter("txt_db_user_type")+"' "+proj_code_sql+" and a.proj_env=b.proj_env(+) order by db_user,db_sid";
		}else{
		System.out.println("----------else1------------");
	sql=common_sql+"upper("+request.getParameter("col_name").toString()+") like '%"+request.getParameter("col_value").toString().toUpperCase()+"%'  and upper(db_status) = 'RUNNING' and upper(db_user)<>'DBADMIN' and db_user_type='"+request.getParameter("txt_db_user_type")+"' and a.proj_env=b.proj_env(+)  order by db_sid,db_user";
		}
	}else{
		if("".equals(request.getParameter("col_value"))){
		System.out.println("----------if2------------");
	sql=common_sql+"upper(b."+request.getParameter("col_name1").toString()+") like '%"+request.getParameter("col_value1").toString().toUpperCase()+"%'  and upper(db_status) = 'RUNNING' and upper(db_user)<>'DBADMIN' and db_user_type='"+request.getParameter("txt_db_user_type")+"' and a.proj_env=b.proj_env(+) order by db_sid,db_user";
		System.out.println(sql+"\n");
		}else{
		System.out.println("----------else2------------");
	sql=common_sql+"upper("+request.getParameter("col_name1").toString()+") like '%"+request.getParameter("col_value1").toString().toUpperCase()+"%' and upper("+request.getParameter("col_name").toString()+") like '%"+request.getParameter("col_value").toString().toUpperCase()+"%'  and upper(db_status) = 'RUNNING' and upper(db_user)<>'DBADMIN' and db_user_type='"+request.getParameter("txt_db_user_type")+"' and a.proj_env=b.proj_env(+) order by db_sid,db_user";
		}
	}
}else{
	sql=common_sql+"rownum<7   and upper(db_status) = 'RUNNING' and upper(db_user)<>'DBADMIN' and db_user_type='owner' and a.proj_env=b.proj_env(+) order by db_sid,db_user";
}
}
//out.print(sql+"<br>");
System.out.println(sql+"\n");
rs = db.execSQL(sql);
%>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">数据库登陆权限赋予管理</span></strong></font>
<%if("".equals(request.getParameter("info"))){%>

<%}else{%>
  <br><font color="#FF0000" style="{font-size:9pt;}"><%=Tools.toGB(request.getParameter("info"))%></font>
<%}%>
<br>
<form name="form2" action="" method="post" class="en">
<table align="center" cellpadding="0" cellspacing="0" border="0" width="90%">
	<tr>
		<td align="center" class="en" width="15%">
		<select name="col_name1" class="en">
			<option value="env_ip" <%if("env_ip".equals(request.getParameter("col_name1"))) { out.print("selected=selected"); } %> >环境IP</option>
			<option value="proj_env" <%if("proj_env".equals(request.getParameter("col_name1"))) { out.print("selected=selected"); } %> >项目环境名</option>
		</select>
		</td>
		<td align="center" class="en" width="15%">
		<%if("".equals(request.getParameter("col_value1"))||request.getParameter("col_value1")==null){%>
			<input type="text" size="15" name="col_value1" value="" class="en">
		<%}else{%>
			<input type="text" size="15" name="col_value1" value="<%=request.getParameter("col_value1")%>" class="en">
		<%}%>
		</td>
		<td align="center" class="en" width="15%">
		<select name="col_name" class="en">
			<%if("".equals(request.getParameter("col_name"))||request.getParameter("col_name")==null){%>
				<option value="db_user" size="15">数据库用户</option>
				<option value="db_sid" size="15">数据库实例名</option>
			<%}else{%>
				<%if("db_sid".equals(request.getParameter("col_name"))){%>
				<option value="db_sid" size="15">数据库实例名</option>
				<option value="db_user" size="15">数据库用户</option>
				<%}%>
				<%if("db_user".equals(request.getParameter("col_name"))){%>
				<option value="db_user" size="15">数据库用户</option>
				<option value="db_sid" size="15">数据库实例名</option>
				<%}%>
			<%}%>
		</select>
		</td>
                <td align="center" class="en" width="15%">
                <%if("".equals(request.getParameter("col_value"))||request.getParameter("col_value")==null){%>
                        <input type="text" size="18" name="col_value" value="" class="en">
                <%}else{%>
                        <input type="text" size="18" name="col_value" value="<%=request.getParameter("col_value")%>" class="en">
                <%}%>
                </td>
		<td>&nbsp;</td>
        <td align="center" class="en">
                <select name="txt_db_user_type" class="en">
                        <option value="owner">owner</option>
                </select>
        </td>

     <td  align="center" class="en">&nbsp;</td>
         <%
         sql2="select distinct proj_grp from a_env_name";
         rs2=db.execSQL(sql2);
         %>
     <td class="en" align="center">
    <SELECT name="proj_grp" onChange="change(document.form2.proj_grp.options[document.form2.proj_grp.selectedIndex].value)" >
         <option size=10 value="">项目属组</option>
          <%if(null!=request.getParameter("proj_grp")){%>
           <option value="<%=request.getParameter("proj_grp")%>" selected="selected"><%=request.getParameter("proj_grp")%></option>
       <%}

           while(rs2.next()){%>
        <option value="<%=rs2.getString("proj_grp")%>"><%=rs2.getString("proj_grp")%></option>
        <%}%>
        </select>
        </td>
         <td  align="center" class="en">&nbsp;</td>
         <td align="center" class="en">
                <select name="proj_name" class="select7">
                <option value="">项目名</option>
                 <%
             rs3 = db.execSQL(sql1);
         while(rs3.next()){
                   if(rs3.getString("proj_code").equals(request.getParameter("proj_name"))){%>
                        <option value="<%=rs3.getString("proj_code")%>"   selected="selected" ><%=rs3.getString("proj_name")%></option>
                        <%}%>
                <%}%>
                </SELECT>
        </td>

		<td align="center" class="en" width="20%"><input type="button" name="button1" value="Query" class="en" onClick="check()"></td>
	</tr>
</table>
<input type="hidden" name="flag" value="y">
</form>
<br>
<form name="form1" action="" method="post" class="en">
<table id="maintable" style="table-layout: fixed" width="98%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
<thead>
	<tr height=28 bgcolor="#0000ee">
	  <td align="center" class="en" width="5%"><font color="#ffffff"><strong>TNSNAME</strong></font></td>
	  <td align="center" class="en" width="8%"><font color="#ffffff"><strong>DB IP</strong></font></td>
	  <td align="center" class="en" width="5%"><font color="#ffffff"><strong>DB SID</strong></font></td>
	  <td align="center" class="en" width="22%"><font color="#ffffff"><strong>Environment Name&Details</strong></font></td>
	  <td align="center" class="en" width="15%"><font color="#ffffff"><strong>Grant App Privileges</strong></font></td>
	  <td align="center" class="en" width="10%"><font color="#ffffff"><strong>Environment IP</strong></font></td>
	  <td align="center" class="en" width="8%"><font color="#ffffff"><strong>Type</strong></font></td>
	  <td align="center" class="en" width="20%"><font color="#ffffff"><strong>DB Username</strong></font></td>
	  <td align="center" class="en" width="10%"><font color="#ffffff"><strong>Select<input type="checkbox" name="selectStr" value="" onclick="if (this.checked) $('input[type=checkbox]').attr('checked',true); else $('input[type=checkbox]').attr('checked',false);"></strong></font></td>
	</tr>
</thead>
<tbody>
        <%
int sum=0;
while(rs.next()){

                                sum++;
                if ((sum%2)==1) {
                        out.println("<tr bgcolor=#eeeeee height=22>");
                } else {
                        out.println("<tr bgcolor=#ffffff height=22>");
                }
%>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("DB_LDAP_NAME")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("DB_IP")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<span id="db_<%=rs.getInt("DB_ID")%>"><%=rs.getString("DB_SID")%></span>&nbsp;</font></td>
	  <td style="word-wrap: break-word" align="center" class="en"><font color="#3333cc">&nbsp;<a href="#" onClick="open_win('new.env_info_detail.jsp?id=<%=rs.getInt("ENV_ID")%>',800,650);"><%=rs.getString("PROJ_ENV")%></a>&nbsp;</font></td>
	  <td style="word-wrap: break-word" align="center" class="en"><font color="#3333cc">&nbsp;<a href="env_access_privi_do.jsp?txt_env_ip=&flag=y&env_ip=IP&col_name=proj_env&col_value=<%=rs.getString("PROJ_ENV")%>">Grant</a>&nbsp;</font></td>
	  <td style="word-wrap: break-word" align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("ENV_IP")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("DB_USER_TYPE")%>&nbsp;</font></td>
	  <td style="word-wrap: break-word" align="center" class="en"><font color="#3333cc">&nbsp;<span id="user_<%=rs.getInt("DB_ID")%>"><%=rs.getString("DB_USER")%></span>&nbsp;</font></td>
	  <td width="6%" align="center" bgcolor="#FCFCFC" class="en"><input type="checkbox" name="selectStr" value="<%=rs.getString("DB_USER")%>/<%=rs.getString("DB_SID")%>"></td>
	</tr>
	<%}%>
</tbody>
</table>
<br>
<section>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Domain Account:
<%if(request.getParameter("staff_name")==null||"".equals(request.getParameter("staff_name"))){%>
	<input type="text" name="staff_name" id="staff_name" value="" class="text2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<%}else{%>
	<input type="text" name="staff_name" id="staff_name" value="<%=request.getParameter("staff_name")%>" class="text2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<%}%>
Client Machine IP:
<%if(request.getParameter("customer_ip")==null||"".equals(request.getParameter("customer_ip"))){%>
	<input type="text" name="customer_ip" value="" class="text2">&nbsp;&nbsp;
<%}else{%>
	<input type="text" name="customer_ip" value="<%=request.getParameter("customer_ip")%>" class="text2">&nbsp;&nbsp;
<%}%>
<input type="button" name="button1" value="Submit" onClick="check2()">&nbsp;&nbsp;
<input type="reset" name="reset1" value="Reset">
<input type="hidden" name="col_name" value="">
<input type="hidden" name="col_name1" value="">
<input type="hidden" name="col_value" value="">
<input type="hidden" name="col_value1" value="">
</form>

	<font color="red"	> * OWNER用户和APP用户会同时赋权</font>
<br>
<hr width="80%">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
DB Privileges Batch Grant(Domain Account:IP)
<br><br>
<form name="form3" action="db_access_privi_do_finish_batch.jsp" method="post" class="en">
<textarea id="userip" name="useriplist" rows=5 cols=40 wrap=soft></textarea>
<input type="hidden" name="dblist" value="">
<input type="hidden" name="dbuser" value="">
<input type="hidden" name="sid" value="">
<input type="hidden" name="user" value="default.chen">
<input type="hidden" name="ip" value="172.16.7.244">
<br><br>
<input type="button" name="button2" value="Submit" onClick="check3()">&nbsp;&nbsp;
<input type="reset" name="reset2" value="Reset">
</form>
</div>
</section>
<%db.close();%>
<%rs.close();%>
</center>
</body>
<script language="javascript">
function check3(){
	var tmpS=form3.userip.value.split("\n");
	if ( tmpS[0]=="" ) {
		alert("请输入帐号和IP！");
		form3.userip.focus();
		return;
	}
	for(i=0;i<tmpS.length;i++) {
		if (tmpS[i].indexOf(":")==-1&&tmpS[i]!="") {
			alert("帐号和IP输入非法！");
			form3.userip.focus();
			return;
		}
	}
	var count=0;	
	sStr=form1.selectStr;
	for(i=0;i<sStr.length;++i)
	{	
		if (sStr[i].checked) 	
		{
			form3.dbuser.value=sStr[i].value.split("/")[0];
			form3.sid.value=sStr[i].value.split("/")[1];
		count++;	
		}
	}
	if (count >1) {
		alert("目前批量授权仅针对单个数据库，请重新选择.");
		return
	}
	if (count!=1) {
		alert("请选择一个数据库!");
	} else {
        var a = confirm('确认批量授于数据库访问权限？');
        if(a==true){
                        form3.action = "db_access_privi_do_finish_batch.jsp";
                        //form3.target = "_blank";
                        form3.submit();
                        }
	}
}

function check2(){
	
   var len = document.form1.elements.length;
   if (len==0){
    alert ("对不起，无记录可选！");
    return;
   }else{
    var j=0;
    var y=0;
    for( j=0; j<len; j++){
      if (document.form1.elements[j].type=='checkbox'){
        if (document.form1.elements[j].checked){
          y=y+1;
        }
      }
    }
    if(y==0){
      alert ("必须至少选一个对象！");
      return;
    }
   }
	
	
	if(form1.staff_name.value==""){
		alert("请输入员工姓名！");
		form1.staff_name.focus();
		return false;
	}
	if(form1.staff_name.value.indexOf("1")=="-1"){

	}else{
		alert("员工姓名错误！");
		form1.staff_name.focus();
		return false;
	}
	if(form1.customer_ip.value==""){
		alert("请输入客户IP！");
		form1.customer_ip.focus();
		return false;
	}
	if(form1.customer_ip.value.indexOf("172.16.0.")=="-1"){
		
	}else{
	 	alert("请申请固定IP！");
		form1.customer_ip.focus();
		return;
	}
	if(form1.customer_ip.value.indexOf("172.16.1.")=="-1"){
		
	}else{
	 	alert("请申请固定IP！");
		form1.customer_ip.focus();
		return;
	}
	if(form1.customer_ip.value.indexOf("172.16.2.")=="-1"){
		
	}else{
	 	alert("请申请固定IP！");
		form1.customer_ip.focus();
		return;
	}
	
	form1.col_name.value = form2.col_name.value;
	form1.col_name1.value = form2.col_name1.value;
	form1.col_value.value = form2.col_value.value;
	form1.col_value1.value = form2.col_value1.value;
	
		
	var a = confirm('授予' + form1.staff_name.value + '(' + form1.customer_ip.value + ')的数据库访问权限？');
	if(a==true){
			form1.action = "db_access_privi_do_finish.jsp";
			//form1.target = "_blank";
			form1.submit();
			}
	
	
}
</script>
</html>
