<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<html>
<head>
<title>数据库信息详细</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
</head>
<%
	DBean db = new DBean();

	String sql_temp = new String();
	String sql = new String();
	String	sql_prj=new String();

	ResultSet rs;
	ResultSet rs_temp;
	ResultSet rs_prj;
    String sql_user = new String();
	ResultSet rs_user;

	sql_prj="select * from a_env_name";
	rs_prj=db.execSQL(sql_prj);
 
	sql_temp = "select * from ts_db";
	rs_temp = db.execSQL(sql_temp);
%>
<script language="javascript">

    var onecount;
	onecount = 0;
	subcat = [];
<%
	int count = 0;
	while(rs_temp.next()){
	%>
	subcat[<%=count%>] = ["<%=rs_temp.getString("db_ip")%>","<%=rs_temp.getString("db_sid")%>","<%=rs_temp.getString("ldap_name").trim()%>"];
	<%
	count++;
	}
	rs_temp.close();
	%>
	temp = <%=count%>;

  function change(team_id){
    document.form1.db_sid.length = 0;
    var team_id = team_id;
    var i;
    var current;
    for (i=0;i<temp;i++){
		if (subcat[i][0] == team_id){
			document.form1.db_sid.options[document.form1.db_sid.length] = new Option(subcat[i][1], subcat[i][1],false,false);
                        document.form1.db_ldap_name.value = "";
                        document.form1.db_ldap_name.value = subcat[i][2];
			current=i;
            //window.alert(document.form1.db_sid.length);
         	//window.alert(subcat[i][1]);
		}
    }
    document.form1.db_sid.options[0].selected = true;
    document.form1.db_sid.value = subcat[current][1];
    document.form1.db_ldap_name.value=subcat[current][2];
	//window.alert(document.form1.db_sid.options[document.form1.db_sid.selectedIndex].value);
	// getDbUser() ;
	 
    }

  function getDbUser() 
     { 
	   var new_env = form1.proj_name.value;
	   var ver=form1.ver.value.replace(/\ /g,"");
	   var type_1=form1.type_1.value.replace(/\ /g,"");
	   var type_2=form1.type_2.value.replace(/\ /g,"");
	   var type_3=form1.type_3.value.replace(/\ /g,"");
	   
	  
	   if(ver!=''){
        new_env = new_env + "_" + ver;
       }
	   if(type_1!=''){
        new_env = new_env + "_" + type_1;
       }
	   if(type_2!=''){
        new_env = new_env + "_" + type_2;
       }
	   if(type_3!=''){
         new_env = new_env + "_" + type_3;
       }
	
	   form1.DB_USER.value=new_env;
	   form1.DB_USER_PASSWD.value=new_env;
	    if(new_env.length>20){
		 alert("项目名称长度不能超过20个字符！");
	    }
	  }


		var onecount_prj; 
		onecount_prj=0; 
		subcat_prj = [];
        <% 
        int count_prj = 0; 
        while(rs_prj.next()){ 
        %> 
			subcat_prj[<%=count_prj%>] = ["<%=rs_prj.getString("proj_grp").trim()%>","<%=rs_prj.getString("proj_name").trim()%>"];
        <% 
        count_prj++; 
        } 
        rs_prj.close(); 
        %> 
		temp_prj=<%=count_prj%>; 


	function change_prj(team_id) 
    { 
   	 document.form1.proj_name.length = 0; 
   	 var team_id=team_id; 
   	 var i; 
   	 for (i=0;i < temp_prj ; i++) 
        {         	
            if (subcat_prj[i][0] == team_id) 
            {  
                document.form1.proj_name.options[document.form1.proj_name.length] = new Option(subcat_prj[i][1], subcat_prj[i][1]); 
            }        
        } 
        document.form1.proj_name.options[0].selected = true;
   	 }  


   function check(){
   
   if(form1.proj_grp.value==""){
		alert("请选择项目环境组属");
		form1.proj_grp.focus();
		return;
	}
	if(form1.proj_name.value==""){
		alert("请选择项目名");
		form1.proj_name.focus();
		return;
	}


       var new_env = form1.proj_name.value;
	   var ver=form1.ver.value.replace(/\ /g,"");
	   var type_1=form1.type_1.value.replace(/\ /g,"");
	   var type_2=form1.type_2.value.replace(/\ /g,"");
	   var type_3=form1.type_3.value.replace(/\ /g,"");
	   
	   if(ver!=''){
        new_env = new_env + "_" + ver;
       }
	   if(type_1!=''){
        new_env = new_env + "_" + type_1;
       }
	   if(type_2!=''){
        new_env = new_env + "_" + type_2;
       }
	   if(type_3!=''){
         new_env = new_env + "_" + type_3;
       }
	if(new_env.length>20){
		alert("项目名称长度不能超过20个字符！");
		return;
	}
   
	if(form1.db_ip.value==""){
		alert("请输入数据库IP");
		return;
	}
	if(form1.db_sid.value==""){
		alert("请输入数据库实例名");
		return;
	}
	if(form1.DB_USER.value==""){
		alert("请输入数据库用户");
		return;
	}
	if(form1.DB_USER_PASSWD.value==""){
		alert("请输入数据库用户密码");
		return;
	}
	if(form1.DB_USER_TYPE.value==""){
		alert("请输入数据库用户类型");
		return;
	}

	if(form1.is_backup.checked) {
	  form1.is_backup.value="1";
	 }else{
	  form1.is_backup.value="0";
	 }
	 

	if(form1.PROPOSER.value==""){
		alert("请输入数据库环境申请人");
		return;
	}
 //alert("---ok--");
	form1.submit();
}
function return_back(){
	window.location = "db_server_query.jsp";
}
</script>
<script src="calendar2.js" language="javascript" type="text/javascript"></script>
<body><%@include file="includes/head.html" %>
<form name="form1" action="db_server_reg_finish.jsp" method="post">
<%if("".equals(request.getParameter("info"))){%>

<%}else{%>
  <div align="center"><font color="#FF0000" style="{font-size:9pt;}"><%=Tools.toGB(request.getParameter("info"))%></font></div>
<%}%>

