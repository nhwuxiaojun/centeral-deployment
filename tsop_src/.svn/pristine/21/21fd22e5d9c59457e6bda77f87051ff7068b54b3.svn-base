<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<html>
<head>
<title>环境登陆权限赋予管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="includes/common.js"></script>
<script type="text/javascript" src="includes/jquery-1.11.1.js"></script>
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
	form3.visit_type.value=form1.visit_type.value;

        sStr=form1.env_id;
        for(i=0;i<sStr.length;i++)
        {
                if (sStr[i].checked)
                {
                	form3.env_id.value=sStr[i].value;
                	count++;
                }
        }
        if (count >1) {
                alert("目前批量授权仅针对单个环境，请重新选择.");
                return
        }
        if (count<1) {
                alert("请选择一个环境!");
        } else {
        var a = confirm('确认批量授于环境的访问权限？');
        if(a==true){
                        form3.action = "env_access_privi_do_finish_batch.jsp";
                       // form3.target = "_blank";
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
	if(form1.visit_type.value==""){
		alert("请选择权限访问类型！");
		form1.visit_type.focus();
		return false;
	}
	form1.env_ip.value = form2.env_ip.value;
	form1.txt_env_ip.value = form2.txt_env_ip.value;
	form1.col_name.value = form2.col_name.value;
	form1.col_value.value = form2.col_value.value;
	
	
	
	var a = confirm('授予' + form1.staff_name.value + '(' + form1.customer_ip.value + ')的访问权限？');
	if(a==true){           
			form1.action = "env_access_privi_do_finish.jsp";
			//form1.target = "_blank";
			form1.submit();
	}
	
}
</script>
<%

DBean db = new DBean();
String sql = new String();
ResultSet rs;

String sql1=new String();
ResultSet rs1;

String sql2=new String();
ResultSet rs2;
ResultSet rs3;

//Thread.sleep(5000);
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
	if(form2.txt_env_ip.value.trim()==""&&form2.col_value.value.trim()==""&&form2.proj_name.value.trim()==""){
		alert("请至少输入一项查询条件！");
		form2.txt_env_ip.select();
		return;
	}

        form2.col_value.value = form2.col_value.value.trim();
        form2.txt_env_ip.value = form2.txt_env_ip.value.trim();
	form2.submit();
}
</script>
<script type="text/javascript">
function swapThem() {
	$('tr').toggleClass('striped');
}
	window.onload = function() {
		document.getElementById('env_id').checked='true';
	    $("form").submit(function() {
		$(":submit",this).attr("disabled","disabled");
	    })
	};
</script>
</head>
<body><%@include file="includes/head.html" %>
<main>
<%

//query by procode
   String proj_code_sql="";
   String proj_name=(String)request.getParameter("proj_name");
   if (proj_name != null&& !"".equals(proj_name)) {
			proj_code_sql=" and  proj_code= " + proj_name.trim() + "  ";
	}

if("y".equals(request.getParameter("flag"))){
	if("".equals(request.getParameter("txt_env_ip"))){
		if("".equals(request.getParameter("col_value"))){
			sql="select * from a_proj_env_svr where  env_state='running'  "+proj_code_sql+"  order by proj_env,env_ip";
		}else{
			sql="select * from a_proj_env_svr where  env_state='running'  and upper("+request.getParameter("col_name").toString()+") like '%"+request.getParameter("col_value").toString().toUpperCase()+"%'   "+proj_code_sql+"  order by proj_env,env_ip";
		}
	}else{
		if("".equals(request.getParameter("col_value"))){
			sql="select * from a_proj_env_svr where  env_state='running'  and  upper(env_ip) like '%"+request.getParameter("txt_env_ip").toString().toUpperCase()+"%'   "+proj_code_sql+"  order by mac_ip,proj_env,env_ip";
		}else{
			sql="select * from a_proj_env_svr where  env_state='running'  and upper(env_ip) like '%"+request.getParameter("txt_env_ip").toString().toUpperCase()+"%' and upper("+request.getParameter("col_name").toString()+") like '%"+request.getParameter("col_value").toString().toUpperCase()+"%'   "+proj_code_sql+" order by mac_ip,proj_env,env_ip";
		}
	}
}else{
	sql="select * from a_proj_env_svr where  env_state='running'  and  rownum<6   "+proj_code_sql+"  order by mac_ip,proj_env,env_ip";
}
//out.print(sql+"<br>");
rs=db.execSQL(sql);
System.out.println(sql);
%>
<center><font color="#3333cc"><strong><br>
  <span class="s105">环境登陆权限赋予管理</span></strong></font>
