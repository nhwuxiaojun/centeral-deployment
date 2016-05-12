function check_ie() {
  //alert(navigator.userAgent);  
  var sUserAgent = navigator.userAgent;  
  //parseFloat 运行时逐个读取字符串中的字符，当他发现第一个非数字符是就停止  
  var fAppVersion = parseFloat(navigator.appVersion); 

  var isIE = sUserAgent.indexOf("compatible") > -1 && sUserAgent.indexOf("MSIE") > -1;   
  var isMinIE4 = isMinIE5 = isMinIE5_5 = isMinIE6 = isMinIE7 = isMinIE8 = isMinIE9 = isMinIE10 = false;  

  if (!isIE) {
	alert("Please use IE or IE based browser for this function.");
   	return false;
  }
  return true;
}

function execPLSQL (db_ldap_name,db_username,db_password ) {
 // var arr=db_info.split(":");
//  var db_sid=arr[2];
  check_ie();
  var command;
    var shell = new ActiveXObject("WScript.Shell");
 // command = shell.RegRead("HKEY_LOCAL_MACHINE\\SOFTWARE\\Allround Automations\\PL/SQL Developer\\InstallPath");//从注册表获得软件安装路径    
  // command = "C:\\Program Files\\PLSQL Developer\\";//从注册表获得软件安装路径
   var fso;
   fso = new ActiveXObject("Scripting.FileSystemObject");
   if (fso.FolderExists("C:\\Program Files\\PLSQL Developer\\")) {
        command = "C:\\Program Files\\PLSQL Developer\\";
   } else if (fso.FolderExists("C:\\Program Files (x86)\\PLSQL Developer\\")) {
        command = "C:\\Program Files (x86)\\PLSQL Developer\\";
   } else if (fso.FolderExists("I:\\Program Files (x86)\\PLSQL Developer\\")) {
        command = "I:\\Program Files (x86)\\PLSQL Developer\\";
   } else {
        alert("PLSQL Developer maybe not installed, please download and install it.");
        window.open("http://ts.ebaotech.com/tsop/software/Plsql.developer.8.zip");
        return false;
   }
  command = command + "plsqldev.exe";
  window.oldOnError = window.onerror;
  window._command = command;
  window.onerror = function (err) {
    if (err.indexOf('utomation') != -1) {
      alert('Command' + window._command + ' has been disabled！');
      return true;
    }
    else return false;
  };
  var wsh = new ActiveXObject('WScript.Shell');
  if (wsh)
    wsh.Run("\""+command+"\""+" userid="+db_username+"/"+db_password+"@"+db_ldap_name);
  window.onerror = window.oldOnError;
}

function execRDP (env_ip) {
  check_ie();
  var command;
    var shell = new ActiveXObject("WScript.Shell");
    var fso = new ActiveXObject("Scripting.FileSystemObject");
   if (fso.FolderExists("C:\\windows\\system32\\")) {
        command = "C:\\windows\\system32\\";
   }
  command = command + "mstsc.exe";
  alert(command);
  window.oldOnError = window.onerror;
  window._command = command;
  window.onerror = function (err) {
    if (err.indexOf('utomation') != -1) {
      alert('Command' + window._command + ' has been disabled！');
      return true;
    }
    else return false;
  };
  var wsh = new ActiveXObject('WScript.Shell');
  if (wsh)
  try {
        wsh.Run("\""+command+"\""+" /v:"+env_ip);
  } catch(e) {
        	alert("RDP client not found!");
  }
  window.onerror = window.oldOnError; 
}

function execSQLPlus (db_ldap_name,db_username,db_password ) {
  check_ie();
  var command;
    var shell = new ActiveXObject("WScript.Shell");
  command = shell.RegRead("HKEY_LOCAL_MACHINE\\SOFTWARE\\ORACLE\\KEY_OraClient10g_home1\\ORACLE_HOME");//从注册表获得软件安装路径
  // command = "C:\\Program Files\\PLSQL Developer\\";//从注册表获得软件安装路径
  alert(command);
  command = command + "sqlplus.exe";
  window.oldOnError = window.onerror;
  window._command = command;
  window.onerror = function (err) {
    if (err.indexOf('utomation') != -1) {
      alert('Command' + window._command + ' has been disabled！');
      return true;
    }
    else return false;
  };
  var wsh = new ActiveXObject('WScript.Shell');
  if (wsh)
    wsh.Run("\""+command+"\""+" userid="+db_username+"/"+db_password+"@"+db_ldap_name);
  window.onerror = window.oldOnError;
}