<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">手动添加数据库信息</span></strong></font>
</div>
<br><br>
<table width="80%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">

 <tr> 
    <td width="32%" bgcolor="#D2D2D2" class="STYLE1 en"><font color="#3333cc"><strong>项目环境组属*</strong></font> </td>
	<%
	sql="select distinct proj_grp from a_env_name";
	rs=db.execSQL(sql);
	%>
    <td class="en" width="68%">
    	
    <SELECT name="proj_grp" onChange="change_prj(document.form1.proj_grp.options[document.form1.proj_grp.selectedIndex].value)" > 
  	<option value="">请选择</option>
	<%while(rs.next()){%>
	<option value="<%=rs.getString("proj_grp").trim()%>"><%=rs.getString("proj_grp").trim()%></option>
	<%}%>
	</select>

	</td>
  </tr>
  <tr> 
    <td  bgcolor="#D2D2D2" class="STYLE1 en"><font color="#3333cc"><strong>环境名称*</strong></font></td>
    <td class="en">
	<table width="95%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center" valign="bottom"><font color="#3333cc"><strong>项目名*</strong></font> </td>
        <td align="center" valign="bottom">版本</td>
        <td align="center" valign="bottom">类型1</td>
        <td align="center" valign="bottom">类型2</td>
        <td align="center" valign="bottom">类型3</td>
      </tr>
      <tr>
        <td align="center">
		
		<select name="proj_name" class="select7" onChange="getDbUser()">
		<option value="">请选择</option>
		</SELECT> 

		</td>
		<td align="center"><input type="text" name="ver" value="" class="text1"  onChange="getDbUser()"  size="6"></td>
        <td>
    	<%
		sql="select distinct a_type_1 from a_type";
		rs=db.execSQL(sql);
		%>
		<select name="type_1" class="select3" id="select3" onChange="getDbUser()" >
		<option value="">请选择</option>
		<%while(rs.next()){%>
	  		<%if(rs.getString("a_type_1")!=null){%>
	    		<option value="<%=rs.getString("a_type_1")%>"><%=rs.getString("a_type_1")%></option>
	  		<%}%>
		<%}%>
		</select>
		</td>

        <td align="center">
    	<%
		sql="select distinct a_type_2 from a_type";
		rs=db.execSQL(sql);
		%>
		<select name="type_2" class="select4" onChange="getDbUser()" >
		<option value="">请选择</option>
		<%while(rs.next()){%>
	  		<%if(rs.getString("a_type_2")!=null){%>
	    		<option value="<%=rs.getString("a_type_2")%>"><%=rs.getString("a_type_2")%></option>
	  		<%}%>
		<%}%>
		</select>
		</td>
        <td align="center">
		<%
		sql="select distinct a_type_3 from a_type";
		rs=db.execSQL(sql);
		%>
		<select name="type_3" class="select2" onChange="getDbUser()" >
		<option value="">请选择</option>
		<%while(rs.next()){%>
			<%if(rs.getString("a_type_3")==null||"".equals(rs.getString("a_type_3"))){%>
			
			<%}else{%>
				<option value="<%=rs.getString("a_type_3")%>"><%=rs.getString("a_type_3")%></option>
			<%}%>
		<%}%>
		</select>
		</td>
      </tr>
    </table>
	</td>
  </tr>


	
  <tr> 
    <td width="32%" bgcolor="#D2D2D2" class="STYLE1 en"><font color="#3333cc"><strong>数据库服务器*</strong></font> </td>
    <td width="68%" class="en">
	<%
	sql="select distinct db_ip from ts_db";
	rs=db.execSQL(sql);
	%>
	<select name="db_ip" onChange="change(document.form1.db_ip.options[document.form1.db_ip.selectedIndex].value)" > 
	  <option value="">请选择</option>
	  <%while(rs.next()){%>
	    <option value="<%=rs.getString("db_ip")%>"><%=rs.getString("db_ip")%></option>
      <%}%>
	</select>	
	</td>
  </tr>
	
  <tr> 
    <td width="32%" bgcolor="#D2D2D2" class="STYLE1 en"><font color="#3333cc"><strong>数据库SID*</strong></font>  </td>
    <td width="68%" class="en">
	<select name="db_sid">
	  <option value="">请选择</option>
	</select>
	</td>
  </tr>
  <tr> 
    <td width="32%" bgcolor="#D2D2D2" class="STYLE1 en"><font color="#3333cc"><strong>TNSNAME*</strong></font>  </td>
    <td width="68%" class="en"><input name="db_ldap_name" size=30> </td>
  </tr>
  <tr> 
    <td width="32%" bgcolor="#D2D2D2" class="STYLE1 en"><font color="#3333cc"><strong>数据库用户名称*</strong></font> </td>
    <td width="68%" class="en">
	<input type="text" name="DB_USER" size=30 value="" class="text2">
	</td>
  </tr>	
  <tr> 
    <td width="32%" bgcolor="#D2D2D2" class="STYLE1 en"><font color="#3333cc"><strong>数据库用户密码*</strong></font> </td>
    <td width="68%" class="en">
	<input type="text" name="DB_USER_PASSWD"  size=30 value="" class="text2">
	</td>
  </tr>		

	  <%
	  sql_temp = "select distinct db_type from a_property where db_type is not null";
	  rs_temp = db.execSQL(sql_temp);
	  %>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>数据库用户类型*</strong></font></td>
	  <td class="en">
	  <select name="DB_USER_TYPE">
		<%while(rs_temp.next()){%>
			<option value="<%=rs_temp.getString("DB_TYPE")%>"><%=rs_temp.getString("DB_TYPE")%></option>
		<%}%>
	  </select>&nbsp;
	  </td>
	</tr>
	<tr>
	  <td align="left" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>环境申请人*</strong></font></td>
	  <td  class="en"><font color="#3333cc">&nbsp;<input name="PROPOSER"  size=30  class="text">&nbsp;</font></td>
	</tr>
    <tr> 
     <td bgcolor="#D2D2D2" class="STYLE1 en"><strong><font color="#3333cc"><strong>是否备份</td>
     <td  class="en"><input type="checkbox" name="is_backup"  ></td>
    </tr>

  
</table>


<br>
<div align="center">
        <input type="button" name="button1" value="确认" onClick="check()" class="but">
&nbsp;&nbsp;<input type="reset" name="reset1" value="重置" class="but">&nbsp;&nbsp;<input type="button" name="button2" value="返回" class="but" onClick="return_back()"></div>
</form>
<jsp:include page="includes/copyright.jsp" /></body>
<%db.close();%>
<%rs.close();%>
<%rs_temp.close();%>
</html>
