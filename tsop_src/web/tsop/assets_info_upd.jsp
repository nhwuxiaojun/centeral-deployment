<%@ include file="../interface/check.jsp"%>
<%@ page language="java" import="java.sql.ResultSet,java.sql.ResultSetMetaData" contentType="text/html; charset=gbk" errorPage=""%>
<%@ page import="java.io.*" %>
<%@ page  import="ebao.DBean" %>
<%@ page  import="ebao.Tools" %>
<html>
<head>
<title>资产新增</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
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
<%
DBean db = new DBean();
String sql = new String();
ResultSet rs = null;
int i = 0;
sql = "select * from a_assets_ip where ass_num = '" + request.getParameter("ass_num") + "'";
rs = db.execSQL(sql);
%>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">资产修改</span></strong></font>
</div>
<br><br>
<%while(rs.next()){%>
<form name="form1" action="assets_info_upd_finish.jsp" method="post" class="en">
<table width="70%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
	<tr>
	  <td width="21%" height="23" align="center" bgcolor="#D2D2D2" class="en"><font color="#3333cc"><strong>资产编号</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><%=rs.getString("ass_num")%></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>物理IP</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><input type="text" name="mac_ip" value="<%=Tools.msNull(rs.getString("mac_ip"))%>" class="en" size="35"></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>使用状态</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><input type="text" name="opt_stat" value="<%=Tools.msNull(rs.getString("opt_stat"))%>" class="en" size="35"></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>服务器类型</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><input type="text" name="svr_type" value="<%=Tools.msNull(rs.getString("svr_type"))%>" class="en" size="35"></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>资产价格</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><input type="text" name="svr_price" value="<%=Tools.msNull(rs.getString("svr_price"))%>" class="en" size="35"></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>购买日期</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><input type="text" name="b_date" value="<%=rs.getDate("b_date")%>" class="en" size="35" onFocus="show_cele_date(b_date,'','',b_date)"></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>主机序列号</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><input type="text" name="svr_sn" value="<%=Tools.msNull(rs.getString("svr_sn"))%>" class="en" size="35"></td>
	</tr>
</table>
<br>
<div align="center">
<input type="hidden" name="ass_num" value="<%=rs.getString("ass_num")%>">
<input type="button" name="button1" value="修改" onClick="check()">&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="reset1" value="重置">&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" name="button2" value="返回" onClick="return_back()">
</div>
</form>
<%}%>
<jsp:include page="includes/copyright.jsp" /></body>
<script language="JavaScript">
function check(){
	if(form1.mac_ip.value==""){
		alert("请输入物理IP！");
		form1.mac_ip.focus();
		return false;
	}
	if(form1.opt_stat.value==""){
		alert("请输入使用状态！");
		form1.opt_stat.focus();
		return false;
	}
	if(form1.svr_type.value==""){
		alert("请输入服务器类型！");
		form1.svr_type.focus();
		return false;
	}
	if(form1.svr_price.value==""){
		alert("请输入资产价格！");
		form1.svr_price.focus();
		return false;
	}
	if(isNumber(form1.svr_price.value)==false){
		alert("资产价格必须为数字！");
		form1.svr_price.focus();
		return false;
	}
	if(form1.b_date.value==""){
		alert("请输入购买日期！");
		form1.b_date.focus();
		return false;
	}
	form1.submit();
}
function isNumber(oNum){
	var i,j,strTemp;
	strTemp="0123456789.";
	if(oNum.length==0)
		return 0;
	for(i=0;i<oNum.length;i++){
		j=strTemp.indexOf(oNum.charAt(i)); 
		if(j==-1){
			return 0;
		}
	}
	return 1;
}
function return_back(){
	window.location = "assets_info_query.jsp";
}
</script>
<script language="JavaScript" for="document" event="onkeypress">
	if(event.keyCode==13){
		check();
	}
</script>
</html>
