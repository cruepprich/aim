set serveroutput on 

--------------------------------------------------------
--  File created - Tuesday-November-03-2015   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Type T_ACTIVE_DS_REC
--------------------------------------------------------
prompt Create type T_ACTIVE_DB_REC

  CREATE OR REPLACE TYPE "T_ACTIVE_DB_REC" AS OBJECT (
          id             varchar2(255)
         ,name           varchar2(255)
         ,connection_str varchar2(255)
         ,description    varchar2(1000)
         ,state          varchar2(1000)
         ,status         varchar2(255)
);
/
--------------------------------------------------------
--  DDL for Type T_ACTIVE_DB_TAB
--------------------------------------------------------
prompt Create type T_ACTIVE_DB_TAB

  CREATE OR REPLACE TYPE "T_ACTIVE_DB_TAB" AS TABLE OF t_active_db_rec;
  /
--------------------------------------------------------
--  DDL for Type T_DS_STATS_REC
--------------------------------------------------------
prompt Create type T_DB_STATS_REC

  CREATE OR REPLACE TYPE "T_DB_STATS_REC" as object(
                       req_id                number
                      ,uri                   varchar2(255)
                      ,name                  varchar2(255)
                      ,state                 varchar2(255)
                      ,context_id            varchar2(255)
                      ,canonicallink         varchar2(255)
                      ,status                varchar2(255)
                      ,created_on            varchar2(255)
                      ,based_on              varchar2(255)
                      ,connection_str        varchar2(255)
                      ,target_type           varchar2(255)
                      ,destination_zone      varchar2(255)
                      ,last_backup           varchar2(255)
                      ,master_username       varchar2(255)
                      ,ds_version            varchar2(255)
                      ,uptime                varchar2(255)
                      ,total_sga             varchar2(255)
                      ,available_space       varchar2(255)
                      ,dbplatformtemplate_id varchar2(255)
                      ,dbaas_zone_id         varchar2(255)
                      ,instances             clob
                      ,instance_count        number
                      );
/
--------------------------------------------------------
--  DDL for Type T_DS_STATS_TAB
--------------------------------------------------------
prompt Create type T_DB_STATS_TAB

  CREATE OR REPLACE TYPE "T_DB_STATS_TAB" as table of t_db_stats_rec;
  /
--------------------------------------------------------
--  DDL for Type T_NAME_VALUE_REC
--------------------------------------------------------
prompt Create type T_NAME_VALUE_REC

  CREATE OR REPLACE TYPE "T_NAME_VALUE_REC" AS OBJECT (
          name varchar2(32767)
         ,value varchar2(32767)
);
  /
--------------------------------------------------------
--  DDL for Type T_NAME_VALUE_TAB
--------------------------------------------------------
prompt Create type T_NAME_VALUE_TAB

  CREATE OR REPLACE TYPE "T_NAME_VALUE_TAB" AS TABLE OF t_name_value_rec;
  /
--------------------------------------------------------
--  DDL for Type T_SERVICE_REQUESTS_REC
--------------------------------------------------------
prompt Create type T_SERVICE_REQUESTS_REC

  CREATE OR REPLACE TYPE "T_SERVICE_REQUESTS_REC" AS OBJECT (
          uri            varchar2(255)
         ,name           varchar2(255)
         ,media_type     varchar2(255)
         ,status         varchar2(1000)
         ,state          varchar2(255)
         ,lifecycle_type varchar2(255)
         ,canonical_link varchar2(1000)
);
  /
--------------------------------------------------------
--  DDL for Type T_SERVICE_REQUESTS_TAB
--------------------------------------------------------
prompt Create type T_SERVICE_REQUESTS_TAB

  CREATE OR REPLACE TYPE "T_SERVICE_REQUESTS_TAB" AS TABLE OF t_service_requests_rec;
  /
--------------------------------------------------------
--  DDL for Type T_SERVICE_TEMPLATES_REC
--------------------------------------------------------
prompt Create type T_SERVICE_TEMPLATES_REC

  CREATE OR REPLACE TYPE "T_SERVICE_TEMPLATES_REC" AS OBJECT (
          id             varchar2(255)
         ,name           varchar2(255)
         ,service_family varchar2(255)
         ,description    varchar2(1000)
         ,canonical_link varchar2(1000)
);
  /
--------------------------------------------------------
--  DDL for Type T_SERVICE_TEMPLATES_TAB
--------------------------------------------------------
prompt Create type T_SERVICE_TEMPLATES_TAB

  CREATE OR REPLACE TYPE "T_SERVICE_TEMPLATES_TAB" AS TABLE OF t_service_templates_rec;
  /
--------------------------------------------------------
--  DDL for Type T_VARCHAR2_REC
--------------------------------------------------------
prompt Create type T_VARCHAR2_REC

  CREATE OR REPLACE TYPE "T_VARCHAR2_REC" AS OBJECT (
          vc varchar2(32767)
);
  /
--------------------------------------------------------
--  DDL for Type T_VARCHAR2_TAB
--------------------------------------------------------
prompt Create type T_VARCHAR2_TAB

  CREATE OR REPLACE TYPE "T_VARCHAR2_TAB" AS TABLE OF t_varchar2_rec;
  /
--------------------------------------------------------
--  DDL for Type T_ZONES_REC
--------------------------------------------------------
prompt Create type T_ZONES_REC

  CREATE OR REPLACE TYPE "T_ZONES_REC" AS OBJECT (
          name varchar2(255)
         ,id   varchar2(255)
         ,type varchar2(255)
         ,canonical_link varchar2(1000)
);
/
--------------------------------------------------------
--  DDL for Type T_ZONES_TAB
--------------------------------------------------------
prompt Create type T_ZONES_TAB

  CREATE OR REPLACE TYPE "T_ZONES_TAB" AS TABLE OF t_zones_rec;
/
--------------------------------------------------------
--  DDL for Table SAMPLE_CLOBS
--------------------------------------------------------
prompt create table DS_SAMPLE_CLOBS

  CREATE TABLE "DS_SAMPLE_CLOBS" 
   (	"NAME" VARCHAR2(20), 
	"SAMPLE" CLOB
   );
/
















--------------------------------------------------------
--  DDL for Package DS_MGMT
--------------------------------------------------------
prompt create package ds_mgmt

  CREATE OR REPLACE PACKAGE "DS_MGMT" AS
    -- GET DBaaS Cloud Configuration
    FUNCTION dbaas_discover
        RETURN CLOB;
    -- GET DBaaS Zones
    FUNCTION dbaas_zones
        RETURN CLOB;
    -- GET DBaaS Service Templates
    FUNCTION dbaas_service_templates
        RETURN CLOB;
    -- GET DBaas Status
    FUNCTION dbaas_stat (l_req_id IN NUMBER)
        RETURN CLOB;
    -- DELETE DBaaS Database
    FUNCTION dbaas_delete_db (l_req_id IN NUMBER)
        RETURN CLOB;
    -- CREATE SMALL DBaaS Database
    FUNCTION dbaas_create_small_db (l_db_name IN VARCHAR2, l_db_desc IN VARCHAR2,
                                    l_db_username IN VARCHAR2, l_db_passwd IN VARCHAR2,
                                    l_srvc_name IN VARCHAR2, l_db_sid IN VARCHAR2)
        RETURN CLOB;
    -- PARSE Status of Database
    PROCEDURE dbaas_display_stat (stat_clob IN CLOB);

    -- Identified Running Databases
    Function dbaas_running_db (l_clob in CLOB)
        RETURN NUMBER;

    Function dbaas_successful_create (l_clob in CLOB)
        RETURN dbms_sql.varchar2_table;

    -- CREATE DBaaS Database via Template
    FUNCTION dbaas_create_db (l_db_name IN VARCHAR2, l_db_desc IN VARCHAR2,
                                            l_db_username IN VARCHAR2, l_db_passwd IN VARCHAR2,
                                            l_srvc_name IN VARCHAR2, l_db_sid IN VARCHAR2,
                                            l_dbplatformtemplate IN VARCHAR2)
        RETURN CLOB;

     -- STARTUP and SHUTDOWN Database
    FUNCTION dbaas_db_lifecycle (l_req_id IN VARCHAR2, l_action IN VARCHAR2)
        RETURN CLOB;