function execSecureCRT (env_ip,env_username,env_password ) {
  check_ie();
  var command;
  if(window.ActiveXObject){ 
    	var shell = new ActiveXObject("WScript.Shell");
  } else  if(window.XMLHTTPRequest){
    	var shell = new XMLHTTPRequest("WScript.Shell");	
  }
	try {
    command = shell.RegRead("HKEY_LOCAL_MACHINE\\SOFTWARE\\VanDyke\\SecureCRT\\Install\\Main Directory");
    command = command + "SecureCRT.exe";
	} catch(err) {
		alert('SecureCRT is not installed or browser is not supported!');
	}
	
  window.oldOnError = window.onerror;
  window._command = command;
  window.onerror = function (err) {
    if (err.indexOf('utomation') != -1) {
		alert('sss' + window._command + ' ssss'); 
      return true;
    } 
    else return false;
  };
  var wsh = new ActiveXObject('WScript.Shell');
  if (wsh)
    wsh.Run("\""+command+"\""+"/PASSWORD "+env_password+" "+env_username+"@"+env_ip);
  window.onerror = window.oldOnError;
}

function execSamba (server_path ) {
  check_ie();
	//alert(server_path);
  	var wsh = new ActiveXObject('WScript.Shell');
  	if (wsh)
	try {
    	wsh.Run("\""+server_path+"\"");
	} catch (e) {
	    alert("Network path "+server_path+" doesnt exist! Please contact OP to create.");
	}
  	//window.onerror = window.oldOnError;
}

function exectnsping (db_ldap_name) {
  check_ie();
        var wsh = new ActiveXObject('WScript.Shell');
        var command ;
        command = "tnsping";
        if (wsh)
        try {
            wsh.Run("\""+command+"\""+" "+db_ldap_name+" ; pause");
        } catch (e) {
            alert("tnsping was not able to find, Oracle client maybe NOT install.");
        }
}

function restart_batch (env_ip,env_username,env_password ) {
  if (!check_ie()) { return false;}
  if(confirm("Confirm restart environment "+env_ip+" batch server?")) {
    var command;
    var shell = new ActiveXObject("WScript.Shell");
    var fso;
   fso = new ActiveXObject("Scripting.FileSystemObject");
   if (fso.FolderExists("C:\\Program Files\\Putty\\")) {
        command = "C:\\Program Files\\Putty\\";
   } else if (fso.FolderExists("D:\\Program Files\\Putty\\")) {
        command = "D:\\Program Files\\Putty\\";
   } else if (fso.FolderExists("D:\\Program Files (x86)\\Putty\\")) {
        command = "D:\\Program Files (x86)\\Putty\\";
   } else if (fso.FolderExists("C:\\Program Files (x86)\\Putty\\")) {
        command = "C:\\Program Files (x86)\\Putty\\";
   } else if (fso.FolderExists("I:\\Program Files (x86)\\Putty\\")) {
        command = "I:\\Program Files (x86)\\Putty\\";
   } else {
        alert("Putty maybe not installed, please download and install it.");
        window.open("http://ts.ebaotech.com/tsop/software/putty-installer.exe");
        return false;
   }
  command = command + "plink.exe";
  window.oldOnError = window.onerror;
  window._command = command;
  window.onerror = function (err) {
    if (err.indexOf('utomation') != -1) {
      alert('Command' + window._command + ' has been disabled');
      return true; } else return false;
       };
        var wsh = new ActiveXObject('WScript.Shell');
        if (wsh)
        try {
        wsh.Run("\""+command+"\""+" -pw "+env_password+" "+env_username+"@"+env_ip+" ( . ~/.bash_profile; echo Batch Restart from $SSH_CLIENT at `date +%F_%T` >>~/restart.log; find ./EBAO_HOME/ -name batch_manage.sh |while  read i; do $i restart; done ; tail -f agent.out; read -n 1)");
        } catch(e) {
        alert("Putty is not installed, or SSH to "+env_ip+" failed!");
        }
        window.onerror = window.oldOnError;
        }
}
function restart_app (env_ip,env_username,env_password ) {
  if (!check_ie()) { return false;}
  if(confirm("Confirm restart environment "+env_ip+" app server?")) {
    var command;
    var shell = new ActiveXObject("WScript.Shell");
    var fso;
   fso = new ActiveXObject("Scripting.FileSystemObject");
   if (fso.FolderExists("C:\\Program Files\\Putty\\")) {
        command = "C:\\Program Files\\Putty\\";
   } else if (fso.FolderExists("D:\\Program Files\\Putty\\")) {
        command = "D:\\Program Files\\Putty\\";
   } else if (fso.FolderExists("D:\\Program Files (x86)\\Putty\\")) {
        command = "D:\\Program Files (x86)\\Putty\\";
   } else if (fso.FolderExists("C:\\Program Files (x86)\\Putty\\")) {
        command = "C:\\Program Files (x86)\\Putty\\";
   } else if (fso.FolderExists("I:\\Program Files (x86)\\Putty\\")) {
        command = "I:\\Program Files (x86)\\Putty\\";
   } else {
        alert("Putty maybe not installed, please download and install it.");
        window.open("http://ts.ebaotech.com/tsop/software/putty-installer.exe");
        return false; }
  command = command + "plink.exe";
  window.oldOnError = window.onerror;
  window._command = command;
  window.onerror = function (err) {
    if (err.indexOf('utomation') != -1) {
      alert('Command' + window._command + ' has been disabled');
      return true; } else return false; };
        var wsh = new ActiveXObject('WScript.Shell');
        if (wsh)
        try {
        wsh.Run("\""+command+"\""+" -pw "+env_password+" "+env_username+"@"+env_ip+" ( . ~/.bash_profile;  echo App Restart from $SSH_CLIENT at `date +%F_%T` >>~/restart.log; sh restart.sh; tail -f server.out ; read -n 1)");
        } catch(e) {
        alert("Putty is not installed, or SSH to "+env_ip+" failed!"); }
        window.onerror = window.oldOnError; }
}

