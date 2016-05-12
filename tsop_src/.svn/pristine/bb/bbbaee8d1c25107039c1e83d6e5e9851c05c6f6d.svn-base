<%@ include file="../interface/check.jsp"%>
<%@ page language="java" import="java.sql.ResultSet,java.sql.ResultSetMetaData" contentType="text/html; charset=gbk" errorPage=""%>
<%@ page import="java.io.*" %>
<%@ page  import="ebao.DBean" %>
<html>
<head>
<title>数据库实例名新增</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="scripts/jquery-1.11.1.js"></script>
<script type="text/javascript" src="scripts/jquery-ui-1.11.2/jquery-ui.js"></script>
<script src="scripts/uploadify/jquery.uploadify.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="scripts/uploadify/uploadify.css">
<link href="scripts/jquery-ui-themes-1.11.1/themes/cupertino/jquery-ui.css" rel="stylesheet" type="text/css">
<link href="scripts/jquery-ui-themes-1.11.1/themes/cupertino/theme.css" rel="stylesheet" type="text/css">
<style type=text/css>
div.ui-dialog-titlebar {
  font-size : 10px;
}

div.ui-dialog-content {
  font-size : 15px;
  font-family : georgia;
  font-style : italic;
}
</style>
<script type="text/javascript">

$(function() {
$("#db_type").change(function() {
	if ( "Oracle"==$("#db_type").val() ) {
		$("#db_user_type").val("sysdba");
		$("#db_sid").val("");
		$("#db_port_num").val("1521");
		$("#db_version").val("Oracle");
		$("#db_user").val("sys");
		$("#db_user_passwd").val("ebaotsdbasqw");
		$("#os_db_user").val("oracle");
		$("#os_db_passwd").val("oracleonldap");
		$("#db_sid").attr("disabled",false);
		$("#db_ldap_name").attr("disabled",false);
		$("#db_listener").val("/opt/oracle");
		$("#db_sid").val("oracle");
		$("#db_ldap_name").val("oracle"+'_'+$("#db_input").val().replace(/\./g,'_'));
		$("#db_character").val("AL32UTF8");
	} else if ( "MySQL"==$("#db_type").val() ) {
		$("#db_user_type").val("root");
		$("#db_listener").val("/opt/mysql");
		$("#db_sid").val("mysql");
		$("#db_ldap_name").val("mysql"+'_'+$("#db_input").val().replace(/\./g,'_'));
		$("#db_port_num").val("4306");
		$("#db_version").val("MySQL");
		$("#db_user").val("root");
		$("#db_user_passwd").val("mysql");
		$("#os_db_user").val("mysql");
		$("#os_db_passwd").val("mysqlonldap");
		$("#db_character").val("UTF8");
	//	$("#db_sid").attr("disabled",true);
	//	$("#db_ldap_name").attr("disabled",true);
	} else if ( "PostgreSQL"==$("#db_type").val() ) {
		$("#db_user_type").val("root");
		$("#db_listener").val("/opt/pgsql");
		$("#db_sid").val("pgsql");
		$("#db_ldap_name").val("pgsql"+'_'+$("#db_input").val().replace(/\./g,'_'));
		$("#db_port_num").val("5432");
		$("#db_version").val("PgSQL");
		$("#db_user").val("root");
		$("#db_user_passwd").val("pgsql");
		$("#os_db_user").val("pgsql");
		$("#os_db_passwd").val("pgsqlonldap");
		$("#db_character").val("UTF8");
		//	$("#db_sid").attr("disabled",true);
		//	$("#db_ldap_name").attr("disabled",true);
	}else {
                $("#db_user_type").val("sa");
                $("#db_listener").val("c:/sqlserver");
                $("#db_sid").val("sqlserver");
                $("#db_ldap_name").val("sqlserver"+'_'+$("#db_input").val().replace(/\./g,'_'));
                $("#db_port_num").val("4306");
                $("#db_version").val("SQLServer");
                $("#db_user").val("sa");
                $("#db_user_passwd").val("sqlserver");
                $("#os_db_user").val("administrator");
                $("#os_db_passwd").val("Ebaotech250");
		$("#db_character").val("UTF8");
	}
});
//$("div#dialog").dialog('option','autoOpen',false);
//$("div#dialog").dialog({ position : ["center","right"] });
$('#deploy').click ( function(event) {
//      alert("test");
//      if ($("#dialog").dialog("isOpen")) alert("Already open!");
//      else $("#dialog").dialog("open");
        $("#dialog").dialog({
        buttons: { "Yes" : function() { $("div#dialog").dialog("close");
                }, "No" : function() {}
        },
        title : "test dialog",
        height : "600",
        width : "600",
        closeOnEscape:true,
        show : "slide",
        hide : "scale",
        modal : "true"
        });
});


});
</script>
</head>
<script language="javascript">
//日历
var date_start,date_end,g_object;
var today = new Date();
var separator="-";
var inover=false;