END ds_mgmt;
/

show err 
prompt create package body ds_mgmt

create or replace PACKAGE BODY "DS_MGMT" AS

    g_clob          CLOB;
    g_username      VARCHAR2(255) := 'cloud_demo_dbaas';
    g_passwd        VARCHAR2(255) := 'welcome1';
    g_wallet_path   VARCHAR2(255) := 'file:/home/oracle/clouddemo/wallet';
    g_wallet_pwd    VARCHAR2(255) := 'Enk1tec!';
    g_empty_headers apex_web_service.header_table;



  Function dbaas_discover RETURN CLOB
    IS
    l_method        VARCHAR2(10);
    l_url           VARCHAR2(255);

BEGIN

    apex_web_service.g_request_headers := g_empty_headers;
    --
    apex_web_service.g_request_headers(1).name := 'User-Agent';
    apex_web_service.g_request_headers(1).value := 'curl/7.43.0';
    --
    apex_web_service.g_request_headers(2).name := 'Accept';
    apex_web_service.g_request_headers(2).value := '*/*';

    l_url := 'https://acoem.enkitec.com:7802/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud';
    l_method := 'GET';

    g_clob := apex_web_service.make_rest_request(
        p_url => l_url,
        p_username => g_username,
        p_password => g_passwd,
        p_http_method => l_method,
        p_wallet_path => g_wallet_path,
        p_wallet_pwd => g_wallet_pwd);

        --DBMS_OUTPUT.PUT_LINE(g_clob);
        RETURN (g_clob);
END;


Function dbaas_zones RETURN CLOB
    IS
    l_method        VARCHAR2(255);
    l_url           VARCHAR2(255);


BEGIN

    apex_web_service.g_request_headers := g_empty_headers;
    --
    apex_web_service.g_request_headers(1).name := 'User-Agent';
    apex_web_service.g_request_headers(1).value := 'curl/7.43.0';
    --
    apex_web_service.g_request_headers(2).name := 'Accept';
    apex_web_service.g_request_headers(2).value := '*/*';
    --
    l_url := 'https://acoem.enkitec.com:7802/em/websvcs/restful/extws/cloudservices/admin/cfw/v1/paaszones/';
    l_method := 'GET';

    g_clob := apex_web_service.make_rest_request(
        p_url => l_url,
        p_username => g_username,
        p_password => g_passwd,
        p_http_method => l_method,
        p_wallet_path => g_wallet_path,
        p_wallet_pwd => g_wallet_pwd);

        --DBMS_OUTPUT.PUT_LINE(g_clob);
        RETURN (g_clob);
END;


Function dbaas_service_templates RETURN CLOB
    IS
    l_method        VARCHAR2(255);
    l_url           VARCHAR2(255);


BEGIN

    apex_web_service.g_request_headers := g_empty_headers;
    --
    apex_web_service.g_request_headers(1).name := 'User-Agent';
    apex_web_service.g_request_headers(1).value := 'curl/7.43.0';
    --
    apex_web_service.g_request_headers(2).name := 'Accept';
    apex_web_service.g_request_headers(2).value := '*/*';
    --
    l_url := 'https://acoem.enkitec.com:7802/em/websvcs/restful/extws/cloudservices/admin/cfw/v1/servicetemplates/';
    l_method := 'GET';

    g_clob := apex_web_service.make_rest_request(
        p_url => l_url,
        p_username => g_username,
        p_password => g_passwd,
        p_http_method => l_method,
        p_wallet_path => g_wallet_path,
        p_wallet_pwd => g_wallet_pwd);

        --DBMS_OUTPUT.PUT_LINE(g_clob);
        RETURN (g_clob);
END;


Function dbaas_stat (l_req_id IN NUMBER) RETURN CLOB
    IS
    l_method        VARCHAR2(255);
    l_url           VARCHAR2(255);


BEGIN

    apex_web_service.g_request_headers := g_empty_headers;
    --
    apex_web_service.g_request_headers(1).name := 'User-Agent';
    apex_web_service.g_request_headers(1).value := 'curl/7.43.0';
    --
    apex_web_service.g_request_headers(2).name := 'Accept';
    apex_web_service.g_request_headers(2).value := '*/*';
    --
    l_url := 'https://acoem.enkitec.com:7802/em/cloud/dbaas/dbplatforminstance/byrequest/' || l_req_id;
    l_method := 'GET';

    g_clob := apex_web_service.make_rest_request(
        p_url => l_url,
        p_username => g_username,
        p_password => g_passwd,
        p_http_method => l_method,
        p_wallet_path => g_wallet_path,
        p_wallet_pwd => g_wallet_pwd);

        --DBMS_OUTPUT.PUT_LINE(g_clob);
        RETURN (g_clob);
END;


Function dbaas_delete_db (l_req_id IN NUMBER) RETURN CLOB
    IS
    l_method        VARCHAR2(255);
    l_url           VARCHAR2(255);


BEGIN

    apex_web_service.g_request_headers := g_empty_headers;
    --
    apex_web_service.g_request_headers(1).name := 'User-Agent';
    apex_web_service.g_request_headers(1).value := 'curl/7.43.0';
    --
    apex_web_service.g_request_headers(2).name := 'Accept';
    apex_web_service.g_request_headers(2).value := 'application/oracle.com.cloud.common.DbPlatformInstance+json';
    --
    l_url := 'https://acoem.enkitec.com:7802/em/cloud/dbaas/dbplatforminstance/byrequest/' || l_req_id;
    l_method := 'DELETE';

    g_clob := apex_web_service.make_rest_request(
        p_url => l_url,
        p_username => g_username,
        p_password => g_passwd,
        p_http_method => l_method,
        p_wallet_path => g_wallet_path,
        p_wallet_pwd => g_wallet_pwd);

        --DBMS_OUTPUT.PUT_LINE(g_clob);
        RETURN (g_clob);
END;

Function dbaas_create_small_db (l_db_name IN VARCHAR2, l_db_desc IN VARCHAR2,
                                            l_db_username IN VARCHAR2, l_db_passwd IN VARCHAR2,
                                            l_srvc_name IN VARCHAR2, l_db_sid IN VARCHAR2) RETURN CLOB

    IS

    l_body          CLOB;
    l_url           VARCHAR2(255);
    l_method        VARCHAR2(255);


BEGIN

    --
    apex_web_service.g_request_headers := g_empty_headers;
    --
    apex_web_service.g_request_headers(1).name := 'User-Agent';
    apex_web_service.g_request_headers(1).value := 'curl/7.43.0';
    --
    apex_web_service.g_request_headers(2).name := 'Accept';
    apex_web_service.g_request_headers(2).value := '*/*';
    --
    apex_web_service.g_request_headers(3).name := 'Content-Type';
    apex_web_service.g_request_headers(3).value := 'application/oracle.com.cloud.common.DbPlatformInstance+json';

    l_url := 'https://acoem.enkitec.com:7802/em/cloud/dbaas/dbplatformtemplate/20465263F69329B6E05365ED090A67A7';
    l_method := 'POST';


    l_body := '{"zone":"/em/cloud/dbaas/zone/7F97FFAAF2AF873C6468E49011A14299","name":"' || l_db_name
            || '","description":"' || l_db_desc || '","params":{"username":"' || l_db_username || '","password":"'
            || l_db_passwd || '" ,"service_name":"' || l_srvc_name || '", "database_sid":"' || l_db_sid || '"}}';

    g_clob := apex_web_service.make_rest_request(
        p_url => l_url,
        p_username => g_username,
        p_password => g_passwd,
        p_http_method => l_method,
        p_body => l_body,
        p_wallet_path => g_wallet_path,
        p_wallet_pwd => g_wallet_pwd);

        --DBMS_OUTPUT.PUT_LINE(g_clob);
        RETURN (g_clob);