function execPuttyCMD (env_ip,env_username,env_password,env_cmd ) {
  check_ie();
    var command;
    var shell = new ActiveXObject("WScript.Shell");
    var fso;
   fso = new ActiveXObject("Scripting.FileSystemObject");
   if (fso.FolderExists("C:\\Program Files\\Putty\\")) {
        command = "C:\\Program Files\\Putty\\";
   } else if (fso.FolderExists("D:\\Program Files\\Putty\\")) {
        command = "D:\\Program Files\\Putty\\";
   } else if (fso.FolderExists("D:\\Program Files (x86)\\Putty\\")) {
        command = "D:\\Program Files (x86)\\Putty\\";
   } else if (fso.FolderExists("C:\\Program Files (x86)\\Putty\\")) {
        command = "C:\\Program Files (x86)\\Putty\\";
   } else if (fso.FolderExists("I:\\Program Files (x86)\\Putty\\")) {
        command = "I:\\Program Files (x86)\\Putty\\";
   } else {
        alert("Putty maybe not installed, please download and install it.");
        window.open("http://ts.ebaotech.com/tsop/software/putty-installer.exe");
        return false; }
  command = command + "putty.exe";
  window.oldOnError = window.onerror;
  window._command = command;
  window.onerror = function (err) {
    if (err.indexOf('utomation') != -1) {
      alert('Command' + window._command + ' has been disabled');
      return true; } else return false; };
        var wsh = new ActiveXObject('WScript.Shell');
        if (wsh)
        try {
        wsh.Run("\""+command+"\""+" -pw "+env_password+" "+env_username+"@"+env_ip+" ( "+env_cmd+")");
        } catch(e) {
        alert("Putty is not installed, or SSH to "+env_ip+" failed!"); }
        window.onerror = window.oldOnError; 
}

function execPutty (env_ip,env_username,env_password) {
  check_ie();

  var command;
    var shell = new ActiveXObject("WScript.Shell");
   var fso;
   fso = new ActiveXObject("Scripting.FileSystemObject");
   if (fso.FolderExists("C:\\Program Files\\Putty\\")) {	
   	command = "C:\\Program Files\\Putty\\";
   } else if (fso.FolderExists("D:\\Program Files\\Putty\\")) {	
   	command = "D:\\Program Files\\Putty\\";
   } else if (fso.FolderExists("D:\\Program Files (x86)\\Putty\\")) {	
   	command = "D:\\Program Files (x86)\\Putty\\";
   } else if (fso.FolderExists("C:\\Program Files (x86)\\Putty\\")) {	
   	command = "C:\\Program Files (x86)\\Putty\\";
   } else if (fso.FolderExists("I:\\Program Files (x86)\\Putty\\")) {	
   	command = "I:\\Program Files (x86)\\Putty\\";
   } else {
	alert("Putty maybe not installed, please download and install it.");
 	window.open("http://ts.ebaotech.com/tsop/software/putty-installer.exe");
	return false;
   }
  command = command + "putty.exe";
  window.oldOnError = window.onerror;
  window._command = command;
  window.onerror = function (err) {
    if (err.indexOf('utomation') != -1) {
      alert('Command' + window._command + ' has been disabled！');
      return true;
    }
    else return false;
  	};
  	var wsh = new ActiveXObject('WScript.Shell');
  	if (wsh)
	try {
    	wsh.Run("\""+command+"\""+" -pw "+env_password+" "+env_username+"@"+env_ip);
	} catch(e) {
	alert("Putty is not installed, or SSH to "+env_ip+" failed!");
	}
  	window.onerror = window.oldOnError; }

