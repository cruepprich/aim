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