END;



PROCEDURE dbaas_display_stat (stat_clob IN CLOB)
IS


--declare
j_uri varchar2(255);
j_name varchar2(255);
j_state varchar2(255);
j_context_id varchar2(255);
j_canonicalLink varchar2(255);
j_status varchar2(255);
j_created_on    varchar2(255);
j_based_on varchar2(255);
j_connection_str varchar2(255);
j_target_type varchar2(255);
j_destination_zone varchar2(255);
j_last_backup varchar2(255);
j_master_username varchar2(255);
j_db_version varchar2(255);
j_uptime varchar2(255);
j_total_sga varchar2(255);
j_available_space varchar2(255);
j_dbplatformtemplate_id varchar2(50);
j_dbaas_zone_id varchar2(50);



--loop variables
ndex number;
ndex2 number;
i number;
k number;

-- JSON Data Vars
inst_ma varchar2(25);
j apex_json.t_values;
l_clob   varchar2 (32767)
        := stat_clob;

begin
    apex_json.parse(l_clob);
    apex_json.parse(j, l_clob);

    j_uri := ('uri: ' || apex_json.get_varchar2 ('uri'));
    j_name := ('name: ' || apex_json.get_varchar2 ('name'));
    j_state := ('DB State: ' || apex_json.get_varchar2 ('resource_state.state'));
    j_context_id := ('Request ID: ' || apex_json.get_varchar2 ('context_id'));
    j_status := ('DB Status: ' || apex_json.get_varchar2 ('status'));
    j_created_on := ('Created On: ' || apex_json.get_varchar2 ('created'));
    j_based_on := ('Template: ' || apex_json.get_varchar2 ('based_on'));
    j_connection_str := ('Connection String: ' || apex_json.get_varchar2 ('connect_string'));
    j_destination_zone := ('DBaaS Zone: ' || apex_json.get_varchar2 ('destination_zone'));
    j_master_username := ('Master username: ' || apex_json.get_varchar2 ('master_username'));
    j_db_version := ('Database Version: ' || apex_json.get_varchar2 ('ds_version'));
    j_uptime := (apex_json.get_varchar2('measurable_attributes[1].name') || ': ' ||
                apex_json.get_varchar2('measurable_attributes[1].value') || ' ' ||
                apex_json.get_varchar2('measurable_attributes[1].units'));
    j_total_sga := (apex_json.get_varchar2('measurable_attributes[2].name') || ': ' ||
                apex_json.get_varchar2('measurable_attributes[2].value') || ' ' ||
                apex_json.get_varchar2('measurable_attributes[2].units'));
    j_available_space := (apex_json.get_varchar2('measurable_attributes[3].name') || ': ' ||
                apex_json.get_varchar2('measurable_attributes[3].value') || ' ' ||
                apex_json.get_varchar2('measurable_attributes[3].units'));
    ndex := (apex_json.get_count(p_path=>'instances', p_values=>j));
    for i in 1 .. ndex loop
 /*       dbms_output.put_line (apex_json.get_varchar2 ('instances[%d].name', i) || ': '
            || apex_json.get_varchar2 ('instances[%d].average_active_sessions', i) || ' '
            || apex_json.get_varchar2 ('instances[%d].allocated_sessions',i) );
*/
            inst_ma := 'instances[' || i || ']';
           ndex2 := (apex_json.get_count(p_path=> inst_ma || '.measurable_attributes', p_values=>j));
            for k in 1 .. ndex2 loop
                    dbms_output.put_line (apex_json.get_varchar2 (inst_ma||'.measurable_attributes[%d].name', k) || ': '
                        || apex_json.get_varchar2 (inst_ma||'.measurable_attributes[%d].value', k) || ' '
                        || apex_json.get_varchar2 (inst_ma||'.measurable_attributes[%d].units',k) );
            end loop;
    end loop;

    dbms_output.put_line (j_uptime);
    dbms_output.put_line (j_total_sga);
    dbms_output.put_line (j_available_space);

    j_dbaas_zone_id := substr(j_destination_zone,INSTR(j_destination_zone, '/', -1, 1)+1);
    j_dbplatformtemplate_id := substr(j_based_on,INSTR(j_based_on, '/', -1, 1)+1);
    dbms_output.put_line ('PAAS_ZONE: ' || j_dbaas_zone_id);
    dbms_output.put_line ('Template ID: ' || j_dbplatformtemplate_id);
end;


Function dbaas_running_db (l_clob in CLOB) RETURN NUMBER

IS
inst_state varchar2(25);
inst_status varchar2(25);
j apex_json.t_values;

begin
    apex_json.parse(l_clob);
    apex_json.parse(j, l_clob);
    inst_state := (apex_json.get_varchar2('resource_state.state')) ;
    inst_status := (apex_json.get_varchar2('status'));
    if (inst_state = 'READY') then
        if (inst_status = 'RUNNING') then
            RETURN (1);
        elsif (inst_status = 'STOPPED') then        --Added to account for Stopped databases in the Home Screen
           RETURN (1);                              -- Dbryant 10/19/2015 22:02
            else RETURN(0);
        end if;
    end if;
end;

Function dbaas_successful_create (l_clob in CLOB) RETURN dbms_sql.varchar2_table

IS

reqid_array dbms_sql.varchar2_table;
running_db_array dbms_sql.varchar2_table;
reqid varchar2(255);
reqid2_create varchar2(255);
ndex number;
ndex2 number;
i number := 1;
k number := 1;
l number := 1;
m number := 1;
j_total number;
inst_ma varchar2(25);
lifecycle varchar2(25);
j apex_json.t_values;
x apex_json.t_values;
s_clob   varchar2 (32767);

begin
    apex_json.parse(l_clob);
    --apex_json.parse(j, l_clob);
    ndex := (apex_json.get_varchar2('service_requests.total'));
    loop
        inst_ma := (apex_json.get_varchar2('service_requests.elements[%d].status',i)) ;
             lifecycle := (apex_json.get_varchar2('service_requests.elements[%d].lifecycle_type',i));
             reqid := (apex_json.get_varchar2('service_requests.elements[%d].name',i));
             if (inst_ma = 'SUCCESS') then
               if (lifecycle = 'CREATE') then
                    reqid2_create := regexp_substr(reqid,'[^#]+',1,2);
                    reqid_array(k) := reqid2_create;
                    k := k+1;
               end if;
            end if;
             i := i+1;
             if i > ndex then exit; end if;
    end loop;
   for l in 1 .. reqid_array.count LOOP
        s_clob := ds_mgmt.dbaas_stat(reqid_array(l));
        ndex2 := dbaas_running_db (s_clob);
        if ndex2 = 1 then
            running_db_array(m) := reqid_array(l);
            m := m+1;
        end if;
    end Loop;
RETURN (running_db_array);
end;


Function dbaas_create_db (l_db_name IN VARCHAR2, l_db_desc IN VARCHAR2,
                                            l_db_username IN VARCHAR2, l_db_passwd IN VARCHAR2,
                                            l_srvc_name IN VARCHAR2, l_db_sid IN VARCHAR2,
                                            l_dbplatformtemplate IN VARCHAR2) RETURN CLOB

    IS

    l_body          CLOB;
    l_url           VARCHAR2(255);
    l_method        VARCHAR2(255);