//mode :时间变换的类型0-年 1-月 2-直接选择月
function change_date(temp,mode)
{
	var t_month,t_year;
    if (mode){
        if(mode==1)
        t_month=parseInt(cele_date_month.value,10)+parseInt(temp,10);
        else
        t_month=parseInt(temp);
        if (t_month<cele_date_month.options(0).text) {
            cele_date_month.value=cele_date_month.options(cele_date_month.length-1).text;
            change_date(parseInt(cele_date_year.value,10)-1,0);
            }
        else{
            if (t_month>cele_date_month.options(cele_date_month.length-1).text){
                cele_date_month.value=cele_date_month.options(0).text;
                change_date(parseInt(cele_date_year.value,10)+1,0);
                }            
            else
                {cele_date_month.value=t_month;
                 set_cele_date(cele_date_year.value,cele_date_month.value);                
                }
        }
    }  
    else{
        t_year=parseInt(temp,10);
        
        if (t_year<cele_date_year.options(0).text) {
            cele_date_year.value=cele_date_year.options(0).text;
            set_cele_date(cele_date_year.value,1);                
            }
        else{
            if (parseInt(t_year,10)>parseInt(cele_date_year.options(cele_date_year.length-1).text,10)){
                cele_date_year.value=cele_date_year.options(cele_date_year.length-1).text;
                set_cele_date(cele_date_year.value,12);                
                }            
            else
                {cele_date_year.value=t_year;
                 set_cele_date(cele_date_year.value,cele_date_month.value);                
                }
        }
    }

    window.cele_date.focus();

}

