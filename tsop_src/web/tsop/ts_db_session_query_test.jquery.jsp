<!DOCTYPE html>
<head>
<meta charset="utf-8">
<link rel="shortcut icon" type="image/ico" href="http://www.datatables.net/favicon.ico">
<meta name="viewport" content="initial-scale=1.0, maximum-scale=2.0">

<title>DB Session TopSQL Query</title>
<link rel="stylesheet" type="text/css" href="../media/css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css" href="../resources/syntax/shCore.css">
<link rel="stylesheet" type="text/css" href="../resources/demo.css">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="includes/common.js"></script>
<script type="text/javascript" language="javascript" src="../media/js/jquery.js"></script>
<script type="text/javascript" language="javascript" src="../media/js/jquery.dataTables.js"></script>
<script type="text/javascript" language="javascript" src="../resources/syntax/shCore.js"></script>
<script type="text/javascript" language="javascript" src="../resources/demo.js"></script>

<script type="text/javascript" language="javascript" class="init">
$(document).ready(function() {
        $('#example').DataTable({
         "order": [[ 2, "desc" ]]
        });
} );
</script>
<script type="text/javascript">
function kill_sess(tmp_no,tmp_sid,tmp_serial){
    if (confirm('Please confirm kill db session '+tmp_sid+','+tmp_serial+' ?')) {
        	var action_url="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill&sid="+tmp_sid+"&serial="+tmp_serial;
                var formid="subForm_"+tmp_sid;
		alert(formid);
//		formid.submit();
                $('#'+formid).submit();
             //   var tmp_subForm=document.getElementById(formid);
	//	tmp_subForm.action=action_url;
         //       tmp_subForm.submit();
        } // end of iff
}
function kill_session(tmp_no,tmp_sid,tmp_serial){
//      alert(tmp_no);
        if (confirm('Please confirm kill db session '+tmp_sid+','+tmp_serial+' ?')) {
                var action_url="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill&sid="+tmp_sid+"&serial="+tmp_serial;
                if (tmp_no >=1) {
                        var subForms=document.getElementsByName("subForm");
			alert(subForms.length);
                        subForm[tmp_no-1].action=action_url;
                        subForm[tmp_no-1].submit();
                } else {
                        var subForms=document.getElementsByName("subForm");
                        subForm.action=action_url;
                        subForm.submit();
                } // end of if-else
        } // end of iff
} // end of function

</script>
<style>
div.container {
        width: 99%;
    }
</style>
</head>

<body class="dt-example">


<br>
        <div class="container">
                <section>
                        <h2>DB Session Query: <font color=red>172.25.14.19:1521:g19u1</font></h2>

