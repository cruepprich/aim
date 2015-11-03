--------------------------------------------------------
--  File created - Tuesday-November-03-2015   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Type T_ACTIVE_DB_TAB
--------------------------------------------------------

  CREATE OR REPLACE TYPE "T_ACTIVE_DB_TAB" AS TABLE OF t_active_db_rec;
--------------------------------------------------------
--  DDL for Type T_ACTIVE_DB_REC
--------------------------------------------------------

  CREATE OR REPLACE TYPE "T_ACTIVE_DB_REC" AS OBJECT (
          id             varchar2(255)
         ,name           varchar2(255)
         ,connection_str varchar2(255)
         ,description    varchar2(1000)
         ,state          varchar2(1000)
         ,status         varchar2(255)
);
--------------------------------------------------------
--  DDL for Type T_DB_STATS_REC
--------------------------------------------------------

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
                      ,db_version            varchar2(255)
                      ,uptime                varchar2(255)
                      ,total_sga             varchar2(255)
                      ,available_space       varchar2(255)
                      ,dbplatformtemplate_id varchar2(255)
                      ,dbaas_zone_id         varchar2(255)
                      ,instances             clob
                      ,instance_count        number
                      );
--------------------------------------------------------
--  DDL for Type T_DB_STATS_TAB
--------------------------------------------------------

  CREATE OR REPLACE TYPE "T_DB_STATS_TAB" as table of t_db_stats_rec;
--------------------------------------------------------
--  DDL for Type T_NAME_VALUE_REC
--------------------------------------------------------

  CREATE OR REPLACE TYPE "T_NAME_VALUE_REC" AS OBJECT (
          name varchar2(32767)
         ,value varchar2(32767)
);
--------------------------------------------------------
--  DDL for Type T_NAME_VALUE_TAB
--------------------------------------------------------

  CREATE OR REPLACE TYPE "T_NAME_VALUE_TAB" AS TABLE OF t_name_value_rec;
--------------------------------------------------------
--  DDL for Type T_SERVICE_REQUESTS_REC
--------------------------------------------------------

  CREATE OR REPLACE TYPE "T_SERVICE_REQUESTS_REC" AS OBJECT (
          uri            varchar2(255)
         ,name           varchar2(255)
         ,media_type     varchar2(255)
         ,status         varchar2(1000)
         ,state          varchar2(255)
         ,lifecycle_type varchar2(255)
         ,canonical_link varchar2(1000)
);
--------------------------------------------------------
--  DDL for Type T_SERVICE_REQUESTS_TAB
--------------------------------------------------------

  CREATE OR REPLACE TYPE "T_SERVICE_REQUESTS_TAB" AS TABLE OF t_service_requests_rec;
--------------------------------------------------------
--  DDL for Type T_SERVICE_TEMPLATES_REC
--------------------------------------------------------

  CREATE OR REPLACE TYPE "T_SERVICE_TEMPLATES_REC" AS OBJECT (
          id             varchar2(255)
         ,name           varchar2(255)
         ,service_family varchar2(255)
         ,description    varchar2(1000)
         ,canonical_link varchar2(1000)
)
--------------------------------------------------------
--  DDL for Type T_SERVICE_TEMPLATES_TAB
--------------------------------------------------------

  CREATE OR REPLACE TYPE "T_SERVICE_TEMPLATES_TAB" AS TABLE OF t_service_templates_rec
--------------------------------------------------------
--  DDL for Type T_VARCHAR2_REC
--------------------------------------------------------

  CREATE OR REPLACE TYPE "T_VARCHAR2_REC" AS OBJECT (
          vc varchar2(32767)
);
--------------------------------------------------------
--  DDL for Type T_VARCHAR2_TAB
--------------------------------------------------------

  CREATE OR REPLACE TYPE "T_VARCHAR2_TAB" AS TABLE OF t_varchar2_rec;
--------------------------------------------------------
--  DDL for Type T_ZONES_REC
--------------------------------------------------------

  CREATE OR REPLACE TYPE "T_ZONES_REC" AS OBJECT (
          name varchar2(255)
         ,id   varchar2(255)
         ,type varchar2(255)
         ,canonical_link varchar2(1000)
)
--------------------------------------------------------
--  DDL for Type T_ZONES_TAB
--------------------------------------------------------

  CREATE OR REPLACE TYPE "T_ZONES_TAB" AS TABLE OF t_zones_rec
--------------------------------------------------------
--  DDL for Table SAMPLE_CLOBS
--------------------------------------------------------

  CREATE TABLE "SAMPLE_CLOBS" 
   (	"NAME" VARCHAR2(20), 
	"SAMPLE" CLOB
   )
--------------------------------------------------------
--  DDL for View ACTIVE_DB_COUNT_V
--------------------------------------------------------

  CREATE OR REPLACE VIEW "ACTIVE_DB_COUNT_V" ("LAST_UPDATED", "DATABASES") AS 
  select d001 as last_updated
     , n001 as databases
  from apex_collections
 where collection_name = 'ACTIVE_DATABASE_COUNT'
--------------------------------------------------------
--  DDL for View DB_PLATFORM_IDS_V
--------------------------------------------------------

  CREATE OR REPLACE VIEW "DB_PLATFORM_IDS_V" ("NAME", "VALUE") AS 
  select "NAME","VALUE"
  from table(dbaas_views.db_platform_ids)
--------------------------------------------------------
--  DDL for View SERVICE_TEMPLATES_V
--------------------------------------------------------

  CREATE OR REPLACE VIEW "SERVICE_TEMPLATES_V" ("NAME", "ID", "SERVICE_FAMILY", "DESCRIPTION", "CANONICAL_LINK") AS 
  select name
      ,id
      ,service_family
      ,description
      ,canonical_link
  from table(dbaas_views.service_templates)
--------------------------------------------------------
--  DDL for View SERVICE_REQUESTS_V
--------------------------------------------------------

  CREATE OR REPLACE VIEW "SERVICE_REQUESTS_V" ("ID", "URI", "NAME", "MEDIA_TYPE", "STATUS", "LIFECYCLE_TYPE", "CANONICAL_LINK") AS 
  select regexp_substr(name,'[0-9]{1,}$') id
      ,uri
      ,name
      ,media_type
      ,status
      ,lifecycle_type
      ,canonical_link
  from table(dbaas_views.service_requests)
--------------------------------------------------------
--  DDL for View ACTIVE_DATABASES_V
--------------------------------------------------------

  CREATE OR REPLACE VIEW "ACTIVE_DATABASES_V" ("REQ_ID", "URI", "NAME", "STATE", "CONTEXT_ID", "CANONICALLINK", "STATUS", "CREATED_ON", "BASED_ON", "CONNECTION_STR", "TARGET_TYPE", "DESTINATION_ZONE", "LAST_BACKUP", "MASTER_USERNAME", "DB_VERSION", "UPTIME", "TOTAL_SGA", "AVAILABLE_SPACE", "DBPLATFORMTEMPLATE_ID", "DBAAS_ZONE_ID", "INSTANCE_COUNT", "INSTANCES", "LAST_UPDATED") AS 
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
      ,c015    as db_version
      ,c016    as uptime
      ,c017    as total_sga
      ,c018    as available_space
      ,c019    as dbplatformtemplate_id
      ,c020    as dbaas_zone_id
      ,c021    as instance_count
      ,clob001 as instances
      ,d001    as last_updated
  from apex_collections
 where collection_name = 'ACTIVE_DATABASES'
--------------------------------------------------------
--  DDL for View LOG_V
--------------------------------------------------------

  CREATE OR REPLACE VIEW "LOG_V" ("ID", "MSG") AS 
  select "ID","MSG" from log order by id desc
--------------------------------------------------------
--  DDL for View DB_STATS_V
--------------------------------------------------------

  CREATE OR REPLACE VIEW "DB_STATS_V" ("URI", "NAME", "STATE", "CONTEXT_ID", "CANONICALLINK", "STATUS", "CREATED_ON", "BASED_ON", "CONNECTION_STR", "TARGET_TYPE", "DESTINATION_ZONE", "LAST_BACKUP", "MASTER_USERNAME", "DB_VERSION", "UPTIME", "TOTAL_SGA", "AVAILABLE_SPACE", "DBPLATFORMTEMPLATE_ID", "DBAAS_ZONE_ID", "INSTANCE_COUNT", "INSTANCES") AS 
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
		,c014    AS db_version
		,c015    AS uptime
		,c016    AS total_sga
		,c017    AS available_space
		,c018    AS dbplatformtemplate_id
		,c019    AS dbaas_zone_id
		,c020    AS instance_count
		,clob001 AS instances
  from apex_collections
 where collection_name = 'DB_STATS'
--------------------------------------------------------
--  DDL for View DB_PLATFORM_TEMPLATES_V
--------------------------------------------------------

  CREATE OR REPLACE VIEW "DB_PLATFORM_TEMPLATES_V" ("NAME", "VALUE") AS 
  select "NAME","VALUE"
  from table(dbaas_views.db_platform_ids)
--------------------------------------------------------
--  DDL for View ZONES_V
--------------------------------------------------------

  CREATE OR REPLACE VIEW "ZONES_V" ("NAME", "ID", "TYPE", "CANONICAL_LINK") AS 
  select name
      ,id
      ,type
      ,canonical_link
  from table(dbaas_views.zones)
--------------------------------------------------------
--  DDL for View LOGGER_V
--------------------------------------------------------

  CREATE OR REPLACE VIEW "LOGGER_V" ("ID", "TEXT", "SCOPE", "TIME_STAMP", "EXTRA") AS 
  select id,text,scope,time_stamp,extra from LOGGER_USER.LOGGER_LOGS_5_MIN order by id desc