//初始化日历
function init(d_start,d_end)
{
     var temp_str;
     var i=0;
     var j=0;
     date_start=new Date(1980,7,1);
     date_end=new Date(2004,8,1);
     document.writeln("<div name=\"cele_date\" id=\"cele_date\"  style=\"display:none\"    style=\"LEFT: 69px; POSITION: absolute; TOP: 159px;Z-INDEX:99\" onClick=\"event.cancelBubble=true;\" onBlur=\"hilayer()\" onMouseout=\"lostlayerfocus()\">-</div>");
     window.cele_date.innerHTML="";
     temp_str="<table border=\"1\" bgcolor=\"#DDDDDD\" bordercolor=\"white\"><tr><td colspan=7 onmouseover=\"overcolor(this)\">";
     temp_str+="<input type=\"Button\" value=\"<<\" onclick=\"change_date(-1,1)\" onmouseover=\"getlayerfocus()\" style=\"color: #000099; background-color: #BFBFBF; cursor: hand\">-";

     temp_str+="";
     temp_str+="<select name=\"cele_date_year\" id=\"cele_date_year\" language=\"javascript\" onchange=\"change_date(this.value,0)\" onmouseover=\"getlayerfocus()\" onblur=\"getlayerfocus()\" style=\"font-size: 9pt; border: 1px #666666 outset; background-color: #F4F8FB\">";

     for (i=1930;i<=2080;i++)
     {
     	temp_str+="<OPTION value=\""+i.toString()+"\">"+i.toString()+"</OPTION>";
     }
     temp_str+="</select>-";
     temp_str+="";
     temp_str+="<select name=\"cele_date_month\" id=\"cele_date_month\" language=\"javascript\" onchange=\"change_date(this.value,2)\" onmouseover=\"getlayerfocus()\" onblur=\"getlayerfocus()\" style=\"font-size: 9pt; border: 1px #666666 outset; background-color: #F4F8FB\">";

     for (i=1;i<=12;i++)
     {
     	temp_str+="<OPTION value=\""+i.toString()+"\">"+i.toString()+"</OPTION>";
     }
     temp_str+="</select>-";
     temp_str+="";
     temp_str+="<input type=\"Button\" value=\">>\" onclick=\"change_date(1,1)\" onmouseover=\"getlayerfocus()\"  style=\"color: #000099; background-color: #BFBFBF; cursor: hand\">";

     temp_str+="</td></tr><tr><td onmouseover=\"overcolor(this)\">";
     temp_str+="<font color=red>日</font></td><td>";temp_str+="一</td><td>"; temp_str+="二</td><td>"; temp_str+="三</td><td>";
     temp_str+="四</td><td>";temp_str+="五</td><td>"; temp_str+="六</td></tr>";
     for (i=1 ;i<=6 ;i++)
     {
     temp_str+="<tr>";
        for(j=1;j<=7;j++){
            temp_str+="<td name=\"c"+i+"_"+j+"\"id=\"c"+i+"_"+j+"\" style=\"CURSOR: hand\" style=\"COLOR:#000000\" language=\"javascript\" onmouseover=\"overcolor(this)\" onmouseout=\"outcolor(this)\" onclick=\"td_click(this)\">?</td>"
            }
     temp_str+="</tr>"        
     }
     temp_str+="</td></tr></table>";
     window.cele_date.innerHTML=temp_str;
}
function set_cele_date(year,month)
{
   var i,j,p,k;
   var nd=new Date(year,month-1,1);
   event.cancelBubble=true;
   cele_date_year.value=year;
   cele_date_month.value=month;   
   k=nd.getDay()-1;
   var temp;
   for (i=1;i<=6;i++)
      for(j=1;j<=7;j++)
      {
      eval("c"+i+"_"+j+".innerHTML=\"\"");
      eval("c"+i+"_"+j+".bgColor=\"#DDDDDD\"");
      eval("c"+i+"_"+j+".style.cursor=\"hand\"");
      }
   while(month-1==nd.getMonth())
    { j=(nd.getDay() +1);
      p=parseInt((nd.getDate()+k) / 7)+1;
      eval("c"+p+"_"+j+".innerHTML="+"\""+nd.getDate()+"\"");
      if ((nd.getDate()==today.getDate())&&(cele_date_month.value==today.getMonth()+1)&&(cele_date_year.value==today.getYear())){
      	 eval("c"+p+"_"+j+".bgColor=\"#EFFB64\"");
      }
      if (nd>date_end || nd<date_start)
      {
      eval("c"+p+"_"+j+".bgColor=\"#FF9999\"");
      eval("c"+p+"_"+j+".style.cursor=\"text\"");
      }
      nd=new Date(nd.valueOf() + 86400000)
    }
}

//s_object：点击的对象；d_start-d_end有效的时间区段；需要存放值的控件；
function show_cele_date(eP,d_start,d_end,t_object)
{
window.cele_date.style.display="";
window.cele_date.style.zIndex=99;
var s,cur_d;
var eT = eP.offsetTop;  
var eH = eP.offsetHeight+eT;  
var dH = window.cele_date.style.pixelHeight;  
var sT = document.body.scrollTop; 
var sL = document.body.scrollLeft; 
event.cancelBubble=true;
window.cele_date.style.posLeft = event.clientX-event.offsetX+sL;  
window.cele_date.style.posTop = event.clientY-event.offsetY+eH+sT;
if (window.cele_date.style.posLeft+window.cele_date.clientWidth>document.body.clientWidth) window.cele_date.style.posLeft+=eP.offsetWidth-window.cele_date.clientWidth;
if (d_start!=""){
    if (d_start=="today"){
        date_start=new Date(today.getYear(),today.getMonth(),today.getDate());
    }else{
        s=d_start.split(separator);
        date_start=new Date(s[0],s[1]-1,s[2]);
    }
}else{
    date_start=new Date(1900,1,1);
}

if (d_end!=""){
    s=d_end.split(separator);
    date_end=new Date(s[0],s[1]-1,s[2]);
}else{
    date_end=new Date(3000,1,1);
}

g_object=t_object;

cur_d=new Date();
set_cele_date(cur_d.getYear(),cur_d.getMonth()+1);
window.cele_date.style.display="block";

window.cele_date.focus();

}
function td_click(t_object)
{
var t_d;
if (parseInt(t_object.innerHTML,10)>=1 && parseInt(t_object.innerHTML,10)<=31 ) 
{ t_d=new Date(cele_date_year.value,cele_date_month.value-1,t_object.innerHTML);
if (t_d<=date_end && t_d>=date_start)
{
var year = cele_date_year.value;
var month = cele_date_month.value;
var day = t_object.innerHTML;
if (parseInt(month)<10) month = "0" + month;
if (parseInt(day)<10) day = "0" + day;

g_object.value=year+separator+month+separator+day;
	window.cele_date.style.display = "none";
}
}

}
function h_cele_date()
{
window.cele_date.style.display="none";
}