</center>
<%if("".equals(request.getParameter("info"))){%>

<%}else{%>
  <br><center><font color="#FF0000" style="{font-size:9pt;}"><%=Tools.toGB(request.getParameter("info"))%></font></center>
<%}%>

<form name="form2" action="" method="post" class="en">
<table align="center" cellpadding="0" cellspacing="0" border="0" width="98%">
	<tr>
		<td align="center" class="en" width="18%">
		<select name="env_ip" class="en">
			<option value="环境IP">环境IP</option>
		</select>
		</td>
		<td align="center" class="en" width="18%">
		<%if("".equals(request.getParameter("txt_env_ip"))||request.getParameter("txt_env_ip")==null){%>
			<input type="text" placeholder="IP Address" name="txt_env_ip" value="" class="text2">
		<%}else{%>
			<input type="text" name="txt_env_ip" value="<%=request.getParameter("txt_env_ip")%>" class="text2">
		<%}%>
		</td>
		<td align="center" class="en" width="20%">
		<select name="col_name" class="en">
			<%if("".equals(request.getParameter("col_name"))||request.getParameter("col_name")==null){%>
				<option value="proj_env">项目环境名</option>
				<option value="mac_ip">物理IP</option>
				<option value="proj_grp">项目环境属组</option>
				<option value="env_state">环境运行状态</option>
			<%}else{%>
				<%if("mac_ip".equals(request.getParameter("col_name"))){%>
				<option value="proj_env">项目环境名</option>
				<option value="mac_ip">物理IP</option>
				<option value="proj_grp">项目环境属组</option>
				<option value="env_state">环境运行状态</option>
				<%}%>
				<%if("proj_env".equals(request.getParameter("col_name"))){%>
				<option value="proj_env">项目环境名</option>
				<option value="mac_ip">物理IP</option>
				<option value="proj_grp">项目环境属组</option>
				<option value="env_state">环境运行状态</option>
				<%}%>
				<%if("proj_grp".equals(request.getParameter("col_name"))){%>
				<option value="proj_grp">项目环境属组</option>
				<option value="mac_ip">物理IP</option>
				<option value="proj_env">项目环境名</option>
				<option value="env_state">环境运行状态</option>
				<%}%>
				<%if("env_state".equals(request.getParameter("col_name"))){%>
				<option value="env_state">环境运行状态</option>
				<option value="mac_ip">物理IP</option>
				<option value="proj_env">项目环境名</option>
				<option value="proj_grp">项目环境属组</option>
				<%}%>
			<%}%>
		</select>
		</td>
		<td align="center" class="en" width="20%">
		<%if("".equals(request.getParameter("col_value"))||request.getParameter("col_value")==null){%>
			<input type="text" name="col_value" value="" class="text2">
		<%}else{%>
			<input type="text" name="col_value" value="<%=request.getParameter("col_value")%>" class="text2">
		<%}%>
		</td>

     <td  align="center" class="en">&nbsp;</td>
	 <%
	 sql2="select distinct proj_grp from a_env_name";
	 rs2=db.execSQL(sql2);
	 %>
     <td class="en" align="center">
    <SELECT name="proj_grp" onChange="change(document.form2.proj_grp.options[document.form2.proj_grp.selectedIndex].value)" > 
  	 <option value="">项目属组</option>
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
	
	<td align="center" class="en" width="20%"><input type="button" name="button1" value="Query" onClick="check()"></td>
  </tr>
	