<br>
                        <table id="example" class="display compact" cellspacing="0" width="100%">
                                <thead>
                                        <tr>
                                                <th>Kill</th>
                                                <th>USERNAME</th>
                                                <th>Elapsed Time(s)</th>
                                                <th>OSUSER</th>
                                                <th>SID</th>
                                                <th>SQL_TEXT</th>
                                                <th>EVENT</th>
                                                <th>Client</th>
                                        </tr>
                                </thead>


                                <tbody>
        
        <form name="subForm_2149" id="subForm_2149" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(1,2149,13003);"></input></td>
           <td>AIGBR_GW_MA_GC</td>
           <td>46</td>
          <td>jiangtao.chen</td>
          <td>2149</td>
          <td> select * from t_yes_no for update </td>
          <td>enq: TX - row lock contention</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_804" id="subForm_804" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(2,804,22065);"></input></td>
           <td>AIGBR_GW_MA_GC</td>
           <td>46</td>
          <td>jiangtao.chen</td>
          <td>804</td>
          <td> select * from t_yes_no for update </td>
          <td>enq: TX - row lock contention</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_520" id="subForm_520" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(3,520,19717);"></input></td>
           <td>AIGBR_GW_MA_GC</td>
           <td>46</td>
          <td>jiangtao.chen</td>
          <td>520</td>
          <td> select * from t_yes_no for update </td>
          <td>enq: TX - row lock contention</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_595" id="subForm_595" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(4,595,28517);"></input></td>
           <td>AIGBR_GW_MA_GC</td>
           <td>46</td>
          <td>jiangtao.chen</td>
          <td>595</td>
          <td> select * from t_yes_no for update </td>
          <td>enq: TX - row lock contention</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1444" id="subForm_1444" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(5,1444,16043);"></input></td>
           <td>DBADMIN</td>
           <td>0</td>
          <td>nagios</td>
          <td>1444</td>
          <td>             SELECT                 a.tablespace_name         "Tablespace",                 b.status                  "Status",                 b.contents                "Type",                 b.extent_management       "Extent Mgmt",                 a.bytes                   bytes,                 a.maxbytes                bytes_max,                 c.bytes_free + NVL(d.bytes_expired,0)             bytes_free             FROM               (                 -- belegter und maximal verfuegbarer platz pro datafile                 -- nach tablespacenamen zusammengefasst                 -- => bytes                 -- => maxbytes                 SELECT                     a.tablespace_name,                     SUM(a.bytes)          bytes,                     SUM(DECODE(a.autoextensible, 'YES', a.maxbytes, 'NO', a.bytes)) maxbytes                 FROM                     dba_data_files a                 GROUP BY                     tablespace_name               ) a,               sys.dba_ta</td>
          <td>db file sequential read</td>
          <td>perl@svr14-17 (TNS V1-V3)</td>
          </tr>
	</form>
        
        <form name="subForm_2213" id="subForm_2213" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(6,2213,33959);"></input></td>
           <td>DBADMIN</td>
           <td>0</td>
          <td>ts_op_query</td>
          <td>2213</td>
          <td>SELECT /*+ rule */ s.sid, s.serial#, s.username, b.sql_text,w.event, s.program, round(b.elapsed_time*0.000001/decode(b.executions,0,1,b.executions),3) PERTIME, s.OSUSER,s.BLOCKING_SESSION FROM v$session s, v$session_wait w,v$sql b WHERE s.sid = w.sid(+) And s.SQL_HASH_VALUE=b.HASH_VALUE(+) and s.SQL_CHILD_NUMBER=b.CHILD_NUMBER(+) and (b.sql_text not like 'SELECT /*+ rule */ s.sid, s.username%' or b.sql_text is null) and s.username!='SYS' ORDER BY decode(b.ELAPSED_TIME,null,0,b.elapsed_time*0.000001/decode(b.executions,0,1,b.executions)) desc</td>
          <td>SQL*Net message to client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_580" id="subForm_580" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(7,580,61073);"></input></td>
           <td>DAHSING_P2_MT_TST</td>
           <td>0</td>
          <td>dahsing_p2_mt_tst</td>
          <td>580</td>
          <td>BEGIN PKG_PUB_AUDIT.p_audit(:1 ,:2 ,:3 ,:4 ,:5 ,:6 ); END;</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_2062" id="subForm_2062" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(8,2062,21887);"></input></td>
           <td>DAHSING_BIG_CR_DEV</td>
           <td>0</td>
          <td>dahsing_big_cr_dev</td>
          <td>2062</td>
          <td>BEGIN PKG_PUB_AUDIT.p_audit(:1 ,:2 ,:3 ,:4 ,:5 ,:6 ); END;</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_713" id="subForm_713" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(9,713,20883);"></input></td>
           <td>AIGBR_BWEB_GS_DEV_APP</td>
           <td>0</td>
          <td>aigbr_bweb_gs_dev</td>
          <td>713</td>
          <td>select tbatchjobs0_.SUB_ID as SUB1_458_, tbatchjobs0_.RUN_ID as RUN2_458_, tbatchjobs0_.PROCESS_TYPE as PROCESS3_458_, tbatchjobs0_.PIECE_ID as PIECE4_458_, tbatchjobs0_.CREATE_TIME as CREATE5_458_, tbatchjobs0_.START_TIME as START6_458_, tbatchjobs0_.FINISH_TIME as FINISH7_458_, tbatchjobs0_.AGENT_ID as AGENT8_458_, tbatchjobs0_.THREAD_ID as THREAD9_458_, tbatchjobs0_.STATUS as STATUS458_, tbatchjobs0_.RESULT_INFO as RESULT11_458_ from T_BATCH_JOB_SUB tbatchjobs0_ where tbatchjobs0_.AGENT_ID=81 and tbatchjobs0_.STATUS<>107 and tbatchjobs0_.STATUS<>105 and tbatchjobs0_.STATUS<>223 and tbatchjobs0_.STATUS<>106 order by tbatchjobs0_.SUB_ID</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_650" id="subForm_650" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(10,650,11499);"></input></td>
           <td>DAHSING_MT_PRE_UAT</td>
           <td>0</td>
          <td>dahsing_mt_pre_uat</td>
          <td>650</td>
          <td>BEGIN PKG_PUB_AUDIT.p_audit(:1 ,:2 ,:3 ,:4 ,:5 ,:6 ); END;</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_873" id="subForm_873" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(11,873,2845);"></input></td>
           <td>DAHSING_MT_PRE_UAT</td>
           <td>0</td>
          <td>dahsing_mt_pre_uat</td>
          <td>873</td>
          <td>BEGIN PKG_PUB_AUDIT.p_audit(:1 ,:2 ,:3 ,:4 ,:5 ,:6 ); END;</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1514" id="subForm_1514" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(12,1514,2111);"></input></td>
           <td>DAHSING_P2_MT_DEV_APP</td>
           <td>0</td>
          <td>dahsing_p2_mt_dev</td>
          <td>1514</td>
          <td>BEGIN PKG_PUB_AUDIT.p_audit(:1 ,:2 ,:3 ,:4 ,:5 ,:6 ); END;</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1494" id="subForm_1494" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(13,1494,137);"></input></td>
           <td>CKI_DEV_APP</td>
           <td>0</td>
          <td>cki_dev</td>
          <td>1494</td>
          <td>insert into t_audit_log (log_id, transaction_type, object_type, object_id, object_code, client_ip, operator_id, operator_name, organ_id, system_time, local_time, transaction_info, db_user, db_client_machine, db_client_user, client_application) values(:1 ,:2 ,:3 ,:4 ,:5 ,'App Server',:6 ,:7 ,:8 ,:9 ,:10 ,:11 , 'App Server','App Server','App Server','JDBC Thin Client')</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_2220" id="subForm_2220" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(14,2220,43157);"></input></td>
           <td>AIG_BR_AMS_PD_GS_APP</td>
           <td>0</td>
          <td>aig_br_ams_pd_gs</td>
          <td>2220</td>
          <td>select lang_id,lang_name,used,locale from t_language where 1=1  and lang_id=:1 </td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_856" id="subForm_856" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(15,856,45409);"></input></td>
           <td>AIG_BR_AMS_RP_TST_APP</td>
           <td>0</td>
          <td>aig_br_ams_rp_tst</td>
          <td>856</td>
          <td>SELECT HOME_PAGE FROM T_USER_TYPE WHERE TYPE_ID =:1 </td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1000" id="subForm_1000" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(16,1000,13751);"></input></td>
           <td>DAHSING_P2_MT_DEV</td>
           <td>0</td>
          <td>mavis.liu</td>
          <td>1000</td>
          <td>select t.*, o.*, m.comments  from sys.all_tables t,       sys.all_tab_comments m,      sys.all_objects o where t.owner = :object_owner and t.table_name = :object_name and m.owner (+) = :object_owner and m.table_name (+) = :object_name and o.owner (+) = :object_owner and o.object_name (+) = :object_name and :object_type is not null and :sub_object is null  </td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_500" id="subForm_500" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(17,500,17077);"></input></td>
           <td>ACR_311_FEAT_TST_APP</td>
           <td>0</td>
          <td>acr_311_feat_tst</td>
          <td>500</td>
          <td>select LOCK_ID from T_BATCH_LOCK where LOCK_ID =:1  for update nowait</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1287" id="subForm_1287" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(18,1287,35489);"></input></td>
           <td>DAHSING_BIG_CR_TST_APP</td>
           <td>0</td>
          <td>dahsing_big_cr_tst</td>
          <td>1287</td>
          <td>select AGENT_ID from T_BATCH_AGENT where AGENT_ID =:1  for update nowait</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1009" id="subForm_1009" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(19,1009,32453);"></input></td>
           <td>GS_362_SGP_DEMO</td>
           <td>0</td>
          <td>gs_362_sgp_demo</td>
          <td>1009</td>
          <td>select * from (select rownum as my_rownum,table_a.* from(   select  1  data_table,              fd.fee_id,                                                                  fd.document_no,                                                                  ft.fee_name fee_type_name,                                                  fd.amount,                                                                  fd.currency_id,                                                             fd.direct_er,                                                               fd.insert_time,                                                             fd.POST_STATUS post_status,                                                      fd.post_date,                                                               f.policy_no,                                                                f.claim_no,                                                                 f.ri_soa_no,                                              </td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1366" id="subForm_1366" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(20,1366,699);"></input></td>
           <td>AIGBR_BWEB_GC_TST_APP</td>
           <td>0</td>
          <td>aigbr_bweb_gc_tst</td>
          <td>1366</td>
          <td>select str_data from t_string_resource where str_id=:1  and lang_id=:2 </td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1721" id="subForm_1721" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(21,1721,6215);"></input></td>
           <td>DAHSING_P2_MT_TST_READ</td>
           <td>0</td>
          <td>miranda.jiang</td>
          <td>1721</td>
          <td>select t.*, o.*, m.comments  from sys.all_tables t,       sys.all_tab_comments m,      sys.all_objects o where t.owner = :object_owner and t.table_name = :object_name and m.owner (+) = :object_owner and m.table_name (+) = :object_name and o.owner (+) = :object_owner and o.object_name (+) = :object_name and :object_type is not null and :sub_object is null  </td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_373" id="subForm_373" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(22,373,22339);"></input></td>
           <td>AIGBR_BWEB_GC_PREUAT_APP</td>
           <td>0</td>
          <td>aigbr_bweb_gc_preuat</td>
          <td>373</td>
          <td>select tsoaconfig0_.ID as ID186_, tsoaconfig0_.NAME as NAME186_, tsoaconfig0_.LASTMODIFYDATE as LASTMODI3_186_ from T_SOA_CONFIGFILE tsoaconfig0_</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1429" id="subForm_1429" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(23,1429,50999);"></input></td>
           <td>AIGBR_NA_DEV_RP_APP</td>
           <td>0</td>
          <td>aigbr_na_dev_rp</td>
          <td>1429</td>
          <td>SELECT HOME_PAGE FROM T_USER_TYPE WHERE TYPE_ID =:1 </td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1073" id="subForm_1073" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(24,1073,9001);"></input></td>
           <td>DAHSING_P2_MT_TST_APP</td>
           <td>0</td>
          <td>dahsing_p2_mt_tst</td>
          <td>1073</td>
          <td>select LOCK_ID from T_BATCH_LOCK where LOCK_ID =:1  for update nowait</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_801" id="subForm_801" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(25,801,6609);"></input></td>
           <td>AIGBR_TR_SIT_GC_APP</td>
           <td>0</td>
          <td>aigbr_tr_sit_gc</td>
          <td>801</td>
          <td>select tsoaconfig0_.ID as ID186_, tsoaconfig0_.NAME as NAME186_, tsoaconfig0_.LASTMODIFYDATE as LASTMODI3_186_ from T_SOA_CONFIGFILE tsoaconfig0_</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_797" id="subForm_797" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(26,797,20805);"></input></td>
           <td>DAHSING_P2_MT_TST_APP</td>
           <td>0</td>
          <td>dahsing_p2_mt_tst</td>
          <td>797</td>
          <td>select AGENT_ID from T_BATCH_AGENT where AGENT_ID =:1  for update nowait</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_303" id="subForm_303" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(27,303,28385);"></input></td>
           <td>AIG_BR_AMS_PD_QUO</td>
           <td>0</td>
          <td>aig_br_ams_pd_quo</td>
          <td>303</td>
          <td>select S_QUOTE_ACCESS__TRANS_ID.nextval from dual</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_430" id="subForm_430" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(28,430,22129);"></input></td>
           <td>AIG_BR_AMS_PD_QUO</td>
           <td>0</td>
          <td>aig_br_ams_pd_quo</td>
          <td>430</td>
          <td>select S_QUOTE_ACCESS__TRANS_ID.nextval from dual</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1424" id="subForm_1424" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(29,1424,349);"></input></td>
           <td>CKI_DEV_APP</td>
           <td>0</td>
          <td>cki_dev</td>
          <td>1424</td>
          <td>select t.code_length from T_billcard t where t.card_name = 'Agreement Code'</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1005" id="subForm_1005" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(30,1005,44881);"></input></td>
           <td>AIGBR_GW_GA_QUO</td>
           <td>0</td>
          <td>aigbr_gw_ga_quo</td>
          <td>1005</td>
          <td>select S_QUOTE_ACCESS__TRANS_ID.nextval from dual</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1586" id="subForm_1586" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(31,1586,41283);"></input></td>
           <td>GS_39_FEAT_DEV_APP</td>
           <td>0</td>
          <td>gs_39_feat_dev</td>
          <td>1586</td>
          <td>BEGIN PKG_PUB_APP_CONTEXT.P_SET_APP_USER(:1 ,:2 ,:3 ,:4 ,:5 ,:6 ,:7 ,:8 ,:9 ); END;</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1077" id="subForm_1077" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(32,1077,29185);"></input></td>
           <td>GS_39_FEAT_DEV_APP</td>
           <td>0</td>
          <td>gs_39_feat_dev</td>
          <td>1077</td>
          <td>BEGIN PKG_PUB_APP_CONTEXT.P_SET_APP_USER(:1 ,:2 ,:3 ,:4 ,:5 ,:6 ,:7 ,:8 ,:9 ); END;</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1228" id="subForm_1228" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(33,1228,15077);"></input></td>
           <td>ACR_311_FEAT_DEV_APP</td>
           <td>0</td>
          <td>acr_311_feat_dev</td>
          <td>1228</td>
          <td>BEGIN PKG_PUB_APP_CONTEXT.P_SET_APP_USER(:1 ,:2 ,:3 ,:4 ,:5 ,:6 ,:7 ,:8 ,:9 ); END;</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1574" id="subForm_1574" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(34,1574,17839);"></input></td>
           <td>GS_39_FEAT_TST_APP</td>
           <td>0</td>
          <td>gs_39_feat_tst</td>
          <td>1574</td>
          <td>BEGIN PKG_PUB_APP_CONTEXT.P_SET_APP_USER(:1 ,:2 ,:3 ,:4 ,:5 ,:6 ,:7 ,:8 ,:9 ); END;</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1153" id="subForm_1153" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(35,1153,12951);"></input></td>
           <td>GS_39_FEAT_TST_APP</td>
           <td>0</td>
          <td>gs_39_feat_tst</td>
          <td>1153</td>
          <td>BEGIN PKG_PUB_APP_CONTEXT.P_SET_APP_USER(:1 ,:2 ,:3 ,:4 ,:5 ,:6 ,:7 ,:8 ,:9 ); END;</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_220" id="subForm_220" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(36,220,26053);"></input></td>
           <td>AIGBR_TR_SIT_GC_APP</td>
           <td>0</td>
          <td>aigbr_tr_sit_gc</td>
          <td>220</td>
          <td>BEGIN PKG_PUB_PARA.clear_cache; END;</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_651" id="subForm_651" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(37,651,62165);"></input></td>
           <td>GS_39X_API_TST_APP</td>
           <td>0</td>
          <td>gs_39x_api_tst</td>
          <td>651</td>
          <td>BEGIN PKG_PUB_APP_CONTEXT.P_SET_APP_USER(:1 ,:2 ,:3 ,:4 ,:5 ,:6 ,:7 ,:8 ,:9 ); END;</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_24" id="subForm_24" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(38,24,10315);"></input></td>
           <td>GS_39X_API_TST_APP</td>
           <td>0</td>
          <td>gs_39x_api_tst</td>
          <td>24</td>
          <td>BEGIN PKG_PUB_APP_CONTEXT.P_SET_APP_USER(:1 ,:2 ,:3 ,:4 ,:5 ,:6 ,:7 ,:8 ,:9 ); END;</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_932" id="subForm_932" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(39,932,2909);"></input></td>
           <td>SEQUIS_PRE_PROD</td>
           <td>0</td>
          <td>null</td>
          <td>932</td>
          <td>BEGIN PKG_PUB_APP_CONTEXT.P_SET_ROLE_NAME_LIST(:1); END;</td>
          <td>SQL*Net message from client</td>
          <td>null</td>
          </tr>
	</form>
        
        <form name="subForm_1091" id="subForm_1091" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(40,1091,34967);"></input></td>
           <td>ACR_311_PRE_UAT_APP</td>
           <td>0</td>
          <td>acr_311_pre_uat</td>
          <td>1091</td>
          <td>BEGIN PKG_PUB_APP_CONTEXT.P_SET_APP_USER(:1 ,:2 ,:3 ,:4 ,:5 ,:6 ,:7 ,:8 ,:9 ); END;</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1945" id="subForm_1945" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(41,1945,6051);"></input></td>
           <td>ACR_311_PRE_UAT_APP</td>
           <td>0</td>
          <td>acr_311_pre_uat</td>
          <td>1945</td>
          <td>BEGIN PKG_PUB_APP_CONTEXT.P_SET_APP_USER(:1 ,:2 ,:3 ,:4 ,:5 ,:6 ,:7 ,:8 ,:9 ); END;</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_808" id="subForm_808" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(42,808,15339);"></input></td>
           <td>AIG_BR_AMS_PD_GC_APP</td>
           <td>0</td>
          <td>aig_br_ams_pd_gc</td>
          <td>808</td>
          <td>BEGIN PKG_PUB_PARA.clear_cache; END;</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1935" id="subForm_1935" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(43,1935,24191);"></input></td>
           <td>ACR_311_FEAT_TST_APP</td>
           <td>0</td>
          <td>acr_311_feat_tst</td>
          <td>1935</td>
          <td>BEGIN PKG_PUB_APP_CONTEXT.P_SET_APP_USER(:1 ,:2 ,:3 ,:4 ,:5 ,:6 ,:7 ,:8 ,:9 ); END;</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_2145" id="subForm_2145" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(44,2145,35227);"></input></td>
           <td>AIGBR_GW_MA_GC_APP</td>
           <td>0</td>
          <td>aigbr_gw_ma_gc</td>
          <td>2145</td>
          <td>BEGIN PKG_PUB_PARA.clear_cache; END;</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1010" id="subForm_1010" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(45,1010,45097);"></input></td>
           <td>AIG_BR_AMS_PD_QUO</td>
           <td>0</td>
          <td>aig_br_ams_pd_quo</td>
          <td>1010</td>
          <td>select S_QUOTE_CONTENT__CONTENT_ID.nextval from dual</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1496" id="subForm_1496" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(46,1496,22539);"></input></td>
           <td>AIG_BR_AMS_PD_QUO</td>
           <td>0</td>
          <td>aig_br_ams_pd_quo</td>
          <td>1496</td>
          <td>select S_QUOTE_INSURED__INSURED_ID.nextval from dual</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_286" id="subForm_286" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(47,286,5879);"></input></td>
           <td>SEG_LS_PRD_CFG_APP</td>
           <td>0</td>
          <td>seg_ls_prd_cfg</td>
          <td>286</td>
          <td>BEGIN PKG_PUB_APP_CONTEXT.P_SET_APP_USER(:1 ,:2 ,:3 ,:4 ,:5 ,:6 ,:7 ,:8 ,:9 ); END;</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_366" id="subForm_366" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(48,366,27477);"></input></td>
           <td>AIGBR_BWEB_GC_PREUAT_APP</td>
           <td>0</td>
          <td>aigbr_bweb_gc_preuat</td>
          <td>366</td>
          <td>BEGIN PKG_PUB_PARA.clear_cache; END;</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_728" id="subForm_728" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(49,728,4095);"></input></td>
           <td>DAHSING_P2_MT_TST_APP</td>
           <td>0</td>
          <td>dahsing_p2_mt_tst</td>
          <td>728</td>
          <td>update t_upc_batch_log set SUCCESS_INDI=:1 ,MESSAGE=:2 ,UPDATER_ID=:3 ,UPDATE_TIME=:4  where policy_id=:5 </td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_93" id="subForm_93" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(50,93,38597);"></input></td>
           <td>AIGBR_BWEB_GC_DEV_APP</td>
           <td>0</td>
          <td>aigbr_bweb_gc_dev</td>
          <td>93</td>
          <td>BEGIN PKG_PUB_PARA.clear_cache; END;</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1360" id="subForm_1360" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(51,1360,5999);"></input></td>
           <td>AIG_BR_AMS_PD_GS_APP</td>
           <td>0</td>
          <td>aig_br_ams_pd_gs</td>
          <td>1360</td>
          <td>select *    from t_gri_claim   where ced_claim_no = :1    and riskunit_id = :2 </td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_880" id="subForm_880" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(52,880,2517);"></input></td>
           <td>AIG_BR_AMS_PD_GS_APP</td>
           <td>0</td>
          <td>aig_br_ams_pd_gs</td>
          <td>880</td>
          <td>select *    from t_gri_claim   where ced_claim_no = :1    and riskunit_id = :2 </td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_2068" id="subForm_2068" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(53,2068,35801);"></input></td>
           <td>AIG_BR_AMS_PD_GS_APP</td>
           <td>0</td>
          <td>aig_br_ams_pd_gs</td>
          <td>2068</td>
          <td>select *    from t_gri_claim   where ced_claim_no = :1    and riskunit_id = :2 </td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_2087" id="subForm_2087" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(54,2087,4353);"></input></td>
           <td>AIG_BR_AMS_PD_GS_APP</td>
           <td>0</td>
          <td>aig_br_ams_pd_gs</td>
          <td>2087</td>
          <td>select distinct treaty_id,rein_organ_id from T_CTS_GRI_CLAIM_CASHCALL  where 1=1    and ri_claim_Id = :1 </td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1578" id="subForm_1578" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(55,1578,27899);"></input></td>
           <td>AIG_BR_AMS_PD_GS_APP</td>
           <td>0</td>
          <td>aig_br_ams_pd_gs</td>
          <td>1578</td>
          <td>select distinct treaty_id,rein_organ_id from T_CTS_GRI_CLAIM_CASHCALL  where 1=1    and ri_claim_Id = :1 </td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_654" id="subForm_654" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(56,654,15857);"></input></td>
           <td>AIG_BR_AMS_GS_TST_APP</td>
           <td>0</td>
          <td>aig_br_ams_gs_tst</td>
          <td>654</td>
          <td>BEGIN PKG_PUB_PARA.clear_cache; END;</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_6" id="subForm_6" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(57,6,37545);"></input></td>
           <td>AIG_BR_AMS_GS_TST_APP</td>
           <td>0</td>
          <td>aig_br_ams_gs_tst</td>
          <td>6</td>
          <td>BEGIN PKG_PUB_PARA.clear_cache; END;</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_91" id="subForm_91" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(58,91,11199);"></input></td>
           <td>AIGBR_GW_MA_GS_APP</td>
           <td>0</td>
          <td>aigbr_gw_ma_gs</td>
          <td>91</td>
          <td>BEGIN PKG_PUB_APP_CONTEXT.P_SET_ROLE_NAME_LIST(:1 ); END;</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_2" id="subForm_2" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(59,2,2707);"></input></td>
           <td>DAHSING_P2_MT_TST_APP</td>
           <td>0</td>
          <td>dahsing_p2_mt_tst</td>
          <td>2</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_3" id="subForm_3" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(60,3,41903);"></input></td>
           <td>AIG_BR_AMS_GC_TST_APP</td>
           <td>0</td>
          <td>aig_br_ams_gc_tst</td>
          <td>3</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_4" id="subForm_4" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(61,4,21447);"></input></td>
           <td>DAHSING_MT_PRE_UAT_APP</td>
           <td>0</td>
          <td>dahsing_mt_pre_uat</td>
          <td>4</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_7" id="subForm_7" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(62,7,56557);"></input></td>
           <td>ACR_311_PRE_UAT_APP</td>
           <td>0</td>
          <td>acr_311_pre_uat</td>
          <td>7</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_10" id="subForm_10" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(63,10,32133);"></input></td>
           <td>AIGBR_BWEB_GS_PREUAT_APP</td>
           <td>0</td>
          <td>aigbr_bweb_gs_preuat</td>
          <td>10</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_11" id="subForm_11" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(64,11,12891);"></input></td>
           <td>ACR_311_FEAT_DEV_APP</td>
           <td>0</td>
          <td>acr_311_feat_dev</td>
          <td>11</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_12" id="subForm_12" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(65,12,7069);"></input></td>
           <td>DAHSING_BIG_CR_TST_APP</td>
           <td>0</td>
          <td>dahsing_big_cr_tst</td>
          <td>12</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_13" id="subForm_13" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(66,13,39023);"></input></td>
           <td>DAHSING_P2_MT_TST_READ</td>
           <td>0</td>
          <td>miranda.jiang</td>
          <td>13</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_14" id="subForm_14" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(67,14,43749);"></input></td>
           <td>ACR_311_FEAT_TST_APP</td>
           <td>0</td>
          <td>acr_311_feat_tst</td>
          <td>14</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_15" id="subForm_15" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(68,15,16815);"></input></td>
           <td>SEQUIS_PRE_PROD</td>
           <td>0</td>
          <td>kevin.xu</td>
          <td>15</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_17" id="subForm_17" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(69,17,47025);"></input></td>
           <td>ACR_311_FEAT_DEV_APP</td>
           <td>0</td>
          <td>acr_311_feat_dev</td>
          <td>17</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>null</td>
          </tr>
	</form>
        
        <form name="subForm_18" id="subForm_18" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(70,18,38001);"></input></td>
           <td>DAHSING_P2_MT_DEV</td>
           <td>0</td>
          <td>jiajun.chen</td>
          <td>18</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_19" id="subForm_19" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(71,19,45839);"></input></td>
           <td>SEG_LS_PRD_CFG_APP</td>
           <td>0</td>
          <td>seg_ls_prd_cfg</td>
          <td>19</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_21" id="subForm_21" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(72,21,56447);"></input></td>
           <td>AIG_BR_AMS_PD_GC_APP</td>
           <td>0</td>
          <td>aig_br_ams_pd_gc</td>
          <td>21</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_23" id="subForm_23" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(73,23,22819);"></input></td>
           <td>DAHSING_P2_MT_DEV</td>
           <td>0</td>
          <td>qi.zhang</td>
          <td>23</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_25" id="subForm_25" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(74,25,9787);"></input></td>
           <td>AIGBR_GW_MA_GC</td>
           <td>0</td>
          <td>jiangtao.chen</td>
          <td>25</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_26" id="subForm_26" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(75,26,54239);"></input></td>
           <td>GS_39X_API_TST_APP</td>
           <td>0</td>
          <td>gs_39x_api_tst</td>
          <td>26</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_27" id="subForm_27" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(76,27,13361);"></input></td>
           <td>AIGBR_BWEB_GC_DEV_APP</td>
           <td>0</td>
          <td>aigbr_bweb_gc_dev</td>
          <td>27</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_72" id="subForm_72" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(77,72,27639);"></input></td>
           <td>AIG_BR_AMS_PD_GC_APP</td>
           <td>0</td>
          <td>aig_br_ams_pd_gc</td>
          <td>72</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_73" id="subForm_73" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(78,73,9185);"></input></td>
           <td>AIGBR_NA_TST_RP_APP</td>
           <td>0</td>
          <td>aigbr_na_tst_rp</td>
          <td>73</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_77" id="subForm_77" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(79,77,47593);"></input></td>
           <td>DAHSING_P2_MT_TST_READ</td>
           <td>0</td>
          <td>angela.xue</td>
          <td>77</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_78" id="subForm_78" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(80,78,26865);"></input></td>
           <td>DAHSING_P2_MT_DEV_APP</td>
           <td>0</td>
          <td>dahsing_p2_mt_dev</td>
          <td>78</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_79" id="subForm_79" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(81,79,53303);"></input></td>
           <td>AIGBR_GW_MA_GS_APP</td>
           <td>0</td>
          <td>aigbr_gw_ma_gs</td>
          <td>79</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_80" id="subForm_80" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(82,80,5111);"></input></td>
           <td>AIGBR_GW_MA_GS</td>
           <td>0</td>
          <td>pei.zhou</td>
          <td>80</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_81" id="subForm_81" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(83,81,4091);"></input></td>
           <td>AIGBR_NA_TST_GS_APP</td>
           <td>0</td>
          <td>aigbr_na_tst_gs</td>
          <td>81</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_83" id="subForm_83" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(84,83,44571);"></input></td>
           <td>GS_39_FEAT_DEV_APP</td>
           <td>0</td>
          <td>gs_39_feat_dev</td>
          <td>83</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_84" id="subForm_84" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(85,84,58245);"></input></td>
           <td>DAHSING_P2_MT_DEV_APP</td>
           <td>0</td>
          <td>dahsing_p2_mt_dev</td>
          <td>84</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_85" id="subForm_85" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(86,85,38279);"></input></td>
           <td>AIG_BR_AMS_PD_GC_APP</td>
           <td>0</td>
          <td>aig_br_ams_pd_gc</td>
          <td>85</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_86" id="subForm_86" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(87,86,50217);"></input></td>
           <td>SEQUIS_PRE_PROD</td>
           <td>0</td>
          <td>shoujie.xie</td>
          <td>86</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_87" id="subForm_87" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(88,87,33429);"></input></td>
           <td>AIGBR_NA_TST_RP_APP</td>
           <td>0</td>
          <td>aigbr_na_tst_rp</td>
          <td>87</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_88" id="subForm_88" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(89,88,539);"></input></td>
           <td>AIGBR_TR_SIT_GS_APP</td>
           <td>0</td>
          <td>aigbr_tr_sit_gs</td>
          <td>88</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_89" id="subForm_89" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(90,89,7359);"></input></td>
           <td>AIGBR_NA_DEV_GS</td>
           <td>0</td>
          <td>ying.chen</td>
          <td>89</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_90" id="subForm_90" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(91,90,1225);"></input></td>
           <td>GS_39_FEAT_TST_APP</td>
           <td>0</td>
          <td>gs_39_feat_tst</td>
          <td>90</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_94" id="subForm_94" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(92,94,45743);"></input></td>
           <td>AIGBR_BWEB_GS_TST_APP</td>
           <td>0</td>
          <td>aigbr_bweb_gs_tst</td>
          <td>94</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_95" id="subForm_95" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(93,95,9075);"></input></td>
           <td>ACR_311_FEAT_TST_APP</td>
           <td>0</td>
          <td>acr_311_feat_tst</td>
          <td>95</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_96" id="subForm_96" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(94,96,31857);"></input></td>
           <td>AIG_BR_AMS_GS_TST_APP</td>
           <td>0</td>
          <td>aig_br_ams_gs_tst</td>
          <td>96</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_145" id="subForm_145" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(95,145,29321);"></input></td>
           <td>AIGBR_BWEB_GC_PREUAT_APP</td>
           <td>0</td>
          <td>aigbr_bweb_gc_preuat</td>
          <td>145</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_146" id="subForm_146" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(96,146,17501);"></input></td>
           <td>DAHSING_P2_MT_DEV_APP</td>
           <td>0</td>
          <td>dahsing_p2_mt_dev</td>
          <td>146</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_147" id="subForm_147" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(97,147,28929);"></input></td>
           <td>AIGBR_NA_DEV_GS</td>
           <td>0</td>
          <td>hao.du</td>
          <td>147</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_149" id="subForm_149" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(98,149,1795);"></input></td>
           <td>AIG_BR_AMS_PD_GC_APP</td>
           <td>0</td>
          <td>aig_br_ams_pd_gc</td>
          <td>149</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_151" id="subForm_151" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(99,151,58859);"></input></td>
           <td>DAHSING_BIG_CR_TST_APP</td>
           <td>0</td>
          <td>dahsing_big_cr_tst</td>
          <td>151</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_152" id="subForm_152" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(100,152,55895);"></input></td>
           <td>AIGBR_NA_TST_GS_APP</td>
           <td>0</td>
          <td>aigbr_na_tst_gs</td>
          <td>152</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_155" id="subForm_155" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(101,155,5919);"></input></td>
           <td>DAHSING_P2_MT_TST_APP</td>
           <td>0</td>
          <td>dahsing_p2_mt_tst</td>
          <td>155</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_156" id="subForm_156" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(102,156,147);"></input></td>
           <td>GS_39_FEAT_TST_APP</td>
           <td>0</td>
          <td>gs_39_feat_tst</td>
          <td>156</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>null</td>
          </tr>
	</form>
        
        <form name="subForm_157" id="subForm_157" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(103,157,24367);"></input></td>
           <td>SEG_LS_PRD_CFG_READ</td>
           <td>0</td>
          <td>xiaoan.feng</td>
          <td>157</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_158" id="subForm_158" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(104,158,21283);"></input></td>
           <td>GS_39_FEAT_DEV_APP</td>
           <td>0</td>
          <td>gs_39_feat_dev</td>
          <td>158</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_159" id="subForm_159" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(105,159,55995);"></input></td>
           <td>CKI_DEV</td>
           <td>0</td>
          <td>johnson.ni</td>
          <td>159</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_161" id="subForm_161" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(106,161,58889);"></input></td>
           <td>DAHSING_P2_MT_TST_READ</td>
           <td>0</td>
          <td>angela.xue</td>
          <td>161</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_163" id="subForm_163" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(107,163,1039);"></input></td>
           <td>DAHSING_P2_MT_DEV_APP</td>
           <td>0</td>
          <td>dahsing_p2_mt_dev</td>
          <td>163</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_164" id="subForm_164" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(108,164,12857);"></input></td>
           <td>AIG_BR_AMS_GS_TST_APP</td>
           <td>0</td>
          <td>aig_br_ams_gs_tst</td>
          <td>164</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_166" id="subForm_166" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(109,166,36427);"></input></td>
           <td>AIGBR_NA_TST_RP_APP</td>
           <td>0</td>
          <td>aigbr_na_tst_rp</td>
          <td>166</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_168" id="subForm_168" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(110,168,39299);"></input></td>
           <td>DAHSING_P2_MT_DEV</td>
           <td>0</td>
          <td>qi.zhang</td>
          <td>168</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_169" id="subForm_169" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(111,169,9461);"></input></td>
           <td>DAHSING_P2_MT_DEV</td>
           <td>0</td>
          <td>qi.zhang</td>
          <td>169</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_171" id="subForm_171" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(112,171,31187);"></input></td>
           <td>AIGBR_TR_SIT_GC_APP</td>
           <td>0</td>
          <td>aigbr_tr_sit_gc</td>
          <td>171</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_172" id="subForm_172" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(113,172,64983);"></input></td>
           <td>GS_39_FEAT_DEV_APP</td>
           <td>0</td>
          <td>gs_39_feat_dev</td>
          <td>172</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_173" id="subForm_173" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(114,173,1431);"></input></td>
           <td>AIGBR_GW_MA_GC_APP</td>
           <td>0</td>
          <td>aigbr_gw_ma_gc</td>
          <td>173</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_215" id="subForm_215" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(115,215,54663);"></input></td>
           <td>AIGBR_BWEB_GC_DEV_APP</td>
           <td>0</td>
          <td>aigbr_bweb_gc_dev</td>
          <td>215</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_216" id="subForm_216" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(116,216,46189);"></input></td>
           <td>AIGBR_BWEB_GC_DEV_APP</td>
           <td>0</td>
          <td>aigbr_bweb_gc_dev</td>
          <td>216</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_217" id="subForm_217" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(117,217,47023);"></input></td>
           <td>DAHSING_P2_MT_TST_APP</td>
           <td>0</td>
          <td>dahsing_p2_mt_tst</td>
          <td>217</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_218" id="subForm_218" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(118,218,56579);"></input></td>
           <td>DAHSING_P2_MT_DEV</td>
           <td>0</td>
          <td>jiajun.chen</td>
          <td>218</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_219" id="subForm_219" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(119,219,36253);"></input></td>
           <td>ACR_311_FEAT_DEV_APP</td>
           <td>0</td>
          <td>acr_311_feat_dev</td>
          <td>219</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>null</td>
          </tr>
	</form>
        
        <form name="subForm_221" id="subForm_221" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(120,221,3229);"></input></td>
           <td>AIGBR_NA_TST_RP_APP</td>
           <td>0</td>
          <td>aigbr_na_tst_rp</td>
          <td>221</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_223" id="subForm_223" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(121,223,12955);"></input></td>
           <td>AIGBR_BWEB_GS_DEV</td>
           <td>0</td>
          <td>lei.xu</td>
          <td>223</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_224" id="subForm_224" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(122,224,40083);"></input></td>
           <td>AIG_BR_AMS_GC_TST_APP</td>
           <td>0</td>
          <td>aig_br_ams_gc_tst</td>
          <td>224</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_225" id="subForm_225" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(123,225,16589);"></input></td>
           <td>SEQUIS_PRE_PROD</td>
           <td>0</td>
          <td>shoujie.xie</td>
          <td>225</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_227" id="subForm_227" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(124,227,45119);"></input></td>
           <td>AIGBR_TR_SIT_GC_APP</td>
           <td>0</td>
          <td>aigbr_tr_sit_gc</td>
          <td>227</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_228" id="subForm_228" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(125,228,46821);"></input></td>
           <td>AIG_BR_AMS_GS_TST_APP</td>
           <td>0</td>
          <td>aig_br_ams_gs_tst</td>
          <td>228</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_230" id="subForm_230" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(126,230,15797);"></input></td>
           <td>AIG_BR_AMS_PD_GC_APP</td>
           <td>0</td>
          <td>aig_br_ams_pd_gc</td>
          <td>230</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_231" id="subForm_231" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(127,231,35493);"></input></td>
           <td>CKI_DEV</td>
           <td>0</td>
          <td>mike.chen</td>
          <td>231</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>ddm.exe</td>
          </tr>
	</form>
        
        <form name="subForm_232" id="subForm_232" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(128,232,61243);"></input></td>
           <td>DAHSING_P2_MT_DEV_APP</td>
           <td>0</td>
          <td>dahsing_p2_mt_dev</td>
          <td>232</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_233" id="subForm_233" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(129,233,52717);"></input></td>
           <td>CKI_DEV</td>
           <td>0</td>
          <td>johnson.ni</td>
          <td>233</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_236" id="subForm_236" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(130,236,8641);"></input></td>
           <td>AIGBR_BWEB_GC_PREUAT_APP</td>
           <td>0</td>
          <td>aigbr_bweb_gc_preuat</td>
          <td>236</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_237" id="subForm_237" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(131,237,35579);"></input></td>
           <td>AIGBR_GW_MA_GC_APP</td>
           <td>0</td>
          <td>aigbr_gw_ma_gc</td>
          <td>237</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_239" id="subForm_239" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(132,239,44443);"></input></td>
           <td>AIGBR_GW_MA_GC_APP</td>
           <td>0</td>
          <td>aigbr_gw_ma_gc</td>
          <td>239</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_240" id="subForm_240" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(133,240,18325);"></input></td>
           <td>GS_39X_API_TST_APP</td>
           <td>0</td>
          <td>gs_39x_api_tst</td>
          <td>240</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_287" id="subForm_287" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(134,287,42629);"></input></td>
           <td>AIGBR_NA_DEV_GS</td>
           <td>0</td>
          <td>chengbin.sui</td>
          <td>287</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_288" id="subForm_288" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(135,288,4663);"></input></td>
           <td>DAHSING_MT_PRE_UAT_APP</td>
           <td>0</td>
          <td>dahsing_mt_pre_uat</td>
          <td>288</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_289" id="subForm_289" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(136,289,12425);"></input></td>
           <td>DAHSING_P2_MT_DEV</td>
           <td>0</td>
          <td>chuandong.qi</td>
          <td>289</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_290" id="subForm_290" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(137,290,50827);"></input></td>
           <td>AIG_BR_AMS_PD_GS_APP</td>
           <td>0</td>
          <td>aig_br_ams_pd_gs</td>
          <td>290</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_291" id="subForm_291" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(138,291,59025);"></input></td>
           <td>GS_39_FEAT_TST_APP</td>
           <td>0</td>
          <td>gs_39_feat_tst</td>
          <td>291</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_292" id="subForm_292" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(139,292,24589);"></input></td>
           <td>GS_39_FEAT_TST_APP</td>
           <td>0</td>
          <td>gs_39_feat_tst</td>
          <td>292</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>null</td>
          </tr>
	</form>
        
        <form name="subForm_293" id="subForm_293" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(140,293,40579);"></input></td>
           <td>GS_39_FEAT_TST_APP</td>
           <td>0</td>
          <td>gs_39_feat_tst</td>
          <td>293</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_294" id="subForm_294" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(141,294,28285);"></input></td>
           <td>ACR_311_FEAT_DEV_APP</td>
           <td>0</td>
          <td>acr_311_feat_dev</td>
          <td>294</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_296" id="subForm_296" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(142,296,62475);"></input></td>
           <td>AIGBR_NA_DEV_GS</td>
           <td>0</td>
          <td>hao.du</td>
          <td>296</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_298" id="subForm_298" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(143,298,22621);"></input></td>
           <td>AIGBR_GW_MA_GC_APP</td>
           <td>0</td>
          <td>aigbr_gw_ma_gc</td>
          <td>298</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_299" id="subForm_299" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(144,299,60061);"></input></td>
           <td>AIGBR_BWEB_GC_PREUAT_APP</td>
           <td>0</td>
          <td>aigbr_bweb_gc_preuat</td>
          <td>299</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_301" id="subForm_301" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(145,301,62009);"></input></td>
           <td>AIGBR_BWEB_GC_TST_APP</td>
           <td>0</td>
          <td>aigbr_bweb_gc_tst</td>
          <td>301</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_302" id="subForm_302" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(146,302,62571);"></input></td>
           <td>GS_39_FEAT_TST_APP</td>
           <td>0</td>
          <td>gs_39_feat_tst</td>
          <td>302</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_304" id="subForm_304" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(147,304,40501);"></input></td>
           <td>DAHSING_P2_MT_TST</td>
           <td>0</td>
          <td>xiuli.yu</td>
          <td>304</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_306" id="subForm_306" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(148,306,20407);"></input></td>
           <td>SEG_LS_PRD_CFG_APP</td>
           <td>0</td>
          <td>seg_ls_prd_cfg</td>
          <td>306</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_307" id="subForm_307" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(149,307,5813);"></input></td>
           <td>AIGBR_NA_TST_RP_APP</td>
           <td>0</td>
          <td>aigbr_na_tst_rp</td>
          <td>307</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_308" id="subForm_308" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(150,308,51069);"></input></td>
           <td>AIGBR_NA_DEV_RP_APP</td>
           <td>0</td>
          <td>aigbr_na_dev_rp</td>
          <td>308</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_310" id="subForm_310" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(151,310,14619);"></input></td>
           <td>DAHSING_BIG_CR_TST_APP</td>
           <td>0</td>
          <td>dahsing_big_cr_tst</td>
          <td>310</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_311" id="subForm_311" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(152,311,52183);"></input></td>
           <td>AIGBR_NA_DEV_GS_APP</td>
           <td>0</td>
          <td>aigbr_na_dev_gs</td>
          <td>311</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_358" id="subForm_358" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(153,358,29293);"></input></td>
           <td>CKI_DEV_APP</td>
           <td>0</td>
          <td>cki_dev</td>
          <td>358</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_359" id="subForm_359" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(154,359,18485);"></input></td>
           <td>AIGBR_GW_MA_GS</td>
           <td>0</td>
          <td>pengchao.wang</td>
          <td>359</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_360" id="subForm_360" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(155,360,45853);"></input></td>
           <td>GS_39X_API_TST_APP</td>
           <td>0</td>
          <td>gs_39x_api_tst</td>
          <td>360</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_361" id="subForm_361" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(156,361,64471);"></input></td>
           <td>AIG_BR_AMS_GS_TST_APP</td>
           <td>0</td>
          <td>aig_br_ams_gs_tst</td>
          <td>361</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_362" id="subForm_362" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(157,362,22967);"></input></td>
           <td>SEG_LS_PRD_CFG_APP</td>
           <td>0</td>
          <td>seg_ls_prd_cfg</td>
          <td>362</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_363" id="subForm_363" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(158,363,62217);"></input></td>
           <td>AIG_BR_AMS_PD_GC_APP</td>
           <td>0</td>
          <td>aig_br_ams_pd_gc</td>
          <td>363</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_365" id="subForm_365" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(159,365,60167);"></input></td>
           <td>GS_39_FEAT_DEV_APP</td>
           <td>0</td>
          <td>gs_39_feat_dev</td>
          <td>365</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_367" id="subForm_367" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(160,367,9237);"></input></td>
           <td>DAHSING_MT_PRE_UAT_APP</td>
           <td>0</td>
          <td>dahsing_mt_pre_uat</td>
          <td>367</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_368" id="subForm_368" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(161,368,2263);"></input></td>
           <td>DAHSING_BIG_CR_DEV</td>
           <td>0</td>
          <td>chuandong.qi</td>
          <td>368</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_369" id="subForm_369" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(162,369,48531);"></input></td>
           <td>DAHSING_P2_MT_TST_READ</td>
           <td>0</td>
          <td>xiuli.yu</td>
          <td>369</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_370" id="subForm_370" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(163,370,10291);"></input></td>
           <td>AIGBR_GW_MA_GC_APP</td>
           <td>0</td>
          <td>aigbr_gw_ma_gc</td>
          <td>370</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_374" id="subForm_374" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(164,374,19183);"></input></td>
           <td>SEG_LS_PRD_CFG</td>
           <td>0</td>
          <td>hao.xu</td>
          <td>374</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_375" id="subForm_375" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(165,375,24289);"></input></td>
           <td>GS_39X_API_TST_APP</td>
           <td>0</td>
          <td>gs_39x_api_tst</td>
          <td>375</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_376" id="subForm_376" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(166,376,46815);"></input></td>
           <td>ACR_311_FEAT_TST_APP</td>
           <td>0</td>
          <td>acr_311_feat_tst</td>
          <td>376</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_377" id="subForm_377" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(167,377,32617);"></input></td>
           <td>AIGBR_BWEB_GS_DEV_APP</td>
           <td>0</td>
          <td>aigbr_bweb_gs_dev</td>
          <td>377</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_378" id="subForm_378" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(168,378,19167);"></input></td>
           <td>ACR_311_FEAT_TST_APP</td>
           <td>0</td>
          <td>acr_311_feat_tst</td>
          <td>378</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_381" id="subForm_381" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(169,381,11875);"></input></td>
           <td>AIG_BR_AMS_PD_RP_APP</td>
           <td>0</td>
          <td>aig_br_ams_pd_rp</td>
          <td>381</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_428" id="subForm_428" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(170,428,1219);"></input></td>
           <td>AIGBR_GW_MA_GC_APP</td>
           <td>0</td>
          <td>aigbr_gw_ma_gc</td>
          <td>428</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_429" id="subForm_429" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(171,429,59061);"></input></td>
           <td>AIG_BR_AMS_PD_GC_APP</td>
           <td>0</td>
          <td>aig_br_ams_pd_gc</td>
          <td>429</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_431" id="subForm_431" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(172,431,3181);"></input></td>
           <td>DAHSING_P2_MT_TST_READ</td>
           <td>0</td>
          <td>chuandong.qi</td>
          <td>431</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_432" id="subForm_432" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(173,432,65447);"></input></td>
           <td>DAHSING_P2_MT_DEV</td>
           <td>0</td>
          <td>jiajun.chen</td>
          <td>432</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_433" id="subForm_433" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(174,433,46369);"></input></td>
           <td>AIGBR_BWEB_GC_PREUAT_APP</td>
           <td>0</td>
          <td>aigbr_bweb_gc_preuat</td>
          <td>433</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_434" id="subForm_434" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(175,434,20771);"></input></td>
           <td>SEQUIS_PRE_PROD</td>
           <td>0</td>
          <td>null</td>
          <td>434</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>null</td>
          </tr>
	</form>
        
        <form name="subForm_435" id="subForm_435" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(176,435,7671);"></input></td>
           <td>AIG_BR_AMS_RP_TST_APP</td>
           <td>0</td>
          <td>aig_br_ams_rp_tst</td>
          <td>435</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_436" id="subForm_436" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(177,436,1133);"></input></td>
           <td>DAHSING_P2_MT_DEV_APP</td>
           <td>0</td>
          <td>dahsing_p2_mt_dev</td>
          <td>436</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_438" id="subForm_438" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(178,438,6871);"></input></td>
           <td>DAHSING_BIG_CR_DEV_APP</td>
           <td>0</td>
          <td>dahsing_big_cr_dev</td>
          <td>438</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_441" id="subForm_441" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(179,441,42879);"></input></td>
           <td>ACR_311_FEAT_DEV_APP</td>
           <td>0</td>
          <td>acr_311_feat_dev</td>
          <td>441</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_442" id="subForm_442" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(180,442,5305);"></input></td>
           <td>DAHSING_P2_MT_DEV</td>
           <td>0</td>
          <td>jiajun.chen</td>
          <td>442</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_443" id="subForm_443" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(181,443,51453);"></input></td>
           <td>DAHSING_P2_MT_TST_READ</td>
           <td>0</td>
          <td>zhijie.shen</td>
          <td>443</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_444" id="subForm_444" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(182,444,41065);"></input></td>
           <td>AIGBR_NA_DEV_GS</td>
           <td>0</td>
          <td>ben.lu</td>
          <td>444</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_446" id="subForm_446" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(183,446,13525);"></input></td>
           <td>ACR_311_FEAT_DEV_APP</td>
           <td>0</td>
          <td>acr_311_feat_dev</td>
          <td>446</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_448" id="subForm_448" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(184,448,42467);"></input></td>
           <td>AIGBR_BWEB_GC_PREUAT_APP</td>
           <td>0</td>
          <td>aigbr_bweb_gc_preuat</td>
          <td>448</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_450" id="subForm_450" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(185,450,61281);"></input></td>
           <td>GS_39_FEAT_DEV_APP</td>
           <td>0</td>
          <td>gs_39_feat_dev</td>
          <td>450</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_451" id="subForm_451" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(186,451,2721);"></input></td>
           <td>AIG_BR_AMS_PD_RP_APP</td>
           <td>0</td>
          <td>aig_br_ams_pd_rp</td>
          <td>451</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_452" id="subForm_452" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(187,452,17065);"></input></td>
           <td>AIGBR_BWEB_GC_PREUAT_APP</td>
           <td>0</td>
          <td>aigbr_bweb_gc_preuat</td>
          <td>452</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_501" id="subForm_501" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(188,501,46865);"></input></td>
           <td>SEQUIS_PRE_PROD</td>
           <td>0</td>
          <td>kevin.xu</td>
          <td>501</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_502" id="subForm_502" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(189,502,45777);"></input></td>
           <td>DAHSING_P2_MT_DEV</td>
           <td>0</td>
          <td>chuandong.qi</td>
          <td>502</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_506" id="subForm_506" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(190,506,16047);"></input></td>
           <td>DAHSING_P2_MT_DEV</td>
           <td>0</td>
          <td>jiajun.chen</td>
          <td>506</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_507" id="subForm_507" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(191,507,52303);"></input></td>
           <td>AIGBR_NA_TST_GS_APP</td>
           <td>0</td>
          <td>Administrator</td>
          <td>507</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>eBaoPrintService.exe</td>
          </tr>
	</form>
        
        <form name="subForm_508" id="subForm_508" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(192,508,32275);"></input></td>
           <td>SEG_LS_PRD_CFG_APP</td>
           <td>0</td>
          <td>seg_ls_prd_cfg</td>
          <td>508</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_509" id="subForm_509" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(193,509,30521);"></input></td>
           <td>GS_39X_API_TST_APP</td>
           <td>0</td>
          <td>gs_39x_api_tst</td>
          <td>509</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_510" id="subForm_510" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(194,510,1357);"></input></td>
           <td>AIGBR_BWEB_GC_DEV_APP</td>
           <td>0</td>
          <td>aigbr_bweb_gc_dev</td>
          <td>510</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_511" id="subForm_511" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(195,511,2643);"></input></td>
           <td>DBADMIN</td>
           <td>0</td>
          <td>allen.zhang</td>
          <td>511</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_512" id="subForm_512" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(196,512,59833);"></input></td>
           <td>AIGBR_NA_DEV_GS</td>
           <td>0</td>
          <td>ying.chen</td>
          <td>512</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_514" id="subForm_514" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(197,514,16599);"></input></td>
           <td>SEG_LS_PRD_CFG_APP</td>
           <td>0</td>
          <td>seg_ls_prd_cfg</td>
          <td>514</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_517" id="subForm_517" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(198,517,7805);"></input></td>
           <td>AIG_BR_AMS_PD_GC_APP</td>
           <td>0</td>
          <td>aig_br_ams_pd_gc</td>
          <td>517</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_518" id="subForm_518" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(199,518,31857);"></input></td>
           <td>DAHSING_P2_MT_TST_APP</td>
           <td>0</td>
          <td>dahsing_p2_mt_tst</td>
          <td>518</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_519" id="subForm_519" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(200,519,5745);"></input></td>
           <td>ACR_311_FEAT_TST_APP</td>
           <td>0</td>
          <td>acr_311_feat_tst</td>
          <td>519</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_521" id="subForm_521" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(201,521,13223);"></input></td>
           <td>GS_39X_API_TST_APP</td>
           <td>0</td>
          <td>gs_39x_api_tst</td>
          <td>521</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_522" id="subForm_522" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(202,522,55227);"></input></td>
           <td>DAHSING_MT_PRE_UAT_APP</td>
           <td>0</td>
          <td>dahsing_mt_pre_uat</td>
          <td>522</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_524" id="subForm_524" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(203,524,12589);"></input></td>
           <td>AIG_BR_AMS_GS_TST_APP</td>
           <td>0</td>
          <td>aig_br_ams_gs_tst</td>
          <td>524</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_526" id="subForm_526" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(204,526,2481);"></input></td>
           <td>SEG_LS_PRD_CFG_READ</td>
           <td>0</td>
          <td>xiaoan.feng</td>
          <td>526</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_527" id="subForm_527" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(205,527,22721);"></input></td>
           <td>GS_39_FEAT_DEV_APP</td>
           <td>0</td>
          <td>gs_39_feat_dev</td>
          <td>527</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_570" id="subForm_570" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(206,570,43711);"></input></td>
           <td>DAHSING_BIG_CR_TST_APP</td>
           <td>0</td>
          <td>dahsing_big_cr_tst</td>
          <td>570</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_571" id="subForm_571" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(207,571,45967);"></input></td>
           <td>AIG_BR_AMS_GC_TST_APP</td>
           <td>0</td>
          <td>aig_br_ams_gc_tst</td>
          <td>571</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_573" id="subForm_573" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(208,573,19731);"></input></td>
           <td>SEG_LS_PRD_CFG_APP</td>
           <td>0</td>
          <td>seg_ls_prd_cfg</td>
          <td>573</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_574" id="subForm_574" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(209,574,62963);"></input></td>
           <td>GS_39_FEAT_TST_APP</td>
           <td>0</td>
          <td>gs_39_feat_tst</td>
          <td>574</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_575" id="subForm_575" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(210,575,62757);"></input></td>
           <td>DAHSING_P2_MT_TST_APP</td>
           <td>0</td>
          <td>dahsing_p2_mt_tst</td>
          <td>575</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_576" id="subForm_576" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(211,576,56969);"></input></td>
           <td>ACR_311_FEAT_TST_APP</td>
           <td>0</td>
          <td>acr_311_feat_tst</td>
          <td>576</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>null</td>
          </tr>
	</form>
        
        <form name="subForm_577" id="subForm_577" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(212,577,30539);"></input></td>
           <td>GS_39_FEAT_DEV</td>
           <td>0</td>
          <td>jingdong.wang</td>
          <td>577</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_578" id="subForm_578" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(213,578,49683);"></input></td>
           <td>AIGBR_BWEB_GC_TST_APP</td>
           <td>0</td>
          <td>aigbr_bweb_gc_tst</td>
          <td>578</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_579" id="subForm_579" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(214,579,32059);"></input></td>
           <td>AIG_BR_AMS_RP_TST_APP</td>
           <td>0</td>
          <td>aig_br_ams_rp_tst</td>
          <td>579</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_581" id="subForm_581" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(215,581,48117);"></input></td>
           <td>AIGBR_NA_DEV_GS_APP</td>
           <td>0</td>
          <td>aigbr_na_dev_gs</td>
          <td>581</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_583" id="subForm_583" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(216,583,24981);"></input></td>
           <td>AIGBR_NA_DEV_RP_APP</td>
           <td>0</td>
          <td>aigbr_na_dev_rp</td>
          <td>583</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_586" id="subForm_586" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(217,586,58191);"></input></td>
           <td>AIGBR_BWEB_GC_PREUAT_APP</td>
           <td>0</td>
          <td>aigbr_bweb_gc_preuat</td>
          <td>586</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_587" id="subForm_587" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(218,587,19175);"></input></td>
           <td>ACR_311_FEAT_TST_APP</td>
           <td>0</td>
          <td>acr_311_feat_tst</td>
          <td>587</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_588" id="subForm_588" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(219,588,20251);"></input></td>
           <td>AIGBR_NA_DEV_RP_APP</td>
           <td>0</td>
          <td>aigbr_na_dev_rp</td>
          <td>588</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_589" id="subForm_589" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(220,589,22545);"></input></td>
           <td>SEQUIS_PRE_PROD</td>
           <td>0</td>
          <td>kevin.xu</td>
          <td>589</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_591" id="subForm_591" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(221,591,41851);"></input></td>
           <td>AIGBR_NA_TST_RP_APP</td>
           <td>0</td>
          <td>aigbr_na_tst_rp</td>
          <td>591</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_592" id="subForm_592" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(222,592,10893);"></input></td>
           <td>AIGBR_NA_DEV_GS</td>
           <td>0</td>
          <td>hongming.liu</td>
          <td>592</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>ob9.exe</td>
          </tr>
	</form>
        
        <form name="subForm_593" id="subForm_593" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(223,593,32005);"></input></td>
           <td>AIGBR_NA_DEV_GS</td>
           <td>0</td>
          <td>ben.lu</td>
          <td>593</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_594" id="subForm_594" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(224,594,30613);"></input></td>
           <td>ACR_311_FEAT_DEV_APP</td>
           <td>0</td>
          <td>acr_311_feat_dev</td>
          <td>594</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_641" id="subForm_641" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(225,641,23555);"></input></td>
           <td>AIGBR_BWEB_GC_DEV_APP</td>
           <td>0</td>
          <td>aigbr_bweb_gc_dev</td>
          <td>641</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_643" id="subForm_643" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(226,643,48885);"></input></td>
           <td>DAHSING_P2_MT_TST_READ</td>
           <td>0</td>
          <td>xiuli.yu</td>
          <td>643</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_644" id="subForm_644" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(227,644,63271);"></input></td>
           <td>GS_39_FEAT_DEV_APP</td>
           <td>0</td>
          <td>gs_39_feat_dev</td>
          <td>644</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>null</td>
          </tr>
	</form>
        
        <form name="subForm_646" id="subForm_646" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(228,646,35201);"></input></td>
           <td>SEQUIS_PRE_PROD</td>
           <td>0</td>
          <td>null</td>
          <td>646</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>null</td>
          </tr>
	</form>
        
        <form name="subForm_647" id="subForm_647" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(229,647,49783);"></input></td>
           <td>AIG_BR_AMS_GS_TST_APP</td>
           <td>0</td>
          <td>aig_br_ams_gs_tst</td>
          <td>647</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_648" id="subForm_648" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(230,648,17767);"></input></td>
           <td>DAHSING_P2_MT_DEV</td>
           <td>0</td>
          <td>chuandong.qi</td>
          <td>648</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_653" id="subForm_653" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(231,653,29367);"></input></td>
           <td>DAHSING_P2_MT_DEV_APP</td>
           <td>0</td>
          <td>dahsing_p2_mt_dev</td>
          <td>653</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_655" id="subForm_655" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(232,655,38545);"></input></td>
           <td>AIG_BR_AMS_PD_RP_APP</td>
           <td>0</td>
          <td>aig_br_ams_pd_rp</td>
          <td>655</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_656" id="subForm_656" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(233,656,87);"></input></td>
           <td>AIGBR_TR_SIT_GC_APP</td>
           <td>0</td>
          <td>aigbr_tr_sit_gc</td>
          <td>656</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_657" id="subForm_657" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(234,657,9839);"></input></td>
           <td>AIGBR_BWEB_GS_DEV</td>
           <td>0</td>
          <td>yundan.zhang</td>
          <td>657</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_658" id="subForm_658" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(235,658,18791);"></input></td>
           <td>SEQUIS_PRE_PROD</td>
           <td>0</td>
          <td>shoujie.xie</td>
          <td>658</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_659" id="subForm_659" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(236,659,7063);"></input></td>
           <td>AIGBR_BWEB_GS_DEV</td>
           <td>0</td>
          <td>lei.xu</td>
          <td>659</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_660" id="subForm_660" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(237,660,48845);"></input></td>
           <td>DAHSING_P2_MT_TST</td>
           <td>0</td>
          <td>xiuli.yu</td>
          <td>660</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_661" id="subForm_661" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(238,661,17663);"></input></td>
           <td>ACR_311_FEAT_DEV_APP</td>
           <td>0</td>
          <td>acr_311_feat_dev</td>
          <td>661</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_662" id="subForm_662" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(239,662,5655);"></input></td>
           <td>AIGBR_NA_DEV_RP_APP</td>
           <td>0</td>
          <td>aigbr_na_dev_rp</td>
          <td>662</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_664" id="subForm_664" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(240,664,23245);"></input></td>
           <td>AIGBR_NA_DEV_GS_APP</td>
           <td>0</td>
          <td>aigbr_na_dev_gs</td>
          <td>664</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_666" id="subForm_666" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(241,666,8983);"></input></td>
           <td>AIGBR_NA_DEV_RP_APP</td>
           <td>0</td>
          <td>aigbr_na_dev_rp</td>
          <td>666</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_667" id="subForm_667" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(242,667,25153);"></input></td>
           <td>AIG_BR_AMS_GS_TST_APP</td>
           <td>0</td>
          <td>aig_br_ams_gs_tst</td>
          <td>667</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_714" id="subForm_714" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(243,714,63975);"></input></td>
           <td>AIG_BR_AMS_PD_RP_APP</td>
           <td>0</td>
          <td>aig_br_ams_pd_rp</td>
          <td>714</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_715" id="subForm_715" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(244,715,1713);"></input></td>
           <td>SEQUIS_PRE_PROD</td>
           <td>0</td>
          <td>null</td>
          <td>715</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>null</td>
          </tr>
	</form>
        
        <form name="subForm_716" id="subForm_716" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(245,716,24605);"></input></td>
           <td>ACR_311_FEAT_DEV_APP</td>
           <td>0</td>
          <td>acr_311_feat_dev</td>
          <td>716</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_717" id="subForm_717" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(246,717,13741);"></input></td>
           <td>AIG_BR_AMS_RP_TST_APP</td>
           <td>0</td>
          <td>aig_br_ams_rp_tst</td>
          <td>717</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_718" id="subForm_718" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(247,718,51445);"></input></td>
           <td>AIGBR_NA_DEV_RP_APP</td>
           <td>0</td>
          <td>aigbr_na_dev_rp</td>
          <td>718</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_720" id="subForm_720" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(248,720,64485);"></input></td>
           <td>SEQUIS_PRE_PROD</td>
           <td>0</td>
          <td>null</td>
          <td>720</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>null</td>
          </tr>
	</form>
        
        <form name="subForm_721" id="subForm_721" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(249,721,62129);"></input></td>
           <td>AIG_BR_AMS_GS_TST_APP</td>
           <td>0</td>
          <td>aig_br_ams_gs_tst</td>
          <td>721</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_722" id="subForm_722" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(250,722,14339);"></input></td>
           <td>AIG_BR_AMS_RP_TST_APP</td>
           <td>0</td>
          <td>aig_br_ams_rp_tst</td>
          <td>722</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_724" id="subForm_724" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(251,724,10079);"></input></td>
           <td>AIGBR_BWEB_GC_PREUAT_APP</td>
           <td>0</td>
          <td>aigbr_bweb_gc_preuat</td>
          <td>724</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_725" id="subForm_725" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(252,725,20441);"></input></td>
           <td>AIG_BR_AMS_RP_TST_APP</td>
           <td>0</td>
          <td>aig_br_ams_rp_tst</td>
          <td>725</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_726" id="subForm_726" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(253,726,59507);"></input></td>
           <td>SEG_LS_PRD_CFG_APP</td>
           <td>0</td>
          <td>seg_ls_prd_cfg</td>
          <td>726</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_727" id="subForm_727" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(254,727,11111);"></input></td>
           <td>DAHSING_P2_MT_DEV</td>
           <td>0</td>
          <td>jisheng.zhu</td>
          <td>727</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_729" id="subForm_729" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(255,729,13983);"></input></td>
           <td>DAHSING_P2_MT_DEV</td>
           <td>0</td>
          <td>chuandong.qi</td>
          <td>729</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_731" id="subForm_731" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(256,731,30823);"></input></td>
           <td>GS_39_FEAT_TST_APP</td>
           <td>0</td>
          <td>gs_39_feat_tst</td>
          <td>731</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_732" id="subForm_732" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(257,732,28737);"></input></td>
           <td>AIG_BR_AMS_GC_TST_APP</td>
           <td>0</td>
          <td>aig_br_ams_gc_tst</td>
          <td>732</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_734" id="subForm_734" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(258,734,11323);"></input></td>
           <td>AIGBR_BWEB_GS_DEV_APP</td>
           <td>0</td>
          <td>aigbr_bweb_gs_dev</td>
          <td>734</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_735" id="subForm_735" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(259,735,2861);"></input></td>
           <td>AIGBR_BWEB_GC_TST_APP</td>
           <td>0</td>
          <td>aigbr_bweb_gc_tst</td>
          <td>735</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_783" id="subForm_783" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(260,783,22853);"></input></td>
           <td>ACR_311_PRE_UAT_APP</td>
           <td>0</td>
          <td>acr_311_pre_uat</td>
          <td>783</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_784" id="subForm_784" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(261,784,33763);"></input></td>
           <td>DAHSING_MT_PRE_UAT_APP</td>
           <td>0</td>
          <td>dahsing_mt_pre_uat</td>
          <td>784</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_785" id="subForm_785" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(262,785,60613);"></input></td>
           <td>DAHSING_MT_PRE_UAT_APP</td>
           <td>0</td>
          <td>dahsing_mt_pre_uat</td>
          <td>785</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_786" id="subForm_786" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(263,786,50751);"></input></td>
           <td>AIGBR_NA_TST_RP_APP</td>
           <td>0</td>
          <td>aigbr_na_tst_rp</td>
          <td>786</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_789" id="subForm_789" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(264,789,51833);"></input></td>
           <td>AIG_BR_AMS_PD_GC_APP</td>
           <td>0</td>
          <td>aig_br_ams_pd_gc</td>
          <td>789</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_790" id="subForm_790" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(265,790,53383);"></input></td>
           <td>AIG_BR_AMS_GC_TST_APP</td>
           <td>0</td>
          <td>aig_br_ams_gc_tst</td>
          <td>790</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_791" id="subForm_791" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(266,791,35559);"></input></td>
           <td>AIGBR_NA_DEV_GS_APP</td>
           <td>0</td>
          <td>aigbr_na_dev_gs</td>
          <td>791</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_792" id="subForm_792" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(267,792,16447);"></input></td>
           <td>ACR_311_PRE_UAT_APP</td>
           <td>0</td>
          <td>acr_311_pre_uat</td>
          <td>792</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>null</td>
          </tr>
	</form>
        
        <form name="subForm_793" id="subForm_793" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(268,793,19475);"></input></td>
           <td>AIGBR_TR_SIT_GC_APP</td>
           <td>0</td>
          <td>aigbr_tr_sit_gc</td>
          <td>793</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_794" id="subForm_794" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(269,794,56447);"></input></td>
           <td>ACR_311_PRE_UAT_APP</td>
           <td>0</td>
          <td>acr_311_pre_uat</td>
          <td>794</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_795" id="subForm_795" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(270,795,20943);"></input></td>
           <td>SEQUIS_PRE_PROD</td>
           <td>0</td>
          <td>kevin.xu</td>
          <td>795</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_796" id="subForm_796" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(271,796,20779);"></input></td>
           <td>AIGBR_BWEB_GS_DEV</td>
           <td>0</td>
          <td>libin.xi</td>
          <td>796</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>A5M2.exe</td>
          </tr>
	</form>
        
        <form name="subForm_798" id="subForm_798" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(272,798,14001);"></input></td>
           <td>AIGBR_NA_DEV_GS</td>
           <td>0</td>
          <td>ben.lu</td>
          <td>798</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_799" id="subForm_799" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(273,799,537);"></input></td>
           <td>AIGBR_GW_MA_GS</td>
           <td>0</td>
          <td>pengchao.wang</td>
          <td>799</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_800" id="subForm_800" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(274,800,43521);"></input></td>
           <td>AIGBR_BWEB_GS_TST</td>
           <td>0</td>
          <td>lei.xu</td>
          <td>800</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_805" id="subForm_805" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(275,805,9555);"></input></td>
           <td>AIG_BR_AMS_GC_TST_APP</td>
           <td>0</td>
          <td>aig_br_ams_gc_tst</td>
          <td>805</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_806" id="subForm_806" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(276,806,6839);"></input></td>
           <td>GS_39_FEAT_TST_APP</td>
           <td>0</td>
          <td>gs_39_feat_tst</td>
          <td>806</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_854" id="subForm_854" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(277,854,6009);"></input></td>
           <td>AIG_BR_AMS_PD_GC_APP</td>
           <td>0</td>
          <td>aig_br_ams_pd_gc</td>
          <td>854</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_855" id="subForm_855" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(278,855,49367);"></input></td>
           <td>AIGBR_BWEB_QUO_DEV</td>
           <td>0</td>
          <td>yundan.zhang</td>
          <td>855</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_857" id="subForm_857" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(279,857,803);"></input></td>
           <td>CKI_DEV_APP</td>
           <td>0</td>
          <td>cki_dev</td>
          <td>857</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_858" id="subForm_858" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(280,858,64535);"></input></td>
           <td>AIGBR_NA_DEV_GS</td>
           <td>0</td>
          <td>ying.chen</td>
          <td>858</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_859" id="subForm_859" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(281,859,19285);"></input></td>
           <td>DAHSING_BIG_CR_DEV_APP</td>
           <td>0</td>
          <td>dahsing_big_cr_dev</td>
          <td>859</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_860" id="subForm_860" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(282,860,62145);"></input></td>
           <td>AIG_BR_AMS_PD_GS_APP</td>
           <td>0</td>
          <td>aig_br_ams_pd_gs</td>
          <td>860</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_861" id="subForm_861" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(283,861,59165);"></input></td>
           <td>AIG_BR_AMS_GC_TST_APP</td>
           <td>0</td>
          <td>aig_br_ams_gc_tst</td>
          <td>861</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_862" id="subForm_862" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(284,862,40759);"></input></td>
           <td>DAHSING_P2_MT_DEV</td>
           <td>0</td>
          <td>jiajun.chen</td>
          <td>862</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_863" id="subForm_863" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(285,863,35879);"></input></td>
           <td>AIGBR_NA_DEV_GS_APP</td>
           <td>0</td>
          <td>aigbr_na_dev_gs</td>
          <td>863</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_864" id="subForm_864" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(286,864,14649);"></input></td>
           <td>SEG_LS_PRD_CFG_APP</td>
           <td>0</td>
          <td>seg_ls_prd_cfg</td>
          <td>864</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_865" id="subForm_865" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(287,865,48153);"></input></td>
           <td>ACR_311_FEAT_TST_APP</td>
           <td>0</td>
          <td>acr_311_feat_tst</td>
          <td>865</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>null</td>
          </tr>
	</form>
        
        <form name="subForm_866" id="subForm_866" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(288,866,17603);"></input></td>
           <td>AIGBR_NA_DEV_GS_APP</td>
           <td>0</td>
          <td>aigbr_na_dev_gs</td>
          <td>866</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_867" id="subForm_867" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(289,867,13757);"></input></td>
           <td>AIGBR_NA_TST_RP_APP</td>
           <td>0</td>
          <td>aigbr_na_tst_rp</td>
          <td>867</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_871" id="subForm_871" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(290,871,58273);"></input></td>
           <td>DAHSING_BIG_CR_DEV_APP</td>
           <td>0</td>
          <td>dahsing_big_cr_dev</td>
          <td>871</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_872" id="subForm_872" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(291,872,10645);"></input></td>
           <td>GS_39_FEAT_DEV_APP</td>
           <td>0</td>
          <td>gs_39_feat_dev</td>
          <td>872</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_874" id="subForm_874" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(292,874,53183);"></input></td>
           <td>AIG_BR_AMS_PD_RP_APP</td>
           <td>0</td>
          <td>aig_br_ams_pd_rp</td>
          <td>874</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_876" id="subForm_876" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(293,876,41293);"></input></td>
           <td>DAHSING_P2_MT_DEV</td>
           <td>0</td>
          <td>qi.zhang</td>
          <td>876</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_877" id="subForm_877" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(294,877,7131);"></input></td>
           <td>AIGBR_NA_DEV_GS</td>
           <td>0</td>
          <td>ben.lu</td>
          <td>877</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_878" id="subForm_878" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(295,878,4977);"></input></td>
           <td>AIGBR_BWEB_GC_DEV_APP</td>
           <td>0</td>
          <td>aigbr_bweb_gc_dev</td>
          <td>878</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_926" id="subForm_926" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(296,926,521);"></input></td>
           <td>AIGBR_GW_MA_GC_APP</td>
           <td>0</td>
          <td>aigbr_gw_ma_gc</td>
          <td>926</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_927" id="subForm_927" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(297,927,34133);"></input></td>
           <td>AIGBR_BWEB_GC_DEV_APP</td>
           <td>0</td>
          <td>aigbr_bweb_gc_dev</td>
          <td>927</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_928" id="subForm_928" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(298,928,41181);"></input></td>
           <td>DAHSING_P2_MT_DEV</td>
           <td>0</td>
          <td>qi.zhang</td>
          <td>928</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_929" id="subForm_929" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(299,929,33565);"></input></td>
           <td>AIG_BR_AMS_PD_RP_APP</td>
           <td>0</td>
          <td>aig_br_ams_pd_rp</td>
          <td>929</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_931" id="subForm_931" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(300,931,56099);"></input></td>
           <td>GS_39X_API_TST_APP</td>
           <td>0</td>
          <td>gs_39x_api_tst</td>
          <td>931</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_933" id="subForm_933" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(301,933,52889);"></input></td>
           <td>AIG_BR_AMS_PD_RP_APP</td>
           <td>0</td>
          <td>aig_br_ams_pd_rp</td>
          <td>933</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_934" id="subForm_934" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(302,934,19993);"></input></td>
           <td>AIGBR_BWEB_GS_DEV_APP</td>
           <td>0</td>
          <td>aigbr_bweb_gs_dev</td>
          <td>934</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_935" id="subForm_935" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(303,935,47061);"></input></td>
           <td>DAHSING_P2_MT_TST_READ</td>
           <td>0</td>
          <td>xiuli.yu</td>
          <td>935</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_937" id="subForm_937" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(304,937,40901);"></input></td>
           <td>AIG_BR_AMS_RP_TST_APP</td>
           <td>0</td>
          <td>aig_br_ams_rp_tst</td>
          <td>937</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_938" id="subForm_938" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(305,938,37097);"></input></td>
           <td>SEQUIS_PRE_PROD</td>
           <td>0</td>
          <td>null</td>
          <td>938</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>null</td>
          </tr>
	</form>
        
        <form name="subForm_939" id="subForm_939" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(306,939,10411);"></input></td>
           <td>AIG_BR_AMS_PD_GS</td>
           <td>0</td>
          <td>tai.wang</td>
          <td>939</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_940" id="subForm_940" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(307,940,51709);"></input></td>
           <td>DAHSING_BIG_CR_DEV_APP</td>
           <td>0</td>
          <td>dahsing_big_cr_dev</td>
          <td>940</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_941" id="subForm_941" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(308,941,30005);"></input></td>
           <td>DAHSING_MT_PRE_UAT_APP</td>
           <td>0</td>
          <td>dahsing_mt_pre_uat</td>
          <td>941</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_943" id="subForm_943" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(309,943,7897);"></input></td>
           <td>AIG_BR_AMS_PD_GS</td>
           <td>0</td>
          <td>tai.wang</td>
          <td>943</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_944" id="subForm_944" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(310,944,10005);"></input></td>
           <td>AIGBR_BWEB_GC_PREUAT_APP</td>
           <td>0</td>
          <td>aigbr_bweb_gc_preuat</td>
          <td>944</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_945" id="subForm_945" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(311,945,55191);"></input></td>
           <td>AIGBR_NA_TST_RP_APP</td>
           <td>0</td>
          <td>aigbr_na_tst_rp</td>
          <td>945</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_947" id="subForm_947" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(312,947,17011);"></input></td>
           <td>AIGBR_NA_TST_RP_APP</td>
           <td>0</td>
          <td>aigbr_na_tst_rp</td>
          <td>947</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_948" id="subForm_948" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(313,948,19505);"></input></td>
           <td>DAHSING_P2_MT_DEV</td>
           <td>0</td>
          <td>chuandong.qi</td>
          <td>948</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_949" id="subForm_949" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(314,949,4115);"></input></td>
           <td>AIGBR_NA_DEV_GS</td>
           <td>0</td>
          <td>ying.chen</td>
          <td>949</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_996" id="subForm_996" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(315,996,13753);"></input></td>
           <td>AIGBR_NA_DEV_RP_APP</td>
           <td>0</td>
          <td>aigbr_na_dev_rp</td>
          <td>996</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_997" id="subForm_997" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(316,997,1473);"></input></td>
           <td>CKI_DEV_APP</td>
           <td>0</td>
          <td>cki_dev</td>
          <td>997</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_998" id="subForm_998" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(317,998,47095);"></input></td>
           <td>AIGBR_NA_DEV_RP_APP</td>
           <td>0</td>
          <td>aigbr_na_dev_rp</td>
          <td>998</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_999" id="subForm_999" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(318,999,24895);"></input></td>
           <td>GS_362_SGP_DEMO</td>
           <td>0</td>
          <td>gs_362_sgp_demo</td>
          <td>999</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1001" id="subForm_1001" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(319,1001,32557);"></input></td>
           <td>DAHSING_P2_MT_DEV</td>
           <td>0</td>
          <td>jisheng.zhu</td>
          <td>1001</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1002" id="subForm_1002" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(320,1002,47507);"></input></td>
           <td>AIGBR_BWEB_GS_DEV</td>
           <td>0</td>
          <td>lei.xu</td>
          <td>1002</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1003" id="subForm_1003" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(321,1003,43737);"></input></td>
           <td>AIG_BR_AMS_PD_RP_APP</td>
           <td>0</td>
          <td>aig_br_ams_pd_rp</td>
          <td>1003</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1004" id="subForm_1004" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(322,1004,8721);"></input></td>
           <td>DAHSING_P2_MT_DEV</td>
           <td>0</td>
          <td>qi.zhang</td>
          <td>1004</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1006" id="subForm_1006" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(323,1006,31209);"></input></td>
           <td>GS_39_FEAT_TST_APP</td>
           <td>0</td>
          <td>gs_39_feat_tst</td>
          <td>1006</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1008" id="subForm_1008" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(324,1008,19791);"></input></td>
           <td>GS_39X_API_TST_APP</td>
           <td>0</td>
          <td>gs_39x_api_tst</td>
          <td>1008</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>null</td>
          </tr>
	</form>
        
        <form name="subForm_1011" id="subForm_1011" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(325,1011,4685);"></input></td>
           <td>AIG_BR_AMS_PD_GC_APP</td>
           <td>0</td>
          <td>aig_br_ams_pd_gc</td>
          <td>1011</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1012" id="subForm_1012" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(326,1012,55171);"></input></td>
           <td>SEQUIS_PRE_PROD</td>
           <td>0</td>
          <td>null</td>
          <td>1012</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>null</td>
          </tr>
	</form>
        
        <form name="subForm_1014" id="subForm_1014" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(327,1014,60919);"></input></td>
           <td>AIG_BR_AMS_PD_GC_APP</td>
           <td>0</td>
          <td>aig_br_ams_pd_gc</td>
          <td>1014</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1018" id="subForm_1018" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(328,1018,20363);"></input></td>
           <td>AIG_BR_AMS_PD_GC_APP</td>
           <td>0</td>
          <td>aig_br_ams_pd_gc</td>
          <td>1018</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1019" id="subForm_1019" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(329,1019,40663);"></input></td>
           <td>ACR_311_FEAT_TST_APP</td>
           <td>0</td>
          <td>acr_311_feat_tst</td>
          <td>1019</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1067" id="subForm_1067" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(330,1067,51857);"></input></td>
           <td>SEG_LS_PRD_CFG_APP</td>
           <td>0</td>
          <td>seg_ls_prd_cfg</td>
          <td>1067</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1068" id="subForm_1068" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(331,1068,48549);"></input></td>
           <td>AIG_BR_AMS_PD_GS_APP</td>
           <td>0</td>
          <td>Administrator</td>
          <td>1068</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>eBaoPrintService.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1069" id="subForm_1069" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(332,1069,7161);"></input></td>
           <td>AIG_BR_AMS_GS_TST_APP</td>
           <td>0</td>
          <td>aig_br_ams_gs_tst</td>
          <td>1069</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1072" id="subForm_1072" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(333,1072,48081);"></input></td>
           <td>AIGBR_BWEB_GS_TST</td>
           <td>0</td>
          <td>lei.xu</td>
          <td>1072</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1074" id="subForm_1074" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(334,1074,37653);"></input></td>
           <td>AIGBR_BWEB_GC_PREUAT_APP</td>
           <td>0</td>
          <td>aigbr_bweb_gc_preuat</td>
          <td>1074</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1079" id="subForm_1079" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(335,1079,33065);"></input></td>
           <td>GS_39X_API_TST_APP</td>
           <td>0</td>
          <td>gs_39x_api_tst</td>
          <td>1079</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1080" id="subForm_1080" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(336,1080,61765);"></input></td>
           <td>AIGBR_TR_SIT_GC_APP</td>
           <td>0</td>
          <td>aigbr_tr_sit_gc</td>
          <td>1080</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1081" id="subForm_1081" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(337,1081,27707);"></input></td>
           <td>SEQUIS_PRE_PROD</td>
           <td>0</td>
          <td>sequis_p2_dc</td>
          <td>1081</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1082" id="subForm_1082" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(338,1082,45063);"></input></td>
           <td>DAHSING_BIG_CR_DEV_APP</td>
           <td>0</td>
          <td>dahsing_big_cr_dev</td>
          <td>1082</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1083" id="subForm_1083" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(339,1083,41307);"></input></td>
           <td>GS_39_FEAT_DEV_APP</td>
           <td>0</td>
          <td>gs_39_feat_dev</td>
          <td>1083</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1084" id="subForm_1084" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(340,1084,11185);"></input></td>
           <td>AIGBR_GW_MA_GC_APP</td>
           <td>0</td>
          <td>aigbr_gw_ma_gc</td>
          <td>1084</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1085" id="subForm_1085" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(341,1085,25695);"></input></td>
           <td>AIGBR_NA_DEV_RP_APP</td>
           <td>0</td>
          <td>aigbr_na_dev_rp</td>
          <td>1085</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1086" id="subForm_1086" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(342,1086,27241);"></input></td>
           <td>SEQUIS_PRE_PROD</td>
           <td>0</td>
          <td>shoujie.xie</td>
          <td>1086</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1087" id="subForm_1087" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(343,1087,6625);"></input></td>
           <td>SEQUIS_PRE_PROD</td>
           <td>0</td>
          <td>null</td>
          <td>1087</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>null</td>
          </tr>
	</form>
        
        <form name="subForm_1089" id="subForm_1089" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(344,1089,39347);"></input></td>
           <td>AIG_BR_AMS_PD_GC_APP</td>
           <td>0</td>
          <td>aig_br_ams_pd_gc</td>
          <td>1089</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1090" id="subForm_1090" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(345,1090,39913);"></input></td>
           <td>GS_39X_API_TST_APP</td>
           <td>0</td>
          <td>gs_39x_api_tst</td>
          <td>1090</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1138" id="subForm_1138" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(346,1138,42015);"></input></td>
           <td>DAHSING_P2_MT_DEV</td>
           <td>0</td>
          <td>chuandong.qi</td>
          <td>1138</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1139" id="subForm_1139" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(347,1139,34093);"></input></td>
           <td>ACR_311_PRE_UAT_APP</td>
           <td>0</td>
          <td>acr_311_pre_uat</td>
          <td>1139</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1140" id="subForm_1140" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(348,1140,2669);"></input></td>
           <td>CKI_DEV_APP</td>
           <td>0</td>
          <td>cki_dev</td>
          <td>1140</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1141" id="subForm_1141" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(349,1141,39507);"></input></td>
           <td>AIGBR_TR_SIT_GS_APP</td>
           <td>0</td>
          <td>aigbr_tr_sit_gs</td>
          <td>1141</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1142" id="subForm_1142" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(350,1142,61429);"></input></td>
           <td>GS_39_FEAT_DEV_APP</td>
           <td>0</td>
          <td>gs_39_feat_dev</td>
          <td>1142</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>null</td>
          </tr>
	</form>
        
        <form name="subForm_1143" id="subForm_1143" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(351,1143,29307);"></input></td>
           <td>AIG_BR_AMS_PD_GS_READ</td>
           <td>0</td>
          <td>ou.tong</td>
          <td>1143</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1144" id="subForm_1144" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(352,1144,48783);"></input></td>
           <td>DAHSING_BIG_CR_DEV_APP</td>
           <td>0</td>
          <td>dahsing_big_cr_dev</td>
          <td>1144</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1145" id="subForm_1145" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(353,1145,43825);"></input></td>
           <td>AIG_BR_AMS_RP_TST_APP</td>
           <td>0</td>
          <td>aig_br_ams_rp_tst</td>
          <td>1145</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1146" id="subForm_1146" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(354,1146,18325);"></input></td>
           <td>AIGBR_NA_TST_RP_APP</td>
           <td>0</td>
          <td>aigbr_na_tst_rp</td>
          <td>1146</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1147" id="subForm_1147" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(355,1147,26121);"></input></td>
           <td>AIGBR_BWEB_GC_DEV_APP</td>
           <td>0</td>
          <td>aigbr_bweb_gc_dev</td>
          <td>1147</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1148" id="subForm_1148" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(356,1148,28449);"></input></td>
           <td>AIGBR_GW_MA_GC_APP</td>
           <td>0</td>
          <td>aigbr_gw_ma_gc</td>
          <td>1148</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1150" id="subForm_1150" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(357,1150,22139);"></input></td>
           <td>SEG_LS_PRD_CFG_APP</td>
           <td>0</td>
          <td>seg_ls_prd_cfg</td>
          <td>1150</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1151" id="subForm_1151" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(358,1151,15015);"></input></td>
           <td>AIG_BR_AMS_GC_TST_APP</td>
           <td>0</td>
          <td>aig_br_ams_gc_tst</td>
          <td>1151</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1152" id="subForm_1152" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(359,1152,64715);"></input></td>
           <td>AIGBR_GW_MA_GS_APP</td>
           <td>0</td>
          <td>aigbr_gw_ma_gs</td>
          <td>1152</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1155" id="subForm_1155" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(360,1155,38607);"></input></td>
           <td>DAHSING_P2_MT_DEV</td>
           <td>0</td>
          <td>qi.zhang</td>
          <td>1155</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1157" id="subForm_1157" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(361,1157,22599);"></input></td>
           <td>ACR_311_PRE_UAT_APP</td>
           <td>0</td>
          <td>acr_311_pre_uat</td>
          <td>1157</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1158" id="subForm_1158" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(362,1158,64307);"></input></td>
           <td>AIGBR_NA_TST_RP_APP</td>
           <td>0</td>
          <td>aigbr_na_tst_rp</td>
          <td>1158</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1159" id="subForm_1159" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(363,1159,12691);"></input></td>
           <td>ACR_311_FEAT_TST_APP</td>
           <td>0</td>
          <td>acr_311_feat_tst</td>
          <td>1159</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1160" id="subForm_1160" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(364,1160,39135);"></input></td>
           <td>AIGBR_BWEB_GC_DEV_APP</td>
           <td>0</td>
          <td>aigbr_bweb_gc_dev</td>
          <td>1160</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1161" id="subForm_1161" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(365,1161,21671);"></input></td>
           <td>AIGBR_BWEB_GS_DEV</td>
           <td>0</td>
          <td>libin.xi</td>
          <td>1161</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1209" id="subForm_1209" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(366,1209,4305);"></input></td>
           <td>DAHSING_P2_MT_DEV_APP</td>
           <td>0</td>
          <td>dahsing_p2_mt_dev</td>
          <td>1209</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1210" id="subForm_1210" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(367,1210,1073);"></input></td>
           <td>CKI_DEV_APP</td>
           <td>0</td>
          <td>cki_dev</td>
          <td>1210</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1211" id="subForm_1211" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(368,1211,10501);"></input></td>
           <td>DAHSING_P2_MT_DEV</td>
           <td>0</td>
          <td>mavis.liu</td>
          <td>1211</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1212" id="subForm_1212" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(369,1212,13775);"></input></td>
           <td>AIG_BR_AMS_GS_TST_APP</td>
           <td>0</td>
          <td>aig_br_ams_gs_tst</td>
          <td>1212</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1213" id="subForm_1213" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(370,1213,26937);"></input></td>
           <td>AIG_BR_AMS_GC_TST_APP</td>
           <td>0</td>
          <td>aig_br_ams_gc_tst</td>
          <td>1213</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1214" id="subForm_1214" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(371,1214,46025);"></input></td>
           <td>AIGBR_GW_MA_GC_APP</td>
           <td>0</td>
          <td>aigbr_gw_ma_gc</td>
          <td>1214</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1215" id="subForm_1215" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(372,1215,12807);"></input></td>
           <td>AIG_BR_AMS_PD_GC_APP</td>
           <td>0</td>
          <td>aig_br_ams_pd_gc</td>
          <td>1215</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1216" id="subForm_1216" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(373,1216,3695);"></input></td>
           <td>AIG_BR_AMS_PD_GC_APP</td>
           <td>0</td>
          <td>aig_br_ams_pd_gc</td>
          <td>1216</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1217" id="subForm_1217" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(374,1217,60535);"></input></td>
           <td>SEG_LS_PRD_CFG_APP</td>
           <td>0</td>
          <td>seg_ls_prd_cfg</td>
          <td>1217</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1218" id="subForm_1218" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(375,1218,62771);"></input></td>
           <td>SEG_LS_PRD_CFG_APP</td>
           <td>0</td>
          <td>seg_ls_prd_cfg</td>
          <td>1218</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1219" id="subForm_1219" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(376,1219,17731);"></input></td>
           <td>AIG_BR_AMS_PD_GS_APP</td>
           <td>0</td>
          <td>Administrator</td>
          <td>1219</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>eBaoPrintService.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1220" id="subForm_1220" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(377,1220,9929);"></input></td>
           <td>DAHSING_P2_MT_TST_READ</td>
           <td>0</td>
          <td>zhijie.shen</td>
          <td>1220</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1221" id="subForm_1221" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(378,1221,31067);"></input></td>
           <td>AIG_BR_AMS_PD_RP_APP</td>
           <td>0</td>
          <td>aig_br_ams_pd_rp</td>
          <td>1221</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1224" id="subForm_1224" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(379,1224,55461);"></input></td>
           <td>ACR_311_FEAT_TST_APP</td>
           <td>0</td>
          <td>acr_311_feat_tst</td>
          <td>1224</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>null</td>
          </tr>
	</form>
        
        <form name="subForm_1225" id="subForm_1225" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(380,1225,30071);"></input></td>
           <td>GS_39_FEAT_DEV_APP</td>
           <td>0</td>
          <td>gs_39_feat_dev</td>
          <td>1225</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1227" id="subForm_1227" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(381,1227,50217);"></input></td>
           <td>AIG_BR_AMS_PD_GS_APP</td>
           <td>0</td>
          <td>Administrator</td>
          <td>1227</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>eBaoPrintService.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1230" id="subForm_1230" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(382,1230,17411);"></input></td>
           <td>DAHSING_P2_MT_DEV</td>
           <td>0</td>
          <td>qi.zhang</td>
          <td>1230</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1232" id="subForm_1232" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(383,1232,35881);"></input></td>
           <td>AIGBR_BWEB_GC_DEV_APP</td>
           <td>0</td>
          <td>aigbr_bweb_gc_dev</td>
          <td>1232</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1281" id="subForm_1281" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(384,1281,493);"></input></td>
           <td>CKI_DEV_APP</td>
           <td>0</td>
          <td>cki_dev</td>
          <td>1281</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1282" id="subForm_1282" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(385,1282,40823);"></input></td>
           <td>DAHSING_MT_PRE_UAT_APP</td>
           <td>0</td>
          <td>dahsing_mt_pre_uat</td>
          <td>1282</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1283" id="subForm_1283" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(386,1283,9639);"></input></td>
           <td>AIG_BR_AMS_PD_RP_APP</td>
           <td>0</td>
          <td>aig_br_ams_pd_rp</td>
          <td>1283</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1285" id="subForm_1285" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(387,1285,59647);"></input></td>
           <td>GS_39_FEAT_DEV_APP</td>
           <td>0</td>
          <td>gs_39_feat_dev</td>
          <td>1285</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>null</td>
          </tr>
	</form>
        
        <form name="subForm_1286" id="subForm_1286" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(388,1286,57455);"></input></td>
           <td>AIG_BR_AMS_GC_TST_APP</td>
           <td>0</td>
          <td>aig_br_ams_gc_tst</td>
          <td>1286</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1288" id="subForm_1288" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(389,1288,6547);"></input></td>
           <td>DAHSING_P2_MT_DEV</td>
           <td>0</td>
          <td>zhiwei.liu</td>
          <td>1288</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1289" id="subForm_1289" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(390,1289,2363);"></input></td>
           <td>AIGBR_NA_DEV_RP_APP</td>
           <td>0</td>
          <td>aigbr_na_dev_rp</td>
          <td>1289</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1291" id="subForm_1291" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(391,1291,38289);"></input></td>
           <td>GS_39_FEAT_DEV_APP</td>
           <td>0</td>
          <td>gs_39_feat_dev</td>
          <td>1291</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1292" id="subForm_1292" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(392,1292,8709);"></input></td>
           <td>AIG_BR_AMS_RP_TST_APP</td>
           <td>0</td>
          <td>aig_br_ams_rp_tst</td>
          <td>1292</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1295" id="subForm_1295" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(393,1295,3195);"></input></td>
           <td>DAHSING_P2_MT_TST_READ</td>
           <td>0</td>
          <td>chuandong.qi</td>
          <td>1295</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1296" id="subForm_1296" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(394,1296,30629);"></input></td>
           <td>AIGBR_NA_DEV_GS</td>
           <td>0</td>
          <td>hao.du</td>
          <td>1296</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1297" id="subForm_1297" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(395,1297,16289);"></input></td>
           <td>AIGBR_BWEB_GC_PREUAT_APP</td>
           <td>0</td>
          <td>aigbr_bweb_gc_preuat</td>
          <td>1297</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1298" id="subForm_1298" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(396,1298,54785);"></input></td>
           <td>AIG_BR_AMS_PD_RP_APP</td>
           <td>0</td>
          <td>aig_br_ams_pd_rp</td>
          <td>1298</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1300" id="subForm_1300" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(397,1300,62747);"></input></td>
           <td>GS_39_FEAT_TST_APP</td>
           <td>0</td>
          <td>gs_39_feat_tst</td>
          <td>1300</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1301" id="subForm_1301" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(398,1301,25821);"></input></td>
           <td>AIGBR_NA_DEV_GS</td>
           <td>0</td>
          <td>zhongbiao.cai</td>
          <td>1301</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1304" id="subForm_1304" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(399,1304,24569);"></input></td>
           <td>AIGBR_NA_DEV_GS_APP</td>
           <td>0</td>
          <td>aigbr_na_dev_gs</td>
          <td>1304</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1305" id="subForm_1305" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(400,1305,6461);"></input></td>
           <td>ACR_311_FEAT_TST_APP</td>
           <td>0</td>
          <td>acr_311_feat_tst</td>
          <td>1305</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1352" id="subForm_1352" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(401,1352,28475);"></input></td>
           <td>AIG_BR_AMS_PD_RP_APP</td>
           <td>0</td>
          <td>aig_br_ams_pd_rp</td>
          <td>1352</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1353" id="subForm_1353" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(402,1353,455);"></input></td>
           <td>CKI_DEV_APP</td>
           <td>0</td>
          <td>cki_dev</td>
          <td>1353</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1354" id="subForm_1354" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(403,1354,38267);"></input></td>
           <td>SEQUIS_PRE_PROD</td>
           <td>0</td>
          <td>kevin.xu</td>
          <td>1354</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1355" id="subForm_1355" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(404,1355,62445);"></input></td>
           <td>AIGBR_BWEB_GC_DEV_APP</td>
           <td>0</td>
          <td>aigbr_bweb_gc_dev</td>
          <td>1355</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1356" id="subForm_1356" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(405,1356,42433);"></input></td>
           <td>ACR_311_PRE_UAT_APP</td>
           <td>0</td>
          <td>acr_311_pre_uat</td>
          <td>1356</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>null</td>
          </tr>
	</form>
        
        <form name="subForm_1358" id="subForm_1358" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(406,1358,23925);"></input></td>
           <td>ACR_311_PRE_UAT_APP</td>
           <td>0</td>
          <td>acr_311_pre_uat</td>
          <td>1358</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1359" id="subForm_1359" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(407,1359,36631);"></input></td>
           <td>SEQUIS_PRE_PROD</td>
           <td>0</td>
          <td>null</td>
          <td>1359</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>null</td>
          </tr>
	</form>
        
        <form name="subForm_1362" id="subForm_1362" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(408,1362,30205);"></input></td>
           <td>CKI_DEV</td>
           <td>0</td>
          <td>johnson.ni</td>
          <td>1362</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1365" id="subForm_1365" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(409,1365,25239);"></input></td>
           <td>AIGBR_BWEB_GS_DEV</td>
           <td>0</td>
          <td>yundan.zhang</td>
          <td>1365</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1367" id="subForm_1367" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(410,1367,17913);"></input></td>
           <td>SEG_LS_PRD_CFG</td>
           <td>0</td>
          <td>hao.xu</td>
          <td>1367</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1368" id="subForm_1368" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(411,1368,20819);"></input></td>
           <td>AIGBR_TR_SIT_GC_APP</td>
           <td>0</td>
          <td>aigbr_tr_sit_gc</td>
          <td>1368</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1369" id="subForm_1369" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(412,1369,24149);"></input></td>
           <td>DAHSING_P2_MT_DEV_APP</td>
           <td>0</td>
          <td>dahsing_p2_mt_dev</td>
          <td>1369</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1372" id="subForm_1372" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(413,1372,48313);"></input></td>
           <td>AIGBR_BWEB_GC_PREUAT_APP</td>
           <td>0</td>
          <td>aigbr_bweb_gc_preuat</td>
          <td>1372</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1373" id="subForm_1373" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(414,1373,4515);"></input></td>
           <td>GS_39X_API_TST_APP</td>
           <td>0</td>
          <td>gs_39x_api_tst</td>
          <td>1373</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>null</td>
          </tr>
	</form>
        
        <form name="subForm_1374" id="subForm_1374" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(415,1374,36763);"></input></td>
           <td>AIG_BR_AMS_GS_TST_APP</td>
           <td>0</td>
          <td>aig_br_ams_gs_tst</td>
          <td>1374</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1375" id="subForm_1375" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(416,1375,33753);"></input></td>
           <td>GS_39_FEAT_TST_APP</td>
           <td>0</td>
          <td>gs_39_feat_tst</td>
          <td>1375</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1376" id="subForm_1376" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(417,1376,50923);"></input></td>
           <td>AIG_BR_AMS_PD_GS_APP</td>
           <td>0</td>
          <td>aig_br_ams_pd_gs</td>
          <td>1376</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1377" id="subForm_1377" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(418,1377,48417);"></input></td>
           <td>AIG_BR_AMS_GC_TST_APP</td>
           <td>0</td>
          <td>aig_br_ams_gc_tst</td>
          <td>1377</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1421" id="subForm_1421" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(419,1421,3233);"></input></td>
           <td>AIGBR_TR_SIT_GC_APP</td>
           <td>0</td>
          <td>aigbr_tr_sit_gc</td>
          <td>1421</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1422" id="subForm_1422" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(420,1422,26233);"></input></td>
           <td>ACR_311_FEAT_DEV_APP</td>
           <td>0</td>
          <td>acr_311_feat_dev</td>
          <td>1422</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1423" id="subForm_1423" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(421,1423,6281);"></input></td>
           <td>SEG_LS_PRD_CFG_APP</td>
           <td>0</td>
          <td>seg_ls_prd_cfg</td>
          <td>1423</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1425" id="subForm_1425" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(422,1425,16967);"></input></td>
           <td>AIG_BR_AMS_PD_RP_APP</td>
           <td>0</td>
          <td>aig_br_ams_pd_rp</td>
          <td>1425</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1426" id="subForm_1426" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(423,1426,35853);"></input></td>
           <td>AIGBR_NA_DEV_RP_APP</td>
           <td>0</td>
          <td>aigbr_na_dev_rp</td>
          <td>1426</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1430" id="subForm_1430" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(424,1430,43817);"></input></td>
           <td>DAHSING_P2_MT_DEV_APP</td>
           <td>0</td>
          <td>dahsing_p2_mt_dev</td>
          <td>1430</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1431" id="subForm_1431" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(425,1431,59315);"></input></td>
           <td>AIGBR_GW_MA_GC</td>
           <td>0</td>
          <td>jiangtao.chen</td>
          <td>1431</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1432" id="subForm_1432" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(426,1432,21159);"></input></td>
           <td>DAHSING_P2_MT_DEV_APP</td>
           <td>0</td>
          <td>dahsing_p2_mt_dev</td>
          <td>1432</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1433" id="subForm_1433" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(427,1433,33209);"></input></td>
           <td>AIGBR_GW_MA_GC_APP</td>
           <td>0</td>
          <td>aigbr_gw_ma_gc</td>
          <td>1433</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1434" id="subForm_1434" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(428,1434,21975);"></input></td>
           <td>DAHSING_BIG_CR_TST</td>
           <td>0</td>
          <td>dahsing_big_cr_tst</td>
          <td>1434</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1435" id="subForm_1435" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(429,1435,30845);"></input></td>
           <td>DAHSING_P2_MT_DEV</td>
           <td>0</td>
          <td>chuandong.qi</td>
          <td>1435</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1436" id="subForm_1436" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(430,1436,56793);"></input></td>
           <td>ACR_311_FEAT_DEV_APP</td>
           <td>0</td>
          <td>acr_311_feat_dev</td>
          <td>1436</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1437" id="subForm_1437" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(431,1437,29549);"></input></td>
           <td>ACR_311_FEAT_TST_READ</td>
           <td>0</td>
          <td>jie.li</td>
          <td>1437</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1438" id="subForm_1438" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(432,1438,41379);"></input></td>
           <td>DAHSING_P2_MT_DEV_APP</td>
           <td>0</td>
          <td>dahsing_p2_mt_dev</td>
          <td>1438</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1439" id="subForm_1439" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(433,1439,51259);"></input></td>
           <td>AIG_BR_AMS_GS_TST_APP</td>
           <td>0</td>
          <td>aig_br_ams_gs_tst</td>
          <td>1439</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1442" id="subForm_1442" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(434,1442,31833);"></input></td>
           <td>AIGBR_BWEB_QUO_DEV</td>
           <td>0</td>
          <td>aigbr_bweb_quo_dev</td>
          <td>1442</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1443" id="subForm_1443" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(435,1443,34299);"></input></td>
           <td>AIG_BR_AMS_RP_TST_APP</td>
           <td>0</td>
          <td>aig_br_ams_rp_tst</td>
          <td>1443</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1492" id="subForm_1492" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(436,1492,45923);"></input></td>
           <td>ACR_311_PRE_UAT_APP</td>
           <td>0</td>
          <td>acr_311_pre_uat</td>
          <td>1492</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1493" id="subForm_1493" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(437,1493,7225);"></input></td>
           <td>DAHSING_P2_MT_DEV</td>
           <td>0</td>
          <td>chuandong.qi</td>
          <td>1493</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1495" id="subForm_1495" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(438,1495,34587);"></input></td>
           <td>AIGBR_NA_DEV_GS</td>
           <td>0</td>
          <td>hao.du</td>
          <td>1495</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1498" id="subForm_1498" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(439,1498,63219);"></input></td>
           <td>DAHSING_P2_MT_DEV_APP</td>
           <td>0</td>
          <td>dahsing_p2_mt_dev</td>
          <td>1498</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1499" id="subForm_1499" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(440,1499,1965);"></input></td>
           <td>ACR_311_PRE_UAT_APP</td>
           <td>0</td>
          <td>acr_311_pre_uat</td>
          <td>1499</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1501" id="subForm_1501" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(441,1501,16051);"></input></td>
           <td>AIG_BR_AMS_PD_GS_APP</td>
           <td>0</td>
          <td>aig_br_ams_pd_gs</td>
          <td>1501</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1502" id="subForm_1502" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(442,1502,46465);"></input></td>
           <td>AIGBR_BWEB_GS_PREUAT_APP</td>
           <td>0</td>
          <td>aigbr_bweb_gs_preuat</td>
          <td>1502</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1503" id="subForm_1503" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(443,1503,2227);"></input></td>
           <td>AIG_BR_AMS_RP_TST_APP</td>
           <td>0</td>
          <td>aig_br_ams_rp_tst</td>
          <td>1503</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1504" id="subForm_1504" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(444,1504,45831);"></input></td>
           <td>AIGBR_NA_DEV_GS</td>
           <td>0</td>
          <td>robin.cai</td>
          <td>1504</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1506" id="subForm_1506" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(445,1506,50875);"></input></td>
           <td>AIGBR_NA_DEV_GS</td>
           <td>0</td>
          <td>chengbin.sui</td>
          <td>1506</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1507" id="subForm_1507" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(446,1507,3487);"></input></td>
           <td>ACR_311_PRE_UAT_APP</td>
           <td>0</td>
          <td>acr_311_pre_uat</td>
          <td>1507</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1509" id="subForm_1509" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(447,1509,43767);"></input></td>
           <td>GS_39_FEAT_DEV_APP</td>
           <td>0</td>
          <td>gs_39_feat_dev</td>
          <td>1509</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1510" id="subForm_1510" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(448,1510,21649);"></input></td>
           <td>SEQUIS_PRE_PROD</td>
           <td>0</td>
          <td>sequis_p2_dc</td>
          <td>1510</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1511" id="subForm_1511" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(449,1511,51379);"></input></td>
           <td>SEQUIS_PRE_PROD</td>
           <td>0</td>
          <td>null</td>
          <td>1511</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>null</td>
          </tr>
	</form>
        
        <form name="subForm_1512" id="subForm_1512" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(450,1512,46669);"></input></td>
           <td>DAHSING_MT_PRE_UAT_APP</td>
           <td>0</td>
          <td>dahsing_mt_pre_uat</td>
          <td>1512</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1515" id="subForm_1515" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(451,1515,3981);"></input></td>
           <td>ACR_311_FEAT_TST_APP</td>
           <td>0</td>
          <td>acr_311_feat_tst</td>
          <td>1515</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1563" id="subForm_1563" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(452,1563,47215);"></input></td>
           <td>SEQUIS_PRE_PROD</td>
           <td>0</td>
          <td>null</td>
          <td>1563</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>null</td>
          </tr>
	</form>
        
        <form name="subForm_1564" id="subForm_1564" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(453,1564,17771);"></input></td>
           <td>CKI_DEV_APP</td>
           <td>0</td>
          <td>cki_dev</td>
          <td>1564</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1565" id="subForm_1565" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(454,1565,50895);"></input></td>
           <td>SEG_LS_PRD_CFG</td>
           <td>0</td>
          <td>hao.xu</td>
          <td>1565</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1566" id="subForm_1566" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(455,1566,29829);"></input></td>
           <td>AIG_BR_AMS_GS_TST_APP</td>
           <td>0</td>
          <td>aig_br_ams_gs_tst</td>
          <td>1566</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1567" id="subForm_1567" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(456,1567,3547);"></input></td>
           <td>DAHSING_BIG_CR_TST_APP</td>
           <td>0</td>
          <td>dahsing_big_cr_tst</td>
          <td>1567</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1568" id="subForm_1568" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(457,1568,9881);"></input></td>
           <td>ACR_311_PRE_UAT_APP</td>
           <td>0</td>
          <td>acr_311_pre_uat</td>
          <td>1568</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>null</td>
          </tr>
	</form>
        
        <form name="subForm_1570" id="subForm_1570" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(458,1570,46477);"></input></td>
           <td>SEQUIS_PRE_PROD</td>
           <td>0</td>
          <td>kevin.xu</td>
          <td>1570</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1571" id="subForm_1571" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(459,1571,51111);"></input></td>
           <td>AIGBR_NA_DEV_GS</td>
           <td>0</td>
          <td>ben.lu</td>
          <td>1571</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1572" id="subForm_1572" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(460,1572,6495);"></input></td>
           <td>SEG_LS_PRD_CFG_APP</td>
           <td>0</td>
          <td>seg_ls_prd_cfg</td>
          <td>1572</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1573" id="subForm_1573" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(461,1573,7091);"></input></td>
           <td>SEQUIS_PRE_PROD</td>
           <td>0</td>
          <td>sequis_p2_dc</td>
          <td>1573</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1575" id="subForm_1575" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(462,1575,6231);"></input></td>
           <td>DAHSING_P2_MT_DEV</td>
           <td>0</td>
          <td>chuandong.qi</td>
          <td>1575</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1576" id="subForm_1576" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(463,1576,32579);"></input></td>
           <td>DAHSING_P2_MT_DEV</td>
           <td>0</td>
          <td>qi.zhang</td>
          <td>1576</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1579" id="subForm_1579" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(464,1579,7419);"></input></td>
           <td>AIGBR_NA_TST_GS_APP</td>
           <td>0</td>
          <td>Administrator</td>
          <td>1579</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>eBaoPrintService.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1580" id="subForm_1580" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(465,1580,33861);"></input></td>
           <td>DAHSING_BIG_CR_DEV_APP</td>
           <td>0</td>
          <td>dahsing_big_cr_dev</td>
          <td>1580</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1582" id="subForm_1582" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(466,1582,541);"></input></td>
           <td>GS_39_FEAT_TST_APP</td>
           <td>0</td>
          <td>gs_39_feat_tst</td>
          <td>1582</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1584" id="subForm_1584" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(467,1584,51195);"></input></td>
           <td>GS_39_FEAT_TST_APP</td>
           <td>0</td>
          <td>gs_39_feat_tst</td>
          <td>1584</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1585" id="subForm_1585" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(468,1585,35267);"></input></td>
           <td>AIG_BR_AMS_GS_TST_APP</td>
           <td>0</td>
          <td>aig_br_ams_gs_tst</td>
          <td>1585</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1587" id="subForm_1587" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(469,1587,13407);"></input></td>
           <td>GS_39X_API_TST_APP</td>
           <td>0</td>
          <td>gs_39x_api_tst</td>
          <td>1587</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>null</td>
          </tr>
	</form>
        
        <form name="subForm_1588" id="subForm_1588" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(470,1588,26997);"></input></td>
           <td>DAHSING_P2_MT_DEV</td>
           <td>0</td>
          <td>qi.zhang</td>
          <td>1588</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1636" id="subForm_1636" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(471,1636,43821);"></input></td>
           <td>AIG_BR_AMS_PD_RP_APP</td>
           <td>0</td>
          <td>aig_br_ams_pd_rp</td>
          <td>1636</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1638" id="subForm_1638" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(472,1638,31111);"></input></td>
           <td>ACR_311_FEAT_DEV_APP</td>
           <td>0</td>
          <td>acr_311_feat_dev</td>
          <td>1638</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1639" id="subForm_1639" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(473,1639,29263);"></input></td>
           <td>DAHSING_MT_PRE_UAT_APP</td>
           <td>0</td>
          <td>dahsing_mt_pre_uat</td>
          <td>1639</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1640" id="subForm_1640" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(474,1640,35523);"></input></td>
           <td>GS_39_FEAT_TST_APP</td>
           <td>0</td>
          <td>gs_39_feat_tst</td>
          <td>1640</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1641" id="subForm_1641" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(475,1641,8817);"></input></td>
           <td>AIG_BR_AMS_QUO_TST</td>
           <td>0</td>
          <td>aig_br_ams_quo_tst</td>
          <td>1641</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1642" id="subForm_1642" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(476,1642,32399);"></input></td>
           <td>GS_39X_API_TST_APP</td>
           <td>0</td>
          <td>gs_39x_api_tst</td>
          <td>1642</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1643" id="subForm_1643" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(477,1643,19839);"></input></td>
           <td>AIGBR_NA_DEV_RP_APP</td>
           <td>0</td>
          <td>aigbr_na_dev_rp</td>
          <td>1643</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1645" id="subForm_1645" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(478,1645,32917);"></input></td>
           <td>AIGBR_NA_DEV_RP_APP</td>
           <td>0</td>
          <td>aigbr_na_dev_rp</td>
          <td>1645</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1646" id="subForm_1646" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(479,1646,42935);"></input></td>
           <td>DAHSING_P2_MT_TST_READ</td>
           <td>0</td>
          <td>zhiwei.liu</td>
          <td>1646</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1649" id="subForm_1649" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(480,1649,35645);"></input></td>
           <td>DAHSING_P2_MT_DEV</td>
           <td>0</td>
          <td>zhiwei.liu</td>
          <td>1649</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1650" id="subForm_1650" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(481,1650,50495);"></input></td>
           <td>AIGBR_NA_DEV_GS</td>
           <td>0</td>
          <td>chengbin.sui</td>
          <td>1650</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1651" id="subForm_1651" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(482,1651,56903);"></input></td>
           <td>AIGBR_NA_DEV_GS</td>
           <td>0</td>
          <td>wenzheng.wang</td>
          <td>1651</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1653" id="subForm_1653" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(483,1653,40003);"></input></td>
           <td>AIGBR_NA_TST_RP_APP</td>
           <td>0</td>
          <td>aigbr_na_tst_rp</td>
          <td>1653</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1654" id="subForm_1654" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(484,1654,8275);"></input></td>
           <td>SEQUIS_PRE_PROD</td>
           <td>0</td>
          <td>sequis_p2_dc</td>
          <td>1654</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1656" id="subForm_1656" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(485,1656,40645);"></input></td>
           <td>GS_39_FEAT_DEV</td>
           <td>0</td>
          <td>jude.zhang</td>
          <td>1656</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1657" id="subForm_1657" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(486,1657,36473);"></input></td>
           <td>AIG_BR_AMS_GS_TST_APP</td>
           <td>0</td>
          <td>aig_br_ams_gs_tst</td>
          <td>1657</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1658" id="subForm_1658" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(487,1658,29355);"></input></td>
           <td>DAHSING_P2_MT_TST_APP</td>
           <td>0</td>
          <td>dahsing_p2_mt_tst</td>
          <td>1658</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1660" id="subForm_1660" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(488,1660,25021);"></input></td>
           <td>AIGBR_GW_MA_GC_APP</td>
           <td>0</td>
          <td>aigbr_gw_ma_gc</td>
          <td>1660</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1661" id="subForm_1661" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(489,1661,27907);"></input></td>
           <td>AIGBR_TR_SIT_GC_APP</td>
           <td>0</td>
          <td>aigbr_tr_sit_gc</td>
          <td>1661</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1707" id="subForm_1707" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(490,1707,63977);"></input></td>
           <td>AIGBR_NA_TST_GS_APP</td>
           <td>0</td>
          <td>aigbr_na_tst_gs</td>
          <td>1707</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1708" id="subForm_1708" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(491,1708,53839);"></input></td>
           <td>AIGBR_TR_SIT_GC_APP</td>
           <td>0</td>
          <td>aigbr_tr_sit_gc</td>
          <td>1708</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1710" id="subForm_1710" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(492,1710,39317);"></input></td>
           <td>SEQUIS_PRE_PROD</td>
           <td>0</td>
          <td>sequis_p2_dc</td>
          <td>1710</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1711" id="subForm_1711" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(493,1711,17517);"></input></td>
           <td>AIG_BR_AMS_GC_TST_APP</td>
           <td>0</td>
          <td>aig_br_ams_gc_tst</td>
          <td>1711</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1712" id="subForm_1712" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(494,1712,19889);"></input></td>
           <td>AIGBR_NA_DEV_GS</td>
           <td>0</td>
          <td>hao.du</td>
          <td>1712</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1713" id="subForm_1713" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(495,1713,8127);"></input></td>
           <td>AIGBR_BWEB_GS_DEV</td>
           <td>0</td>
          <td>lei.xu</td>
          <td>1713</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1715" id="subForm_1715" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(496,1715,14227);"></input></td>
           <td>AIGBR_BWEB_GS_TST_APP</td>
           <td>0</td>
          <td>aigbr_bweb_gs_tst</td>
          <td>1715</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1716" id="subForm_1716" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(497,1716,16189);"></input></td>
           <td>GS_39_FEAT_DEV_APP</td>
           <td>0</td>
          <td>gs_39_feat_dev</td>
          <td>1716</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1717" id="subForm_1717" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(498,1717,42231);"></input></td>
           <td>SEG_LS_PRD_CFG_APP</td>
           <td>0</td>
          <td>seg_ls_prd_cfg</td>
          <td>1717</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1718" id="subForm_1718" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(499,1718,24853);"></input></td>
           <td>AIG_BR_AMS_GS_TST_APP</td>
           <td>0</td>
          <td>aig_br_ams_gs_tst</td>
          <td>1718</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1720" id="subForm_1720" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(500,1720,61751);"></input></td>
           <td>AIG_BR_AMS_GC_TST_APP</td>
           <td>0</td>
          <td>aig_br_ams_gc_tst</td>
          <td>1720</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1723" id="subForm_1723" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(501,1723,25817);"></input></td>
           <td>AIGBR_BWEB_GS_TST_APP</td>
           <td>0</td>
          <td>aigbr_bweb_gs_tst</td>
          <td>1723</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1724" id="subForm_1724" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(502,1724,9773);"></input></td>
           <td>DAHSING_P2_MT_TST</td>
           <td>0</td>
          <td>xiuli.yu</td>
          <td>1724</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1725" id="subForm_1725" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(503,1725,9377);"></input></td>
           <td>AIGBR_BWEB_GC_PREUAT_APP</td>
           <td>0</td>
          <td>aigbr_bweb_gc_preuat</td>
          <td>1725</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1726" id="subForm_1726" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(504,1726,35761);"></input></td>
           <td>AIGBR_BWEB_GS_DEV</td>
           <td>0</td>
          <td>shengzhong.yu</td>
          <td>1726</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1729" id="subForm_1729" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(505,1729,9927);"></input></td>
           <td>ACR_311_FEAT_DEV_APP</td>
           <td>0</td>
          <td>acr_311_feat_dev</td>
          <td>1729</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1730" id="subForm_1730" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(506,1730,3995);"></input></td>
           <td>AIGBR_NA_DEV_GS</td>
           <td>0</td>
          <td>chengbin.sui</td>
          <td>1730</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1731" id="subForm_1731" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(507,1731,6011);"></input></td>
           <td>ACR_311_FEAT_TST_APP</td>
           <td>0</td>
          <td>acr_311_feat_tst</td>
          <td>1731</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1778" id="subForm_1778" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(508,1778,47815);"></input></td>
           <td>DAHSING_P2_MT_DEV</td>
           <td>0</td>
          <td>chuandong.qi</td>
          <td>1778</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1781" id="subForm_1781" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(509,1781,20643);"></input></td>
           <td>DAHSING_P2_MT_TST_READ</td>
           <td>0</td>
          <td>zhijie.shen</td>
          <td>1781</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1782" id="subForm_1782" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(510,1782,61885);"></input></td>
           <td>AIGBR_NA_DEV_GS</td>
           <td>0</td>
          <td>chengbin.sui</td>
          <td>1782</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1783" id="subForm_1783" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(511,1783,57037);"></input></td>
           <td>ACR_311_FEAT_TST_APP</td>
           <td>0</td>
          <td>acr_311_feat_tst</td>
          <td>1783</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1784" id="subForm_1784" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(512,1784,6205);"></input></td>
           <td>AIG_BR_AMS_PD_GC_APP</td>
           <td>0</td>
          <td>aig_br_ams_pd_gc</td>
          <td>1784</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1785" id="subForm_1785" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(513,1785,55757);"></input></td>
           <td>AIGBR_TR_SIT_GC_APP</td>
           <td>0</td>
          <td>aigbr_tr_sit_gc</td>
          <td>1785</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1786" id="subForm_1786" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(514,1786,9441);"></input></td>
           <td>AIGBR_GW_MA_GC_APP</td>
           <td>0</td>
          <td>aigbr_gw_ma_gc</td>
          <td>1786</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1787" id="subForm_1787" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(515,1787,35485);"></input></td>
           <td>SEG_LS_PRD_CFG_APP</td>
           <td>0</td>
          <td>seg_ls_prd_cfg</td>
          <td>1787</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1788" id="subForm_1788" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(516,1788,42643);"></input></td>
           <td>DAHSING_P2_MT_DEV</td>
           <td>0</td>
          <td>qi.zhang</td>
          <td>1788</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1789" id="subForm_1789" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(517,1789,4579);"></input></td>
           <td>SEG_LS_PRD_CFG_APP</td>
           <td>0</td>
          <td>seg_ls_prd_cfg</td>
          <td>1789</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1790" id="subForm_1790" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(518,1790,55999);"></input></td>
           <td>ACR_311_FEAT_DEV_APP</td>
           <td>0</td>
          <td>acr_311_feat_dev</td>
          <td>1790</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1791" id="subForm_1791" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(519,1791,6605);"></input></td>
           <td>SEQUIS_PRE_PROD</td>
           <td>0</td>
          <td>null</td>
          <td>1791</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>null</td>
          </tr>
	</form>
        
        <form name="subForm_1793" id="subForm_1793" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(520,1793,40615);"></input></td>
           <td>SEG_LS_PRD_CFG_APP</td>
           <td>0</td>
          <td>seg_ls_prd_cfg</td>
          <td>1793</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1794" id="subForm_1794" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(521,1794,2895);"></input></td>
           <td>GS_39X_API_TST_APP</td>
           <td>0</td>
          <td>gs_39x_api_tst</td>
          <td>1794</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1795" id="subForm_1795" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(522,1795,21975);"></input></td>
           <td>AIGBR_NA_DEV_GS_APP</td>
           <td>0</td>
          <td>aigbr_na_dev_gs</td>
          <td>1795</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1797" id="subForm_1797" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(523,1797,3777);"></input></td>
           <td>AIGBR_NA_DEV_GS</td>
           <td>0</td>
          <td>chengbin.sui</td>
          <td>1797</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1799" id="subForm_1799" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(524,1799,35205);"></input></td>
           <td>AIGBR_BWEB_GC_DEV_APP</td>
           <td>0</td>
          <td>aigbr_bweb_gc_dev</td>
          <td>1799</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1800" id="subForm_1800" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(525,1800,60111);"></input></td>
           <td>AIG_BR_AMS_RP_TST_APP</td>
           <td>0</td>
          <td>aig_br_ams_rp_tst</td>
          <td>1800</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1850" id="subForm_1850" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(526,1850,19291);"></input></td>
           <td>AIGBR_TR_SIT_GC_APP</td>
           <td>0</td>
          <td>aigbr_tr_sit_gc</td>
          <td>1850</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1852" id="subForm_1852" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(527,1852,21919);"></input></td>
           <td>DAHSING_P2_MT_TST_READ</td>
           <td>0</td>
          <td>zhiwei.liu</td>
          <td>1852</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1853" id="subForm_1853" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(528,1853,47489);"></input></td>
           <td>SEQUIS_PRE_PROD</td>
           <td>0</td>
          <td>sequis_p2_dc</td>
          <td>1853</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1854" id="subForm_1854" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(529,1854,24193);"></input></td>
           <td>AIG_BR_AMS_GS_TST_APP</td>
           <td>0</td>
          <td>aig_br_ams_gs_tst</td>
          <td>1854</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1855" id="subForm_1855" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(530,1855,10281);"></input></td>
           <td>GS_362_SGP_DEMO</td>
           <td>0</td>
          <td>gs_362_sgp_demo</td>
          <td>1855</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1856" id="subForm_1856" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(531,1856,19617);"></input></td>
           <td>GS_39_FEAT_TST_APP</td>
           <td>0</td>
          <td>gs_39_feat_tst</td>
          <td>1856</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1857" id="subForm_1857" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(532,1857,14633);"></input></td>
           <td>DAHSING_BIG_CR_DEV_APP</td>
           <td>0</td>
          <td>dahsing_big_cr_dev</td>
          <td>1857</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1859" id="subForm_1859" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(533,1859,16455);"></input></td>
           <td>SEQUIS_PRE_PROD</td>
           <td>0</td>
          <td>null</td>
          <td>1859</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>null</td>
          </tr>
	</form>
        
        <form name="subForm_1860" id="subForm_1860" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(534,1860,23629);"></input></td>
           <td>AIGBR_BWEB_GC_DEV_APP</td>
           <td>0</td>
          <td>aigbr_bweb_gc_dev</td>
          <td>1860</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1861" id="subForm_1861" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(535,1861,38291);"></input></td>
           <td>AIGBR_TR_SIT_GC_APP</td>
           <td>0</td>
          <td>aigbr_tr_sit_gc</td>
          <td>1861</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1862" id="subForm_1862" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(536,1862,52967);"></input></td>
           <td>AIGBR_GW_MA_GC_APP</td>
           <td>0</td>
          <td>aigbr_gw_ma_gc</td>
          <td>1862</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1863" id="subForm_1863" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(537,1863,28777);"></input></td>
           <td>GS_39_FEAT_DEV_APP</td>
           <td>0</td>
          <td>gs_39_feat_dev</td>
          <td>1863</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1864" id="subForm_1864" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(538,1864,28063);"></input></td>
           <td>CKI_DEV</td>
           <td>0</td>
          <td>mike.chen</td>
          <td>1864</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1865" id="subForm_1865" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(539,1865,15465);"></input></td>
           <td>AIGBR_BWEB_GS_TST_APP</td>
           <td>0</td>
          <td>aigbr_bweb_gs_tst</td>
          <td>1865</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1866" id="subForm_1866" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(540,1866,13349);"></input></td>
           <td>AIGBR_NA_DEV_GS</td>
           <td>0</td>
          <td>chengbin.sui</td>
          <td>1866</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1868" id="subForm_1868" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(541,1868,20229);"></input></td>
           <td>AIG_BR_AMS_GC_TST_APP</td>
           <td>0</td>
          <td>aig_br_ams_gc_tst</td>
          <td>1868</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1869" id="subForm_1869" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(542,1869,65373);"></input></td>
           <td>DAHSING_BIG_CR_TST_APP</td>
           <td>0</td>
          <td>dahsing_big_cr_tst</td>
          <td>1869</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1872" id="subForm_1872" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(543,1872,5997);"></input></td>
           <td>ACR_311_FEAT_DEV_APP</td>
           <td>0</td>
          <td>acr_311_feat_dev</td>
          <td>1872</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1920" id="subForm_1920" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(544,1920,1479);"></input></td>
           <td>ACR_311_FEAT_TST_READ</td>
           <td>0</td>
          <td>jie.li</td>
          <td>1920</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1921" id="subForm_1921" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(545,1921,4533);"></input></td>
           <td>AIGBR_BWEB_GC_DEV_APP</td>
           <td>0</td>
          <td>aigbr_bweb_gc_dev</td>
          <td>1921</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1922" id="subForm_1922" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(546,1922,59269);"></input></td>
           <td>SEQUIS_PRE_PROD</td>
           <td>0</td>
          <td>sequis_p2_dc</td>
          <td>1922</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1923" id="subForm_1923" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(547,1923,53263);"></input></td>
           <td>DAHSING_P2_MT_DEV</td>
           <td>0</td>
          <td>chuandong.qi</td>
          <td>1923</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1925" id="subForm_1925" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(548,1925,28513);"></input></td>
           <td>DAHSING_BIG_CR_TST_APP</td>
           <td>0</td>
          <td>dahsing_big_cr_tst</td>
          <td>1925</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1926" id="subForm_1926" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(549,1926,47625);"></input></td>
           <td>SEQUIS_PRE_PROD</td>
           <td>0</td>
          <td>sequis_p2_dc</td>
          <td>1926</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1927" id="subForm_1927" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(550,1927,25565);"></input></td>
           <td>AIGBR_BWEB_GS_DEV_APP</td>
           <td>0</td>
          <td>aigbr_bweb_gs_dev</td>
          <td>1927</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1928" id="subForm_1928" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(551,1928,4607);"></input></td>
           <td>DAHSING_BIG_CR_TST_APP</td>
           <td>0</td>
          <td>dahsing_big_cr_tst</td>
          <td>1928</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1930" id="subForm_1930" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(552,1930,47613);"></input></td>
           <td>CKI_DEV</td>
           <td>0</td>
          <td>mike.chen</td>
          <td>1930</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>ddm.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1936" id="subForm_1936" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(553,1936,21651);"></input></td>
           <td>DAHSING_P2_MT_DEV_APP</td>
           <td>0</td>
          <td>dahsing_p2_mt_dev</td>
          <td>1936</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1937" id="subForm_1937" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(554,1937,5537);"></input></td>
           <td>AIG_BR_AMS_GS_TST_APP</td>
           <td>0</td>
          <td>aig_br_ams_gs_tst</td>
          <td>1937</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1938" id="subForm_1938" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(555,1938,18623);"></input></td>
           <td>DAHSING_P2_MT_DEV</td>
           <td>0</td>
          <td>qi.zhang</td>
          <td>1938</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1939" id="subForm_1939" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(556,1939,1935);"></input></td>
           <td>DAHSING_BIG_CR_DEV_APP</td>
           <td>0</td>
          <td>dahsing_big_cr_dev</td>
          <td>1939</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1940" id="subForm_1940" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(557,1940,50421);"></input></td>
           <td>AIGBR_BWEB_GS_DEV_READ</td>
           <td>0</td>
          <td>libin.xi</td>
          <td>1940</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1941" id="subForm_1941" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(558,1941,62431);"></input></td>
           <td>ACR_311_FEAT_TST_APP</td>
           <td>0</td>
          <td>acr_311_feat_tst</td>
          <td>1941</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1944" id="subForm_1944" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(559,1944,34501);"></input></td>
           <td>AIG_BR_AMS_GS_TST_APP</td>
           <td>0</td>
          <td>aig_br_ams_gs_tst</td>
          <td>1944</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1989" id="subForm_1989" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(560,1989,51977);"></input></td>
           <td>ACR_311_FEAT_TST_APP</td>
           <td>0</td>
          <td>acr_311_feat_tst</td>
          <td>1989</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1991" id="subForm_1991" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(561,1991,10143);"></input></td>
           <td>SEQUIS_PRE_PROD</td>
           <td>0</td>
          <td>sequis_p2_dc</td>
          <td>1991</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1992" id="subForm_1992" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(562,1992,22101);"></input></td>
           <td>AIGBR_NA_DEV_GS</td>
           <td>0</td>
          <td>wenzheng.wang</td>
          <td>1992</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1993" id="subForm_1993" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(563,1993,16425);"></input></td>
           <td>DAHSING_BIG_CR_DEV_APP</td>
           <td>0</td>
          <td>dahsing_big_cr_dev</td>
          <td>1993</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1994" id="subForm_1994" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(564,1994,51935);"></input></td>
           <td>AIGBR_BWEB_GS_DEV</td>
           <td>0</td>
          <td>libin.xi</td>
          <td>1994</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>A5M2.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1996" id="subForm_1996" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(565,1996,54473);"></input></td>
           <td>AIG_BR_AMS_GC_TST_APP</td>
           <td>0</td>
          <td>aig_br_ams_gc_tst</td>
          <td>1996</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_1997" id="subForm_1997" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(566,1997,38443);"></input></td>
           <td>AIGBR_BWEB_GS_DEV_READ</td>
           <td>0</td>
          <td>libin.xi</td>
          <td>1997</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_1998" id="subForm_1998" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(567,1998,57787);"></input></td>
           <td>GS_39X_API_TST_APP</td>
           <td>0</td>
          <td>gs_39x_api_tst</td>
          <td>1998</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_2000" id="subForm_2000" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(568,2000,10141);"></input></td>
           <td>AIGBR_NA_DEV_RP_APP</td>
           <td>0</td>
          <td>aigbr_na_dev_rp</td>
          <td>2000</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_2001" id="subForm_2001" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(569,2001,32151);"></input></td>
           <td>ACR_311_FEAT_DEV_APP</td>
           <td>0</td>
          <td>acr_311_feat_dev</td>
          <td>2001</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>null</td>
          </tr>
	</form>
        
        <form name="subForm_2002" id="subForm_2002" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(570,2002,44861);"></input></td>
           <td>SEG_LS_PRD_CFG_APP</td>
           <td>0</td>
          <td>seg_ls_prd_cfg</td>
          <td>2002</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_2003" id="subForm_2003" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(571,2003,26645);"></input></td>
           <td>AIG_BR_AMS_PD_GC_APP</td>
           <td>0</td>
          <td>aig_br_ams_pd_gc</td>
          <td>2003</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_2004" id="subForm_2004" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(572,2004,3601);"></input></td>
           <td>AIGBR_GW_MA_GC_APP</td>
           <td>0</td>
          <td>aigbr_gw_ma_gc</td>
          <td>2004</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_2005" id="subForm_2005" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(573,2005,58773);"></input></td>
           <td>AIGBR_NA_TST_GS_APP</td>
           <td>0</td>
          <td>Administrator</td>
          <td>2005</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>eBaoPrintService.exe</td>
          </tr>
	</form>
        
        <form name="subForm_2007" id="subForm_2007" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(574,2007,11225);"></input></td>
           <td>AIG_BR_AMS_GC_TST_APP</td>
           <td>0</td>
          <td>aig_br_ams_gc_tst</td>
          <td>2007</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_2008" id="subForm_2008" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(575,2008,38433);"></input></td>
           <td>AIGBR_BWEB_GS_PREUAT_APP</td>
           <td>0</td>
          <td>aigbr_bweb_gs_preuat</td>
          <td>2008</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_2009" id="subForm_2009" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(576,2009,20833);"></input></td>
           <td>SEQUIS_PRE_PROD</td>
           <td>0</td>
          <td>null</td>
          <td>2009</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>null</td>
          </tr>
	</form>
        
        <form name="subForm_2010" id="subForm_2010" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(577,2010,48727);"></input></td>
           <td>CKI_DEV</td>
           <td>0</td>
          <td>johnson.ni</td>
          <td>2010</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_2011" id="subForm_2011" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(578,2011,47663);"></input></td>
           <td>DAHSING_P2_MT_TST_READ</td>
           <td>0</td>
          <td>chuandong.qi</td>
          <td>2011</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_2012" id="subForm_2012" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(579,2012,33843);"></input></td>
           <td>ACR_311_PRE_UAT_APP</td>
           <td>0</td>
          <td>acr_311_pre_uat</td>
          <td>2012</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_2014" id="subForm_2014" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(580,2014,42041);"></input></td>
           <td>GS_39_FEAT_TST_APP</td>
           <td>0</td>
          <td>gs_39_feat_tst</td>
          <td>2014</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>null</td>
          </tr>
	</form>
        
        <form name="subForm_2063" id="subForm_2063" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(581,2063,63581);"></input></td>
           <td>SEG_LS_PRD_CFG_APP</td>
           <td>0</td>
          <td>seg_ls_prd_cfg</td>
          <td>2063</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_2064" id="subForm_2064" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(582,2064,36027);"></input></td>
           <td>ACR_311_FEAT_DEV_APP</td>
           <td>0</td>
          <td>acr_311_feat_dev</td>
          <td>2064</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_2065" id="subForm_2065" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(583,2065,50369);"></input></td>
           <td>ACR_311_PRE_UAT_APP</td>
           <td>0</td>
          <td>acr_311_pre_uat</td>
          <td>2065</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_2066" id="subForm_2066" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(584,2066,43023);"></input></td>
           <td>AIG_BR_AMS_PD_GC_APP</td>
           <td>0</td>
          <td>aig_br_ams_pd_gc</td>
          <td>2066</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_2067" id="subForm_2067" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(585,2067,20857);"></input></td>
           <td>GS_39_FEAT_DEV_APP</td>
           <td>0</td>
          <td>gs_39_feat_dev</td>
          <td>2067</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_2069" id="subForm_2069" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(586,2069,31113);"></input></td>
           <td>AIGBR_BWEB_GC_DEV_APP</td>
           <td>0</td>
          <td>aigbr_bweb_gc_dev</td>
          <td>2069</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_2070" id="subForm_2070" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(587,2070,27575);"></input></td>
           <td>AIG_BR_AMS_PD_GC_APP</td>
           <td>0</td>
          <td>aig_br_ams_pd_gc</td>
          <td>2070</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_2072" id="subForm_2072" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(588,2072,46665);"></input></td>
           <td>DAHSING_P2_MT_DEV</td>
           <td>0</td>
          <td>jiajun.chen</td>
          <td>2072</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_2073" id="subForm_2073" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(589,2073,1635);"></input></td>
           <td>SEQUIS_PRE_PROD</td>
           <td>0</td>
          <td>shoujie.xie</td>
          <td>2073</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_2075" id="subForm_2075" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(590,2075,54341);"></input></td>
           <td>AIGBR_GW_MA_GC_APP</td>
           <td>0</td>
          <td>aigbr_gw_ma_gc</td>
          <td>2075</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_2076" id="subForm_2076" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(591,2076,43731);"></input></td>
           <td>ACR_311_PRE_UAT_APP</td>
           <td>0</td>
          <td>acr_311_pre_uat</td>
          <td>2076</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_2077" id="subForm_2077" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(592,2077,32069);"></input></td>
           <td>AIGBR_NA_DEV_GS_APP</td>
           <td>0</td>
          <td>aigbr_na_dev_gs</td>
          <td>2077</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_2078" id="subForm_2078" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(593,2078,22723);"></input></td>
           <td>DAHSING_P2_MT_DEV</td>
           <td>0</td>
          <td>jiajun.chen</td>
          <td>2078</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_2079" id="subForm_2079" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(594,2079,34317);"></input></td>
           <td>SEQUIS_PRE_PROD</td>
           <td>0</td>
          <td>kevin.xu</td>
          <td>2079</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_2082" id="subForm_2082" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(595,2082,9493);"></input></td>
           <td>AIG_BR_AMS_PD_GC_APP</td>
           <td>0</td>
          <td>aig_br_ams_pd_gc</td>
          <td>2082</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_2083" id="subForm_2083" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(596,2083,56305);"></input></td>
           <td>AIGBR_TR_SIT_GC_APP</td>
           <td>0</td>
          <td>aigbr_tr_sit_gc</td>
          <td>2083</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_2132" id="subForm_2132" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(597,2132,25213);"></input></td>
           <td>DAHSING_P2_MT_TST_READ</td>
           <td>0</td>
          <td>zhijie.shen</td>
          <td>2132</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_2133" id="subForm_2133" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(598,2133,15991);"></input></td>
           <td>AIGBR_NA_DEV_GS</td>
           <td>0</td>
          <td>robin.cai</td>
          <td>2133</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_2134" id="subForm_2134" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(599,2134,39715);"></input></td>
           <td>AIG_BR_AMS_PD_GS</td>
           <td>0</td>
          <td>tai.wang</td>
          <td>2134</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_2136" id="subForm_2136" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(600,2136,16909);"></input></td>
           <td>AIG_BR_AMS_PD_QUO</td>
           <td>0</td>
          <td>aig_br_ams_pd_quo</td>
          <td>2136</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_2137" id="subForm_2137" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(601,2137,43213);"></input></td>
           <td>AIGBR_NA_TST_RP_APP</td>
           <td>0</td>
          <td>aigbr_na_tst_rp</td>
          <td>2137</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_2138" id="subForm_2138" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(602,2138,9015);"></input></td>
           <td>AIG_BR_AMS_PD_RP_APP</td>
           <td>0</td>
          <td>aig_br_ams_pd_rp</td>
          <td>2138</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_2140" id="subForm_2140" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(603,2140,1559);"></input></td>
           <td>AIGBR_GW_MA_GC_APP</td>
           <td>0</td>
          <td>aigbr_gw_ma_gc</td>
          <td>2140</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_2141" id="subForm_2141" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(604,2141,21531);"></input></td>
           <td>AIGBR_NA_TST_RP_APP</td>
           <td>0</td>
          <td>aigbr_na_tst_rp</td>
          <td>2141</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_2143" id="subForm_2143" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(605,2143,25243);"></input></td>
           <td>ACR_311_FEAT_DEV_APP</td>
           <td>0</td>
          <td>acr_311_feat_dev</td>
          <td>2143</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_2144" id="subForm_2144" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(606,2144,48487);"></input></td>
           <td>DAHSING_P2_MT_TST_APP</td>
           <td>0</td>
          <td>dahsing_p2_mt_tst</td>
          <td>2144</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_2146" id="subForm_2146" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(607,2146,6595);"></input></td>
           <td>SEG_LS_PRD_CFG_APP</td>
           <td>0</td>
          <td>seg_ls_prd_cfg</td>
          <td>2146</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_2147" id="subForm_2147" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(608,2147,579);"></input></td>
           <td>AIG_BR_AMS_RP_TST_APP</td>
           <td>0</td>
          <td>aig_br_ams_rp_tst</td>
          <td>2147</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_2148" id="subForm_2148" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(609,2148,40229);"></input></td>
           <td>SEG_LS_PRD_CFG_APP</td>
           <td>0</td>
          <td>seg_ls_prd_cfg</td>
          <td>2148</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_2152" id="subForm_2152" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(610,2152,37641);"></input></td>
           <td>SEQUIS_PRE_PROD</td>
           <td>0</td>
          <td>sequis_p2_dc</td>
          <td>2152</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_2153" id="subForm_2153" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(611,2153,1521);"></input></td>
           <td>DAHSING_BIG_CR_DEV_APP</td>
           <td>0</td>
          <td>dahsing_big_cr_dev</td>
          <td>2153</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_2154" id="subForm_2154" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(612,2154,6385);"></input></td>
           <td>ACR_311_PRE_UAT_APP</td>
           <td>0</td>
          <td>acr_311_pre_uat</td>
          <td>2154</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_2156" id="subForm_2156" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(613,2156,13101);"></input></td>
           <td>AIG_BR_AMS_PD_GC_APP</td>
           <td>0</td>
          <td>aig_br_ams_pd_gc</td>
          <td>2156</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_2202" id="subForm_2202" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(614,2202,4421);"></input></td>
           <td>ACR_311_PRE_UAT_APP</td>
           <td>0</td>
          <td>acr_311_pre_uat</td>
          <td>2202</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_2203" id="subForm_2203" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(615,2203,46659);"></input></td>
           <td>AIGBR_GW_MA_GC_APP</td>
           <td>0</td>
          <td>aigbr_gw_ma_gc</td>
          <td>2203</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_2205" id="subForm_2205" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(616,2205,45155);"></input></td>
           <td>CKI_DEV</td>
           <td>0</td>
          <td>mike.chen</td>
          <td>2205</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_2207" id="subForm_2207" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(617,2207,37215);"></input></td>
           <td>AIG_BR_AMS_PD_GS</td>
           <td>0</td>
          <td>tai.wang</td>
          <td>2207</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_2209" id="subForm_2209" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(618,2209,48485);"></input></td>
           <td>GS_39X_API_TST_APP</td>
           <td>0</td>
          <td>gs_39x_api_tst</td>
          <td>2209</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_2210" id="subForm_2210" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(619,2210,29999);"></input></td>
           <td>DAHSING_BIG_CR_TST_APP</td>
           <td>0</td>
          <td>dahsing_big_cr_tst</td>
          <td>2210</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_2212" id="subForm_2212" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(620,2212,18091);"></input></td>
           <td>AIGBR_NA_DEV_GS</td>
           <td>0</td>
          <td>zhongbiao.cai</td>
          <td>2212</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_2215" id="subForm_2215" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(621,2215,39419);"></input></td>
           <td>AIG_BR_AMS_RP_TST_APP</td>
           <td>0</td>
          <td>aig_br_ams_rp_tst</td>
          <td>2215</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_2216" id="subForm_2216" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(622,2216,54531);"></input></td>
           <td>GS_39_FEAT_DEV</td>
           <td>0</td>
          <td>jingdong.wang</td>
          <td>2216</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_2217" id="subForm_2217" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(623,2217,37213);"></input></td>
           <td>AIG_BR_AMS_RP_TST_APP</td>
           <td>0</td>
          <td>aig_br_ams_rp_tst</td>
          <td>2217</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_2218" id="subForm_2218" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(624,2218,51507);"></input></td>
           <td>AIGBR_NA_DEV_GS</td>
           <td>0</td>
          <td>hao.du</td>
          <td>2218</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_2219" id="subForm_2219" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(625,2219,22607);"></input></td>
           <td>AIGBR_GW_MA_GS</td>
           <td>0</td>
          <td>pei.zhou</td>
          <td>2219</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_2221" id="subForm_2221" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(626,2221,11153);"></input></td>
           <td>DAHSING_P2_MT_DEV</td>
           <td>0</td>
          <td>chuandong.qi</td>
          <td>2221</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_2222" id="subForm_2222" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(627,2222,22779);"></input></td>
           <td>DAHSING_P2_MT_DEV</td>
           <td>0</td>
          <td>chuandong.qi</td>
          <td>2222</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_2223" id="subForm_2223" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(628,2223,48121);"></input></td>
           <td>AIGBR_GW_MA_GC_APP</td>
           <td>0</td>
          <td>aigbr_gw_ma_gc</td>
          <td>2223</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_2224" id="subForm_2224" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(629,2224,37401);"></input></td>
           <td>SEQUIS_PRE_PROD</td>
           <td>0</td>
          <td>shoujie.xie</td>
          <td>2224</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>plsqldev.exe</td>
          </tr>
	</form>
        
        <form name="subForm_2226" id="subForm_2226" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(630,2226,8351);"></input></td>
           <td>AIGBR_BWEB_QUO_TST</td>
           <td>0</td>
          <td>aigbr_bweb_quo_tst</td>
          <td>2226</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_2227" id="subForm_2227" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(631,2227,4701);"></input></td>
           <td>AIGBR_GW_MA_GC_APP</td>
           <td>0</td>
          <td>aigbr_gw_ma_gc</td>
          <td>2227</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
        <form name="subForm_2229" id="subForm_2229" method="post" action="/tsop/ts_db_session_query.jsp?db_sid=g19u1&db_ip=172.25.14.19&db_port=1521&act=kill">
          <tr>
	  <td><input type="submit" value="Kill" onclick="kill_sess(632,2229,7083);"></input></td>
           <td>GS_39X_API_TST_APP</td>
           <td>0</td>
          <td>gs_39x_api_tst</td>
          <td>2229</td>
          <td>null</td>
          <td>SQL*Net message from client</td>
          <td>JDBC Thin Client</td>
          </tr>
	</form>
        
  </tbody>
</table>
</div>



<BR>
<center><input type="button" onClick="window.close();" value="Close"> <input type="button" name="button2" value="Back" onClick="history.go(-1);window.location.reload()"></center>
		
		
</body>
</html>