BEGIN

    --
    apex_web_service.g_request_headers := g_empty_headers;
    --
    apex_web_service.g_request_headers(1).name := 'User-Agent';
    apex_web_service.g_request_headers(1).value := 'curl/7.43.0';
    --
    apex_web_service.g_request_headers(2).name := 'Accept';
    apex_web_service.g_request_headers(2).value := '*/*';
    --
    apex_web_service.g_request_headers(3).name := 'Content-Type';
    apex_web_service.g_request_headers(3).value := 'application/oracle.com.cloud.common.DbPlatformInstance+json';

    l_url := 'https://acoem.enkitec.com:7802/em/cloud/dbaas/dbplatformtemplate/'|| l_dbplatformtemplate;
    l_method := 'POST';


    l_body := '{"zone":"/em/cloud/dbaas/zone/7F97FFAAF2AF873C6468E49011A14299","name":"' || l_db_name
            || '","description":"' || l_db_desc || '","params":{"username":"' || l_db_username || '","password":"'
            || l_db_passwd || '" ,"service_name":"' || l_srvc_name || '", "database_sid":"' || l_db_sid || '"}}';

    g_clob := apex_web_service.make_rest_request(
        p_url => l_url,
        p_username => g_username,
        p_password => g_passwd,
        p_http_method => l_method,
        p_body => l_body,
        p_wallet_path => g_wallet_path,
        p_wallet_pwd => g_wallet_pwd);

        DBMS_OUTPUT.PUT_LINE(g_clob);
        RETURN (g_clob);
END;


Function dbaas_db_lifecycle (l_req_id IN VARCHAR2, l_action IN VARCHAR2) RETURN CLOB

    IS

    l_body          CLOB;
    l_clob          CLOB;
    l_url           VARCHAR2(255);
    l_username      VARCHAR2(255);
    l_passwd        VARCHAR2(255);
    l_method        VARCHAR2(255);
    l_wallet_path   VARCHAR2(255);
    l_wallet_pwd    VARCHAR2(255);
    l_empty_headers apex_web_service.header_table;

  lc_scope_prefix constant varchar2(31) := 'get_db_lifecycle_result';

  l_procname varchar2(30) := lc_scope_prefix;
  l_scope logger_logs.scope%type := lc_scope_prefix || 'todo_proc_name';
  l_params logger.tab_param;
BEGIN
  logger.append_param(l_params, 'l_req_id', l_req_id);
  logger.append_param(l_params, 'l_action', l_action);
  logger.log('start', l_scope, null, l_params);
    --
    apex_web_service.g_request_headers := l_empty_headers;
    --
    apex_web_service.g_request_headers(1).name := 'User-Agent';
    apex_web_service.g_request_headers(1).value := 'curl/7.43.0';
    --
    apex_web_service.g_request_headers(2).name := 'Accept';
    apex_web_service.g_request_headers(2).value := '*/*';
    --
    apex_web_service.g_request_headers(3).name := 'Content-Type';
    apex_web_service.g_request_headers(3).value := 'application/oracle.com.cloud.common.DbPlatformInstance+json';

    logger.log('finished web service',l_scope,null,l_params);

    l_url := 'https://acoem.enkitec.com:7802/em/cloud/dbaas/dbplatforminstance/byrequest/' || l_req_id;
    l_username := 'cloud_demo_dbaas';
    l_passwd := 'welcome1';
    l_method := 'POST';
    l_wallet_path := 'file:/u01/OracleHomes/db/admin/emrepus/wallet';
    l_wallet_pwd := 'Enk1tec!';

    l_body := '{"operation":"' || l_action || '"}';

    logger.log('about to make l_clob',l_scope,null,l_params);
    l_clob := apex_web_service.make_rest_request(
        p_url => l_url,
        p_username => l_username,
        p_password => l_passwd,
        p_http_method => l_method,
        p_body => l_body,
        p_wallet_path => g_wallet_path,
        p_wallet_pwd => g_wallet_pwd);
    logger.log('l_clob done',l_scope,null,l_params);
        --DBMS_OUTPUT.PUT_LINE(l_clob);
        RETURN (l_clob);
END;

END ds_mgmt;
/

show err











--------------------------------------------------------
--  DDL for Package DS_VIEWS
--------------------------------------------------------
prompt create package ds_views

  CREATE OR REPLACE PACKAGE "DS_VIEWS" as



function zones
  return t_zones_tab
  pipelined;

function service_templates
  return t_service_templates_tab
  pipelined;

function service_requests
  return t_service_requests_tab
  pipelined;

function active_databases_old
  return t_active_db_tab
  pipelined;


function active_databases
  return t_db_stats_tab
  pipelined;


function db_platform_ids
  return t_name_value_tab
  pipelined;

procedure refresh_active_databases;

/* get_create_db_result
   Parses clob from dbaas_create_small_db
   and returns status and id
 */
procedure get_create_db_result(p_clob in clob
                              ,x_status out varchar2
                              ,x_id out pls_integer);

procedure get_delete_db_result(p_clob in clob
                              ,x_req_id out number
                              ,x_status out varchar2);

function get_active_database_count
  return pls_integer;

procedure get_db_stat (p_req_id                 in number
                      ,x_uri                   out varchar2
                      ,x_name                  out varchar2
                      ,x_state                 out varchar2
                      ,x_context_id            out varchar2
                      ,x_canonicallink         out varchar2
                      ,x_status                out varchar2
                      ,x_created_on            out varchar2
                      ,x_based_on              out varchar2
                      ,x_connection_str        out varchar2
                      ,x_target_type           out varchar2
                      ,x_destination_zone      out varchar2
                      ,x_last_backup           out varchar2
                      ,x_master_username       out varchar2
                      ,x_db_version            out varchar2
                      ,x_uptime                out varchar2
                      ,x_total_sga             out varchar2
                      ,x_available_space       out varchar2
                      ,x_dbplatformtemplate_id out varchar2
                      ,x_dbaas_zone_id         out varchar2
                      ,x_instances             out clob
                      ,x_instance_count        out pls_integer
);



function get_failure_message(p_clob in clob)
  return varchar2;



procedure get_db_lifecycle_result(
     p_req_id in varchar2
    ,p_action in varchar2
    ,x_req_id out number
    ,x_status out varchar2);




end ds_views;
/

show err














prompt create package body ds_views

create or replace package body ds_views as

g_discover_clob clob;

function zones
return t_zones_tab
pipelined is
  l_zones clob;
begin
  select ds_mgmt.dbaas_zones
    into l_zones
    from dual;

  apex_json.parse(l_zones);
  for idx in 1..apex_json.get_count(p_path => 'items') loop

    pipe row (t_zones_rec(
        name           => apex_json.get_varchar2(p_path => 'items['||idx||'].name')
       ,id             => apex_json.get_varchar2(p_path => 'items['||idx||'].id')
       ,type           => apex_json.get_varchar2(p_path => 'items['||idx||'].type')
       ,canonical_link => apex_json.get_varchar2(p_path => 'items['||idx||'].canonicalLink')
       )
    );

  end loop;

end zones;

function service_templates
return t_service_templates_tab
pipelined is
  l_service_templates clob;
begin
  select ds_mgmt.dbaas_service_templates
    into l_service_templates
    from dual;

  apex_json.parse(l_service_templates);
  for idx in 1..apex_json.get_count(p_path => 'items') loop

    pipe row (t_service_templates_rec(
        name           => apex_json.get_varchar2(p_path => 'items['||idx||'].name')
       ,id             => apex_json.get_varchar2(p_path => 'items['||idx||'].id')
       ,service_family => apex_json.get_varchar2(p_path => 'items['||idx||'].serviceFamily')
       ,description    => apex_json.get_varchar2(p_path => 'items['||idx||'].description')
       ,canonical_link => apex_json.get_varchar2(p_path => 'items['||idx||'].canonicalLink')
       )
    );

  end loop;