REM INSERTING into ACTIVE_DB_COUNT_V
SET DEFINE OFF;
REM INSERTING into DB_PLATFORM_IDS_V
SET DEFINE OFF;
Insert into DB_PLATFORM_IDS_V (NAME,VALUE) values ('AEG_SMALL_DB','20465263F69329B6E05365ED090A67A7');
Insert into DB_PLATFORM_IDS_V (NAME,VALUE) values ('AEG_SILVER','2275E5F885495BE6E05365ED090A392A');
Insert into DB_PLATFORM_IDS_V (NAME,VALUE) values ('AEG_PLATINUM','2269262F23386402E05365ED090A866F');
Insert into DB_PLATFORM_IDS_V (NAME,VALUE) values ('AEG_BRONZE','2275E5F885F95BE6E05365ED090A392A');
Insert into DB_PLATFORM_IDS_V (NAME,VALUE) values ('AEG_GOLD','2275E5F885D25BE6E05365ED090A392A');
REM INSERTING into SERVICE_TEMPLATES_V
SET DEFINE OFF;
Insert into SERVICE_TEMPLATES_V (NAME,ID,SERVICE_FAMILY,DESCRIPTION,CANONICAL_LINK) values ('AEG_SMALL_DB','20465263F69529B6E05365ED090A67A7','DBAAS','AEG Bronze Level Template','https://acoem.enkitec.com:7802/em/websvcs/restful/extws/cloudservices/admin/cfw/v1/servicetemplates/20465263F69529B6E05365ED090A67A7');
Insert into SERVICE_TEMPLATES_V (NAME,ID,SERVICE_FAMILY,DESCRIPTION,CANONICAL_LINK) values ('AEG_SILVER','2275E5F8854B5BE6E05365ED090A392A','DBAAS','AEG Silver Level Template','https://acoem.enkitec.com:7802/em/websvcs/restful/extws/cloudservices/admin/cfw/v1/servicetemplates/2275E5F8854B5BE6E05365ED090A392A');
Insert into SERVICE_TEMPLATES_V (NAME,ID,SERVICE_FAMILY,DESCRIPTION,CANONICAL_LINK) values ('AEG_GOLD','2275E5F885D45BE6E05365ED090A392A','DBAAS','AEG Gold Level Template','https://acoem.enkitec.com:7802/em/websvcs/restful/extws/cloudservices/admin/cfw/v1/servicetemplates/2275E5F885D45BE6E05365ED090A392A');
Insert into SERVICE_TEMPLATES_V (NAME,ID,SERVICE_FAMILY,DESCRIPTION,CANONICAL_LINK) values ('AEG_BRONZE','2275E5F885FB5BE6E05365ED090A392A','DBAAS','AEG Bronze Level Template','https://acoem.enkitec.com:7802/em/websvcs/restful/extws/cloudservices/admin/cfw/v1/servicetemplates/2275E5F885FB5BE6E05365ED090A392A');
Insert into SERVICE_TEMPLATES_V (NAME,ID,SERVICE_FAMILY,DESCRIPTION,CANONICAL_LINK) values ('AEG_PLATINUM','2269262F233A6402E05365ED090A866F','DBAAS','AEG Platinum Level Template','https://acoem.enkitec.com:7802/em/websvcs/restful/extws/cloudservices/admin/cfw/v1/servicetemplates/2269262F233A6402E05365ED090A866F');
REM INSERTING into SERVICE_REQUESTS_V
SET DEFINE OFF;
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('22','/em/cloud/request/20732516983467BAE05365ED090A3F6F','testdb_CREATE_24_41#22','application/oracle.com.cloud.common.Request+json','NO_QUOTA_ERROR','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/20732516983467BAE05365ED090A3F6F');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('41','/em/cloud/request/20732516988D67BAE05365ED090A3F6F','testdb_CREATE_23_1#41','application/oracle.com.cloud.common.Request+json','CLEANUP_FAILED','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/20732516988D67BAE05365ED090A3F6F');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('42','/em/cloud/request/2073251698BA67BAE05365ED090A3F6F','testdb_CREATE_29_28#42','application/oracle.com.cloud.common.Request+json','CLEANUP_FAILED','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/2073251698BA67BAE05365ED090A3F6F');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('43','/em/cloud/request/2073251698E867BAE05365ED090A3F6F','testdb_CREATE_33_11#43','application/oracle.com.cloud.common.Request+json','CLEANUP_FAILED','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/2073251698E867BAE05365ED090A3F6F');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('44','/em/cloud/request/20732516991E67BAE05365ED090A3F6F','testdb_CREATE_40_50#44','application/oracle.com.cloud.common.Request+json','CLEANUP_FAILED','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/20732516991E67BAE05365ED090A3F6F');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('45','/em/cloud/request/208039DF870D778AE05365ED090AF211','testdb2_CREATE_42_56#45','application/oracle.com.cloud.common.Request+json','CLEANUP_FAILED','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/208039DF870D778AE05365ED090AF211');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('62','/em/cloud/request/20977CBC0FAD786AE05365ED090A7BA5','testdb_CREATE_5_42#62','application/oracle.com.cloud.common.Request+json','CLEANED','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/20977CBC0FAD786AE05365ED090A7BA5');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('143','/em/cloud/request/2124D81B413113F7E05365ED090AF393','AEGSID3.enkitec.com_Delete Database#143','application/oracle.com.cloud.common.Request+json','SUCCESS','DELETE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/2124D81B413113F7E05365ED090AF393');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('144','/em/cloud/request/2124D81B416913F7E05365ED090AF393','mbd4.enkitec.com_Delete Database#144','application/oracle.com.cloud.common.Request+json','SUCCESS','DELETE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/2124D81B416913F7E05365ED090AF393');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('285','/em/cloud/request/21EDDB72808C6727E05365ED090A4CC5','tesdb1_CREATE_54_21#285','application/oracle.com.cloud.common.Request+json','EXECUTION_ERROR','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/21EDDB72808C6727E05365ED090A4CC5');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('342','/em/cloud/request/22265924371D63F2E05365ED090A622D','testdb_CREATE_52_59#342','application/oracle.com.cloud.common.Request+json','SUCCESS','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/22265924371D63F2E05365ED090A622D');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('343','/em/cloud/request/22265924374F63F2E05365ED090A622D','tesdb1_CREATE_57_28#343','application/oracle.com.cloud.common.Request+json','SUCCESS','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/22265924374F63F2E05365ED090A622D');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('421','/em/cloud/request/2266F343EEE20DF3E05365ED090A25BA','dt1.enkitec.com_Delete Database#421','application/oracle.com.cloud.common.Request+json','SUCCESS','DELETE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/2266F343EEE20DF3E05365ED090A25BA');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('423','/em/cloud/request/2266F343EF450DF3E05365ED090A25BA','tesdb3_CREATE_6_43#423','application/oracle.com.cloud.common.Request+json','SUCCESS','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/2266F343EF450DF3E05365ED090A25BA');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('441','/em/cloud/request/2268A965BB4E5053E05365ED090A31FB','AEG_MED1_CREATE_41_38#441','application/oracle.com.cloud.common.Request+json','SUCCESS','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/2268A965BB4E5053E05365ED090A31FB');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('621','/em/cloud/request/22AA87AFD73229C9E05365ED090A32EF','Startup_cmr6.enkitec.com_22-10-2015 10:03:53#621','application/oracle.com.cloud.common.Request+json','SUCCESS','START','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/22AA87AFD73229C9E05365ED090A32EF');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('641','/em/cloud/request/22AA87AFD78B29C9E05365ED090A32EF','Shutdown_cmr6.enkitec.com_22-10-2015 10:05:36#641','application/oracle.com.cloud.common.Request+json','SUCCESS','STOP','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/22AA87AFD78B29C9E05365ED090A32EF');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('642','/em/cloud/request/22AA87AFD88329C9E05365ED090A32EF','Shutdown_cmr9.enkitec.com_22-10-2015 10:19:37#642','application/oracle.com.cloud.common.Request+json','SUCCESS','STOP','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/22AA87AFD88329C9E05365ED090A32EF');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('643','/em/cloud/request/22AA87AFD90529C9E05365ED090A32EF','Startup_cmr9.enkitec.com_22-10-2015 10:34:22#643','application/oracle.com.cloud.common.Request+json','SUCCESS','START','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/22AA87AFD90529C9E05365ED090A32EF');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('644','/em/cloud/request/22AA87AFD99D29C9E05365ED090A32EF','Shutdown_cmr9.enkitec.com_22-10-2015 10:40:32#644','application/oracle.com.cloud.common.Request+json','SUCCESS','STOP','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/22AA87AFD99D29C9E05365ED090A32EF');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('645','/em/cloud/request/22AA87AFDA3029C9E05365ED090A32EF','Startup_cmr9.enkitec.com_22-10-2015 10:42:16#645','application/oracle.com.cloud.common.Request+json','SUCCESS','START','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/22AA87AFDA3029C9E05365ED090A32EF');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('646','/em/cloud/request/22B2F73B01367811E05365ED090AD751','Shutdown_cmr9.enkitec.com_22-10-2015 10:49:52#646','application/oracle.com.cloud.common.Request+json','SUCCESS','STOP','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/22B2F73B01367811E05365ED090AD751');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('647','/em/cloud/request/22B2F73B034B7811E05365ED090AD751','Startup_cmr6.enkitec.com_22-10-2015 11:51:58#647','application/oracle.com.cloud.common.Request+json','SUCCESS','START','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/22B2F73B034B7811E05365ED090AD751');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('661','/em/cloud/request/22AA87AFDAC229C9E05365ED090A32EF','Shutdown_cmr6.enkitec.com_22-10-2015 11:58:14#661','application/oracle.com.cloud.common.Request+json','SUCCESS','STOP','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/22AA87AFDAC229C9E05365ED090A32EF');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('663','/em/cloud/request/22B2F73B03F87811E05365ED090AD751','Shutdown_dbt1.enkitec.com_22-10-2015 12:06:27#663','application/oracle.com.cloud.common.Request+json','SUCCESS','STOP','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/22B2F73B03F87811E05365ED090AD751');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('1','/em/cloud/request/2048EAF84ACA5821E05365ED090A001B','SYSMAN - Mon Sep 21 2015 18:41:26 EDT_CREATE_44_12#1','application/oracle.com.cloud.common.Request+json','CLEANUP_FAILED','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/2048EAF84ACA5821E05365ED090A001B');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('21','/em/cloud/request/2061248AF6514638E05365ED090A816D','testdb_CREATE_23_7#21','application/oracle.com.cloud.common.Request+json','NO_QUOTA_ERROR','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/2061248AF6514638E05365ED090A816D');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('46','/em/cloud/request/208126DDDAFE2CCFE05365ED090A1BB6','testdb_CREATE_11_4#46','application/oracle.com.cloud.common.Request+json','CLEANUP_FAILED','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/208126DDDAFE2CCFE05365ED090A1BB6');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('104','/em/cloud/request/21116180A7E00E08E05365ED090A16FC','testdb_CREATE_29_8#104','application/oracle.com.cloud.common.Request+json','SUCCESS','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/21116180A7E00E08E05365ED090A16FC');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('142','/em/cloud/request/21241EA8183B55F2E05365ED090A5B2B','AEG00003.enkitec.com_Delete Database#142','application/oracle.com.cloud.common.Request+json','SUCCESS','DELETE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/21241EA8183B55F2E05365ED090A5B2B');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('161','/em/cloud/request/215D86F80F0F05A3E05365ED090A9B24','testdb_CREATE_1_59#161','application/oracle.com.cloud.common.Request+json','SUCCESS','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/215D86F80F0F05A3E05365ED090A9B24');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('181','/em/cloud/request/218C76C884AB0D0AE05365ED090A6FD0','mbd3.enkitec.com_Delete Database#181','application/oracle.com.cloud.common.Request+json','EXECUTION_ERROR','DELETE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/218C76C884AB0D0AE05365ED090A6FD0');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('182','/em/cloud/request/218C76C884C60D0AE05365ED090A6FD0','mbd2.enkitec.com_Delete Database#182','application/oracle.com.cloud.common.Request+json','SUCCESS','DELETE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/218C76C884C60D0AE05365ED090A6FD0');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('183','/em/cloud/request/218C76C884DB0D0AE05365ED090A6FD0','mdb1.enkitec.com_Delete Database#183','application/oracle.com.cloud.common.Request+json','SUCCESS','DELETE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/218C76C884DB0D0AE05365ED090A6FD0');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('184','/em/cloud/request/218C76C884F00D0AE05365ED090A6FD0','mdb.enkitec.com_Delete Database#184','application/oracle.com.cloud.common.Request+json','SUCCESS','DELETE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/218C76C884F00D0AE05365ED090A6FD0');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('185','/em/cloud/request/218C76C885250D0AE05365ED090A6FD0','mbd5.enkitec.com_Delete Database#185','application/oracle.com.cloud.common.Request+json','CLEANUP_FAILED','DELETE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/218C76C885250D0AE05365ED090A6FD0');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('201','/em/cloud/request/218C76C885780D0AE05365ED090A6FD0','mbd5.enkitec.com_Delete Database#201','application/oracle.com.cloud.common.Request+json','SUCCESS','DELETE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/218C76C885780D0AE05365ED090A6FD0');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('221','/em/cloud/request/2199C56B885E2A7CE05365ED090A9335','tesdb1_CREATE_17_13#221','application/oracle.com.cloud.common.Request+json','CLEANED','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/2199C56B885E2A7CE05365ED090A9335');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('222','/em/cloud/request/2199C56B88FF2A7CE05365ED090A9335','tesdb1_CREATE_48_27#222','application/oracle.com.cloud.common.Request+json','CLEANED','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/2199C56B88FF2A7CE05365ED090A9335');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('301','/em/cloud/request/2205F94BBBAD105DE05365ED090A550C','tesdb1_CREATE_50_0#301','application/oracle.com.cloud.common.Request+json','SUCCESS','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/2205F94BBBAD105DE05365ED090A550C');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('465','/em/cloud/request/22765532B26678EAE05365ED090A4ABD','mdb15.enkitec.com_Delete Database#465','application/oracle.com.cloud.common.Request+json','SUCCESS','DELETE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/22765532B26678EAE05365ED090A4ABD');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('467','/em/cloud/request/22765532B3F578EAE05365ED090A4ABD','cmr4_CREATE_16_0#467','application/oracle.com.cloud.common.Request+json','SUCCESS','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/22765532B3F578EAE05365ED090A4ABD');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('504','/em/cloud/request/227A72EBBA752D7EE05365ED090A0C90','Startup_cmr4.enkitec.com_19-10-2015 14:39:02#504','application/oracle.com.cloud.common.Request+json','EXECUTION_ERROR','START','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/227A72EBBA752D7EE05365ED090A0C90');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('682','/em/cloud/request/22B57C284D90722FE05365ED090A3554','blc1.enkitec.com_Delete Database#682','application/oracle.com.cloud.common.Request+json','SUCCESS','DELETE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/22B57C284D90722FE05365ED090A3554');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('701','/em/cloud/request/22B57C284E59722FE05365ED090A3554','blc02.enkitec.com_Delete Database#701','application/oracle.com.cloud.common.Request+json','SUCCESS','DELETE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/22B57C284E59722FE05365ED090A3554');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('702','/em/cloud/request/22B57C284F6B722FE05365ED090A3554','Dannyb7_CREATE_58_21#702','application/oracle.com.cloud.common.Request+json','SUCCESS','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/22B57C284F6B722FE05365ED090A3554');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('722','/em/cloud/request/22BFB4C0FD9E0569E05365ED090A7F80','Shutdown_cmr9.enkitec.com_23-10-2015 12:04:36#722','application/oracle.com.cloud.common.Request+json','SUCCESS','STOP','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/22BFB4C0FD9E0569E05365ED090A7F80');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('723','/em/cloud/request/22BFB4C0FEB90569E05365ED090A7F80','Startup_cmr9.enkitec.com_23-10-2015 12:49:53#723','application/oracle.com.cloud.common.Request+json','SUCCESS','START','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/22BFB4C0FEB90569E05365ED090A7F80');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('741','/em/cloud/request/22F516D57E6C1CBCE05365ED090A44A3','db11_CREATE_12_47#741','application/oracle.com.cloud.common.Request+json','CLEANED','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/22F516D57E6C1CBCE05365ED090A44A3');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('742','/em/cloud/request/22F516D57EFE1CBCE05365ED090A44A3','db12_CREATE_35_45#742','application/oracle.com.cloud.common.Request+json','EXECUTION_ERROR','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/22F516D57EFE1CBCE05365ED090A44A3');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('761','/em/cloud/request/22F62DD024F76B6EE05365ED090AA0B8','db13_CREATE_17_54#761','application/oracle.com.cloud.common.Request+json','SUCCESS','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/22F62DD024F76B6EE05365ED090AA0B8');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('821','/em/cloud/request/232FD356FB4B2851E05365ED090AEF98','Startup_cmr6.enkitec.com_28-10-2015 15:08:46#821','application/oracle.com.cloud.common.Request+json','SUCCESS','START','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/232FD356FB4B2851E05365ED090AEF98');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('61','/em/cloud/request/2097AAD80C677FB8E05365ED090A8664','CLOUD_DEMO_DBAAS - Fri Sep 25 14:54:51 EDT 2015_CREATE_54_51#61','application/oracle.com.cloud.common.Request+json','CLEANED','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/2097AAD80C677FB8E05365ED090A8664');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('65','/em/cloud/request/2098E9B558CF3049E05365ED090AC324','testdb_CREATE_40_24#65','application/oracle.com.cloud.common.Request+json','SUCCESS','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/2098E9B558CF3049E05365ED090AC324');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('102','/em/cloud/request/2110A0E413436C04E05365ED090AEA4F','testdb_CREATE_14_10#102','application/oracle.com.cloud.common.Request+json','SUCCESS','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/2110A0E413436C04E05365ED090AEA4F');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('103','/em/cloud/request/2110A0E4137E6C04E05365ED090AEA4F','testdb_CREATE_30_26#103','application/oracle.com.cloud.common.Request+json','SUCCESS','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/2110A0E4137E6C04E05365ED090AEA4F');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('121','/em/cloud/request/2121BD55B9530727E05365ED090AA500','testdb_CREATE_33_26#121','application/oracle.com.cloud.common.Request+json','SUCCESS','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/2121BD55B9530727E05365ED090AA500');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('242','/em/cloud/request/21B26493C9752927E05365ED090A8225','mbd3.enkitec.com_Delete Database#242','application/oracle.com.cloud.common.Request+json','EXECUTION_ERROR','DELETE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/21B26493C9752927E05365ED090A8225');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('243','/em/cloud/request/21B26493CA0C2927E05365ED090A8225','aegtest1.enkitec.com_Delete Database#243','application/oracle.com.cloud.common.Request+json','SUCCESS','DELETE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/21B26493CA0C2927E05365ED090A8225');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('281','/em/cloud/request/21EB7571635B4EEBE05365ED090A50F3','tesdb1_CREATE_1_14#281','application/oracle.com.cloud.common.Request+json','SUCCESS','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/21EB7571635B4EEBE05365ED090A50F3');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('282','/em/cloud/request/21ECA683DF6877DBE05365ED090A1DFE','tesdb1_CREATE_34_12#282','application/oracle.com.cloud.common.Request+json','SUCCESS','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/21ECA683DF6877DBE05365ED090A1DFE');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('283','/em/cloud/request/21EC4BDCAA7E7525E05365ED090A8EF9','testdb_CREATE_42_25#283','application/oracle.com.cloud.common.Request+json','SUCCESS','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/21EC4BDCAA7E7525E05365ED090A8EF9');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('284','/em/cloud/request/21EC4BDCAC917525E05365ED090A8EF9','tesdb1_CREATE_30_15#284','application/oracle.com.cloud.common.Request+json','NO_RESOURCE_ERROR','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/21EC4BDCAC917525E05365ED090A8EF9');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('321','/em/cloud/request/221CB1EBC9AD6D58E05365ED090ACC0E','tesdb1_CREATE_48_39#321','application/oracle.com.cloud.common.Request+json','SUCCESS','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/221CB1EBC9AD6D58E05365ED090ACC0E');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('344','/em/cloud/request/222AAE5807D0182DE05365ED090A4E2F','mdb20.enkitec.com_Delete Database#344','application/oracle.com.cloud.common.Request+json','SUCCESS','DELETE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/222AAE5807D0182DE05365ED090A4E2F');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('363','/em/cloud/request/223F4E427C713C38E05365ED090AA799','cmr11_CREATE_9_30#363','application/oracle.com.cloud.common.Request+json','SUCCESS','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/223F4E427C713C38E05365ED090AA799');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('401','/em/cloud/request/2241A7DCD32D1C2FE05365ED090A4D5A','AEGTST2_CREATE_47_48#401','application/oracle.com.cloud.common.Request+json','EXECUTION_ERROR','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/2241A7DCD32D1C2FE05365ED090A4D5A');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('462','/em/cloud/request/2275E5F886335BE6E05365ED090A392A','med3.enkitec.com_Delete Database#462','application/oracle.com.cloud.common.Request+json','SUCCESS','DELETE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/2275E5F886335BE6E05365ED090A392A');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('463','/em/cloud/request/2275E5F886525BE6E05365ED090A392A','dt3.enkitec.com_Delete Database#463','application/oracle.com.cloud.common.Request+json','SUCCESS','DELETE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/2275E5F886525BE6E05365ED090A392A');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('464','/em/cloud/request/2275E5F886765BE6E05365ED090A392A','mdb22.enkitec.com_Delete Database#464','application/oracle.com.cloud.common.Request+json','SUCCESS','DELETE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/2275E5F886765BE6E05365ED090A392A');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('466','/em/cloud/request/2276181DA2946A63E05365ED090A923D','curlsid.enkitec.com_Delete Database#466','application/oracle.com.cloud.common.Request+json','SUCCESS','DELETE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/2276181DA2946A63E05365ED090A923D');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('481','/em/cloud/request/2276DABA71C11293E05365ED090AD0F5','Shutdown_cmr4.enkitec.com_19-10-2015 13:55:32#481','application/oracle.com.cloud.common.Request+json','SUCCESS','STOP','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/2276DABA71C11293E05365ED090AD0F5');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('482','/em/cloud/request/2279EFCDF56914A0E05365ED090A6FAB','Startup_cmr4.enkitec.com_19-10-2015 14:11:22#482','application/oracle.com.cloud.common.Request+json','SUCCESS','START','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/2279EFCDF56914A0E05365ED090A6FAB');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('501','/em/cloud/request/2279EFCDF58314A0E05365ED090A6FAB','Shutdown_cmr4.enkitec.com_19-10-2015 14:19:20#501','application/oracle.com.cloud.common.Request+json','SUCCESS','STOP','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/2279EFCDF58314A0E05365ED090A6FAB');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('502','/em/cloud/request/2279EFCDF59714A0E05365ED090A6FAB','cmr5_CREATE_20_18#502','application/oracle.com.cloud.common.Request+json','SUCCESS','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/2279EFCDF59714A0E05365ED090A6FAB');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('503','/em/cloud/request/2276DABA72491293E05365ED090AD0F5','Startup_cmr4.enkitec.com_19-10-2015 14:24:07#503','application/oracle.com.cloud.common.Request+json','SUCCESS','START','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/2276DABA72491293E05365ED090AD0F5');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('525','/em/cloud/request/22806B12253327C6E05365ED090AF7E8','Shutdown_cmr6.enkitec.com_19-10-2015 21:48:00#525','application/oracle.com.cloud.common.Request+json','SUCCESS','STOP','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/22806B12253327C6E05365ED090AF7E8');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('541','/em/cloud/request/22806B12260227C6E05365ED090AF7E8','Startup_cmr6.enkitec.com_19-10-2015 22:09:41#541','application/oracle.com.cloud.common.Request+json','SUCCESS','START','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/22806B12260227C6E05365ED090AF7E8');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('47','/em/cloud/request/2082D84CE2715D13E05365ED090A64F7','SYSMAN - Thu Sep 24 2015 14:30:06 EDT_CREATE_32_31#47','application/oracle.com.cloud.common.Request+json','CLEANUP_FAILED','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/2082D84CE2715D13E05365ED090A64F7');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('63','/em/cloud/request/209843112A7512B3E05365ED090A731C','CLOUD_DEMO_DBAAS - Fri Sep 25 15:48:46 EDT 2015_CREATE_48_46#63','application/oracle.com.cloud.common.Request+json','CLEANED','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/209843112A7512B3E05365ED090A731C');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('141','/em/cloud/request/21245106D04877E4E05365ED090A89B0','testdb_CREATE_43_40#141','application/oracle.com.cloud.common.Request+json','SUCCESS','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/21245106D04877E4E05365ED090A89B0');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('202','/em/cloud/request/219891C8E0740465E05365ED090AA496','tesdb1_CREATE_46_40#202','application/oracle.com.cloud.common.Request+json','CLEANED','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/219891C8E0740465E05365ED090AA496');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('261','/em/cloud/request/21C923482494690EE05365ED090ADB7A','tesdb1_CREATE_29_46#261','application/oracle.com.cloud.common.Request+json','NO_RESOURCE_ERROR','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/21C923482494690EE05365ED090ADB7A');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('341','/em/cloud/request/221CB2540EFD68C3E05365ED090A7F6A','tesdb1_CREATE_59_26#341','application/oracle.com.cloud.common.Request+json','SUCCESS','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/221CB2540EFD68C3E05365ED090A7F6A');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('361','/em/cloud/request/223CCEE5DCF3461CE05365ED090A4D75','cmr1_CREATE_33_38#361','application/oracle.com.cloud.common.Request+json','SUCCESS','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/223CCEE5DCF3461CE05365ED090A4D75');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('362','/em/cloud/request/223CCEE5DD4B461CE05365ED090A4D75','cmr_CREATE_58_43#362','application/oracle.com.cloud.common.Request+json','EXECUTION_ERROR','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/223CCEE5DD4B461CE05365ED090A4D75');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('381','/em/cloud/request/2241C05FE58C1F8AE05365ED090A6A73','cmr1.enkitec.com_Delete Database#381','application/oracle.com.cloud.common.Request+json','SUCCESS','DELETE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/2241C05FE58C1F8AE05365ED090A6A73');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('402','/em/cloud/request/22668A096C3F7A14E05365ED090A8EDB','Demo_CREATE_4_31#402','application/oracle.com.cloud.common.Request+json','SUCCESS','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/22668A096C3F7A14E05365ED090A8EDB');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('422','/em/cloud/request/22668A09705B7A14E05365ED090A8EDB','DBTest2_CREATE_57_42#422','application/oracle.com.cloud.common.Request+json','SUCCESS','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/22668A09705B7A14E05365ED090A8EDB');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('442','/em/cloud/request/2269262F1CD66402E05365ED090A866F','cmr11.enkitec.com_Delete Database#442','application/oracle.com.cloud.common.Request+json','SUCCESS','DELETE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/2269262F1CD66402E05365ED090A866F');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('443','/em/cloud/request/2269262F1D976402E05365ED090A866F','cmr1_CREATE_54_32#443','application/oracle.com.cloud.common.Request+json','SUCCESS','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/2269262F1D976402E05365ED090A866F');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('444','/em/cloud/request/2269262F1E9C6402E05365ED090A866F','cmr1.enkitec.com_Delete Database#444','application/oracle.com.cloud.common.Request+json','SUCCESS','DELETE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/2269262F1E9C6402E05365ED090A866F');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('445','/em/cloud/request/2269262F1F1E6402E05365ED090A866F','cmr2_CREATE_51_37#445','application/oracle.com.cloud.common.Request+json','NO_RESOURCE_ERROR','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/2269262F1F1E6402E05365ED090A866F');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('446','/em/cloud/request/2269262F1F516402E05365ED090A866F','cmr3_CREATE_53_19#446','application/oracle.com.cloud.common.Request+json','NO_RESOURCE_ERROR','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/2269262F1F516402E05365ED090A866F');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('447','/em/cloud/request/2269262F20576402E05365ED090A866F','dt2.enkitec.com_Delete Database#447','application/oracle.com.cloud.common.Request+json','SUCCESS','DELETE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/2269262F20576402E05365ED090A866F');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('461','/em/cloud/request/2269262F21D36402E05365ED090A866F','mdb23.enkitec.com_Delete Database#461','application/oracle.com.cloud.common.Request+json','SUCCESS','DELETE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/2269262F21D36402E05365ED090A866F');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('505','/em/cloud/request/227AB462095E3929E05365ED090A3A8D','Shutdown_cmr5.enkitec.com_19-10-2015 16:05:46#505','application/oracle.com.cloud.common.Request+json','SUCCESS','STOP','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/227AB462095E3929E05365ED090A3A8D');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('506','/em/cloud/request/227AB46209C53929E05365ED090A3A8D','cmr4.enkitec.com_Delete Database#506','application/oracle.com.cloud.common.Request+json','SUCCESS','DELETE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/227AB46209C53929E05365ED090A3A8D');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('522','/em/cloud/request/227AB4620A983929E05365ED090A3A8D','cmr6_CREATE_33_23#522','application/oracle.com.cloud.common.Request+json','SUCCESS','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/227AB4620A983929E05365ED090A3A8D');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('542','/em/cloud/request/22806B12262627C6E05365ED090AF7E8','Startup_cmr6.enkitec.com_19-10-2015 22:13:17#542','application/oracle.com.cloud.common.Request+json','EXECUTION_ERROR','START','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/22806B12262627C6E05365ED090AF7E8');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('543','/em/cloud/request/22806B12267E27C6E05365ED090AF7E8','blc_CREATE_41_8#543','application/oracle.com.cloud.common.Request+json','SUCCESS','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/22806B12267E27C6E05365ED090AF7E8');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('665','/em/cloud/request/22B51BCE12905D04E05365ED090AD297','Startup_cmr9.enkitec.com_22-10-2015 12:41:50#665','application/oracle.com.cloud.common.Request+json','SUCCESS','START','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/22B51BCE12905D04E05365ED090AD297');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('681','/em/cloud/request/22B51BCE13055D04E05365ED090AD297','dbt1.enkitec.com_Delete Database#681','application/oracle.com.cloud.common.Request+json','SUCCESS','DELETE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/22B51BCE13055D04E05365ED090AD297');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('683','/em/cloud/request/22B51BCE14235D04E05365ED090AD297','Shutdown_blc02.enkitec.com_22-10-2015 15:47:14#683','application/oracle.com.cloud.common.Request+json','SUCCESS','STOP','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/22B51BCE14235D04E05365ED090AD297');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('64','/em/cloud/request/2098EAE8277C3489E05365ED090AA57F','testdb_CREATE_24_19#64','application/oracle.com.cloud.common.Request+json','SUCCESS','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/2098EAE8277C3489E05365ED090AA57F');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('81','/em/cloud/request/20FD547634EF7276E05365ED090AE842','aegtest_CREATE_45_46#81','application/oracle.com.cloud.common.Request+json','SUCCESS','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/20FD547634EF7276E05365ED090AE842');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('101','/em/cloud/request/20FD547636C67276E05365ED090AE842','aegtest_CREATE_37_26#101','application/oracle.com.cloud.common.Request+json','SUCCESS','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/20FD547636C67276E05365ED090AE842');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('223','/em/cloud/request/219C7A54D90324B8E05365ED090A536D','tesdb1_CREATE_22_57#223','application/oracle.com.cloud.common.Request+json','CLEANED','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/219C7A54D90324B8E05365ED090A536D');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('241','/em/cloud/request/21AFF4089BBB3D61E05365ED090A0CAD','tesdb1_CREATE_37_5#241','application/oracle.com.cloud.common.Request+json','NO_RESOURCE_ERROR','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/21AFF4089BBB3D61E05365ED090A0CAD');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('286','/em/cloud/request/21EE4746379C44DEE05365ED090AD62A','SYSMAN - Mon Oct 12 2015 15:56:21 EDT_CREATE_57_46#286','application/oracle.com.cloud.common.Request+json','NO_RESOURCE_ERROR','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/21EE4746379C44DEE05365ED090AD62A');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('322','/em/cloud/request/221CA8E39DCE691BE05365ED090AF2DA','mdb13.enkitec.com_Delete Database#322','application/oracle.com.cloud.common.Request+json','SUCCESS','DELETE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/221CA8E39DCE691BE05365ED090AF2DA');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('507','/em/cloud/request/227BBEBB61414DECE05365ED090A25E7','Startup_cmr5.enkitec.com_19-10-2015 16:11:44#507','application/oracle.com.cloud.common.Request+json','SUCCESS','START','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/227BBEBB61414DECE05365ED090A25E7');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('521','/em/cloud/request/227BBEBB62544DECE05365ED090A25E7','cmr5.enkitec.com_Delete Database#521','application/oracle.com.cloud.common.Request+json','SUCCESS','DELETE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/227BBEBB62544DECE05365ED090A25E7');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('523','/em/cloud/request/227BBEBB63414DECE05365ED090A25E7','blc1_CREATE_25_42#523','application/oracle.com.cloud.common.Request+json','EXECUTION_ERROR','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/227BBEBB63414DECE05365ED090A25E7');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('524','/em/cloud/request/227BBEBB65464DECE05365ED090A25E7','dbryant_CREATE_35_30#524','application/oracle.com.cloud.common.Request+json','SUCCESS','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/227BBEBB65464DECE05365ED090A25E7');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('561','/em/cloud/request/229669F341DD0909E05365ED090A81CC','cmr7_CREATE_1_31#561','application/oracle.com.cloud.common.Request+json','SUCCESS','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/229669F341DD0909E05365ED090A81CC');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('581','/em/cloud/request/229669F342430909E05365ED090A81CC','cmr7.enkitec.com_Delete Database#581','application/oracle.com.cloud.common.Request+json','SUCCESS','DELETE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/229669F342430909E05365ED090A81CC');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('582','/em/cloud/request/228D6D7D2DEC7B9CE05365ED090A93E7','cmr9_CREATE_27_26#582','application/oracle.com.cloud.common.Request+json','SUCCESS','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/228D6D7D2DEC7B9CE05365ED090A93E7');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('601','/em/cloud/request/228D6D7D2E687B9CE05365ED090A93E7','Shutdown_cmr6.enkitec.com_21-10-2015 17:48:14#601','application/oracle.com.cloud.common.Request+json','SUCCESS','STOP','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/228D6D7D2E687B9CE05365ED090A93E7');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('662','/em/cloud/request/22B49119ACF4437BE05365ED090A0DCA','Startup_cmr6.enkitec.com_22-10-2015 12:06:19#662','application/oracle.com.cloud.common.Request+json','SUCCESS','START','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/22B49119ACF4437BE05365ED090A0DCA');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('664','/em/cloud/request/22B49119AE54437BE05365ED090A0DCA','Startup_dbt1.enkitec.com_22-10-2015 12:26:20#664','application/oracle.com.cloud.common.Request+json','SUCCESS','START','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/22B49119AE54437BE05365ED090A0DCA');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('666','/em/cloud/request/22B49119AEF6437BE05365ED090A0DCA','blc2_CREATE_46_0#666','application/oracle.com.cloud.common.Request+json','SUCCESS','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/22B49119AEF6437BE05365ED090A0DCA');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('721','/em/cloud/request/22BF573B12507BD8E05365ED090A5991','Dbt10.enkitec.com_Delete Database#721','application/oracle.com.cloud.common.Request+json','SUCCESS','DELETE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/22BF573B12507BD8E05365ED090A5991');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('762','/em/cloud/request/22F62F3A47CA6B20E05365ED090A972C','blc4_CREATE_28_40#762','application/oracle.com.cloud.common.Request+json','EXECUTION_ERROR','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/22F62F3A47CA6B20E05365ED090A972C');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('781','/em/cloud/request/2305C96F57B932A2E05365ED090AB81E','blc5_CREATE_0_26#781','application/oracle.com.cloud.common.Request+json','SUCCESS','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/2305C96F57B932A2E05365ED090AB81E');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('801','/em/cloud/request/230F1CCC2DE328F7E05365ED090AD311','db14_CREATE_36_10#801','application/oracle.com.cloud.common.Request+json','SUCCESS','CREATE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/230F1CCC2DE328F7E05365ED090AD311');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('802','/em/cloud/request/231EB5DF55BD7757E05365ED090A2586','Shutdown_cmr6.enkitec.com_27-10-2015 18:39:18#802','application/oracle.com.cloud.common.Request+json','SUCCESS','STOP','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/231EB5DF55BD7757E05365ED090A2586');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('803','/em/cloud/request/231EC6ADB3E6081CE05365ED090A3740','Startup_cmr6.enkitec.com_27-10-2015 18:57:01#803','application/oracle.com.cloud.common.Request+json','SUCCESS','START','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/231EC6ADB3E6081CE05365ED090A3740');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('804','/em/cloud/request/231EFF1D402413D7E05365ED090A587D','Shutdown_cmr6.enkitec.com_27-10-2015 23:09:36#804','application/oracle.com.cloud.common.Request+json','SUCCESS','STOP','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/231EFF1D402413D7E05365ED090A587D');
Insert into SERVICE_REQUESTS_V (ID,URI,NAME,MEDIA_TYPE,STATUS,LIFECYCLE_TYPE,CANONICAL_LINK) values ('805','/em/cloud/request/231EFF1D411B13D7E05365ED090A587D','dbt14.enkitec.com_Delete Database#805','application/oracle.com.cloud.common.Request+json','SUCCESS','DELETE','/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/request/231EFF1D411B13D7E05365ED090A587D');
REM INSERTING into ACTIVE_DATABASES_V
SET DEFINE OFF;
REM INSERTING into SAMPLE_CLOBS
SET DEFINE OFF;
Insert into SAMPLE_CLOBS (NAME) values ('shutdown');
Insert into SAMPLE_CLOBS (NAME) values ('invalid operation');
Insert into SAMPLE_CLOBS (NAME) values ('discover');
Insert into SAMPLE_CLOBS (NAME) values ('dbstat');
Insert into SAMPLE_CLOBS (NAME) values ('delete');
REM INSERTING into LOG_V
SET DEFINE OFF;
Insert into LOG_V (ID,MSG) values (1046,'rad: refresh');
Insert into LOG_V (ID,MSG) values (1045,'rad: last_updated +5: 10:58:15, SYSDATE: 11:09:14');
Insert into LOG_V (ID,MSG) values (1044,'rad: refresh');
Insert into LOG_V (ID,MSG) values (1043,'rad: last_updated +5: 10:40:12, SYSDATE: 10:53:07');
Insert into LOG_V (ID,MSG) values (1042,'rad: refresh');
Insert into LOG_V (ID,MSG) values (1041,'rad: last_updated +5: 10:29:17, SYSDATE: 10:35:03');
Insert into LOG_V (ID,MSG) values (1040,'rad: refresh');
Insert into LOG_V (ID,MSG) values (1039,'rad: last_updated +5: , SYSDATE: 10:24:09');
Insert into LOG_V (ID,MSG) values (1038,'rad: refresh');
Insert into LOG_V (ID,MSG) values (1037,'rad: last_updated +5: , SYSDATE: 18:26:16');
Insert into LOG_V (ID,MSG) values (1036,'rad: refresh');
Insert into LOG_V (ID,MSG) values (1035,'rad: last_updated +5: , SYSDATE: 14:24:07');
Insert into LOG_V (ID,MSG) values (1034,'rad: refresh');
Insert into LOG_V (ID,MSG) values (1033,'rad: last_updated +5: 17:28:35, SYSDATE: 17:30:15');
Insert into LOG_V (ID,MSG) values (1032,'rad: refresh');
Insert into LOG_V (ID,MSG) values (1031,'rad: last_updated +5: , SYSDATE: 17:23:27');
Insert into LOG_V (ID,MSG) values (1030,'rad: refresh');
Insert into LOG_V (ID,MSG) values (1029,'rad: last_updated +5: , SYSDATE: 17:17:09');
Insert into LOG_V (ID,MSG) values (1028,'rad: refresh');
Insert into LOG_V (ID,MSG) values (1027,'rad: last_updated +5: , SYSDATE: 17:11:16');
Insert into LOG_V (ID,MSG) values (1026,'rad: refresh');
Insert into LOG_V (ID,MSG) values (1025,'rad: last_updated +5: 16:41:36, SYSDATE: 17:08:54');
Insert into LOG_V (ID,MSG) values (1024,'rad: refresh');
Insert into LOG_V (ID,MSG) values (1023,'rad: last_updated +5: , SYSDATE: 16:36:28');
Insert into LOG_V (ID,MSG) values (1022,'rad: refresh');
Insert into LOG_V (ID,MSG) values (1021,'rad: last_updated +5: 14:41:53, SYSDATE: 14:49:11');
Insert into LOG_V (ID,MSG) values (1020,'rad: refresh');
Insert into LOG_V (ID,MSG) values (1019,'rad: last_updated +5: 14:41:53, SYSDATE: 14:49:10');
Insert into LOG_V (ID,MSG) values (1018,'rad: refresh');
Insert into LOG_V (ID,MSG) values (1017,'rad: last_updated +5: , SYSDATE: 14:40:20');
Insert into LOG_V (ID,MSG) values (1016,'rad: refresh');
Insert into LOG_V (ID,MSG) values (1015,'rad: last_updated +5: 14:36:45, SYSDATE: 14:36:44');
Insert into LOG_V (ID,MSG) values (1014,'rad: refresh');
Insert into LOG_V (ID,MSG) values (1013,'rad: last_updated +5: 14:29:42, SYSDATE: 14:31:36');
Insert into LOG_V (ID,MSG) values (1012,'522,STARTUP');
Insert into LOG_V (ID,MSG) values (1011,'rad: refresh');
Insert into LOG_V (ID,MSG) values (1010,'rad: last_updated +5: , SYSDATE: 14:24:35');
Insert into LOG_V (ID,MSG) values (1009,'rad: refresh');
Insert into LOG_V (ID,MSG) values (1008,'rad: last_updated +5: 22:37:44, SYSDATE: 22:34:11');
Insert into LOG_V (ID,MSG) values (1007,'rad: refresh');
Insert into LOG_V (ID,MSG) values (1006,'rad: last_updated +5: 22:35:35, SYSDATE: 22:32:36');
Insert into LOG_V (ID,MSG) values (1005,'522,SHUTDOWN');
Insert into LOG_V (ID,MSG) values (1004,'rad: refresh');
Insert into LOG_V (ID,MSG) values (1003,'rad: last_updated +5: , SYSDATE: 22:30:25');
Insert into LOG_V (ID,MSG) values (1002,'rad: refresh');
Insert into LOG_V (ID,MSG) values (1001,'rad: last_updated +5: 18:25:41, SYSDATE: 18:25:13');
Insert into LOG_V (ID,MSG) values (1000,'rad: refresh');
Insert into LOG_V (ID,MSG) values (999,'rad: last_updated +5: 18:25:07, SYSDATE: 18:20:30');
Insert into LOG_V (ID,MSG) values (998,'rad: refresh');
Insert into LOG_V (ID,MSG) values (997,'rad: last_updated +5: 18:21:45, SYSDATE: 18:19:59');
Insert into LOG_V (ID,MSG) values (996,'522,STARTUP');
Insert into LOG_V (ID,MSG) values (995,'rad: refresh');
Insert into LOG_V (ID,MSG) values (994,'rad: last_updated +5: 18:18:50, SYSDATE: 18:16:37');
Insert into LOG_V (ID,MSG) values (993,'rad: refresh');
Insert into LOG_V (ID,MSG) values (992,'rad: last_updated +5: , SYSDATE: 18:13:43');
Insert into LOG_V (ID,MSG) values (991,'rad: refresh');
Insert into LOG_V (ID,MSG) values (990,'rad: last_updated +5: 18:16:53, SYSDATE: 18:13:08');
Insert into LOG_V (ID,MSG) values (989,'rad: refresh');
Insert into LOG_V (ID,MSG) values (988,'rad: last_updated +5: 18:10:48, SYSDATE: 18:11:46');
Insert into LOG_V (ID,MSG) values (987,'rad: refresh');
Insert into LOG_V (ID,MSG) values (986,'rad: last_updated +5: 18:07:21, SYSDATE: 18:05:40');
Insert into LOG_V (ID,MSG) values (985,'rad: refresh');
Insert into LOG_V (ID,MSG) values (984,'rad: last_updated +5: 18:04:49, SYSDATE: 18:02:13');
Insert into LOG_V (ID,MSG) values (983,'522,SHUTDOWN');
Insert into LOG_V (ID,MSG) values (982,'rad: refresh');
Insert into LOG_V (ID,MSG) values (981,'rad: last_updated +5: 17:59:54, SYSDATE: 17:59:41');
Insert into LOG_V (ID,MSG) values (980,'rad: refresh');
Insert into LOG_V (ID,MSG) values (979,'rad: last_updated +5: , SYSDATE: 17:54:46');
Insert into LOG_V (ID,MSG) values (978,'rad: refresh');
Insert into LOG_V (ID,MSG) values (977,'rad: last_updated +5: , SYSDATE: 17:50:41');
Insert into LOG_V (ID,MSG) values (976,'rad: refresh');
Insert into LOG_V (ID,MSG) values (975,'rad: last_updated +5: 14:35:42, SYSDATE: 15:04:36');
Insert into LOG_V (ID,MSG) values (974,'rad: refresh');
Insert into LOG_V (ID,MSG) values (973,'rad: last_updated +5: 14:01:29, SYSDATE: 14:30:32');
Insert into LOG_V (ID,MSG) values (972,'rad: refresh');
Insert into LOG_V (ID,MSG) values (971,'rad: last_updated +5: 13:38:42, SYSDATE: 13:56:21');
Insert into LOG_V (ID,MSG) values (970,'rad: refresh');
Insert into LOG_V (ID,MSG) values (969,'rad: last_updated +5: , SYSDATE: 13:33:34');
Insert into LOG_V (ID,MSG) values (968,'rad: refresh');
Insert into LOG_V (ID,MSG) values (967,'rad: last_updated +5: 17:47:19, SYSDATE: 17:59:15');
Insert into LOG_V (ID,MSG) values (966,'rad: refresh');
Insert into LOG_V (ID,MSG) values (965,'rad: last_updated +5: 17:45:31, SYSDATE: 17:42:11');
Insert into LOG_V (ID,MSG) values (964,'rad: refresh');
Insert into LOG_V (ID,MSG) values (963,'rad: last_updated +5: 17:41:58, SYSDATE: 17:40:24');
Insert into LOG_V (ID,MSG) values (962,'rad: refresh');
Insert into LOG_V (ID,MSG) values (961,'rad: last_updated +5: 17:41:08, SYSDATE: 17:36:52');
Insert into LOG_V (ID,MSG) values (960,'rad: refresh');
Insert into LOG_V (ID,MSG) values (959,'rad: last_updated +5: 17:39:25, SYSDATE: 17:36:01');
Insert into LOG_V (ID,MSG) values (958,'rad: refresh');
Insert into LOG_V (ID,MSG) values (957,'rad: last_updated +5: 17:37:49, SYSDATE: 17:34:18');
Insert into LOG_V (ID,MSG) values (956,'rad: refresh');
Insert into LOG_V (ID,MSG) values (955,'rad: last_updated +5: 17:36:22, SYSDATE: 17:32:42');
Insert into LOG_V (ID,MSG) values (954,'rad: refresh');
Insert into LOG_V (ID,MSG) values (953,'rad: last_updated +5: 17:33:29, SYSDATE: 17:31:15');
Insert into LOG_V (ID,MSG) values (952,'rad: refresh');
Insert into LOG_V (ID,MSG) values (951,'rad: last_updated +5: 17:30:51, SYSDATE: 17:28:22');
Insert into LOG_V (ID,MSG) values (950,'rad: refresh');
Insert into LOG_V (ID,MSG) values (949,'rad: last_updated +5: 17:29:19, SYSDATE: 17:25:44');
Insert into LOG_V (ID,MSG) values (948,'rad: refresh');
Insert into LOG_V (ID,MSG) values (947,'rad: last_updated +5: 17:24:02, SYSDATE: 17:24:13');
Insert into LOG_V (ID,MSG) values (946,'rad: refresh');
Insert into LOG_V (ID,MSG) values (945,'rad: last_updated +5: , SYSDATE: 17:18:55');
Insert into LOG_V (ID,MSG) values (944,'rad: refresh');
Insert into LOG_V (ID,MSG) values (943,'rad: last_updated +5: , SYSDATE: 17:06:38');
Insert into LOG_V (ID,MSG) values (942,'rad: refresh');
Insert into LOG_V (ID,MSG) values (941,'rad: last_updated +5: 12:20:32, SYSDATE: 12:40:19');
Insert into LOG_V (ID,MSG) values (940,'rad: refresh');
Insert into LOG_V (ID,MSG) values (939,'rad: last_updated +5: , SYSDATE: 12:19:26');
Insert into LOG_V (ID,MSG) values (938,'rad: refresh');
Insert into LOG_V (ID,MSG) values (937,'rad: last_updated +5: , SYSDATE: 12:15:25');
Insert into LOG_V (ID,MSG) values (936,'rad: refresh');
Insert into LOG_V (ID,MSG) values (935,'rad: last_updated +5: , SYSDATE: 09:26:31');
Insert into LOG_V (ID,MSG) values (934,'rad: refresh');
Insert into LOG_V (ID,MSG) values (933,'rad: last_updated +5: 17:56:36, SYSDATE: 17:59:11');
Insert into LOG_V (ID,MSG) values (932,'rad: refresh');
Insert into LOG_V (ID,MSG) values (931,'rad: last_updated +5: 17:57:04, SYSDATE: 17:55:02');
Insert into LOG_V (ID,MSG) values (930,'rad: refresh');
Insert into LOG_V (ID,MSG) values (929,'rad: last_updated +5: 17:55:34, SYSDATE: 17:51:58');
Insert into LOG_V (ID,MSG) values (928,'rad: refresh');
Insert into LOG_V (ID,MSG) values (927,'rad: last_updated +5: 17:47:49, SYSDATE: 17:51:29');
Insert into LOG_V (ID,MSG) values (926,'rad: refresh');
Insert into LOG_V (ID,MSG) values (925,'rad: last_updated +5: 17:50:32, SYSDATE: 17:50:28');
Insert into LOG_V (ID,MSG) values (924,'rad: refresh');
Insert into LOG_V (ID,MSG) values (923,'rad: last_updated +5: , SYSDATE: 17:45:26');
Insert into LOG_V (ID,MSG) values (922,'rad: refresh');
Insert into LOG_V (ID,MSG) values (921,'rad: last_updated +5: 17:45:02, SYSDATE: 17:42:43');
Insert into LOG_V (ID,MSG) values (920,'rad: refresh');
Insert into LOG_V (ID,MSG) values (919,'rad: last_updated +5: 16:45:36, SYSDATE: 17:39:51');
Insert into LOG_V (ID,MSG) values (918,'rad: refresh');
Insert into LOG_V (ID,MSG) values (917,'rad: last_updated +5: 16:26:09, SYSDATE: 16:40:30');
Insert into LOG_V (ID,MSG) values (916,'rad: refresh');
Insert into LOG_V (ID,MSG) values (915,'rad: last_updated +5: , SYSDATE: 16:21:02');
Insert into LOG_V (ID,MSG) values (914,'rad: refresh');
Insert into LOG_V (ID,MSG) values (913,'rad: last_updated +5: , SYSDATE: 20:31:33');
Insert into LOG_V (ID,MSG) values (912,'rad: refresh');
Insert into LOG_V (ID,MSG) values (911,'rad: last_updated +5: , SYSDATE: 15:00:25');
Insert into LOG_V (ID,MSG) values (910,'rad: refresh');
Insert into LOG_V (ID,MSG) values (909,'rad: last_updated +5: 12:17:51, SYSDATE: 12:13:14');
Insert into LOG_V (ID,MSG) values (908,'rad: refresh');
Insert into LOG_V (ID,MSG) values (907,'rad: last_updated +5: 12:15:40, SYSDATE: 12:12:41');
Insert into LOG_V (ID,MSG) values (906,'582,STARTUP');
Insert into LOG_V (ID,MSG) values (905,'rad: refresh');
Insert into LOG_V (ID,MSG) values (904,'rad: last_updated +5: 12:09:21, SYSDATE: 12:10:29');
Insert into LOG_V (ID,MSG) values (903,'rad: refresh');
Insert into LOG_V (ID,MSG) values (902,'rad: last_updated +5: , SYSDATE: 12:04:14');
Insert into LOG_V (ID,MSG) values (901,'rad: refresh');
Insert into LOG_V (ID,MSG) values (900,'rad: last_updated +5: 11:32:29, SYSDATE: 11:33:21');
Insert into LOG_V (ID,MSG) values (899,'rad: refresh');
Insert into LOG_V (ID,MSG) values (898,'rad: last_updated +5: 11:32:14, SYSDATE: 11:27:24');
Insert into LOG_V (ID,MSG) values (897,'582,SHUTDOWN');
Insert into LOG_V (ID,MSG) values (896,'rad: refresh');
Insert into LOG_V (ID,MSG) values (895,'rad: last_updated +5: 11:28:55, SYSDATE: 11:27:07');
Insert into LOG_V (ID,MSG) values (894,'rad: refresh');
Insert into LOG_V (ID,MSG) values (893,'rad: last_updated +5: 11:21:33, SYSDATE: 11:23:48');
Insert into LOG_V (ID,MSG) values (892,'rad: refresh');
Insert into LOG_V (ID,MSG) values (891,'rad: last_updated +5: , SYSDATE: 11:18:20');
Insert into LOG_V (ID,MSG) values (890,'rad: refresh');
Insert into LOG_V (ID,MSG) values (889,'rad: last_updated +5: , SYSDATE: 11:17:44');
Insert into LOG_V (ID,MSG) values (888,'rad: refresh');
Insert into LOG_V (ID,MSG) values (887,'rad: last_updated +5: , SYSDATE: 11:16:53');
Insert into LOG_V (ID,MSG) values (886,'rad: refresh');
Insert into LOG_V (ID,MSG) values (885,'rad: last_updated +5: , SYSDATE: 11:16:27');
Insert into LOG_V (ID,MSG) values (884,'rad: refresh');
Insert into LOG_V (ID,MSG) values (883,'rad: last_updated +5: , SYSDATE: 11:06:11');
Insert into LOG_V (ID,MSG) values (882,'rad: refresh');
Insert into LOG_V (ID,MSG) values (881,'rad: last_updated +5: , SYSDATE: 11:05:27');
Insert into LOG_V (ID,MSG) values (880,'rad: refresh');
Insert into LOG_V (ID,MSG) values (879,'rad: last_updated +5: , SYSDATE: 11:04:53');
Insert into LOG_V (ID,MSG) values (878,'rad: refresh');
Insert into LOG_V (ID,MSG) values (877,'rad: last_updated +5: 11:09:19, SYSDATE: 11:04:31');
Insert into LOG_V (ID,MSG) values (876,'rad: refresh');
Insert into LOG_V (ID,MSG) values (875,'rad: last_updated +5: 11:07:18, SYSDATE: 11:04:13');
Insert into LOG_V (ID,MSG) values (874,'rad: refresh');
Insert into LOG_V (ID,MSG) values (873,'rad: last_updated +5: , SYSDATE: 11:02:08');
Insert into LOG_V (ID,MSG) values (872,'rad: refresh');
Insert into LOG_V (ID,MSG) values (871,'rad: last_updated +5: 00:20:39, SYSDATE: 00:24:10');
Insert into LOG_V (ID,MSG) values (870,'rad: refresh');
Insert into LOG_V (ID,MSG) values (869,'rad: last_updated +5: , SYSDATE: 00:15:33');
Insert into LOG_V (ID,MSG) values (868,'rad: refresh');
Insert into LOG_V (ID,MSG) values (867,'rad: last_updated +5: , SYSDATE: 00:06:54');
Insert into LOG_V (ID,MSG) values (866,'rad: refresh');
Insert into LOG_V (ID,MSG) values (865,'rad: last_updated +5: 16:36:00, SYSDATE: 16:52:05');
Insert into LOG_V (ID,MSG) values (864,'rad: refresh');
Insert into LOG_V (ID,MSG) values (863,'rad: last_updated +5: , SYSDATE: 16:30:54');
Insert into LOG_V (ID,MSG) values (862,'rad: refresh');
Insert into LOG_V (ID,MSG) values (861,'rad: last_updated +5: 15:13:23, SYSDATE: 15:10:08');
Insert into LOG_V (ID,MSG) values (860,'666,SHUTDOWN');
Insert into LOG_V (ID,MSG) values (859,'rad: refresh');
Insert into LOG_V (ID,MSG) values (858,'rad: last_updated +5: , SYSDATE: 15:08:16');
Insert into LOG_V (ID,MSG) values (857,'rad: refresh');
Insert into LOG_V (ID,MSG) values (856,'rad: last_updated +5: 12:24:23, SYSDATE: 13:12:09');
Insert into LOG_V (ID,MSG) values (855,'rad: refresh');
Insert into LOG_V (ID,MSG) values (854,'rad: last_updated +5: 12:47:33, SYSDATE: 13:05:42');
Insert into LOG_V (ID,MSG) values (853,'rad: refresh');
Insert into LOG_V (ID,MSG) values (852,'rad: last_updated +5: 12:45:45, SYSDATE: 12:42:25');
Insert into LOG_V (ID,MSG) values (851,'rad: refresh');
Insert into LOG_V (ID,MSG) values (850,'rad: last_updated +5: , SYSDATE: 12:40:37');
Insert into LOG_V (ID,MSG) values (849,'rad: refresh');
Insert into LOG_V (ID,MSG) values (848,'rad: last_updated +5: , SYSDATE: 12:19:36');
Insert into LOG_V (ID,MSG) values (847,'rad: refresh');
Insert into LOG_V (ID,MSG) values (846,'rad: last_updated +5: 12:10:21, SYSDATE: 12:19:14');
Insert into LOG_V (ID,MSG) values (845,'rad: refresh');
Insert into LOG_V (ID,MSG) values (844,'rad: last_updated +5: 12:05:18, SYSDATE: 12:09:09');
Insert into LOG_V (ID,MSG) values (843,'rad: refresh');
Insert into LOG_V (ID,MSG) values (842,'rad: last_updated +5: 12:09:45, SYSDATE: 12:05:10');
Insert into LOG_V (ID,MSG) values (841,'rad: refresh');
Insert into LOG_V (ID,MSG) values (840,'rad: last_updated +5: 12:06:59, SYSDATE: 12:04:38');
Insert into LOG_V (ID,MSG) values (839,'582,STARTUP');
Insert into LOG_V (ID,MSG) values (838,'rad: refresh');
Insert into LOG_V (ID,MSG) values (837,'rad: last_updated +5: 11:36:43, SYSDATE: 12:01:52');
Insert into LOG_V (ID,MSG) values (836,'rad: refresh');
Insert into LOG_V (ID,MSG) values (835,'rad: last_updated +5: , SYSDATE: 12:00:12');
Insert into LOG_V (ID,MSG) values (834,'rad: refresh');
Insert into LOG_V (ID,MSG) values (833,'rad: last_updated +5: 11:53:45, SYSDATE: 11:49:14');
Insert into LOG_V (ID,MSG) values (832,'524,STARTUP');
Insert into LOG_V (ID,MSG) values (831,'rad: refresh');
Insert into LOG_V (ID,MSG) values (830,'rad: last_updated +5: , SYSDATE: 11:48:39');
Insert into LOG_V (ID,MSG) values (829,'rad: refresh');
Insert into LOG_V (ID,MSG) values (828,'rad: last_updated +5: 11:35:29, SYSDATE: 11:35:01');
Insert into LOG_V (ID,MSG) values (827,'rad: refresh');
Insert into LOG_V (ID,MSG) values (826,'rad: last_updated +5: 11:34:13, SYSDATE: 11:31:37');
Insert into LOG_V (ID,MSG) values (825,'rad: refresh');
Insert into LOG_V (ID,MSG) values (824,'rad: last_updated +5: 11:34:26, SYSDATE: 11:30:23');
Insert into LOG_V (ID,MSG) values (823,'rad: refresh');
Insert into LOG_V (ID,MSG) values (822,'rad: last_updated +5: 11:33:56, SYSDATE: 11:29:20');
Insert into LOG_V (ID,MSG) values (821,'524,SHUTDOWN');
Insert into LOG_V (ID,MSG) values (820,'rad: refresh');
Insert into LOG_V (ID,MSG) values (819,'rad: last_updated +5: 11:32:41, SYSDATE: 11:29:07');
Insert into LOG_V (ID,MSG) values (818,'522,STARTUP');
Insert into LOG_V (ID,MSG) values (817,'rad: refresh');
Insert into LOG_V (ID,MSG) values (816,'rad: last_updated +5: , SYSDATE: 11:28:50');
Insert into LOG_V (ID,MSG) values (815,'rad: refresh');
Insert into LOG_V (ID,MSG) values (814,'rad: last_updated +5: 11:26:19, SYSDATE: 11:27:35');
Insert into LOG_V (ID,MSG) values (813,'rad: refresh');
Insert into LOG_V (ID,MSG) values (812,'rad: last_updated +5: 11:26:08, SYSDATE: 11:21:13');
Insert into LOG_V (ID,MSG) values (811,'rad: refresh');
Insert into LOG_V (ID,MSG) values (810,'rad: last_updated +5: 11:25:48, SYSDATE: 11:21:02');
Insert into LOG_V (ID,MSG) values (809,'522,SHUTDOWN');
Insert into LOG_V (ID,MSG) values (808,'rad: refresh');
Insert into LOG_V (ID,MSG) values (807,'rad: last_updated +5: 11:25:36, SYSDATE: 11:20:41');
Insert into LOG_V (ID,MSG) values (806,'rad: refresh');
Insert into LOG_V (ID,MSG) values (805,'rad: last_updated +5: 11:25:10, SYSDATE: 11:20:30');
Insert into LOG_V (ID,MSG) values (804,'rad: refresh');
Insert into LOG_V (ID,MSG) values (803,'rad: last_updated +5: 11:19:53, SYSDATE: 11:20:03');
Insert into LOG_V (ID,MSG) values (802,'rad: refresh');
Insert into LOG_V (ID,MSG) values (801,'rad: last_updated +5: 11:17:55, SYSDATE: 11:14:46');
Insert into LOG_V (ID,MSG) values (800,'522,STARTUP');
Insert into LOG_V (ID,MSG) values (799,'rad: refresh');
Insert into LOG_V (ID,MSG) values (798,'rad: last_updated +5: 10:57:55, SYSDATE: 11:12:49');
Insert into LOG_V (ID,MSG) values (797,'rad: refresh');
Insert into LOG_V (ID,MSG) values (796,'rad: last_updated +5: 10:18:44, SYSDATE: 10:52:46');
Insert into LOG_V (ID,MSG) values (795,'rad: refresh');
Insert into LOG_V (ID,MSG) values (794,'rad: last_updated +5: 10:17:46, SYSDATE: 10:13:36');
Insert into LOG_V (ID,MSG) values (793,'rad: refresh');
Insert into LOG_V (ID,MSG) values (792,'rad: last_updated +5: 10:16:10, SYSDATE: 10:12:40');
Insert into LOG_V (ID,MSG) values (791,'582,SHUTDOWN');
Insert into LOG_V (ID,MSG) values (790,'rad: refresh');
Insert into LOG_V (ID,MSG) values (789,'rad: last_updated +5: 10:11:01, SYSDATE: 10:11:03');
Insert into LOG_V (ID,MSG) values (788,'rad: refresh');
Insert into LOG_V (ID,MSG) values (787,'rad: last_updated +5: 10:10:21, SYSDATE: 10:05:55');
Insert into LOG_V (ID,MSG) values (786,'rad: refresh');
Insert into LOG_V (ID,MSG) values (785,'rad: last_updated +5: 10:10:10, SYSDATE: 10:05:15');
Insert into LOG_V (ID,MSG) values (784,'rad: refresh');
Insert into LOG_V (ID,MSG) values (783,'rad: last_updated +5: 10:09:59, SYSDATE: 10:05:04');
Insert into LOG_V (ID,MSG) values (782,'582,STARTUP');
Insert into LOG_V (ID,MSG) values (781,'rad: refresh');
Insert into LOG_V (ID,MSG) values (780,'rad: last_updated +5: 10:09:23, SYSDATE: 10:04:53');
Insert into LOG_V (ID,MSG) values (779,'rad: refresh');
Insert into LOG_V (ID,MSG) values (778,'rad: last_updated +5: 10:08:26, SYSDATE: 10:04:16');
Insert into LOG_V (ID,MSG) values (777,'rad: refresh');
Insert into LOG_V (ID,MSG) values (776,'rad: last_updated +5: 10:06:40, SYSDATE: 10:03:19');
Insert into LOG_V (ID,MSG) values (775,'582,SHUTDOWN');
Insert into LOG_V (ID,MSG) values (774,'rad: refresh');
Insert into LOG_V (ID,MSG) values (773,'rad: last_updated +5: 10:02:15, SYSDATE: 10:01:33');
Insert into LOG_V (ID,MSG) values (772,'rad: refresh');
Insert into LOG_V (ID,MSG) values (771,'rad: last_updated +5: 09:59:29, SYSDATE: 09:57:09');
Insert into LOG_V (ID,MSG) values (770,'582,STARTUP');
Insert into LOG_V (ID,MSG) values (769,'rad: refresh');
Insert into LOG_V (ID,MSG) values (768,'rad: last_updated +5: 09:47:30, SYSDATE: 09:54:23');
Insert into LOG_V (ID,MSG) values (767,'rad: refresh');
Insert into LOG_V (ID,MSG) values (766,'rad: last_updated +5: 09:46:04, SYSDATE: 09:42:24');
Insert into LOG_V (ID,MSG) values (765,'582,SHUTDOWN');
Insert into LOG_V (ID,MSG) values (764,'rad: refresh');
Insert into LOG_V (ID,MSG) values (763,'rad: last_updated +5: 09:44:54, SYSDATE: 09:40:57');
Insert into LOG_V (ID,MSG) values (762,'rad: refresh');
Insert into LOG_V (ID,MSG) values (761,'rad: last_updated +5: 09:42:35, SYSDATE: 09:39:47');
Insert into LOG_V (ID,MSG) values (760,'rad: refresh');
Insert into LOG_V (ID,MSG) values (759,'rad: last_updated +5: 09:42:11, SYSDATE: 09:37:28');
Insert into LOG_V (ID,MSG) values (758,'rad: refresh');
Insert into LOG_V (ID,MSG) values (757,'rad: last_updated +5: 09:32:51, SYSDATE: 09:37:03');
Insert into LOG_V (ID,MSG) values (756,'rad: last_updated +5: 09:32:51, SYSDATE: 09:30:41');
Insert into LOG_V (ID,MSG) values (755,'rad: last_updated +5: 09:32:51, SYSDATE: 09:30:24');
Insert into LOG_V (ID,MSG) values (754,'rad: last_updated +5: 09:32:51, SYSDATE: 09:28:48');
Insert into LOG_V (ID,MSG) values (753,'rad: last_updated +5: 09:32:51, SYSDATE: 09:28:23');
Insert into LOG_V (ID,MSG) values (752,'522,SHUTDOWN');
Insert into LOG_V (ID,MSG) values (751,'rad: last_updated +5: 09:32:51, SYSDATE: 09:28:17');
Insert into LOG_V (ID,MSG) values (750,'rad: refresh');
Insert into LOG_V (ID,MSG) values (749,'rad: last_updated +5: 09:27:34, SYSDATE: 09:27:40');
Insert into LOG_V (ID,MSG) values (748,'rad: last_updated +5: 09:27:34, SYSDATE: 09:26:42');
Insert into LOG_V (ID,MSG) values (747,'p1: x_status: Successfully submitted STARTUP operation on service instance. Request id - 621.');
Insert into LOG_V (ID,MSG) values (746,'522,STARTUP');
Insert into LOG_V (ID,MSG) values (745,'rad: last_updated +5: 09:27:34, SYSDATE: 09:26:36');
Insert into LOG_V (ID,MSG) values (744,'p1: x_status: Invalid operation specified.
');
Insert into LOG_V (ID,MSG) values (743,'522,');
Insert into LOG_V (ID,MSG) values (742,'rad: last_updated +5: 09:27:34, SYSDATE: 09:25:00');
Insert into LOG_V (ID,MSG) values (741,'p1: x_status: Invalid operation specified.
');
Insert into LOG_V (ID,MSG) values (740,'522,');
Insert into LOG_V (ID,MSG) values (739,'rad: refresh');
Insert into LOG_V (ID,MSG) values (738,'rad: last_updated +5: 09:21:47, SYSDATE: 09:22:27');
Insert into LOG_V (ID,MSG) values (737,'p1: x_status: Invalid operation specified.
');
Insert into LOG_V (ID,MSG) values (736,'522,');
Insert into LOG_V (ID,MSG) values (735,'rad: last_updated +5: 09:21:47, SYSDATE: 09:21:21');
Insert into LOG_V (ID,MSG) values (734,'p1: x_status: Invalid operation specified.
');
Insert into LOG_V (ID,MSG) values (733,'522,');
Insert into LOG_V (ID,MSG) values (732,'rad: last_updated +5: 09:21:47, SYSDATE: 09:19:17');
Insert into LOG_V (ID,MSG) values (731,'p1: x_status: Invalid operation specified.
');
Insert into LOG_V (ID,MSG) values (730,'522,');
Insert into LOG_V (ID,MSG) values (729,'rad: refresh');
Insert into LOG_V (ID,MSG) values (728,'rad: last_updated +5: 09:15:58, SYSDATE: 09:16:40');
Insert into LOG_V (ID,MSG) values (727,'p1: x_status: Invalid operation specified.
');
Insert into LOG_V (ID,MSG) values (726,'522,');
Insert into LOG_V (ID,MSG) values (725,'rad: last_updated +5: 09:15:58, SYSDATE: 09:15:43');
Insert into LOG_V (ID,MSG) values (724,'rad: last_updated +5: 09:15:58, SYSDATE: 09:15:20');
Insert into LOG_V (ID,MSG) values (723,'522,');
Insert into LOG_V (ID,MSG) values (722,'522,');
Insert into LOG_V (ID,MSG) values (721,'rad: last_updated +5: 09:15:58, SYSDATE: 09:11:59');
Insert into LOG_V (ID,MSG) values (720,'522,');
Insert into LOG_V (ID,MSG) values (719,'rad: last_updated +5: 09:15:58, SYSDATE: 09:11:29');
Insert into LOG_V (ID,MSG) values (718,'P1 error: 522,STARTUP');
Insert into LOG_V (ID,MSG) values (717,'522,');
Insert into LOG_V (ID,MSG) values (716,'rad: refresh');
Insert into LOG_V (ID,MSG) values (715,'rad: last_updated +5: 09:10:37, SYSDATE: 09:10:51');
Insert into LOG_V (ID,MSG) values (714,'P1 error: 522,STARTUP');
Insert into LOG_V (ID,MSG) values (713,'522,');
Insert into LOG_V (ID,MSG) values (712,'rad: last_updated +5: 09:10:37, SYSDATE: 09:09:23');
Insert into LOG_V (ID,MSG) values (711,'rad: last_updated +5: 09:10:37, SYSDATE: 09:08:50');
Insert into LOG_V (ID,MSG) values (710,'P1 error: 522,STARTUP');
Insert into LOG_V (ID,MSG) values (709,'522,');
Insert into LOG_V (ID,MSG) values (708,'rad: last_updated +5: 09:10:37, SYSDATE: 09:08:46');
Insert into LOG_V (ID,MSG) values (707,'rad: last_updated +5: 09:10:37, SYSDATE: 09:07:03');
Insert into LOG_V (ID,MSG) values (706,'P1: 543,SHUTDOWN');
Insert into LOG_V (ID,MSG) values (705,'543,');
Insert into LOG_V (ID,MSG) values (704,'rad: refresh');
Insert into LOG_V (ID,MSG) values (703,'rad: last_updated +5: 08:55:30, SYSDATE: 09:05:30');
Insert into LOG_V (ID,MSG) values (702,'P1: 522,STARTUP');
Insert into LOG_V (ID,MSG) values (701,'522,');
Insert into LOG_V (ID,MSG) values (700,'rad: refresh');
Insert into LOG_V (ID,MSG) values (699,'rad: last_updated +5: 08:45:11, SYSDATE: 08:50:23');
Insert into LOG_V (ID,MSG) values (698,'P1 error: 522,STARTUP');
Insert into LOG_V (ID,MSG) values (697,'522,');
Insert into LOG_V (ID,MSG) values (696,'rad: refresh');
Insert into LOG_V (ID,MSG) values (695,'rad: last_updated +5: 08:10:32, SYSDATE: 08:40:04');
Insert into LOG_V (ID,MSG) values (694,'rad: last_updated +5: 08:29:29, SYSDATE: 08:28:12');
Insert into LOG_V (ID,MSG) values (693,'rad: refresh');
Insert into LOG_V (ID,MSG) values (692,'rad: last_updated +5: , SYSDATE: 08:24:22');
Insert into LOG_V (ID,MSG) values (691,'rad: refresh');
Insert into LOG_V (ID,MSG) values (690,'rad: last_updated +5: , SYSDATE: 08:22:01');
Insert into LOG_V (ID,MSG) values (689,'rad: last_updated +5: 08:10:32, SYSDATE: 08:08:15');
Insert into LOG_V (ID,MSG) values (688,'P1 error: 543,SHUTDOWN');
Insert into LOG_V (ID,MSG) values (687,'rad: last_updated +5: 08:10:32, SYSDATE: 08:06:48');
Insert into LOG_V (ID,MSG) values (686,'P1: 543,SHUTDOWN');
Insert into LOG_V (ID,MSG) values (685,'rad: last_updated +5: 08:10:32, SYSDATE: 08:05:51');
Insert into LOG_V (ID,MSG) values (684,'P1: 522,STARTUP');
Insert into LOG_V (ID,MSG) values (683,'rad: refresh');
Insert into LOG_V (ID,MSG) values (682,'rad: last_updated +5: , SYSDATE: 08:05:25');
Insert into LOG_V (ID,MSG) values (681,'rad: last_updated +5: 18:28:47, SYSDATE: 18:26:45');
Insert into LOG_V (ID,MSG) values (680,'P1: 522,STARTUP');
Insert into LOG_V (ID,MSG) values (679,'rad: refresh');
Insert into LOG_V (ID,MSG) values (678,'rad: last_updated +5: 18:17:11, SYSDATE: 18:23:39');
Insert into LOG_V (ID,MSG) values (677,'P1: 543,SHUTDOWN');
Insert into LOG_V (ID,MSG) values (676,'rad: refresh');
Insert into LOG_V (ID,MSG) values (675,'rad: last_updated +5: 18:10:38, SYSDATE: 18:12:04');
Insert into LOG_V (ID,MSG) values (674,'P1 error: 543,SHUTDOWN');
Insert into LOG_V (ID,MSG) values (673,'rad: last_updated +5: 18:10:38, SYSDATE: 18:09:19');
Insert into LOG_V (ID,MSG) values (672,'P1 error: 543,SHUTDOWN');
Insert into LOG_V (ID,MSG) values (671,'rad: last_updated +5: 18:10:38, SYSDATE: 18:09:14');
Insert into LOG_V (ID,MSG) values (670,'rad: last_updated +5: 18:10:38, SYSDATE: 18:08:04');
Insert into LOG_V (ID,MSG) values (669,'rad: last_updated +5: 18:10:38, SYSDATE: 18:07:43');
Insert into LOG_V (ID,MSG) values (668,'P1: 543,SHUTDOWN');
Insert into LOG_V (ID,MSG) values (667,'rad: last_updated +5: 18:10:38, SYSDATE: 18:07:39');
Insert into LOG_V (ID,MSG) values (666,'rad: last_updated +5: 18:10:38, SYSDATE: 18:05:42');
Insert into LOG_V (ID,MSG) values (665,'P1: ,SHUTDOWN');
Insert into LOG_V (ID,MSG) values (664,'rad: refresh');
Insert into LOG_V (ID,MSG) values (663,'rad: last_updated +5: 18:04:50, SYSDATE: 18:05:31');
Insert into LOG_V (ID,MSG) values (662,'rad: last_updated +5: 18:04:50, SYSDATE: 18:04:08');
Insert into LOG_V (ID,MSG) values (661,'P1: ,');
Insert into LOG_V (ID,MSG) values (660,'rad: last_updated +5: 18:04:50, SYSDATE: 18:04:04');
Insert into LOG_V (ID,MSG) values (659,'rad: refresh');
Insert into LOG_V (ID,MSG) values (658,'rad: last_updated +5: 17:58:53, SYSDATE: 17:59:42');
Insert into LOG_V (ID,MSG) values (657,'rad: last_updated +5: 17:58:53, SYSDATE: 17:57:40');
Insert into LOG_V (ID,MSG) values (656,'rad: refresh');
Insert into LOG_V (ID,MSG) values (655,'rad: last_updated +5: 17:53:16, SYSDATE: 17:57:06');
Insert into LOG_V (ID,MSG) values (654,'rad: last_updated +5: 17:58:53, SYSDATE: 17:54:32');
Insert into LOG_V (ID,MSG) values (653,'hello p1');
Insert into LOG_V (ID,MSG) values (652,'rad: last_updated +5: 17:58:53, SYSDATE: 17:54:27');
Insert into LOG_V (ID,MSG) values (651,'hello p1');
Insert into LOG_V (ID,MSG) values (650,'rad: last_updated +5: 17:58:53, SYSDATE: 17:54:24');
Insert into LOG_V (ID,MSG) values (649,'rad: last_updated +5: 17:58:53, SYSDATE: 17:54:01');
Insert into LOG_V (ID,MSG) values (648,'hello p1');
Insert into LOG_V (ID,MSG) values (647,'rad: last_updated +5: 17:58:53, SYSDATE: 17:53:56');
Insert into LOG_V (ID,MSG) values (646,'hello p1');
Insert into LOG_V (ID,MSG) values (645,'rad: refresh');
Insert into LOG_V (ID,MSG) values (644,'rad: last_updated +5: 17:53:31, SYSDATE: 17:53:46');
Insert into LOG_V (ID,MSG) values (643,'rad: last_updated +5: 17:53:31, SYSDATE: 17:53:29');
Insert into LOG_V (ID,MSG) values (642,'hello p1');
Insert into LOG_V (ID,MSG) values (641,'rad: last_updated +5: 17:53:31, SYSDATE: 17:53:25');
Insert into LOG_V (ID,MSG) values (640,'rad: last_updated +5: 17:53:31, SYSDATE: 17:52:47');
Insert into LOG_V (ID,MSG) values (639,'hello p1');
Insert into LOG_V (ID,MSG) values (638,'rad: last_updated +5: 17:53:31, SYSDATE: 17:52:43');
Insert into LOG_V (ID,MSG) values (637,'hello p1');
Insert into LOG_V (ID,MSG) values (636,'rad: last_updated +5: 17:53:31, SYSDATE: 17:52:40');
Insert into LOG_V (ID,MSG) values (635,'rad: last_updated +5: 17:53:31, SYSDATE: 17:52:10');
Insert into LOG_V (ID,MSG) values (634,'hello p1');
Insert into LOG_V (ID,MSG) values (633,'rad: last_updated +5: 17:53:31, SYSDATE: 17:52:06');
Insert into LOG_V (ID,MSG) values (632,'rad: last_updated +5: 17:53:16, SYSDATE: 17:51:01');
Insert into LOG_V (ID,MSG) values (631,'rad: last_updated +5: 17:53:31, SYSDATE: 17:50:55');
Insert into LOG_V (ID,MSG) values (630,'hello p1');
Insert into LOG_V (ID,MSG) values (629,'rad: last_updated +5: 17:53:31, SYSDATE: 17:50:45');
Insert into LOG_V (ID,MSG) values (628,'rad: last_updated +5: 17:53:16, SYSDATE: 17:49:32');
Insert into LOG_V (ID,MSG) values (627,'rad: last_updated +5: 17:53:31, SYSDATE: 17:49:27');
Insert into LOG_V (ID,MSG) values (626,'rad: last_updated +5: 17:53:31, SYSDATE: 17:49:24');
Insert into LOG_V (ID,MSG) values (625,'rad: last_updated +5: 17:53:16, SYSDATE: 17:49:15');
Insert into LOG_V (ID,MSG) values (624,'rad: last_updated +5: 17:53:31, SYSDATE: 17:48:50');
Insert into LOG_V (ID,MSG) values (623,'rad: last_updated +5: 17:53:31, SYSDATE: 17:48:43');
Insert into LOG_V (ID,MSG) values (622,'rad: last_updated +5: 17:53:31, SYSDATE: 17:48:34');
Insert into LOG_V (ID,MSG) values (621,'rad: refresh');
Insert into LOG_V (ID,MSG) values (620,'rad: last_updated +5: 17:47:59, SYSDATE: 17:48:24');
Insert into LOG_V (ID,MSG) values (619,'rad: refresh');
Insert into LOG_V (ID,MSG) values (618,'rad: last_updated +5: 17:31:52, SYSDATE: 17:48:09');
Insert into LOG_V (ID,MSG) values (617,'rad: last_updated +5: 17:47:59, SYSDATE: 17:46:50');
Insert into LOG_V (ID,MSG) values (616,'rad: last_updated +5: 17:47:59, SYSDATE: 17:46:46');
Insert into LOG_V (ID,MSG) values (615,'rad: last_updated +5: 17:47:59, SYSDATE: 17:45:50');
Insert into LOG_V (ID,MSG) values (614,'rad: last_updated +5: 17:47:59, SYSDATE: 17:45:47');
Insert into LOG_V (ID,MSG) values (613,'rad: last_updated +5: 17:47:59, SYSDATE: 17:45:22');
Insert into LOG_V (ID,MSG) values (612,'rad: last_updated +5: 17:47:59, SYSDATE: 17:45:18');
Insert into LOG_V (ID,MSG) values (611,'rad: last_updated +5: 17:47:59, SYSDATE: 17:43:17');
Insert into LOG_V (ID,MSG) values (610,'rad: last_updated +5: 17:47:59, SYSDATE: 17:43:07');
Insert into LOG_V (ID,MSG) values (609,'rad: refresh');
Insert into LOG_V (ID,MSG) values (608,'rad: last_updated +5: 17:42:04, SYSDATE: 17:42:52');
Insert into LOG_V (ID,MSG) values (607,'rad: refresh');
Insert into LOG_V (ID,MSG) values (606,'rad: last_updated +5: 17:17:15, SYSDATE: 17:36:56');
Insert into LOG_V (ID,MSG) values (605,'rad: refresh');
Insert into LOG_V (ID,MSG) values (604,'rad: last_updated +5: , SYSDATE: 17:26:45');
Insert into LOG_V (ID,MSG) values (603,'rad: refresh');
Insert into LOG_V (ID,MSG) values (602,'rad: last_updated +5: 17:03:04, SYSDATE: 17:12:08');
Insert into LOG_V (ID,MSG) values (601,'rad: refresh');
Insert into LOG_V (ID,MSG) values (600,'rad: last_updated +5: 16:53:09, SYSDATE: 16:57:57');
Insert into LOG_V (ID,MSG) values (599,'rad: last_updated +5: 16:53:09, SYSDATE: 16:50:32');
Insert into LOG_V (ID,MSG) values (598,'rad: last_updated +5: 16:53:09, SYSDATE: 16:50:19');
Insert into LOG_V (ID,MSG) values (597,'P2 create database l_clob: {
  "messages" : 
  [
      {
        "date" : "2015-10-21T21:27:15+0000" ,
        "text" : "\nError creating the Self Service Request." ,
        "hint" : "\nError creating the Self Service Request." ,
        "stack_messages" : 
        [
          "\nError creating the Self Service Request." ,
          "\nError creating the Self Service Request." ,
          "\nThe Database SID: \"cmr\" is not available.\n Please enter a different Database SID.\n. "
        ]
      }
  ]
}

');
Insert into LOG_V (ID,MSG) values (596,'P2 create database l_clob: {
  "messages" : 
  [
      {
        "date" : "2015-10-21T21:26:52+0000" ,
        "text" : "\nError creating the Self Service Request." ,
        "hint" : "\nError creating the Self Service Request." ,
        "stack_messages" : 
        [
          "\nError creating the Self Service Request." ,
          "\nError creating the Self Service Request." ,
          "\nThe Database SID: \"cmr\" is not available.\n Please enter a different Database SID.\n. "
        ]
      }
  ]
}

');
Insert into LOG_V (ID,MSG) values (595,'rad: refresh');
Insert into LOG_V (ID,MSG) values (594,'rad: last_updated +5: 16:30:19, SYSDATE: 16:48:01');
Insert into LOG_V (ID,MSG) values (593,'rad: last_updated +5: 16:30:19, SYSDATE: 16:28:07');
Insert into LOG_V (ID,MSG) values (592,'rad: last_updated +5: 16:30:19, SYSDATE: 16:27:38');
Insert into LOG_V (ID,MSG) values (591,'rad: last_updated +5: 16:30:19, SYSDATE: 16:26:41');
Insert into LOG_V (ID,MSG) values (590,'rad: last_updated +5: 16:30:19, SYSDATE: 16:25:59');
Insert into LOG_V (ID,MSG) values (589,'rad: last_updated +5: 16:30:19, SYSDATE: 16:25:53');
Insert into LOG_V (ID,MSG) values (588,'rad: refresh');
Insert into LOG_V (ID,MSG) values (587,'rad: last_updated +5: 16:17:34, SYSDATE: 16:25:12');
Insert into LOG_V (ID,MSG) values (586,'rad: last_updated +5: 16:17:34, SYSDATE: 16:15:58');
Insert into LOG_V (ID,MSG) values (585,'rad: refresh');
Insert into LOG_V (ID,MSG) values (584,'rad: last_updated +5: 16:05:10, SYSDATE: 16:12:27');
Insert into LOG_V (ID,MSG) values (583,'rad: last_updated +5: 16:05:10, SYSDATE: 16:01:26');
Insert into LOG_V (ID,MSG) values (582,'rad: last_updated +5: 16:05:10, SYSDATE: 16:01:03');
Insert into LOG_V (ID,MSG) values (581,'rad: last_updated +5: 16:05:10, SYSDATE: 16:00:31');
Insert into LOG_V (ID,MSG) values (580,'rad: refresh');
Insert into LOG_V (ID,MSG) values (579,'rad: last_updated +5: 15:59:07, SYSDATE: 16:00:03');
Insert into LOG_V (ID,MSG) values (578,'rad: last_updated +5: 15:59:07, SYSDATE: 15:56:25');
Insert into LOG_V (ID,MSG) values (577,'rad: refresh');
Insert into LOG_V (ID,MSG) values (576,'rad: last_updated +5: 15:52:56, SYSDATE: 15:54:00');
Insert into LOG_V (ID,MSG) values (575,'rad: last_updated +5: 15:52:56, SYSDATE: 15:50:48');
Insert into LOG_V (ID,MSG) values (574,'rad: last_updated +5: 15:52:56, SYSDATE: 15:48:19');
Insert into LOG_V (ID,MSG) values (573,'rad: refresh');
Insert into LOG_V (ID,MSG) values (572,'rad: last_updated +5: 15:46:50, SYSDATE: 15:47:47');
Insert into LOG_V (ID,MSG) values (571,'rad: last_updated +5: 15:46:50, SYSDATE: 15:42:41');
Insert into LOG_V (ID,MSG) values (570,'rad: last_updated +5: 15:46:50, SYSDATE: 15:42:08');
Insert into LOG_V (ID,MSG) values (569,'rad: refresh');
Insert into LOG_V (ID,MSG) values (568,'rad: last_updated +5: 15:41:10, SYSDATE: 15:41:43');
Insert into LOG_V (ID,MSG) values (567,'rad: last_updated +5: 15:41:10, SYSDATE: 15:40:33');
Insert into LOG_V (ID,MSG) values (566,'rad: last_updated +5: 15:41:10, SYSDATE: 15:39:57');
Insert into LOG_V (ID,MSG) values (565,'rad: last_updated +5: 15:41:10, SYSDATE: 15:38:34');
Insert into LOG_V (ID,MSG) values (564,'rad: last_updated +5: 15:41:10, SYSDATE: 15:37:46');
Insert into LOG_V (ID,MSG) values (563,'rad: refresh');
Insert into LOG_V (ID,MSG) values (562,'rad: last_updated +5: 15:26:53, SYSDATE: 15:36:03');
Insert into LOG_V (ID,MSG) values (561,'rad: last_updated +5: 15:26:53, SYSDATE: 15:23:50');
Insert into LOG_V (ID,MSG) values (560,'rad: refresh');
Insert into LOG_V (ID,MSG) values (559,'rad: last_updated +5: 15:20:39, SYSDATE: 15:21:46');
Insert into LOG_V (ID,MSG) values (558,'rad: last_updated +5: 15:20:39, SYSDATE: 15:16:48');
Insert into LOG_V (ID,MSG) values (557,'rad: refresh');
Insert into LOG_V (ID,MSG) values (556,'rad: last_updated +5: , SYSDATE: 15:15:33');
Insert into LOG_V (ID,MSG) values (555,'rad: last_updated +5: 13:26:30, SYSDATE: 13:24:10');
Insert into LOG_V (ID,MSG) values (554,'rad: last_updated +5: 13:26:30, SYSDATE: 13:22:11');
Insert into LOG_V (ID,MSG) values (553,'rad: refresh');
Insert into LOG_V (ID,MSG) values (552,'rad: last_updated +5: 13:19:56, SYSDATE: 13:21:21');
Insert into LOG_V (ID,MSG) values (551,'rad: last_updated +5: 13:19:56, SYSDATE: 13:17:11');
Insert into LOG_V (ID,MSG) values (550,'rad: last_updated +5: 13:19:56, SYSDATE: 13:16:49');
Insert into LOG_V (ID,MSG) values (549,'rad: refresh');
Insert into LOG_V (ID,MSG) values (548,'rad: last_updated +5: , SYSDATE: 13:14:46');
Insert into LOG_V (ID,MSG) values (547,'rad: refresh');
Insert into LOG_V (ID,MSG) values (546,'rad: last_updated +5: , SYSDATE: 11:47:46');
Insert into LOG_V (ID,MSG) values (545,'rad: refresh');
Insert into LOG_V (ID,MSG) values (544,'rad: last_updated +5: , SYSDATE: 10:33:37');
Insert into LOG_V (ID,MSG) values (543,'rad: last_updated +5: 07:40:07, SYSDATE: 07:35:38');
Insert into LOG_V (ID,MSG) values (542,'rad: refresh');
Insert into LOG_V (ID,MSG) values (541,'rad: last_updated +5: , SYSDATE: 07:34:57');
Insert into LOG_V (ID,MSG) values (539,'rad: refresh');
Insert into LOG_V (ID,MSG) values (538,'rad: last_updated +5: , SYSDATE: 17:13:07');
Insert into LOG_V (ID,MSG) values (537,'rad: refresh');
Insert into LOG_V (ID,MSG) values (536,'rad: last_updated +5: , SYSDATE: 15:39:09');
Insert into LOG_V (ID,MSG) values (535,'rad: last_updated +5: 12:50:25, SYSDATE: 12:46:59');
Insert into LOG_V (ID,MSG) values (534,'rad: refresh');
Insert into LOG_V (ID,MSG) values (533,'rad: last_updated +5: 12:44:51, SYSDATE: 12:45:03');
Insert into LOG_V (ID,MSG) values (532,'rad: refresh');
Insert into LOG_V (ID,MSG) values (531,'rad: last_updated +5: 12:44:51, SYSDATE: 12:45:00');
Insert into LOG_V (ID,MSG) values (530,'rad: last_updated +5: 12:44:51, SYSDATE: 12:44:24');
Insert into LOG_V (ID,MSG) values (529,'rad: last_updated +5: 12:44:51, SYSDATE: 12:41:42');
Insert into LOG_V (ID,MSG) values (528,'rad: refresh');
Insert into LOG_V (ID,MSG) values (527,'rad: last_updated +5: 12:08:10, SYSDATE: 12:39:36');
Insert into LOG_V (ID,MSG) values (526,'rad: refresh');
Insert into LOG_V (ID,MSG) values (525,'rad: last_updated +5: , SYSDATE: 12:02:57');
Insert into LOG_V (ID,MSG) values (524,'rad: last_updated +5: 11:39:26, SYSDATE: 11:36:24');
Insert into LOG_V (ID,MSG) values (523,'rad: last_updated +5: 11:39:26, SYSDATE: 11:35:52');
Insert into LOG_V (ID,MSG) values (522,'rad: refresh');
Insert into LOG_V (ID,MSG) values (521,'rad: last_updated +5: , SYSDATE: 11:34:16');
Insert into LOG_V (ID,MSG) values (520,'rad: last_updated +5: 11:32:13, SYSDATE: 11:28:16');
Insert into LOG_V (ID,MSG) values (519,'rad: last_updated +5: 11:32:13, SYSDATE: 11:27:36');
Insert into LOG_V (ID,MSG) values (518,'rad: refresh');
Insert into LOG_V (ID,MSG) values (517,'rad: last_updated +5: , SYSDATE: 11:27:03');
Insert into LOG_V (ID,MSG) values (516,'rad: refresh');
Insert into LOG_V (ID,MSG) values (515,'rad: last_updated +5: , SYSDATE: 10:36:17');
Insert into LOG_V (ID,MSG) values (514,'rad: refresh');
Insert into LOG_V (ID,MSG) values (513,'rad: last_updated +5: , SYSDATE: 09:29:13');
Insert into LOG_V (ID,MSG) values (512,'rad: refresh');
Insert into LOG_V (ID,MSG) values (511,'rad: last_updated +5: 07:22:56, SYSDATE: 07:23:37');
Insert into LOG_V (ID,MSG) values (510,'rad: refresh');
Insert into LOG_V (ID,MSG) values (509,'rad: last_updated +5: 07:11:42, SYSDATE: 07:17:48');
Insert into LOG_V (ID,MSG) values (508,'rad: refresh');
Insert into LOG_V (ID,MSG) values (507,'rad: last_updated +5: 07:05:16, SYSDATE: 07:06:34');
Insert into LOG_V (ID,MSG) values (506,'rad: last_updated +5: 07:05:16, SYSDATE: 07:04:47');
Insert into LOG_V (ID,MSG) values (505,'P2 create database l_clob: {
  "messages" : 
  [
      {
        "date" : "2015-10-20T11:40:26+0000" ,
        "text" : "\nError creating the Self Service Request." ,
        "hint" : "\nError creating the Self Service Request." ,
        "stack_messages" : 
        [
          "\nError creating the Self Service Request." ,
          "\nError creating the Self Service Request." ,
          "\nThe Database SID: \"blc\" is not available.\n Please enter a different Database SID.\n. "
        ]
      }
  ]
}

');
Insert into LOG_V (ID,MSG) values (504,'rad: last_updated +5: 07:05:16, SYSDATE: 07:01:21');
Insert into LOG_V (ID,MSG) values (503,'rad: refresh');
Insert into LOG_V (ID,MSG) values (502,'rad: last_updated +5: , SYSDATE: 07:00:08');
Insert into LOG_V (ID,MSG) values (501,'rad: refresh');
Insert into LOG_V (ID,MSG) values (500,'rad: last_updated +5: 21:36:01, SYSDATE: 21:37:24');
Insert into LOG_V (ID,MSG) values (499,'rad: last_updated +5: 21:36:01, SYSDATE: 21:35:40');
Insert into LOG_V (ID,MSG) values (498,'rad: last_updated +5: 21:36:01, SYSDATE: 21:34:06');
Insert into LOG_V (ID,MSG) values (497,'rad: refresh');
Insert into LOG_V (ID,MSG) values (496,'rad: last_updated +5: 21:14:24, SYSDATE: 21:30:55');
Insert into LOG_V (ID,MSG) values (495,'rad: last_updated +5: 21:14:24, SYSDATE: 21:13:15');
Insert into LOG_V (ID,MSG) values (494,'rad: last_updated +5: 21:14:24, SYSDATE: 21:13:03');
Insert into LOG_V (ID,MSG) values (493,'rad: last_updated +5: 21:14:24, SYSDATE: 21:10:26');
Insert into LOG_V (ID,MSG) values (492,'rad: refresh');
Insert into LOG_V (ID,MSG) values (491,'rad: last_updated +5: 21:02:38, SYSDATE: 21:09:19');
Insert into LOG_V (ID,MSG) values (490,'rad: refresh');
Insert into LOG_V (ID,MSG) values (489,'rad: last_updated +5: , SYSDATE: 20:57:33');
Insert into LOG_V (ID,MSG) values (488,'rad: refresh');
Insert into LOG_V (ID,MSG) values (487,'rad: last_updated +5: 19:05:42, SYSDATE: 20:49:03');
Insert into LOG_V (ID,MSG) values (486,'rad: refresh');
Insert into LOG_V (ID,MSG) values (485,'rad: last_updated +5: 18:36:39, SYSDATE: 19:00:36');
Insert into LOG_V (ID,MSG) values (484,'rad: last_updated +5: 18:56:09, SYSDATE: 18:52:07');
Insert into LOG_V (ID,MSG) values (483,'rad: refresh');
Insert into LOG_V (ID,MSG) values (482,'rad: last_updated +5: 18:50:53, SYSDATE: 18:51:04');
Insert into LOG_V (ID,MSG) values (481,'rad: last_updated +5: 18:50:53, SYSDATE: 18:49:06');
Insert into LOG_V (ID,MSG) values (480,'rad: refresh');
Insert into LOG_V (ID,MSG) values (479,'rad: last_updated +5: , SYSDATE: 18:45:48');
Insert into LOG_V (ID,MSG) values (478,'rad: refresh');
Insert into LOG_V (ID,MSG) values (477,'rad: last_updated +5: , SYSDATE: 18:31:33');
Insert into LOG_V (ID,MSG) values (476,'rad: refresh');
Insert into LOG_V (ID,MSG) values (475,'rad: last_updated +5: , SYSDATE: 17:54:33');
Insert into LOG_V (ID,MSG) values (474,'rad: last_updated +5: 17:52:30, SYSDATE: 17:49:03');
Insert into LOG_V (ID,MSG) values (473,'rad: last_updated +5: 17:52:30, SYSDATE: 17:48:35');
Insert into LOG_V (ID,MSG) values (472,'rad: last_updated +5: 17:52:30, SYSDATE: 17:48:23');
Insert into LOG_V (ID,MSG) values (471,'rad: last_updated +5: 17:52:30, SYSDATE: 17:48:06');
Insert into LOG_V (ID,MSG) values (470,'rad: refresh');
Insert into LOG_V (ID,MSG) values (469,'rad: last_updated +5: , SYSDATE: 17:47:25');
Insert into LOG_V (ID,MSG) values (468,'rad: last_updated +5: 16:51:52, SYSDATE: 16:48:05');
Insert into LOG_V (ID,MSG) values (467,'rad: refresh');
Insert into LOG_V (ID,MSG) values (466,'rad: last_updated +5: 16:36:41, SYSDATE: 16:46:46');
Insert into LOG_V (ID,MSG) values (465,'rad: last_updated +5: 16:36:41, SYSDATE: 16:36:16');
Insert into LOG_V (ID,MSG) values (464,'rad: last_updated +5: 16:36:41, SYSDATE: 16:35:52');
Insert into LOG_V (ID,MSG) values (463,'rad: last_updated +5: 16:36:41, SYSDATE: 16:35:23');
Insert into LOG_V (ID,MSG) values (462,'rad: last_updated +5: 16:36:41, SYSDATE: 16:35:02');
Insert into LOG_V (ID,MSG) values (461,'rad: last_updated +5: 16:36:41, SYSDATE: 16:34:22');
Insert into LOG_V (ID,MSG) values (460,'rad: refresh');
Insert into LOG_V (ID,MSG) values (459,'rad: last_updated +5: 16:30:41, SYSDATE: 16:31:34');
Insert into LOG_V (ID,MSG) values (458,'rad: last_updated +5: 16:30:41, SYSDATE: 16:30:36');
Insert into LOG_V (ID,MSG) values (457,'rad: last_updated +5: 16:30:41, SYSDATE: 16:30:15');
Insert into LOG_V (ID,MSG) values (456,'rad: last_updated +5: 16:30:41, SYSDATE: 16:29:52');
Insert into LOG_V (ID,MSG) values (455,'rad: last_updated +5: 16:30:41, SYSDATE: 16:28:48');
Insert into LOG_V (ID,MSG) values (454,'rad: last_updated +5: 16:30:41, SYSDATE: 16:27:43');
Insert into LOG_V (ID,MSG) values (453,'rad: last_updated +5: 16:30:41, SYSDATE: 16:27:14');
Insert into LOG_V (ID,MSG) values (452,'rad: refresh');
Insert into LOG_V (ID,MSG) values (451,'rad: last_updated +5: 16:24:06, SYSDATE: 16:25:36');
Insert into LOG_V (ID,MSG) values (450,'rad: last_updated +5: 16:24:06, SYSDATE: 16:21:51');
Insert into LOG_V (ID,MSG) values (449,'rad: refresh');
Insert into LOG_V (ID,MSG) values (448,'rad: last_updated +5: , SYSDATE: 16:19:00');
Insert into LOG_V (ID,MSG) values (447,'rad: refresh');
Insert into LOG_V (ID,MSG) values (446,'rad: last_updated +5: , SYSDATE: 16:10:32');
Insert into LOG_V (ID,MSG) values (445,'rad: refresh');
Insert into LOG_V (ID,MSG) values (444,'rad: last_updated +5: , SYSDATE: 16:04:22');
Insert into LOG_V (ID,MSG) values (443,'rad: refresh');
Insert into LOG_V (ID,MSG) values (442,'rad: last_updated +5: , SYSDATE: 16:00:44');
Insert into LOG_V (ID,MSG) values (441,'rad: ORA-06503: PL/SQL: Function returned without value');
Insert into LOG_V (ID,MSG) values (440,'rad: refresh');
Insert into LOG_V (ID,MSG) values (439,'rad: last_updated +5: , SYSDATE: 15:58:24');
Insert into LOG_V (ID,MSG) values (438,'rad: ORA-06503: PL/SQL: Function returned without value');
Insert into LOG_V (ID,MSG) values (437,'rad: refresh');
Insert into LOG_V (ID,MSG) values (436,'rad: last_updated +5: , SYSDATE: 15:56:21');
Insert into LOG_V (ID,MSG) values (435,'P2 create database l_clob: {
  "messages" : 
  [
      {
        "date" : "2015-10-19T20:33:07+0000" ,
        "text" : "\nError creating the Self Service Request." ,
        "hint" : "\nError creating the Self Service Request." ,
        "stack_messages" : 
        [
          "\nError creating the Self Service Request." ,
          "\nError creating the Self Service Request." ,
          "\nThe Database SID: \"cmr5\" is not available.\n Please enter a different Database SID.\n. "
        ]
      }
  ]
}

');
Insert into LOG_V (ID,MSG) values (434,'rad: ORA-06503: PL/SQL: Function returned without value');
Insert into LOG_V (ID,MSG) values (433,'rad: refresh');
Insert into LOG_V (ID,MSG) values (432,'rad: last_updated +5: , SYSDATE: 15:55:29');
Insert into LOG_V (ID,MSG) values (431,'rad: ORA-06503: PL/SQL: Function returned without value');
Insert into LOG_V (ID,MSG) values (430,'rad: refresh');
Insert into LOG_V (ID,MSG) values (429,'rad: last_updated +5: 15:55:06, SYSDATE: 15:55:07');
Insert into LOG_V (ID,MSG) values (428,'rad: last_updated +5: 15:55:06, SYSDATE: 15:53:14');
Insert into LOG_V (ID,MSG) values (427,'rad: refresh');
Insert into LOG_V (ID,MSG) values (426,'rad: last_updated +5: 15:49:59, SYSDATE: 15:50:01');
Insert into LOG_V (ID,MSG) values (425,'rad: last_updated +5: 15:49:59, SYSDATE: 15:46:26');
Insert into LOG_V (ID,MSG) values (424,'rad: refresh');
Insert into LOG_V (ID,MSG) values (423,'rad: last_updated +5: , SYSDATE: 15:44:53');
Insert into LOG_V (ID,MSG) values (422,'rad: ORA-06503: PL/SQL: Function returned without value');
Insert into LOG_V (ID,MSG) values (421,'rad: refresh');
Insert into LOG_V (ID,MSG) values (420,'rad: last_updated +5: , SYSDATE: 15:42:23');
Insert into LOG_V (ID,MSG) values (419,'rad: ORA-06503: PL/SQL: Function returned without value');
Insert into LOG_V (ID,MSG) values (418,'rad: refresh');
Insert into LOG_V (ID,MSG) values (417,'rad: last_updated +5: , SYSDATE: 15:41:23');
Insert into LOG_V (ID,MSG) values (416,'rad: ORA-06503: PL/SQL: Function returned without value');
Insert into LOG_V (ID,MSG) values (415,'rad: refresh');
Insert into LOG_V (ID,MSG) values (414,'rad: last_updated +5: , SYSDATE: 15:41:08');
Insert into LOG_V (ID,MSG) values (413,'rad: ORA-06503: PL/SQL: Function returned without value');
Insert into LOG_V (ID,MSG) values (412,'rad: refresh');
Insert into LOG_V (ID,MSG) values (411,'rad: last_updated +5: , SYSDATE: 15:40:10');
Insert into LOG_V (ID,MSG) values (410,'rad: ORA-06503: PL/SQL: Function returned without value');
Insert into LOG_V (ID,MSG) values (409,'rad: refresh');
Insert into LOG_V (ID,MSG) values (408,'rad: last_updated +5: , SYSDATE: 15:39:39');
Insert into LOG_V (ID,MSG) values (407,'rad: ORA-06503: PL/SQL: Function returned without value');
Insert into LOG_V (ID,MSG) values (406,'rad: refresh');
Insert into LOG_V (ID,MSG) values (405,'rad: last_updated +5: , SYSDATE: 15:38:26');
Insert into LOG_V (ID,MSG) values (404,'rad: ORA-06503: PL/SQL: Function returned without value');
Insert into LOG_V (ID,MSG) values (403,'rad: refresh');
Insert into LOG_V (ID,MSG) values (402,'rad: last_updated +5: , SYSDATE: 15:38:23');
Insert into LOG_V (ID,MSG) values (401,'rad: ORA-06503: PL/SQL: Function returned without value');
Insert into LOG_V (ID,MSG) values (400,'rad: refresh');
Insert into LOG_V (ID,MSG) values (399,'rad: last_updated +5: , SYSDATE: 15:36:19');
Insert into LOG_V (ID,MSG) values (398,'rad: ORA-06503: PL/SQL: Function returned without value');
Insert into LOG_V (ID,MSG) values (397,'rad: refresh');
Insert into LOG_V (ID,MSG) values (396,'rad: last_updated +5: , SYSDATE: 15:36:13');
Insert into LOG_V (ID,MSG) values (395,'rad: ORA-06503: PL/SQL: Function returned without value');
Insert into LOG_V (ID,MSG) values (394,'rad: refresh');
Insert into LOG_V (ID,MSG) values (393,'rad: last_updated +5: , SYSDATE: 15:33:49');
Insert into LOG_V (ID,MSG) values (392,'rad: ORA-06503: PL/SQL: Function returned without value');
Insert into LOG_V (ID,MSG) values (391,'rad: refresh');
Insert into LOG_V (ID,MSG) values (390,'rad: last_updated +5: 15:21:01, SYSDATE: 15:33:36');
Insert into LOG_V (ID,MSG) values (389,'rad: refresh');
Insert into LOG_V (ID,MSG) values (388,'rad: last_updated +5: 15:32:53, SYSDATE: 15:32:59');
Insert into LOG_V (ID,MSG) values (387,'rad: last_updated +5: 15:32:53, SYSDATE: 15:32:51');
Insert into LOG_V (ID,MSG) values (386,'rad: last_updated +5: 15:32:53, SYSDATE: 15:32:16');
Insert into LOG_V (ID,MSG) values (385,'rad: last_updated +5: 15:32:53, SYSDATE: 15:31:49');
Insert into LOG_V (ID,MSG) values (384,'rad: last_updated +5: 15:32:53, SYSDATE: 15:31:44');
Insert into LOG_V (ID,MSG) values (383,'rad: last_updated +5: 15:32:31, SYSDATE: 15:31:06');
Insert into LOG_V (ID,MSG) values (382,'rad: last_updated +5: 15:32:53, SYSDATE: 15:29:18');
Insert into LOG_V (ID,MSG) values (381,'rad: last_updated +5: 15:32:31, SYSDATE: 15:28:18');
Insert into LOG_V (ID,MSG) values (380,'rad: refresh');
Insert into LOG_V (ID,MSG) values (379,'rad: last_updated +5: 14:47:20, SYSDATE: 15:27:45');
Insert into LOG_V (ID,MSG) values (378,'rad: refresh');
Insert into LOG_V (ID,MSG) values (377,'rad: last_updated +5: 14:46:58, SYSDATE: 15:27:20');
Insert into LOG_V (ID,MSG) values (376,'rad: last_updated +5: 15:21:01, SYSDATE: 15:18:08');
Insert into LOG_V (ID,MSG) values (375,'rad: last_updated +5: 15:21:01, SYSDATE: 15:17:34');
Insert into LOG_V (ID,MSG) values (374,'rad: refresh');
Insert into LOG_V (ID,MSG) values (373,'rad: last_updated +5: 15:13:59, SYSDATE: 15:15:53');
Insert into LOG_V (ID,MSG) values (372,'rad: last_updated +5: 15:13:59, SYSDATE: 15:12:26');
Insert into LOG_V (ID,MSG) values (371,'rad: last_updated +5: 15:13:59, SYSDATE: 15:10:51');
Insert into LOG_V (ID,MSG) values (370,'rad: refresh');
Insert into LOG_V (ID,MSG) values (369,'rad: last_updated +5: 15:06:16, SYSDATE: 15:08:52');
Insert into LOG_V (ID,MSG) values (368,'rad: refresh');
Insert into LOG_V (ID,MSG) values (367,'rad: last_updated +5: 14:58:55, SYSDATE: 15:01:08');
Insert into LOG_V (ID,MSG) values (366,'rad: last_updated +5: 14:58:55, SYSDATE: 14:56:20');
Insert into LOG_V (ID,MSG) values (365,'rad: last_updated +5: 14:58:55, SYSDATE: 14:54:45');
Insert into LOG_V (ID,MSG) values (364,'rad: refresh');
Insert into LOG_V (ID,MSG) values (363,'rad: last_updated +5: 14:50:18, SYSDATE: 14:53:48');
Insert into LOG_V (ID,MSG) values (362,'rad: last_updated +5: 14:50:18, SYSDATE: 14:49:01');
Insert into LOG_V (ID,MSG) values (361,'rad: refresh');
Insert into LOG_V (ID,MSG) values (360,'rad: last_updated +5: 14:21:45, SYSDATE: 14:45:11');
Insert into LOG_V (ID,MSG) values (359,'rad: refresh');
Insert into LOG_V (ID,MSG) values (358,'rad: last_updated +5: , SYSDATE: 14:42:13');
Insert into LOG_V (ID,MSG) values (357,'rad: refresh');
Insert into LOG_V (ID,MSG) values (356,'rad: last_updated +5: 14:40:59, SYSDATE: 14:41:50');
Insert into LOG_V (ID,MSG) values (355,'rad: refresh');
Insert into LOG_V (ID,MSG) values (354,'rad: last_updated +5: 14:24:30, SYSDATE: 14:35:50');
Insert into LOG_V (ID,MSG) values (353,'rad: last_updated +5: 14:24:34, SYSDATE: 14:20:03');
Insert into LOG_V (ID,MSG) values (352,'rad: refresh');
Insert into LOG_V (ID,MSG) values (351,'rad: last_updated +5: , SYSDATE: 14:19:26');
Insert into LOG_V (ID,MSG) values (350,'rad: refresh');
Insert into LOG_V (ID,MSG) values (349,'rad: last_updated +5: 14:17:41, SYSDATE: 14:19:19');
Insert into LOG_V (ID,MSG) values (348,'rad: refresh');
Insert into LOG_V (ID,MSG) values (347,'rad: last_updated +5: 14:17:41, SYSDATE: 14:19:15');
Insert into LOG_V (ID,MSG) values (346,'rad: refresh');
Insert into LOG_V (ID,MSG) values (345,'rad: last_updated +5: 14:16:34, SYSDATE: 14:16:37');
Insert into LOG_V (ID,MSG) values (344,'rad: refresh');
Insert into LOG_V (ID,MSG) values (343,'rad: last_updated +5: , SYSDATE: 14:12:33');
Insert into LOG_V (ID,MSG) values (342,'rad: refresh');
Insert into LOG_V (ID,MSG) values (341,'rad: last_updated +5: 13:24:41, SYSDATE: 14:12:23');
Insert into LOG_V (ID,MSG) values (340,'rad: refresh');
Insert into LOG_V (ID,MSG) values (339,'rad: last_updated +5: 13:48:38, SYSDATE: 14:11:25');
Insert into LOG_V (ID,MSG) values (338,'rad: refresh');
Insert into LOG_V (ID,MSG) values (337,'rad: last_updated +5: , SYSDATE: 13:43:34');
Insert into LOG_V (ID,MSG) values (336,'rad: refresh');
Insert into LOG_V (ID,MSG) values (335,'rad: last_updated +5: , SYSDATE: 13:29:51');
Insert into LOG_V (ID,MSG) values (334,'rad: refresh');
Insert into LOG_V (ID,MSG) values (333,'rad: last_updated +5: , SYSDATE: 13:29:12');
Insert into LOG_V (ID,MSG) values (332,'rad: refresh');
Insert into LOG_V (ID,MSG) values (331,'rad: last_updated +5: 12:55:52, SYSDATE: 13:24:40');
Insert into LOG_V (ID,MSG) values (330,'rad: last_updated +5: 13:24:41, SYSDATE: 13:22:04');
Insert into LOG_V (ID,MSG) values (329,'rad: refresh');
Insert into LOG_V (ID,MSG) values (328,'rad: last_updated +5: 13:07:32, SYSDATE: 13:19:37');
Insert into LOG_V (ID,MSG) values (327,'rad: refresh');
Insert into LOG_V (ID,MSG) values (326,'rad: last_updated +5: , SYSDATE: 13:02:27');
Insert into LOG_V (ID,MSG) values (325,'rad: last_updated +5: 12:55:52, SYSDATE: 12:51:18');
Insert into LOG_V (ID,MSG) values (324,'rad: last_updated +5: 12:55:52, SYSDATE: 12:51:16');
Insert into LOG_V (ID,MSG) values (323,'rad: refresh');
Insert into LOG_V (ID,MSG) values (322,'rad: last_updated +5: , SYSDATE: 12:50:47');
Insert into LOG_V (ID,MSG) values (321,'rad: refresh');
Insert into LOG_V (ID,MSG) values (320,'rad: last_updated +5: 11:12:27, SYSDATE: 11:29:10');
Insert into LOG_V (ID,MSG) values (319,'rad: refresh');
Insert into LOG_V (ID,MSG) values (318,'rad: last_updated +5: 11:12:27, SYSDATE: 11:29:09');
Insert into LOG_V (ID,MSG) values (317,'rad: last_updated +5: 11:20:15, SYSDATE: 11:16:54');
Insert into LOG_V (ID,MSG) values (316,'rad: last_updated +5: 11:20:15, SYSDATE: 11:15:18');
Insert into LOG_V (ID,MSG) values (315,'rad: refresh');
Insert into LOG_V (ID,MSG) values (314,'rad: last_updated +5: 10:20:31, SYSDATE: 11:15:10');
Insert into LOG_V (ID,MSG) values (313,'P2 create database l_clob: {
  "messages" : 
  [
      {
        "date" : "2015-10-19T15:45:24+0000" ,
        "text" : "\nError creating the Self Service Request." ,
        "hint" : "\nError creating the Self Service Request." ,
        "stack_messages" : 
        [
          "\nError creating the Self Service Request." ,
          "\nError creating the Self Service Request." ,
          "\nThe Database SID: \"cmr4\" is not available.\n Please enter a different Database SID.\n. "
        ]
      }
  ]
}

');
Insert into LOG_V (ID,MSG) values (312,'rad: last_updated +5: 11:12:27, SYSDATE: 11:07:58');
Insert into LOG_V (ID,MSG) values (311,'P2 create database l_clob: {
  "messages" : 
  [
      {
        "date" : "2015-10-19T15:44:56+0000" ,
        "text" : "\nError creating the Self Service Request." ,
        "hint" : "\nError creating the Self Service Request." ,
        "stack_messages" : 
        [
          "\nError creating the Self Service Request." ,
          "\nError creating the Self Service Request." ,
          "\nThe Database SID: \"cmr4\" is not available.\n Please enter a different Database SID.\n. "
        ]
      }
  ]
}

');
Insert into LOG_V (ID,MSG) values (310,'rad: refresh');
Insert into LOG_V (ID,MSG) values (309,'rad: last_updated +5: 11:00:35, SYSDATE: 11:07:22');
Insert into LOG_V (ID,MSG) values (308,'P2 create database l_clob: {
  "messages" : 
  [
      {
        "date" : "2015-10-19T15:42:48+0000" ,
        "text" : "\nError creating the Self Service Request." ,
        "hint" : "\nError creating the Self Service Request." ,
        "stack_messages" : 
        [
          "\nError creating the Self Service Request." ,
          "\nError creating the Self Service Request." ,
          "\nThe Database SID: \"cmr4\" is not available.\n Please enter a different Database SID.\n. "
        ]
      }
  ]
}

');
Insert into LOG_V (ID,MSG) values (307,'P2 create database l_clob: {
  "messages" : 
  [
      {
        "date" : "2015-10-19T15:37:53+0000" ,
        "text" : "\nError creating the Self Service Request." ,
        "hint" : "\nError creating the Self Service Request." ,
        "stack_messages" : 
        [
          "\nError creating the Self Service Request." ,
          "\nError creating the Self Service Request." ,
          "\nThe Database SID: \"cmr\" is not available.\n Please enter a different Database SID.\n. "
        ]
      }
  ]
}

');
Insert into LOG_V (ID,MSG) values (306,'rad: refresh');
Insert into LOG_V (ID,MSG) values (305,'rad: last_updated +5: 10:06:06, SYSDATE: 10:55:30');
Insert into LOG_V (ID,MSG) values (304,'rad: refresh');
Insert into LOG_V (ID,MSG) values (303,'rad: last_updated +5: 10:19:31, SYSDATE: 10:49:54');
Insert into LOG_V (ID,MSG) values (302,'rad: last_updated +5: 10:39:19, SYSDATE: 10:38:28');
Insert into LOG_V (ID,MSG) values (301,'rad: last_updated +5: 10:39:19, SYSDATE: 10:37:20');
Insert into LOG_V (ID,MSG) values (300,'rad: refresh');
Insert into LOG_V (ID,MSG) values (299,'rad: last_updated +5: 10:19:37, SYSDATE: 10:34:12');
Insert into LOG_V (ID,MSG) values (298,'rad: refresh');
Insert into LOG_V (ID,MSG) values (297,'rad: last_updated +5: , SYSDATE: 10:15:26');
Insert into LOG_V (ID,MSG) values (296,'rad: refresh');
Insert into LOG_V (ID,MSG) values (295,'rad: last_updated +5: , SYSDATE: 10:14:32');
Insert into LOG_V (ID,MSG) values (294,'rad: refresh');
Insert into LOG_V (ID,MSG) values (293,'rad: last_updated +5: , SYSDATE: 10:14:26');
Insert into LOG_V (ID,MSG) values (292,'rad: last_updated +5: 10:06:06, SYSDATE: 10:02:22');
Insert into LOG_V (ID,MSG) values (291,'rad: refresh');
Insert into LOG_V (ID,MSG) values (290,'rad: last_updated +5: , SYSDATE: 10:01:01');
Insert into LOG_V (ID,MSG) values (289,'rad: refresh');
Insert into LOG_V (ID,MSG) values (288,'rad: last_updated +5: , SYSDATE: 09:59:47');
Insert into LOG_V (ID,MSG) values (287,'rad: refresh');
Insert into LOG_V (ID,MSG) values (286,'rad: last_updated +5: , SYSDATE: 09:56:13');
Insert into LOG_V (ID,MSG) values (285,'rad: refresh');
Insert into LOG_V (ID,MSG) values (284,'rad: last_updated +5: , SYSDATE: 09:53:09');
Insert into LOG_V (ID,MSG) values (283,'rad: refresh');
Insert into LOG_V (ID,MSG) values (282,'rad: last_updated +5: , SYSDATE: 09:51:18');
Insert into LOG_V (ID,MSG) values (281,'rad: refresh');
Insert into LOG_V (ID,MSG) values (280,'rad: last_updated +5: , SYSDATE: 09:50:00');
Insert into LOG_V (ID,MSG) values (279,'rad: refresh');
Insert into LOG_V (ID,MSG) values (278,'rad: last_updated +5: , SYSDATE: 09:49:53');
Insert into LOG_V (ID,MSG) values (277,'rad: refresh');
Insert into LOG_V (ID,MSG) values (276,'rad: last_updated +5: , SYSDATE: 09:49:42');
Insert into LOG_V (ID,MSG) values (275,'rad: refresh');
Insert into LOG_V (ID,MSG) values (274,'rad: last_updated +5: , SYSDATE: 09:49:14');
Insert into LOG_V (ID,MSG) values (273,'rad: refresh');
Insert into LOG_V (ID,MSG) values (272,'rad: last_updated +5: , SYSDATE: 09:46:05');
Insert into LOG_V (ID,MSG) values (271,'rad: refresh');
Insert into LOG_V (ID,MSG) values (270,'rad: last_updated +5: , SYSDATE: 09:41:07');
Insert into LOG_V (ID,MSG) values (269,'rad: refresh');
Insert into LOG_V (ID,MSG) values (268,'rad: last_updated +5: , SYSDATE: 09:41:03');
Insert into LOG_V (ID,MSG) values (267,'P2 create database l_clob: {
  "messages" : 
  [
      {
        "date" : "2015-10-19T14:15:36+0000" ,
        "text" : "\nError creating the Self Service Request." ,
        "hint" : "\nError creating the Self Service Request." ,
        "stack_messages" : 
        [
          "\nError creating the Self Service Request." ,
          "\nError creating the Self Service Request." ,
          "\nThe Database SID: \"cmr3\" is not available.\n Please enter a different Database SID.\n. "
        ]
      }
  ]
}

');
Insert into LOG_V (ID,MSG) values (266,'P2 create database l_clob: {
  "messages" : 
  [
      {
        "date" : "2015-10-19T14:15:04+0000" ,
        "text" : "\nError creating the Self Service Request." ,
        "hint" : "\nError creating the Self Service Request." ,
        "stack_messages" : 
        [
          "\nError creating the Self Service Request." ,
          "\nError creating the Self Service Request." ,
          "\nThe Database SID: \"cmr2\" is not available.\n Please enter a different Database SID.\n. "
        ]
      }
  ]
}

');
Insert into LOG_V (ID,MSG) values (265,'rad: refresh');
Insert into LOG_V (ID,MSG) values (264,'rad: last_updated +5: , SYSDATE: 09:37:31');
Insert into LOG_V (ID,MSG) values (263,'rad: refresh');
Insert into LOG_V (ID,MSG) values (262,'rad: last_updated +5: , SYSDATE: 09:35:46');
Insert into LOG_V (ID,MSG) values (261,'rad: refresh');
Insert into LOG_V (ID,MSG) values (260,'rad: last_updated +5: , SYSDATE: 09:26:40');
Insert into LOG_V (ID,MSG) values (259,'rad: refresh');
Insert into LOG_V (ID,MSG) values (258,'rad: last_updated +5: , SYSDATE: 09:26:39');
Insert into LOG_V (ID,MSG) values (257,'rad: refresh');
Insert into LOG_V (ID,MSG) values (256,'rad: last_updated +5: , SYSDATE: 09:26:37');
Insert into LOG_V (ID,MSG) values (255,'rad: refresh');
Insert into LOG_V (ID,MSG) values (254,'rad: last_updated +5: , SYSDATE: 09:26:22');
Insert into LOG_V (ID,MSG) values (253,'P2 create database l_clob: {
  "messages" : 
  [
      {
        "date" : "2015-10-19T13:56:18+0000" ,
        "text" : "\nError creating the Self Service Request." ,
        "hint" : "\nError creating the Self Service Request." ,
        "stack_messages" : 
        [
          "\nError creating the Self Service Request." ,
          "\nError creating the Self Service Request." ,
          "\nThe Database SID: \"cmr\" is not available.\n Please enter a different Database SID.\n. "
        ]
      }
  ]
}

');
Insert into LOG_V (ID,MSG) values (252,'rad: refresh');
Insert into LOG_V (ID,MSG) values (251,'rad: last_updated +5: , SYSDATE: 09:18:15');
Insert into LOG_V (ID,MSG) values (250,'rad: refresh');
Insert into LOG_V (ID,MSG) values (249,'rad: last_updated +5: 09:10:51, SYSDATE: 09:16:28');
Insert into LOG_V (ID,MSG) values (248,'rad: refresh');
Insert into LOG_V (ID,MSG) values (247,'rad: last_updated +5: 09:11:07, SYSDATE: 09:15:51');
Insert into LOG_V (ID,MSG) values (246,'rad: last_updated +5: 09:11:07, SYSDATE: 09:10:20');
Insert into LOG_V (ID,MSG) values (245,'rad: last_updated +5: 09:11:07, SYSDATE: 09:10:11');
Insert into LOG_V (ID,MSG) values (244,'rad: last_updated +5: 09:11:07, SYSDATE: 09:10:02');
Insert into LOG_V (ID,MSG) values (243,'rad: last_updated +5: 09:11:07, SYSDATE: 09:07:57');
Insert into LOG_V (ID,MSG) values (242,'rad: last_updated +5: 09:11:07, SYSDATE: 09:06:27');
Insert into LOG_V (ID,MSG) values (241,'rad: refresh');
Insert into LOG_V (ID,MSG) values (240,'rad: last_updated +5: , SYSDATE: 09:06:00');
Insert into LOG_V (ID,MSG) values (239,'rad: refresh');
Insert into LOG_V (ID,MSG) values (238,'rad: last_updated +5: , SYSDATE: 09:05:44');
Insert into LOG_V (ID,MSG) values (237,'rad: ORA-06503: PL/SQL: Function returned without value');
Insert into LOG_V (ID,MSG) values (236,'rad: refresh');
Insert into LOG_V (ID,MSG) values (235,'rad: last_updated +5: , SYSDATE: 09:02:29');
Insert into LOG_V (ID,MSG) values (234,'rad: ORA-06503: PL/SQL: Function returned without value');
Insert into LOG_V (ID,MSG) values (233,'rad: refresh');
Insert into LOG_V (ID,MSG) values (232,'rad: last_updated +5: , SYSDATE: 09:00:42');
Insert into LOG_V (ID,MSG) values (231,'rad: ORA-06503: PL/SQL: Function returned without value');
Insert into LOG_V (ID,MSG) values (230,'rad: refresh');
Insert into LOG_V (ID,MSG) values (229,'rad: last_updated +5: 08:46:04, SYSDATE: 08:54:51');
Insert into LOG_V (ID,MSG) values (228,'rad: ORA-06503: PL/SQL: Function returned without value');
Insert into LOG_V (ID,MSG) values (227,'rad: refresh');
Insert into LOG_V (ID,MSG) values (226,'rad: last_updated +5: 08:53:08, SYSDATE: 08:54:36');
Insert into LOG_V (ID,MSG) values (225,'rad: last_updated +5: 08:53:08, SYSDATE: 08:51:58');
Insert into LOG_V (ID,MSG) values (224,'rad: last_updated +5: 08:53:08, SYSDATE: 08:50:40');
Insert into LOG_V (ID,MSG) values (223,'rad: last_updated +5: 08:53:08, SYSDATE: 08:49:32');
Insert into LOG_V (ID,MSG) values (222,'rad: last_updated +5: 08:53:08, SYSDATE: 08:48:58');
Insert into LOG_V (ID,MSG) values (221,'rad: last_updated +5: 08:53:08, SYSDATE: 08:48:32');
Insert into LOG_V (ID,MSG) values (220,'rad: last_updated +5: 08:53:08, SYSDATE: 08:48:21');
Insert into LOG_V (ID,MSG) values (219,'rad: refresh');
Insert into LOG_V (ID,MSG) values (218,'rad: last_updated +5: 08:35:30, SYSDATE: 08:47:54');
Insert into LOG_V (ID,MSG) values (217,'P2 create database l_clob: {
  "messages" : 
  [
      {
        "date" : "2015-10-19T13:21:00+0000" ,
        "text" : "\nError creating the Self Service Request." ,
        "hint" : "\nError creating the Self Service Request." ,
        "stack_messages" : 
        [
          "\nError creating the Self Service Request." ,
          "\nError creating the Self Service Request." ,
          "\nThe Database SID: \"cmr\" is not available.\n Please enter a different Database SID.\n. "
        ]
      }
  ]
}

');
Insert into LOG_V (ID,MSG) values (216,'rad: last_updated +5: 08:46:04, SYSDATE: 08:43:12');
Insert into LOG_V (ID,MSG) values (215,'rad: refresh');
Insert into LOG_V (ID,MSG) values (214,'rad: last_updated +5: 08:40:39, SYSDATE: 08:40:49');
Insert into LOG_V (ID,MSG) values (213,'rad: last_updated +5: 08:40:39, SYSDATE: 08:40:28');
Insert into LOG_V (ID,MSG) values (212,'rad: refresh');
Insert into LOG_V (ID,MSG) values (211,'rad: last_updated +5: , SYSDATE: 08:35:26');
Insert into LOG_V (ID,MSG) values (210,'rad: refresh');
Insert into LOG_V (ID,MSG) values (209,'rad: last_updated +5: , SYSDATE: 08:30:16');
Insert into LOG_V (ID,MSG) values (208,'rad: refresh');
Insert into LOG_V (ID,MSG) values (207,'rad: last_updated +5: , SYSDATE: 08:30:15');
Insert into LOG_V (ID,MSG) values (206,'rad: refresh');
Insert into LOG_V (ID,MSG) values (205,'rad: last_updated +5: 08:03:45, SYSDATE: 08:29:31');
Insert into LOG_V (ID,MSG) values (204,'rad: last_updated +5: 08:24:10, SYSDATE: 08:21:01');
Insert into LOG_V (ID,MSG) values (203,'rad: last_updated +5: 08:24:10, SYSDATE: 08:20:24');
Insert into LOG_V (ID,MSG) values (202,'rad: refresh');
Insert into LOG_V (ID,MSG) values (201,'rad: last_updated +5: , SYSDATE: 08:18:54');
Insert into LOG_V (ID,MSG) values (200,'rad: refresh');
Insert into LOG_V (ID,MSG) values (199,'rad: last_updated +5: , SYSDATE: 07:58:29');
Insert into LOG_V (ID,MSG) values (198,'rad: last_updated +5: 21:31:21, SYSDATE: 21:27:26');
Insert into LOG_V (ID,MSG) values (197,'rad: last_updated +5: 21:31:21, SYSDATE: 21:26:43');
Insert into LOG_V (ID,MSG) values (196,'rad: last_updated +5: 21:31:21, SYSDATE: 21:26:28');
Insert into LOG_V (ID,MSG) values (195,'rad: refresh');
Insert into LOG_V (ID,MSG) values (194,'rad: last_updated +5: 21:00:38, SYSDATE: 21:26:05');
Insert into LOG_V (ID,MSG) values (193,'rad: last_updated +5: 21:00:38, SYSDATE: 20:58:25');
Insert into LOG_V (ID,MSG) values (192,'rad: last_updated +5: 21:00:38, SYSDATE: 20:56:13');
Insert into LOG_V (ID,MSG) values (191,'rad: refresh');
Insert into LOG_V (ID,MSG) values (190,'rad: last_updated +5: , SYSDATE: 20:55:20');
Insert into LOG_V (ID,MSG) values (189,'rad: refresh');
Insert into LOG_V (ID,MSG) values (188,'rad: last_updated +5: 20:26:08, SYSDATE: 20:34:03');
Insert into LOG_V (ID,MSG) values (187,'rad: ORA-06503: PL/SQL: Function returned without value');
Insert into LOG_V (ID,MSG) values (186,'rad: ORA-06503: PL/SQL: Function returned without value');
Insert into LOG_V (ID,MSG) values (185,'rad: ORA-06503: PL/SQL: Function returned without value');
Insert into LOG_V (ID,MSG) values (184,'rad: ORA-06503: PL/SQL: Function returned without value');
Insert into LOG_V (ID,MSG) values (183,'rad: ORA-06503: PL/SQL: Function returned without value');
Insert into LOG_V (ID,MSG) values (182,'rad: ORA-06503: PL/SQL: Function returned without value');
Insert into LOG_V (ID,MSG) values (181,'rad: ORA-06503: PL/SQL: Function returned without value');
Insert into LOG_V (ID,MSG) values (180,'P2 create database l_clob: {
  "messages" : 
  [
      {
        "date" : "2015-10-19T00:03:42+0000" ,
        "text" : "\nError creating the Self Service Request." ,
        "hint" : "\nError creating the Self Service Request." ,
        "stack_messages" : 
        [
          "\nError creating the Self Service Request." ,
          "\nError creating the Self Service Request." ,
          "\nThe Database Service name cannot be the same as Database SID. Please enter a different Service Name. \n. "
        ]
      }
  ]
}

');
Insert into LOG_V (ID,MSG) values (179,'P2 create database l_clob: {
  "messages" : 
  [
      {
        "date" : "2015-10-19T00:03:23+0000" ,
        "text" : "\nError creating the Self Service Request." ,
        "hint" : "\nError creating the Self Service Request." ,
        "stack_messages" : 
        [
          "\nError creating the Self Service Request." ,
          "\nError creating the Self Service Request." ,
          "\nThe Database Service name cannot be the same as Database SID. Please enter a different Service Name. \n. "
        ]
      }
  ]
}

');
Insert into LOG_V (ID,MSG) values (178,'P2 create database l_clob: {
  "messages" : 
  [
      {
        "date" : "2015-10-19T00:03:06+0000" ,
        "text" : "\nError creating the Self Service Request." ,
        "hint" : "\nError creating the Self Service Request." ,
        "stack_messages" : 
        [
          "\nError creating the Self Service Request." ,
          "\nError creating the Self Service Request." ,
          "\nThe Database Service name cannot be the same as Database SID. Please enter a different Service Name. \n. "
        ]
      }
  ]
}

');
Insert into LOG_V (ID,MSG) values (177,'P2 create database l_clob: {
  "messages" : 
  [
      {
        "date" : "2015-10-19T00:02:40+0000" ,
        "text" : "\nError creating the Self Service Request." ,
        "hint" : "\nError creating the Self Service Request." ,
        "stack_messages" : 
        [
          "\nError creating the Self Service Request." ,
          "\nError creating the Self Service Request." ,
          "\nThe Database Service name cannot be the same as Database SID. Please enter a different Service Name. \n. "
        ]
      }
  ]
}

');
Insert into LOG_V (ID,MSG) values (176,'P2 create database l_clob: {
  "messages" : 
  [
      {
        "date" : "2015-10-18T23:54:14+0000" ,
        "text" : "\nError creating the Self Service Request." ,
        "hint" : "\nError creating the Self Service Request." ,
        "stack_messages" : 
        [
          "\nError creating the Self Service Request." ,
          "\nError creating the Self Service Request." ,
          "\nThe Database Service name cannot be the same as Database SID. Please enter a different Service Name. \n. "
        ]
      }
  ]
}

');
Insert into LOG_V (ID,MSG) values (175,'rad: last_updated +5: 18:41:12, SYSDATE: 18:37:34');
Insert into LOG_V (ID,MSG) values (174,'rad: refresh: ');
Insert into LOG_V (ID,MSG) values (173,'rad: last_updated +5: , SYSDATE: 18:35:52');
Insert into LOG_V (ID,MSG) values (172,'rad: last_updated +5: 17:17:11, SYSDATE: 17:13:46');
Insert into LOG_V (ID,MSG) values (171,'rad: last_updated +5: 17:17:11, SYSDATE: 17:13:37');
Insert into LOG_V (ID,MSG) values (170,'rad: last_updated +5: 17:17:11, SYSDATE: 17:12:39');
Insert into LOG_V (ID,MSG) values (169,'rad: refresh: ');
Insert into LOG_V (ID,MSG) values (168,'rad: last_updated +5: , SYSDATE: 17:11:54');
Insert into LOG_V (ID,MSG) values (167,'rad: last_updated +5: 16:24:08, SYSDATE: 16:21:09');
Insert into LOG_V (ID,MSG) values (166,'rad: last_updated +5: 16:24:08, SYSDATE: 16:20:32');
Insert into LOG_V (ID,MSG) values (165,'rad: refresh: ');
Insert into LOG_V (ID,MSG) values (164,'rad: last_updated +5: 15:06:40, SYSDATE: 16:18:54');
Insert into LOG_V (ID,MSG) values (163,'rad: last_updated +5: 15:51:59, SYSDATE: 15:47:38');
Insert into LOG_V (ID,MSG) values (162,'rad: refresh: ');
Insert into LOG_V (ID,MSG) values (161,'rad: last_updated +5: , SYSDATE: 15:46:46');
Insert into LOG_V (ID,MSG) values (160,'rad: last_updated +5: 15:06:40, SYSDATE: 15:01:47');
Insert into LOG_V (ID,MSG) values (159,'rad: refresh: ');
Insert into LOG_V (ID,MSG) values (158,'rad: last_updated +5: 14:53:26, SYSDATE: 15:01:24');
Insert into LOG_V (ID,MSG) values (157,'rad: last_updated +5: 14:53:26, SYSDATE: 14:48:38');
Insert into LOG_V (ID,MSG) values (156,'rad: refresh: ');
Insert into LOG_V (ID,MSG) values (155,'rad: last_updated +5: 14:34:36, SYSDATE: 14:48:10');
Insert into LOG_V (ID,MSG) values (154,'rad: last_updated +5: 14:34:36, SYSDATE: 14:34:33');
Insert into LOG_V (ID,MSG) values (153,'rad: refresh: ');
Insert into LOG_V (ID,MSG) values (152,'rad: last_updated +5: 14:27:30, SYSDATE: 14:29:21');
Insert into LOG_V (ID,MSG) values (151,'rad: last_updated +5: 14:27:30, SYSDATE: 14:27:23');
Insert into LOG_V (ID,MSG) values (150,'rad: last_updated +5: 14:27:30, SYSDATE: 14:26:40');
Insert into LOG_V (ID,MSG) values (149,'rad: last_updated +5: 14:27:17, SYSDATE: 14:22:21');
Insert into LOG_V (ID,MSG) values (148,'rad: refresh: ');
Insert into LOG_V (ID,MSG) values (147,'rad: last_updated +5: 14:16:25, SYSDATE: 14:22:16');
Insert into LOG_V (ID,MSG) values (146,'rad: refresh: ');
Insert into LOG_V (ID,MSG) values (145,'rad: last_updated +5: 14:16:25, SYSDATE: 14:22:03');
Insert into LOG_V (ID,MSG) values (144,'rad: refresh: ');
Insert into LOG_V (ID,MSG) values (143,'rad: last_updated +5: 14:14:38, SYSDATE: 14:16:55');
Insert into LOG_V (ID,MSG) values (142,'rad: last_updated +5: 14:16:25, SYSDATE: 14:15:53');
Insert into LOG_V (ID,MSG) values (141,'rad: last_updated +5: 14:14:38, SYSDATE: 14:13:14');
Insert into LOG_V (ID,MSG) values (140,'rad: last_updated +5: 14:14:38, SYSDATE: 14:13:05');
Insert into LOG_V (ID,MSG) values (139,'rad: last_updated +5: 14:16:25, SYSDATE: 14:11:45');
Insert into LOG_V (ID,MSG) values (138,'rad: refresh: ');
Insert into LOG_V (ID,MSG) values (137,'rad: last_updated +5: 14:10:33, SYSDATE: 14:11:11');
Insert into LOG_V (ID,MSG) values (136,'rad: last_updated +5: 14:14:38, SYSDATE: 14:10:38');
Insert into LOG_V (ID,MSG) values (135,'rad: refresh: ');
Insert into LOG_V (ID,MSG) values (134,'rad: last_updated +5: , SYSDATE: 14:09:25');
Insert into LOG_V (ID,MSG) values (133,'rad: refresh: ');
Insert into LOG_V (ID,MSG) values (132,'rad: last_updated +5: , SYSDATE: 14:05:20');
Insert into LOG_V (ID,MSG) values (131,'rad: refresh: ');
Insert into LOG_V (ID,MSG) values (130,'rad: last_updated +5: 13:13:40, SYSDATE: 13:13:55');
Insert into LOG_V (ID,MSG) values (129,'rad: last_updated +5: 13:13:40, SYSDATE: 13:09:38');
Insert into LOG_V (ID,MSG) values (128,'rad: last_updated +5: 13:13:40, SYSDATE: 13:08:44');
Insert into LOG_V (ID,MSG) values (127,'rad: refresh: ');
Insert into LOG_V (ID,MSG) values (126,'rad: last_updated +5: 13:07:02, SYSDATE: 13:08:26');
Insert into LOG_V (ID,MSG) values (125,'rad: last_updated +5: 13:07:02, SYSDATE: 13:06:03');
Insert into LOG_V (ID,MSG) values (124,'rad: last_updated +5: 13:07:02, SYSDATE: 13:05:33');
Insert into LOG_V (ID,MSG) values (123,'rad: last_updated +5: 13:07:02, SYSDATE: 13:05:07');
Insert into LOG_V (ID,MSG) values (122,'rad: refresh: ');
Insert into LOG_V (ID,MSG) values (121,'rad: last_updated +5: 12:34:20, SYSDATE: 13:01:48');
Insert into LOG_V (ID,MSG) values (120,'P2 create database l_clob: {
  "messages" : 
  [
      {
        "date" : "2015-10-18T17:31:48+0000" ,
        "text" : "\nError creating the Self Service Request." ,
        "hint" : "\nError creating the Self Service Request." ,
        "stack_messages" : 
        [
          "\nError creating the Self Service Request." ,
          "\nError creating the Self Service Request." ,
          "\nThe Database Service name cannot be the same as Database SID. Please enter a different Service Name. \n. "
        ]
      }
  ]
}

');
Insert into LOG_V (ID,MSG) values (119,'P2 create database l_clob: {
  "messages" : 
  [
      {
        "date" : "2015-10-18T17:30:51+0000" ,
        "text" : "\nError creating the Self Service Request." ,
        "hint" : "\nError creating the Self Service Request." ,
        "stack_messages" : 
        [
          "\nError creating the Self Service Request." ,
          "\nError creating the Self Service Request." ,
          "\nThe Database Service name cannot be the same as Database SID. Please enter a different Service Name. \n. "
        ]
      }
  ]
}

');
Insert into LOG_V (ID,MSG) values (118,'P2 create database l_clob: {
  "messages" : 
  [
      {
        "date" : "2015-10-18T17:11:28+0000" ,
        "text" : "\nError creating the Self Service Request." ,
        "hint" : "\nError creating the Self Service Request." ,
        "stack_messages" : 
        [
          "\nError creating the Self Service Request." ,
          "\nError creating the Self Service Request." ,
          "\nThe Database Service name cannot be the same as Database SID. Please enter a different Service Name. \n. "
        ]
      }
  ]
}

');
Insert into LOG_V (ID,MSG) values (117,'rad: last_updated +5: 12:34:20, SYSDATE: 12:30:17');
Insert into LOG_V (ID,MSG) values (116,'rad: refresh: ');
Insert into LOG_V (ID,MSG) values (115,'rad: last_updated +5: , SYSDATE: 12:29:07');
Insert into LOG_V (ID,MSG) values (114,'rad: last_updated +5: 11:07:17, SYSDATE: 11:02:53');
Insert into LOG_V (ID,MSG) values (113,'rad: refresh: ');
Insert into LOG_V (ID,MSG) values (112,'rad: last_updated +5: 11:00:55, SYSDATE: 11:02:03');
Insert into LOG_V (ID,MSG) values (111,'rad: refresh: ');
Insert into LOG_V (ID,MSG) values (110,'rad: last_updated +5: 10:54:55, SYSDATE: 10:55:41');
Insert into LOG_V (ID,MSG) values (109,'rad: last_updated +5: 10:54:55, SYSDATE: 10:53:49');
Insert into LOG_V (ID,MSG) values (108,'rad: refresh: ');
Insert into LOG_V (ID,MSG) values (107,'rad: last_updated +5: 10:48:33, SYSDATE: 10:49:42');
Insert into LOG_V (ID,MSG) values (106,'rad: last_updated +5: 10:48:33, SYSDATE: 10:46:30');
Insert into LOG_V (ID,MSG) values (105,'rad: last_updated +5: 10:48:33, SYSDATE: 10:46:25');
Insert into LOG_V (ID,MSG) values (104,'rad: refresh: ');
Insert into LOG_V (ID,MSG) values (103,'rad: last_updated +5: , SYSDATE: 10:43:20');
Insert into LOG_V (ID,MSG) values (102,'rad: refresh: ');
Insert into LOG_V (ID,MSG) values (101,'rad: last_updated +5: , SYSDATE: 10:37:04');
Insert into LOG_V (ID,MSG) values (100,'rad: last_updated +5: 10:34:26, SYSDATE: 10:30:34');
Insert into LOG_V (ID,MSG) values (99,'rad: refresh: ');
Insert into LOG_V (ID,MSG) values (98,'rad: last_updated +5: 10:21:20, SYSDATE: 10:29:10');
Insert into LOG_V (ID,MSG) values (97,'rad: last_updated +5: 10:21:20, SYSDATE: 10:17:05');
Insert into LOG_V (ID,MSG) values (96,'rad: last_updated +5: 10:21:20, SYSDATE: 10:16:55');
Insert into LOG_V (ID,MSG) values (95,'rad: last_updated +5: 10:21:20, SYSDATE: 10:16:42');
Insert into LOG_V (ID,MSG) values (94,'rad: refresh: ');
Insert into LOG_V (ID,MSG) values (93,'rad: last_updated +5: 10:14:42, SYSDATE: 10:16:06');
Insert into LOG_V (ID,MSG) values (92,'rad: last_updated +5: 10:14:42, SYSDATE: 10:11:52');
Insert into LOG_V (ID,MSG) values (91,'rad: last_updated +5: 10:14:42, SYSDATE: 10:11:41');
Insert into LOG_V (ID,MSG) values (90,'rad: last_updated +5: 10:14:42, SYSDATE: 10:11:24');
Insert into LOG_V (ID,MSG) values (89,'rad: last_updated +5: 10:14:42, SYSDATE: 10:11:07');
Insert into LOG_V (ID,MSG) values (88,'rad: refresh: ');
Insert into LOG_V (ID,MSG) values (87,'rad: last_updated +5: 10:09:03, SYSDATE: 10:09:28');
Insert into LOG_V (ID,MSG) values (86,'rad: refresh: ');
Insert into LOG_V (ID,MSG) values (85,'rad: last_updated +5: , SYSDATE: 10:03:50');
Insert into LOG_V (ID,MSG) values (84,'rad: refresh: ');
Insert into LOG_V (ID,MSG) values (83,'rad: last_updated +5: 08:08:19, SYSDATE: 08:10:55');
Insert into LOG_V (ID,MSG) values (82,'rad: last_updated +5: 08:08:19, SYSDATE: 08:04:28');
Insert into LOG_V (ID,MSG) values (81,'rad: last_updated +5: 08:08:19, SYSDATE: 08:03:42');
Insert into LOG_V (ID,MSG) values (80,'rad: refresh: ');
Insert into LOG_V (ID,MSG) values (79,'rad: last_updated +5: , SYSDATE: 08:03:06');
Insert into LOG_V (ID,MSG) values (78,'rad: last_updated +5: 08:02:58, SYSDATE: 08:00:37');
Insert into LOG_V (ID,MSG) values (77,'rad: last_updated +5: 08:02:58, SYSDATE: 07:59:02');
Insert into LOG_V (ID,MSG) values (76,'rad: last_updated +5: 08:02:58, SYSDATE: 07:58:52');
Insert into LOG_V (ID,MSG) values (75,'rad: last_updated +5: 08:02:58, SYSDATE: 07:58:15');
Insert into LOG_V (ID,MSG) values (74,'rad: refresh: ');
Insert into LOG_V (ID,MSG) values (73,'rad: last_updated +5: 07:55:13, SYSDATE: 07:57:33');
Insert into LOG_V (ID,MSG) values (72,'rad: refresh: ');
Insert into LOG_V (ID,MSG) values (71,'rad: last_updated +5: 07:55:13, SYSDATE: 07:57:31');
Insert into LOG_V (ID,MSG) values (70,'rad: last_updated +5: 07:55:13, SYSDATE: 07:52:16');
Insert into LOG_V (ID,MSG) values (69,'rad: last_updated +5: 07:55:13, SYSDATE: 07:51:52');
Insert into LOG_V (ID,MSG) values (68,'rad: last_updated +5: 07:55:13, SYSDATE: 07:51:36');
Insert into LOG_V (ID,MSG) values (67,'rad: last_updated +5: 07:55:13, SYSDATE: 07:51:23');
Insert into LOG_V (ID,MSG) values (66,'rad: last_updated +5: 07:55:13, SYSDATE: 07:50:47');
Insert into LOG_V (ID,MSG) values (65,'rad: refresh: ');
Insert into LOG_V (ID,MSG) values (64,'rad: last_updated +5: , SYSDATE: 07:49:59');
Insert into LOG_V (ID,MSG) values (63,'rad: last_updated +5: 22:00:50, SYSDATE: 21:56:18');
Insert into LOG_V (ID,MSG) values (62,'rad: refresh: ');
Insert into LOG_V (ID,MSG) values (61,'rad: last_updated +5: 21:54:41, SYSDATE: 21:55:36');
Insert into LOG_V (ID,MSG) values (60,'rad: last_updated +5: 21:54:41, SYSDATE: 21:53:52');
Insert into LOG_V (ID,MSG) values (59,'rad: last_updated +5: 21:54:41, SYSDATE: 21:52:37');
Insert into LOG_V (ID,MSG) values (58,'rad: last_updated +5: 21:54:41, SYSDATE: 21:49:55');
Insert into LOG_V (ID,MSG) values (57,'rad: refresh: ');
Insert into LOG_V (ID,MSG) values (56,'rad: last_updated +5: 21:49:14, SYSDATE: 21:49:28');
Insert into LOG_V (ID,MSG) values (55,'rad: last_updated +5: 21:49:14, SYSDATE: 21:48:44');
Insert into LOG_V (ID,MSG) values (54,'rad: last_updated: 21:44:14, SYSDATE: 21:52:48');
Insert into LOG_V (ID,MSG) values (53,'rad: last_updated: 21:44:14, SYSDATE: 21:51:49');
Insert into LOG_V (ID,MSG) values (52,'rad: last_updated: 21:44:14, SYSDATE: 21:49:32');
Insert into LOG_V (ID,MSG) values (51,'rad: refresh: ');
Insert into LOG_V (ID,MSG) values (50,'rad: last_updated: , SYSDATE: 21:48:58');
Insert into LOG_V (ID,MSG) values (49,'rad no refresh');
Insert into LOG_V (ID,MSG) values (48,'rad: last_updated: , SYSDATE: 21:48:01');
Insert into LOG_V (ID,MSG) values (47,'rad no refresh');
Insert into LOG_V (ID,MSG) values (46,'rad: last_updated: , SYSDATE: 21:17:34');
Insert into LOG_V (ID,MSG) values (45,'rad no refresh');
Insert into LOG_V (ID,MSG) values (44,'rad: last_updated: , SYSDATE: 21:17:12');
Insert into LOG_V (ID,MSG) values (43,'rad no refresh');
Insert into LOG_V (ID,MSG) values (42,'rad: last_updated: 17:36:23, SYSDATE: 19:42:30');
Insert into LOG_V (ID,MSG) values (41,'rad: last_updated: 17:36:23, SYSDATE: 19:41:05');
Insert into LOG_V (ID,MSG) values (40,'rad: last_updated: 17:36:23, SYSDATE: 19:35:37');
Insert into LOG_V (ID,MSG) values (39,'rad: last_updated: 17:36:23');
Insert into LOG_V (ID,MSG) values (38,'rad: last_updated: 17:36:23');
Insert into LOG_V (ID,MSG) values (37,'rad: last_updated16-OCT-2015');
Insert into LOG_V (ID,MSG) values (36,'rad: last_updated16-OCT-2015');
Insert into LOG_V (ID,MSG) values (35,'rad: ORA-01422: exact fetch returns more than requested number of rows');
Insert into LOG_V (ID,MSG) values (34,'rad: ORA-01422: exact fetch returns more than requested number of rows');
Insert into LOG_V (ID,MSG) values (33,'rad: ORA-01422: exact fetch returns more than requested number of rows');
Insert into LOG_V (ID,MSG) values (32,'rad: ORA-01422: exact fetch returns more than requested number of rows');
Insert into LOG_V (ID,MSG) values (31,'rad: ORA-01422: exact fetch returns more than requested number of rows');
Insert into LOG_V (ID,MSG) values (30,'rad: ORA-01422: exact fetch returns more than requested number of rows');
Insert into LOG_V (ID,MSG) values (29,'rad: ORA-01422: exact fetch returns more than requested number of rows');
Insert into LOG_V (ID,MSG) values (28,'rad: ORA-01422: exact fetch returns more than requested number of rows');
Insert into LOG_V (ID,MSG) values (27,'rad: ORA-01422: exact fetch returns more than requested number of rows');
Insert into LOG_V (ID,MSG) values (26,'rad: ORA-01422: exact fetch returns more than requested number of rows');
Insert into LOG_V (ID,MSG) values (25,'rad: ORA-01422: exact fetch returns more than requested number of rows');
Insert into LOG_V (ID,MSG) values (24,'rad: ORA-01422: exact fetch returns more than requested number of rows');
Insert into LOG_V (ID,MSG) values (23,'rad: ORA-01422: exact fetch returns more than requested number of rows');
Insert into LOG_V (ID,MSG) values (22,'rad: ORA-01422: exact fetch returns more than requested number of rows');
Insert into LOG_V (ID,MSG) values (21,'rad: ORA-01422: exact fetch returns more than requested number of rows');
Insert into LOG_V (ID,MSG) values (20,'rad: ORA-01422: exact fetch returns more than requested number of rows');
Insert into LOG_V (ID,MSG) values (19,'rad: ORA-01422: exact fetch returns more than requested number of rows');
Insert into LOG_V (ID,MSG) values (18,'rad: ORA-01422: exact fetch returns more than requested number of rows');
Insert into LOG_V (ID,MSG) values (17,'rad: ORA-01422: exact fetch returns more than requested number of rows');
Insert into LOG_V (ID,MSG) values (16,'rad: ORA-01422: exact fetch returns more than requested number of rows');
Insert into LOG_V (ID,MSG) values (15,'rad: ORA-01422: exact fetch returns more than requested number of rows');
Insert into LOG_V (ID,MSG) values (14,'rad: ORA-01422: exact fetch returns more than requested number of rows');
Insert into LOG_V (ID,MSG) values (13,'rad: ORA-01422: exact fetch returns more than requested number of rows');
Insert into LOG_V (ID,MSG) values (12,'rad: ORA-01422: exact fetch returns more than requested number of rows');
Insert into LOG_V (ID,MSG) values (11,'rad: ORA-01422: exact fetch returns more than requested number of rows');
Insert into LOG_V (ID,MSG) values (10,'rad: ORA-01422: exact fetch returns more than requested number of rows');
Insert into LOG_V (ID,MSG) values (9,'rad: ORA-01422: exact fetch returns more than requested number of rows');
Insert into LOG_V (ID,MSG) values (8,'rad: ORA-01422: exact fetch returns more than requested number of rows');
Insert into LOG_V (ID,MSG) values (7,'rad: ORA-01422: exact fetch returns more than requested number of rows');
Insert into LOG_V (ID,MSG) values (6,'rad: ORA-01422: exact fetch returns more than requested number of rows');
Insert into LOG_V (ID,MSG) values (5,'rad: ORA-01422: exact fetch returns more than requested number of rows');
Insert into LOG_V (ID,MSG) values (4,'rad: ORA-01422: exact fetch returns more than requested number of rows');
Insert into LOG_V (ID,MSG) values (3,'rad: ORA-01422: exact fetch returns more than requested number of rows');
Insert into LOG_V (ID,MSG) values (2,'rad: last_updated16-OCT-2015');
Insert into LOG_V (ID,MSG) values (1,'{
  "uri" : "/em/cloud/dbaas/dbplatforminstance/byrequest/401" ,
  "name" : "AEGTST2" ,
  "resource_state" :     {
      "state" : "INITIATED"
    } ,
  "media_type" : "application/oracle.com.cloud.common.DbPlatformInstance+json" ,
  "canonicalLink" : "/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/dbaas/dbplatforminstance/byrequest/401" ,
  "status" : "SCHEDULED"
}

');
Insert into LOG_V (ID,MSG) values (1,'rad: last_updated16-OCT-2015');
Insert into LOG_V (ID,MSG) values (1,'{
  "uri" : "/em/cloud/dbaas/dbplatforminstance/byrequest/422" ,
  "name" : "DBTest2" ,
  "resource_state" :     {
      "state" : "INITIATED"
    } ,
  "media_type" : "application/oracle.com.cloud.common.DbPlatformInstance+json" ,
  "canonicalLink" : "/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/dbaas/dbplatforminstance/byrequest/422" ,
  "status" : "SCHEDULED"
}

');
Insert into LOG_V (ID,MSG) values (1,'{
  "uri" : "/em/cloud/dbaas/dbplatforminstance/byrequest/443" ,
  "name" : "cmr1" ,
  "resource_state" :     {
      "state" : "INITIATED"
    } ,
  "media_type" : "application/oracle.com.cloud.common.DbPlatformInstance+json" ,
  "canonicalLink" : "/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/dbaas/dbplatforminstance/byrequest/443" ,
  "status" : "SCHEDULED"
}

');
Insert into LOG_V (ID,MSG) values (1,'{
  "messages" : 
  [
      {
        "date" : "2015-10-19T15:42:48+0000" ,
        "text" : "\nError creating the Self Service Request." ,
        "hint" : "\nError creating the Self Service Request." ,
        "stack_messages" : 
        [
          "\nError creating the Self Service Request." ,
          "\nError creating the Self Service Request." ,
          "\nThe Database SID: \"cmr4\" is not available.\n Please enter a different Database SID.\n. "
        ]
      }
  ]
}

');
Insert into LOG_V (ID,MSG) values (1,'{
  "messages" : 
  [
      {
        "date" : "2015-10-19T15:44:56+0000" ,
        "text" : "\nError creating the Self Service Request." ,
        "hint" : "\nError creating the Self Service Request." ,
        "stack_messages" : 
        [
          "\nError creating the Self Service Request." ,
          "\nError creating the Self Service Request." ,
          "\nThe Database SID: \"cmr4\" is not available.\n Please enter a different Database SID.\n. "
        ]
      }
  ]
}

');
Insert into LOG_V (ID,MSG) values (1,'{
  "uri" : "/em/cloud/dbaas/dbplatforminstance/byrequest/446" ,
  "name" : "cmr3" ,
  "resource_state" :     {
      "state" : "INITIATED"
    } ,
  "media_type" : "application/oracle.com.cloud.common.DbPlatformInstance+json" ,
  "canonicalLink" : "/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/dbaas/dbplatforminstance/byrequest/446" ,
  "status" : "SCHEDULED"
}

');
Insert into LOG_V (ID,MSG) values (1,'{
  "uri" : "/em/cloud/dbaas/dbplatforminstance/byrequest/561" ,
  "name" : "cmr7" ,
  "resource_state" :     {
      "state" : "INITIATED"
    } ,
  "media_type" : "application/oracle.com.cloud.common.DbPlatformInstance+json" ,
  "canonicalLink" : "/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/dbaas/dbplatforminstance/byrequest/561" ,
  "status" : "SCHEDULED"
}

');
Insert into LOG_V (ID,MSG) values (1,'{
  "uri" : "/em/cloud/dbaas/dbplatforminstance/byrequest/582" ,
  "name" : "cmr9" ,
  "resource_state" :     {
      "state" : "INITIATED"
    } ,
  "media_type" : "application/oracle.com.cloud.common.DbPlatformInstance+json" ,
  "canonicalLink" : "/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/dbaas/dbplatforminstance/byrequest/582" ,
  "status" : "SCHEDULED"
}

');
Insert into LOG_V (ID,MSG) values (1,'{
  "uri" : "/em/cloud/dbaas/dbplatforminstance/byrequest/543" ,
  "name" : "blc" ,
  "resource_state" :     {
      "state" : "INITIATED"
    } ,
  "media_type" : "application/oracle.com.cloud.common.DbPlatformInstance+json" ,
  "canonicalLink" : "/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/dbaas/dbplatforminstance/byrequest/543" ,
  "status" : "SCHEDULED"
}

');
Insert into LOG_V (ID,MSG) values (1,'{
  "uri" : "/em/cloud/dbaas/dbplatforminstance/byrequest/702" ,
  "name" : "Dannyb7" ,
  "resource_state" :     {
      "state" : "INITIATED"
    } ,
  "media_type" : "application/oracle.com.cloud.common.DbPlatformInstance+json" ,
  "canonicalLink" : "/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/dbaas/dbplatforminstance/byrequest/702" ,
  "status" : "SCHEDULED"
}

');
Insert into LOG_V (ID,MSG) values (1,'{
  "uri" : "/em/cloud/dbaas/dbplatforminstance/byrequest/741" ,
  "name" : "db11" ,
  "resource_state" :     {
      "state" : "INITIATED"
    } ,
  "media_type" : "application/oracle.com.cloud.common.DbPlatformInstance+json" ,
  "canonicalLink" : "/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/dbaas/dbplatforminstance/byrequest/741" ,
  "status" : "SCHEDULED"
}

');
Insert into LOG_V (ID,MSG) values (1,'{
  "uri" : "/em/cloud/dbaas/dbplatforminstance/byrequest/742" ,
  "name" : "db12" ,
  "resource_state" :     {
      "state" : "INITIATED"
    } ,
  "media_type" : "application/oracle.com.cloud.common.DbPlatformInstance+json" ,
  "canonicalLink" : "/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/dbaas/dbplatforminstance/byrequest/742" ,
  "status" : "SCHEDULED"
}

');
Insert into LOG_V (ID,MSG) values (1,'{
  "uri" : "/em/cloud/dbaas/dbplatforminstance/byrequest/761" ,
  "name" : "db13" ,
  "resource_state" :     {
      "state" : "INITIATED"
    } ,
  "media_type" : "application/oracle.com.cloud.common.DbPlatformInstance+json" ,
  "canonicalLink" : "/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/dbaas/dbplatforminstance/byrequest/761" ,
  "status" : "SCHEDULED"
}

');
Insert into LOG_V (ID,MSG) values (1,'{
  "uri" : "/em/cloud/dbaas/dbplatforminstance/byrequest/762" ,
  "name" : "blc4" ,
  "resource_state" :     {
      "state" : "INITIATED"
    } ,
  "media_type" : "application/oracle.com.cloud.common.DbPlatformInstance+json" ,
  "canonicalLink" : "/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/dbaas/dbplatforminstance/byrequest/762" ,
  "status" : "SCHEDULED"
}

');
Insert into LOG_V (ID,MSG) values (1,'{
  "uri" : "/em/cloud/dbaas/dbplatforminstance/byrequest/523" ,
  "name" : "blc1" ,
  "resource_state" :     {
      "state" : "INITIATED"
    } ,
  "media_type" : "application/oracle.com.cloud.common.DbPlatformInstance+json" ,
  "canonicalLink" : "/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/dbaas/dbplatforminstance/byrequest/523" ,
  "status" : "SCHEDULED"
}

');
Insert into LOG_V (ID,MSG) values (1,'{
  "uri" : "/em/cloud/dbaas/dbplatforminstance/byrequest/524" ,
  "name" : "dbryant" ,
  "resource_state" :     {
      "state" : "INITIATED"
    } ,
  "media_type" : "application/oracle.com.cloud.common.DbPlatformInstance+json" ,
  "canonicalLink" : "/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/dbaas/dbplatforminstance/byrequest/524" ,
  "status" : "SCHEDULED"
}

');
Insert into LOG_V (ID,MSG) values (1,'{
  "uri" : "/em/cloud/dbaas/dbplatforminstance/byrequest/666" ,
  "name" : "blc2" ,
  "resource_state" :     {
      "state" : "INITIATED"
    } ,
  "media_type" : "application/oracle.com.cloud.common.DbPlatformInstance+json" ,
  "canonicalLink" : "/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/dbaas/dbplatforminstance/byrequest/666" ,
  "status" : "SCHEDULED"
}

');
Insert into LOG_V (ID,MSG) values (1,'{
  "uri" : "/em/cloud/dbaas/dbplatforminstance/byrequest/781" ,
  "name" : "blc5" ,
  "resource_state" :     {
      "state" : "INITIATED"
    } ,
  "media_type" : "application/oracle.com.cloud.common.DbPlatformInstance+json" ,
  "canonicalLink" : "/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/dbaas/dbplatforminstance/byrequest/781" ,
  "status" : "SCHEDULED"
}

');
Insert into LOG_V (ID,MSG) values (1,'{
  "uri" : "/em/cloud/dbaas/dbplatforminstance/byrequest/801" ,
  "name" : "db14" ,
  "resource_state" :     {
      "state" : "INITIATED"
    } ,
  "media_type" : "application/oracle.com.cloud.common.DbPlatformInstance+json" ,
  "canonicalLink" : "/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/dbaas/dbplatforminstance/byrequest/801" ,
  "status" : "SCHEDULED"
}

');
Insert into LOG_V (ID,MSG) values (1,'{
  "uri" : "/em/cloud/dbaas/dbplatforminstance/byrequest/445" ,
  "name" : "cmr2" ,
  "resource_state" :     {
      "state" : "INITIATED"
    } ,
  "media_type" : "application/oracle.com.cloud.common.DbPlatformInstance+json" ,
  "canonicalLink" : "/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/dbaas/dbplatforminstance/byrequest/445" ,
  "status" : "SCHEDULED"
}

');
Insert into LOG_V (ID,MSG) values (1,'{
  "uri" : "/em/cloud/dbaas/dbplatforminstance/byrequest/502" ,
  "name" : "cmr5" ,
  "resource_state" :     {
      "state" : "INITIATED"
    } ,
  "media_type" : "application/oracle.com.cloud.common.DbPlatformInstance+json" ,
  "canonicalLink" : "/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/dbaas/dbplatforminstance/byrequest/502" ,
  "status" : "SCHEDULED"
}

');
Insert into LOG_V (ID,MSG) values (1,'{
  "uri" : "/em/cloud/dbaas/dbplatforminstance/byrequest/522" ,
  "name" : "cmr6" ,
  "resource_state" :     {
      "state" : "INITIATED"
    } ,
  "media_type" : "application/oracle.com.cloud.common.DbPlatformInstance+json" ,
  "canonicalLink" : "/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/dbaas/dbplatforminstance/byrequest/522" ,
  "status" : "SCHEDULED"
}

');
Insert into LOG_V (ID,MSG) values (1,'{
  "uri" : "/em/cloud/dbaas/dbplatforminstance/byrequest/467" ,
  "name" : "cmr4" ,
  "resource_state" :     {
      "state" : "INITIATED"
    } ,
  "media_type" : "application/oracle.com.cloud.common.DbPlatformInstance+json" ,
  "canonicalLink" : "/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/dbaas/dbplatforminstance/byrequest/467" ,
  "status" : "SCHEDULED"
}

');
Insert into LOG_V (ID,MSG) values (1,'{
  "uri" : "/em/cloud/dbaas/dbplatforminstance/byrequest/402" ,
  "name" : "Demo" ,
  "resource_state" :     {
      "state" : "INITIATED"
    } ,
  "media_type" : "application/oracle.com.cloud.common.DbPlatformInstance+json" ,
  "canonicalLink" : "/em/websvcs/restful/extws/cloudservices/service/v0/ssa/em/cloud/dbaas/dbplatforminstance/byrequest/402" ,
  "status" : "SCHEDULED"
}

');
REM INSERTING into DB_STATS_V
SET DEFINE OFF;
REM INSERTING into DB_PLATFORM_TEMPLATES_V
SET DEFINE OFF;
Insert into DB_PLATFORM_TEMPLATES_V (NAME,VALUE) values ('AEG_SMALL_DB','20465263F69329B6E05365ED090A67A7');
Insert into DB_PLATFORM_TEMPLATES_V (NAME,VALUE) values ('AEG_SILVER','2275E5F885495BE6E05365ED090A392A');
Insert into DB_PLATFORM_TEMPLATES_V (NAME,VALUE) values ('AEG_PLATINUM','2269262F23386402E05365ED090A866F');
Insert into DB_PLATFORM_TEMPLATES_V (NAME,VALUE) values ('AEG_BRONZE','2275E5F885F95BE6E05365ED090A392A');
Insert into DB_PLATFORM_TEMPLATES_V (NAME,VALUE) values ('AEG_GOLD','2275E5F885D25BE6E05365ED090A392A');
REM INSERTING into ZONES_V
SET DEFINE OFF;
Insert into ZONES_V (NAME,ID,TYPE,CANONICAL_LINK) values ('AEG_PAAS','7F97FFAAF2AF873C6468E49011A14299','self_service_zone','https://acoem.enkitec.com:7802/em/websvcs/restful/extws/cloudservices/admin/cfw/v1/paaszones/7F97FFAAF2AF873C6468E49011A14299');
Insert into ZONES_V (NAME,ID,TYPE,CANONICAL_LINK) values ('AEG_PAAS_SC','5CCB67D3353B992AB6CEA8DE38B2D50E','self_service_zone','https://acoem.enkitec.com:7802/em/websvcs/restful/extws/cloudservices/admin/cfw/v1/paaszones/5CCB67D3353B992AB6CEA8DE38B2D50E');
REM INSERTING into LOGGER_V
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Package DBAAS_MGMT_V4
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "DBAAS_MGMT_V4" AS
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

END dbaas_mgmt_v4;
--------------------------------------------------------
--  DDL for Package DBAAS_VIEWS
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "DBAAS_VIEWS" as



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




end dbaas_views;
/
