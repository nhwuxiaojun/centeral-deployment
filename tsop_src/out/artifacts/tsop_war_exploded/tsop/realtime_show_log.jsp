<%@ page language="java" contentType="text/html;charset=gb2312"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<html>
<head>
<title>Log viewer <%=request.getParameter("filename")%></title>
</head>

<script type="text/javascript" src="scripts/jquery-1.11.1.js"></script>
<script type="text/javascript" src="scripts/jquery-ui-1.11.1/jquery-ui.js"></script>
<script type="text/javascript" src="scripts/spin.min.js"></script>
<link href="scripts/jquery-ui-1.11.1/jquery-ui.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
$(document).ready(function(){  
//    setInterval("startRequest()",1000); 
//    setInterval("reloadPage()",10000); 
    $("#log").scrollTop(100000);  
//    $("head").prepend('<meta http-equiv="refresh" content="5">');
var opts = {
  lines: 12, // The number of lines to draw
  length: 15, // The length of each line
  width: 7, // The line thickness
  radius: 15, // The radius of the inner circle
  corners: 1, // Corner roundness (0..1)
  rotate: 0, // The rotation offset
  direction: 1, // 1: clockwise, -1: counterclockwise
  color: '#0f0', // #rgb or #rrggbb or array of colors
  speed: 0.8, // Rounds per second
  trail: 100, // Afterglow percentage
  shadow: true, // Whether to render a shadow
  hwaccel: true, // Whether to use hardware acceleration
  className: 'spinner', // The CSS class to assign to the spinner
  zIndex: 2e9, // The z-index (defaults to 2000000000)
  top: '30%', // Top position relative to parent
  left: '50%' // Left position relative to parent
};
var target = document.getElementById('foo');
var spinner = new Spinner(opts).spin(target);

if ($("textarea:contains('finished')").length>0) {
//        setInterval("reloadPage()",600000);
        t=setTimeout("reloadPage()",600000);
        clearInterval(t);
	spinner.stop(target);
} else {
        var int=1000*$("#refersh_interval").children('option:selected').val();
//        setInterval("reloadPage()",int);
        setTimeout("reloadPage()",int);
}
    $("#refersh_interval").change(function(){
	var int=1000*$(this).children('option:selected').val();
	window.location.reload();
    	setInterval("reloadPage()",int); 
    });

document.getElementById('terminate_btn').onclick = function() {
	spinner.stop(target);
	if (confirm("Confirm terminate current deployment?")) {
		$(window.location).attr('href', '/tsop/terminate_deploy.jsp?env_id=<%=request.getParameter("env_id")%>&env_name=<%=request.getParameter("env_name")%>&file=<%=request.getParameter("filename")%>');
	}
}

});

function startRequest() 
{ 
    $("#date").text((new Date()).toString()); 
} 

function reloadPage()
{
    window.location.reload();
}

</script>
<style> 
body {
        font-family:verdana, sans-serif;
        font-size:small;
}
textarea 
{ 
width:100%; 
height:75%; 
} 
</style> 
<body>
<h3>Target Environment: <font color=red><%=request.getParameter("env_name")%></font></h3>
<h4>Package Deploying: <font color=blue><%=request.getParameter("filename")%></font></h4>
<center>
<textarea name="log" id="log" rows="19" cols="80" style='border: 1px solid #94BBE2;width:100%;background-color:white;color:black;' onpropertychange='this.style.posHeight=this.scrollHeight' onfocus='textarea.style.posHeight=this.scrollHeight'>
<%
  byte buf[]=new byte[900000];
  try{
     String path=request.getRealPath("/usr//local/ts_op/Oracle/Middleware/user_projects/domains/base_domain/applications/ts_op/jsp/deploy/logs");
     File fp=new File("/usr//local/deploy/logs",request.getParameter("env_name")+"_"+request.getParameter("filename")+".log");
     FileInputStream fistream=new FileInputStream(fp);
     int bytesum=fistream.read(buf,0,900000);
     String str_file=new String(buf,0,bytesum);
     out.println(str_file);
  
     fistream.close();
  }catch(IOException e) {
 	e.printStackTrace();
     	out.println(e.toString());
  }