end service_templates;





function service_requests
return t_service_requests_tab
pipelined is
  l_service_requests clob;
begin
  l_service_requests := ds_mgmt.dbaas_discover;

  apex_json.parse(l_service_requests);
  for idx in 1..apex_json.get_count(p_path => 'service_requests.elements') loop

    pipe row (t_service_requests_rec(
        uri            => apex_json.get_varchar2(p_path => 'service_requests.elements['||idx||'].uri')
       ,name           => apex_json.get_varchar2(p_path => 'service_requests.elements['||idx||'].name')
       ,media_type     => apex_json.get_varchar2(p_path => 'service_requests.elements['||idx||'].media_type')
       ,status         => apex_json.get_varchar2(p_path => 'service_requests.elements['||idx||'].status')
       ,state          => apex_json.get_varchar2(p_path => 'service_requests.elements['||idx||'].state')
       ,lifecycle_type => apex_json.get_varchar2(p_path => 'service_requests.elements['||idx||'].lifecycle_type')
       ,canonical_link => apex_json.get_varchar2(p_path => 'service_requests.elements['||idx||'].canonicalLink')
       )
    );

  end loop;
end service_requests;

function active_databases_old
return t_active_db_tab
pipelined
is
  l_ids                      dbms_sql.varchar2_table;
  l_collection_name constant varchar2(16) := 'ACTIVE_DATABASES';
  l_last_updated             date;
  l_databases                pls_integer;
  l_values                   apex_json.t_values;


  l_uri                   varchar2(255);
  l_name                  varchar2(255);
  l_state                 varchar2(255);
  l_context_id            varchar2(255);
  l_canonicalLink         varchar2(255);
  l_status                varchar2(255);
  l_created_on            varchar2(255);
  l_based_on              varchar2(255);
  l_connection_str        varchar2(255);
  l_target_type           varchar2(255);
  l_destination_zone      varchar2(255);
  l_last_backup           varchar2(255);
  l_master_username       varchar2(255);
  l_db_version            varchar2(255);
  l_uptime                varchar2(255);
  l_total_sga             varchar2(255);
  l_available_space       varchar2(255);
  l_dbplatformtemplate_id varchar2(50);
  l_dbaas_zone_id         varchar2(50);
  l_instances             clob;
  l_instance_count        pls_integer;

begin


    l_ids := ds_mgmt.dbaas_successful_create(ds_mgmt.dbaas_discover);
    l_databases := l_ids.count;

    for idx in 1..l_ids.count loop
         ds_views.get_db_stat(
           p_req_id                => l_ids(idx)
          ,x_uri                   => l_uri
          ,x_name                  => l_name
          ,x_state                 => l_state
          ,x_context_id            => l_context_id
          ,x_canonicallink         => l_canonicallink
          ,x_status                => l_status
          ,x_created_on            => l_created_on
          ,x_based_on              => l_based_on
          ,x_connection_str        => l_connection_str
          ,x_target_type           => l_target_type
          ,x_destination_zone      => l_destination_zone
          ,x_last_backup           => l_last_backup
          ,x_master_username       => l_master_username
          ,x_db_version            => l_db_version
          ,x_uptime                => l_uptime
          ,x_total_sga             => l_total_sga
          ,x_available_space       => l_available_space
          ,x_dbplatformtemplate_id => l_dbplatformtemplate_id
          ,x_dbaas_zone_id         => l_dbaas_zone_id
          ,x_instances             => l_instances
          ,x_instance_count        => l_instance_count
        );

        pipe row (t_active_db_rec(
          id             => l_ids(idx)
         ,name           => l_name
         ,connection_str => l_connection_str
         ,description    => null
         ,state          => l_state
         ,status         => l_status
        ));
    end loop;

    --return l_databases;
end active_databases_old;

function active_databases
return t_db_stats_tab
pipelined
is
  lc_scope_prefix constant VARCHAR2(31) := 'active_databases';
  l_procname VARCHAR2(30) := 'activeDatabases';
  l_params logger.tab_param;
  l_scope logger_logs.scope%type := lc_scope_prefix;

  l_ids dbms_sql.varchar2_table;
  l_db_name varchar2(255);
  l_create_id varchar2(255);
  l_total_requests number;
  l_sr_status varchar2(25);
  l_lifecycle varchar2(25);

  -- Database Attrbutes
  l_uri                   varchar2(255);
  l_name                  varchar2(255);
  l_state                 varchar2(255);
  l_context_id            varchar2(255);
  l_canonicalLink         varchar2(255);
  l_status                varchar2(255);
  l_created_on            varchar2(255);
  l_based_on              varchar2(255);
  l_connection_str        varchar2(255);
  l_target_type           varchar2(255);
  l_destination_zone      varchar2(255);
  l_last_backup           varchar2(255);
  l_master_username       varchar2(255);
  l_db_version            varchar2(255);
  l_uptime                varchar2(255);
  l_total_sga             varchar2(255);
  l_available_space       varchar2(255);
  l_dbplatformtemplate_id varchar2(50);
  l_dbaas_zone_id         varchar2(50);
  l_instances             clob;
  l_instance_count        pls_integer;

  l_json apex_json.t_values;
begin
  logger.log('START', l_scope, null, l_params);

  apex_json.parse(p_values => l_json,p_source => ds_mgmt.dbaas_discover);

  l_total_requests := apex_json.get_varchar2(p_path => 'service_requests.total',p_values => l_json);
  for idx in 1..l_total_requests loop
      l_sr_status := (apex_json.get_varchar2(p_path =>'service_requests.elements[%d].status',p0 => idx, p_values => l_json)) ;
           l_lifecycle := (apex_json.get_varchar2(p_path =>'service_requests.elements[%d].lifecycle_type',p0 => idx, p_values => l_json));
           l_db_name := (apex_json.get_varchar2(p_path =>'service_requests.elements[%d].name',p0 => idx, p_values => l_json));

if l_db_name like '%cmr9%' then
  logger.log('got cmr9 l_db_name,l_lifecycle,l_sr_status: '||l_db_name||','||l_lifecycle||','||l_sr_status,l_scope,null,l_params);
end if;
             if l_lifecycle = 'CREATE'
                and (l_sr_status = 'SUCCESS'
                  or l_sr_status = 'IN_PROGRESS'
                  or l_sr_status = 'EXECUTING'
                  )   then

                  l_create_id := regexp_substr(l_db_name,'[^#]+',1,2);

            ds_views.get_db_stat(
                 p_req_id                => l_create_id
                ,x_uri                   => l_uri
                ,x_name                  => l_name
                ,x_state                 => l_state
                ,x_context_id            => l_context_id
                ,x_canonicallink         => l_canonicallink
                ,x_status                => l_status
                ,x_created_on            => l_created_on
                ,x_based_on              => l_based_on
                ,x_connection_str        => l_connection_str
                ,x_target_type           => l_target_type
                ,x_destination_zone      => l_destination_zone
                ,x_last_backup           => l_last_backup
                ,x_master_username       => l_master_username
                ,x_db_version            => l_db_version
                ,x_uptime                => l_uptime
                ,x_total_sga             => l_total_sga
                ,x_available_space       => l_available_space
                ,x_dbplatformtemplate_id => l_dbplatformtemplate_id
                ,x_dbaas_zone_id         => l_dbaas_zone_id
                ,x_instances             => l_instances
                ,x_instance_count        => l_instance_count
              );

if l_db_name like '%cmr9%' then
  logger.log('got cmr9 again l_db_name,l_state,l_status: '||l_db_name||','||l_state||','||l_status,l_scope,null,l_params);
