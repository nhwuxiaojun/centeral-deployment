<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head >
    <title>External IP Query</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gbk">
    <link href="themes/redmond/jquery-ui-1.8.16.custom.css" rel="stylesheet" type="text/css" />
	<link href="./ts_op.css" rel="stylesheet" type="text/css" />
	<link href="css/ebao.css" rel="stylesheet" type="text/css">
	<link href="Scripts/jtable/themes/lightcolor/red/jtable.css" rel="stylesheet" type="text/css" />
	<script src="../jquery-1.5.2.min.js"></script>
	<script src="scripts/jquery-1.6.4.min.js" type="text/javascript"></script>
    <script src="scripts/jquery-ui-1.8.16.custom.min.js" type="text/javascript"></script>
    <script src="Scripts/jtable/jquery.jtable.js" type="text/javascript"></script>

  <script type="text/javascript">
        $(function() {
            $("#btnClose").click(function() {
                $("#BgDiv").css("display", "none");
                $("#DialogDiv").css("display", "none");
            });
			//add ����
            $("#btnTest").click(function() {
                $("#BgDiv").css({ display: "block", height: $(document).height() });
                var yscroll = document.documentElement.scrollTop;    //��ǰ�����Ķ���
                $("#DialogDiv").css("top",  yscroll+200 ).css("display", "block");
            });
		    //�༭����div �رհ�ť
            $("#btnClose2").click(function() {
                $("#BgDiv").css("display", "none");
                $("#DialogDiv2").css("display", "none");
            });
        })
		//�༭��ť����¼�
		function editItem(id){           
				$("#BgDiv").css({ display: "block", height: $(document).height() });
                var yscroll = document.documentElement.scrollTop;
                $("#DialogDiv2").css("top", yscroll+200).css("display", "block");    
		
                // var tab=document.getElementById('tb1');
	         	var tr1=document.getElementById(id);   //ȡ ��ǩ tr id���¸��� td ֵ
				document.getElementById('ID2').value=id;
				document.getElementById('INTERNAL_IP2').value=tr1.cells[1].innerHTML;
				document.getElementById('INTERNAL_PORT2').value=tr1.cells[2].innerHTML;
				document.getElementById('EXTERNAL_IP2').value=tr1.cells[3].innerHTML;
				document.getElementById('EXTERNAL_PORT2').value=tr1.cells[4].innerHTML;
				document.getElementById('PROJ_NAME2').value=tr1.cells[6].innerHTML;
				document.getElementById('PROJ_CODE2').value=tr1.cells[5].innerHTML;	
        }
		
		//ɾ����ť����¼�	 
        function delItem (id) { 
           if(confirm('ȷʵҪɾ����?')){
              $.get('ts_ip_delete.php?id='+id,null,function (msg) { 
			    //var str = delHtmlTag(msg);   
               // alert(str);
                window.location.reload();				  
              }); 
            }
        }
		//ȥ�����е�html���  
        function delHtmlTag(str){  
           return str.replace(/<[^>]+>/g,"");
        }  
        function onSuccess(data)
        {
		   var str = delHtmlTag(data);    
		   alert(str);
        }
        function onError(data)
        {
		   var str = delHtmlTag(data);    	   
		   alert("�ύʧ����"); // handle an error
        }        
        $(document).ready(function() {  
            $("#submit").click(function(){     //add ���ܵ��ύ
                var formData = $("#form1").serialize();  // ajax��serialize() ���������л�Ϊ��ֵ�ԣ�key1=value1&key2=value2�������ύ
                $.ajax({
                    type: "post",
                    url: "ts_ip_add.php",
                    cache: false,    
                    data: formData,      //�ύ������
					async: false,        //ʹ��ͬ���ķ�ʽ,trueΪ�첽��ʽ
                    success: onSuccess,
                    error: onError
                }); 
				window.location.reload();
				document.getElementById('form1').reset();        //�ύ���ݺ󽫱�����
                return false;
            });
			$("#submit2").click(function(){    //edit���ܵ��ύ
                var formData = $("#form2").serialize();  // ajax��serialize() ���������л�Ϊ��ֵ�ԣ�key1=value1&key2=value2�������ύ
                $.ajax({
                    type: "post",
                    url: "ts_ip_edit.php",
                    cache: false,    
                    data: formData,      //�ύ������
					async: false,        //ʹ��ͬ���ķ�ʽ,trueΪ�첽��ʽ
                    success: onSuccess,
                    error: onError
                }); 
				window.location.reload();
				document.getElementById('form2').reset();        //�ύ���ݺ󽫱�����
                return false;
            });
        });
    </script>