function overcolor(obj)
{
  if (obj.style.cursor=="hand") obj.style.color = "#FFFFFF";

  inover=true;
  window.cele_date.focus();

}

function outcolor(obj)
{
	obj.style.color = "#000000";
	inover=false;

}

function getNow(o){
    var Stamp=new Date();
    var year = Stamp.getYear();
    var month = Stamp.getMonth()+1;
    var day = Stamp.getDate();
    if(month<10){
	month="0"+month;
    }
    if(day<10){
	day="0"+day;
    }
    o.value=year+separator+month+separator+day;
}

function hilayer()
{
	if (inover==false)
	{
		var lay=document.all.cele_date;
		lay.style.display="none";
	}
}
function getlayerfocus()
{
	inover=true;
}
function lostlayerfocus()
{
	inover=false;
}
init();
//日历结束
</script>
<body><%@include file="includes/head.html" %>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">数据库实例名新增</span></strong></font>
<br><br>
<%
DBean db = new DBean();
ResultSet rs;
String sql = new String();
%>
<form name="form1" action="db_server_main_add_finish.jsp" method="post" class="en">
<table width="600" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
	<%
	sql = "select distinct mac_ip from a_hardware  union select distinct host_ip  mac_ip from a_pc_info order by mac_ip";
	rs = db.execSQL(sql);
	%>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>数据库IP</strong></font></td>
	  <td width="79%" bgcolor="#FCFCFC" class="en">
<div style="position:relative;">
      <select name="db_ip" style="width:120px;" onchange="document.getElementById('db_input').value=this.value">
      	<option value="">请选择</option>
        <%while(rs.next()){%>
        	<option value="<%=rs.getString("mac_ip")%>"><%=rs.getString("mac_ip")%></option>
        <%}%>
      </select> *选择或输入
  <input id="db_input" name="db_input" required pattern="((^|\.)((25[0-5])|(2[0-4]\d)|(1\d\d)|([1-9]?\d))){4}$" style="position:absolute;width:99px;height:16px;left:1px;top:2px;border-bottom:0px;border-right:0px;border-left:0px;border-top:0px;">
</div>
      </td>
	</tr>
        <tr>
          <td align="center" bgcolor="#D2D2D2" class="en" width="22%"><font color="#3333cc"><strong>DB Type</strong></font></td>
          <td bgcolor="#FCFCFC" class="en" align="left"><select id="db_type" name="db_type"><option>Oracle</option><option>MySQL</option><option>SQLServer</option><option>PostgreSQL</option></select>
        </tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="22%"><font color="#3333cc"><strong>安装用户名/密码</strong></font></td>
	  <td bgcolor="#FCFCFC" class="en" align="left"><input type="text" id="os_db_user" name="os_db_user" value="oracle" class="en" size="14">&nbsp;/&nbsp;
	  <input type="text" id="os_db_passwd" name="os_db_passwd" value="oracleonldap" class="en" size="14"></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>数据库实例名 SID</strong></font></td>
	  <td bgcolor="#cccccc" class="en">
	<input type="text" required name="db_sid" id="db_sid" value="" class="en" size="30" onblur="db_ldap_name.value=this.value+'_'+db_input.value.replace(/\./g,'_')">*必填</td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>LDAP TNSNAME</strong></font></td>
	  <td bgcolor="#cccccc" class="en"><input type="text" required name="db_ldap_name" id="db_ldap_name" value="" class="en" size="30">*必填</td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>数据库端口号</strong></font></td>
	  <td bgcolor="#cccccc" class="en"><input type="text" required name="db_port_num" id="db_port_num" value="1521" class="en" size="30">*必填</td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>数据库用户/密码</strong></font></td>
	  <td bgcolor="#FCFCFC" class="en"><input type="text" name="db_user" id="db_user" value="sys" class="en" size="14">&nbsp;/&nbsp;
	  <input type="text" name="db_user_passwd" id="db_user_passwd" value="ebaotsdbasqw" class="en" size="14"></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>数据库用户类型</strong></font></td>
	  <td bgcolor="#FCFCFC" class="en"><input type="text" name="db_user_type" id="db_user_type" value="sysdba" class="en" size="35"></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>数据库环境申请人</strong></font></td>
	  <td bgcolor="#FCFCFC" class="en"><input type="text" name="proposer" value="<%out.print(session.getAttribute("username"));%>" class="en" size="35"></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>数据库环境创建人</strong></font></td>
	  <td bgcolor="#FCFCFC" class="en"><input type="text" name="creater" value="<%=session.getAttribute("username")%>" class="en" size="35"></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>数据库创建日期</strong></font></td>
	<% java.util.Date a=new java.util.Date(); 
	String s = java.text.DateFormat.getDateInstance(java.text.DateFormat.MEDIUM).format(a);
	%>
	  <td bgcolor="#FCFCFC" class="en"><input type="text" name="create_date" class="en" value="<%=s%>"size="35"></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>数据库负责人</strong></font></td>
	  <td bgcolor="#FCFCFC" class="en"><input type="text" name="db_manager" value="<%=session.getAttribute("username")%>" class="en" size="35"></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>数据库版本</strong></font></td>
	  <td bgcolor="#FCFCFC" class="en"><input type="text" name="db_version" id="db_version" value="Oracle 11.2.0.3" class="en" size="35"></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>数据库字符集</strong></font></td>
	  <td bgcolor="#FCFCFC" class="en"><input type="text" name="db_character" id="db_character" value="AL32UTF8" class="en" size="35"></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>数据库安装路径</strong></font></td>
	  <td bgcolor="#FCFCFC" class="en"><input type="text" name="db_listener" id="db_listener" value="/opt/oracle" class="en" size="35"></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>数据库运行状态</strong></font></td>
	  <td bgcolor="#FCFCFC" class="en"><input type="text" readonly name="db_status" value="running" class="en" size="35"></td>
	</tr>