end if;
            if (l_state = 'READY' or l_state = 'CREATING' or l_state = 'DESTROYING')
              and (l_status = 'RUNNING'
                   or l_status = 'STOPPED'
                   or l_status = 'IN_PROGRESS'
                   or l_status = 'UNREACHABLE') then

                    pipe row (t_db_stats_rec (
                         req_id                => l_create_id
                        ,uri                   => l_uri
                        ,name                  => l_name
                        ,state                 => l_state
                        ,context_id            => l_context_id
                        ,canonicallink         => l_canonicallink
                        ,status                => l_status
                        ,created_on            => l_created_on
                        ,based_on              => l_based_on
                        ,connection_str        => l_connection_str
                        ,target_type           => l_target_type
                        ,destination_zone      => l_destination_zone
                        ,last_backup           => l_last_backup
                        ,master_username       => l_master_username
                        ,ds_version            => l_db_version
                        ,uptime                => l_uptime
                        ,total_sga             => l_total_sga
                        ,available_space       => l_available_space
                        ,dbplatformtemplate_id => l_dbplatformtemplate_id
                        ,dbaas_zone_id         => l_dbaas_zone_id
                        ,instances             => l_instances
                        ,instance_count        => l_instance_count
                    ));

             end if;
          end if;
  end loop;

  logger.log('END', l_scope);
exception
    when others then
      logger.log_error('Unhandled Exception',l_scope,null,l_params);
      raise;
end active_databases;

function db_platform_ids
return t_name_value_tab
pipelined
is
  l_uri varchar2(255);
  l_db_template_id varchar2(255);
  l_len pls_integer;
  l_cnt pls_integer;
  l_clob clob;
begin

  l_clob := ds_mgmt.dbaas_discover;

  apex_json.parse(l_clob);

  for idx in 1..apex_json.get_count(p_path => 'service_templates.elements') loop

    l_uri := apex_json.get_varchar2('service_templates.elements[%d].uri',idx);
    l_db_template_id := substr(l_uri,instr(l_uri,'/',-1,1)+1);

    pipe row (t_name_value_rec(
                       name  => apex_json.get_varchar2('service_templates.elements[%d].name',idx)
                      ,value => l_db_template_id
              ));

  end loop;



end db_platform_ids;


procedure refresh_active_databases
is
    l_collection_name constant varchar2(30) := 'ACTIVE_DATABASES';
    l_last_updated             date;
    l_values                   apex_json.t_values;

begin

  -- if error collection exists, delete
  if not apex_collection.collection_exists
                               (p_collection_name => l_collection_name)
  then
   apex_collection.create_collection
                               (p_collection_name => l_collection_name);
  end if;

    begin
      -- get last updated date
      select last_updated
        into l_last_updated
        from ds_active_databases_v
       where rownum <= 1;
    exception
      when no_data_found then
        null;
    end;

    --htp.p('l_last_updated: '||l_last_updated);
    --log_msg ('rad: last_updated +5: '||to_char(l_last_updated+(1/24/12),'HH24:MI:SS')||', SYSDATE: '||to_char(sysdate,'HH24:MI:SS'));

    -- if last updated > 5min refresh the collection
--    if l_last_updated is null or l_last_updated  + (1/24/12) < sysdate --5min
 --   then

      --log_msg ('rad: refresh');

      apex_collection.truncate_collection(l_collection_name);

      for r1 in (select * from table(active_databases)) loop
        apex_collection.add_member (p_collection_name => l_collection_name
                                   ,p_generate_md5    => 'NO'
                                   ,p_c001            => r1.req_id
                                   ,p_c002            => r1.uri
                                   ,p_c003            => r1.name
                                   ,p_c004            => r1.state
                                   ,p_c005            => r1.context_id
                                   ,p_c006            => r1.canonicallink
                                   ,p_c007            => r1.status
                                   ,p_c008            => r1.created_on
                                   ,p_c009            => r1.based_on
                                   ,p_c010            => r1.connection_str
                                   ,p_c011            => r1.target_type
                                   ,p_c012            => r1.destination_zone
                                   ,p_c013            => r1.last_backup
                                   ,p_c014            => r1.master_username
                                   ,p_c015            => r1.ds_version
                                   ,p_c016            => r1.uptime
                                   ,p_c017            => r1.total_sga
                                   ,p_c018            => r1.available_space
                                   ,p_c019            => r1.dbplatformtemplate_id
                                   ,p_c020            => r1.dbaas_zone_id
                                   ,p_c021            => r1.instance_count
                                   ,p_clob001         => r1.instances
                                   ,p_d001            => sysdate
                              );
      end loop;
 -- end if;
exception
  when others then
    htp.p('refresh_active_databases error: '||sqlerrm);
    --log_msg ('rad: '||sqlerrm);
end refresh_active_databases;

procedure get_create_db_result(p_clob in clob
                              ,x_status out varchar2
                              ,x_id out pls_integer)

is
  l_uri varchar2(255);
  l_name varchar2(255);
  l_resource_state varchar2(255);
  l_media_type varchar2(255);
  l_canonical_link varchar2(255);
  l_status varchar2(500);
  l_id number;
  l_msg varchar2(255);
  l_curr_msg varchar2(255) := 'nothing';
begin
  apex_json.parse(p_clob);

  l_uri            := apex_json.get_varchar2 ('uri');
  l_name           := apex_json.get_varchar2 ('name');
  l_resource_state := apex_json.get_varchar2 ('resource_state.state');
  l_media_type     := apex_json.get_varchar2 ('media_type');
  l_canonical_link := apex_json.get_varchar2 ('canonical_link');
  l_status         := apex_json.get_varchar2 ('status');
  l_id             := regexp_substr(l_uri,'[0-9]+$');


  if l_resource_state = 'INITIATED'
     and l_status = 'SCHEDULED'
  then
    l_status := 'SUCCESS';
  else
    l_status := get_failure_message(p_clob);
  /*
    l_status := 'FAILED. State: '||l_resource_state||', status: '||l_status;

    -- Get detailed error message
    for idx in 1..apex_json.get_count('messages[1].stack_messages') loop

      l_msg := apex_json.get_varchar2('messages[1].stack_messages['||idx||'].text');

      if l_msg != l_curr_msg then
        l_status := l_status || replace(l_msg,'\n','<br>');
      end if;

      l_curr_msg := l_msg;

    end loop;
   */
  end if;

  x_status := l_status;
  x_id     := l_id;

  /*htp.p('l_uri: '|| l_uri);
  htp.p('l_name: '|| l_name);
  htp.p('l_resource_state: '|| l_resource_state);
  htp.p('l_media_type: '|| l_media_type);
  htp.p('l_canonical_link: '|| l_canonical_link);
  htp.p('l_status: '|| l_status);
  htp.p(l_msg);
  */
exception
  when others then
  x_status :=  'get_create_db_result error: ' || sqlerrm;
end get_create_db_result;





procedure get_delete_db_result(p_clob in clob
                              ,x_req_id out number
                              ,x_status out varchar2)
is
  l_uri varchar2(255);
  l_name varchar2(255);
  l_resource_state varchar2(255);
  l_media_type varchar2(255);
  l_canonical_link varchar2(255);
  l_status varchar2(500);
  l_request_id number;
  l_msg varchar2(255);
  l_curr_msg varchar2(255) := 'nothing';
begin
  apex_json.parse(p_clob);