</head>
<body>
<?php 
    include "includes/head.html" ;	
	//���ӵ�mysql
    $con = mysql_connect("172.16.7.6","root","mysql1,");
    mysql_select_db("tsop", $con);
	//���ӵ�oracle
    $conn = oci_connect('ts_op','ts_0pl',"(DESCRIPTION =
    (ADDRESS_LIST =
      (ADDRESS = (PROTOCOL = TCP)(HOST = 172.16.7.189)(PORT = 1521))
    )
    (CONNECT_DATA =
      (SERVICE_NAME = ora189)
    )
    )");
?>
<br>
<div class="filtering">
    <form action="ts_ip.php" >
        Internal IP: <input type="text" autocomplete="off" name="internal_ip" id="internal_ip" value=''/>      <!--autocomplete  �������input����-->
        External IP: <input type="text" autocomplete="off" name="external_ip" id="external_ip" value=''/>
        External Port:<input type="text" autocomplete="off" name="port" id="port" value=''/>
        <!--
		    <select id="port" name="port">
            <option selected="selected" value="0">All ports</option>
            <option value="1">80</option>
            <option value="2">8080</option>
            <option value="3">7001</option>
        </select>
		-->
        <button type="submit" id="LoadRecordsButton">Load records</button>
    </form>
</div>
<div id="TsMemberContainer"></div>
<div id="TsMemberContainer" style="width: 100%;"></div>
<table class="zebra" id="tb1">
    <thead>
    <tr>
		<th width=10%>Internal IP</th>        
        <th width=5%>Port</th> 
		<th width=10%>External IP</th>
        <th width=5%>Port</th> 
        <th width=10%>Project Code</th>  
		<th width=10%>Project Name</th> 
		<th width=10%>Apply Date</th> 
		<th width=10%>URL</th> 
		<th width=5%>&nbsp;&nbsp;</th> 
		<th width=5%>&nbsp;&nbsp;</th> 
    </tr>
    </thead>
    <tfoot>
	<!--������������ div ����� �޸�-->
    <tr>
	   <td colspan="11" align="right">
	    <input type="button" id="btnTest" value="+ add a new record" />
        <div id="BgDiv"></div>
        <div id="DialogDiv" style="display:none">      <!-- ��ӿ� -->
          <h2 align="left">+ add a new record<a href="#" id="btnClose">�ر�</a></h2>
          <div class="form" align="left">
	      <form  id="form1" >
            Internal IP:<br><input type="text" AUTOCOMPLETE="off" name="INTERNAL_IP" id="INTERNAL_IP" value="" /><br>  <!-- onblur="if(this.value='')this.value='����������';"    �뿪����-->
            Port:<br><input type="text" AUTOCOMPLETE="off" name="INTERNAL_PORT" id="INTERNAL_PORT"  value="" /><br>
            External IP:<br><input type="text" AUTOCOMPLETE="off" name="EXTERNAL_IP" id="EXTERNAL_IP"  value="" /><br>
            Port:<br><input type="text" AUTOCOMPLETE="off" name="EXTERNAL_PORT" id="EXTERNAL_PORT" value="" /><br>
            Project Name:<br><input type="text" AUTOCOMPLETE="off" name="PROJ_NAME"  id="PROJ_NAME" value="" /><br>
            Project Code:<br><input type="text" AUTOCOMPLETE="off" name="PROJ_CODE" id="PROJ_CODE" value="" /><br>
	      <input id="submit" type="submit" value="�ύ" />
	      </form>
          </div>
        </div>
        <div id="DialogDiv2" style="display:none">      <!-- �༭�� -->
         <h2 align="left">+ edit  a  record<a href="#" id="btnClose2">�ر�</a></h2>
         <div class="form" align="left">
	       <form  id="form2" >
	         <input type="hidden" name="ID2" id="ID2" value="" /><br>
               Internal IP:<br><input type="text" AUTOCOMPLETE="off" name="INTERNAL_IP2" id="INTERNAL_IP2" value="" /><br>  <!-- onblur="if(this.value='')this.value='����������';"    �뿪����-->
               Port:<br><input type="text" autocomplete="off" name="INTERNAL_PORT2" id="INTERNAL_PORT2"  value="" /><br>
               External IP:<br><input type="text" autocomplete="off" name="EXTERNAL_IP2" id="EXTERNAL_IP2"  value="" /><br>
               Port:<br><input type="text" autocomplete="off" name="EXTERNAL_PORT2" id="EXTERNAL_PORT2" value="" /><br>
               Project Name:<br><input type="text" autocomplete="off" name="PROJ_NAME2"  id="PROJ_NAME2" value="" /><br>
               Project Code:<br><input type="text" autocomplete="off" name="PROJ_CODE2" id="PROJ_CODE2" value="" /><br>
             <input id="submit2" type="submit" value="�ύ" />
	       </form>
         </div>
	    </div>
        </td>
    </tr>
    </tfoot>  
   <?php
      if(is_array($_GET)&&count($_GET)>0)
	  {
        $internal_ip1=$_GET['internal_ip'];
        $external_ip1=$_GET['external_ip'];   
        $port1=$_GET['port']; 		
	  }
	  else
	  {
		$internal_ip1='';
        $external_ip1='';   
        $port1='';
	  }
	    $query="SELECT * FROM ts_ip_map_matrix where internal_ip like '%".$internal_ip1."%' and external_ip like '%".$external_ip1."%' and external_port like '%".$port1."%';";	
		$result=mysql_query($query);
		//echo $internal_ip1.$internal_ip1.$internal_ip1;
	    //$result = mysql_query("SELECT * FROM ts_ip;");	
		//Add all records to an array
		$rows = array();
		while($row = mysql_fetch_array($result,MYSQL_ASSOC))         //MYSQL_ASSOC   �������������Լ�����
		{
		
			$a=$row['INTERNAL_IP'];
			//echo $a;
			echo "<tr id='".$row['NO']."'>";
			$query="select app_url from ts_env_app where env_ip='$a' and env_state='running' ";
			//echo $query;
            $stid = oci_parse($conn, $query); // ����SQL��䣬׼��ִ��
            $r = oci_execute($stid, OCI_DEFAULT); // ִ��SQL��OCI_DEFAULT��ʾ��Ҫ�Զ�commit
			$row['Url']='';
			while($row1 = oci_fetch_array($stid, OCI_ASSOC)) {
	                $b=$row1["APP_URL"];
					$row['Url']=$b;		
			}	
			foreach($row as $key=>$item)
		    {	
			  $item = iconv("utf-8","gbk//IGNORE",$item);      //��ת�뺯����utf-8 ת��λgbk
			  if($key=='OWNER'){
				  
					echo "<td style='display:none;'>".$item."</td>";
				    continue;
			  }
			  else if($key=='NO'){
				    echo "<td style='display:none;'>".$item."</td>";
				    continue;
			  }
			  else if($key=='Url'&&$row['Url']!=''){
				   echo "<td><a target='_blank' href=".$item."><font color='blue'>open_url</font><a></td>";
				   continue;
			  }	
			  else {
				   echo "<td>".$item."</td>";		
			  }
			}
			echo "<td><a href='javascript:editItem(".$row['NO'].")' ><font color='red'>edit</font></a></td>";
			echo "<td><a href='javascript:delItem(".$row['NO'].")'><font color='red'>delete</font></a></td>";
			echo "</tr>";			
		    }
		mysql_close($con);
		oci_close($conn);
      ?>
</table>
  </body>
</html>