</table>
<br>
<div align="center">
<input type="button" name="button1" value="提交" onClick="check()">&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="reset1" value="重置">
</div>
</form>
<%
db.close();
rs.close();
%>
</body>
<script language="JavaScript">
function check(){
	if(form1.db_input.value==""){
		alert("请输入DB IP！");
		form1.db_input.focus();
		return false;
	}
	if(form1.os_db_user.value==""){
		alert("请输入安装用户名！");
		form1.os_db_user.focus();
		return false;
	}
	if(form1.os_db_passwd.value==""){
		alert("请输入用户名密码！");
		form1.os_db_passwd.focus();
		return false;
	}
	if(form1.db_sid.value==""){
		alert("请输入数据库实例名！");
		form1.db_sid.focus();
		return false;
	}
	if(form1.db_user.value==""){
		alert("请输入数据库用户！");
		form1.db_user.focus();
		return false;
	}
	if(form1.db_user_passwd.value==""){
		alert("请输入数据库用户密码！");
		form1.db_user_passwd.focus();
		return false;
	}
	if(form1.db_user_type.value==""){
		alert("请输入数据库用户类型！");
		form1.db_user_type.focus();
		return false;
	}
	if(form1.proposer.value==""){
		alert("请输入数据库环境申请人！");
		form1.proposer.focus();
		return false;
	}
	if(form1.creater.value==""){
		alert("请输入数据库环境创建人！");
		form1.creater.focus();
		return false;
	}
	if(form1.create_date.value==""){
		alert("请输入数据库环境创建日期！");
		form1.create_date.focus();
		return false;
	}
	if(form1.db_manager.value==""){
		alert("请输入数据库负责人！");
		form1.db_manager.focus();
		return false;
	}
	if(form1.db_version.value==""){
		alert("请输入数据库版本！");
		form1.db_version.focus();
		return false;
	}
	if(form1.db_character.value==""){
		alert("请输入数据库字符集！");
		form1.db_character.focus();
		return false;
	}
	if(form1.db_port_num.value==""){
		alert("请输入数据库端口号！");
		form1.db_port_num.focus();
		return false;
	}
	if(form1.db_listener.value==""){
		alert("请输入数据库监听器！");
		form1.db_listener.focus();
		return false;
	}
	if(form1.db_ldap_name.value==""){
		alert("请输入数据库TNSNAME on LDAP！");
		form1.db_ldap_name.focus();
		return false;
	}
	if(form1.db_status.value==""){
		alert("请输入数据库运行状态！");
		form1.db_status.focus();
		return false;
	}
	form1.submit();
}
</script>
<script language="JavaScript" for="document" event="onkeypress">
	if(event.keyCode==13){
		check();
	}
</script>
</html>