-- Get resource state status message
  for idx in 1..apex_json.get_count('resource_state.messages') loop

    l_msg := apex_json.get_varchar2('resource_state.messages['||idx||'].text');

    if l_msg != l_curr_msg then --omit duplicate message text
      l_status := l_status || replace(l_msg,'\n','<br>');
    end if;

    l_curr_msg := l_msg;

  end loop;

  l_uri            := apex_json.get_varchar2 ('uri');
  l_name           := apex_json.get_varchar2 ('name');
  l_resource_state := apex_json.get_varchar2 ('resource_state.state');
  l_media_type     := apex_json.get_varchar2 ('media_type');
  l_canonical_link := apex_json.get_varchar2 ('canonical_link');
  l_request_id     := regexp_substr(replace(l_status,'''',''),'[0-9]+$');

  x_req_id := l_request_id;
  x_status := l_status;


end get_delete_db_result;





function get_active_database_count
return pls_integer
is
  l_ids dbms_sql.varchar2_table;
  l_collection_name constant varchar2(30) := 'ACTIVE_DATABASE_COUNT';
    l_last_updated date;
    l_databases    pls_integer;
    l_values     apex_json.t_values;

begin

  -- if error collection exists, delete
  if not apex_collection.collection_exists
                               (p_collection_name => l_collection_name)
  then
   apex_collection.create_collection
                               (p_collection_name => l_collection_name);
  end if;

    begin
      -- get last updated date
      select last_updated, databases
        into l_last_updated, l_databases
        from ds_active_dB_count_v;
    exception
      when no_data_found then
        null;
    end;

    -- if last updated > 5min refresh the collection
    if l_last_updated is null or l_last_updated + (1/24/12) > sysdate --5min
    then

      l_ids := ds_mgmt.dbaas_successful_create(ds_mgmt.dbaas_discover);
      l_databases := l_ids.count;
    apex_collection.truncate_collection(l_collection_name);
    apex_collection.add_member (p_collection_name      => l_collection_name,
                             p_generate_md5         => 'NO',
                             p_d001                 => sysdate,
                             p_N001                 => l_databases
                            );
  end if;

    return l_databases;
end;

procedure get_db_stat (p_req_id                 in number
                      ,x_uri                   out varchar2
                      ,x_name                  out varchar2
                      ,x_state                 out varchar2
                      ,x_context_id            out varchar2
                      ,x_canonicallink         out varchar2
                      ,x_status                out varchar2
                      ,x_created_on            out varchar2
                      ,x_based_on              out varchar2
                      ,x_connection_str        out varchar2
                      ,x_target_type           out varchar2
                      ,x_destination_zone      out varchar2
                      ,x_last_backup           out varchar2
                      ,x_master_username       out varchar2
                      ,x_db_version            out varchar2
                      ,x_uptime                out varchar2
                      ,x_total_sga             out varchar2
                      ,x_available_space       out varchar2
                      ,x_dbplatformtemplate_id out varchar2
                      ,x_dbaas_zone_id         out varchar2
                      ,x_instances             out clob
                      ,x_instance_count        out pls_integer)
is


--loop variables
ndex number;
ndex2 number;
i number;
k number;

-- json data vars
inst_ma varchar2(25);
j apex_json.t_values;

l_clob   clob;

l_br constant varchar2(10) := '<br>';

begin
    --x_instances := 'Instance Information: '||l_br;
    l_clob :=  ds_mgmt.dbaas_stat(p_req_id);
    apex_json.parse(l_clob);
    apex_json.parse(j, l_clob);

    x_uri              :=  apex_json.get_varchar2 ('uri');
    x_name             :=  apex_json.get_varchar2 ('name');
    x_state            :=  apex_json.get_varchar2 ('resource_state.state');
    x_context_id       :=  apex_json.get_varchar2 ('context_id');
    x_status           :=  apex_json.get_varchar2 ('status');
    x_created_on       :=  apex_json.get_varchar2 ('created');
    x_based_on         :=  apex_json.get_varchar2 ('based_on');
    x_connection_str   :=  apex_json.get_varchar2 ('connect_string');
    x_destination_zone :=  apex_json.get_varchar2 ('destination_zone');
    x_master_username  :=  apex_json.get_varchar2 ('master_username');
    x_db_version       :=  apex_json.get_varchar2 ('ds_version');
    x_uptime := (apex_json.get_varchar2('measurable_attributes[1].value') || ' ' ||
                apex_json.get_varchar2('measurable_attributes[1].units'));
    x_total_sga := (apex_json.get_varchar2('measurable_attributes[2].value') || ' ' ||
                apex_json.get_varchar2('measurable_attributes[2].units'));
    x_available_space := (apex_json.get_varchar2('measurable_attributes[3].value') || ' ' ||
                apex_json.get_varchar2('measurable_attributes[3].units'));
    ndex := (apex_json.get_count(p_path=>'instances', p_values=>j));
    x_instance_count := nvl(ndex,0);

    if (nvl(ndex,0) > 0)
    then
      for i in 1 .. ndex loop

          x_instances := x_instances ||
              'Instance '||i||': '||apex_json.get_varchar2 ('instances[%d].name', i) || ': '
              || apex_json.get_varchar2 ('instances[%d].average_active_sessions', i) || ' '
              || apex_json.get_varchar2 ('instances[%d].allocated_sessions',i) || l_br;

              inst_ma := 'instances[' || i || ']';
             ndex2 := (apex_json.get_count(p_path=> inst_ma || '.measurable_attributes', p_values=>j));
              for k in 1 .. ndex2 loop

                      x_instances := x_instances || '    ' ||
                      apex_json.get_varchar2 (inst_ma||'.measurable_attributes[%d].name', k) || ': '
                          || apex_json.get_varchar2 (inst_ma||'.measurable_attributes[%d].value', k) || ' '
                          || apex_json.get_varchar2 (inst_ma||'.measurable_attributes[%d].units',k) || l_br ;
              end loop;
              x_instances := x_instances || l_br;
      end loop;
    end if;
exception
  when others then
  raise;
end get_db_stat;





function get_failure_message(p_clob in clob)
return varchar2
is
  l_clob clob := q'[{ "messages" : [ { "date" : "2015-10-19T13:21:00+0000" , "text" : "\nError creating the Self Service Request." , "hint" : "\nError creating the Self Service Request." , "stack_messages" : [ "\nError creating the Self Service Request." , "\nError creating the Self Service Request." , "\nThe Database SID: \"cmr\" is not available.\n Please enter a different Database SID.\n. " ] } ] }]';
  l_status varchar2(500);
  l_id number;
  l_msg varchar2(255);
  l_curr_msg varchar2(255) := 'nothing';
  l_stack_msg varchar2(255);
  l_curr_stack_msg varchar2(255) := 'nothing';
begin

  apex_json.parse(p_clob);

  -- Get resource state status message
  for idx in 1..apex_json.get_count('messages') loop

    l_msg := replace(apex_json.get_varchar2('messages['||idx||'].text'),chr(10),'');

    if l_msg != l_curr_msg then --omit duplicate message text
      l_status := l_status || l_msg || ' ';
      l_curr_msg := l_msg;
      for idy in 1..apex_json.get_count('messages['||idx||'].stack_messages') loop

        l_stack_msg := replace(apex_json.get_varchar2('messages['||idx||'].stack_messages['||idy||']'),chr(10),'');

        if l_stack_msg != l_curr_stack_msg and l_stack_msg != l_curr_msg then
          l_status := l_status || l_stack_msg || ' ';
        end if;

        l_curr_stack_msg := l_stack_msg;
      end loop;

    end if;

    l_curr_msg := l_msg;

  end loop;

  return l_status;
end get_failure_message;



procedure get_db_lifecycle_result(
     p_req_id in varchar2
    ,p_action in varchar2
    ,x_req_id out number
    ,x_status out varchar2)
is
  lc_scope_prefix constant varchar2(31) := 'get_db_lifecycle_result';

  l_procname varchar2(30) := lc_scope_prefix;
  l_scope logger_logs.scope%type := lc_scope_prefix;
  l_params logger.tab_param;
  l_clob clob;
  l_msg varchar2(255);
  l_curr_msg varchar2(255) := 'nothing';
  l_status varchar2(255);
  l_request_id number;
begin
  logger.append_param(l_params, 'p_req_id', p_req_id);
  logger.append_param(l_params, 'p_action', p_action);
  logger.log('START', l_scope, null, l_params);

  l_clob := ds_mgmt.dbaas_db_lifecycle(p_req_id,p_action);
  logger.log('got clob',l_scope,null,l_params);

  apex_json.parse(l_clob);
  logger.log('parsed clob',l_scope,null,l_params);

  commit;

  -- Get resource state status message
  if apex_json.does_exist('resource_state') then
    for idx in 1..apex_json.get_count('resource_state.messages') loop

      l_msg := apex_json.get_varchar2('resource_state.messages['||idx||'].text');

      if l_msg != l_curr_msg then --omit duplicate message text
        l_status := l_status || replace(l_msg,'\n','<br>');
      end if;

      l_curr_msg := l_msg;

    end loop;

      l_request_id     := regexp_substr(replace(l_status,'''',''),'[0-9]+\.$');
  else
    --invalid operation
    for idx in 1..apex_json.get_count('messages') loop

      l_status := l_status || apex_json.get_varchar2('messages[%d].text',idx) || chr(10);
      logger.log('invalid operation. l_status: '||l_status,l_scope,null,l_params);

    end loop;

    --signify that there was an error
    l_request_id := -1;

  end if;

  logger.log('ended loops',l_scope,null,l_params);

  x_req_id := l_request_id;
  x_status := l_status;

  logger.log('END', l_scope);
exception
    when others then
      logger.log_error('unhandled exception',l_scope,null,l_params);
      raise;
end get_db_lifecycle_result;

end ds_views;
/
show err







--------------------------------------------------------
--  DDL for View ACTIVE_DB_COUNT_V
--------------------------------------------------------
prompt create view DS_ACTIVE_DB_COUNT_V

  CREATE OR REPLACE VIEW "DS_ACTIVE_DB_COUNT_V" ("LAST_UPDATED", "DATABASES") AS 
  select d001 as last_updated
     , n001 as databases
  from apex_collections
 where collection_name = 'ACTIVE_DATABASE_COUNT';
/
--------------------------------------------------------
--  DDL for View DS_PLATFORM_IDS_V
--------------------------------------------------------
prompt create view DS_PLATFORM_IDS_V

  CREATE OR REPLACE VIEW "DS_PLATFORM_IDS_V" ("NAME", "VALUE") AS 
  select "NAME","VALUE"
  from table(ds_views.db_platform_ids);
/
--------------------------------------------------------
--  DDL for View SERVICE_TEMPLATES_V
--------------------------------------------------------
prompt create view DS_SERVICE_TEMPLATES_V

  CREATE OR REPLACE VIEW "DS_SERVICE_TEMPLATES_V" ("NAME", "ID", "SERVICE_FAMILY", "DESCRIPTION", "CANONICAL_LINK") AS 
  select name
      ,id
      ,service_family
      ,description
      ,canonical_link
  from table(ds_views.service_templates);
/
--------------------------------------------------------
--  DDL for View SERVICE_REQUESTS_V
--------------------------------------------------------
prompt create view DS_SERVICE_REQUESTS_V

  CREATE OR REPLACE VIEW "DS_SERVICE_REQUESTS_V" ("ID", "URI", "NAME", "MEDIA_TYPE", "STATUS", "LIFECYCLE_TYPE", "CANONICAL_LINK") AS 
  select regexp_substr(name,'[0-9]{1,}$') id
      ,uri
      ,name
      ,media_type
      ,status
      ,lifecycle_type
      ,canonical_link
  from table(ds_views.service_requests);
/
--------------------------------------------------------
--  DDL for View ds_ACTIVE_DATABASES_V
--------------------------------------------------------
prompt create view DS_ACTIVE_DATABASES_V

  CREATE OR REPLACE VIEW "DS_ACTIVE_DATABASES_V" ("REQ_ID", "URI", "NAME", "STATE", "CONTEXT_ID", "CANONICALLINK", "STATUS", "CREATED_ON", "BASED_ON", "CONNECTION_STR", "TARGET_TYPE", "DESTINATION_ZONE", "LAST_BACKUP", "MASTER_USERNAME", "DS_VERSION", "UPTIME", "TOTAL_SGA", "AVAILABLE_SPACE", "DBPLATFORMTEMPLATE_ID", "DBAAS_ZONE_ID", "INSTANCE_COUNT", "INSTANCES", "LAST_UPDATED") AS 
  select c001    as req_id
      ,c002    as uri
      ,c003    as name
      ,c004    as state
      ,c005    as context_id
      ,c006    as canonicallink
      ,c007    as status
      ,c008    as created_on
      ,c009    as based_on
      ,c010    as connection_str
      ,c011    as target_type
      ,c012    as destination_zone
      ,c013    as last_backup
      ,c014    as master_username
      ,c015    as ds_version
      ,c016    as uptime
      ,c017    as total_sga
      ,c018    as available_space
      ,c019    as dbplatformtemplate_id
      ,c020    as dbaas_zone_id
      ,c021    as instance_count
      ,clob001 as instances
      ,d001    as last_updated
  from apex_collections
 where collection_name = 'ACTIVE_DATABASES';
/
--------------------------------------------------------
--  DDL for View LOG_V
--------------------------------------------------------
prompt create view DS_LOG_V

  CREATE OR REPLACE VIEW "DS_LOG_V" ("ID", "MSG") AS 
  select "ID","MSG" from log order by id desc;
/
--------------------------------------------------------
--  DDL for View DS_STATS_V
--------------------------------------------------------
prompt create view DS_STATS_V

  CREATE OR REPLACE VIEW "DS_STATS_V" ("URI", "NAME", "STATE", "CONTEXT_ID", "CANONICALLINK", "STATUS", "CREATED_ON", "BASED_ON", "CONNECTION_STR", "TARGET_TYPE", "DESTINATION_ZONE", "LAST_BACKUP", "MASTER_USERNAME", "DS_VERSION", "UPTIME", "TOTAL_SGA", "AVAILABLE_SPACE", "DBPLATFORMTEMPLATE_ID", "DBAAS_ZONE_ID", "INSTANCE_COUNT", "INSTANCES") AS 
  select
     c001    AS uri
    ,c002    AS name
    ,c003    AS state
    ,c004    AS context_id
    ,c005    AS canonicallink
    ,c006    AS status
    ,c007    AS created_on
    ,c008    AS based_on
    ,c009    AS connection_str
    ,c010    AS target_type
    ,c011    AS destination_zone
    ,c012    AS last_backup
    ,c013    AS master_username
    ,c014    AS ds_version
    ,c015    AS uptime
    ,c016    AS total_sga
    ,c017    AS available_space
    ,c018    AS dbplatformtemplate_id
    ,c019    AS dbaas_zone_id
    ,c020    AS instance_count
    ,clob001 AS instances
  from apex_collections
 where collection_name = 'DS_STATS';
/
--------------------------------------------------------
--  DDL for View DS_PLATFORM_TEMPLATES_V
--------------------------------------------------------
prompt create view DS_PLATFORM_TEMPLATES_V

  CREATE OR REPLACE VIEW "DS_PLATFORM_TEMPLATES_V" ("NAME", "VALUE") AS 
  select "NAME","VALUE"
  from table(ds_views.db_platform_ids);
/
--------------------------------------------------------
--  DDL for View ZONES_V
--------------------------------------------------------
prompt create view DS_ZONES_V

  CREATE OR REPLACE VIEW "DS_ZONES_V" ("NAME", "ID", "TYPE", "CANONICAL_LINK") AS 
  select name
      ,id
      ,type
      ,canonical_link
  from table(ds_views.zones);
/