function execFileZilla (env_ip,env_username,env_password, env_path, ftp_type ) {
  check_ie();
  var command;
    var shell = new ActiveXObject("WScript.Shell");
   var fso;
   fso = new ActiveXObject("Scripting.FileSystemObject");
   if (fso.FolderExists("C:\\Program Files\\FileZilla FTP Client\\")) {
        command = "C:\\Program Files\\FileZilla FTP Client\\";
   } else if (fso.FolderExists("C:\\Program Files (x86)\\FileZilla FTP Client\\")) {
        command = "C:\\Program Files (x86)\\FileZilla FTP Client\\";
   } else if (fso.FolderExists("D:\\Program Files\\FileZilla FTP Client\\")) {
        command = "D:\\Program Files\\FileZilla FTP Client\\";
   } else if (fso.FolderExists("D:\\Program Files (x86)\\FileZilla FTP Client\\")) {
        command = "D:\\Program Files (x86)\\FileZilla FTP Client\\";
   } else {
        alert("FileZilla FTP Client maybe not install, please download and install.");
        window.open("http://ts.ebaotech.com/tsop/software/FileZilla-win32-setup.exe");
        return false; }
  command = command + "filezilla.exe";
  window.oldOnError = window.onerror;
  window._command = command;
  window.onerror = function (err) {
    if (err.indexOf('utomation') != -1) {
      alert('Command' + window._command + ' has been disabled!'); return true; }
    else return false; };
        var wsh = new ActiveXObject('WScript.Shell');
        if (wsh)
        try {
        wsh.Run("\""+command+"\""+" "+ftp_type+"://"+env_username+":"+env_password+"@"+env_ip+env_path);
        } catch(e) { alert("FileZilla FTP Client is not installed, or FTP to "+env_ip+" failed!"); }
        window.onerror = window.oldOnError; }

function execpsftp (env_ip,env_username,env_password ) {
  check_ie();
  var command;
    var shell = new ActiveXObject("WScript.Shell");
   var fso;
   fso = new ActiveXObject("Scripting.FileSystemObject");
   if (fso.FolderExists("C:\\Program Files\\Putty\\")) {
        command = "C:\\Program Files\\Putty\\";
   } else if (fso.FolderExists("D:\\Program Files\\Putty\\")) {
        command = "D:\\Program Files\\Putty\\";
   } else if (fso.FolderExists("D:\\Program Files (x86)\\Putty\\")) {
        command = "D:\\Program Files (x86)\\Putty\\";
   } else if (fso.FolderExists("C:\\Program Files (x86)\\Putty\\")) {
        command = "C:\\Program Files (x86)\\Putty\\";
   } else if (fso.FolderExists("I:\\Program Files (x86)\\Putty\\")) {
        command = "I:\\Program Files (x86)\\Putty\\";
   } else {
        alert("Putty maybe not installed, please download and install it.");
        window.open("http://ts.ebaotech.com/tsop/software/putty-installer.exe");
        return false; }
  command = command + "psftp.exe";
  window.oldOnError = window.onerror;
  window._command = command;
  window.onerror = function (err) {
    if (err.indexOf('utomation') != -1) {
      alert('Command' + window._command + ' has been disabled！'); return true; }
    else return false; };
        var wsh = new ActiveXObject('WScript.Shell');
        if (wsh)
        try {
        wsh.Run("\""+command+"\""+" -pw "+env_password+" "+env_username+"@"+env_ip);
        } catch(e) { alert("Putty is not installed, or SSH to "+env_ip+" failed!"); }
        window.onerror = window.oldOnError; }

function open_win(url,w,h)
{
  window.open(url,"_blank","toolbar=no, location=yes, directories=no, status=yes, menubar=no, scrollbars=yes, resizable=no, copyhistory=yes, width="+w+", height="+h);
  return false;
}