%>
</textarea>
<div id="info"></div>
<div id="foo"></div>
<br>
Refresh Interval:<select id="refersh_interval">
<option value="5">5s</option>
<option value="10">10s</option>
<option value="50">50s</option>
</select>
&nbsp;<button onClick="window.location.reload()">Refresh</button>
&nbsp;<button onClick="$(window.location).attr('href', '/tsop/ts_deploy_env.jsp?env_id=<%=request.getParameter("env_id")%>&env_name=<%=request.getParameter("env_name")%>');">Redeploy</button>
&nbsp;<button id="terminate_btn" onClick="if (confirm("Confirm terminate this deployment?")) {$(window.location).attr('href', '/tsop/terminate_deploy.jsp?env_id=<%=request.getParameter("env_id")%>&env_name=<%=request.getParameter("env_name")%>'); }" >Terminate</button>
&nbsp;<button onClick="window.close()">Close</button>
<div id="date"></div>
</center>
<script>
//$( "div:contains('finish')" ).css( "text-decoration", "underline" );
//$( "textarea:contains('finish')" ).css( "text-decoration", "underline" );
//alert($("textarea:contains('finished')").length);
if ($("textarea:contains('finished')").length>0) {
        setInterval("reloadPage()",600000);
//        t=setTimeout("reloadPage()",600000);
//	clearInterval(t);
	spinner.stop();
//	spinner.stop(target);
} else {
	var int=1000*$("#refersh_interval").children('option:selected').val();
//        setInterval("reloadPage()",int);
        setTimeout("reloadPage()",int);
}
</script>
<%
//创建对象
        Date date = new Date() ;
        Cookie c = new Cookie("lastVisited",date.toString()) ;
//        Cookie envs = null ;
//设定有效时间  以s为单位
        c.setMaxAge(60) ;
//设置Cookie路径和域名
        c.setPath("/") ;
        c.setDomain(".ebaotech.com") ;  //域名要以“.”开头
//发送Cookie文件
        response.addCookie(c) ;

//读取Cookie
        Cookie cookies[] = request.getCookies() ;

       for(int i=0;i<cookies.length;i++){
           c = cookies[i] ;
	   String env_name= new String();
	   if ("Xnull".equals("X"+request.getParameter("env_name"))||request.getParameter("env_name")=="") { env_name="xxx"; } else { env_name=request.getParameter("env_name"); }
	   
	
           if(c.getName().equals("environments")&&!c.getValue().contains(env_name)){
	   	System.out.println("Log refreshing, environment:"+env_name+"---"+session.getAttribute("username"));
		
              c.setValue(request.getParameter("env_name")+","+c.getValue()) ;
              c.setMaxAge(60*60*12) ;
              response.addCookie(c) ;     //修改后，要更新到浏览器中     
           } 
           if(c.getName().equals("lastVisited")){
              c.setValue("2010-04-3-28") ;
              c.setMaxAge(60*60*12) ;
              response.addCookie(c) ;     //修改后，要更新到浏览器中     
           }
	   
       }

        Cookie c1 = null ;
        if(cookies != null){
            for(int i=0;i<cookies.length;i++){
               c1 = cookies[i] ;
		if (c1.getName().equals("environments")) {
           //    		out.println("cookie name : " + c1.getName() + "   ") ;
           //    		out.println("cookie value :" + c1.getValue() + "<br>");
			System.out.println(c1.getName()+":"+c1.getValue());
		}
		if (!c1.getName().equals("environments")) {
        		Cookie envs = new Cookie("environments","XX") ;
        		envs.setMaxAge(6*60*60*60) ;
        		envs.setPath("/") ;
//        		envs.setDomain(".zl.org") ;  //域名要以“.”开头
        		response.addCookie(envs) ;
		}
            }
        }

%>
</body>
</html>