</table>
<br>
<input type="hidden" name="flag" value="y">
</form>
<form name="form1" action="" method="post" class="en">
<table width="98%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
	<tr height=25 bgcolor="#D2D2D2">
	  <td align="center" class="en" width="10%"><font color="#3333cc"><strong>MAC IP</strong></font></td>
	  <td align="center" class="en" width="10%"><font color="#3333cc"><strong>Environment IP</strong></font></td>
	  <td align="center" class="en" width="25%"><font color="#3333cc"><strong>Environment Details</strong></font></td>
	  <td align="center" class="en" width="25%"><font color="#3333cc"><strong>Grant DB Privileges</strong></font></td>
	  <td align="center" class="en" width="10%"><font color="#3333cc"><strong>Status</strong></font></td>
	  <td align="center" class="en" width="12%"><font color="#3333cc"><strong>Select<input type="checkbox" id="env_id" name="env_id" value=""></strong></font></td>
	</tr>
	<%while(rs.next()){%>
	<tr bgcolor="#FCFCFC">
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("MAC_IP")%>&nbsp;</font></td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<span id="env_<%=rs.getString("ENV_ID")%>"><%=rs.getString("ENV_IP")%></span>&nbsp;</font></td>
	  <td align="center" class="en">&nbsp;<a href="#"  onClick="open_win('new.env_info_detail.jsp?id=<%=rs.getInt("ENV_ID")%>',800,650);"><font color="#3333cc"><u><span id="proj_<%=rs.getString("ENV_ID")%>"><%=rs.getString("PROJ_ENV")%></span></u></font></a>&nbsp;</td>
	  <td align="center" class="en">&nbsp;<a href="db_access_privi_do.jsp?link=y&txt_db_user_type=owner&proj_env=<%=rs.getString("PROJ_ENV")%>">Grant</a>&nbsp;</td>
	  <td align="center" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("ENV_STATE")%>&nbsp;</font></td>
	 <!-- <td align="center" bgcolor="#FCFCFC" class="en"><input type="radio" name="env_id" value="<%//=rs.getString("ENV_ID")%>"></td>-->
	  <td align="center" bgcolor="#FCFCFC" class="en"><input type="checkbox" name="env_id" checked="true" value="<%=rs.getString("ENV_ID")%>"></td>
    	</tr>
	<%} // end of while%>
</table>
<center>
<br>
&nbsp;
Domain Account:
<%if(request.getParameter("staff_name")==null||"".equals(request.getParameter("staff_name"))){%>
	<input type="text" name="staff_name" id="staff_name" value="" class="text2" placeholder="jiangtao.chen">&nbsp;&nbsp;
<%}else{%>
	<input type="text" name="staff_name" id="staff_name" value="<%=request.getParameter("staff_name")%>" class="text2">&nbsp;&nbsp;
<%}%>

Client Machine IP:
<%if(request.getParameter("customer_ip")==null||"".equals(request.getParameter("customer_ip"))){%>
	<input type="text" name="customer_ip" value="" class="text2" pattern="((^|\.)((25[0-5])|(2[0-4]\d)|(1\d\d)|([1-9]?\d))){4}$" placeholder="x.x.x.x">&nbsp;&nbsp;
<%}else{%>
	<input type="text" name="customer_ip" value="<%=request.getParameter("customer_ip")%>" class="text2" pattern="((^|\.)((25[0-5])|(2[0-4]\d)|(1\d\d)|([1-9]?\d))){4}$" placeholder="x.x.x.x">&nbsp;&nbsp;
<%}%>
<%
String sql_temp = new String();
ResultSet rs_temp;
sql_temp = "select distinct login_way from a_property where login_way is not null";
rs_temp = db.execSQL(sql_temp);
%>
Access Type:
<select name="visit_type">
	<%while(rs_temp.next()){%>
		<option value="<%=rs_temp.getString("login_way")%>"><%=rs_temp.getString("login_way")%></option>
	<%}%>
</select>
&nbsp;&nbsp;<input type="button" name="button1" value="Submit" onClick="check2()">&nbsp;&nbsp;
<input type="reset" name="reset1" value="Reset">
<input type="hidden" name="env_ip" value="">
<input type="hidden" name="txt_env_ip" value="">
<input type="hidden" name="col_name" value="">
<input type="hidden" name="col_value" value="">
</form>
<form name="form3" action="db_access_privi_do_finish_batch.jsp" method="post" class="en">
<hr width=80%>
<br>
APP Batch Grant(Domain Account:IP)
<br><br>
<textarea id="userip" name="useriplist" rows=5 cols=40 wrap=soft></textarea>
<input type="hidden" name="env_id" value="">
<input type="hidden" name="dbuser" value="">
<input type="hidden" name="sid" value="">
<input type="hidden" name="visit_type" value="ALL">
<input type="hidden" name="staff_name" value="fk.chen">
<input type="hidden" name="customer_ip" value="172.16.7.244">
<br><br>
<input type="button" name="button2" value="Submit" onClick="check3()">&nbsp;&nbsp;
<input type="reset" name="reset2" value="Reset">
</form>
</center>
<%db.close();%>
<%rs.close();%>

</main>
<jsp:include page="includes/footer.html" />
</body> 
</html>
