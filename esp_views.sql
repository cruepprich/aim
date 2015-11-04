--------------------------------------------------------
--  File created - Tuesday-November-03-2015   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for View CONF_PER_PLAN_V
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "CONF_PER_PLAN_V" ("CLIENT_ID", "CLIENT_NAME", "CLIENT_DESC", "PLAN_ID", "PLAN_NAME", "PLAN_DESC", "CONFIG_ID", "CONFIG_NAME", "CONFIG_DESC", "PLN_CFG_ID", "PLN_CFG_NAME", "REDUNDANCY_LEVEL", "THREAD_EFFICIENCY", "NUM_CPUS_ADJ", "MEMORY_ADJ", "DISK_SIZE_ADJ", "OFFLOADING_ADJ", "COMPRESSION_ADJ", "BACKUP_ADJ", "R_IOPS_ADJ", "W_IOPS_ADJ", "R_MBPS_ADJ", "W_MBPS_ADJ", "COMPUTE_SERVERS", "STORAGE_SERVERS", "NODES", "NUM_CPUS", "MEMORY_SIZE_GB", "DISK_SIZE_RAW_GB", "RW_IOPS", "R_IOPS", "W_IOPS", "RW_MBPS", "R_MBPS", "W_MBPS", "SPEC_ID", "VERSION_DATE", "HARDWARE_VENDOR", "SYSTEM", "NUM_CORES", "NUM_CHIPS", "NUM_CORES_PER_CHIP", "NUM_THREADS_PER_CORE", "BASELINE", "RESULT", "RESULT_PER_CORE", "NUM_CPUS_SPEC", "CAP_NUM_CPU", "CAP_MEM_SIZE_GB", "CAP_DISK_SIZE_GB", "CAP_RW_IOPS", "CAP_R_IOPS", "CAP_W_IOPS", "CAP_RW_MBPS", "CAP_R_MBPS", "CAP_W_MBPS", "CAP_RESULT_PER_CORE", "CAP_NUM_CPU_SPEC") AS 
  SELECT
-- client
  client_id
, client_name
, client_desc
-- plan
, plan_id
, plan_name
, plan_desc
-- configuration
, config_id
, config_name
, config_desc
-- configuration per plan
, pln_cfg_id
, pln_cfg_name
-- scaling factors
, redundancy_level
, thread_efficiency
, num_cpus_adj
, memory_adj
, disk_size_adj
, offloading_adj
, compression_adj
, backup_adj
, r_iops_adj
, w_iops_adj
, r_mbps_adj
, w_mbps_adj
-- server
, SUM(CASE WHEN server_type IN ('C', 'H') THEN 1 ELSE 0 END) compute_servers
, SUM(CASE WHEN server_type IN ('S', 'H') THEN 1 ELSE 0 END) storage_servers
, COUNT(*)                      nodes
-- raw server capacity
, SUM(num_cpus)                 num_cpus
, SUM(memory_size_gb)           memory_size_gb
, SUM(disk_size_raw_gb)         disk_size_raw_gb
, SUM(rw_iops)                  rw_iops
, SUM(r_iops)                   r_iops
, SUM(w_iops)                   w_iops
, SUM(rw_mbps)                  rw_mbps
, SUM(r_mbps)                   r_mbps
, SUM(w_mbps)                   w_mbps
-- spec (all servers on a configuration have same spec_id)
, MAX(spec_id)                  spec_id
, MAX(version_date)             version_date
, MAX(hardware_vendor)          hardware_vendor
, MAX(system)                   system
, MAX(num_cores)                num_cores
, MAX(num_chips)                num_chips
, MAX(num_cores_per_chip)       num_cores_per_chip
, MAX(num_threads_per_core)     num_threads_per_core
, MAX(baseline)                 baseline
, MAX(result)                   result
, MAX(result_per_core)          result_per_core
, SUM(num_cpus_spec)            num_cpus_spec
-- adjusted capacity
, SUM(cap_num_cpu)              cap_num_cpu
, SUM(cap_mem_size_gb)          cap_mem_size_gb
, SUM(cap_disk_size_gb)         cap_disk_size_gb
, SUM(cap_rw_iops)              cap_rw_iops
, SUM(cap_r_iops)               cap_r_iops
, SUM(cap_w_iops)               cap_w_iops
, SUM(cap_rw_mbps)              cap_rw_mbps
, SUM(cap_r_mbps)               cap_r_mbps
, SUM(cap_w_mbps)               cap_w_mbps
, MAX(cap_result_per_core)      cap_result_per_core
, SUM(cap_num_cpu_spec)         cap_num_cpu_spec
  FROM serv_per_plan_v
 GROUP BY
-- client
  client_id
, client_name
, client_desc
-- plan
, plan_id
, plan_name
, plan_desc
-- configuration
, config_id
, config_name
, config_desc
-- configuration per plan
, pln_cfg_id
, pln_cfg_name
-- scaling factors
, redundancy_level
, thread_efficiency
, num_cpus_adj
, memory_adj
, disk_size_adj
, offloading_adj
, compression_adj
, backup_adj
, r_iops_adj
, w_iops_adj
, r_mbps_adj
, w_mbps_adj;
--------------------------------------------------------
--  DDL for View CONFIG_ALLOC_V
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "CONFIG_ALLOC_V" ("CLIENT_ID", "CLIENT_NAME", "PLAN_ID", "PLAN_NAME", "CONFIG_ID", "CONFIG_NAME", "CONFIG_DESC", "COMPUTE_SERVERS", "STORAGE_SERVERS", "PLN_CFG_ID", "PLN_CFG_NAME", "DATABASES", "SOURCE_INSTANCES", "TARGET_INSTANCES", "ALLOCATED_INSTANCES", "CAL_NUM_CPU_SPEC", "CAL_NUM_CPU_PERC", "CAL_NUM_CPU", "CAL_MEM_SIZE_GB", "CAL_MEM_SIZE_PERC", "CAL_DISK_SIZE_GB", "CAL_DISK_SIZE_PERC", "CAL_RW_IOPS", "CAL_RW_IOPS_PERC", "CAL_R_IOPS", "CAL_R_IOPS_PERC", "CAL_W_IOPS", "CAL_W_IOPS_PERC", "CAL_RW_MBPS", "CAL_RW_MBPS_PERC", "CAL_R_MBPS", "CAL_R_MBPS_PERC", "CAL_W_MBPS", "CAL_W_MBPS_PERC", "DBS_CPU_DEMAND", "DBS_CPU_DEMAND_SPEC", "DBS_MEM_SIZE_GB", "DBS_DATABASE_SIZE_GB", "DBS_RW_IOPS", "DBS_R_IOPS", "DBS_W_IOPS", "DBS_RW_MBPS", "DBS_R_MBPS", "DBS_W_MBPS", "CON_NUM_CPUS", "CON_MEMORY_SIZE_GB", "CON_DISK_SIZE_RAW_GB", "CON_RW_IOPS", "CON_R_IOPS", "CON_W_IOPS", "CON_RW_MBPS", "CON_R_MBPS", "CON_W_MBPS", "CAP_NUM_CPU", "CAP_NUM_CPU_SPEC", "CAP_MEM_SIZE_GB", "CAP_DISK_SIZE_GB", "CAP_RW_IOPS", "CAP_R_IOPS", "CAP_W_IOPS", "CAP_RW_MBPS", "CAP_R_MBPS", "CAP_W_MBPS") AS 
  SELECT
-- client
  cop.client_id
, cop.client_name
-- plan
, cop.plan_id
, cop.plan_name
-- configuration
, cop.config_id
, cop.config_name
, cop.config_desc
, cop.compute_servers
, cop.storage_servers
-- configuration per plan
, cop.pln_cfg_id
, cop.pln_cfg_name
-- allocation
, cal.databases
, cal.source_instances
, cal.target_instances
, cal.allocated_instances
-- configuration allocated
, ROUND(NVL(cal.cal_num_cpu_spec, 0))           cal_num_cpu_spec
, ROUND(NVL(cal.cal_num_cpu_perc, 0))           cal_num_cpu_perc
, ROUND(NVL(cal.cal_num_cpu, 0))                cal_num_cpu
, ROUND(NVL(cal.cal_mem_size_gb, 0))            cal_mem_size_gb
, ROUND(NVL(cal.cal_mem_size_perc, 0))          cal_mem_size_perc
, ROUND(NVL(cal.cal_disk_size_gb, 0))           cal_disk_size_gb
, ROUND(NVL(cal.cal_disk_size_perc, 0))         cal_disk_size_perc
, ROUND(NVL(cal.cal_rw_iops, 0))                cal_rw_iops
, ROUND(NVL(cal.cal_rw_iops_perc, 0))           cal_rw_iops_perc
, ROUND(NVL(cal.cal_r_iops, 0))                 cal_r_iops
, ROUND(NVL(cal.cal_r_iops_perc, 0))            cal_r_iops_perc
, ROUND(NVL(cal.cal_w_iops, 0))                 cal_w_iops
, ROUND(NVL(cal.cal_w_iops_perc, 0))            cal_w_iops_perc
, ROUND(NVL(cal.cal_rw_mbps, 0))                cal_rw_mbps
, ROUND(NVL(cal.cal_rw_mbps_perc, 0))           cal_rw_mbps_perc
, ROUND(NVL(cal.cal_r_mbps, 0))                 cal_r_mbps
, ROUND(NVL(cal.cal_r_mbps_perc, 0))            cal_r_mbps_perc
, ROUND(NVL(cal.cal_w_mbps, 0))                 cal_w_mbps
, ROUND(NVL(cal.cal_w_mbps_perc, 0))            cal_w_mbps_perc
-- requirements
, ROUND(NVL(cal.dbs_cpu_demand, 0))             dbs_cpu_demand
, ROUND(NVL(cal.dbs_cpu_demand_spec, 0))        dbs_cpu_demand_spec
, ROUND(NVL(cal.dbs_mem_size_gb, 0))            dbs_mem_size_gb
, ROUND(NVL(cal.dbs_database_size_gb, 0))       dbs_database_size_gb
, ROUND(NVL(cal.dbs_rw_iops, 0))                dbs_rw_iops
, ROUND(NVL(cal.dbs_r_iops, 0))                 dbs_r_iops
, ROUND(NVL(cal.dbs_w_iops, 0))                 dbs_w_iops
, ROUND(NVL(cal.dbs_rw_mbps, 0))                dbs_rw_mbps
, ROUND(NVL(cal.dbs_r_mbps, 0))                 dbs_r_mbps
, ROUND(NVL(cal.dbs_w_mbps, 0))                 dbs_w_mbps
-- raw server capacity
, ROUND(cop.num_cpus)                           con_num_cpus
, ROUND(cop.memory_size_gb)                     con_memory_size_gb
, ROUND(cop.disk_size_raw_gb)                   con_disk_size_raw_gb
, ROUND(cop.rw_iops)                            con_rw_iops
, ROUND(cop.r_iops)                             con_r_iops
, ROUND(cop.w_iops)                             con_w_iops
, ROUND(cop.rw_mbps)                            con_rw_mbps
, ROUND(cop.r_mbps)                             con_r_mbps
, ROUND(cop.w_mbps)                             con_w_mbps
-- adjusted capacity
, ROUND(cop.cap_num_cpu)                        cap_num_cpu
, ROUND(cop.cap_num_cpu_spec)                   cap_num_cpu_spec
, ROUND(cop.cap_mem_size_gb)                    cap_mem_size_gb
, ROUND(cop.cap_disk_size_gb)                   cap_disk_size_gb
, ROUND(cop.cap_rw_iops)                        cap_rw_iops
, ROUND(cop.cap_r_iops)                         cap_r_iops
, ROUND(cop.cap_w_iops)                         cap_w_iops
, ROUND(cop.cap_rw_mbps)                        cap_rw_mbps
, ROUND(cop.cap_r_mbps)                         cap_r_mbps
, ROUND(cop.cap_w_mbps)                         cap_w_mbps
  FROM conf_per_plan_v     cop,
       config_allocation_v cal
 WHERE cal.client_id(+)    = cop.client_id
   AND cal.plan_id(+)      = cop.plan_id
   AND cal.plan_name(+)    = cop.plan_name
   AND cal.pln_cfg_id(+)   = cop.pln_cfg_id
   AND cal.pln_cfg_name(+) = cop.pln_cfg_name
   AND cal.config_id(+)    = cop.config_id
   AND cal.config_name(+)  = cop.config_name;
--------------------------------------------------------
--  DDL for View CONFIG_ALLOC_V2
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "CONFIG_ALLOC_V2" ("CLIENT_ID", "CLIENT_NAME", "PLAN_ID", "PLAN_NAME", "CONFIG_ID", "CONFIG_NAME", "CONFIG_DESC", "COMPUTE_SERVERS", "STORAGE_SERVERS", "PLN_CFG_ID", "PLN_CFG_NAME", "DATABASES", "SOURCE_INSTANCES", "TARGET_INSTANCES", "ALLOCATED_INSTANCES", "NUM_CPU_ALLOCATED", "MEM_SIZE_GB_ALLOCATED", "DISK_SIZE_GB_ALLOCATED", "RW_IOPS_ALLOCATED", "RW_MBPS_ALLOCATED", "NUM_CPU_AVAILABLE", "MEM_SIZE_GB_AVAILABLE", "DISK_SIZE_GB_AVAILABLE", "RW_IOPS_AVAILABLE", "RW_MBPS_AVAILABLE", "CPU_PERC_ALLOCATED", "MEM_PERC_ALLOCATED", "DISK_PERC_ALLOCATED", "RW_IOPS_PERC_ALLOCATED", "RW_MBPS_PERC_ALLOCATED", "CPU_PERC_AVAILABLE", "MEM_PERC_AVAILABLE", "DISK_PERC_AVAILABLE", "RW_IOPS_PERC_AVAILABLE", "RW_MBPS_PERC_AVAILABLE") AS 
  SELECT
-- client
  client_id
, client_name
-- plan
, plan_id
, plan_name
-- configuration
, config_id
, config_name
, config_desc
, compute_servers
, storage_servers
-- configuration per plan
, pln_cfg_id
, pln_cfg_name
-- allocation
, databases
, source_instances
, target_instances
, allocated_instances
-- capacity allocated
, cal_num_cpu                           num_cpu_allocated
, cal_mem_size_gb                       mem_size_gb_allocated
, cal_disk_size_gb                      disk_size_gb_allocated
, cal_rw_iops                           rw_iops_allocated
, cal_rw_mbps                           rw_mbps_allocated
-- capacity available
, cap_num_cpu - cal_num_cpu             num_cpu_available
, cap_mem_size_gb - cal_mem_size_gb     mem_size_gb_available
, cap_disk_size_gb - cal_disk_size_gb   disk_size_gb_available
, cap_rw_iops - cal_rw_iops             rw_iops_available
, cap_rw_mbps - cal_rw_mbps             rw_mbps_available
-- percentages allocated
, cal_num_cpu_perc                      cpu_perc_allocated
, cal_mem_size_perc                     mem_perc_allocated
, cal_disk_size_perc                    disk_perc_allocated
, cal_rw_iops_perc                      rw_iops_perc_allocated
, cal_rw_mbps_perc                      rw_mbps_perc_allocated
-- percentages available
, (100 - cal_num_cpu_perc)              cpu_perc_available
, (100 - cal_mem_size_perc)             mem_perc_available
, (100 - cal_disk_size_perc)            disk_perc_available
, (100 - cal_rw_iops_perc)              rw_iops_perc_available
, (100 - cal_rw_mbps_perc)              rw_mbps_perc_available
  FROM config_alloc_v;
--------------------------------------------------------
--  DDL for View CONFIG_ALLOCATION_V
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "CONFIG_ALLOCATION_V" ("CLIENT_ID", "CLIENT_NAME", "CLIENT_DESC", "PLAN_ID", "PLAN_NAME", "PLAN_DESC", "CONFIG_ID", "CONFIG_NAME", "CONFIG_DESC", "COMPUTE_SERVERS", "STORAGE_SERVERS", "PLN_CFG_ID", "PLN_CFG_NAME", "DATABASES", "SOURCE_INSTANCES", "TARGET_INSTANCES", "ALLOCATED_INSTANCES", "DBS_CPU_DEMAND", "DBS_MEM_SIZE_GB", "DBS_SGA_SIZE_GB", "DBS_PGA_SIZE_GB", "DBS_DATABASE_SIZE_GB", "DBS_RW_IOPS", "DBS_R_IOPS", "DBS_W_IOPS", "DBS_RW_MBPS", "DBS_R_MBPS", "DBS_W_MBPS", "DBS_CPU_DEMAND_SPEC", "CON_NUM_CPUS", "CON_MEMORY_SIZE_GB", "CON_DISK_SIZE_RAW_GB", "CON_RW_IOPS", "CON_R_IOPS", "CON_W_IOPS", "CON_RW_MBPS", "CON_R_MBPS", "CON_W_MBPS", "CAP_NUM_CPU", "CAP_MEM_SIZE_GB", "CAP_DISK_SIZE_GB", "CAP_RW_IOPS", "CAP_R_IOPS", "CAP_W_IOPS", "CAP_RW_MBPS", "CAP_R_MBPS", "CAP_W_MBPS", "CAP_RESULT_PER_CORE", "CAP_NUM_CPU_SPEC", "CAL_NUM_CPU_SPEC", "CAL_NUM_CPU_PERC", "CAL_NUM_CPU", "CAL_MEM_SIZE_GB", "CAL_MEM_SIZE_PERC", "CAL_DISK_SIZE_GB", "CAL_DISK_SIZE_PERC", "CAL_RW_IOPS", "CAL_RW_IOPS_PERC", "CAL_R_IOPS", "CAL_R_IOPS_PERC", "CAL_W_IOPS", "CAL_W_IOPS_PERC", "CAL_RW_MBPS", "CAL_RW_MBPS_PERC", "CAL_R_MBPS", "CAL_R_MBPS_PERC", "CAL_W_MBPS", "CAL_W_MBPS_PERC") AS 
  SELECT
-- client
  client_id
, client_name
, client_desc
-- plan
, plan_id
, plan_name
, plan_desc
-- config
, config_id
, config_name
, config_desc
, compute_servers
, storage_servers
-- plan config
, pln_cfg_id
, pln_cfg_name
-- allocation
, COUNT(*)                          databases
, SUM(source_instances)             source_instances
, SUM(target_instances)             target_instances
, SUM(allocated_instances)          allocated_instances
-- requirements
, SUM(dbs_cpu_demand)               dbs_cpu_demand
, SUM(dbs_mem_size_gb)              dbs_mem_size_gb
, SUM(dbs_sga_size_gb)              dbs_sga_size_gb
, SUM(dbs_pga_size_gb)              dbs_pga_size_gb
, SUM(dbs_database_size_gb)         dbs_database_size_gb
, SUM(dbs_rw_iops)                  dbs_rw_iops
, SUM(dbs_r_iops)                   dbs_r_iops
, SUM(dbs_w_iops)                   dbs_w_iops
, SUM(dbs_rw_mbps)                  dbs_rw_mbps
, SUM(dbs_r_mbps)                   dbs_r_mbps
, SUM(dbs_w_mbps)                   dbs_w_mbps
, SUM(dbs_cpu_demand_spec)          dbs_cpu_demand_spec
-- raw configuration capacity
, SUM(con_num_cpus)                 con_num_cpus
, SUM(con_memory_size_gb)           con_memory_size_gb
, SUM(con_disk_size_raw_gb)         con_disk_size_raw_gb
, SUM(con_rw_iops)                  con_rw_iops
, SUM(con_r_iops)                   con_r_iops
, SUM(con_w_iops)                   con_w_iops
, SUM(con_rw_mbps)                  con_rw_mbps
, SUM(con_r_mbps)                   con_r_mbps
, SUM(con_w_mbps)                   con_w_mbps
-- adjusted capacity
, SUM(cap_num_cpu)                  cap_num_cpu
, SUM(cap_mem_size_gb)              cap_mem_size_gb
, SUM(cap_disk_size_gb)             cap_disk_size_gb
, SUM(cap_rw_iops)                  cap_rw_iops
, SUM(cap_r_iops)                   cap_r_iops
, SUM(cap_w_iops)                   cap_w_iops
, SUM(cap_rw_mbps)                  cap_rw_mbps
, SUM(cap_r_mbps)                   cap_r_mbps
, SUM(cap_w_mbps)                   cap_w_mbps
, SUM(cap_result_per_core)          cap_result_per_core
, SUM(cap_num_cpu_spec)             cap_num_cpu_spec
-- config allocated
, SUM(dal_num_cpu_spec)             cal_num_cpu_spec
, SUM(dal_num_cpu_perc)             cal_num_cpu_perc
, SUM(dal_num_cpu)                  cal_num_cpu
, SUM(dal_mem_size_gb)              cal_mem_size_gb
, SUM(dal_mem_size_perc)            cal_mem_size_perc
, SUM(dal_disk_size_gb)             cal_disk_size_gb
, SUM(dal_disk_size_perc)           cal_disk_size_perc
, SUM(dal_rw_iops)                  cal_rw_iops
, SUM(dal_rw_iops_perc)             cal_rw_iops_perc
, SUM(dal_r_iops)                   cal_r_iops
, SUM(dal_r_iops_perc)              cal_r_iops_perc
, SUM(dal_w_iops)                   cal_w_iops
, SUM(dal_w_iops_perc)              cal_w_iops_perc
, SUM(dal_rw_mbps)                  cal_rw_mbps
, SUM(dal_rw_mbps_perc)             cal_rw_mbps_perc
, SUM(dal_r_mbps)                   cal_r_mbps
, SUM(dal_r_mbps_perc)              cal_r_mbps_perc
, SUM(dal_w_mbps)                   cal_w_mbps
, SUM(dal_w_mbps_perc)              cal_w_mbps_perc
  FROM db_allocation_v
 GROUP BY
-- client
  client_id
, client_name
, client_desc
-- plan
, plan_id
, plan_name
, plan_desc
-- config
, config_id
, config_name
, config_desc
, compute_servers
, storage_servers
-- plan config
, pln_cfg_id
, pln_cfg_name;
--------------------------------------------------------
--  DDL for View CONFIGURATION_V
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "CONFIGURATION_V" ("CONFIG_ID", "CONFIG_NAME", "CONFIG_DESC", "DEFAULT_REDUNDANCY_LEVEL", "COMPUTE_SERVERS", "STORAGE_SERVERS", "NUM_CPUS", "MEMORY_SIZE_GB", "DISK_SIZE_RAW_GB", "RW_IOPS", "R_IOPS", "W_IOPS", "RW_MBPS", "R_MBPS", "W_MBPS", "SPEC_ID", "VERSION_DATE", "HARDWARE_VENDOR", "SYSTEM", "NUM_CORES", "NUM_CHIPS", "NUM_CORES_PER_CHIP", "NUM_THREADS_PER_CORE", "BASELINE", "RESULT", "RESULT_PER_CORE", "NUM_CPUS_SPEC") AS 
  SELECT
  srv.config_id
, srv.config_name
, srv.config_desc
, srv.default_redundancy_level
, SUM(CASE WHEN srv.server_type IN ('C', 'H') THEN 1 ELSE 0 END)    compute_servers
, SUM(CASE WHEN srv.server_type IN ('S', 'H') THEN 1 ELSE 0 END)    storage_servers
, SUM(srv.num_cpus)                                                 num_cpus
, SUM(srv.memory_size_gb)                                           memory_size_gb
, SUM(srv.disk_size_raw_gb)                                         disk_size_raw_gb
, SUM(srv.rw_iops)                                                  rw_iops
, SUM(srv.r_iops)                                                   r_iops
, SUM(srv.w_iops)                                                   w_iops
, SUM(srv.rw_mbps)                                                  rw_mbps
, SUM(srv.r_mbps)                                                   r_mbps
, SUM(srv.w_mbps)                                                   w_mbps
-- spec (all servers on a configuration must have same spec_id)
, MAX(srv.spec_id)                                                  spec_id
, MAX(srv.version_date)                                             version_date
, MAX(srv.hardware_vendor)                                          hardware_vendor
, MAX(srv.system)                                                   system
, MAX(srv.num_cores)                                                num_cores
, MAX(srv.num_chips)                                                num_chips
, MAX(srv.num_cores_per_chip)                                       num_cores_per_chip
, MAX(srv.num_threads_per_core)                                     num_threads_per_core
, MAX(srv.baseline)                                                 baseline
, MAX(srv.result)                                                   result
, MAX(srv.result_per_core)                                          result_per_core
, SUM(srv.num_cpus_spec)                                            num_cpus_spec
  FROM server_v srv
 GROUP BY
  srv.config_id
, srv.config_name
, srv.config_desc
, srv.default_redundancy_level;
--------------------------------------------------------
--  DDL for View DATABASES_V
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "DATABASES_V" ("DB_ID", "DBID", "DB_NAME", "DB_UNIQUE_NAME", "PLATFORM_NAME", "VERSION", "HOST_NAME_SRC", "DB_DESC", "CLUSTER_NAME", "DB_GROUP", "DB_TYPE", "EADAM_SEQ_ID", "COLLECTION_KEY", "COLLECTION_DATE", "LOAD_DATE", "CLIENT_ID", "CLIENT_NAME", "CLIENT_DESC", "TAR_FILE_NAME", "SOURCE_INSTANCES", "AAS_CPU_DEMAND", "MEM_SIZE_GB", "SGA_SIZE_GB", "PGA_SIZE_GB", "DATABASE_SIZE_GB", "RW_IOPS", "R_IOPS", "W_IOPS", "RW_MBPS", "R_MBPS", "W_MBPS", "RESULT", "RESULT_PER_CORE", "AAS_CPU_DEMAND_SPEC", "CPU_COUNT", "AAS_ON_CPU_AND_RESMGR_PEAK", "AAS_ON_CPU_PEAK", "AAS_ON_CPU_AND_RESMGR_9999", "AAS_ON_CPU_9999", "AAS_ON_CPU_AND_RESMGR_999", "AAS_ON_CPU_999", "AAS_ON_CPU_AND_RESMGR_99", "AAS_ON_CPU_99", "AAS_ON_CPU_AND_RESMGR_97", "AAS_ON_CPU_97", "AAS_ON_CPU_AND_RESMGR_95", "AAS_ON_CPU_95", "AAS_ON_CPU_AND_RESMGR_90", "AAS_ON_CPU_90", "AAS_ON_CPU_AND_RESMGR_75", "AAS_ON_CPU_75", "AAS_ON_CPU_AND_RESMGR_MEDIAN", "AAS_ON_CPU_MEDIAN", "AAS_ON_CPU_AND_RESMGR_AVG", "AAS_ON_CPU_AVG", "CAS_ON_CPU_AND_RESMGR_MAX", "CAS_ON_CPU_MAX", "CAS_ON_CPU_AND_RESMGR_99P", "CAS_ON_CPU_99P", "CAS_ON_CPU_AND_RESMGR_97P", "CAS_ON_CPU_97P", "CAS_ON_CPU_AND_RESMGR_95P", "CAS_ON_CPU_95P", "CAS_ON_CPU_AND_RESMGR_90P", "CAS_ON_CPU_90P", "CAS_ON_CPU_AND_RESMGR_75P", "CAS_ON_CPU_75P", "CAS_ON_CPU_AND_RESMGR_MED", "CAS_ON_CPU_MED", "CAS_ON_CPU_AND_RESMGR_AVG", "CAS_ON_CPU_AVG", "RW_IOPS_PEAK_A", "R_IOPS_PEAK_A", "W_IOPS_PEAK_A", "RW_IOPS_999_A", "R_IOPS_999_A", "W_IOPS_999_A", "RW_IOPS_99_A", "R_IOPS_99_A", "W_IOPS_99_A", "RW_IOPS_97_A", "R_IOPS_97_A", "W_IOPS_97_A", "RW_IOPS_95_A", "R_IOPS_95_A", "W_IOPS_95_A", "RW_IOPS_90_A", "R_IOPS_90_A", "W_IOPS_90_A", "RW_IOPS_75_A", "R_IOPS_75_A", "W_IOPS_75_A", "RW_IOPS_MEDIAN_A", "R_IOPS_MEDIAN_A", "W_IOPS_MEDIAN_A", "RW_IOPS_AVG_A", "R_IOPS_AVG_A", "W_IOPS_AVG_A", "RW_MBPS_PEAK_A", "R_MBPS_PEAK_A", "W_MBPS_PEAK_A", "RW_MBPS_999_A", "R_MBPS_999_A", "W_MBPS_999_A", "RW_MBPS_99_A", "R_MBPS_99_A", "W_MBPS_99_A", "RW_MBPS_97_A", "R_MBPS_97_A", "W_MBPS_97_A", "RW_MBPS_95_A", "R_MBPS_95_A", "W_MBPS_95_A", "RW_MBPS_90_A", "R_MBPS_90_A", "W_MBPS_90_A", "RW_MBPS_75_A", "R_MBPS_75_A", "W_MBPS_75_A", "RW_MBPS_MEDIAN_A", "R_MBPS_MEDIAN_A", "W_MBPS_MEDIAN_A", "RW_MBPS_AVG_A", "R_MBPS_AVG_A", "W_MBPS_AVG_A", "RW_IOPS_PEAK_C", "R_IOPS_PEAK_C", "W_IOPS_PEAK_C", "RW_IOPS_999_C", "R_IOPS_999_C", "W_IOPS_999_C", "RW_IOPS_99_C", "R_IOPS_99_C", "W_IOPS_99_C", "RW_IOPS_97_C", "R_IOPS_97_C", "W_IOPS_97_C", "RW_IOPS_95_C", "R_IOPS_95_C", "W_IOPS_95_C", "RW_IOPS_90_C", "R_IOPS_90_C", "W_IOPS_90_C", "RW_IOPS_75_C", "R_IOPS_75_C", "W_IOPS_75_C", "RW_IOPS_MEDIAN_C", "R_IOPS_MEDIAN_C", "W_IOPS_MEDIAN_C", "RW_IOPS_AVG_C", "R_IOPS_AVG_C", "W_IOPS_AVG_C", "RW_MBPS_PEAK_C", "R_MBPS_PEAK_C", "W_MBPS_PEAK_C", "RW_MBPS_999_C", "R_MBPS_999_C", "W_MBPS_999_C", "RW_MBPS_99_C", "R_MBPS_99_C", "W_MBPS_99_C", "RW_MBPS_97_C", "R_MBPS_97_C", "W_MBPS_97_C", "RW_MBPS_95_C", "R_MBPS_95_C", "W_MBPS_95_C", "RW_MBPS_90_C", "R_MBPS_90_C", "W_MBPS_90_C", "RW_MBPS_75_C", "R_MBPS_75_C", "W_MBPS_75_C", "RW_MBPS_MEDIAN_C", "R_MBPS_MEDIAN_C", "W_MBPS_MEDIAN_C", "RW_MBPS_AVG_C", "R_MBPS_AVG_C", "W_MBPS_AVG_C") AS 
  WITH
db_instances AS (
SELECT
  db_id
, COUNT(*) source_instances
, SUM(aas_cpu_demand) aas_cpu_demand
, SUM(mem_size_gb) mem_size_gb
, SUM(sga_size_gb) sga_size_gb
, SUM(pga_size_gb) pga_size_gb
, SUM(rw_iops) rw_iops
, SUM(r_iops) r_iops
, SUM(w_iops) w_iops
, SUM(rw_mbps) rw_mbps
, SUM(r_mbps) r_mbps
, SUM(w_mbps) w_mbps
, ROUND(AVG(result), 1) result
, ROUND(AVG(result_per_core), 1) result_per_core
, SUM(aas_cpu_demand_spec) aas_cpu_demand_spec
, SUM(rw_iops_peak)   rw_iops_peak
, SUM(r_iops_peak)    r_iops_peak
, SUM(w_iops_peak)    w_iops_peak
, SUM(rw_iops_999)    rw_iops_999
, SUM(r_iops_999)     r_iops_999
, SUM(w_iops_999)     w_iops_999
, SUM(rw_iops_99)     rw_iops_99
, SUM(r_iops_99)      r_iops_99
, SUM(w_iops_99)      w_iops_99
, SUM(rw_iops_97)     rw_iops_97
, SUM(r_iops_97)      r_iops_97
, SUM(w_iops_97)      w_iops_97
, SUM(rw_iops_95)     rw_iops_95
, SUM(r_iops_95)      r_iops_95
, SUM(w_iops_95)      w_iops_95
, SUM(rw_iops_90)     rw_iops_90
, SUM(r_iops_90)      r_iops_90
, SUM(w_iops_90)      w_iops_90
, SUM(rw_iops_75)     rw_iops_75
, SUM(r_iops_75)      r_iops_75
, SUM(w_iops_75)      w_iops_75
, SUM(rw_iops_median) rw_iops_median
, SUM(r_iops_median)  r_iops_median
, SUM(w_iops_median)  w_iops_median
, SUM(rw_iops_avg)    rw_iops_avg
, SUM(r_iops_avg)     r_iops_avg
, SUM(w_iops_avg)     w_iops_avg
, SUM(rw_mbps_peak)   rw_mbps_peak
, SUM(r_mbps_peak)    r_mbps_peak
, SUM(w_mbps_peak)    w_mbps_peak
, SUM(rw_mbps_999)    rw_mbps_999
, SUM(r_mbps_999)     r_mbps_999
, SUM(w_mbps_999)     w_mbps_999
, SUM(rw_mbps_99)     rw_mbps_99
, SUM(r_mbps_99)      r_mbps_99
, SUM(w_mbps_99)      w_mbps_99
, SUM(rw_mbps_97)     rw_mbps_97
, SUM(r_mbps_97)      r_mbps_97
, SUM(w_mbps_97)      w_mbps_97
, SUM(rw_mbps_95)     rw_mbps_95
, SUM(r_mbps_95)      r_mbps_95
, SUM(w_mbps_95)      w_mbps_95
, SUM(rw_mbps_90)     rw_mbps_90
, SUM(r_mbps_90)      r_mbps_90
, SUM(w_mbps_90)      w_mbps_90
, SUM(rw_mbps_75)     rw_mbps_75
, SUM(r_mbps_75)      r_mbps_75
, SUM(w_mbps_75)      w_mbps_75
, SUM(rw_mbps_median) rw_mbps_median
, SUM(r_mbps_median)  r_mbps_median
, SUM(w_mbps_median)  w_mbps_median
, SUM(rw_mbps_avg)    rw_mbps_avg
, SUM(r_mbps_avg)     r_mbps_avg
, SUM(w_mbps_avg)     w_mbps_avg
  FROM instances_v
 GROUP BY
       db_id
)
SELECT
  dbs.db_id
, dbs.dbid
, dbs.db_name
, dbs.db_unique_name
, dbs.platform_name
, dbs.version
, dbs.host_name_src
, dbs.db_desc
, dbs.cluster_name
, dbs.db_group
, dbs.db_type
, dbs.eadam_seq_id
, dbs.collection_key
, dbs.collection_date
, dbs.load_date
, dbs.client_id
, cli.client_name
, cli.client_desc
, SUBSTR(edm.tar_file_name, 1, 100) tar_file_name
, NVL(ins.source_instances, 1) source_instances
, NVL(NVL(dbs.aas_cpu_demand, ins.aas_cpu_demand), 0) aas_cpu_demand
, NVL(NVL(dbs.sga_size_gb + dbs.pga_size_gb, ins.mem_size_gb), 0) mem_size_gb
, NVL(NVL(dbs.sga_size_gb, ins.sga_size_gb), 0) sga_size_gb
, NVL(NVL(dbs.pga_size_gb, ins.pga_size_gb), 0) pga_size_gb
, NVL(dbs.database_size_gb, 0) database_size_gb
, NVL(NVL(dbs.r_iops + dbs.w_iops, ins.rw_iops), 0) rw_iops
, NVL(NVL(dbs.r_iops, ins.r_iops), 0) r_iops
, NVL(NVL(dbs.w_iops, ins.w_iops), 0) w_iops
, NVL(NVL(dbs.r_mbps + dbs.w_mbps, ins.rw_mbps), 0) rw_mbps
, NVL(NVL(dbs.r_mbps, ins.r_mbps), 0) r_mbps
, NVL(NVL(dbs.w_mbps, ins.w_mbps), 0) w_mbps
, ins.result
, ins.result_per_core
, NVL(ins.aas_cpu_demand_spec, 0) aas_cpu_demand_spec
, dbs.cpu_count
-- cpu demand details (EH entire history)
, dbs.aas_on_cpu_and_resmgr_peak
, dbs.aas_on_cpu_peak
, dbs.aas_on_cpu_and_resmgr_9999
, dbs.aas_on_cpu_9999
, dbs.aas_on_cpu_and_resmgr_999
, dbs.aas_on_cpu_999
, dbs.aas_on_cpu_and_resmgr_99
, dbs.aas_on_cpu_99
, NVL(dbs.aas_on_cpu_and_resmgr_97, ROUND((dbs.aas_on_cpu_and_resmgr_99 + dbs.aas_on_cpu_and_resmgr_95) / 2)) aas_on_cpu_and_resmgr_97
, NVL(dbs.aas_on_cpu_97, ROUND((dbs.aas_on_cpu_99 + dbs.aas_on_cpu_95) / 2)) aas_on_cpu_97
, dbs.aas_on_cpu_and_resmgr_95
, dbs.aas_on_cpu_95
, dbs.aas_on_cpu_and_resmgr_90
, dbs.aas_on_cpu_90
, dbs.aas_on_cpu_and_resmgr_75
, dbs.aas_on_cpu_75
, dbs.aas_on_cpu_and_resmgr_median
, dbs.aas_on_cpu_median
, dbs.aas_on_cpu_and_resmgr_avg
, dbs.aas_on_cpu_avg
-- cpu demand details (HS hourly stats)
, dbs.cas_on_cpu_and_resmgr_max
, dbs.cas_on_cpu_max
, dbs.cas_on_cpu_and_resmgr_99p
, dbs.cas_on_cpu_99p
, NVL(dbs.cas_on_cpu_and_resmgr_97p, ROUND((dbs.cas_on_cpu_and_resmgr_99p + dbs.cas_on_cpu_and_resmgr_95p) / 2)) cas_on_cpu_and_resmgr_97p
, NVL(dbs.cas_on_cpu_97p, ROUND((dbs.cas_on_cpu_99p + dbs.cas_on_cpu_95p) / 2)) cas_on_cpu_97p
, dbs.cas_on_cpu_and_resmgr_95p
, dbs.cas_on_cpu_95p
, dbs.cas_on_cpu_and_resmgr_90p
, dbs.cas_on_cpu_90p
, dbs.cas_on_cpu_and_resmgr_75p
, dbs.cas_on_cpu_75p
, dbs.cas_on_cpu_and_resmgr_med
, dbs.cas_on_cpu_med
, dbs.cas_on_cpu_and_resmgr_avg
, dbs.cas_on_cpu_avg
-- disk perf details Aggregated (IH instance history)
, ins.rw_iops_peak    rw_iops_peak_a
, ins.r_iops_peak     r_iops_peak_a
, ins.w_iops_peak     w_iops_peak_a
, ins.rw_iops_999     rw_iops_999_a
, ins.r_iops_999      r_iops_999_a
, ins.w_iops_999      w_iops_999_a
, ins.rw_iops_99      rw_iops_99_a
, ins.r_iops_99       r_iops_99_a
, ins.w_iops_99       w_iops_99_a
, ins.rw_iops_97      rw_iops_97_a
, ins.r_iops_97       r_iops_97_a
, ins.w_iops_97       w_iops_97_a
, ins.rw_iops_95      rw_iops_95_a
, ins.r_iops_95       r_iops_95_a
, ins.w_iops_95       w_iops_95_a
, ins.rw_iops_90      rw_iops_90_a
, ins.r_iops_90       r_iops_90_a
, ins.w_iops_90       w_iops_90_a
, ins.rw_iops_75      rw_iops_75_a
, ins.r_iops_75       r_iops_75_a
, ins.w_iops_75       w_iops_75_a
, ins.rw_iops_median  rw_iops_median_a
, ins.r_iops_median   r_iops_median_a
, ins.w_iops_median   w_iops_median_a
, ins.rw_iops_avg     rw_iops_avg_a
, ins.r_iops_avg      r_iops_avg_a
, ins.w_iops_avg      w_iops_avg_a
, ins.rw_mbps_peak    rw_mbps_peak_a
, ins.r_mbps_peak     r_mbps_peak_a
, ins.w_mbps_peak     w_mbps_peak_a
, ins.rw_mbps_999     rw_mbps_999_a
, ins.r_mbps_999      r_mbps_999_a
, ins.w_mbps_999      w_mbps_999_a
, ins.rw_mbps_99      rw_mbps_99_a
, ins.r_mbps_99       r_mbps_99_a
, ins.w_mbps_99       w_mbps_99_a
, ins.rw_mbps_97      rw_mbps_97_a
, ins.r_mbps_97       r_mbps_97_a
, ins.w_mbps_97       w_mbps_97_a
, ins.rw_mbps_95      rw_mbps_95_a
, ins.r_mbps_95       r_mbps_95_a
, ins.w_mbps_95       w_mbps_95_a
, ins.rw_mbps_90      rw_mbps_90_a
, ins.r_mbps_90       r_mbps_90_a
, ins.w_mbps_90       w_mbps_90_a
, ins.rw_mbps_75      rw_mbps_75_a
, ins.r_mbps_75       r_mbps_75_a
, ins.w_mbps_75       w_mbps_75_a
, ins.rw_mbps_median  rw_mbps_median_a
, ins.r_mbps_median   r_mbps_median_a
, ins.w_mbps_median   w_mbps_median_a
, ins.rw_mbps_avg     rw_mbps_avg_a
, ins.r_mbps_avg      r_mbps_avg_a
, ins.w_mbps_avg      w_mbps_avg_a
-- disk perf details Combined (DH database history)
, dbs.rw_iops_peak    rw_iops_peak_c
, dbs.r_iops_peak     r_iops_peak_c
, dbs.w_iops_peak     w_iops_peak_c
, dbs.rw_iops_999     rw_iops_999_c
, dbs.r_iops_999      r_iops_999_c
, dbs.w_iops_999      w_iops_999_c
, dbs.rw_iops_99      rw_iops_99_c
, dbs.r_iops_99       r_iops_99_c
, dbs.w_iops_99       w_iops_99_c
, NVL(dbs.rw_iops_97, ROUND((dbs.rw_iops_99 + dbs.rw_iops_95) / 2)) rw_iops_97_c
, NVL(dbs.r_iops_97, ROUND((dbs.r_iops_99 + dbs.r_iops_95) / 2)) r_iops_97_c
, NVL(dbs.w_iops_97, ROUND((dbs.w_iops_99 + dbs.w_iops_95) / 2)) w_iops_97_c
, dbs.rw_iops_95      rw_iops_95_c
, dbs.r_iops_95       r_iops_95_c
, dbs.w_iops_95       w_iops_95_c
, dbs.rw_iops_90      rw_iops_90_c
, dbs.r_iops_90       r_iops_90_c
, dbs.w_iops_90       w_iops_90_c
, dbs.rw_iops_75      rw_iops_75_c
, dbs.r_iops_75       r_iops_75_c
, dbs.w_iops_75       w_iops_75_c
, dbs.rw_iops_median  rw_iops_median_c
, dbs.r_iops_median   r_iops_median_c
, dbs.w_iops_median   w_iops_median_c
, dbs.rw_iops_avg     rw_iops_avg_c
, dbs.r_iops_avg      r_iops_avg_c
, dbs.w_iops_avg      w_iops_avg_c
, dbs.rw_mbps_peak    rw_mbps_peak_c
, dbs.r_mbps_peak     r_mbps_peak_c
, dbs.w_mbps_peak     w_mbps_peak_c
, dbs.rw_mbps_999     rw_mbps_999_c
, dbs.r_mbps_999      r_mbps_999_c
, dbs.w_mbps_999      w_mbps_999_c
, dbs.rw_mbps_99      rw_mbps_99_c
, dbs.r_mbps_99       r_mbps_99_c
, dbs.w_mbps_99       w_mbps_99_c
, NVL(dbs.rw_mbps_97, ROUND((dbs.rw_mbps_99 + dbs.rw_mbps_95) / 2)) rw_mbps_97_c
, NVL(dbs.r_mbps_97, ROUND((dbs.r_mbps_99 + dbs.r_mbps_95) / 2)) r_mbps_97_c
, NVL(dbs.w_mbps_97, ROUND((dbs.w_mbps_99 + dbs.w_mbps_95) / 2)) w_mbps_97_c
, dbs.rw_mbps_95      rw_mbps_95_c
, dbs.r_mbps_95       r_mbps_95_c
, dbs.w_mbps_95       w_mbps_95_c
, dbs.rw_mbps_90      rw_mbps_90_c
, dbs.r_mbps_90       r_mbps_90_c
, dbs.w_mbps_90       w_mbps_90_c
, dbs.rw_mbps_75      rw_mbps_75_c
, dbs.r_mbps_75       r_mbps_75_c
, dbs.w_mbps_75       w_mbps_75_c
, dbs.rw_mbps_median  rw_mbps_median_c
, dbs.r_mbps_median   r_mbps_median_c
, dbs.w_mbps_median   w_mbps_median_c
, dbs.rw_mbps_avg     rw_mbps_avg_c
, dbs.r_mbps_avg      r_mbps_avg_c
, dbs.w_mbps_avg      w_mbps_avg_c
  FROM databases     dbs,
       clients       cli,
       eadam_control edm,
       db_instances  ins
 WHERE cli.client_id       = dbs.client_id
   AND edm.eadam_seq_id(+) = dbs.eadam_seq_id
   AND ins.db_id(+)        = dbs.db_id;
--------------------------------------------------------
--  DDL for View DB_ALLOC_V
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "DB_ALLOC_V" ("CLIENT_ID", "CLIENT_NAME", "PLAN_ID", "PLAN_NAME", "CONFIG_ID", "CONFIG_NAME", "CONFIG_DESC", "PLN_CFG_ID", "PLN_CFG_NAME", "DBID", "DB_NAME", "DB_UNIQUE_NAME", "SOURCE_INSTANCES", "TARGET_INSTANCES", "DB_ALLOC_ID", "PLN_DB_ID", "ALLOCATED_INSTANCES", "DAL_NUM_CPU_SPEC", "DAL_NUM_CPU_PERC", "DAL_NUM_CPU", "DAL_MEM_SIZE_GB", "DAL_MEM_SIZE_PERC", "DAL_DISK_SIZE_GB", "DAL_DISK_SIZE_PERC", "DAL_RW_IOPS", "DAL_RW_IOPS_PERC", "DAL_R_IOPS", "DAL_R_IOPS_PERC", "DAL_W_IOPS", "DAL_W_IOPS_PERC", "DAL_RW_MBPS", "DAL_RW_MBPS_PERC", "DAL_R_MBPS", "DAL_R_MBPS_PERC", "DAL_W_MBPS", "DAL_W_MBPS_PERC", "DBS_CPU_DEMAND", "DBS_CPU_DEMAND_SPEC", "DBS_MEM_SIZE_GB", "DBS_DATABASE_SIZE_GB", "DBS_RW_IOPS", "DBS_R_IOPS", "DBS_W_IOPS", "DBS_RW_MBPS", "DBS_R_MBPS", "DBS_W_MBPS", "CON_NUM_CPUS", "CON_MEMORY_SIZE_GB", "CON_DISK_SIZE_RAW_GB", "CON_RW_IOPS", "CON_R_IOPS", "CON_W_IOPS", "CON_RW_MBPS", "CON_R_MBPS", "CON_W_MBPS", "CAP_NUM_CPU", "CAP_NUM_CPU_SPEC", "CAP_MEM_SIZE_GB", "CAP_DISK_SIZE_GB", "CAP_RW_IOPS", "CAP_R_IOPS", "CAP_W_IOPS", "CAP_RW_MBPS", "CAP_R_MBPS", "CAP_W_MBPS") AS 
  SELECT
-- client
  client_id
, client_name
-- plan
, plan_id
, plan_name
-- configuration
, config_id
, config_name
, config_desc
-- configuration per plan
, pln_cfg_id
, pln_cfg_name
-- database
, dbid
, db_name
, db_unique_name
, source_instances
, target_instances
-- allocation
, db_alloc_id
, pln_db_id
, allocated_instances
-- database allocated
, dal_num_cpu_spec
, dal_num_cpu_perc
, dal_num_cpu
, dal_mem_size_gb
, dal_mem_size_perc
, dal_disk_size_gb
, dal_disk_size_perc
, dal_rw_iops
, dal_rw_iops_perc
, dal_r_iops
, dal_r_iops_perc
, dal_w_iops
, dal_w_iops_perc
, dal_rw_mbps
, dal_rw_mbps_perc
, dal_r_mbps
, dal_r_mbps_perc
, dal_w_mbps
, dal_w_mbps_perc
-- requirements
, dbs_cpu_demand
, dbs_cpu_demand_spec
, dbs_mem_size_gb
, dbs_database_size_gb
, dbs_rw_iops
, dbs_r_iops
, dbs_w_iops
, dbs_rw_mbps
, dbs_r_mbps
, dbs_w_mbps
-- raw server capacity
, con_num_cpus
, con_memory_size_gb
, con_disk_size_raw_gb
, con_rw_iops
, con_r_iops
, con_w_iops
, con_rw_mbps
, con_r_mbps
, con_w_mbps
-- adjusted capacity
, cap_num_cpu
, cap_num_cpu_spec
, cap_mem_size_gb
, cap_disk_size_gb
, cap_rw_iops
, cap_r_iops
, cap_w_iops
, cap_rw_mbps
, cap_r_mbps
, cap_w_mbps
  FROM db_allocation_v;
--------------------------------------------------------
--  DDL for View DB_ALLOC_V2
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "DB_ALLOC_V2" ("CLIENT_ID", "CLIENT_NAME", "PLAN_ID", "PLAN_NAME", "CONFIG_ID", "CONFIG_NAME", "CONFIG_DESC", "PLN_CFG_ID", "PLN_CFG_NAME", "DBID", "DB_NAME", "DB_UNIQUE_NAME", "SOURCE_INSTANCES", "TARGET_INSTANCES", "DB_ALLOC_ID", "PLN_DB_ID", "ALLOCATED_INSTANCES", "CPU_PERC_ALLOCATED", "MEM_PERC_ALLOCATED", "DISK_PERC_ALLOCATED", "RW_IOPS_PERC_ALLOCATED", "RW_MBPS_PERC_ALLOCATED", "NUM_CPU_ALLOCATED", "MEM_SIZE_GB_ALLOCATED", "DISK_SIZE_GB_ALLOCATED", "RW_IOPS_ALLOCATED", "RW_MBPS_ALLOCATED") AS 
  SELECT
-- client
  client_id
, client_name
-- plan
, plan_id
, plan_name
-- configuration
, config_id
, config_name
, config_desc
-- configuration per plan
, pln_cfg_id
, pln_cfg_name
-- database
, dbid
, db_name
, db_unique_name
, source_instances
, target_instances
-- allocation
, db_alloc_id
, pln_db_id
, allocated_instances
-- percents
, dal_num_cpu_perc      cpu_perc_allocated
, dal_mem_size_perc     mem_perc_allocated
, dal_disk_size_perc    disk_perc_allocated
, dal_rw_iops_perc      rw_iops_perc_allocated
, dal_rw_mbps_perc      rw_mbps_perc_allocated
-- quantities
, dal_num_cpu           num_cpu_allocated
, dal_mem_size_gb       mem_size_gb_allocated
, dal_disk_size_gb      disk_size_gb_allocated
, dal_rw_iops           rw_iops_allocated
, dal_rw_mbps           rw_mbps_allocated
  FROM db_alloc_v;
--------------------------------------------------------
--  DDL for View DB_ALLOCATION_V
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "DB_ALLOCATION_V" ("DB_ALLOC_ID", "PLN_DB_ID", "PLN_CFG_ID", "PLAN_ID", "CLIENT_ID", "CLIENT_NAME", "CLIENT_DESC", "PLAN_NAME", "PLAN_DESC", "DB_ID", "SOURCE_INSTANCES", "TARGET_INSTANCES", "ALLOCATED_INSTANCES", "DBID", "DB_NAME", "DB_UNIQUE_NAME", "PLATFORM_NAME", "VERSION", "HOST_NAME_SRC", "DB_DESC", "CLUSTER_NAME", "DB_GROUP", "DB_TYPE", "EADAM_SEQ_ID", "TAR_FILE_NAME", "COLLECTION_KEY", "COLLECTION_DATE", "LOAD_DATE", "DBS_CPU_DEMAND", "DBS_MEM_SIZE_GB", "DBS_SGA_SIZE_GB", "DBS_PGA_SIZE_GB", "DBS_DATABASE_SIZE_GB", "DBS_RW_IOPS", "DBS_R_IOPS", "DBS_W_IOPS", "DBS_RW_MBPS", "DBS_R_MBPS", "DBS_W_MBPS", "DBS_CPU_DEMAND_SPEC", "CONFIG_ID", "PLN_CFG_NAME", "REDUNDANCY_LEVEL", "THREAD_EFFICIENCY", "NUM_CPUS_ADJ", "MEMORY_ADJ", "DISK_SIZE_ADJ", "OFFLOADING_ADJ", "COMPRESSION_ADJ", "BACKUP_ADJ", "R_IOPS_ADJ", "W_IOPS_ADJ", "R_MBPS_ADJ", "W_MBPS_ADJ", "CONFIG_NAME", "CONFIG_DESC", "COMPUTE_SERVERS", "STORAGE_SERVERS", "CON_NUM_CPUS", "CON_MEMORY_SIZE_GB", "CON_DISK_SIZE_RAW_GB", "CON_RW_IOPS", "CON_R_IOPS", "CON_W_IOPS", "CON_RW_MBPS", "CON_R_MBPS", "CON_W_MBPS", "CON_SPEC_ID", "CON_VERSION_DATE", "CON_HARDWARE_VENDOR", "CON_SYSTEM", "CON_NUM_CORES", "CON_NUM_CHIPS", "CON_NUM_CORES_PER_CHIP", "CON_NUM_THREADS_PER_CORE", "CON_BASELINE", "CON_RESULT", "CON_RESULT_PER_CORE", "CON_NUM_CPUS_SPEC", "CAP_NUM_CPU", "CAP_MEM_SIZE_GB", "CAP_DISK_SIZE_GB", "CAP_RW_IOPS", "CAP_R_IOPS", "CAP_W_IOPS", "CAP_RW_MBPS", "CAP_R_MBPS", "CAP_W_MBPS", "CAP_RESULT_PER_CORE", "CAP_NUM_CPU_SPEC", "DAL_NUM_CPU_SPEC", "DAL_NUM_CPU_PERC", "DAL_NUM_CPU", "DAL_MEM_SIZE_GB", "DAL_MEM_SIZE_PERC", "DAL_DISK_SIZE_GB", "DAL_DISK_SIZE_PERC", "DAL_RW_IOPS", "DAL_RW_IOPS_PERC", "DAL_R_IOPS", "DAL_R_IOPS_PERC", "DAL_W_IOPS", "DAL_W_IOPS_PERC", "DAL_RW_MBPS", "DAL_RW_MBPS_PERC", "DAL_R_MBPS", "DAL_R_MBPS_PERC", "DAL_W_MBPS", "DAL_W_MBPS_PERC") AS 
  SELECT
  dal.db_alloc_id
, dal.pln_db_id
, dal.pln_cfg_id
, dal.plan_id
-- database per plan
, dbp.client_id
, dbp.client_name
, dbp.client_desc
, dbp.plan_name
, dbp.plan_desc
, dbp.db_id
, dbp.source_instances
, dbp.target_instances
, (SELECT COUNT(*) FROM inst_allocation ial WHERE ial.db_alloc_id = dal.db_alloc_id AND ial.node_layout = 'P') allocated_instances
, dbp.dbid
, dbp.db_name
, dbp.db_unique_name
, dbp.platform_name
, dbp.version
, dbp.host_name_src
, dbp.db_desc
, dbp.cluster_name
, dbp.db_group
, dbp.db_type
, dbp.eadam_seq_id
, dbp.tar_file_name
, dbp.collection_key
, dbp.collection_date
, dbp.load_date
-- requirements
, dbp.aas_cpu_demand dbs_cpu_demand
, dbp.mem_size_gb dbs_mem_size_gb
, dbp.sga_size_gb dbs_sga_size_gb
, dbp.pga_size_gb dbs_pga_size_gb
, dbp.database_size_gb dbs_database_size_gb
, dbp.rw_iops dbs_rw_iops
, dbp.r_iops dbs_r_iops
, dbp.w_iops dbs_w_iops
, dbp.rw_mbps dbs_rw_mbps
, dbp.r_mbps dbs_r_mbps
, dbp.w_mbps dbs_w_mbps
, dbp.aas_cpu_demand_spec dbs_cpu_demand_spec
-- configuration per plan
, cop.config_id
, cop.pln_cfg_name
-- scaling factors
, cop.redundancy_level
, cop.thread_efficiency
, cop.num_cpus_adj
, cop.memory_adj
, cop.disk_size_adj
, cop.offloading_adj
, cop.compression_adj
, cop.backup_adj
, cop.r_iops_adj
, cop.w_iops_adj
, cop.r_mbps_adj
, cop.w_mbps_adj
-- configuration
, cop.config_name
, cop.config_desc
, cop.compute_servers
, cop.storage_servers
-- raw configuration capacity
, cop.num_cpus con_num_cpus
, cop.memory_size_gb con_memory_size_gb
, cop.disk_size_raw_gb con_disk_size_raw_gb
, cop.rw_iops con_rw_iops
, cop.r_iops con_r_iops
, cop.w_iops con_w_iops
, cop.rw_mbps con_rw_mbps
, cop.r_mbps con_r_mbps
, cop.w_mbps con_w_mbps
-- spec
, cop.spec_id con_spec_id
, cop.version_date con_version_date
, cop.hardware_vendor con_hardware_vendor
, cop.system con_system
, cop.num_cores con_num_cores
, cop.num_chips con_num_chips
, cop.num_cores_per_chip con_num_cores_per_chip
, cop.num_threads_per_core con_num_threads_per_core
, cop.baseline con_baseline
, cop.result con_result
, cop.result_per_core con_result_per_core
, cop.num_cpus_spec con_num_cpus_spec
-- adjusted capacity
, cop.cap_num_cpu
, cop.cap_mem_size_gb
, cop.cap_disk_size_gb
, cop.cap_rw_iops
, cop.cap_r_iops
, cop.cap_w_iops
, cop.cap_rw_mbps
, cop.cap_r_mbps
, cop.cap_w_mbps
, cop.cap_result_per_core
, cop.cap_num_cpu_spec
-- database allocated
, ROUND(dbp.aas_cpu_demand_spec)                                            dal_num_cpu_spec
, ROUND(100 * dbp.aas_cpu_demand_spec / cop.cap_num_cpu_spec, 1)            dal_num_cpu_perc
, ROUND(dbp.aas_cpu_demand_spec * cop.cap_num_cpu / cop.cap_num_cpu_spec)   dal_num_cpu
, ROUND(dbp.mem_size_gb)                                                    dal_mem_size_gb
, ROUND(100 * dbp.mem_size_gb / cop.cap_mem_size_gb, 1)                     dal_mem_size_perc
, ROUND(dbp.database_size_gb)                                               dal_disk_size_gb
, ROUND(100 * dbp.database_size_gb / cop.cap_disk_size_gb, 1)               dal_disk_size_perc
, ROUND(dbp.rw_iops)                                                        dal_rw_iops
, ROUND(100 * dbp.rw_iops / cop.cap_rw_iops, 1)                             dal_rw_iops_perc
, ROUND(dbp.r_iops)                                                         dal_r_iops
, ROUND(100 * dbp.r_iops / cop.cap_r_iops, 1)                               dal_r_iops_perc
, ROUND(dbp.w_iops)                                                         dal_w_iops
, ROUND(100 * dbp.w_iops / cop.cap_w_iops, 1)                               dal_w_iops_perc
, ROUND(dbp.rw_mbps)                                                        dal_rw_mbps
, ROUND(100 * dbp.rw_mbps / cop.cap_rw_mbps, 1)                             dal_rw_mbps_perc
, ROUND(dbp.r_mbps)                                                         dal_r_mbps
, ROUND(100 * dbp.r_mbps / cop.cap_r_mbps, 1)                               dal_r_mbps_perc
, ROUND(dbp.w_mbps)                                                         dal_w_mbps
, ROUND(100 * dbp.w_mbps / cop.cap_w_mbps, 1)                               dal_w_mbps_perc
  FROM db_allocation   dal,
       db_per_plan_v   dbp,
       conf_per_plan_v cop
 WHERE dbp.pln_db_id   = dal.pln_db_id
   AND dbp.plan_id     = dal.plan_id
   AND cop.pln_cfg_id  = dal.pln_cfg_id
   AND cop.plan_id     = dbp.plan_id
   AND cop.client_id   = dbp.client_id;
--------------------------------------------------------
--  DDL for View DB_PER_PLAN_V
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "DB_PER_PLAN_V" ("PLAN_ID", "CLIENT_ID", "PLAN_NAME", "PLAN_DESC", "PLN_DB_ID", "DB_ID", "SOURCE_INSTANCES", "TARGET_INSTANCES", "DBID", "DB_NAME", "DB_UNIQUE_NAME", "PLATFORM_NAME", "VERSION", "HOST_NAME_SRC", "DB_DESC", "CLUSTER_NAME", "DB_GROUP", "DB_TYPE", "EADAM_SEQ_ID", "COLLECTION_KEY", "COLLECTION_DATE", "LOAD_DATE", "CLIENT_NAME", "CLIENT_DESC", "TAR_FILE_NAME", "CPU_COUNT", "AAS_CPU_DEMAND", "MEM_SIZE_GB", "SGA_SIZE_GB", "PGA_SIZE_GB", "DATABASE_SIZE_GB", "RW_IOPS", "R_IOPS", "W_IOPS", "RW_MBPS", "R_MBPS", "W_MBPS", "RESULT", "RESULT_PER_CORE", "AAS_CPU_DEMAND_SPEC", "AAS_CPU_DEMAND_MAN", "RW_IOPS_MAN", "R_IOPS_MAN", "W_IOPS_MAN", "RW_MBPS_MAN", "R_MBPS_MAN", "W_MBPS_MAN", "AAS_ON_CPU_AND_RESMGR_PEAK", "AAS_ON_CPU_PEAK", "AAS_ON_CPU_AND_RESMGR_9999", "AAS_ON_CPU_9999", "AAS_ON_CPU_AND_RESMGR_999", "AAS_ON_CPU_999", "AAS_ON_CPU_AND_RESMGR_99", "AAS_ON_CPU_99", "AAS_ON_CPU_AND_RESMGR_97", "AAS_ON_CPU_97", "AAS_ON_CPU_AND_RESMGR_95", "AAS_ON_CPU_95", "AAS_ON_CPU_AND_RESMGR_90", "AAS_ON_CPU_90", "AAS_ON_CPU_AND_RESMGR_75", "AAS_ON_CPU_75", "AAS_ON_CPU_AND_RESMGR_MEDIAN", "AAS_ON_CPU_MEDIAN", "AAS_ON_CPU_AND_RESMGR_AVG", "AAS_ON_CPU_AVG", "CAS_ON_CPU_AND_RESMGR_MAX", "CAS_ON_CPU_MAX", "CAS_ON_CPU_AND_RESMGR_99P", "CAS_ON_CPU_99P", "CAS_ON_CPU_AND_RESMGR_97P", "CAS_ON_CPU_97P", "CAS_ON_CPU_AND_RESMGR_95P", "CAS_ON_CPU_95P", "CAS_ON_CPU_AND_RESMGR_90P", "CAS_ON_CPU_90P", "CAS_ON_CPU_AND_RESMGR_75P", "CAS_ON_CPU_75P", "CAS_ON_CPU_AND_RESMGR_MED", "CAS_ON_CPU_MED", "CAS_ON_CPU_AND_RESMGR_AVG", "CAS_ON_CPU_AVG", "RW_IOPS_PEAK_A", "R_IOPS_PEAK_A", "W_IOPS_PEAK_A", "RW_IOPS_999_A", "R_IOPS_999_A", "W_IOPS_999_A", "RW_IOPS_99_A", "R_IOPS_99_A", "W_IOPS_99_A", "RW_IOPS_97_A", "R_IOPS_97_A", "W_IOPS_97_A", "RW_IOPS_95_A", "R_IOPS_95_A", "W_IOPS_95_A", "RW_IOPS_90_A", "R_IOPS_90_A", "W_IOPS_90_A", "RW_IOPS_75_A", "R_IOPS_75_A", "W_IOPS_75_A", "RW_IOPS_MEDIAN_A", "R_IOPS_MEDIAN_A", "W_IOPS_MEDIAN_A", "RW_IOPS_AVG_A", "R_IOPS_AVG_A", "W_IOPS_AVG_A", "RW_MBPS_PEAK_A", "R_MBPS_PEAK_A", "W_MBPS_PEAK_A", "RW_MBPS_999_A", "R_MBPS_999_A", "W_MBPS_999_A", "RW_MBPS_99_A", "R_MBPS_99_A", "W_MBPS_99_A", "RW_MBPS_97_A", "R_MBPS_97_A", "W_MBPS_97_A", "RW_MBPS_95_A", "R_MBPS_95_A", "W_MBPS_95_A", "RW_MBPS_90_A", "R_MBPS_90_A", "W_MBPS_90_A", "RW_MBPS_75_A", "R_MBPS_75_A", "W_MBPS_75_A", "RW_MBPS_MEDIAN_A", "R_MBPS_MEDIAN_A", "W_MBPS_MEDIAN_A", "RW_MBPS_AVG_A", "R_MBPS_AVG_A", "W_MBPS_AVG_A", "RW_IOPS_PEAK_C", "R_IOPS_PEAK_C", "W_IOPS_PEAK_C", "RW_IOPS_999_C", "R_IOPS_999_C", "W_IOPS_999_C", "RW_IOPS_99_C", "R_IOPS_99_C", "W_IOPS_99_C", "RW_IOPS_97_C", "R_IOPS_97_C", "W_IOPS_97_C", "RW_IOPS_95_C", "R_IOPS_95_C", "W_IOPS_95_C", "RW_IOPS_90_C", "R_IOPS_90_C", "W_IOPS_90_C", "RW_IOPS_75_C", "R_IOPS_75_C", "W_IOPS_75_C", "RW_IOPS_MEDIAN_C", "R_IOPS_MEDIAN_C", "W_IOPS_MEDIAN_C", "RW_IOPS_AVG_C", "R_IOPS_AVG_C", "W_IOPS_AVG_C", "RW_MBPS_PEAK_C", "R_MBPS_PEAK_C", "W_MBPS_PEAK_C", "RW_MBPS_999_C", "R_MBPS_999_C", "W_MBPS_999_C", "RW_MBPS_99_C", "R_MBPS_99_C", "W_MBPS_99_C", "RW_MBPS_97_C", "R_MBPS_97_C", "W_MBPS_97_C", "RW_MBPS_95_C", "R_MBPS_95_C", "W_MBPS_95_C", "RW_MBPS_90_C", "R_MBPS_90_C", "W_MBPS_90_C", "RW_MBPS_75_C", "R_MBPS_75_C", "W_MBPS_75_C", "RW_MBPS_MEDIAN_C", "R_MBPS_MEDIAN_C", "W_MBPS_MEDIAN_C", "RW_MBPS_AVG_C", "R_MBPS_AVG_C", "W_MBPS_AVG_C") AS 
  SELECT
  pln.plan_id
, pln.client_id
, pln.plan_name
, pln.plan_desc
, dbp.pln_db_id
, dbp.db_id
, dbs.source_instances
, COALESCE(dbp.target_instances, dbs.source_instances, 1) target_instances
, dbs.dbid
, dbs.db_name
, dbs.db_unique_name
, dbs.platform_name
, dbs.version
, dbs.host_name_src
, dbs.db_desc
, dbs.cluster_name
, dbs.db_group
, dbs.db_type
, dbs.eadam_seq_id
, dbs.collection_key
, dbs.collection_date
, dbs.load_date
, dbs.client_name
, dbs.client_desc
, dbs.tar_file_name
, dbs.cpu_count
, CASE
  WHEN pln.cpu_method = 'MA' THEN dbs.aas_cpu_demand
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = 'PEAK' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.aas_on_cpu_peak > 0 THEN LEAST(dbs.cpu_count, dbs.aas_on_cpu_peak)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = 'PEAK' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND dbs.aas_on_cpu_peak > 0 THEN dbs.aas_on_cpu_peak
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = 'PEAK' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.aas_on_cpu_and_resmgr_peak > 0 THEN LEAST(dbs.cpu_count, dbs.aas_on_cpu_and_resmgr_peak)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = 'PEAK' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND dbs.aas_on_cpu_and_resmgr_peak > 0 THEN dbs.aas_on_cpu_and_resmgr_peak
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '99.99' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.aas_on_cpu_9999 > 0 THEN LEAST(dbs.cpu_count, dbs.aas_on_cpu_9999)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '99.99' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND dbs.aas_on_cpu_9999 > 0 THEN dbs.aas_on_cpu_9999
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '99.99' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.aas_on_cpu_and_resmgr_9999 > 0 THEN LEAST(dbs.cpu_count, dbs.aas_on_cpu_and_resmgr_9999)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '99.99' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND dbs.aas_on_cpu_and_resmgr_9999 > 0 THEN dbs.aas_on_cpu_and_resmgr_9999
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '99.9' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.aas_on_cpu_999 > 0 THEN LEAST(dbs.cpu_count, dbs.aas_on_cpu_999)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '99.9' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND dbs.aas_on_cpu_999 > 0 THEN dbs.aas_on_cpu_999
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '99.9' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.aas_on_cpu_and_resmgr_999 > 0 THEN LEAST(dbs.cpu_count, dbs.aas_on_cpu_and_resmgr_999)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '99.9' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND dbs.aas_on_cpu_and_resmgr_999 > 0 THEN dbs.aas_on_cpu_and_resmgr_999
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '99' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.aas_on_cpu_99 > 0 THEN LEAST(dbs.cpu_count, dbs.aas_on_cpu_99)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '99' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND dbs.aas_on_cpu_99 > 0 THEN dbs.aas_on_cpu_99
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '99' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.aas_on_cpu_and_resmgr_99 > 0 THEN LEAST(dbs.cpu_count, dbs.aas_on_cpu_and_resmgr_99)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '99' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND dbs.aas_on_cpu_and_resmgr_99 > 0 THEN dbs.aas_on_cpu_and_resmgr_99
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '97' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.aas_on_cpu_97 > 0 THEN LEAST(dbs.cpu_count, dbs.aas_on_cpu_97)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '97' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND dbs.aas_on_cpu_97 > 0 THEN dbs.aas_on_cpu_97
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '97' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.aas_on_cpu_and_resmgr_97 > 0 THEN LEAST(dbs.cpu_count, dbs.aas_on_cpu_and_resmgr_97)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '97' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND dbs.aas_on_cpu_and_resmgr_97 > 0 THEN dbs.aas_on_cpu_and_resmgr_97
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '95' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.aas_on_cpu_95 > 0 THEN LEAST(dbs.cpu_count, dbs.aas_on_cpu_95)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '95' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND dbs.aas_on_cpu_95 > 0 THEN dbs.aas_on_cpu_95
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '95' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.aas_on_cpu_and_resmgr_95 > 0 THEN LEAST(dbs.cpu_count, dbs.aas_on_cpu_and_resmgr_95)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '95' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND dbs.aas_on_cpu_and_resmgr_95 > 0 THEN dbs.aas_on_cpu_and_resmgr_95
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '90' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.aas_on_cpu_90 > 0 THEN LEAST(dbs.cpu_count, dbs.aas_on_cpu_90)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '90' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND dbs.aas_on_cpu_90 > 0 THEN dbs.aas_on_cpu_90
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '90' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.aas_on_cpu_and_resmgr_90 > 0 THEN LEAST(dbs.cpu_count, dbs.aas_on_cpu_and_resmgr_90)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '90' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND dbs.aas_on_cpu_and_resmgr_90 > 0 THEN dbs.aas_on_cpu_and_resmgr_90
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '75' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.aas_on_cpu_75 > 0 THEN LEAST(dbs.cpu_count, dbs.aas_on_cpu_75)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '75' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND dbs.aas_on_cpu_75 > 0 THEN dbs.aas_on_cpu_75
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '75' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.aas_on_cpu_and_resmgr_75 > 0 THEN LEAST(dbs.cpu_count, dbs.aas_on_cpu_and_resmgr_75)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '75' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND dbs.aas_on_cpu_and_resmgr_75 > 0 THEN dbs.aas_on_cpu_and_resmgr_75
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = 'MEDIAN' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.aas_on_cpu_median > 0 THEN LEAST(dbs.cpu_count, dbs.aas_on_cpu_median)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = 'MEDIAN' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND dbs.aas_on_cpu_median > 0 THEN dbs.aas_on_cpu_median
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = 'MEDIAN' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.aas_on_cpu_and_resmgr_median > 0 THEN LEAST(dbs.cpu_count, dbs.aas_on_cpu_and_resmgr_median)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = 'MEDIAN' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND dbs.aas_on_cpu_and_resmgr_median > 0 THEN dbs.aas_on_cpu_and_resmgr_median
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = 'AVG' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.aas_on_cpu_avg > 0 THEN LEAST(dbs.cpu_count, dbs.aas_on_cpu_avg)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = 'AVG' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND dbs.aas_on_cpu_avg > 0 THEN dbs.aas_on_cpu_avg
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = 'AVG' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.aas_on_cpu_and_resmgr_avg > 0 THEN LEAST(dbs.cpu_count, dbs.aas_on_cpu_and_resmgr_avg)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = 'AVG' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND dbs.aas_on_cpu_and_resmgr_avg > 0 THEN dbs.aas_on_cpu_and_resmgr_avg
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = 'PEAK' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.cas_on_cpu_max > 0 THEN LEAST(dbs.cpu_count, dbs.cas_on_cpu_max)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = 'PEAK' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND dbs.cas_on_cpu_max > 0 THEN dbs.cas_on_cpu_max
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = 'PEAK' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.cas_on_cpu_and_resmgr_max > 0 THEN LEAST(dbs.cpu_count, dbs.cas_on_cpu_and_resmgr_max)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = 'PEAK' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND dbs.cas_on_cpu_and_resmgr_max > 0 THEN dbs.cas_on_cpu_and_resmgr_max
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '99' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.cas_on_cpu_99p > 0 THEN LEAST(dbs.cpu_count, dbs.cas_on_cpu_99p)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '99' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND dbs.cas_on_cpu_99p > 0 THEN dbs.cas_on_cpu_99p
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '99' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.cas_on_cpu_and_resmgr_99p > 0 THEN LEAST(dbs.cpu_count, dbs.cas_on_cpu_and_resmgr_99p)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '99' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND dbs.cas_on_cpu_and_resmgr_99p > 0 THEN dbs.cas_on_cpu_and_resmgr_99p
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '97' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.cas_on_cpu_97p > 0 THEN LEAST(dbs.cpu_count, dbs.cas_on_cpu_97p)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '97' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND dbs.cas_on_cpu_97p > 0 THEN dbs.cas_on_cpu_97p
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '97' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.cas_on_cpu_and_resmgr_97p > 0 THEN LEAST(dbs.cpu_count, dbs.cas_on_cpu_and_resmgr_97p)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '97' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND dbs.cas_on_cpu_and_resmgr_97p > 0 THEN dbs.cas_on_cpu_and_resmgr_97p
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '95' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.cas_on_cpu_95p > 0 THEN LEAST(dbs.cpu_count, dbs.cas_on_cpu_95p)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '95' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND dbs.cas_on_cpu_95p > 0 THEN dbs.cas_on_cpu_95p
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '95' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.cas_on_cpu_and_resmgr_95p > 0 THEN LEAST(dbs.cpu_count, dbs.cas_on_cpu_and_resmgr_95p)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '95' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND dbs.cas_on_cpu_and_resmgr_95p > 0 THEN dbs.cas_on_cpu_and_resmgr_95p
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '90' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.cas_on_cpu_90p > 0 THEN LEAST(dbs.cpu_count, dbs.cas_on_cpu_90p)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '90' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND dbs.cas_on_cpu_90p > 0 THEN dbs.cas_on_cpu_90p
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '90' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.cas_on_cpu_and_resmgr_90p > 0 THEN LEAST(dbs.cpu_count, dbs.cas_on_cpu_and_resmgr_90p)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '90' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND dbs.cas_on_cpu_and_resmgr_90p > 0 THEN dbs.cas_on_cpu_and_resmgr_90p
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '75' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.cas_on_cpu_75p > 0 THEN LEAST(dbs.cpu_count, dbs.cas_on_cpu_75p)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '75' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND dbs.cas_on_cpu_75p > 0 THEN dbs.cas_on_cpu_75p
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '75' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.cas_on_cpu_and_resmgr_75p > 0 THEN LEAST(dbs.cpu_count, dbs.cas_on_cpu_and_resmgr_75p)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '75' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND dbs.cas_on_cpu_and_resmgr_75p > 0 THEN dbs.cas_on_cpu_and_resmgr_75p
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = 'MEDIAN' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.cas_on_cpu_med > 0 THEN LEAST(dbs.cpu_count, dbs.cas_on_cpu_med)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = 'MEDIAN' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND dbs.cas_on_cpu_med > 0 THEN dbs.cas_on_cpu_med
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = 'MEDIAN' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.cas_on_cpu_and_resmgr_med > 0 THEN LEAST(dbs.cpu_count, dbs.cas_on_cpu_and_resmgr_med)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = 'MEDIAN' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND dbs.cas_on_cpu_and_resmgr_med > 0 THEN dbs.cas_on_cpu_and_resmgr_med
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = 'AVG' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.cas_on_cpu_avg > 0 THEN LEAST(dbs.cpu_count, dbs.cas_on_cpu_avg)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = 'AVG' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND dbs.cas_on_cpu_avg > 0 THEN dbs.cas_on_cpu_avg
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = 'AVG' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.cas_on_cpu_and_resmgr_avg > 0 THEN LEAST(dbs.cpu_count, dbs.cas_on_cpu_and_resmgr_avg)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = 'AVG' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND dbs.cas_on_cpu_and_resmgr_avg > 0 THEN dbs.cas_on_cpu_and_resmgr_avg
  ELSE dbs.aas_cpu_demand
  END aas_cpu_demand
, dbs.mem_size_gb
, dbs.sga_size_gb
, dbs.pga_size_gb
, dbs.database_size_gb
, CASE
  WHEN pln.disk_performance_method = 'MA' THEN dbs.rw_iops
  WHEN pln.disk_performance_statistic = 'PEAK' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.rw_iops_peak_a, dbs.rw_iops)
  WHEN pln.disk_performance_statistic = 'PEAK' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.rw_iops_peak_c, dbs.rw_iops)
  WHEN pln.disk_performance_statistic = '99.9' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.rw_iops_999_a, dbs.rw_iops)
  WHEN pln.disk_performance_statistic = '99.9' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.rw_iops_999_c, dbs.rw_iops)
  WHEN pln.disk_performance_statistic = '99' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.rw_iops_99_a, dbs.rw_iops)
  WHEN pln.disk_performance_statistic = '99' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.rw_iops_99_c, dbs.rw_iops)
  WHEN pln.disk_performance_statistic = '97' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.rw_iops_97_a, dbs.rw_iops)
  WHEN pln.disk_performance_statistic = '97' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.rw_iops_97_c, dbs.rw_iops)
  WHEN pln.disk_performance_statistic = '95' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.rw_iops_95_a, dbs.rw_iops)
  WHEN pln.disk_performance_statistic = '95' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.rw_iops_95_c, dbs.rw_iops)
  WHEN pln.disk_performance_statistic = '90' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.rw_iops_90_a, dbs.rw_iops)
  WHEN pln.disk_performance_statistic = '90' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.rw_iops_90_c, dbs.rw_iops)
  WHEN pln.disk_performance_statistic = '75' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.rw_iops_75_a, dbs.rw_iops)
  WHEN pln.disk_performance_statistic = '75' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.rw_iops_75_c, dbs.rw_iops)
  WHEN pln.disk_performance_statistic = 'MEDIAN' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.rw_iops_median_a, dbs.rw_iops)
  WHEN pln.disk_performance_statistic = 'MEDIAN' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.rw_iops_median_c, dbs.rw_iops)
  WHEN pln.disk_performance_statistic = 'AVG' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.rw_iops_avg_a, dbs.rw_iops)
  WHEN pln.disk_performance_statistic = 'AVG' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.rw_iops_avg_c, dbs.rw_iops)
  ELSE dbs.rw_iops
  END rw_iops
, CASE
  WHEN pln.disk_performance_method = 'MA' THEN dbs.r_iops
  WHEN pln.disk_performance_statistic = 'PEAK' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.r_iops_peak_a, dbs.r_iops)
  WHEN pln.disk_performance_statistic = 'PEAK' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.r_iops_peak_c, dbs.r_iops)
  WHEN pln.disk_performance_statistic = '99.9' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.r_iops_999_a, dbs.r_iops)
  WHEN pln.disk_performance_statistic = '99.9' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.r_iops_999_c, dbs.r_iops)
  WHEN pln.disk_performance_statistic = '99' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.r_iops_99_a, dbs.r_iops)
  WHEN pln.disk_performance_statistic = '99' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.r_iops_99_c, dbs.r_iops)
  WHEN pln.disk_performance_statistic = '97' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.r_iops_97_a, dbs.r_iops)
  WHEN pln.disk_performance_statistic = '97' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.r_iops_97_c, dbs.r_iops)
  WHEN pln.disk_performance_statistic = '95' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.r_iops_95_a, dbs.r_iops)
  WHEN pln.disk_performance_statistic = '95' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.r_iops_95_c, dbs.r_iops)
  WHEN pln.disk_performance_statistic = '90' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.r_iops_90_a, dbs.r_iops)
  WHEN pln.disk_performance_statistic = '90' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.r_iops_90_c, dbs.r_iops)
  WHEN pln.disk_performance_statistic = '75' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.r_iops_75_a, dbs.r_iops)
  WHEN pln.disk_performance_statistic = '75' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.r_iops_75_c, dbs.r_iops)
  WHEN pln.disk_performance_statistic = 'MEDIAN' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.r_iops_median_a, dbs.r_iops)
  WHEN pln.disk_performance_statistic = 'MEDIAN' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.r_iops_median_c, dbs.r_iops)
  WHEN pln.disk_performance_statistic = 'AVG' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.r_iops_avg_a, dbs.r_iops)
  WHEN pln.disk_performance_statistic = 'AVG' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.r_iops_avg_c, dbs.r_iops)
  ELSE dbs.r_iops
  END r_iops
, CASE
  WHEN pln.disk_performance_method = 'MA' THEN dbs.w_iops
  WHEN pln.disk_performance_statistic = 'PEAK' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.w_iops_peak_a, dbs.w_iops)
  WHEN pln.disk_performance_statistic = 'PEAK' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.w_iops_peak_c, dbs.w_iops)
  WHEN pln.disk_performance_statistic = '99.9' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.w_iops_999_a, dbs.w_iops)
  WHEN pln.disk_performance_statistic = '99.9' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.w_iops_999_c, dbs.w_iops)
  WHEN pln.disk_performance_statistic = '99' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.w_iops_99_a, dbs.w_iops)
  WHEN pln.disk_performance_statistic = '99' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.w_iops_99_c, dbs.w_iops)
  WHEN pln.disk_performance_statistic = '97' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.w_iops_97_a, dbs.w_iops)
  WHEN pln.disk_performance_statistic = '97' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.w_iops_97_c, dbs.w_iops)
  WHEN pln.disk_performance_statistic = '95' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.w_iops_95_a, dbs.w_iops)
  WHEN pln.disk_performance_statistic = '95' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.w_iops_95_c, dbs.w_iops)
  WHEN pln.disk_performance_statistic = '90' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.w_iops_90_a, dbs.w_iops)
  WHEN pln.disk_performance_statistic = '90' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.w_iops_90_c, dbs.w_iops)
  WHEN pln.disk_performance_statistic = '75' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.w_iops_75_a, dbs.w_iops)
  WHEN pln.disk_performance_statistic = '75' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.w_iops_75_c, dbs.w_iops)
  WHEN pln.disk_performance_statistic = 'MEDIAN' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.w_iops_median_a, dbs.w_iops)
  WHEN pln.disk_performance_statistic = 'MEDIAN' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.w_iops_median_c, dbs.w_iops)
  WHEN pln.disk_performance_statistic = 'AVG' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.w_iops_avg_a, dbs.w_iops)
  WHEN pln.disk_performance_statistic = 'AVG' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.w_iops_avg_c, dbs.w_iops)
  ELSE dbs.w_iops
  END w_iops
, CASE
  WHEN pln.disk_performance_method = 'MA' THEN dbs.rw_mbps
  WHEN pln.disk_performance_statistic = 'PEAK' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.rw_mbps_peak_a, dbs.rw_mbps)
  WHEN pln.disk_performance_statistic = 'PEAK' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.rw_mbps_peak_c, dbs.rw_mbps)
  WHEN pln.disk_performance_statistic = '99.9' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.rw_mbps_999_a, dbs.rw_mbps)
  WHEN pln.disk_performance_statistic = '99.9' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.rw_mbps_999_c, dbs.rw_mbps)
  WHEN pln.disk_performance_statistic = '99' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.rw_mbps_99_a, dbs.rw_mbps)
  WHEN pln.disk_performance_statistic = '99' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.rw_mbps_99_c, dbs.rw_mbps)
  WHEN pln.disk_performance_statistic = '97' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.rw_mbps_97_a, dbs.rw_mbps)
  WHEN pln.disk_performance_statistic = '97' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.rw_mbps_97_c, dbs.rw_mbps)
  WHEN pln.disk_performance_statistic = '95' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.rw_mbps_95_a, dbs.rw_mbps)
  WHEN pln.disk_performance_statistic = '95' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.rw_mbps_95_c, dbs.rw_mbps)
  WHEN pln.disk_performance_statistic = '90' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.rw_mbps_90_a, dbs.rw_mbps)
  WHEN pln.disk_performance_statistic = '90' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.rw_mbps_90_c, dbs.rw_mbps)
  WHEN pln.disk_performance_statistic = '75' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.rw_mbps_75_a, dbs.rw_mbps)
  WHEN pln.disk_performance_statistic = '75' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.rw_mbps_75_c, dbs.rw_mbps)
  WHEN pln.disk_performance_statistic = 'MEDIAN' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.rw_mbps_median_a, dbs.rw_mbps)
  WHEN pln.disk_performance_statistic = 'MEDIAN' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.rw_mbps_median_c, dbs.rw_mbps)
  WHEN pln.disk_performance_statistic = 'AVG' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.rw_mbps_avg_a, dbs.rw_mbps)
  WHEN pln.disk_performance_statistic = 'AVG' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.rw_mbps_avg_c, dbs.rw_mbps)
  ELSE dbs.rw_mbps
  END rw_mbps
, CASE
  WHEN pln.disk_performance_method = 'MA' THEN dbs.r_mbps
  WHEN pln.disk_performance_statistic = 'PEAK' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.r_mbps_peak_a, dbs.r_mbps)
  WHEN pln.disk_performance_statistic = 'PEAK' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.r_mbps_peak_c, dbs.r_mbps)
  WHEN pln.disk_performance_statistic = '99.9' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.r_mbps_999_a, dbs.r_mbps)
  WHEN pln.disk_performance_statistic = '99.9' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.r_mbps_999_c, dbs.r_mbps)
  WHEN pln.disk_performance_statistic = '99' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.r_mbps_99_a, dbs.r_mbps)
  WHEN pln.disk_performance_statistic = '99' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.r_mbps_99_c, dbs.r_mbps)
  WHEN pln.disk_performance_statistic = '97' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.r_mbps_97_a, dbs.r_mbps)
  WHEN pln.disk_performance_statistic = '97' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.r_mbps_97_c, dbs.r_mbps)
  WHEN pln.disk_performance_statistic = '95' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.r_mbps_95_a, dbs.r_mbps)
  WHEN pln.disk_performance_statistic = '95' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.r_mbps_95_c, dbs.r_mbps)
  WHEN pln.disk_performance_statistic = '90' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.r_mbps_90_a, dbs.r_mbps)
  WHEN pln.disk_performance_statistic = '90' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.r_mbps_90_c, dbs.r_mbps)
  WHEN pln.disk_performance_statistic = '75' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.r_mbps_75_a, dbs.r_mbps)
  WHEN pln.disk_performance_statistic = '75' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.r_mbps_75_c, dbs.r_mbps)
  WHEN pln.disk_performance_statistic = 'MEDIAN' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.r_mbps_median_a, dbs.r_mbps)
  WHEN pln.disk_performance_statistic = 'MEDIAN' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.r_mbps_median_c, dbs.r_mbps)
  WHEN pln.disk_performance_statistic = 'AVG' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.r_mbps_avg_a, dbs.r_mbps)
  WHEN pln.disk_performance_statistic = 'AVG' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.r_mbps_avg_c, dbs.r_mbps)
  ELSE dbs.r_mbps
  END r_mbps
, CASE
  WHEN pln.disk_performance_method = 'MA' THEN dbs.w_mbps
  WHEN pln.disk_performance_statistic = 'PEAK' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.w_mbps_peak_a, dbs.w_mbps)
  WHEN pln.disk_performance_statistic = 'PEAK' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.w_mbps_peak_c, dbs.w_mbps)
  WHEN pln.disk_performance_statistic = '99.9' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.w_mbps_999_a, dbs.w_mbps)
  WHEN pln.disk_performance_statistic = '99.9' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.w_mbps_999_c, dbs.w_mbps)
  WHEN pln.disk_performance_statistic = '99' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.w_mbps_99_a, dbs.w_mbps)
  WHEN pln.disk_performance_statistic = '99' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.w_mbps_99_c, dbs.w_mbps)
  WHEN pln.disk_performance_statistic = '97' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.w_mbps_97_a, dbs.w_mbps)
  WHEN pln.disk_performance_statistic = '97' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.w_mbps_97_c, dbs.w_mbps)
  WHEN pln.disk_performance_statistic = '95' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.w_mbps_95_a, dbs.w_mbps)
  WHEN pln.disk_performance_statistic = '95' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.w_mbps_95_c, dbs.w_mbps)
  WHEN pln.disk_performance_statistic = '90' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.w_mbps_90_a, dbs.w_mbps)
  WHEN pln.disk_performance_statistic = '90' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.w_mbps_90_c, dbs.w_mbps)
  WHEN pln.disk_performance_statistic = '75' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.w_mbps_75_a, dbs.w_mbps)
  WHEN pln.disk_performance_statistic = '75' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.w_mbps_75_c, dbs.w_mbps)
  WHEN pln.disk_performance_statistic = 'MEDIAN' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.w_mbps_median_a, dbs.w_mbps)
  WHEN pln.disk_performance_statistic = 'MEDIAN' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.w_mbps_median_c, dbs.w_mbps)
  WHEN pln.disk_performance_statistic = 'AVG' AND pln.disk_performance_method = 'IH' THEN NVL(dbs.w_mbps_avg_a, dbs.w_mbps)
  WHEN pln.disk_performance_statistic = 'AVG' AND pln.disk_performance_method = 'DH' THEN NVL(dbs.w_mbps_avg_c, dbs.w_mbps)
  ELSE dbs.w_mbps
  END w_mbps
, dbs.result
, dbs.result_per_core
, CASE
  WHEN pln.cpu_method = 'MA' THEN dbs.aas_cpu_demand
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = 'PEAK' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.aas_on_cpu_peak > 0 THEN LEAST(dbs.cpu_count, dbs.aas_on_cpu_peak)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = 'PEAK' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND dbs.aas_on_cpu_peak > 0 THEN dbs.aas_on_cpu_peak
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = 'PEAK' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.aas_on_cpu_and_resmgr_peak > 0 THEN LEAST(dbs.cpu_count, dbs.aas_on_cpu_and_resmgr_peak)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = 'PEAK' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND dbs.aas_on_cpu_and_resmgr_peak > 0 THEN dbs.aas_on_cpu_and_resmgr_peak
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '99.99' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.aas_on_cpu_9999 > 0 THEN LEAST(dbs.cpu_count, dbs.aas_on_cpu_9999)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '99.99' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND dbs.aas_on_cpu_9999 > 0 THEN dbs.aas_on_cpu_9999
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '99.99' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.aas_on_cpu_and_resmgr_9999 > 0 THEN LEAST(dbs.cpu_count, dbs.aas_on_cpu_and_resmgr_9999)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '99.99' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND dbs.aas_on_cpu_and_resmgr_9999 > 0 THEN dbs.aas_on_cpu_and_resmgr_9999
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '99.9' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.aas_on_cpu_999 > 0 THEN LEAST(dbs.cpu_count, dbs.aas_on_cpu_999)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '99.9' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND dbs.aas_on_cpu_999 > 0 THEN dbs.aas_on_cpu_999
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '99.9' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.aas_on_cpu_and_resmgr_999 > 0 THEN LEAST(dbs.cpu_count, dbs.aas_on_cpu_and_resmgr_999)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '99.9' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND dbs.aas_on_cpu_and_resmgr_999 > 0 THEN dbs.aas_on_cpu_and_resmgr_999
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '99' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.aas_on_cpu_99 > 0 THEN LEAST(dbs.cpu_count, dbs.aas_on_cpu_99)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '99' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND dbs.aas_on_cpu_99 > 0 THEN dbs.aas_on_cpu_99
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '99' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.aas_on_cpu_and_resmgr_99 > 0 THEN LEAST(dbs.cpu_count, dbs.aas_on_cpu_and_resmgr_99)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '99' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND dbs.aas_on_cpu_and_resmgr_99 > 0 THEN dbs.aas_on_cpu_and_resmgr_99
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '97' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.aas_on_cpu_97 > 0 THEN LEAST(dbs.cpu_count, dbs.aas_on_cpu_97)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '97' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND dbs.aas_on_cpu_97 > 0 THEN dbs.aas_on_cpu_97
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '97' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.aas_on_cpu_and_resmgr_97 > 0 THEN LEAST(dbs.cpu_count, dbs.aas_on_cpu_and_resmgr_97)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '97' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND dbs.aas_on_cpu_and_resmgr_97 > 0 THEN dbs.aas_on_cpu_and_resmgr_97
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '95' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.aas_on_cpu_95 > 0 THEN LEAST(dbs.cpu_count, dbs.aas_on_cpu_95)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '95' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND dbs.aas_on_cpu_95 > 0 THEN dbs.aas_on_cpu_95
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '95' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.aas_on_cpu_and_resmgr_95 > 0 THEN LEAST(dbs.cpu_count, dbs.aas_on_cpu_and_resmgr_95)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '95' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND dbs.aas_on_cpu_and_resmgr_95 > 0 THEN dbs.aas_on_cpu_and_resmgr_95
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '90' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.aas_on_cpu_90 > 0 THEN LEAST(dbs.cpu_count, dbs.aas_on_cpu_90)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '90' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND dbs.aas_on_cpu_90 > 0 THEN dbs.aas_on_cpu_90
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '90' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.aas_on_cpu_and_resmgr_90 > 0 THEN LEAST(dbs.cpu_count, dbs.aas_on_cpu_and_resmgr_90)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '90' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND dbs.aas_on_cpu_and_resmgr_90 > 0 THEN dbs.aas_on_cpu_and_resmgr_90
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '75' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.aas_on_cpu_75 > 0 THEN LEAST(dbs.cpu_count, dbs.aas_on_cpu_75)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '75' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND dbs.aas_on_cpu_75 > 0 THEN dbs.aas_on_cpu_75
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '75' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.aas_on_cpu_and_resmgr_75 > 0 THEN LEAST(dbs.cpu_count, dbs.aas_on_cpu_and_resmgr_75)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '75' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND dbs.aas_on_cpu_and_resmgr_75 > 0 THEN dbs.aas_on_cpu_and_resmgr_75
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = 'MEDIAN' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.aas_on_cpu_median > 0 THEN LEAST(dbs.cpu_count, dbs.aas_on_cpu_median)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = 'MEDIAN' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND dbs.aas_on_cpu_median > 0 THEN dbs.aas_on_cpu_median
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = 'MEDIAN' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.aas_on_cpu_and_resmgr_median > 0 THEN LEAST(dbs.cpu_count, dbs.aas_on_cpu_and_resmgr_median)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = 'MEDIAN' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND dbs.aas_on_cpu_and_resmgr_median > 0 THEN dbs.aas_on_cpu_and_resmgr_median
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = 'AVG' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.aas_on_cpu_avg > 0 THEN LEAST(dbs.cpu_count, dbs.aas_on_cpu_avg)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = 'AVG' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND dbs.aas_on_cpu_avg > 0 THEN dbs.aas_on_cpu_avg
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = 'AVG' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.aas_on_cpu_and_resmgr_avg > 0 THEN LEAST(dbs.cpu_count, dbs.aas_on_cpu_and_resmgr_avg)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = 'AVG' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND dbs.aas_on_cpu_and_resmgr_avg > 0 THEN dbs.aas_on_cpu_and_resmgr_avg
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = 'PEAK' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.cas_on_cpu_max > 0 THEN LEAST(dbs.cpu_count, dbs.cas_on_cpu_max)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = 'PEAK' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND dbs.cas_on_cpu_max > 0 THEN dbs.cas_on_cpu_max
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = 'PEAK' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.cas_on_cpu_and_resmgr_max > 0 THEN LEAST(dbs.cpu_count, dbs.cas_on_cpu_and_resmgr_max)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = 'PEAK' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND dbs.cas_on_cpu_and_resmgr_max > 0 THEN dbs.cas_on_cpu_and_resmgr_max
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '99' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.cas_on_cpu_99p > 0 THEN LEAST(dbs.cpu_count, dbs.cas_on_cpu_99p)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '99' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND dbs.cas_on_cpu_99p > 0 THEN dbs.cas_on_cpu_99p
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '99' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.cas_on_cpu_and_resmgr_99p > 0 THEN LEAST(dbs.cpu_count, dbs.cas_on_cpu_and_resmgr_99p)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '99' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND dbs.cas_on_cpu_and_resmgr_99p > 0 THEN dbs.cas_on_cpu_and_resmgr_99p
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '97' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.cas_on_cpu_97p > 0 THEN LEAST(dbs.cpu_count, dbs.cas_on_cpu_97p)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '97' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND dbs.cas_on_cpu_97p > 0 THEN dbs.cas_on_cpu_97p
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '97' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.cas_on_cpu_and_resmgr_97p > 0 THEN LEAST(dbs.cpu_count, dbs.cas_on_cpu_and_resmgr_97p)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '97' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND dbs.cas_on_cpu_and_resmgr_97p > 0 THEN dbs.cas_on_cpu_and_resmgr_97p
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '95' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.cas_on_cpu_95p > 0 THEN LEAST(dbs.cpu_count, dbs.cas_on_cpu_95p)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '95' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND dbs.cas_on_cpu_95p > 0 THEN dbs.cas_on_cpu_95p
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '95' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.cas_on_cpu_and_resmgr_95p > 0 THEN LEAST(dbs.cpu_count, dbs.cas_on_cpu_and_resmgr_95p)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '95' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND dbs.cas_on_cpu_and_resmgr_95p > 0 THEN dbs.cas_on_cpu_and_resmgr_95p
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '90' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.cas_on_cpu_90p > 0 THEN LEAST(dbs.cpu_count, dbs.cas_on_cpu_90p)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '90' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND dbs.cas_on_cpu_90p > 0 THEN dbs.cas_on_cpu_90p
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '90' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.cas_on_cpu_and_resmgr_90p > 0 THEN LEAST(dbs.cpu_count, dbs.cas_on_cpu_and_resmgr_90p)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '90' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND dbs.cas_on_cpu_and_resmgr_90p > 0 THEN dbs.cas_on_cpu_and_resmgr_90p
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '75' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.cas_on_cpu_75p > 0 THEN LEAST(dbs.cpu_count, dbs.cas_on_cpu_75p)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '75' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND dbs.cas_on_cpu_75p > 0 THEN dbs.cas_on_cpu_75p
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '75' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.cas_on_cpu_and_resmgr_75p > 0 THEN LEAST(dbs.cpu_count, dbs.cas_on_cpu_and_resmgr_75p)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '75' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND dbs.cas_on_cpu_and_resmgr_75p > 0 THEN dbs.cas_on_cpu_and_resmgr_75p
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = 'MEDIAN' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.cas_on_cpu_med > 0 THEN LEAST(dbs.cpu_count, dbs.cas_on_cpu_med)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = 'MEDIAN' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND dbs.cas_on_cpu_med > 0 THEN dbs.cas_on_cpu_med
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = 'MEDIAN' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.cas_on_cpu_and_resmgr_med > 0 THEN LEAST(dbs.cpu_count, dbs.cas_on_cpu_and_resmgr_med)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = 'MEDIAN' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND dbs.cas_on_cpu_and_resmgr_med > 0 THEN dbs.cas_on_cpu_and_resmgr_med
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = 'AVG' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.cas_on_cpu_avg > 0 THEN LEAST(dbs.cpu_count, dbs.cas_on_cpu_avg)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = 'AVG' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND dbs.cas_on_cpu_avg > 0 THEN dbs.cas_on_cpu_avg
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = 'AVG' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND dbs.cpu_count > 0 AND dbs.cas_on_cpu_and_resmgr_avg > 0 THEN LEAST(dbs.cpu_count, dbs.cas_on_cpu_and_resmgr_avg)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = 'AVG' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND dbs.cas_on_cpu_and_resmgr_avg > 0 THEN dbs.cas_on_cpu_and_resmgr_avg
  ELSE dbs.aas_cpu_demand
  END * dbs.result_per_core aas_cpu_demand_spec
-- manual part
, dbs.aas_cpu_demand aas_cpu_demand_man
, dbs.rw_iops        rw_iops_man
, dbs.r_iops         r_iops_man
, dbs.w_iops         w_iops_man
, dbs.rw_mbps        rw_mbps_man
, dbs.r_mbps         r_mbps_man
, dbs.w_mbps         w_mbps_man
-- cpu demand details (EH entire history)
, dbs.aas_on_cpu_and_resmgr_peak
, dbs.aas_on_cpu_peak
, dbs.aas_on_cpu_and_resmgr_9999
, dbs.aas_on_cpu_9999
, dbs.aas_on_cpu_and_resmgr_999
, dbs.aas_on_cpu_999
, dbs.aas_on_cpu_and_resmgr_99
, dbs.aas_on_cpu_99
, dbs.aas_on_cpu_and_resmgr_97
, dbs.aas_on_cpu_97
, dbs.aas_on_cpu_and_resmgr_95
, dbs.aas_on_cpu_95
, dbs.aas_on_cpu_and_resmgr_90
, dbs.aas_on_cpu_90
, dbs.aas_on_cpu_and_resmgr_75
, dbs.aas_on_cpu_75
, dbs.aas_on_cpu_and_resmgr_median
, dbs.aas_on_cpu_median
, dbs.aas_on_cpu_and_resmgr_avg
, dbs.aas_on_cpu_avg
-- cpu demand details (HS hourly stats)
, dbs.cas_on_cpu_and_resmgr_max
, dbs.cas_on_cpu_max
, dbs.cas_on_cpu_and_resmgr_99p
, dbs.cas_on_cpu_99p
, dbs.cas_on_cpu_and_resmgr_97p
, dbs.cas_on_cpu_97p
, dbs.cas_on_cpu_and_resmgr_95p
, dbs.cas_on_cpu_95p
, dbs.cas_on_cpu_and_resmgr_90p
, dbs.cas_on_cpu_90p
, dbs.cas_on_cpu_and_resmgr_75p
, dbs.cas_on_cpu_75p
, dbs.cas_on_cpu_and_resmgr_med
, dbs.cas_on_cpu_med
, dbs.cas_on_cpu_and_resmgr_avg
, dbs.cas_on_cpu_avg
-- disk perf details Aggregated (IH instance history)
, dbs.rw_iops_peak_a
, dbs.r_iops_peak_a
, dbs.w_iops_peak_a
, dbs.rw_iops_999_a
, dbs.r_iops_999_a
, dbs.w_iops_999_a
, dbs.rw_iops_99_a
, dbs.r_iops_99_a
, dbs.w_iops_99_a
, dbs.rw_iops_97_a
, dbs.r_iops_97_a
, dbs.w_iops_97_a
, dbs.rw_iops_95_a
, dbs.r_iops_95_a
, dbs.w_iops_95_a
, dbs.rw_iops_90_a
, dbs.r_iops_90_a
, dbs.w_iops_90_a
, dbs.rw_iops_75_a
, dbs.r_iops_75_a
, dbs.w_iops_75_a
, dbs.rw_iops_median_a
, dbs.r_iops_median_a
, dbs.w_iops_median_a
, dbs.rw_iops_avg_a
, dbs.r_iops_avg_a
, dbs.w_iops_avg_a
, dbs.rw_mbps_peak_a
, dbs.r_mbps_peak_a
, dbs.w_mbps_peak_a
, dbs.rw_mbps_999_a
, dbs.r_mbps_999_a
, dbs.w_mbps_999_a
, dbs.rw_mbps_99_a
, dbs.r_mbps_99_a
, dbs.w_mbps_99_a
, dbs.rw_mbps_97_a
, dbs.r_mbps_97_a
, dbs.w_mbps_97_a
, dbs.rw_mbps_95_a
, dbs.r_mbps_95_a
, dbs.w_mbps_95_a
, dbs.rw_mbps_90_a
, dbs.r_mbps_90_a
, dbs.w_mbps_90_a
, dbs.rw_mbps_75_a
, dbs.r_mbps_75_a
, dbs.w_mbps_75_a
, dbs.rw_mbps_median_a
, dbs.r_mbps_median_a
, dbs.w_mbps_median_a
, dbs.rw_mbps_avg_a
, dbs.r_mbps_avg_a
, dbs.w_mbps_avg_a
-- disk perf details Combined (DH database history)
, dbs.rw_iops_peak_c
, dbs.r_iops_peak_c
, dbs.w_iops_peak_c
, dbs.rw_iops_999_c
, dbs.r_iops_999_c
, dbs.w_iops_999_c
, dbs.rw_iops_99_c
, dbs.r_iops_99_c
, dbs.w_iops_99_c
, dbs.rw_iops_97_c
, dbs.r_iops_97_c
, dbs.w_iops_97_c
, dbs.rw_iops_95_c
, dbs.r_iops_95_c
, dbs.w_iops_95_c
, dbs.rw_iops_90_c
, dbs.r_iops_90_c
, dbs.w_iops_90_c
, dbs.rw_iops_75_c
, dbs.r_iops_75_c
, dbs.w_iops_75_c
, dbs.rw_iops_median_c
, dbs.r_iops_median_c
, dbs.w_iops_median_c
, dbs.rw_iops_avg_c
, dbs.r_iops_avg_c
, dbs.w_iops_avg_c
, dbs.rw_mbps_peak_c
, dbs.r_mbps_peak_c
, dbs.w_mbps_peak_c
, dbs.rw_mbps_999_c
, dbs.r_mbps_999_c
, dbs.w_mbps_999_c
, dbs.rw_mbps_99_c
, dbs.r_mbps_99_c
, dbs.w_mbps_99_c
, dbs.rw_mbps_97_c
, dbs.r_mbps_97_c
, dbs.w_mbps_97_c
, dbs.rw_mbps_95_c
, dbs.r_mbps_95_c
, dbs.w_mbps_95_c
, dbs.rw_mbps_90_c
, dbs.r_mbps_90_c
, dbs.w_mbps_90_c
, dbs.rw_mbps_75_c
, dbs.r_mbps_75_c
, dbs.w_mbps_75_c
, dbs.rw_mbps_median_c
, dbs.r_mbps_median_c
, dbs.w_mbps_median_c
, dbs.rw_mbps_avg_c
, dbs.r_mbps_avg_c
, dbs.w_mbps_avg_c
  FROM plan        pln,
       db_per_plan dbp,
       databases_v dbs
 WHERE dbp.plan_id   = pln.plan_id
   AND dbs.db_id     = dbp.db_id
   AND dbs.client_id = pln.client_id;
--------------------------------------------------------
--  DDL for View DB_PER_PLAN_V2
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "DB_PER_PLAN_V2" ("PLAN_ID", "DBID", "DB_NAME", "DB_UNIQUE_NAME", "CLUSTER_NAME", "DB_GROUP", "DB_TYPE", "VERSION", "SOURCE_INSTANCES", "TARGET_INSTANCES", "CPU_DEMAND", "CPU_SPEED", "CPU_DEMAND_WEIGHTED", "MEM_SIZE_GB", "DATABASE_SIZE_GB", "RW_IOPS", "RW_MBPS", "DB_ID", "PLN_DB_ID", "CLIENT_ID") AS 
  SELECT
  plan_id
, dbid
, db_name
, db_unique_name
, cluster_name
, db_group
, db_type
, version
, source_instances
, target_instances
, ROUND(NVL(aas_cpu_demand, 0))         cpu_demand
, result_per_core                       cpu_speed
, ROUND(NVL(aas_cpu_demand_spec, 0))    cpu_demand_weighted
, ROUND(NVL(mem_size_gb, 0))            mem_size_gb
, ROUND(NVL(database_size_gb, 0))       database_size_gb
, ROUND(NVL(rw_iops, 0))                rw_iops
, ROUND(NVL(rw_mbps, 0))                rw_mbps
-- ids
, db_id
, pln_db_id
, client_id
  FROM db_per_plan_v;
--------------------------------------------------------
--  DDL for View HOST_PER_PLAN_V
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "HOST_PER_PLAN_V" ("PLAN_ID", "CLIENT_ID", "PLAN_NAME", "PLAN_DESC", "HOST_NAME", "HOST_NUM_CPUS", "HOST_NUM_CPU_CORES", "HOST_NUM_CPU_SOCKETS", "HOST_LOAD", "HOST_PHYSICAL_MEMORY_GB", "SPEC_ID", "VERSION_DATE", "HARDWARE_VENDOR", "SYSTEM", "NUM_CORES", "NUM_CHIPS", "NUM_CORES_PER_CHIP", "NUM_THREADS_PER_CORE", "BASELINE", "PLATFORM_NAME", "VERSION", "CLIENT_NAME", "CLIENT_DESC", "INSTANCES", "MAX_CPU_COUNT", "SUM_CPU_COUNT", "AAS_CPU_DEMAND", "MEM_SIZE_GB", "SGA_SIZE_GB", "PGA_SIZE_GB", "RW_IOPS", "R_IOPS", "W_IOPS", "RW_MBPS", "R_MBPS", "W_MBPS", "RESULT", "RESULT_PER_CORE", "AAS_CPU_DEMAND_SPEC", "CPU_METHOD", "CPU_STATISTIC", "INCLUDE_RESMGR_CPU_QUANTUM", "CAP_TO_NUM_CPUS", "DISK_PERFORMANCE_METHOD", "DISK_PERFORMANCE_STATISTIC", "AAS_CPU_DEMAND_MAN", "RW_IOPS_MAN", "R_IOPS_MAN", "W_IOPS_MAN", "RW_MBPS_MAN", "R_MBPS_MAN", "W_MBPS_MAN", "AAS_ON_CPU_AND_RESMGR_PEAK", "AAS_ON_CPU_PEAK", "AAS_ON_CPU_AND_RESMGR_9999", "AAS_ON_CPU_9999", "AAS_ON_CPU_AND_RESMGR_999", "AAS_ON_CPU_999", "AAS_ON_CPU_AND_RESMGR_99", "AAS_ON_CPU_99", "AAS_ON_CPU_AND_RESMGR_97", "AAS_ON_CPU_97", "AAS_ON_CPU_AND_RESMGR_95", "AAS_ON_CPU_95", "AAS_ON_CPU_AND_RESMGR_90", "AAS_ON_CPU_90", "AAS_ON_CPU_AND_RESMGR_75", "AAS_ON_CPU_75", "AAS_ON_CPU_AND_RESMGR_MEDIAN", "AAS_ON_CPU_MEDIAN", "AAS_ON_CPU_AND_RESMGR_AVG", "AAS_ON_CPU_AVG", "CAS_ON_CPU_AND_RESMGR_MAX", "CAS_ON_CPU_MAX", "CAS_ON_CPU_AND_RESMGR_99P", "CAS_ON_CPU_99P", "CAS_ON_CPU_AND_RESMGR_97P", "CAS_ON_CPU_97P", "CAS_ON_CPU_AND_RESMGR_95P", "CAS_ON_CPU_95P", "CAS_ON_CPU_AND_RESMGR_90P", "CAS_ON_CPU_90P", "CAS_ON_CPU_AND_RESMGR_75P", "CAS_ON_CPU_75P", "CAS_ON_CPU_AND_RESMGR_MED", "CAS_ON_CPU_MED", "CAS_ON_CPU_AND_RESMGR_AVG", "CAS_ON_CPU_AVG", "RW_IOPS_PEAK", "R_IOPS_PEAK", "W_IOPS_PEAK", "RW_IOPS_999", "R_IOPS_999", "W_IOPS_999", "RW_IOPS_99", "R_IOPS_99", "W_IOPS_99", "RW_IOPS_97", "R_IOPS_97", "W_IOPS_97", "RW_IOPS_95", "R_IOPS_95", "W_IOPS_95", "RW_IOPS_90", "R_IOPS_90", "W_IOPS_90", "RW_IOPS_75", "R_IOPS_75", "W_IOPS_75", "RW_IOPS_MEDIAN", "R_IOPS_MEDIAN", "W_IOPS_MEDIAN", "RW_IOPS_AVG", "R_IOPS_AVG", "W_IOPS_AVG", "RW_MBPS_PEAK", "R_MBPS_PEAK", "W_MBPS_PEAK", "RW_MBPS_999", "R_MBPS_999", "W_MBPS_999", "RW_MBPS_99", "R_MBPS_99", "W_MBPS_99", "RW_MBPS_97", "R_MBPS_97", "W_MBPS_97", "RW_MBPS_95", "R_MBPS_95", "W_MBPS_95", "RW_MBPS_90", "R_MBPS_90", "W_MBPS_90", "RW_MBPS_75", "R_MBPS_75", "W_MBPS_75", "RW_MBPS_MEDIAN", "R_MBPS_MEDIAN", "W_MBPS_MEDIAN", "RW_MBPS_AVG", "R_MBPS_AVG", "W_MBPS_AVG") AS 
  SELECT
  pln.plan_id
, pln.client_id
, pln.plan_name
, pln.plan_desc
, ins.host_name
, MAX(ins.host_num_cpus) host_num_cpus
, MAX(ins.host_num_cpu_cores) host_num_cpu_cores
, MAX(ins.host_num_cpu_sockets) host_num_cpu_sockets
, MAX(ins.host_load) host_load
, MAX(ins.host_physical_memory_gb) host_physical_memory_gb
, MAX(ins.spec_id) spec_id
, MAX(ins.version_date) version_date
, MAX(ins.hardware_vendor) hardware_vendor
, MAX(ins.system) system
, MAX(ins.num_cores) num_cores
, MAX(ins.num_chips) num_chips
, MAX(ins.num_cores_per_chip) num_cores_per_chip
, MAX(ins.num_threads_per_core) num_threads_per_core
, MAX(ins.baseline) baseline
, MAX(ins.platform_name) platform_name
, MAX(ins.version) version
, ins.client_name
, ins.client_desc
, COUNT(*) instances
, MAX(ins.cpu_count) max_cpu_count
, SUM(ins.cpu_count) sum_cpu_count
, ROUND(SUM(ins.aas_cpu_demand)) aas_cpu_demand
, ROUND(SUM(ins.mem_size_gb)) mem_size_gb
, ROUND(SUM(ins.sga_size_gb)) sga_size_gb
, ROUND(SUM(ins.pga_size_gb)) pga_size_gb
, ROUND(SUM(ins.rw_iops)) rw_iops
, ROUND(SUM(ins.r_iops)) r_iops
, ROUND(SUM(ins.w_iops)) w_iops
, ROUND(SUM(ins.rw_mbps)) rw_mbps
, ROUND(SUM(ins.r_mbps)) r_mbps
, ROUND(SUM(ins.w_mbps)) w_mbps
, ROUND(AVG(ins.result), 1) result
, ROUND(AVG(ins.result_per_core), 1) result_per_core
, ROUND(SUM(ins.aas_cpu_demand_spec)) aas_cpu_demand_spec
-- sourcing method
, pln.cpu_method
, pln.cpu_statistic
, pln.include_resmgr_cpu_quantum
, pln.cap_to_num_cpus
, pln.disk_performance_method
, pln.disk_performance_statistic
-- manual part
, SUM(ins.aas_cpu_demand_man) aas_cpu_demand_man
, SUM(ins.rw_iops_man       ) rw_iops_man
, SUM(ins.r_iops_man        ) r_iops_man
, SUM(ins.w_iops_man        ) w_iops_man
, SUM(ins.rw_mbps_man       ) rw_mbps_man
, SUM(ins.r_mbps_man        ) r_mbps_man
, SUM(ins.w_mbps_man        ) w_mbps_man
-- cpu demand details (EH entire history)
, SUM(ins.aas_on_cpu_and_resmgr_peak   ) aas_on_cpu_and_resmgr_peak
, SUM(ins.aas_on_cpu_peak              ) aas_on_cpu_peak
, SUM(ins.aas_on_cpu_and_resmgr_9999   ) aas_on_cpu_and_resmgr_9999
, SUM(ins.aas_on_cpu_9999              ) aas_on_cpu_9999
, SUM(ins.aas_on_cpu_and_resmgr_999    ) aas_on_cpu_and_resmgr_999
, SUM(ins.aas_on_cpu_999               ) aas_on_cpu_999
, SUM(ins.aas_on_cpu_and_resmgr_99     ) aas_on_cpu_and_resmgr_99
, SUM(ins.aas_on_cpu_99                ) aas_on_cpu_99
, SUM(ins.aas_on_cpu_and_resmgr_97     ) aas_on_cpu_and_resmgr_97
, SUM(ins.aas_on_cpu_97                ) aas_on_cpu_97
, SUM(ins.aas_on_cpu_and_resmgr_95     ) aas_on_cpu_and_resmgr_95
, SUM(ins.aas_on_cpu_95                ) aas_on_cpu_95
, SUM(ins.aas_on_cpu_and_resmgr_90     ) aas_on_cpu_and_resmgr_90
, SUM(ins.aas_on_cpu_90                ) aas_on_cpu_90
, SUM(ins.aas_on_cpu_and_resmgr_75     ) aas_on_cpu_and_resmgr_75
, SUM(ins.aas_on_cpu_75                ) aas_on_cpu_75
, SUM(ins.aas_on_cpu_and_resmgr_median ) aas_on_cpu_and_resmgr_median
, SUM(ins.aas_on_cpu_median            ) aas_on_cpu_median
, SUM(ins.aas_on_cpu_and_resmgr_avg    ) aas_on_cpu_and_resmgr_avg
, SUM(ins.aas_on_cpu_avg               ) aas_on_cpu_avg
-- cpu demand details (HS hourly stats)
, SUM(ins.cas_on_cpu_and_resmgr_max    ) cas_on_cpu_and_resmgr_max
, SUM(ins.cas_on_cpu_max               ) cas_on_cpu_max
, SUM(ins.cas_on_cpu_and_resmgr_99p    ) cas_on_cpu_and_resmgr_99p
, SUM(ins.cas_on_cpu_99p               ) cas_on_cpu_99p
, SUM(ins.cas_on_cpu_and_resmgr_97p    ) cas_on_cpu_and_resmgr_97p
, SUM(ins.cas_on_cpu_97p               ) cas_on_cpu_97p
, SUM(ins.cas_on_cpu_and_resmgr_95p    ) cas_on_cpu_and_resmgr_95p
, SUM(ins.cas_on_cpu_95p               ) cas_on_cpu_95p
, SUM(ins.cas_on_cpu_and_resmgr_90p    ) cas_on_cpu_and_resmgr_90p
, SUM(ins.cas_on_cpu_90p               ) cas_on_cpu_90p
, SUM(ins.cas_on_cpu_and_resmgr_75p    ) cas_on_cpu_and_resmgr_75p
, SUM(ins.cas_on_cpu_75p               ) cas_on_cpu_75p
, SUM(ins.cas_on_cpu_and_resmgr_med    ) cas_on_cpu_and_resmgr_med
, SUM(ins.cas_on_cpu_med               ) cas_on_cpu_med
, SUM(ins.cas_on_cpu_and_resmgr_avg    ) cas_on_cpu_and_resmgr_avg
, SUM(ins.cas_on_cpu_avg               ) cas_on_cpu_avg
-- disk perf (IH instance history)
, SUM(ins.rw_iops_peak                 ) rw_iops_peak
, SUM(ins.r_iops_peak                  ) r_iops_peak
, SUM(ins.w_iops_peak                  ) w_iops_peak
, SUM(ins.rw_iops_999                  ) rw_iops_999
, SUM(ins.r_iops_999                   ) r_iops_999
, SUM(ins.w_iops_999                   ) w_iops_999
, SUM(ins.rw_iops_99                   ) rw_iops_99
, SUM(ins.r_iops_99                    ) r_iops_99
, SUM(ins.w_iops_99                    ) w_iops_99
, SUM(ins.rw_iops_97                   ) rw_iops_97
, SUM(ins.r_iops_97                    ) r_iops_97
, SUM(ins.w_iops_97                    ) w_iops_97
, SUM(ins.rw_iops_95                   ) rw_iops_95
, SUM(ins.r_iops_95                    ) r_iops_95
, SUM(ins.w_iops_95                    ) w_iops_95
, SUM(ins.rw_iops_90                   ) rw_iops_90
, SUM(ins.r_iops_90                    ) r_iops_90
, SUM(ins.w_iops_90                    ) w_iops_90
, SUM(ins.rw_iops_75                   ) rw_iops_75
, SUM(ins.r_iops_75                    ) r_iops_75
, SUM(ins.w_iops_75                    ) w_iops_75
, SUM(ins.rw_iops_median               ) rw_iops_median
, SUM(ins.r_iops_median                ) r_iops_median
, SUM(ins.w_iops_median                ) w_iops_median
, SUM(ins.rw_iops_avg                  ) rw_iops_avg
, SUM(ins.r_iops_avg                   ) r_iops_avg
, SUM(ins.w_iops_avg                   ) w_iops_avg
, SUM(ins.rw_mbps_peak                 ) rw_mbps_peak
, SUM(ins.r_mbps_peak                  ) r_mbps_peak
, SUM(ins.w_mbps_peak                  ) w_mbps_peak
, SUM(ins.rw_mbps_999                  ) rw_mbps_999
, SUM(ins.r_mbps_999                   ) r_mbps_999
, SUM(ins.w_mbps_999                   ) w_mbps_999
, SUM(ins.rw_mbps_99                   ) rw_mbps_99
, SUM(ins.r_mbps_99                    ) r_mbps_99
, SUM(ins.w_mbps_99                    ) w_mbps_99
, SUM(ins.rw_mbps_97                   ) rw_mbps_97
, SUM(ins.r_mbps_97                    ) r_mbps_97
, SUM(ins.w_mbps_97                    ) w_mbps_97
, SUM(ins.rw_mbps_95                   ) rw_mbps_95
, SUM(ins.r_mbps_95                    ) r_mbps_95
, SUM(ins.w_mbps_95                    ) w_mbps_95
, SUM(ins.rw_mbps_90                   ) rw_mbps_90
, SUM(ins.r_mbps_90                    ) r_mbps_90
, SUM(ins.w_mbps_90                    ) w_mbps_90
, SUM(ins.rw_mbps_75                   ) rw_mbps_75
, SUM(ins.r_mbps_75                    ) r_mbps_75
, SUM(ins.w_mbps_75                    ) w_mbps_75
, SUM(ins.rw_mbps_median               ) rw_mbps_median
, SUM(ins.r_mbps_median                ) r_mbps_median
, SUM(ins.w_mbps_median                ) w_mbps_median
, SUM(ins.rw_mbps_avg                  ) rw_mbps_avg
, SUM(ins.r_mbps_avg                   ) r_mbps_avg
, SUM(ins.w_mbps_avg                   ) w_mbps_avg
  FROM plan            pln,
       inst_per_plan_v ins
 WHERE ins.plan_id   = pln.plan_id
   AND ins.client_id = pln.client_id
 GROUP BY
  pln.plan_id
, pln.client_id
, pln.plan_name
, pln.plan_desc
, pln.cpu_method
, pln.cpu_statistic
, pln.include_resmgr_cpu_quantum
, pln.cap_to_num_cpus
, pln.disk_performance_method
, pln.disk_performance_statistic
, ins.host_name
, ins.client_name
, ins.client_desc;
--------------------------------------------------------
--  DDL for View HOST_PER_PLAN_V2
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "HOST_PER_PLAN_V2" ("CLIENT_ID", "PLAN_ID", "HOST_NAME", "EH_CPU_AND_RESMGR_MAX", "EH_CPU_MAX", "EH_CPU_AND_RESMGR_9999P", "EH_CPU_9999P", "EH_CPU_AND_RESMGR_999P", "EH_CPU_999P", "EH_CPU_AND_RESMGR_99P", "EH_CPU_99P", "EH_CPU_AND_RESMGR_97P", "EH_CPU_97P", "EH_CPU_AND_RESMGR_95P", "EH_CPU_95P", "EH_CPU_AND_RESMGR_90P", "EH_CPU_90P", "EH_CPU_AND_RESMGR_75P", "EH_CPU_75P", "EH_CPU_AND_RESMGR_MED", "EH_CPU_MED", "EH_CPU_AND_RESMGR_AVG", "EH_CPU_AVG", "HS_CPU_AND_RESMGR_MAX", "HS_CPU_MAX", "HS_CPU_AND_RESMGR_99P", "HS_CPU_99P", "HS_CPU_AND_RESMGR_97P", "HS_CPU_97P", "HS_CPU_AND_RESMGR_95P", "HS_CPU_95P", "HS_CPU_AND_RESMGR_90P", "HS_CPU_90P", "HS_CPU_AND_RESMGR_75P", "HS_CPU_75P", "HS_CPU_AND_RESMGR_MED", "HS_CPU_MED", "HS_CPU_AND_RESMGR_AVG", "HS_CPU_AVG", "CPUS_MANUAL_ENTRY", "INST_CPU_COUNT_SUM", "INST_CPU_COUNT_MAX", "HOST_NUM_CPUS", "HOST_NUM_CPU_CORES", "HOST_LOAD", "CPUS_REQUIRED", "IH_RW_IOPS_PEAK", "IH_R_IOPS_PEAK", "IH_W_IOPS_PEAK", "IH_RW_IOPS_999", "IH_R_IOPS_999", "IH_W_IOPS_999", "IH_RW_IOPS_99", "IH_R_IOPS_99", "IH_W_IOPS_99", "IH_RW_IOPS_97", "IH_R_IOPS_97", "IH_W_IOPS_97", "IH_RW_IOPS_95", "IH_R_IOPS_95", "IH_W_IOPS_95", "IH_RW_IOPS_90", "IH_R_IOPS_90", "IH_W_IOPS_90", "IH_RW_IOPS_75", "IH_R_IOPS_75", "IH_W_IOPS_75", "IH_RW_IOPS_MEDIAN", "IH_R_IOPS_MEDIAN", "IH_W_IOPS_MEDIAN", "IH_RW_IOPS_AVG", "IH_R_IOPS_AVG", "IH_W_IOPS_AVG", "RW_IOPS_MAN", "R_IOPS_MAN", "W_IOPS_MAN", "RW_IOPS_REQUIRED", "R_IOPS_REQUIRED", "W_IOPS_REQUIRED", "IH_RW_MBPS_PEAK", "IH_R_MBPS_PEAK", "IH_W_MBPS_PEAK", "IH_RW_MBPS_999", "IH_R_MBPS_999", "IH_W_MBPS_999", "IH_RW_MBPS_99", "IH_R_MBPS_99", "IH_W_MBPS_99", "IH_RW_MBPS_97", "IH_R_MBPS_97", "IH_W_MBPS_97", "IH_RW_MBPS_95", "IH_R_MBPS_95", "IH_W_MBPS_95", "IH_RW_MBPS_90", "IH_R_MBPS_90", "IH_W_MBPS_90", "IH_RW_MBPS_75", "IH_R_MBPS_75", "IH_W_MBPS_75", "IH_RW_MBPS_MEDIAN", "IH_R_MBPS_MEDIAN", "IH_W_MBPS_MEDIAN", "IH_RW_MBPS_AVG", "IH_R_MBPS_AVG", "IH_W_MBPS_AVG", "RW_MBPS_MAN", "R_MBPS_MAN", "W_MBPS_MAN", "RW_MBPS_REQUIRED", "R_MBPS_REQUIRED", "W_MBPS_REQUIRED") AS 
  SELECT
  client_id
, plan_id
, host_name
-- cpu demand details (EH entire history)
, aas_on_cpu_and_resmgr_peak   eh_cpu_and_resmgr_max
, aas_on_cpu_peak              eh_cpu_max
, aas_on_cpu_and_resmgr_9999   eh_cpu_and_resmgr_9999p
, aas_on_cpu_9999              eh_cpu_9999p
, aas_on_cpu_and_resmgr_999    eh_cpu_and_resmgr_999p
, aas_on_cpu_999               eh_cpu_999p
, aas_on_cpu_and_resmgr_99     eh_cpu_and_resmgr_99p
, aas_on_cpu_99                eh_cpu_99p
, aas_on_cpu_and_resmgr_97     eh_cpu_and_resmgr_97p
, aas_on_cpu_97                eh_cpu_97p
, aas_on_cpu_and_resmgr_95     eh_cpu_and_resmgr_95p
, aas_on_cpu_95                eh_cpu_95p
, aas_on_cpu_and_resmgr_90     eh_cpu_and_resmgr_90p
, aas_on_cpu_90                eh_cpu_90p
, aas_on_cpu_and_resmgr_75     eh_cpu_and_resmgr_75p
, aas_on_cpu_75                eh_cpu_75p
, aas_on_cpu_and_resmgr_median eh_cpu_and_resmgr_med
, aas_on_cpu_median            eh_cpu_med
, aas_on_cpu_and_resmgr_avg    eh_cpu_and_resmgr_avg
, aas_on_cpu_avg               eh_cpu_avg
-- cpu demand details (HS hourly stats)
, cas_on_cpu_and_resmgr_max    hs_cpu_and_resmgr_max
, cas_on_cpu_max               hs_cpu_max
, cas_on_cpu_and_resmgr_99p    hs_cpu_and_resmgr_99p
, cas_on_cpu_99p               hs_cpu_99p
, cas_on_cpu_and_resmgr_97p    hs_cpu_and_resmgr_97p
, cas_on_cpu_97p               hs_cpu_97p
, cas_on_cpu_and_resmgr_95p    hs_cpu_and_resmgr_95p
, cas_on_cpu_95p               hs_cpu_95p
, cas_on_cpu_and_resmgr_90p    hs_cpu_and_resmgr_90p
, cas_on_cpu_90p               hs_cpu_90p
, cas_on_cpu_and_resmgr_75p    hs_cpu_and_resmgr_75p
, cas_on_cpu_75p               hs_cpu_75p
, cas_on_cpu_and_resmgr_med    hs_cpu_and_resmgr_med
, cas_on_cpu_med               hs_cpu_med
, cas_on_cpu_and_resmgr_avg    hs_cpu_and_resmgr_avg
, cas_on_cpu_avg               hs_cpu_avg
-- cpu manual part
, aas_cpu_demand_man           cpus_manual_entry
-- cpu database and host metrics
, sum_cpu_count                inst_cpu_count_sum
, max_cpu_count                inst_cpu_count_max
, host_num_cpus
, host_num_cpu_cores
, host_load
-- cpu demand
, aas_cpu_demand               cpus_required
-- iops details (IH instance history)
, rw_iops_peak   ih_rw_iops_peak
, r_iops_peak    ih_r_iops_peak
, w_iops_peak    ih_w_iops_peak
, rw_iops_999    ih_rw_iops_999
, r_iops_999     ih_r_iops_999
, w_iops_999     ih_w_iops_999
, rw_iops_99     ih_rw_iops_99
, r_iops_99      ih_r_iops_99
, w_iops_99      ih_w_iops_99
, rw_iops_97     ih_rw_iops_97
, r_iops_97      ih_r_iops_97
, w_iops_97      ih_w_iops_97
, rw_iops_95     ih_rw_iops_95
, r_iops_95      ih_r_iops_95
, w_iops_95      ih_w_iops_95
, rw_iops_90     ih_rw_iops_90
, r_iops_90      ih_r_iops_90
, w_iops_90      ih_w_iops_90
, rw_iops_75     ih_rw_iops_75
, r_iops_75      ih_r_iops_75
, w_iops_75      ih_w_iops_75
, rw_iops_median ih_rw_iops_median
, r_iops_median  ih_r_iops_median
, w_iops_median  ih_w_iops_median
, rw_iops_avg    ih_rw_iops_avg
, r_iops_avg     ih_r_iops_avg
, w_iops_avg     ih_w_iops_avg
-- iops manual part
, rw_iops_man
, r_iops_man
, w_iops_man
-- iops demand
, rw_iops        rw_iops_required
, r_iops         r_iops_required
, w_iops         w_iops_required
-- mbps details (IH instance history)
, rw_mbps_peak   ih_rw_mbps_peak
, r_mbps_peak    ih_r_mbps_peak
, w_mbps_peak    ih_w_mbps_peak
, rw_mbps_999    ih_rw_mbps_999
, r_mbps_999     ih_r_mbps_999
, w_mbps_999     ih_w_mbps_999
, rw_mbps_99     ih_rw_mbps_99
, r_mbps_99      ih_r_mbps_99
, w_mbps_99      ih_w_mbps_99
, rw_mbps_97     ih_rw_mbps_97
, r_mbps_97      ih_r_mbps_97
, w_mbps_97      ih_w_mbps_97
, rw_mbps_95     ih_rw_mbps_95
, r_mbps_95      ih_r_mbps_95
, w_mbps_95      ih_w_mbps_95
, rw_mbps_90     ih_rw_mbps_90
, r_mbps_90      ih_r_mbps_90
, w_mbps_90      ih_w_mbps_90
, rw_mbps_75     ih_rw_mbps_75
, r_mbps_75      ih_r_mbps_75
, w_mbps_75      ih_w_mbps_75
, rw_mbps_median ih_rw_mbps_median
, r_mbps_median  ih_r_mbps_median
, w_mbps_median  ih_w_mbps_median
, rw_mbps_avg    ih_rw_mbps_avg
, r_mbps_avg     ih_r_mbps_avg
, w_mbps_avg     ih_w_mbps_avg
-- mbps manual part
, rw_mbps_man
, r_mbps_man
, w_mbps_man
-- mbps demand
, rw_mbps        rw_mbps_required
, r_mbps         r_mbps_required
, w_mbps         w_mbps_required
FROM host_per_plan_v;
--------------------------------------------------------
--  DDL for View HOST_PER_PLAN_V3
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "HOST_PER_PLAN_V3" ("PLAN_ID", "CLIENT_ID", "HOST_NAME", "HOST_NUM_CPUS", "HOST_NUM_CPU_CORES", "HOST_NUM_CPU_SOCKETS", "HOST_PHYSICAL_MEMORY_GB", "SPEC_ID", "HARDWARE_VENDOR", "SYSTEM", "NUM_CORES", "NUM_CHIPS", "NUM_CORES_PER_CHIP", "NUM_THREADS_PER_CORE", "PLATFORM_NAME", "INSTANCES", "MAX_CPU_COUNT", "SUM_CPU_COUNT", "CPU_DEMAND", "RESULT_PER_CORE", "CPU_DEMAND_WEIGHTED", "MEM_SIZE_GB", "RW_IOPS", "RW_MBPS") AS 
  SELECT
  plan_id
, client_id
, host_name
, host_num_cpus
, host_num_cpu_cores
, host_num_cpu_sockets
, host_physical_memory_gb
, spec_id
, hardware_vendor
, system
, num_cores
, num_chips
, num_cores_per_chip
, num_threads_per_core
, platform_name
, instances
, max_cpu_count
, sum_cpu_count
, NVL(aas_cpu_demand, 0) cpu_demand
, result_per_core
, NVL(aas_cpu_demand_spec, 0) cpu_demand_weighted
, NVL(mem_size_gb, 0) mem_size_gb
, NVL(rw_iops, 0) rw_iops
, NVL(rw_mbps, 0) rw_mbps
-- ids
  FROM host_per_plan_v
;
--------------------------------------------------------
--  DDL for View INST_ALLOC_V
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "INST_ALLOC_V" ("CLIENT_ID", "CLIENT_NAME", "PLAN_ID", "PLAN_NAME", "DBID", "DB_NAME", "DB_UNIQUE_NAME", "CONFIG_ID", "CONFIG_NAME", "CONFIG_DESC", "PLN_CFG_ID", "PLN_CFG_NAME", "SERVER_ID", "SRV_NODE", "SRF_NODE", "NODE_LAYOUT", "NODE_LAYOUT_DESC", "INST_ALLOC_ID", "INST_ALLOC_ID_F", "DB_ALLOC_ID", "PLN_DB_ID", "IAL_NUM_CPU_SPEC", "IAL_NUM_CPU_PERC", "IAL_NUM_CPU", "IAL_MEM_SIZE_GB", "IAL_MEM_SIZE_PERC", "DBS_CPU_DEMAND", "DBS_CPU_DEMAND_SPEC", "DBS_MEM_SIZE_GB", "DBS_DATABASE_SIZE_GB", "DBS_RW_IOPS", "DBS_R_IOPS", "DBS_W_IOPS", "DBS_RW_MBPS", "DBS_R_MBPS", "DBS_W_MBPS", "SRV_NUM_CPUS", "SRV_MEMORY_SIZE_GB", "SRV_DISK_SIZE_RAW_GB", "SRV_RW_IOPS", "SRV_R_IOPS", "SRV_W_IOPS", "SRV_RW_MBPS", "SRV_R_MBPS", "SRV_W_MBPS", "CAP_NUM_CPU", "CAP_NUM_CPU_SPEC", "CAP_MEM_SIZE_GB", "CAP_DISK_SIZE_GB", "CAP_RW_IOPS", "CAP_R_IOPS", "CAP_W_IOPS", "CAP_RW_MBPS", "CAP_R_MBPS", "CAP_W_MBPS") AS 
  SELECT
-- client
  client_id
, client_name
-- plan
, plan_id
, plan_name
-- db
, dbid
, db_name
, db_unique_name
-- configuration
, config_id
, config_name
, config_desc
-- configuration per plan
, pln_cfg_id
, pln_cfg_name
-- server
, server_id
, srv_node
, srf_node /* fail over */
, node_layout  /* (P)rimary, (F)ailover or e(X)cluded */
, node_layout_desc
-- allocation
, inst_alloc_id
, inst_alloc_id_f
, db_alloc_id
, pln_db_id
-- instance allocated
, NVL(ial_num_cpu_spec, 0)  ial_num_cpu_spec
, NVL(ial_num_cpu_perc, 0)  ial_num_cpu_perc
, NVL(ial_num_cpu, 0)       ial_num_cpu
, NVL(ial_mem_size_gb, 0)   ial_mem_size_gb
, NVL(ial_mem_size_perc, 0) ial_mem_size_perc
-- requirements
, dbs_cpu_demand
, dbs_cpu_demand_spec
, dbs_mem_size_gb
, dbs_database_size_gb
, dbs_rw_iops
, dbs_r_iops
, dbs_w_iops
, dbs_rw_mbps
, dbs_r_mbps
, dbs_w_mbps
-- raw server capacity
, srv_num_cpus
, srv_memory_size_gb
, srv_disk_size_raw_gb
, srv_rw_iops
, srv_r_iops
, srv_w_iops
, srv_rw_mbps
, srv_r_mbps
, srv_w_mbps
-- adjusted capacity
, cap_num_cpu
, cap_num_cpu_spec
, cap_mem_size_gb
, cap_disk_size_gb
, cap_rw_iops
, cap_r_iops
, cap_w_iops
, cap_rw_mbps
, cap_r_mbps
, cap_w_mbps
  FROM inst_allocation_v;
--------------------------------------------------------
--  DDL for View INST_ALLOC_V2
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "INST_ALLOC_V2" ("CLIENT_ID", "CLIENT_NAME", "PLAN_ID", "PLAN_NAME", "DBID", "DB_NAME", "DB_UNIQUE_NAME", "CONFIG_ID", "CONFIG_NAME", "CONFIG_DESC", "PLN_CFG_ID", "PLN_CFG_NAME", "SRV_NODE", "NODE_LAYOUT", "NODE_LAYOUT_DESC", "SERVER_ID", "FAIL_OVER_SERVER_ID", "CPU_PERC_ALLOCATED", "MEM_PERC_ALLOCATED", "NUM_CPU_ALLOCATED", "MEM_SIZE_GB_ALLOCATED", "N1", "N2", "N3", "N4", "N5", "N6", "N7", "N8") AS 
  SELECT
-- client
  client_id
, client_name
-- plan
, plan_id
, plan_name
-- db
, dbid
, db_name
, db_unique_name
-- configuration
, config_id
, config_name
, config_desc
-- configuration per plan
, pln_cfg_id
, pln_cfg_name
-- server
, srv_node
, node_layout  /* (P)rimary, (F)ailover or e(X)cluded */
, node_layout_desc
, server_id
, srf_node fail_over_server_id
-- allocation
, ial_num_cpu_perc  cpu_perc_allocated
, ial_mem_size_perc mem_perc_allocated
, ial_num_cpu       num_cpu_allocated
, ial_mem_size_gb   mem_size_gb_allocated
-- node map
, DECODE(srv_node, 1, LPAD(ial_num_cpu,2,'0')||':'||LPAD(ial_mem_size_gb,3,'0')) n1
, DECODE(srv_node, 2, LPAD(ial_num_cpu,2,'0')||':'||LPAD(ial_mem_size_gb,3,'0')) n2
, DECODE(srv_node, 3, LPAD(ial_num_cpu,2,'0')||':'||LPAD(ial_mem_size_gb,3,'0')) n3
, DECODE(srv_node, 4, LPAD(ial_num_cpu,2,'0')||':'||LPAD(ial_mem_size_gb,3,'0')) n4
, DECODE(srv_node, 5, LPAD(ial_num_cpu,2,'0')||':'||LPAD(ial_mem_size_gb,3,'0')) n5
, DECODE(srv_node, 6, LPAD(ial_num_cpu,2,'0')||':'||LPAD(ial_mem_size_gb,3,'0')) n6
, DECODE(srv_node, 7, LPAD(ial_num_cpu,2,'0')||':'||LPAD(ial_mem_size_gb,3,'0')) n7
, DECODE(srv_node, 8, LPAD(ial_num_cpu,2,'0')||':'||LPAD(ial_mem_size_gb,3,'0')) n8
  FROM inst_alloc_v;
--------------------------------------------------------
--  DDL for View INST_ALLOCATION_V
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "INST_ALLOCATION_V" ("INST_ALLOC_ID", "DB_ALLOC_ID", "SERVER_ID", "NODE_LAYOUT", "NODE_LAYOUT_DESC", "INST_ALLOC_ID_F", "PLN_DB_ID", "PLN_CFG_ID", "PLAN_ID", "CLIENT_ID", "CLIENT_NAME", "CLIENT_DESC", "PLAN_NAME", "PLAN_DESC", "DB_ID", "SOURCE_INSTANCES", "TARGET_INSTANCES", "ALLOCATED_INSTANCES", "DBID", "DB_NAME", "DB_UNIQUE_NAME", "PLATFORM_NAME", "VERSION", "HOST_NAME_SRC", "DB_DESC", "CLUSTER_NAME", "DB_GROUP", "DB_TYPE", "EADAM_SEQ_ID", "TAR_FILE_NAME", "COLLECTION_KEY", "COLLECTION_DATE", "LOAD_DATE", "DBS_CPU_DEMAND", "DBS_MEM_SIZE_GB", "DBS_SGA_SIZE_GB", "DBS_PGA_SIZE_GB", "DBS_DATABASE_SIZE_GB", "DBS_RW_IOPS", "DBS_R_IOPS", "DBS_W_IOPS", "DBS_RW_MBPS", "DBS_R_MBPS", "DBS_W_MBPS", "DBS_CPU_DEMAND_SPEC", "CONFIG_ID", "PLN_CFG_NAME", "REDUNDANCY_LEVEL", "THREAD_EFFICIENCY", "NUM_CPUS_ADJ", "MEMORY_ADJ", "DISK_SIZE_ADJ", "OFFLOADING_ADJ", "COMPRESSION_ADJ", "BACKUP_ADJ", "R_IOPS_ADJ", "W_IOPS_ADJ", "R_MBPS_ADJ", "W_MBPS_ADJ", "CONFIG_NAME", "CONFIG_DESC", "SRV_NODE", "SRF_NODE", "SRV_NUM_CPUS", "SRV_MEMORY_SIZE_GB", "SRV_DISK_SIZE_RAW_GB", "SRV_RW_IOPS", "SRV_R_IOPS", "SRV_W_IOPS", "SRV_RW_MBPS", "SRV_R_MBPS", "SRV_W_MBPS", "SRV_SPEC_ID", "SRV_VERSION_DATE", "SRV_HARDWARE_VENDOR", "SRV_SYSTEM", "SRV_NUM_CORES", "SRV_NUM_CHIPS", "SRV_NUM_CORES_PER_CHIP", "SRV_NUM_THREADS_PER_CORE", "SRV_BASELINE", "SRV_RESULT", "SRV_RESULT_PER_CORE", "SRV_NUM_CPUS_SPEC", "CAP_NUM_CPU", "CAP_MEM_SIZE_GB", "CAP_DISK_SIZE_GB", "CAP_RW_IOPS", "CAP_R_IOPS", "CAP_W_IOPS", "CAP_RW_MBPS", "CAP_R_MBPS", "CAP_W_MBPS", "CAP_RESULT_PER_CORE", "CAP_NUM_CPU_SPEC", "IAL_NUM_CPU_SPEC", "IAL_NUM_CPU_PERC", "IAL_NUM_CPU", "IAL_MEM_SIZE_GB", "IAL_MEM_SIZE_PERC") AS 
  SELECT
  ial.inst_alloc_id
, ial.db_alloc_id
, ial.server_id
, ial.node_layout  /* (P)rimary, (F)ailover or e(X)cluded */
, CASE ial.node_layout WHEN 'P' THEN 'Primary' WHEN 'F' THEN 'Failover' WHEN 'X' THEN 'Excluded' END node_layout_desc
, ial.inst_alloc_id_f
, dal.pln_db_id
, dal.pln_cfg_id
, dal.plan_id
-- database per plan
, dbp.client_id
, dbp.client_name
, dbp.client_desc
, dbp.plan_name
, dbp.plan_desc
, dbp.db_id
, dbp.source_instances
, dbp.target_instances
, dal.allocated_instances
, dbp.dbid
, dbp.db_name
, dbp.db_unique_name
, dbp.platform_name
, dbp.version
, dbp.host_name_src
, dbp.db_desc
, dbp.cluster_name
, dbp.db_group
, dbp.db_type
, dbp.eadam_seq_id
, dbp.tar_file_name
, dbp.collection_key
, dbp.collection_date
, dbp.load_date
-- requirements
, dbp.aas_cpu_demand dbs_cpu_demand
, dbp.mem_size_gb dbs_mem_size_gb
, dbp.sga_size_gb dbs_sga_size_gb
, dbp.pga_size_gb dbs_pga_size_gb
, dbp.database_size_gb dbs_database_size_gb
, dbp.rw_iops dbs_rw_iops
, dbp.r_iops dbs_r_iops
, dbp.w_iops dbs_w_iops
, dbp.rw_mbps dbs_rw_mbps
, dbp.r_mbps dbs_r_mbps
, dbp.w_mbps dbs_w_mbps
, dbp.aas_cpu_demand_spec dbs_cpu_demand_spec
-- configuration per plan
, srp.config_id
, srp.pln_cfg_name
-- scaling factors
, srp.redundancy_level
, srp.thread_efficiency
, srp.num_cpus_adj
, srp.memory_adj
, srp.disk_size_adj
, srp.offloading_adj
, srp.compression_adj
, srp.backup_adj
, srp.r_iops_adj
, srp.w_iops_adj
, srp.r_mbps_adj
, srp.w_mbps_adj
-- configuration
, srp.config_name
, srp.config_desc
-- server
, srp.node srv_node /* primary */
, srf.node srf_node /* fail over */
-- raw server capacity
, srp.num_cpus srv_num_cpus
, srp.memory_size_gb srv_memory_size_gb
, srp.disk_size_raw_gb srv_disk_size_raw_gb
, srp.rw_iops srv_rw_iops
, srp.r_iops srv_r_iops
, srp.w_iops srv_w_iops
, srp.rw_mbps srv_rw_mbps
, srp.r_mbps srv_r_mbps
, srp.w_mbps srv_w_mbps
-- spec
, srp.spec_id srv_spec_id
, srp.version_date srv_version_date
, srp.hardware_vendor srv_hardware_vendor
, srp.system srv_system
, srp.num_cores srv_num_cores
, srp.num_chips srv_num_chips
, srp.num_cores_per_chip srv_num_cores_per_chip
, srp.num_threads_per_core srv_num_threads_per_core
, srp.baseline srv_baseline
, srp.result srv_result
, srp.result_per_core srv_result_per_core
, srp.num_cpus_spec srv_num_cpus_spec
-- adjusted capacity
, srp.cap_num_cpu
, srp.cap_mem_size_gb
, srp.cap_disk_size_gb
, srp.cap_rw_iops
, srp.cap_r_iops
, srp.cap_w_iops
, srp.cap_rw_mbps
, srp.cap_r_mbps
, srp.cap_w_mbps
, srp.cap_result_per_core
, srp.cap_num_cpu_spec
-- instance allocated
, ROUND(dbp.aas_cpu_demand_spec / DECODE(dal.allocated_instances, 0, dbp.target_instances, dal.allocated_instances)) ial_num_cpu_spec
, ROUND(100 * dbp.aas_cpu_demand_spec / DECODE(dal.allocated_instances, 0, dbp.target_instances, dal.allocated_instances) / srp.cap_num_cpu_spec, 1) ial_num_cpu_perc
, ROUND(dbp.aas_cpu_demand_spec * srp.cap_num_cpu / DECODE(dal.allocated_instances, 0, dbp.target_instances, dal.allocated_instances) / srp.cap_num_cpu_spec) ial_num_cpu
--,        ROUND((dbp.sga_size_gb / dbp.target_instances) + (dbp.pga_size_gb / DECODE(dal.allocated_instances, 0, dbp.target_instances, dal.allocated_instances))) ial_mem_size_gb
--, ROUND(100 * ((dbp.sga_size_gb / dbp.target_instances) + (dbp.pga_size_gb / DECODE(dal.allocated_instances, 0, dbp.target_instances, dal.allocated_instances))) / srp.cap_mem_size_gb, 1) ial_mem_size_perc
,        ROUND((dbp.sga_size_gb + dbp.pga_size_gb) / GREATEST(1, LEAST(dal.allocated_instances, dbp.target_instances, dbp.source_instances))) ial_mem_size_gb
, ROUND(100 * ((dbp.sga_size_gb + dbp.pga_size_gb) / GREATEST(1, LEAST(dal.allocated_instances, dbp.target_instances, dbp.source_instances))) / srp.cap_mem_size_gb, 1) ial_mem_size_perc
  FROM inst_allocation ial,
       inst_allocation iaf,
       db_allocation_v dal,
       db_per_plan_v   dbp,
       serv_per_plan_v srp,
       server          srf
 WHERE iaf.inst_alloc_id(+) = ial.inst_alloc_id_f
   AND dal.db_alloc_id      = ial.db_alloc_id
   AND dbp.pln_db_id        = dal.pln_db_id
   AND dbp.plan_id          = dal.plan_id
   AND srp.pln_cfg_id       = dal.pln_cfg_id
   AND srp.server_id        = ial.server_id
   AND srp.server_type      IN ('C', 'H')
   AND srp.plan_id          = dbp.plan_id
   AND srp.client_id        = dbp.client_id
   AND srf.server_id(+)     = iaf.server_id;
--------------------------------------------------------
--  DDL for View INST_PER_PLAN_V
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "INST_PER_PLAN_V" ("PLAN_ID", "CLIENT_ID", "PLAN_NAME", "PLAN_DESC", "PLN_DB_ID", "DB_ID", "INST_ID", "HOST_NAME", "INSTANCE_NUMBER", "INSTANCE_NAME", "CPU_COUNT", "HOST_NUM_CPUS", "HOST_NUM_CPU_CORES", "HOST_NUM_CPU_SOCKETS", "HOST_LOAD", "HOST_PHYSICAL_MEMORY_GB", "AAS_CPU_DEMAND", "MEM_SIZE_GB", "SGA_SIZE_GB", "PGA_SIZE_GB", "RW_IOPS", "R_IOPS", "W_IOPS", "RW_MBPS", "R_MBPS", "W_MBPS", "SPEC_ID", "VERSION_DATE", "HARDWARE_VENDOR", "SYSTEM", "NUM_CORES", "NUM_CHIPS", "NUM_CORES_PER_CHIP", "NUM_THREADS_PER_CORE", "BASELINE", "RESULT", "RESULT_PER_CORE", "AAS_CPU_DEMAND_SPEC", "DBID", "DB_NAME", "DB_UNIQUE_NAME", "PLATFORM_NAME", "VERSION", "HOST_NAME_SRC", "DB_DESC", "CLUSTER_NAME", "DB_GROUP", "DB_TYPE", "EADAM_SEQ_ID", "COLLECTION_KEY", "COLLECTION_DATE", "LOAD_DATE", "CLIENT_NAME", "CLIENT_DESC", "TAR_FILE_NAME", "AAS_CPU_DEMAND_MAN", "RW_IOPS_MAN", "R_IOPS_MAN", "W_IOPS_MAN", "RW_MBPS_MAN", "R_MBPS_MAN", "W_MBPS_MAN", "AAS_ON_CPU_AND_RESMGR_PEAK", "AAS_ON_CPU_PEAK", "AAS_ON_CPU_AND_RESMGR_9999", "AAS_ON_CPU_9999", "AAS_ON_CPU_AND_RESMGR_999", "AAS_ON_CPU_999", "AAS_ON_CPU_AND_RESMGR_99", "AAS_ON_CPU_99", "AAS_ON_CPU_AND_RESMGR_97", "AAS_ON_CPU_97", "AAS_ON_CPU_AND_RESMGR_95", "AAS_ON_CPU_95", "AAS_ON_CPU_AND_RESMGR_90", "AAS_ON_CPU_90", "AAS_ON_CPU_AND_RESMGR_75", "AAS_ON_CPU_75", "AAS_ON_CPU_AND_RESMGR_MEDIAN", "AAS_ON_CPU_MEDIAN", "AAS_ON_CPU_AND_RESMGR_AVG", "AAS_ON_CPU_AVG", "CAS_ON_CPU_AND_RESMGR_MAX", "CAS_ON_CPU_MAX", "CAS_ON_CPU_AND_RESMGR_99P", "CAS_ON_CPU_99P", "CAS_ON_CPU_AND_RESMGR_97P", "CAS_ON_CPU_97P", "CAS_ON_CPU_AND_RESMGR_95P", "CAS_ON_CPU_95P", "CAS_ON_CPU_AND_RESMGR_90P", "CAS_ON_CPU_90P", "CAS_ON_CPU_AND_RESMGR_75P", "CAS_ON_CPU_75P", "CAS_ON_CPU_AND_RESMGR_MED", "CAS_ON_CPU_MED", "CAS_ON_CPU_AND_RESMGR_AVG", "CAS_ON_CPU_AVG", "RW_IOPS_PEAK", "R_IOPS_PEAK", "W_IOPS_PEAK", "RW_IOPS_999", "R_IOPS_999", "W_IOPS_999", "RW_IOPS_99", "R_IOPS_99", "W_IOPS_99", "RW_IOPS_97", "R_IOPS_97", "W_IOPS_97", "RW_IOPS_95", "R_IOPS_95", "W_IOPS_95", "RW_IOPS_90", "R_IOPS_90", "W_IOPS_90", "RW_IOPS_75", "R_IOPS_75", "W_IOPS_75", "RW_IOPS_MEDIAN", "R_IOPS_MEDIAN", "W_IOPS_MEDIAN", "RW_IOPS_AVG", "R_IOPS_AVG", "W_IOPS_AVG", "RW_MBPS_PEAK", "R_MBPS_PEAK", "W_MBPS_PEAK", "RW_MBPS_999", "R_MBPS_999", "W_MBPS_999", "RW_MBPS_99", "R_MBPS_99", "W_MBPS_99", "RW_MBPS_97", "R_MBPS_97", "W_MBPS_97", "RW_MBPS_95", "R_MBPS_95", "W_MBPS_95", "RW_MBPS_90", "R_MBPS_90", "W_MBPS_90", "RW_MBPS_75", "R_MBPS_75", "W_MBPS_75", "RW_MBPS_MEDIAN", "R_MBPS_MEDIAN", "W_MBPS_MEDIAN", "RW_MBPS_AVG", "R_MBPS_AVG", "W_MBPS_AVG") AS 
  SELECT
  pln.plan_id
, pln.client_id
, pln.plan_name
, pln.plan_desc
, dbp.pln_db_id
, dbp.db_id
, ins.inst_id
, ins.host_name
, ins.instance_number
, ins.instance_name
, ins.cpu_count
, ins.host_num_cpus
, ins.host_num_cpu_cores
, ins.host_num_cpu_sockets
, ins.host_load
, ins.host_physical_memory_gb
, CASE
  WHEN pln.cpu_method = 'MA' THEN ins.aas_cpu_demand
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = 'PEAK' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.aas_on_cpu_peak > 0 THEN LEAST(ins.cpu_count, ins.aas_on_cpu_peak)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = 'PEAK' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND ins.aas_on_cpu_peak > 0 THEN ins.aas_on_cpu_peak
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = 'PEAK' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.aas_on_cpu_and_resmgr_peak > 0 THEN LEAST(ins.cpu_count, ins.aas_on_cpu_and_resmgr_peak)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = 'PEAK' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND ins.aas_on_cpu_and_resmgr_peak > 0 THEN ins.aas_on_cpu_and_resmgr_peak
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '99.99' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.aas_on_cpu_9999 > 0 THEN LEAST(ins.cpu_count, ins.aas_on_cpu_9999)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '99.99' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND ins.aas_on_cpu_9999 > 0 THEN ins.aas_on_cpu_9999
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '99.99' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.aas_on_cpu_and_resmgr_9999 > 0 THEN LEAST(ins.cpu_count, ins.aas_on_cpu_and_resmgr_9999)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '99.99' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND ins.aas_on_cpu_and_resmgr_9999 > 0 THEN ins.aas_on_cpu_and_resmgr_9999
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '99.9' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.aas_on_cpu_999 > 0 THEN LEAST(ins.cpu_count, ins.aas_on_cpu_999)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '99.9' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND ins.aas_on_cpu_999 > 0 THEN ins.aas_on_cpu_999
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '99.9' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.aas_on_cpu_and_resmgr_999 > 0 THEN LEAST(ins.cpu_count, ins.aas_on_cpu_and_resmgr_999)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '99.9' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND ins.aas_on_cpu_and_resmgr_999 > 0 THEN ins.aas_on_cpu_and_resmgr_999
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '99' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.aas_on_cpu_99 > 0 THEN LEAST(ins.cpu_count, ins.aas_on_cpu_99)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '99' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND ins.aas_on_cpu_99 > 0 THEN ins.aas_on_cpu_99
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '99' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.aas_on_cpu_and_resmgr_99 > 0 THEN LEAST(ins.cpu_count, ins.aas_on_cpu_and_resmgr_99)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '99' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND ins.aas_on_cpu_and_resmgr_99 > 0 THEN ins.aas_on_cpu_and_resmgr_99
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '97' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.aas_on_cpu_97 > 0 THEN LEAST(ins.cpu_count, ins.aas_on_cpu_97)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '97' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND ins.aas_on_cpu_97 > 0 THEN ins.aas_on_cpu_97
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '97' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.aas_on_cpu_and_resmgr_97 > 0 THEN LEAST(ins.cpu_count, ins.aas_on_cpu_and_resmgr_97)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '97' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND ins.aas_on_cpu_and_resmgr_97 > 0 THEN ins.aas_on_cpu_and_resmgr_97
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '95' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.aas_on_cpu_95 > 0 THEN LEAST(ins.cpu_count, ins.aas_on_cpu_95)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '95' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND ins.aas_on_cpu_95 > 0 THEN ins.aas_on_cpu_95
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '95' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.aas_on_cpu_and_resmgr_95 > 0 THEN LEAST(ins.cpu_count, ins.aas_on_cpu_and_resmgr_95)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '95' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND ins.aas_on_cpu_and_resmgr_95 > 0 THEN ins.aas_on_cpu_and_resmgr_95
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '90' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.aas_on_cpu_90 > 0 THEN LEAST(ins.cpu_count, ins.aas_on_cpu_90)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '90' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND ins.aas_on_cpu_90 > 0 THEN ins.aas_on_cpu_90
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '90' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.aas_on_cpu_and_resmgr_90 > 0 THEN LEAST(ins.cpu_count, ins.aas_on_cpu_and_resmgr_90)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '90' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND ins.aas_on_cpu_and_resmgr_90 > 0 THEN ins.aas_on_cpu_and_resmgr_90
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '75' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.aas_on_cpu_75 > 0 THEN LEAST(ins.cpu_count, ins.aas_on_cpu_75)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '75' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND ins.aas_on_cpu_75 > 0 THEN ins.aas_on_cpu_75
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '75' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.aas_on_cpu_and_resmgr_75 > 0 THEN LEAST(ins.cpu_count, ins.aas_on_cpu_and_resmgr_75)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '75' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND ins.aas_on_cpu_and_resmgr_75 > 0 THEN ins.aas_on_cpu_and_resmgr_75
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = 'MEDIAN' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.aas_on_cpu_median > 0 THEN LEAST(ins.cpu_count, ins.aas_on_cpu_median)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = 'MEDIAN' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND ins.aas_on_cpu_median > 0 THEN ins.aas_on_cpu_median
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = 'MEDIAN' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.aas_on_cpu_and_resmgr_median > 0 THEN LEAST(ins.cpu_count, ins.aas_on_cpu_and_resmgr_median)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = 'MEDIAN' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND ins.aas_on_cpu_and_resmgr_median > 0 THEN ins.aas_on_cpu_and_resmgr_median
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = 'AVG' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.aas_on_cpu_avg > 0 THEN LEAST(ins.cpu_count, ins.aas_on_cpu_avg)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = 'AVG' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND ins.aas_on_cpu_avg > 0 THEN ins.aas_on_cpu_avg
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = 'AVG' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.aas_on_cpu_and_resmgr_avg > 0 THEN LEAST(ins.cpu_count, ins.aas_on_cpu_and_resmgr_avg)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = 'AVG' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND ins.aas_on_cpu_and_resmgr_avg > 0 THEN ins.aas_on_cpu_and_resmgr_avg
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = 'PEAK' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.cas_on_cpu_max > 0 THEN LEAST(ins.cpu_count, ins.cas_on_cpu_max)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = 'PEAK' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND ins.cas_on_cpu_max > 0 THEN ins.cas_on_cpu_max
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = 'PEAK' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.cas_on_cpu_and_resmgr_max > 0 THEN LEAST(ins.cpu_count, ins.cas_on_cpu_and_resmgr_max)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = 'PEAK' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND ins.cas_on_cpu_and_resmgr_max > 0 THEN ins.cas_on_cpu_and_resmgr_max
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '99' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.cas_on_cpu_99p > 0 THEN LEAST(ins.cpu_count, ins.cas_on_cpu_99p)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '99' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND ins.cas_on_cpu_99p > 0 THEN ins.cas_on_cpu_99p
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '99' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.cas_on_cpu_and_resmgr_99p > 0 THEN LEAST(ins.cpu_count, ins.cas_on_cpu_and_resmgr_99p)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '99' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND ins.cas_on_cpu_and_resmgr_99p > 0 THEN ins.cas_on_cpu_and_resmgr_99p
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '97' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.cas_on_cpu_97p > 0 THEN LEAST(ins.cpu_count, ins.cas_on_cpu_97p)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '97' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND ins.cas_on_cpu_97p > 0 THEN ins.cas_on_cpu_97p
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '97' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.cas_on_cpu_and_resmgr_97p > 0 THEN LEAST(ins.cpu_count, ins.cas_on_cpu_and_resmgr_97p)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '97' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND ins.cas_on_cpu_and_resmgr_97p > 0 THEN ins.cas_on_cpu_and_resmgr_97p
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '95' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.cas_on_cpu_95p > 0 THEN LEAST(ins.cpu_count, ins.cas_on_cpu_95p)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '95' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND ins.cas_on_cpu_95p > 0 THEN ins.cas_on_cpu_95p
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '95' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.cas_on_cpu_and_resmgr_95p > 0 THEN LEAST(ins.cpu_count, ins.cas_on_cpu_and_resmgr_95p)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '95' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND ins.cas_on_cpu_and_resmgr_95p > 0 THEN ins.cas_on_cpu_and_resmgr_95p
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '90' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.cas_on_cpu_90p > 0 THEN LEAST(ins.cpu_count, ins.cas_on_cpu_90p)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '90' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND ins.cas_on_cpu_90p > 0 THEN ins.cas_on_cpu_90p
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '90' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.cas_on_cpu_and_resmgr_90p > 0 THEN LEAST(ins.cpu_count, ins.cas_on_cpu_and_resmgr_90p)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '90' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND ins.cas_on_cpu_and_resmgr_90p > 0 THEN ins.cas_on_cpu_and_resmgr_90p
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '75' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.cas_on_cpu_75p > 0 THEN LEAST(ins.cpu_count, ins.cas_on_cpu_75p)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '75' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND ins.cas_on_cpu_75p > 0 THEN ins.cas_on_cpu_75p
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '75' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.cas_on_cpu_and_resmgr_75p > 0 THEN LEAST(ins.cpu_count, ins.cas_on_cpu_and_resmgr_75p)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '75' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND ins.cas_on_cpu_and_resmgr_75p > 0 THEN ins.cas_on_cpu_and_resmgr_75p
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = 'MEDIAN' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.cas_on_cpu_med > 0 THEN LEAST(ins.cpu_count, ins.cas_on_cpu_med)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = 'MEDIAN' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND ins.cas_on_cpu_med > 0 THEN ins.cas_on_cpu_med
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = 'MEDIAN' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.cas_on_cpu_and_resmgr_med > 0 THEN LEAST(ins.cpu_count, ins.cas_on_cpu_and_resmgr_med)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = 'MEDIAN' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND ins.cas_on_cpu_and_resmgr_med > 0 THEN ins.cas_on_cpu_and_resmgr_med
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = 'AVG' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.cas_on_cpu_avg > 0 THEN LEAST(ins.cpu_count, ins.cas_on_cpu_avg)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = 'AVG' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND ins.cas_on_cpu_avg > 0 THEN ins.cas_on_cpu_avg
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = 'AVG' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.cas_on_cpu_and_resmgr_avg > 0 THEN LEAST(ins.cpu_count, ins.cas_on_cpu_and_resmgr_avg)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = 'AVG' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND ins.cas_on_cpu_and_resmgr_avg > 0 THEN ins.cas_on_cpu_and_resmgr_avg
  ELSE ins.aas_cpu_demand
  END aas_cpu_demand
, ins.mem_size_gb
, ins.sga_size_gb
, ins.pga_size_gb
, CASE
  WHEN pln.disk_performance_method = 'MA' THEN ins.rw_iops
  WHEN pln.disk_performance_statistic = 'PEAK' THEN ins.rw_iops_peak
  WHEN pln.disk_performance_statistic = '99.9' THEN ins.rw_iops_999
  WHEN pln.disk_performance_statistic = '99' THEN ins.rw_iops_99
  WHEN pln.disk_performance_statistic = '97' THEN ins.rw_iops_97
  WHEN pln.disk_performance_statistic = '95' THEN ins.rw_iops_95
  WHEN pln.disk_performance_statistic = '90' THEN ins.rw_iops_90
  WHEN pln.disk_performance_statistic = '75' THEN ins.rw_iops_75
  WHEN pln.disk_performance_statistic = 'MEDIAN' THEN ins.rw_iops_median
  WHEN pln.disk_performance_statistic = 'AVG' THEN ins.rw_iops_avg
  ELSE ins.rw_iops
  END rw_iops
, CASE
  WHEN pln.disk_performance_method = 'MA' THEN ins.r_iops
  WHEN pln.disk_performance_statistic = 'PEAK' THEN ins.r_iops_peak
  WHEN pln.disk_performance_statistic = '99.9' THEN ins.r_iops_999
  WHEN pln.disk_performance_statistic = '99' THEN ins.r_iops_99
  WHEN pln.disk_performance_statistic = '97' THEN ins.r_iops_97
  WHEN pln.disk_performance_statistic = '95' THEN ins.r_iops_95
  WHEN pln.disk_performance_statistic = '90' THEN ins.r_iops_90
  WHEN pln.disk_performance_statistic = '75' THEN ins.r_iops_75
  WHEN pln.disk_performance_statistic = 'MEDIAN' THEN ins.r_iops_median
  WHEN pln.disk_performance_statistic = 'AVG' THEN ins.r_iops_avg
  ELSE ins.r_iops
  END r_iops
, CASE
  WHEN pln.disk_performance_method = 'MA' THEN ins.w_iops
  WHEN pln.disk_performance_statistic = 'PEAK' THEN ins.w_iops_peak
  WHEN pln.disk_performance_statistic = '99.9' THEN ins.w_iops_999
  WHEN pln.disk_performance_statistic = '99' THEN ins.w_iops_99
  WHEN pln.disk_performance_statistic = '97' THEN ins.w_iops_97
  WHEN pln.disk_performance_statistic = '95' THEN ins.w_iops_95
  WHEN pln.disk_performance_statistic = '90' THEN ins.w_iops_90
  WHEN pln.disk_performance_statistic = '75' THEN ins.w_iops_75
  WHEN pln.disk_performance_statistic = 'MEDIAN' THEN ins.w_iops_median
  WHEN pln.disk_performance_statistic = 'AVG' THEN ins.w_iops_avg
  ELSE ins.w_iops
  END w_iops
, CASE
  WHEN pln.disk_performance_method = 'MA' THEN ins.rw_mbps
  WHEN pln.disk_performance_statistic = 'PEAK' THEN ins.rw_mbps_peak
  WHEN pln.disk_performance_statistic = '99.9' THEN ins.rw_mbps_999
  WHEN pln.disk_performance_statistic = '99' THEN ins.rw_mbps_99
  WHEN pln.disk_performance_statistic = '97' THEN ins.rw_mbps_97
  WHEN pln.disk_performance_statistic = '95' THEN ins.rw_mbps_95
  WHEN pln.disk_performance_statistic = '90' THEN ins.rw_mbps_90
  WHEN pln.disk_performance_statistic = '75' THEN ins.rw_mbps_75
  WHEN pln.disk_performance_statistic = 'MEDIAN' THEN ins.rw_mbps_median
  WHEN pln.disk_performance_statistic = 'AVG' THEN ins.rw_mbps_avg
  ELSE ins.rw_mbps
  END rw_mbps
, CASE
  WHEN pln.disk_performance_method = 'MA' THEN ins.r_mbps
  WHEN pln.disk_performance_statistic = 'PEAK' THEN ins.r_mbps_peak
  WHEN pln.disk_performance_statistic = '99.9' THEN ins.r_mbps_999
  WHEN pln.disk_performance_statistic = '99' THEN ins.r_mbps_99
  WHEN pln.disk_performance_statistic = '97' THEN ins.r_mbps_97
  WHEN pln.disk_performance_statistic = '95' THEN ins.r_mbps_95
  WHEN pln.disk_performance_statistic = '90' THEN ins.r_mbps_90
  WHEN pln.disk_performance_statistic = '75' THEN ins.r_mbps_75
  WHEN pln.disk_performance_statistic = 'MEDIAN' THEN ins.r_mbps_median
  WHEN pln.disk_performance_statistic = 'AVG' THEN ins.r_mbps_avg
  ELSE ins.r_mbps
  END r_mbps
, CASE
  WHEN pln.disk_performance_method = 'MA' THEN ins.w_mbps
  WHEN pln.disk_performance_statistic = 'PEAK' THEN ins.w_mbps_peak
  WHEN pln.disk_performance_statistic = '99.9' THEN ins.w_mbps_999
  WHEN pln.disk_performance_statistic = '99' THEN ins.w_mbps_99
  WHEN pln.disk_performance_statistic = '97' THEN ins.w_mbps_97
  WHEN pln.disk_performance_statistic = '95' THEN ins.w_mbps_95
  WHEN pln.disk_performance_statistic = '90' THEN ins.w_mbps_90
  WHEN pln.disk_performance_statistic = '75' THEN ins.w_mbps_75
  WHEN pln.disk_performance_statistic = 'MEDIAN' THEN ins.w_mbps_median
  WHEN pln.disk_performance_statistic = 'AVG' THEN ins.w_mbps_avg
  ELSE ins.w_mbps
  END w_mbps
, ins.spec_id
, ins.version_date
, ins.hardware_vendor
, ins.system
, ins.num_cores
, ins.num_chips
, ins.num_cores_per_chip
, ins.num_threads_per_core
, ins.baseline
, ins.result
, ins.result_per_core
, CASE
  WHEN pln.cpu_method = 'MA' THEN ins.aas_cpu_demand
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = 'PEAK' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.aas_on_cpu_peak > 0 THEN LEAST(ins.cpu_count, ins.aas_on_cpu_peak)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = 'PEAK' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND ins.aas_on_cpu_peak > 0 THEN ins.aas_on_cpu_peak
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = 'PEAK' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.aas_on_cpu_and_resmgr_peak > 0 THEN LEAST(ins.cpu_count, ins.aas_on_cpu_and_resmgr_peak)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = 'PEAK' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND ins.aas_on_cpu_and_resmgr_peak > 0 THEN ins.aas_on_cpu_and_resmgr_peak
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '99.99' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.aas_on_cpu_9999 > 0 THEN LEAST(ins.cpu_count, ins.aas_on_cpu_9999)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '99.99' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND ins.aas_on_cpu_9999 > 0 THEN ins.aas_on_cpu_9999
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '99.99' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.aas_on_cpu_and_resmgr_9999 > 0 THEN LEAST(ins.cpu_count, ins.aas_on_cpu_and_resmgr_9999)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '99.99' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND ins.aas_on_cpu_and_resmgr_9999 > 0 THEN ins.aas_on_cpu_and_resmgr_9999
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '99.9' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.aas_on_cpu_999 > 0 THEN LEAST(ins.cpu_count, ins.aas_on_cpu_999)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '99.9' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND ins.aas_on_cpu_999 > 0 THEN ins.aas_on_cpu_999
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '99.9' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.aas_on_cpu_and_resmgr_999 > 0 THEN LEAST(ins.cpu_count, ins.aas_on_cpu_and_resmgr_999)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '99.9' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND ins.aas_on_cpu_and_resmgr_999 > 0 THEN ins.aas_on_cpu_and_resmgr_999
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '99' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.aas_on_cpu_99 > 0 THEN LEAST(ins.cpu_count, ins.aas_on_cpu_99)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '99' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND ins.aas_on_cpu_99 > 0 THEN ins.aas_on_cpu_99
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '99' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.aas_on_cpu_and_resmgr_99 > 0 THEN LEAST(ins.cpu_count, ins.aas_on_cpu_and_resmgr_99)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '99' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND ins.aas_on_cpu_and_resmgr_99 > 0 THEN ins.aas_on_cpu_and_resmgr_99
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '97' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.aas_on_cpu_97 > 0 THEN LEAST(ins.cpu_count, ins.aas_on_cpu_97)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '97' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND ins.aas_on_cpu_97 > 0 THEN ins.aas_on_cpu_97
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '97' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.aas_on_cpu_and_resmgr_97 > 0 THEN LEAST(ins.cpu_count, ins.aas_on_cpu_and_resmgr_97)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '97' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND ins.aas_on_cpu_and_resmgr_97 > 0 THEN ins.aas_on_cpu_and_resmgr_97
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '95' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.aas_on_cpu_95 > 0 THEN LEAST(ins.cpu_count, ins.aas_on_cpu_95)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '95' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND ins.aas_on_cpu_95 > 0 THEN ins.aas_on_cpu_95
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '95' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.aas_on_cpu_and_resmgr_95 > 0 THEN LEAST(ins.cpu_count, ins.aas_on_cpu_and_resmgr_95)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '95' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND ins.aas_on_cpu_and_resmgr_95 > 0 THEN ins.aas_on_cpu_and_resmgr_95
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '90' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.aas_on_cpu_90 > 0 THEN LEAST(ins.cpu_count, ins.aas_on_cpu_90)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '90' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND ins.aas_on_cpu_90 > 0 THEN ins.aas_on_cpu_90
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '90' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.aas_on_cpu_and_resmgr_90 > 0 THEN LEAST(ins.cpu_count, ins.aas_on_cpu_and_resmgr_90)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '90' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND ins.aas_on_cpu_and_resmgr_90 > 0 THEN ins.aas_on_cpu_and_resmgr_90
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '75' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.aas_on_cpu_75 > 0 THEN LEAST(ins.cpu_count, ins.aas_on_cpu_75)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '75' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND ins.aas_on_cpu_75 > 0 THEN ins.aas_on_cpu_75
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '75' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.aas_on_cpu_and_resmgr_75 > 0 THEN LEAST(ins.cpu_count, ins.aas_on_cpu_and_resmgr_75)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = '75' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND ins.aas_on_cpu_and_resmgr_75 > 0 THEN ins.aas_on_cpu_and_resmgr_75
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = 'MEDIAN' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.aas_on_cpu_median > 0 THEN LEAST(ins.cpu_count, ins.aas_on_cpu_median)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = 'MEDIAN' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND ins.aas_on_cpu_median > 0 THEN ins.aas_on_cpu_median
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = 'MEDIAN' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.aas_on_cpu_and_resmgr_median > 0 THEN LEAST(ins.cpu_count, ins.aas_on_cpu_and_resmgr_median)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = 'MEDIAN' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND ins.aas_on_cpu_and_resmgr_median > 0 THEN ins.aas_on_cpu_and_resmgr_median
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = 'AVG' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.aas_on_cpu_avg > 0 THEN LEAST(ins.cpu_count, ins.aas_on_cpu_avg)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = 'AVG' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND ins.aas_on_cpu_avg > 0 THEN ins.aas_on_cpu_avg
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = 'AVG' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.aas_on_cpu_and_resmgr_avg > 0 THEN LEAST(ins.cpu_count, ins.aas_on_cpu_and_resmgr_avg)
  WHEN pln.cpu_method = 'EH' AND pln.cpu_statistic = 'AVG' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND ins.aas_on_cpu_and_resmgr_avg > 0 THEN ins.aas_on_cpu_and_resmgr_avg
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = 'PEAK' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.cas_on_cpu_max > 0 THEN LEAST(ins.cpu_count, ins.cas_on_cpu_max)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = 'PEAK' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND ins.cas_on_cpu_max > 0 THEN ins.cas_on_cpu_max
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = 'PEAK' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.cas_on_cpu_and_resmgr_max > 0 THEN LEAST(ins.cpu_count, ins.cas_on_cpu_and_resmgr_max)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = 'PEAK' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND ins.cas_on_cpu_and_resmgr_max > 0 THEN ins.cas_on_cpu_and_resmgr_max
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '99' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.cas_on_cpu_99p > 0 THEN LEAST(ins.cpu_count, ins.cas_on_cpu_99p)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '99' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND ins.cas_on_cpu_99p > 0 THEN ins.cas_on_cpu_99p
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '99' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.cas_on_cpu_and_resmgr_99p > 0 THEN LEAST(ins.cpu_count, ins.cas_on_cpu_and_resmgr_99p)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '99' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND ins.cas_on_cpu_and_resmgr_99p > 0 THEN ins.cas_on_cpu_and_resmgr_99p
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '97' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.cas_on_cpu_97p > 0 THEN LEAST(ins.cpu_count, ins.cas_on_cpu_97p)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '97' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND ins.cas_on_cpu_97p > 0 THEN ins.cas_on_cpu_97p
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '97' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.cas_on_cpu_and_resmgr_97p > 0 THEN LEAST(ins.cpu_count, ins.cas_on_cpu_and_resmgr_97p)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '97' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND ins.cas_on_cpu_and_resmgr_97p > 0 THEN ins.cas_on_cpu_and_resmgr_97p
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '95' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.cas_on_cpu_95p > 0 THEN LEAST(ins.cpu_count, ins.cas_on_cpu_95p)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '95' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND ins.cas_on_cpu_95p > 0 THEN ins.cas_on_cpu_95p
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '95' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.cas_on_cpu_and_resmgr_95p > 0 THEN LEAST(ins.cpu_count, ins.cas_on_cpu_and_resmgr_95p)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '95' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND ins.cas_on_cpu_and_resmgr_95p > 0 THEN ins.cas_on_cpu_and_resmgr_95p
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '90' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.cas_on_cpu_90p > 0 THEN LEAST(ins.cpu_count, ins.cas_on_cpu_90p)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '90' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND ins.cas_on_cpu_90p > 0 THEN ins.cas_on_cpu_90p
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '90' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.cas_on_cpu_and_resmgr_90p > 0 THEN LEAST(ins.cpu_count, ins.cas_on_cpu_and_resmgr_90p)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '90' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND ins.cas_on_cpu_and_resmgr_90p > 0 THEN ins.cas_on_cpu_and_resmgr_90p
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '75' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.cas_on_cpu_75p > 0 THEN LEAST(ins.cpu_count, ins.cas_on_cpu_75p)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '75' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND ins.cas_on_cpu_75p > 0 THEN ins.cas_on_cpu_75p
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '75' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.cas_on_cpu_and_resmgr_75p > 0 THEN LEAST(ins.cpu_count, ins.cas_on_cpu_and_resmgr_75p)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = '75' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND ins.cas_on_cpu_and_resmgr_75p > 0 THEN ins.cas_on_cpu_and_resmgr_75p
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = 'MEDIAN' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.cas_on_cpu_med > 0 THEN LEAST(ins.cpu_count, ins.cas_on_cpu_med)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = 'MEDIAN' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND ins.cas_on_cpu_med > 0 THEN ins.cas_on_cpu_med
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = 'MEDIAN' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.cas_on_cpu_and_resmgr_med > 0 THEN LEAST(ins.cpu_count, ins.cas_on_cpu_and_resmgr_med)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = 'MEDIAN' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND ins.cas_on_cpu_and_resmgr_med > 0 THEN ins.cas_on_cpu_and_resmgr_med
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = 'AVG' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.cas_on_cpu_avg > 0 THEN LEAST(ins.cpu_count, ins.cas_on_cpu_avg)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = 'AVG' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'N' AND ins.cas_on_cpu_avg > 0 THEN ins.cas_on_cpu_avg
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = 'AVG' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND NVL(pln.cap_to_num_cpus, 'N') = 'Y' AND ins.cpu_count > 0 AND ins.cas_on_cpu_and_resmgr_avg > 0 THEN LEAST(ins.cpu_count, ins.cas_on_cpu_and_resmgr_avg)
  WHEN pln.cpu_method = 'HS' AND pln.cpu_statistic = 'AVG' AND NVL(pln.include_resmgr_cpu_quantum, 'N') = 'Y' AND ins.cas_on_cpu_and_resmgr_avg > 0 THEN ins.cas_on_cpu_and_resmgr_avg
  ELSE ins.aas_cpu_demand
  END * ins.result_per_core aas_cpu_demand_spec
, ins.dbid
, ins.db_name
, ins.db_unique_name
, ins.platform_name
, ins.version
, ins.host_name_src
, ins.db_desc
, ins.cluster_name
, ins.db_group
, ins.db_type
, ins.eadam_seq_id
, ins.collection_key
, ins.collection_date
, ins.load_date
, ins.client_name
, ins.client_desc
, ins.tar_file_name
-- manual part
, ins.aas_cpu_demand aas_cpu_demand_man
, ins.rw_iops        rw_iops_man
, ins.r_iops         r_iops_man
, ins.w_iops         w_iops_man
, ins.rw_mbps        rw_mbps_man
, ins.r_mbps         r_mbps_man
, ins.w_mbps         w_mbps_man
-- cpu demand details (EH entire history)
, ins.aas_on_cpu_and_resmgr_peak
, ins.aas_on_cpu_peak
, ins.aas_on_cpu_and_resmgr_9999
, ins.aas_on_cpu_9999
, ins.aas_on_cpu_and_resmgr_999
, ins.aas_on_cpu_999
, ins.aas_on_cpu_and_resmgr_99
, ins.aas_on_cpu_99
, ins.aas_on_cpu_and_resmgr_97
, ins.aas_on_cpu_97
, ins.aas_on_cpu_and_resmgr_95
, ins.aas_on_cpu_95
, ins.aas_on_cpu_and_resmgr_90
, ins.aas_on_cpu_90
, ins.aas_on_cpu_and_resmgr_75
, ins.aas_on_cpu_75
, ins.aas_on_cpu_and_resmgr_median
, ins.aas_on_cpu_median
, ins.aas_on_cpu_and_resmgr_avg
, ins.aas_on_cpu_avg
-- cpu demand details (HS hourly stats)
, ins.cas_on_cpu_and_resmgr_max
, ins.cas_on_cpu_max
, ins.cas_on_cpu_and_resmgr_99p
, ins.cas_on_cpu_99p
, ins.cas_on_cpu_and_resmgr_97p
, ins.cas_on_cpu_97p
, ins.cas_on_cpu_and_resmgr_95p
, ins.cas_on_cpu_95p
, ins.cas_on_cpu_and_resmgr_90p
, ins.cas_on_cpu_90p
, ins.cas_on_cpu_and_resmgr_75p
, ins.cas_on_cpu_75p
, ins.cas_on_cpu_and_resmgr_med
, ins.cas_on_cpu_med
, ins.cas_on_cpu_and_resmgr_avg
, ins.cas_on_cpu_avg
-- disk perf (IH instance history)
, ins.rw_iops_peak
, ins.r_iops_peak
, ins.w_iops_peak
, ins.rw_iops_999
, ins.r_iops_999
, ins.w_iops_999
, ins.rw_iops_99
, ins.r_iops_99
, ins.w_iops_99
, ins.rw_iops_97
, ins.r_iops_97
, ins.w_iops_97
, ins.rw_iops_95
, ins.r_iops_95
, ins.w_iops_95
, ins.rw_iops_90
, ins.r_iops_90
, ins.w_iops_90
, ins.rw_iops_75
, ins.r_iops_75
, ins.w_iops_75
, ins.rw_iops_median
, ins.r_iops_median
, ins.w_iops_median
, ins.rw_iops_avg
, ins.r_iops_avg
, ins.w_iops_avg
, ins.rw_mbps_peak
, ins.r_mbps_peak
, ins.w_mbps_peak
, ins.rw_mbps_999
, ins.r_mbps_999
, ins.w_mbps_999
, ins.rw_mbps_99
, ins.r_mbps_99
, ins.w_mbps_99
, ins.rw_mbps_97
, ins.r_mbps_97
, ins.w_mbps_97
, ins.rw_mbps_95
, ins.r_mbps_95
, ins.w_mbps_95
, ins.rw_mbps_90
, ins.r_mbps_90
, ins.w_mbps_90
, ins.rw_mbps_75
, ins.r_mbps_75
, ins.w_mbps_75
, ins.rw_mbps_median
, ins.r_mbps_median
, ins.w_mbps_median
, ins.rw_mbps_avg
, ins.r_mbps_avg
, ins.w_mbps_avg
  FROM plan        pln,
       db_per_plan dbp,
       instances_v ins
 WHERE dbp.plan_id   = pln.plan_id
   AND ins.db_id     = dbp.db_id
   AND ins.client_id = pln.client_id;
--------------------------------------------------------
--  DDL for View INST_PER_PLAN_V2
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "INST_PER_PLAN_V2" ("PLAN_ID", "DB_NAME", "DB_UNIQUE_NAME", "DBID", "INSTANCE_NUMBER", "INSTANCE_NAME", "CPU_COUNT", "HOST_NAME", "HOST_NUM_CPUS", "HOST_NUM_CPU_CORES", "HOST_NUM_CPU_SOCKETS", "HOST_LOAD", "HOST_PHYSICAL_MEMORY_GB", "CPU_DEMAND", "CPU_SPEED", "CPU_DEMAND_WEIGHTED", "MEM_SIZE_GB", "RW_IOPS", "RW_MBPS", "INST_ID", "DB_ID", "PLN_DB_ID", "CLIENT_ID") AS 
  SELECT
  plan_id
, db_name
, db_unique_name
, dbid
, instance_number
, instance_name
, cpu_count
, host_name
, host_num_cpus
, host_num_cpu_cores
, host_num_cpu_sockets
, host_load
, host_physical_memory_gb
, NVL(aas_cpu_demand, 0) cpu_demand
, result_per_core cpu_speed
, NVL(aas_cpu_demand_spec, 0) cpu_demand_weighted
, NVL(mem_size_gb, 0) mem_size_gb
, NVL(rw_iops, 0) rw_iops
, NVL(rw_mbps, 0) rw_mbps
-- ids
, inst_id
, db_id
, pln_db_id
, client_id
  FROM inst_per_plan_v;
--------------------------------------------------------
--  DDL for View INSTANCES_V
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "INSTANCES_V" ("INST_ID", "HOST_NAME", "INSTANCE_NUMBER", "INSTANCE_NAME", "AAS_CPU_DEMAND", "MEM_SIZE_GB", "SGA_SIZE_GB", "PGA_SIZE_GB", "RW_IOPS", "R_IOPS", "W_IOPS", "RW_MBPS", "R_MBPS", "W_MBPS", "SPEC_ID", "VERSION_DATE", "HARDWARE_VENDOR", "SYSTEM", "NUM_CORES", "NUM_CHIPS", "NUM_CORES_PER_CHIP", "NUM_THREADS_PER_CORE", "BASELINE", "RESULT", "RESULT_PER_CORE", "AAS_CPU_DEMAND_SPEC", "DB_ID", "DBID", "DB_NAME", "DB_UNIQUE_NAME", "PLATFORM_NAME", "VERSION", "HOST_NAME_SRC", "DB_DESC", "CLUSTER_NAME", "DB_GROUP", "DB_TYPE", "DATABASE_SIZE_GB", "EADAM_SEQ_ID", "COLLECTION_KEY", "COLLECTION_DATE", "LOAD_DATE", "CLIENT_ID", "CLIENT_NAME", "CLIENT_DESC", "TAR_FILE_NAME", "CPU_COUNT", "AAS_ON_CPU_AND_RESMGR_PEAK", "AAS_ON_CPU_PEAK", "AAS_ON_CPU_AND_RESMGR_9999", "AAS_ON_CPU_9999", "AAS_ON_CPU_AND_RESMGR_999", "AAS_ON_CPU_999", "AAS_ON_CPU_AND_RESMGR_99", "AAS_ON_CPU_99", "AAS_ON_CPU_AND_RESMGR_97", "AAS_ON_CPU_97", "AAS_ON_CPU_AND_RESMGR_95", "AAS_ON_CPU_95", "AAS_ON_CPU_AND_RESMGR_90", "AAS_ON_CPU_90", "AAS_ON_CPU_AND_RESMGR_75", "AAS_ON_CPU_75", "AAS_ON_CPU_AND_RESMGR_MEDIAN", "AAS_ON_CPU_MEDIAN", "AAS_ON_CPU_AND_RESMGR_AVG", "AAS_ON_CPU_AVG", "CAS_ON_CPU_AND_RESMGR_MAX", "CAS_ON_CPU_MAX", "CAS_ON_CPU_AND_RESMGR_99P", "CAS_ON_CPU_99P", "CAS_ON_CPU_AND_RESMGR_97P", "CAS_ON_CPU_97P", "CAS_ON_CPU_AND_RESMGR_95P", "CAS_ON_CPU_95P", "CAS_ON_CPU_AND_RESMGR_90P", "CAS_ON_CPU_90P", "CAS_ON_CPU_AND_RESMGR_75P", "CAS_ON_CPU_75P", "CAS_ON_CPU_AND_RESMGR_MED", "CAS_ON_CPU_MED", "CAS_ON_CPU_AND_RESMGR_AVG", "CAS_ON_CPU_AVG", "HOST_NUM_CPUS", "HOST_NUM_CPU_CORES", "HOST_NUM_CPU_SOCKETS", "HOST_LOAD", "HOST_PHYSICAL_MEMORY_GB", "RW_IOPS_PEAK", "R_IOPS_PEAK", "W_IOPS_PEAK", "RW_IOPS_999", "R_IOPS_999", "W_IOPS_999", "RW_IOPS_99", "R_IOPS_99", "W_IOPS_99", "RW_IOPS_97", "R_IOPS_97", "W_IOPS_97", "RW_IOPS_95", "R_IOPS_95", "W_IOPS_95", "RW_IOPS_90", "R_IOPS_90", "W_IOPS_90", "RW_IOPS_75", "R_IOPS_75", "W_IOPS_75", "RW_IOPS_MEDIAN", "R_IOPS_MEDIAN", "W_IOPS_MEDIAN", "RW_IOPS_AVG", "R_IOPS_AVG", "W_IOPS_AVG", "RW_MBPS_PEAK", "R_MBPS_PEAK", "W_MBPS_PEAK", "RW_MBPS_999", "R_MBPS_999", "W_MBPS_999", "RW_MBPS_99", "R_MBPS_99", "W_MBPS_99", "RW_MBPS_97", "R_MBPS_97", "W_MBPS_97", "RW_MBPS_95", "R_MBPS_95", "W_MBPS_95", "RW_MBPS_90", "R_MBPS_90", "W_MBPS_90", "RW_MBPS_75", "R_MBPS_75", "W_MBPS_75", "RW_MBPS_MEDIAN", "R_MBPS_MEDIAN", "W_MBPS_MEDIAN", "RW_MBPS_AVG", "R_MBPS_AVG", "W_MBPS_AVG") AS 
  SELECT
  ins.inst_id
, ins.host_name
, ins.instance_number
, ins.instance_name
, ins.aas_cpu_demand
, (ins.sga_size_gb + ins.pga_size_gb) mem_size_gb
, ins.sga_size_gb
, ins.pga_size_gb
, (ins.r_iops + ins.w_iops) rw_iops
, ins.r_iops
, ins.w_iops
, (ins.r_mbps + ins.w_mbps) rw_mbps
, ins.r_mbps
, ins.w_mbps
, ins.spec_id
, spc.version_date
, spc.hardware_vendor
, spc.system
, spc.num_cores
, spc.num_chips
, spc.num_cores_per_chip
, spc.num_threads_per_core
, spc.baseline
, spc.result
, spc.result_per_core
, (ins.aas_cpu_demand * spc.result_per_core) aas_cpu_demand_spec
, ins.db_id
, dbs.dbid
, dbs.db_name
, dbs.db_unique_name
, dbs.platform_name
, dbs.version
, dbs.host_name_src
, dbs.db_desc
, dbs.cluster_name
, dbs.db_group
, dbs.db_type
, dbs.database_size_gb
, dbs.eadam_seq_id
, dbs.collection_key
, dbs.collection_date
, dbs.load_date
, dbs.client_id
, cli.client_name
, cli.client_desc
, SUBSTR(edm.tar_file_name, 1, 100) tar_file_name
, ins.cpu_count
-- cpu demand details (EH entire history)
, ins.aas_on_cpu_and_resmgr_peak
, ins.aas_on_cpu_peak
, ins.aas_on_cpu_and_resmgr_9999
, ins.aas_on_cpu_9999
, ins.aas_on_cpu_and_resmgr_999
, ins.aas_on_cpu_999
, ins.aas_on_cpu_and_resmgr_99
, ins.aas_on_cpu_99
, NVL(ins.aas_on_cpu_and_resmgr_97, ROUND((ins.aas_on_cpu_and_resmgr_99 + ins.aas_on_cpu_and_resmgr_95) / 2)) aas_on_cpu_and_resmgr_97
, NVL(ins.aas_on_cpu_97, ROUND((ins.aas_on_cpu_99 + ins.aas_on_cpu_95) / 2)) aas_on_cpu_97
, ins.aas_on_cpu_and_resmgr_95
, ins.aas_on_cpu_95
, ins.aas_on_cpu_and_resmgr_90
, ins.aas_on_cpu_90
, ins.aas_on_cpu_and_resmgr_75
, ins.aas_on_cpu_75
, ins.aas_on_cpu_and_resmgr_median
, ins.aas_on_cpu_median
, ins.aas_on_cpu_and_resmgr_avg
, ins.aas_on_cpu_avg
-- cpu demand details (HS hourly stats)
, ins.cas_on_cpu_and_resmgr_max
, ins.cas_on_cpu_max
, ins.cas_on_cpu_and_resmgr_99p
, ins.cas_on_cpu_99p
, NVL(ins.cas_on_cpu_and_resmgr_97p, ROUND((ins.cas_on_cpu_and_resmgr_99p + ins.cas_on_cpu_and_resmgr_95p) / 2)) cas_on_cpu_and_resmgr_97p
, NVL(ins.cas_on_cpu_97p, ROUND((ins.cas_on_cpu_99p + ins.cas_on_cpu_95p) / 2)) cas_on_cpu_97p
, ins.cas_on_cpu_and_resmgr_95p
, ins.cas_on_cpu_95p
, ins.cas_on_cpu_and_resmgr_90p
, ins.cas_on_cpu_90p
, ins.cas_on_cpu_and_resmgr_75p
, ins.cas_on_cpu_75p
, ins.cas_on_cpu_and_resmgr_med
, ins.cas_on_cpu_med
, ins.cas_on_cpu_and_resmgr_avg
, ins.cas_on_cpu_avg
-- host
, NVL(ins.host_num_cpus, 0) host_num_cpus
, NVL(ins.host_num_cpu_cores, 0) host_num_cpu_cores
, NVL(ins.host_num_cpu_sockets, 0) host_num_cpu_sockets
, NVL(ins.host_load, 0) host_load
, NVL(ins.host_physical_memory_gb, 0) host_physical_memory_gb
-- disk perf (IH instance history)
, ins.rw_iops_peak
, ins.r_iops_peak
, ins.w_iops_peak
, ins.rw_iops_999
, ins.r_iops_999
, ins.w_iops_999
, ins.rw_iops_99
, ins.r_iops_99
, ins.w_iops_99
, NVL(ins.rw_iops_97, ROUND((ins.rw_iops_99 + ins.rw_iops_95) / 2)) rw_iops_97
, NVL(ins.r_iops_97, ROUND((ins.r_iops_99 + ins.r_iops_95) / 2)) r_iops_97
, NVL(ins.w_iops_97, ROUND((ins.w_iops_99 + ins.w_iops_95) / 2)) w_iops_97
, ins.rw_iops_95
, ins.r_iops_95
, ins.w_iops_95
, ins.rw_iops_90
, ins.r_iops_90
, ins.w_iops_90
, ins.rw_iops_75
, ins.r_iops_75
, ins.w_iops_75
, ins.rw_iops_median
, ins.r_iops_median
, ins.w_iops_median
, ins.rw_iops_avg
, ins.r_iops_avg
, ins.w_iops_avg
, ins.rw_mbps_peak
, ins.r_mbps_peak
, ins.w_mbps_peak
, ins.rw_mbps_999
, ins.r_mbps_999
, ins.w_mbps_999
, ins.rw_mbps_99
, ins.r_mbps_99
, ins.w_mbps_99
, NVL(ins.rw_mbps_97, ROUND((ins.rw_mbps_99 + ins.rw_mbps_95) / 2)) rw_mbps_97
, NVL(ins.r_mbps_97, ROUND((ins.r_mbps_99 + ins.r_mbps_95) / 2)) r_mbps_97
, NVL(ins.w_mbps_97, ROUND((ins.w_mbps_99 + ins.w_mbps_95) / 2)) w_mbps_97
, ins.rw_mbps_95
, ins.r_mbps_95
, ins.w_mbps_95
, ins.rw_mbps_90
, ins.r_mbps_90
, ins.w_mbps_90
, ins.rw_mbps_75
, ins.r_mbps_75
, ins.w_mbps_75
, ins.rw_mbps_median
, ins.r_mbps_median
, ins.w_mbps_median
, ins.rw_mbps_avg
, ins.r_mbps_avg
, ins.w_mbps_avg
  FROM instances     ins,
       spec_v        spc,
       databases     dbs,
       clients       cli,
       eadam_control edm
 WHERE spc.spec_id         = ins.spec_id
   AND dbs.db_id           = ins.db_id
   AND cli.client_id       = dbs.client_id
   AND edm.eadam_seq_id(+) = dbs.eadam_seq_id;
--------------------------------------------------------
--  DDL for View NODE_ALLOC_V
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "NODE_ALLOC_V" ("CLIENT_ID", "CLIENT_NAME", "PLAN_ID", "PLAN_NAME", "CONFIG_ID", "CONFIG_NAME", "CONFIG_DESC", "PLN_CFG_ID", "PLN_CFG_NAME", "SRV_NODE", "NODE_LAYOUT", "NODE_LAYOUT_DESC", "SERVER_ID", "INSTANCES", "IAL_NUM_CPU_SPEC", "IAL_NUM_CPU_PERC", "IAL_NUM_CPU", "IAL_MEM_SIZE_GB", "IAL_MEM_SIZE_PERC", "DBS_CPU_DEMAND", "DBS_CPU_DEMAND_SPEC", "DBS_MEM_SIZE_GB", "DBS_DATABASE_SIZE_GB", "DBS_RW_IOPS", "DBS_R_IOPS", "DBS_W_IOPS", "DBS_RW_MBPS", "DBS_R_MBPS", "DBS_W_MBPS", "SRV_NUM_CPUS", "SRV_MEMORY_SIZE_GB", "SRV_DISK_SIZE_RAW_GB", "SRV_RW_IOPS", "SRV_R_IOPS", "SRV_W_IOPS", "SRV_RW_MBPS", "SRV_R_MBPS", "SRV_W_MBPS", "CAP_NUM_CPU", "CAP_NUM_CPU_SPEC", "CAP_MEM_SIZE_GB", "CAP_DISK_SIZE_GB", "CAP_RW_IOPS", "CAP_R_IOPS", "CAP_W_IOPS", "CAP_RW_MBPS", "CAP_R_MBPS", "CAP_W_MBPS") AS 
  SELECT
-- client
  client_id
, client_name
-- plan
, plan_id
, plan_name
-- configuration
, config_id
, config_name
, config_desc
-- configuration per plan
, pln_cfg_id
, pln_cfg_name
-- server
, srv_node
, node_layout  /* (P)rimary, (F)ailover or e(X)cluded */
, node_layout_desc
, server_id
-- instances
, COUNT(*) instances
-- instance allocated
, SUM(ial_num_cpu_spec) ial_num_cpu_spec
, SUM(ial_num_cpu_perc) ial_num_cpu_perc
, SUM(ial_num_cpu) ial_num_cpu
, SUM(ial_mem_size_gb) ial_mem_size_gb
, SUM(ial_mem_size_perc) ial_mem_size_perc
-- requirements
, SUM(dbs_cpu_demand) dbs_cpu_demand
, SUM(dbs_cpu_demand_spec) dbs_cpu_demand_spec
, SUM(dbs_mem_size_gb) dbs_mem_size_gb
, SUM(dbs_database_size_gb) dbs_database_size_gb
, SUM(dbs_rw_iops) dbs_rw_iops
, SUM(dbs_r_iops) dbs_r_iops
, SUM(dbs_w_iops) dbs_w_iops
, SUM(dbs_rw_mbps) dbs_rw_mbps
, SUM(dbs_r_mbps) dbs_r_mbps
, SUM(dbs_w_mbps) dbs_w_mbps
-- raw server capacity
, MAX(srv_num_cpus) srv_num_cpus
, MAX(srv_memory_size_gb) srv_memory_size_gb
, MAX(srv_disk_size_raw_gb) srv_disk_size_raw_gb
, MAX(srv_rw_iops) srv_rw_iops
, MAX(srv_r_iops) srv_r_iops
, MAX(srv_w_iops) srv_w_iops
, MAX(srv_rw_mbps) srv_rw_mbps
, MAX(srv_r_mbps) srv_r_mbps
, MAX(srv_w_mbps) srv_w_mbps
-- adjusted capacity
, MAX(cap_num_cpu) cap_num_cpu
, MAX(cap_num_cpu_spec) cap_num_cpu_spec
, MAX(cap_mem_size_gb) cap_mem_size_gb
, MAX(cap_disk_size_gb) cap_disk_size_gb
, MAX(cap_rw_iops) cap_rw_iops
, MAX(cap_r_iops) cap_r_iops
, MAX(cap_w_iops) cap_w_iops
, MAX(cap_rw_mbps) cap_rw_mbps
, MAX(cap_r_mbps) cap_r_mbps
, MAX(cap_w_mbps) cap_w_mbps
  FROM inst_allocation_v
 GROUP BY
-- client
  client_id
, client_name
-- plan
, plan_id
, plan_name
-- configuration
, config_id
, config_name
, config_desc
-- configuration per plan
, pln_cfg_id
, pln_cfg_name
-- server
, srv_node
, node_layout  /* (P)rimary, (F)ailover or e(X)cluded */
, node_layout_desc
, server_id;
--------------------------------------------------------
--  DDL for View NODE_ALLOC_V2
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "NODE_ALLOC_V2" ("CLIENT_ID", "CLIENT_NAME", "PLAN_ID", "PLAN_NAME", "CONFIG_ID", "CONFIG_NAME", "CONFIG_DESC", "PLN_CFG_ID", "PLN_CFG_NAME", "SRV_NODE", "NODE_LAYOUT", "NODE_LAYOUT_DESC", "SERVER_ID", "INSTANCES", "IAL_NUM_CPU_SPEC", "IAL_NUM_CPU_PERC", "IAL_NUM_CPU", "IAL_MEM_SIZE_GB", "IAL_MEM_SIZE_PERC", "DBS_CPU_DEMAND", "DBS_CPU_DEMAND_SPEC", "DBS_MEM_SIZE_GB", "DBS_DATABASE_SIZE_GB", "DBS_RW_IOPS", "DBS_R_IOPS", "DBS_W_IOPS", "DBS_RW_MBPS", "DBS_R_MBPS", "DBS_W_MBPS", "SRV_NUM_CPUS", "SRV_MEMORY_SIZE_GB", "SRV_DISK_SIZE_RAW_GB", "SRV_RW_IOPS", "SRV_R_IOPS", "SRV_W_IOPS", "SRV_RW_MBPS", "SRV_R_MBPS", "SRV_W_MBPS", "CAP_NUM_CPU", "CAP_NUM_CPU_SPEC", "CAP_MEM_SIZE_GB", "CAP_DISK_SIZE_GB", "CAP_RW_IOPS", "CAP_R_IOPS", "CAP_W_IOPS", "CAP_RW_MBPS", "CAP_R_MBPS", "CAP_W_MBPS") AS 
  SELECT
-- client
  srp.client_id
, srp.client_name
-- plan
, srp.plan_id
, srp.plan_name
-- configuration
, srp.config_id
, srp.config_name
, srp.config_desc
-- configuration per plan
, srp.pln_cfg_id
, srp.pln_cfg_name
-- server
, srp.node srv_node
, nal.node_layout  /* (P)rimary, (F)ailover or e(X)cluded */
, nal.node_layout_desc
, srp.server_id
, nal.instances
-- instance allocated
, NVL(nal.ial_num_cpu_spec, 0)      ial_num_cpu_spec
, NVL(nal.ial_num_cpu_perc, 0)      ial_num_cpu_perc
, NVL(nal.ial_num_cpu, 0)           ial_num_cpu
, NVL(nal.ial_mem_size_gb, 0)       ial_mem_size_gb
, NVL(nal.ial_mem_size_perc, 0)     ial_mem_size_perc
-- requirements
, NVL(nal.dbs_cpu_demand, 0)        dbs_cpu_demand
, NVL(nal.dbs_cpu_demand_spec, 0)   dbs_cpu_demand_spec
, NVL(nal.dbs_mem_size_gb, 0)       dbs_mem_size_gb
, NVL(nal.dbs_database_size_gb, 0)  dbs_database_size_gb
, NVL(nal.dbs_rw_iops, 0)           dbs_rw_iops
, NVL(nal.dbs_r_iops, 0)            dbs_r_iops
, NVL(nal.dbs_w_iops, 0)            dbs_w_iops
, NVL(nal.dbs_rw_mbps, 0)           dbs_rw_mbps
, NVL(nal.dbs_r_mbps, 0)            dbs_r_mbps
, NVL(nal.dbs_w_mbps, 0)            dbs_w_mbps
-- raw server capacity
, srp.num_cpus                      srv_num_cpus
, srp.memory_size_gb                srv_memory_size_gb
, srp.disk_size_raw_gb              srv_disk_size_raw_gb
, srp.rw_iops                       srv_rw_iops
, srp.r_iops                        srv_r_iops
, srp.w_iops                        srv_w_iops
, srp.rw_mbps                       srv_rw_mbps
, srp.r_mbps                        srv_r_mbps
, srp.w_mbps                        srv_w_mbps
-- adjusted capacity
, srp.cap_num_cpu
, srp.cap_num_cpu_spec
, srp.cap_mem_size_gb
, srp.cap_disk_size_gb
, srp.cap_rw_iops
, srp.cap_r_iops
, srp.cap_w_iops
, srp.cap_rw_mbps
, srp.cap_r_mbps
, srp.cap_w_mbps
  FROM serv_per_plan_v srp,
       node_alloc_v    nal
 WHERE srp.server_type     IN ('C', 'H')
   AND nal.client_id(+)    = srp.client_id
   AND nal.plan_id(+)      = srp.plan_id
   AND nal.plan_name(+)    = srp.plan_name
   -- configuration per plan
   AND nal.pln_cfg_id(+)   = srp.pln_cfg_id
   AND nal.pln_cfg_name(+) = srp.pln_cfg_name
   -- configuration
   AND nal.config_id(+)    = srp.config_id
   AND nal.config_name(+)  = srp.config_name
   AND nal.config_desc(+)  = srp.config_desc
   -- server
   AND nal.server_id(+)    = srp.server_id
   AND nal.srv_node(+)     = srp.node;
--------------------------------------------------------
--  DDL for View NODE_ALLOC_V3
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "NODE_ALLOC_V3" ("CLIENT_ID", "CLIENT_NAME", "PLAN_ID", "PLAN_NAME", "CONFIG_ID", "CONFIG_NAME", "CONFIG_DESC", "PLN_CFG_ID", "PLN_CFG_NAME", "SRV_NODE", "NODE_LAYOUT", "NODE_LAYOUT_DESC", "SERVER_ID", "INSTANCES", "NUM_CPU_ALLOCATED", "MEM_SIZE_GB_ALLOCATED", "CPU_PERC_ALLOCATED", "MEM_PERC_ALLOCATED", "CPU_PERC_AVAILABLE", "MEM_PERC_AVAILABLE") AS 
  SELECT
-- client
  client_id
, client_name
-- plan
, plan_id
, plan_name
-- configuration
, config_id
, config_name
, config_desc
-- configuration per plan
, pln_cfg_id
, pln_cfg_name
-- server
, srv_node
, node_layout /* (P)rimary, (F)ailover or e(X)cluded */
, node_layout_desc
, server_id
, instances
-- allocation
, ial_num_cpu               num_cpu_allocated
, ial_mem_size_gb           mem_size_gb_allocated
, ial_num_cpu_perc          cpu_perc_allocated
, ial_mem_size_perc         mem_perc_allocated
, (100 - ial_num_cpu_perc)  cpu_perc_available
, (100 - ial_mem_size_perc) mem_perc_available
  FROM node_alloc_v2;
--------------------------------------------------------
--  DDL for View PLAN_ALLOC_V
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "PLAN_ALLOC_V" ("CLIENT_ID", "CLIENT_NAME", "PLAN_ID", "PLAN_NAME", "DATABASES", "SOURCE_INSTANCES", "TARGET_INSTANCES", "ALLOCATED_INSTANCES", "PAL_NUM_CPU_SPEC", "PAL_NUM_CPU_PERC", "PAL_NUM_CPU", "PAL_MEM_SIZE_GB", "PAL_MEM_SIZE_PERC", "PAL_DISK_SIZE_GB", "PAL_DISK_SIZE_PERC", "PAL_RW_IOPS", "PAL_RW_IOPS_PERC", "PAL_R_IOPS", "PAL_R_IOPS_PERC", "PAL_W_IOPS", "PAL_W_IOPS_PERC", "PAL_RW_MBPS", "PAL_RW_MBPS_PERC", "PAL_R_MBPS", "PAL_R_MBPS_PERC", "PAL_W_MBPS", "PAL_W_MBPS_PERC", "DBS_CPU_DEMAND", "DBS_CPU_DEMAND_SPEC", "DBS_MEM_SIZE_GB", "DBS_DATABASE_SIZE_GB", "DBS_RW_IOPS", "DBS_R_IOPS", "DBS_W_IOPS", "DBS_RW_MBPS", "DBS_R_MBPS", "DBS_W_MBPS", "CON_NUM_CPUS", "CON_MEMORY_SIZE_GB", "CON_DISK_SIZE_RAW_GB", "CON_RW_IOPS", "CON_R_IOPS", "CON_W_IOPS", "CON_RW_MBPS", "CON_R_MBPS", "CON_W_MBPS", "CAP_NUM_CPU", "CAP_NUM_CPU_SPEC", "CAP_MEM_SIZE_GB", "CAP_DISK_SIZE_GB", "CAP_RW_IOPS", "CAP_R_IOPS", "CAP_W_IOPS", "CAP_RW_MBPS", "CAP_R_MBPS", "CAP_W_MBPS") AS 
  SELECT
-- client
  client_id
, client_name
-- plan
, plan_id
, plan_name
-- allocation
, SUM(databases)            databases
, SUM(source_instances)     source_instances
, SUM(target_instances)     target_instances
, SUM(allocated_instances)  allocated_instances
-- plan allocated
, SUM(cal_num_cpu_spec)                                         pal_num_cpu_spec
, ROUND(100 * SUM(cal_num_cpu_spec) / SUM(cap_num_cpu_spec), 1) pal_num_cpu_perc
, SUM(cal_num_cpu)                                              pal_num_cpu
, SUM(cal_mem_size_gb)                                          pal_mem_size_gb
, ROUND(100 * SUM(cal_mem_size_gb) / SUM(cap_mem_size_gb), 1)   pal_mem_size_perc
, SUM(cal_disk_size_gb)                                         pal_disk_size_gb
, ROUND(100 * SUM(cal_disk_size_gb) / SUM(cap_disk_size_gb), 1) pal_disk_size_perc
, SUM(cal_rw_iops)                                              pal_rw_iops
, ROUND(100 * SUM(cal_rw_iops) / SUM(cap_rw_iops), 1)           pal_rw_iops_perc
, SUM(cal_r_iops)                                               pal_r_iops
, ROUND(100 * SUM(cal_r_iops) / SUM(cap_r_iops), 1)             pal_r_iops_perc
, SUM(cal_w_iops)                                               pal_w_iops
, ROUND(100 * SUM(cal_w_iops) / SUM(cap_w_iops), 1)             pal_w_iops_perc
, SUM(cal_rw_mbps)                                              pal_rw_mbps
, ROUND(100 * SUM(cal_rw_mbps) / SUM(cap_rw_mbps), 1)           pal_rw_mbps_perc
, SUM(cal_r_mbps)                                               pal_r_mbps
, ROUND(100 * SUM(cal_r_mbps) / SUM(cap_r_mbps), 1)             pal_r_mbps_perc
, SUM(cal_w_mbps)                                               pal_w_mbps
, ROUND(100 * SUM(cal_w_mbps) / SUM(cap_w_mbps), 1)             pal_w_mbps_perc
-- requirements
, SUM(dbs_cpu_demand)       dbs_cpu_demand
, SUM(dbs_cpu_demand_spec)  dbs_cpu_demand_spec
, SUM(dbs_mem_size_gb)      dbs_mem_size_gb
, SUM(dbs_database_size_gb) dbs_database_size_gb
, SUM(dbs_rw_iops)          dbs_rw_iops
, SUM(dbs_r_iops)           dbs_r_iops
, SUM(dbs_w_iops)           dbs_w_iops
, SUM(dbs_rw_mbps)          dbs_rw_mbps
, SUM(dbs_r_mbps)           dbs_r_mbps
, SUM(dbs_w_mbps)           dbs_w_mbps
-- raw server capacity
, SUM(con_num_cpus)         con_num_cpus
, SUM(con_memory_size_gb)   con_memory_size_gb
, SUM(con_disk_size_raw_gb) con_disk_size_raw_gb
, SUM(con_rw_iops)          con_rw_iops
, SUM(con_r_iops)           con_r_iops
, SUM(con_w_iops)           con_w_iops
, SUM(con_rw_mbps)          con_rw_mbps
, SUM(con_r_mbps)           con_r_mbps
, SUM(con_w_mbps)           con_w_mbps
-- adjusted capacity
, SUM(cap_num_cpu)          cap_num_cpu
, SUM(cap_num_cpu_spec)     cap_num_cpu_spec
, SUM(cap_mem_size_gb)      cap_mem_size_gb
, SUM(cap_disk_size_gb)     cap_disk_size_gb
, SUM(cap_rw_iops)          cap_rw_iops
, SUM(cap_r_iops)           cap_r_iops
, SUM(cap_w_iops)           cap_w_iops
, SUM(cap_rw_mbps)          cap_rw_mbps
, SUM(cap_r_mbps)           cap_r_mbps
, SUM(cap_w_mbps)           cap_w_mbps
  FROM config_alloc_v
 GROUP BY
 -- client
  client_id
, client_name
-- plan
, plan_id
, plan_name;
--------------------------------------------------------
--  DDL for View PLAN_ALLOC_V2
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "PLAN_ALLOC_V2" ("CLIENT_ID", "CLIENT_NAME", "PLAN_ID", "PLAN_NAME", "DATABASES", "SOURCE_INSTANCES", "TARGET_INSTANCES", "ALLOCATED_INSTANCES", "NUM_CPU_STACKED", "MEM_SIZE_GB_STACKED", "DISK_SIZE_GB_STACKED", "RW_IOPS_STACKED", "RW_MBPS_STACKED", "NUM_CPU_REQUIRED", "MEM_SIZE_GB_REQUIRED", "DISK_SIZE_GB_REQUIRED", "RW_IOPS_REQUIRED", "RW_MBPS_REQUIRED", "NUM_CPU_RAW_CAPACITY", "MEM_SIZE_GB_RAW_CAPACITY", "DISK_SIZE_GB_RAW_CAPACITY", "RW_IOPS_RAW_CAPACITY", "RW_MBPS_RAW_CAPACITY", "NUM_CPU_ADJ_CAPACITY", "MEM_SIZE_GB_ADJ_CAPACITY", "DISK_SIZE_GB_ADJ_CAPACITY", "RW_IOPS_ADJ_CAPACITY", "RW_MBPS_ADJ_CAPACITY", "NUM_CPU_ALLOCATED", "MEM_SIZE_GB_ALLOCATED", "DISK_SIZE_GB_ALLOCATED", "RW_IOPS_ALLOCATED", "RW_MBPS_ALLOCATED", "NUM_CPU_FREE", "MEM_SIZE_GB_FREE", "DISK_SIZE_GB_FREE", "RW_IOPS_FREE", "RW_MBPS_FREE", "CPU_PERC_ALLOCATED", "MEM_PERC_ALLOCATED", "DISK_PERC_ALLOCATED", "RW_IOPS_PERC_ALLOCATED", "RW_MBPS_PERC_ALLOCATED", "CPU_PERC_AVAILABLE", "MEM_PERC_AVAILABLE", "DISK_PERC_AVAILABLE", "RW_IOPS_PERC_AVAILABLE", "RW_MBPS_PERC_AVAILABLE") AS 
  SELECT
-- client
  r.client_id
, r.client_name
-- plan
, r.plan_id
, r.plan_name
-- allocation
, a.databases               databases
, a.source_instances        source_instances
, a.target_instances        target_instances
, a.allocated_instances     allocated_instances
-- stacked time series peaks
, p.on_cpu               num_cpu_stacked
, p.mem_gb               mem_size_gb_stacked
, p.database_size_gb     disk_size_gb_stacked
, p.rw_iops              rw_iops_stacked
, p.rw_mbps              rw_mbps_stacked
-- plan requirements
, r.aas_cpu_demand       num_cpu_required
, r.mem_size_gb          mem_size_gb_required
, r.database_size_gb     disk_size_gb_required
, r.rw_iops              rw_iops_required
, r.rw_mbps              rw_mbps_required
-- raw server capacity
, a.con_num_cpus         num_cpu_raw_capacity
, a.con_memory_size_gb   mem_size_gb_raw_capacity
, a.con_disk_size_raw_gb disk_size_gb_raw_capacity
, a.con_rw_iops          rw_iops_raw_capacity
, a.con_rw_mbps          rw_mbps_raw_capacity
-- adjusted capacity
, a.cap_num_cpu          num_cpu_adj_capacity
, a.cap_mem_size_gb      mem_size_gb_adj_capacity
, a.cap_disk_size_gb     disk_size_gb_adj_capacity
, a.cap_rw_iops          rw_iops_adj_capacity
, a.cap_rw_mbps          rw_mbps_adj_capacity
-- allocated capacity
, a.pal_num_cpu          num_cpu_allocated
, a.pal_mem_size_gb      mem_size_gb_allocated
, a.pal_disk_size_gb     disk_size_gb_allocated
, a.pal_rw_iops          rw_iops_allocated
, a.pal_rw_mbps          rw_mbps_allocated
-- free capacity
, (a.cap_num_cpu       - a.pal_num_cpu)      num_cpu_free
, (a.cap_mem_size_gb   - a.pal_mem_size_gb)  mem_size_gb_free
, (a.cap_disk_size_gb  - a.pal_disk_size_gb) disk_size_gb_free
, (a.cap_rw_iops       - a.pal_rw_iops)      rw_iops_free
, (a.cap_rw_mbps       - a.pal_rw_mbps)      rw_mbps_free
-- percentages allocated
, a.pal_num_cpu_perc            cpu_perc_allocated
, a.pal_mem_size_perc           mem_perc_allocated
, a.pal_disk_size_perc          disk_perc_allocated
, a.pal_rw_iops_perc            rw_iops_perc_allocated
, a.pal_rw_mbps_perc            rw_mbps_perc_allocated
-- percentages available
, (100 - a.pal_num_cpu_perc)    cpu_perc_available
, (100 - a.pal_mem_size_perc)   mem_perc_available
, (100 - a.pal_disk_size_perc)  disk_perc_available
, (100 - a.pal_rw_iops_perc)    rw_iops_perc_available
, (100 - a.pal_rw_mbps_perc)    rw_mbps_perc_available
  FROM plan_requirements_v r,
       plan_alloc_v a,
       time_series_peaks_plan_v p
 WHERE a.plan_id(+) = r.plan_id
   AND p.plan_id(+) = r.plan_id;
--------------------------------------------------------
--  DDL for View PLAN_ALLOCATION_V
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "PLAN_ALLOCATION_V" ("CLIENT_ID", "CLIENT_NAME", "CLIENT_DESC", "PLAN_ID", "PLAN_NAME", "PLAN_DESC", "DATABASES", "SOURCE_INSTANCES", "TARGET_INSTANCES", "ALLOCATED_INSTANCES", "DBS_CPU_DEMAND", "DBS_MEM_SIZE_GB", "DBS_SGA_SIZE_GB", "DBS_PGA_SIZE_GB", "DBS_DATABASE_SIZE_GB", "DBS_RW_IOPS", "DBS_R_IOPS", "DBS_W_IOPS", "DBS_RW_MBPS", "DBS_R_MBPS", "DBS_W_MBPS", "DBS_CPU_DEMAND_SPEC", "COMPUTE_SERVERS", "STORAGE_SERVERS", "CON_NUM_CPUS", "CON_MEMORY_SIZE_GB", "CON_DISK_SIZE_RAW_GB", "CON_RW_IOPS", "CON_R_IOPS", "CON_W_IOPS", "CON_RW_MBPS", "CON_R_MBPS", "CON_W_MBPS", "CAP_NUM_CPU", "CAP_MEM_SIZE_GB", "CAP_DISK_SIZE_GB", "CAP_RW_IOPS", "CAP_R_IOPS", "CAP_W_IOPS", "CAP_RW_MBPS", "CAP_R_MBPS", "CAP_W_MBPS", "CAP_RESULT_PER_CORE", "CAP_NUM_CPU_SPEC", "PAL_NUM_CPU_SPEC", "PAL_NUM_CPU_PERC", "PAL_NUM_CPU", "PAL_MEM_SIZE_GB", "PAL_MEM_SIZE_PERC", "PAL_DISK_SIZE_GB", "PAL_DISK_SIZE_PERC", "PAL_RW_IOPS", "PAL_RW_IOPS_PERC", "PAL_R_IOPS", "PAL_R_IOPS_PERC", "PAL_W_IOPS", "PAL_W_IOPS_PERC", "PAL_RW_MBPS", "PAL_RW_MBPS_PERC", "PAL_R_MBPS", "PAL_R_MBPS_PERC", "PAL_W_MBPS", "PAL_W_MBPS_PERC") AS 
  SELECT
-- client
  client_id
, client_name
, client_desc
-- plan
, plan_id
, plan_name
, plan_desc
-- allocation
, COUNT(*)                      databases
, SUM(source_instances)         source_instances
, SUM(target_instances)         target_instances
, SUM(allocated_instances)      allocated_instances
-- requirements
, SUM(dbs_cpu_demand)           dbs_cpu_demand
, SUM(dbs_mem_size_gb)          dbs_mem_size_gb
, SUM(dbs_sga_size_gb)          dbs_sga_size_gb
, SUM(dbs_pga_size_gb)          dbs_pga_size_gb
, SUM(dbs_database_size_gb)     dbs_database_size_gb
, SUM(dbs_rw_iops)              dbs_rw_iops
, SUM(dbs_r_iops)               dbs_r_iops
, SUM(dbs_w_iops)               dbs_w_iops
, SUM(dbs_rw_mbps)              dbs_rw_mbps
, SUM(dbs_r_mbps)               dbs_r_mbps
, SUM(dbs_w_mbps)               dbs_w_mbps
, SUM(dbs_cpu_demand_spec)      dbs_cpu_demand_spec
-- configuration
, SUM(compute_servers)          compute_servers
, SUM(storage_servers)          storage_servers
-- raw configuration capacity
, SUM(con_num_cpus)             con_num_cpus
, SUM(con_memory_size_gb)       con_memory_size_gb
, SUM(con_disk_size_raw_gb)     con_disk_size_raw_gb
, SUM(con_rw_iops)              con_rw_iops
, SUM(con_r_iops)               con_r_iops
, SUM(con_w_iops)               con_w_iops
, SUM(con_rw_mbps)              con_rw_mbps
, SUM(con_r_mbps)               con_r_mbps
, SUM(con_w_mbps)               con_w_mbps
-- adjusted capacity
, SUM(cap_num_cpu)              cap_num_cpu
, SUM(cap_mem_size_gb)          cap_mem_size_gb
, SUM(cap_disk_size_gb)         cap_disk_size_gb
, SUM(cap_rw_iops)              cap_rw_iops
, SUM(cap_r_iops)               cap_r_iops
, SUM(cap_w_iops)               cap_w_iops
, SUM(cap_rw_mbps)              cap_rw_mbps
, SUM(cap_r_mbps)               cap_r_mbps
, SUM(cap_w_mbps)               cap_w_mbps
, SUM(cap_result_per_core)      cap_result_per_core
, SUM(cap_num_cpu_spec)         cap_num_cpu_spec
-- plan allocated
, SUM(dal_num_cpu_spec)                                             pal_num_cpu_spec
, ROUND(100 * SUM(dbs_cpu_demand_spec) / SUM(dal_num_cpu_spec), 1)  pal_num_cpu_perc
, SUM(dal_num_cpu)                                                  pal_num_cpu
, SUM(dbs_mem_size_gb)                                              pal_mem_size_gb
, ROUND(100 * SUM(dbs_mem_size_gb) / SUM(cap_mem_size_gb), 1)       pal_mem_size_perc
, SUM(dbs_database_size_gb)                                         pal_disk_size_gb
, ROUND(100 * SUM(dbs_database_size_gb) / SUM(cap_disk_size_gb), 1) pal_disk_size_perc
, SUM(dbs_rw_iops)                                                  pal_rw_iops
, ROUND(100 * SUM(dbs_rw_iops) / SUM(cap_rw_iops), 1)               pal_rw_iops_perc
, SUM(dbs_r_iops)                                                   pal_r_iops
, ROUND(100 * SUM(dbs_r_iops) / SUM(cap_r_iops), 1)                 pal_r_iops_perc
, SUM(dbs_w_iops)                                                   pal_w_iops
, ROUND(100 * SUM(dbs_w_iops) / SUM(cap_w_iops), 1)                 pal_w_iops_perc
, SUM(dbs_rw_mbps)                                                  pal_rw_mbps
, ROUND(100 * SUM(dbs_rw_mbps) / SUM(cap_rw_mbps), 1)               pal_rw_mbps_perc
, SUM(dbs_r_mbps)                                                   pal_r_mbps
, ROUND(100 * SUM(dbs_r_mbps) / SUM(cap_r_mbps), 1)                 pal_r_mbps_perc
, SUM(dbs_w_mbps)                                                   pal_w_mbps
, ROUND(100 * SUM(dbs_w_mbps) / SUM(cap_w_mbps), 1)                 pal_w_mbps_perc
  FROM db_allocation_v
 GROUP BY
-- client
  client_id
, client_name
, client_desc
-- plan
, plan_id
, plan_name
, plan_desc;
--------------------------------------------------------
--  DDL for View PLAN_CAPACITY_V
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "PLAN_CAPACITY_V" ("CLIENT_ID", "CLIENT_NAME", "CLIENT_DESC", "PLAN_ID", "PLAN_NAME", "PLAN_DESC", "CONFIGURATIONS", "COMPUTE_SERVERS", "STORAGE_SERVERS", "RAW_NUM_CPUS", "RAW_MEMORY_SIZE_GB", "RAW_DISK_SIZE_RAW_GB", "RAW_RW_IOPS", "RAW_R_IOPS", "RAW_W_IOPS", "RAW_RW_MBPS", "RAW_R_MBPS", "RAW_W_MBPS", "RAW_NUM_CPUS_SPEC", "CAP_NUM_CPU", "CAP_MEM_SIZE_GB", "CAP_DISK_SIZE_GB", "CAP_RW_IOPS", "CAP_R_IOPS", "CAP_W_IOPS", "CAP_RW_MBPS", "CAP_R_MBPS", "CAP_W_MBPS", "CAP_NUM_CPU_SPEC") AS 
  SELECT
-- client
  client_id
, client_name
, client_desc
-- plan
, plan_id
, plan_name
, plan_desc
-- configuration
, COUNT(*)              configurations
, SUM(compute_servers)  compute_servers
, SUM(storage_servers)  storage_servers
-- raw server capacity
, SUM(num_cpus)         raw_num_cpus
, SUM(memory_size_gb)   raw_memory_size_gb
, SUM(disk_size_raw_gb) raw_disk_size_raw_gb
, SUM(rw_iops)          raw_rw_iops
, SUM(r_iops)           raw_r_iops
, SUM(w_iops)           raw_w_iops
, SUM(rw_mbps)          raw_rw_mbps
, SUM(r_mbps)           raw_r_mbps
, SUM(w_mbps)           raw_w_mbps
-- spec
, SUM(num_cpus_spec)    raw_num_cpus_spec
-- adjusted capacity
, SUM(cap_num_cpu)      cap_num_cpu
, SUM(cap_mem_size_gb)  cap_mem_size_gb
, SUM(cap_disk_size_gb) cap_disk_size_gb
, SUM(cap_rw_iops)      cap_rw_iops
, SUM(cap_r_iops)       cap_r_iops
, SUM(cap_w_iops)       cap_w_iops
, SUM(cap_rw_mbps)      cap_rw_mbps
, SUM(cap_r_mbps)       cap_r_mbps
, SUM(cap_w_mbps)       cap_w_mbps
, SUM(cap_num_cpu_spec) cap_num_cpu_spec
  FROM conf_per_plan_v
 GROUP BY
-- client
  client_id
, client_name
, client_desc
-- plan
, plan_id
, plan_name
, plan_desc;
--------------------------------------------------------
--  DDL for View PLAN_METRICS_V
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "PLAN_METRICS_V" ("CLIENT_ID", "CLIENT_NAME", "PLAN_ID", "PLAN_NAME", "ORDER_BY", "RESRC", "STACKED", "REQUIRED", "RAW_CAPACITY", "ADJ_CAPACITY", "ALLOCATED", "AVAILABLE", "PERC_ALLOC", "PERC_AVAIL") AS 
  SELECT
-- client
  client_id
, client_name
-- plan
, plan_id
, plan_name
-- metric
, 1 order_by
, 'Num of CPUs'         resrc
, num_cpu_stacked       stacked
, num_cpu_required      required
, num_cpu_raw_capacity  raw_capacity
, num_cpu_adj_capacity  adj_capacity
, num_cpu_allocated     allocated
, num_cpu_free          available
, cpu_perc_allocated    perc_alloc
, cpu_perc_available    perc_avail
  FROM plan_alloc_v2
 UNION ALL
SELECT
-- client
  client_id
, client_name
-- plan
, plan_id
, plan_name
-- metric
, 2 order_by
, 'Mem Size GBs'            resrc
, mem_size_gb_stacked       stacked
, mem_size_gb_required      required
, mem_size_gb_raw_capacity  raw_capacity
, mem_size_gb_adj_capacity  adj_capacity
, mem_size_gb_allocated     allocated
, mem_size_gb_free          available
, mem_perc_allocated        perc_alloc
, mem_perc_available        perc_avail
  FROM plan_alloc_v2
 UNION ALL
SELECT
-- client
  client_id
, client_name
-- plan
, plan_id
, plan_name
-- metric
, 3 order_by
, 'Disk Size GBs'            resrc
, disk_size_gb_stacked       stacked
, disk_size_gb_required      required
, disk_size_gb_raw_capacity  raw_capacity
, disk_size_gb_adj_capacity  adj_capacity
, disk_size_gb_allocated     allocated
, disk_size_gb_free          available
, disk_perc_allocated        perc_alloc
, disk_perc_available        perc_avail
  FROM plan_alloc_v2
 UNION ALL
SELECT
-- client
  client_id
, client_name
-- plan
, plan_id
, plan_name
-- metric
, 4 order_by
, 'RW IOPS'                 resrc
, rw_iops_stacked           stacked
, rw_iops_required          required
, rw_iops_raw_capacity      raw_capacity
, rw_iops_adj_capacity      adj_capacity
, rw_iops_allocated         allocated
, rw_iops_free              available
, rw_iops_perc_allocated    perc_alloc
, rw_iops_perc_available    perc_avail
  FROM plan_alloc_v2
 UNION ALL
SELECT
-- client
  client_id
, client_name
-- plan
, plan_id
, plan_name
-- metric
, 5 order_by
, 'RW MBPS'                 resrc
, rw_mbps_stacked           stacked
, rw_mbps_required          required
, rw_mbps_raw_capacity      raw_capacity
, rw_mbps_adj_capacity      adj_capacity
, rw_mbps_allocated         allocated
, rw_mbps_free              available
, rw_mbps_perc_allocated    perc_alloc
, rw_mbps_perc_available    perc_avail
  FROM plan_alloc_v2;
--------------------------------------------------------
--  DDL for View PLAN_REQUIREMENTS_V
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "PLAN_REQUIREMENTS_V" ("PLAN_ID", "CLIENT_ID", "PLAN_NAME", "PLAN_DESC", "CLIENT_NAME", "CLIENT_DESC", "DATABASES", "SOURCE_INSTANCES", "TARGET_INSTANCES", "AAS_CPU_DEMAND", "MEM_SIZE_GB", "SGA_SIZE_GB", "PGA_SIZE_GB", "DATABASE_SIZE_GB", "RW_IOPS", "R_IOPS", "W_IOPS", "RW_MBPS", "R_MBPS", "W_MBPS", "RESULT_PER_CORE", "AAS_CPU_DEMAND_SPEC", "MAX_CPU_COUNT", "SUM_CPU_COUNT", "CPU_METHOD", "CPU_STATISTIC", "INCLUDE_RESMGR_CPU_QUANTUM", "CAP_TO_NUM_CPUS", "DISK_PERFORMANCE_METHOD", "DISK_PERFORMANCE_STATISTIC", "AAS_CPU_DEMAND_MAN", "RW_IOPS_MAN", "R_IOPS_MAN", "W_IOPS_MAN", "RW_MBPS_MAN", "R_MBPS_MAN", "W_MBPS_MAN", "AAS_ON_CPU_AND_RESMGR_PEAK", "AAS_ON_CPU_PEAK", "AAS_ON_CPU_AND_RESMGR_9999", "AAS_ON_CPU_9999", "AAS_ON_CPU_AND_RESMGR_999", "AAS_ON_CPU_999", "AAS_ON_CPU_AND_RESMGR_99", "AAS_ON_CPU_99", "AAS_ON_CPU_AND_RESMGR_97", "AAS_ON_CPU_97", "AAS_ON_CPU_AND_RESMGR_95", "AAS_ON_CPU_95", "AAS_ON_CPU_AND_RESMGR_90", "AAS_ON_CPU_90", "AAS_ON_CPU_AND_RESMGR_75", "AAS_ON_CPU_75", "AAS_ON_CPU_AND_RESMGR_MEDIAN", "AAS_ON_CPU_MEDIAN", "AAS_ON_CPU_AND_RESMGR_AVG", "AAS_ON_CPU_AVG", "CAS_ON_CPU_AND_RESMGR_MAX", "CAS_ON_CPU_MAX", "CAS_ON_CPU_AND_RESMGR_99P", "CAS_ON_CPU_99P", "CAS_ON_CPU_AND_RESMGR_97P", "CAS_ON_CPU_97P", "CAS_ON_CPU_AND_RESMGR_95P", "CAS_ON_CPU_95P", "CAS_ON_CPU_AND_RESMGR_90P", "CAS_ON_CPU_90P", "CAS_ON_CPU_AND_RESMGR_75P", "CAS_ON_CPU_75P", "CAS_ON_CPU_AND_RESMGR_MED", "CAS_ON_CPU_MED", "CAS_ON_CPU_AND_RESMGR_AVG", "CAS_ON_CPU_AVG", "RW_IOPS_PEAK_A", "R_IOPS_PEAK_A", "W_IOPS_PEAK_A", "RW_IOPS_999_A", "R_IOPS_999_A", "W_IOPS_999_A", "RW_IOPS_99_A", "R_IOPS_99_A", "W_IOPS_99_A", "RW_IOPS_97_A", "R_IOPS_97_A", "W_IOPS_97_A", "RW_IOPS_95_A", "R_IOPS_95_A", "W_IOPS_95_A", "RW_IOPS_90_A", "R_IOPS_90_A", "W_IOPS_90_A", "RW_IOPS_75_A", "R_IOPS_75_A", "W_IOPS_75_A", "RW_IOPS_MEDIAN_A", "R_IOPS_MEDIAN_A", "W_IOPS_MEDIAN_A", "RW_IOPS_AVG_A", "R_IOPS_AVG_A", "W_IOPS_AVG_A", "RW_MBPS_PEAK_A", "R_MBPS_PEAK_A", "W_MBPS_PEAK_A", "RW_MBPS_999_A", "R_MBPS_999_A", "W_MBPS_999_A", "RW_MBPS_99_A", "R_MBPS_99_A", "W_MBPS_99_A", "RW_MBPS_97_A", "R_MBPS_97_A", "W_MBPS_97_A", "RW_MBPS_95_A", "R_MBPS_95_A", "W_MBPS_95_A", "RW_MBPS_90_A", "R_MBPS_90_A", "W_MBPS_90_A", "RW_MBPS_75_A", "R_MBPS_75_A", "W_MBPS_75_A", "RW_MBPS_MEDIAN_A", "R_MBPS_MEDIAN_A", "W_MBPS_MEDIAN_A", "RW_MBPS_AVG_A", "R_MBPS_AVG_A", "W_MBPS_AVG_A", "RW_IOPS_PEAK_C", "R_IOPS_PEAK_C", "W_IOPS_PEAK_C", "RW_IOPS_999_C", "R_IOPS_999_C", "W_IOPS_999_C", "RW_IOPS_99_C", "R_IOPS_99_C", "W_IOPS_99_C", "RW_IOPS_97_C", "R_IOPS_97_C", "W_IOPS_97_C", "RW_IOPS_95_C", "R_IOPS_95_C", "W_IOPS_95_C", "RW_IOPS_90_C", "R_IOPS_90_C", "W_IOPS_90_C", "RW_IOPS_75_C", "R_IOPS_75_C", "W_IOPS_75_C", "RW_IOPS_MEDIAN_C", "R_IOPS_MEDIAN_C", "W_IOPS_MEDIAN_C", "RW_IOPS_AVG_C", "R_IOPS_AVG_C", "W_IOPS_AVG_C", "RW_MBPS_PEAK_C", "R_MBPS_PEAK_C", "W_MBPS_PEAK_C", "RW_MBPS_999_C", "R_MBPS_999_C", "W_MBPS_999_C", "RW_MBPS_99_C", "R_MBPS_99_C", "W_MBPS_99_C", "RW_MBPS_97_C", "R_MBPS_97_C", "W_MBPS_97_C", "RW_MBPS_95_C", "R_MBPS_95_C", "W_MBPS_95_C", "RW_MBPS_90_C", "R_MBPS_90_C", "W_MBPS_90_C", "RW_MBPS_75_C", "R_MBPS_75_C", "W_MBPS_75_C", "RW_MBPS_MEDIAN_C", "R_MBPS_MEDIAN_C", "W_MBPS_MEDIAN_C", "RW_MBPS_AVG_C", "R_MBPS_AVG_C", "W_MBPS_AVG_C") AS 
  SELECT
  pln.plan_id
, pln.client_id
, pln.plan_name
, pln.plan_desc
, dbp.client_name
, dbp.client_desc
, COUNT(*) databases
, SUM(dbp.source_instances) source_instances
, SUM(dbp.target_instances) target_instances
, ROUND(SUM(dbp.aas_cpu_demand)) aas_cpu_demand
, ROUND(SUM(dbp.mem_size_gb)) mem_size_gb
, ROUND(SUM(dbp.sga_size_gb)) sga_size_gb
, ROUND(SUM(dbp.pga_size_gb)) pga_size_gb
, ROUND(SUM(dbp.database_size_gb)) database_size_gb
, ROUND(SUM(dbp.rw_iops)) rw_iops
, ROUND(SUM(dbp.r_iops)) r_iops
, ROUND(SUM(dbp.w_iops)) w_iops
, ROUND(SUM(dbp.rw_mbps)) rw_mbps
, ROUND(SUM(dbp.r_mbps)) r_mbps
, ROUND(SUM(dbp.w_mbps)) w_mbps
, ROUND(AVG(dbp.result_per_core), 1) result_per_core
, ROUND(SUM(dbp.aas_cpu_demand_spec)) aas_cpu_demand_spec
, MAX(dbp.cpu_count                    ) max_cpu_count
, SUM(dbp.cpu_count                    ) sum_cpu_count
-- sourcing method
, pln.cpu_method
, pln.cpu_statistic
, pln.include_resmgr_cpu_quantum
, pln.cap_to_num_cpus
, pln.disk_performance_method
, pln.disk_performance_statistic
-- manual part
, SUM(dbp.aas_cpu_demand_man) aas_cpu_demand_man
, SUM(dbp.rw_iops_man       ) rw_iops_man
, SUM(dbp.r_iops_man        ) r_iops_man
, SUM(dbp.w_iops_man        ) w_iops_man
, SUM(dbp.rw_mbps_man       ) rw_mbps_man
, SUM(dbp.r_mbps_man        ) r_mbps_man
, SUM(dbp.w_mbps_man        ) w_mbps_man
-- cpu demand details (EH entire history)
, SUM(dbp.aas_on_cpu_and_resmgr_peak   ) aas_on_cpu_and_resmgr_peak
, SUM(dbp.aas_on_cpu_peak              ) aas_on_cpu_peak
, SUM(dbp.aas_on_cpu_and_resmgr_9999   ) aas_on_cpu_and_resmgr_9999
, SUM(dbp.aas_on_cpu_9999              ) aas_on_cpu_9999
, SUM(dbp.aas_on_cpu_and_resmgr_999    ) aas_on_cpu_and_resmgr_999
, SUM(dbp.aas_on_cpu_999               ) aas_on_cpu_999
, SUM(dbp.aas_on_cpu_and_resmgr_99     ) aas_on_cpu_and_resmgr_99
, SUM(dbp.aas_on_cpu_99                ) aas_on_cpu_99
, SUM(dbp.aas_on_cpu_and_resmgr_97     ) aas_on_cpu_and_resmgr_97
, SUM(dbp.aas_on_cpu_97                ) aas_on_cpu_97
, SUM(dbp.aas_on_cpu_and_resmgr_95     ) aas_on_cpu_and_resmgr_95
, SUM(dbp.aas_on_cpu_95                ) aas_on_cpu_95
, SUM(dbp.aas_on_cpu_and_resmgr_90     ) aas_on_cpu_and_resmgr_90
, SUM(dbp.aas_on_cpu_90                ) aas_on_cpu_90
, SUM(dbp.aas_on_cpu_and_resmgr_75     ) aas_on_cpu_and_resmgr_75
, SUM(dbp.aas_on_cpu_75                ) aas_on_cpu_75
, SUM(dbp.aas_on_cpu_and_resmgr_median ) aas_on_cpu_and_resmgr_median
, SUM(dbp.aas_on_cpu_median            ) aas_on_cpu_median
, SUM(dbp.aas_on_cpu_and_resmgr_avg    ) aas_on_cpu_and_resmgr_avg
, SUM(dbp.aas_on_cpu_avg               ) aas_on_cpu_avg
-- cpu demand details (HS hourly stats)
, SUM(dbp.cas_on_cpu_and_resmgr_max    ) cas_on_cpu_and_resmgr_max
, SUM(dbp.cas_on_cpu_max               ) cas_on_cpu_max
, SUM(dbp.cas_on_cpu_and_resmgr_99p    ) cas_on_cpu_and_resmgr_99p
, SUM(dbp.cas_on_cpu_99p               ) cas_on_cpu_99p
, SUM(dbp.cas_on_cpu_and_resmgr_97p    ) cas_on_cpu_and_resmgr_97p
, SUM(dbp.cas_on_cpu_97p               ) cas_on_cpu_97p
, SUM(dbp.cas_on_cpu_and_resmgr_95p    ) cas_on_cpu_and_resmgr_95p
, SUM(dbp.cas_on_cpu_95p               ) cas_on_cpu_95p
, SUM(dbp.cas_on_cpu_and_resmgr_90p    ) cas_on_cpu_and_resmgr_90p
, SUM(dbp.cas_on_cpu_90p               ) cas_on_cpu_90p
, SUM(dbp.cas_on_cpu_and_resmgr_75p    ) cas_on_cpu_and_resmgr_75p
, SUM(dbp.cas_on_cpu_75p               ) cas_on_cpu_75p
, SUM(dbp.cas_on_cpu_and_resmgr_med    ) cas_on_cpu_and_resmgr_med
, SUM(dbp.cas_on_cpu_med               ) cas_on_cpu_med
, SUM(dbp.cas_on_cpu_and_resmgr_avg    ) cas_on_cpu_and_resmgr_avg
, SUM(dbp.cas_on_cpu_avg               ) cas_on_cpu_avg
-- disk perf details Aggregated (IH instance history)
, SUM(dbp.rw_iops_peak_a               ) rw_iops_peak_a
, SUM(dbp.r_iops_peak_a                ) r_iops_peak_a
, SUM(dbp.w_iops_peak_a                ) w_iops_peak_a
, SUM(dbp.rw_iops_999_a                ) rw_iops_999_a
, SUM(dbp.r_iops_999_a                 ) r_iops_999_a
, SUM(dbp.w_iops_999_a                 ) w_iops_999_a
, SUM(dbp.rw_iops_99_a                 ) rw_iops_99_a
, SUM(dbp.r_iops_99_a                  ) r_iops_99_a
, SUM(dbp.w_iops_99_a                  ) w_iops_99_a
, SUM(dbp.rw_iops_97_a                 ) rw_iops_97_a
, SUM(dbp.r_iops_97_a                  ) r_iops_97_a
, SUM(dbp.w_iops_97_a                  ) w_iops_97_a
, SUM(dbp.rw_iops_95_a                 ) rw_iops_95_a
, SUM(dbp.r_iops_95_a                  ) r_iops_95_a
, SUM(dbp.w_iops_95_a                  ) w_iops_95_a
, SUM(dbp.rw_iops_90_a                 ) rw_iops_90_a
, SUM(dbp.r_iops_90_a                  ) r_iops_90_a
, SUM(dbp.w_iops_90_a                  ) w_iops_90_a
, SUM(dbp.rw_iops_75_a                 ) rw_iops_75_a
, SUM(dbp.r_iops_75_a                  ) r_iops_75_a
, SUM(dbp.w_iops_75_a                  ) w_iops_75_a
, SUM(dbp.rw_iops_median_a             ) rw_iops_median_a
, SUM(dbp.r_iops_median_a              ) r_iops_median_a
, SUM(dbp.w_iops_median_a              ) w_iops_median_a
, SUM(dbp.rw_iops_avg_a                ) rw_iops_avg_a
, SUM(dbp.r_iops_avg_a                 ) r_iops_avg_a
, SUM(dbp.w_iops_avg_a                 ) w_iops_avg_a
, SUM(dbp.rw_mbps_peak_a               ) rw_mbps_peak_a
, SUM(dbp.r_mbps_peak_a                ) r_mbps_peak_a
, SUM(dbp.w_mbps_peak_a                ) w_mbps_peak_a
, SUM(dbp.rw_mbps_999_a                ) rw_mbps_999_a
, SUM(dbp.r_mbps_999_a                 ) r_mbps_999_a
, SUM(dbp.w_mbps_999_a                 ) w_mbps_999_a
, SUM(dbp.rw_mbps_99_a                 ) rw_mbps_99_a
, SUM(dbp.r_mbps_99_a                  ) r_mbps_99_a
, SUM(dbp.w_mbps_99_a                  ) w_mbps_99_a
, SUM(dbp.rw_mbps_97_a                 ) rw_mbps_97_a
, SUM(dbp.r_mbps_97_a                  ) r_mbps_97_a
, SUM(dbp.w_mbps_97_a                  ) w_mbps_97_a
, SUM(dbp.rw_mbps_95_a                 ) rw_mbps_95_a
, SUM(dbp.r_mbps_95_a                  ) r_mbps_95_a
, SUM(dbp.w_mbps_95_a                  ) w_mbps_95_a
, SUM(dbp.rw_mbps_90_a                 ) rw_mbps_90_a
, SUM(dbp.r_mbps_90_a                  ) r_mbps_90_a
, SUM(dbp.w_mbps_90_a                  ) w_mbps_90_a
, SUM(dbp.rw_mbps_75_a                 ) rw_mbps_75_a
, SUM(dbp.r_mbps_75_a                  ) r_mbps_75_a
, SUM(dbp.w_mbps_75_a                  ) w_mbps_75_a
, SUM(dbp.rw_mbps_median_a             ) rw_mbps_median_a
, SUM(dbp.r_mbps_median_a              ) r_mbps_median_a
, SUM(dbp.w_mbps_median_a              ) w_mbps_median_a
, SUM(dbp.rw_mbps_avg_a                ) rw_mbps_avg_a
, SUM(dbp.r_mbps_avg_a                 ) r_mbps_avg_a
, SUM(dbp.w_mbps_avg_a                 ) w_mbps_avg_a
-- disk perf details Combined (DH database history)
, SUM(dbp.rw_iops_peak_c               ) rw_iops_peak_c
, SUM(dbp.r_iops_peak_c                ) r_iops_peak_c
, SUM(dbp.w_iops_peak_c                ) w_iops_peak_c
, SUM(dbp.rw_iops_999_c                ) rw_iops_999_c
, SUM(dbp.r_iops_999_c                 ) r_iops_999_c
, SUM(dbp.w_iops_999_c                 ) w_iops_999_c
, SUM(dbp.rw_iops_99_c                 ) rw_iops_99_c
, SUM(dbp.r_iops_99_c                  ) r_iops_99_c
, SUM(dbp.w_iops_99_c                  ) w_iops_99_c
, SUM(dbp.rw_iops_97_c                 ) rw_iops_97_c
, SUM(dbp.r_iops_97_c                  ) r_iops_97_c
, SUM(dbp.w_iops_97_c                  ) w_iops_97_c
, SUM(dbp.rw_iops_95_c                 ) rw_iops_95_c
, SUM(dbp.r_iops_95_c                  ) r_iops_95_c
, SUM(dbp.w_iops_95_c                  ) w_iops_95_c
, SUM(dbp.rw_iops_90_c                 ) rw_iops_90_c
, SUM(dbp.r_iops_90_c                  ) r_iops_90_c
, SUM(dbp.w_iops_90_c                  ) w_iops_90_c
, SUM(dbp.rw_iops_75_c                 ) rw_iops_75_c
, SUM(dbp.r_iops_75_c                  ) r_iops_75_c
, SUM(dbp.w_iops_75_c                  ) w_iops_75_c
, SUM(dbp.rw_iops_median_c             ) rw_iops_median_c
, SUM(dbp.r_iops_median_c              ) r_iops_median_c
, SUM(dbp.w_iops_median_c              ) w_iops_median_c
, SUM(dbp.rw_iops_avg_c                ) rw_iops_avg_c
, SUM(dbp.r_iops_avg_c                 ) r_iops_avg_c
, SUM(dbp.w_iops_avg_c                 ) w_iops_avg_c
, SUM(dbp.rw_mbps_peak_c               ) rw_mbps_peak_c
, SUM(dbp.r_mbps_peak_c                ) r_mbps_peak_c
, SUM(dbp.w_mbps_peak_c                ) w_mbps_peak_c
, SUM(dbp.rw_mbps_999_c                ) rw_mbps_999_c
, SUM(dbp.r_mbps_999_c                 ) r_mbps_999_c
, SUM(dbp.w_mbps_999_c                 ) w_mbps_999_c
, SUM(dbp.rw_mbps_99_c                 ) rw_mbps_99_c
, SUM(dbp.r_mbps_99_c                  ) r_mbps_99_c
, SUM(dbp.w_mbps_99_c                  ) w_mbps_99_c
, SUM(dbp.rw_mbps_97_c                 ) rw_mbps_97_c
, SUM(dbp.r_mbps_97_c                  ) r_mbps_97_c
, SUM(dbp.w_mbps_97_c                  ) w_mbps_97_c
, SUM(dbp.rw_mbps_95_c                 ) rw_mbps_95_c
, SUM(dbp.r_mbps_95_c                  ) r_mbps_95_c
, SUM(dbp.w_mbps_95_c                  ) w_mbps_95_c
, SUM(dbp.rw_mbps_90_c                 ) rw_mbps_90_c
, SUM(dbp.r_mbps_90_c                  ) r_mbps_90_c
, SUM(dbp.w_mbps_90_c                  ) w_mbps_90_c
, SUM(dbp.rw_mbps_75_c                 ) rw_mbps_75_c
, SUM(dbp.r_mbps_75_c                  ) r_mbps_75_c
, SUM(dbp.w_mbps_75_c                  ) w_mbps_75_c
, SUM(dbp.rw_mbps_median_c             ) rw_mbps_median_c
, SUM(dbp.r_mbps_median_c              ) r_mbps_median_c
, SUM(dbp.w_mbps_median_c              ) w_mbps_median_c
, SUM(dbp.rw_mbps_avg_c                ) rw_mbps_avg_c
, SUM(dbp.r_mbps_avg_c                 ) r_mbps_avg_c
, SUM(dbp.w_mbps_avg_c                 ) w_mbps_avg_c
  FROM plan          pln,
       db_per_plan_v dbp
 WHERE dbp.plan_id   = pln.plan_id
   AND dbp.client_id = pln.client_id
 GROUP BY
  pln.plan_id
, pln.client_id
, pln.plan_name
, pln.plan_desc
, pln.cpu_method
, pln.cpu_statistic
, pln.include_resmgr_cpu_quantum
, pln.cap_to_num_cpus
, pln.disk_performance_method
, pln.disk_performance_statistic
, dbp.client_name
, dbp.client_desc;
--------------------------------------------------------
--  DDL for View PLAN_REQUIREMENTS_V2
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "PLAN_REQUIREMENTS_V2" ("CLIENT_ID", "PLAN_ID", "EH_CPU_AND_RESMGR_MAX", "EH_CPU_MAX", "EH_CPU_AND_RESMGR_9999P", "EH_CPU_9999P", "EH_CPU_AND_RESMGR_999P", "EH_CPU_999P", "EH_CPU_AND_RESMGR_99P", "EH_CPU_99P", "EH_CPU_AND_RESMGR_97P", "EH_CPU_97P", "EH_CPU_AND_RESMGR_95P", "EH_CPU_95P", "EH_CPU_AND_RESMGR_90P", "EH_CPU_90P", "EH_CPU_AND_RESMGR_75P", "EH_CPU_75P", "EH_CPU_AND_RESMGR_MED", "EH_CPU_MED", "EH_CPU_AND_RESMGR_AVG", "EH_CPU_AVG", "HS_CPU_AND_RESMGR_MAX", "HS_CPU_MAX", "HS_CPU_AND_RESMGR_99P", "HS_CPU_99P", "HS_CPU_AND_RESMGR_97P", "HS_CPU_97P", "HS_CPU_AND_RESMGR_95P", "HS_CPU_95P", "HS_CPU_AND_RESMGR_90P", "HS_CPU_90P", "HS_CPU_AND_RESMGR_75P", "HS_CPU_75P", "HS_CPU_AND_RESMGR_MED", "HS_CPU_MED", "HS_CPU_AND_RESMGR_AVG", "HS_CPU_AVG", "CPUS_MANUAL_ENTRY", "INST_CPU_COUNT_SUM", "INST_CPU_COUNT_MAX", "HOST_NUM_CPUS", "HOST_NUM_CPU_CORES", "HOST_LOAD", "CPUS_REQUIRED", "IH_RW_IOPS_PEAK", "IH_R_IOPS_PEAK", "IH_W_IOPS_PEAK", "IH_RW_IOPS_999", "IH_R_IOPS_999", "IH_W_IOPS_999", "IH_RW_IOPS_99", "IH_R_IOPS_99", "IH_W_IOPS_99", "IH_RW_IOPS_97", "IH_R_IOPS_97", "IH_W_IOPS_97", "IH_RW_IOPS_95", "IH_R_IOPS_95", "IH_W_IOPS_95", "IH_RW_IOPS_90", "IH_R_IOPS_90", "IH_W_IOPS_90", "IH_RW_IOPS_75", "IH_R_IOPS_75", "IH_W_IOPS_75", "IH_RW_IOPS_MEDIAN", "IH_R_IOPS_MEDIAN", "IH_W_IOPS_MEDIAN", "IH_RW_IOPS_AVG", "IH_R_IOPS_AVG", "IH_W_IOPS_AVG", "DH_RW_IOPS_PEAK", "DH_R_IOPS_PEAK", "DH_W_IOPS_PEAK", "DH_RW_IOPS_999", "DH_R_IOPS_999", "DH_W_IOPS_999", "DH_RW_IOPS_99", "DH_R_IOPS_99", "DH_W_IOPS_99", "DH_RW_IOPS_97", "DH_R_IOPS_97", "DH_W_IOPS_97", "DH_RW_IOPS_95", "DH_R_IOPS_95", "DH_W_IOPS_95", "DH_RW_IOPS_90", "DH_R_IOPS_90", "DH_W_IOPS_90", "DH_RW_IOPS_75", "DH_R_IOPS_75", "DH_W_IOPS_75", "DH_RW_IOPS_MEDIAN", "DH_R_IOPS_MEDIAN", "DH_W_IOPS_MEDIAN", "DH_RW_IOPS_AVG", "DH_R_IOPS_AVG", "DH_W_IOPS_AVG", "RW_IOPS_MAN", "R_IOPS_MAN", "W_IOPS_MAN", "RW_IOPS_REQUIRED", "R_IOPS_REQUIRED", "W_IOPS_REQUIRED", "IH_RW_MBPS_PEAK", "IH_R_MBPS_PEAK", "IH_W_MBPS_PEAK", "IH_RW_MBPS_999", "IH_R_MBPS_999", "IH_W_MBPS_999", "IH_RW_MBPS_99", "IH_R_MBPS_99", "IH_W_MBPS_99", "IH_RW_MBPS_97", "IH_R_MBPS_97", "IH_W_MBPS_97", "IH_RW_MBPS_95", "IH_R_MBPS_95", "IH_W_MBPS_95", "IH_RW_MBPS_90", "IH_R_MBPS_90", "IH_W_MBPS_90", "IH_RW_MBPS_75", "IH_R_MBPS_75", "IH_W_MBPS_75", "IH_RW_MBPS_MEDIAN", "IH_R_MBPS_MEDIAN", "IH_W_MBPS_MEDIAN", "IH_RW_MBPS_AVG", "IH_R_MBPS_AVG", "IH_W_MBPS_AVG", "DH_RW_MBPS_PEAK", "DH_R_MBPS_PEAK", "DH_W_MBPS_PEAK", "DH_RW_MBPS_999", "DH_R_MBPS_999", "DH_W_MBPS_999", "DH_RW_MBPS_99", "DH_R_MBPS_99", "DH_W_MBPS_99", "DH_RW_MBPS_97", "DH_R_MBPS_97", "DH_W_MBPS_97", "DH_RW_MBPS_95", "DH_R_MBPS_95", "DH_W_MBPS_95", "DH_RW_MBPS_90", "DH_R_MBPS_90", "DH_W_MBPS_90", "DH_RW_MBPS_75", "DH_R_MBPS_75", "DH_W_MBPS_75", "DH_RW_MBPS_MEDIAN", "DH_R_MBPS_MEDIAN", "DH_W_MBPS_MEDIAN", "DH_RW_MBPS_AVG", "DH_R_MBPS_AVG", "DH_W_MBPS_AVG", "RW_MBPS_MAN", "R_MBPS_MAN", "W_MBPS_MAN", "RW_MBPS_REQUIRED", "R_MBPS_REQUIRED", "W_MBPS_REQUIRED") AS 
  SELECT
  p.client_id
, p.plan_id
-- cpu demand details (EH entire history)
, p.aas_on_cpu_and_resmgr_peak   eh_cpu_and_resmgr_max
, p.aas_on_cpu_peak              eh_cpu_max
, p.aas_on_cpu_and_resmgr_9999   eh_cpu_and_resmgr_9999p
, p.aas_on_cpu_9999              eh_cpu_9999p
, p.aas_on_cpu_and_resmgr_999    eh_cpu_and_resmgr_999p
, p.aas_on_cpu_999               eh_cpu_999p
, p.aas_on_cpu_and_resmgr_99     eh_cpu_and_resmgr_99p
, p.aas_on_cpu_99                eh_cpu_99p
, p.aas_on_cpu_and_resmgr_97     eh_cpu_and_resmgr_97p
, p.aas_on_cpu_97                eh_cpu_97p
, p.aas_on_cpu_and_resmgr_95     eh_cpu_and_resmgr_95p
, p.aas_on_cpu_95                eh_cpu_95p
, p.aas_on_cpu_and_resmgr_90     eh_cpu_and_resmgr_90p
, p.aas_on_cpu_90                eh_cpu_90p
, p.aas_on_cpu_and_resmgr_75     eh_cpu_and_resmgr_75p
, p.aas_on_cpu_75                eh_cpu_75p
, p.aas_on_cpu_and_resmgr_median eh_cpu_and_resmgr_med
, p.aas_on_cpu_median            eh_cpu_med
, p.aas_on_cpu_and_resmgr_avg    eh_cpu_and_resmgr_avg
, p.aas_on_cpu_avg               eh_cpu_avg
-- cpu demand details (HS hourly stats)
, p.cas_on_cpu_and_resmgr_max    hs_cpu_and_resmgr_max
, p.cas_on_cpu_max               hs_cpu_max
, p.cas_on_cpu_and_resmgr_99p    hs_cpu_and_resmgr_99p
, p.cas_on_cpu_99p               hs_cpu_99p
, p.cas_on_cpu_and_resmgr_97p    hs_cpu_and_resmgr_97p
, p.cas_on_cpu_97p               hs_cpu_97p
, p.cas_on_cpu_and_resmgr_95p    hs_cpu_and_resmgr_95p
, p.cas_on_cpu_95p               hs_cpu_95p
, p.cas_on_cpu_and_resmgr_90p    hs_cpu_and_resmgr_90p
, p.cas_on_cpu_90p               hs_cpu_90p
, p.cas_on_cpu_and_resmgr_75p    hs_cpu_and_resmgr_75p
, p.cas_on_cpu_75p               hs_cpu_75p
, p.cas_on_cpu_and_resmgr_med    hs_cpu_and_resmgr_med
, p.cas_on_cpu_med               hs_cpu_med
, p.cas_on_cpu_and_resmgr_avg    hs_cpu_and_resmgr_avg
, p.cas_on_cpu_avg               hs_cpu_avg
-- cpu manual part
, p.aas_cpu_demand_man           cpus_manual_entry
-- cpu database and host metrics
, p.sum_cpu_count                inst_cpu_count_sum
, p.max_cpu_count                inst_cpu_count_max
, (SELECT SUM(h.host_num_cpus) FROM host_per_plan_v h WHERE h.plan_id = p.plan_id) host_num_cpus
, (SELECT SUM(h.host_num_cpu_cores) FROM host_per_plan_v h WHERE h.plan_id = p.plan_id) host_num_cpu_cores
, (SELECT SUM(h.host_load) FROM host_per_plan_v h WHERE h.plan_id = p.plan_id) host_load
-- cpu demand
, p.aas_cpu_demand               cpus_required
-- iops details (IH instance history)
, p.rw_iops_peak_a   ih_rw_iops_peak
, p.r_iops_peak_a    ih_r_iops_peak
, p.w_iops_peak_a    ih_w_iops_peak
, p.rw_iops_999_a    ih_rw_iops_999
, p.r_iops_999_a     ih_r_iops_999
, p.w_iops_999_a     ih_w_iops_999
, p.rw_iops_99_a     ih_rw_iops_99
, p.r_iops_99_a      ih_r_iops_99
, p.w_iops_99_a      ih_w_iops_99
, p.rw_iops_97_a     ih_rw_iops_97
, p.r_iops_97_a      ih_r_iops_97
, p.w_iops_97_a      ih_w_iops_97
, p.rw_iops_95_a     ih_rw_iops_95
, p.r_iops_95_a      ih_r_iops_95
, p.w_iops_95_a      ih_w_iops_95
, p.rw_iops_90_a     ih_rw_iops_90
, p.r_iops_90_a      ih_r_iops_90
, p.w_iops_90_a      ih_w_iops_90
, p.rw_iops_75_a     ih_rw_iops_75
, p.r_iops_75_a      ih_r_iops_75
, p.w_iops_75_a      ih_w_iops_75
, p.rw_iops_median_a ih_rw_iops_median
, p.r_iops_median_a  ih_r_iops_median
, p.w_iops_median_a  ih_w_iops_median
, p.rw_iops_avg_a    ih_rw_iops_avg
, p.r_iops_avg_a     ih_r_iops_avg
, p.w_iops_avg_a     ih_w_iops_avg
-- iops details (DH database history)
, p.rw_iops_peak_c   dh_rw_iops_peak
, p.r_iops_peak_c    dh_r_iops_peak
, p.w_iops_peak_c    dh_w_iops_peak
, p.rw_iops_999_c    dh_rw_iops_999
, p.r_iops_999_c     dh_r_iops_999
, p.w_iops_999_c     dh_w_iops_999
, p.rw_iops_99_c     dh_rw_iops_99
, p.r_iops_99_c      dh_r_iops_99
, p.w_iops_99_c      dh_w_iops_99
, p.rw_iops_97_c     dh_rw_iops_97
, p.r_iops_97_c      dh_r_iops_97
, p.w_iops_97_c      dh_w_iops_97
, p.rw_iops_95_c     dh_rw_iops_95
, p.r_iops_95_c      dh_r_iops_95
, p.w_iops_95_c      dh_w_iops_95
, p.rw_iops_90_c     dh_rw_iops_90
, p.r_iops_90_c      dh_r_iops_90
, p.w_iops_90_c      dh_w_iops_90
, p.rw_iops_75_c     dh_rw_iops_75
, p.r_iops_75_c      dh_r_iops_75
, p.w_iops_75_c      dh_w_iops_75
, p.rw_iops_median_c dh_rw_iops_median
, p.r_iops_median_c  dh_r_iops_median
, p.w_iops_median_c  dh_w_iops_median
, p.rw_iops_avg_c    dh_rw_iops_avg
, p.r_iops_avg_c     dh_r_iops_avg
, p.w_iops_avg_c     dh_w_iops_avg
-- iops manual part
, p.rw_iops_man
, p.r_iops_man
, p.w_iops_man
-- iops demand
, p.rw_iops        rw_iops_required
, p.r_iops         r_iops_required
, p.w_iops         w_iops_required
-- mbps details (IH instance history)
, p.rw_mbps_peak_a   ih_rw_mbps_peak
, p.r_mbps_peak_a    ih_r_mbps_peak
, p.w_mbps_peak_a    ih_w_mbps_peak
, p.rw_mbps_999_a    ih_rw_mbps_999
, p.r_mbps_999_a     ih_r_mbps_999
, p.w_mbps_999_a     ih_w_mbps_999
, p.rw_mbps_99_a     ih_rw_mbps_99
, p.r_mbps_99_a      ih_r_mbps_99
, p.w_mbps_99_a      ih_w_mbps_99
, p.rw_mbps_97_a     ih_rw_mbps_97
, p.r_mbps_97_a      ih_r_mbps_97
, p.w_mbps_97_a      ih_w_mbps_97
, p.rw_mbps_95_a     ih_rw_mbps_95
, p.r_mbps_95_a      ih_r_mbps_95
, p.w_mbps_95_a      ih_w_mbps_95
, p.rw_mbps_90_a     ih_rw_mbps_90
, p.r_mbps_90_a      ih_r_mbps_90
, p.w_mbps_90_a      ih_w_mbps_90
, p.rw_mbps_75_a     ih_rw_mbps_75
, p.r_mbps_75_a      ih_r_mbps_75
, p.w_mbps_75_a      ih_w_mbps_75
, p.rw_mbps_median_a ih_rw_mbps_median
, p.r_mbps_median_a  ih_r_mbps_median
, p.w_mbps_median_a  ih_w_mbps_median
, p.rw_mbps_avg_a    ih_rw_mbps_avg
, p.r_mbps_avg_a     ih_r_mbps_avg
, p.w_mbps_avg_a     ih_w_mbps_avg
-- mbps details (DH database history)
, p.rw_mbps_peak_c   dh_rw_mbps_peak
, p.r_mbps_peak_c    dh_r_mbps_peak
, p.w_mbps_peak_c    dh_w_mbps_peak
, p.rw_mbps_999_c    dh_rw_mbps_999
, p.r_mbps_999_c     dh_r_mbps_999
, p.w_mbps_999_c     dh_w_mbps_999
, p.rw_mbps_99_c     dh_rw_mbps_99
, p.r_mbps_99_c      dh_r_mbps_99
, p.w_mbps_99_c      dh_w_mbps_99
, p.rw_mbps_97_c     dh_rw_mbps_97
, p.r_mbps_97_c      dh_r_mbps_97
, p.w_mbps_97_c      dh_w_mbps_97
, p.rw_mbps_95_c     dh_rw_mbps_95
, p.r_mbps_95_c      dh_r_mbps_95
, p.w_mbps_95_c      dh_w_mbps_95
, p.rw_mbps_90_c     dh_rw_mbps_90
, p.r_mbps_90_c      dh_r_mbps_90
, p.w_mbps_90_c      dh_w_mbps_90
, p.rw_mbps_75_c     dh_rw_mbps_75
, p.r_mbps_75_c      dh_r_mbps_75
, p.w_mbps_75_c      dh_w_mbps_75
, p.rw_mbps_median_c dh_rw_mbps_median
, p.r_mbps_median_c  dh_r_mbps_median
, p.w_mbps_median_c  dh_w_mbps_median
, p.rw_mbps_avg_c    dh_rw_mbps_avg
, p.r_mbps_avg_c     dh_r_mbps_avg
, p.w_mbps_avg_c     dh_w_mbps_avg
-- mbps manual part
, p.rw_mbps_man
, p.r_mbps_man
, p.w_mbps_man
-- mbps demand
, p.rw_mbps        rw_mbps_required
, p.r_mbps         r_mbps_required
, p.w_mbps         w_mbps_required
FROM plan_requirements_v p;
--------------------------------------------------------
--  DDL for View PLAN_REQUIREMENTS_V3
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "PLAN_REQUIREMENTS_V3" ("PLAN_ID", "DATABASES", "SOURCE_INSTANCES", "TARGET_INSTANCES", "CPU_DEMAND", "CPU_SPEED", "CPU_DEMAND_WEIGHTED", "MEM_SIZE_GB", "DATABASE_SIZE_GB", "RW_IOPS", "RW_MBPS", "CLIENT_ID") AS 
  SELECT
  plan_id
, databases
, source_instances
, target_instances
, NVL(aas_cpu_demand, 0) cpu_demand
, result_per_core cpu_speed
, NVL(aas_cpu_demand_spec, 0) cpu_demand_weighted
, NVL(mem_size_gb, 0) mem_size_gb
, NVL(database_size_gb, 0) database_size_gb
, NVL(rw_iops, 0) rw_iops
, NVL(rw_mbps, 0) rw_mbps
-- ids
, client_id
  FROM plan_requirements_v;
--------------------------------------------------------
--  DDL for View PLAN_V
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "PLAN_V" ("PLAN_ID", "CLIENT_ID", "PLAN_NAME", "PLAN_DESC", "CPU_METHOD", "CPU_METHOD_DESC", "CPU_STATISTIC", "CPU_STATISTIC_DESC", "INCLUDE_RESMGR_CPU_QUANTUM", "INCL_RESMGR_CPU_QUANTUM_DESC", "CAP_TO_NUM_CPUS", "CAP_TO_NUM_CPUS_DESC", "DISK_PERFORMANCE_METHOD", "DISK_PERFORMANCE_METHOD_DESC", "DISK_PERFORMANCE_STATISTIC", "DISK_PERF_STATISTIC_DESC", "SOURCE", "EADAM_SEQ_ID", "CSV_FILE_NAME", "LOAD_DATE", "CLIENT_NAME") AS 
  SELECT
  p.plan_id
, p.client_id
, p.plan_name
, p.plan_desc
-- sourcing method
, p.cpu_method
, CASE p.cpu_method
  WHEN 'EH' THEN 'Entire History (EH)'
  WHEN 'HS' THEN 'Hourly Statistics (HS)'
  WHEN 'MA' THEN 'Manual Entry (MA)'
  END cpu_method_desc
, p.cpu_statistic
, CASE p.cpu_statistic
  WHEN 'PEAK'   THEN 'Peak (a.k.a. Max or 100th Percentile)'
  WHEN '99.99'  THEN '99.99th Percentile'
  WHEN '99.9'   THEN '99.9th Percentile'
  WHEN '99'     THEN '99th Percentile'
  WHEN '97'     THEN '97th Percentile'
  WHEN '95'     THEN '95th Percentile'
  WHEN '90'     THEN '90th Percentile'
  WHEN '75'     THEN '75th Percentile'
  WHEN 'MEDIAN' THEN 'Median (a.k.a. 50th Percentile)'
  WHEN 'AVG'    THEN 'Average'
  END cpu_statistic_desc
, p.include_resmgr_cpu_quantum
, CASE p.include_resmgr_cpu_quantum
  WHEN 'N' THEN 'No (only Active Sessions ON CPU)'
  WHEN 'Y' THEN 'Yes (Active Sessions ON CPU or RESMGR CPU quantum)'
  END incl_resmgr_cpu_quantum_desc
, p.cap_to_num_cpus
, CASE p.cap_to_num_cpus
  WHEN 'N' THEN 'No'
  WHEN 'Y' THEN 'Yes'
  END cap_to_num_cpus_desc
, p.disk_performance_method
, CASE p.disk_performance_method
  WHEN 'IH' THEN 'Instance History (IH)'
  WHEN 'DH' THEN 'Database History (DH)'
  WHEN 'MA' THEN 'Manual Entry (MA)'
  END disk_performance_method_desc
, p.disk_performance_statistic
, CASE p.disk_performance_statistic
  WHEN 'PEAK'   THEN 'Peak (a.k.a. Max or 100th Percentile)'
  WHEN '99.9'   THEN '99.9th Percentile'
  WHEN '99'     THEN '99th Percentile'
  WHEN '97'     THEN '97th Percentile'
  WHEN '95'     THEN '95th Percentile'
  WHEN '90'     THEN '90th Percentile'
  WHEN '75'     THEN '75th Percentile'
  WHEN 'MEDIAN' THEN 'Median (a.k.a. 50th Percentile)'
  WHEN 'AVG'    THEN 'Average'
  END disk_perf_statistic_desc
-- source reference
, p.source
, p.eadam_seq_id
, p.csv_file_name
, p.load_date
, c.client_name
  FROM plan p,
       clients c
 WHERE c.client_id = p.client_id;
--------------------------------------------------------
--  DDL for View SERV_PER_PLAN_V
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "SERV_PER_PLAN_V" ("CLIENT_ID", "CLIENT_NAME", "CLIENT_DESC", "PLAN_ID", "PLAN_NAME", "PLAN_DESC", "CONFIG_ID", "CONFIG_NAME", "CONFIG_DESC", "PLN_CFG_ID", "PLN_CFG_NAME", "REDUNDANCY_LEVEL", "THREAD_EFFICIENCY", "NUM_CPUS_ADJ", "MEMORY_ADJ", "DISK_SIZE_ADJ", "OFFLOADING_ADJ", "COMPRESSION_ADJ", "BACKUP_ADJ", "R_IOPS_ADJ", "W_IOPS_ADJ", "R_MBPS_ADJ", "W_MBPS_ADJ", "SERVER_ID", "SERVER_TYPE", "SERVER_TYPE_DESC", "NODE", "NUM_CPUS", "MEMORY_SIZE_GB", "DISK_SIZE_RAW_GB", "RW_IOPS", "R_IOPS", "W_IOPS", "RW_MBPS", "R_MBPS", "W_MBPS", "SPEC_ID", "VERSION_DATE", "HARDWARE_VENDOR", "SYSTEM", "NUM_CORES", "NUM_CHIPS", "NUM_CORES_PER_CHIP", "NUM_THREADS_PER_CORE", "BASELINE", "RESULT", "RESULT_PER_CORE", "NUM_CPUS_SPEC", "CAP_NUM_CPU", "CAP_MEM_SIZE_GB", "CAP_DISK_SIZE_GB", "CAP_RW_IOPS", "CAP_R_IOPS", "CAP_W_IOPS", "CAP_RW_MBPS", "CAP_R_MBPS", "CAP_W_MBPS", "CAP_RESULT_PER_CORE", "CAP_NUM_CPU_SPEC") AS 
  SELECT
-- client
  pln.client_id
, cli.client_name
, cli.client_desc
-- plan
, pln.plan_id
, pln.plan_name
, pln.plan_desc
-- configuration
, cop.config_id
, srv.config_name
, srv.config_desc
-- configuration per plan
, cop.pln_cfg_id
, cop.pln_cfg_name
-- scaling factors
, cop.redundancy_level
, cop.thread_efficiency
, cop.num_cpus_adj
, cop.memory_adj
, cop.disk_size_adj
, cop.offloading_adj
, cop.compression_adj
, cop.backup_adj
, cop.r_iops_adj
, cop.w_iops_adj
, cop.r_mbps_adj
, cop.w_mbps_adj
-- server
, srv.server_id
, srv.server_type /* (C)ompute, (S)torage or (H)ybrid */
, srv.server_type_desc
, srv.node
-- raw server capacity
, srv.num_cpus
, srv.memory_size_gb
, srv.disk_size_raw_gb
, srv.rw_iops
, srv.r_iops
, srv.w_iops
, srv.rw_mbps
, srv.r_mbps
, srv.w_mbps
-- spec
, srv.spec_id
, srv.version_date
, srv.hardware_vendor
, srv.system
, srv.num_cores
, srv.num_chips
, srv.num_cores_per_chip
, srv.num_threads_per_core
, srv.baseline
, srv.result
, srv.result_per_core
, srv.num_cpus_spec
-- adjusted capacity
, ROUND(srv.num_cpus * NVL(cop.offloading_adj, 1) * NVL(cop.num_cpus_adj, 1)) cap_num_cpu
, ROUND(srv.memory_size_gb * NVL(cop.memory_adj, 1)) cap_mem_size_gb
, ROUND(srv.disk_size_raw_gb * NVL(cop.disk_size_adj, 1) * NVL(cop.compression_adj, 1) * NVL(cop.backup_adj, 1) / NVL(cop.redundancy_level, 1)) cap_disk_size_gb
, ROUND((srv.r_iops * NVL(cop.r_iops_adj, 1) / NVL(cop.redundancy_level, 1)) + (srv.w_iops * NVL(cop.w_iops_adj, 1) / NVL(cop.redundancy_level, 1))) cap_rw_iops
, ROUND(srv.r_iops * NVL(cop.r_iops_adj, 1) / NVL(cop.redundancy_level, 1)) cap_r_iops
, ROUND(srv.w_iops * NVL(cop.w_iops_adj, 1) / NVL(cop.redundancy_level, 1)) cap_w_iops
, ROUND((srv.r_mbps * NVL(cop.r_mbps_adj, 1) / NVL(cop.redundancy_level, 1)) + (srv.w_mbps * NVL(cop.w_mbps_adj, 1) / NVL(cop.redundancy_level, 1))) cap_rw_mbps
, ROUND(srv.r_mbps * NVL(cop.r_mbps_adj, 1) / NVL(cop.redundancy_level, 1)) cap_r_mbps
, ROUND(srv.w_mbps * NVL(cop.w_mbps_adj, 1) / NVL(cop.redundancy_level, 1)) cap_w_mbps
, ROUND(srv.result_per_core * NVL(cop.thread_efficiency, 1)) cap_result_per_core
, ROUND(srv.num_cpus * NVL(cop.num_cpus_adj, 1) * srv.result_per_core * NVL(cop.thread_efficiency, 1)) cap_num_cpu_spec
  FROM plan            pln,
       clients         cli,
       config_per_plan cop,
       server_v        srv
 WHERE cli.client_id = pln.client_id
   AND cop.plan_id   = pln.plan_id
   AND srv.config_id = cop.config_id;
--------------------------------------------------------
--  DDL for View SERVER_V
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "SERVER_V" ("SERVER_ID", "CONFIG_ID", "CONFIG_NAME", "CONFIG_DESC", "DEFAULT_REDUNDANCY_LEVEL", "SERVER_TYPE", "SERVER_TYPE_DESC", "NODE", "NUM_CPUS", "MEMORY_SIZE_GB", "DISK_SIZE_RAW_GB", "RW_IOPS", "R_IOPS", "W_IOPS", "RW_MBPS", "R_MBPS", "W_MBPS", "SPEC_ID", "VERSION_DATE", "HARDWARE_VENDOR", "SYSTEM", "NUM_CORES", "NUM_CHIPS", "NUM_CORES_PER_CHIP", "NUM_THREADS_PER_CORE", "BASELINE", "RESULT", "RESULT_PER_CORE", "NUM_CPUS_SPEC") AS 
  SELECT
  srv.server_id
, srv.config_id
, con.config_name
, con.config_desc
, con.default_redundancy_level
, srv.server_type /* (C)ompute, (S)torage or (H)ybrid */
, CASE srv.server_type WHEN 'C' THEN 'Compute' WHEN 'S' THEN 'Storage' WHEN 'H' THEN 'Hybrid' END server_type_desc
, srv.node
, CASE WHEN srv.server_type IN ('C', 'H') THEN NVL(srv.num_cpus, 0) ELSE 0 END                    num_cpus
, CASE WHEN srv.server_type IN ('C', 'H') THEN NVL(srv.memory_size_gb, 0) ELSE 0 END              memory_size_gb
, CASE WHEN srv.server_type IN ('S', 'H') THEN NVL(srv.disk_size_raw_gb, 0) ELSE 0 END            disk_size_raw_gb
, CASE WHEN srv.server_type IN ('S', 'H') THEN NVL(srv.r_iops, 0) + NVL(srv.w_iops, 0) ELSE 0 END rw_iops
, CASE WHEN srv.server_type IN ('S', 'H') THEN NVL(srv.r_iops, 0) ELSE 0 END                      r_iops
, CASE WHEN srv.server_type IN ('S', 'H') THEN NVL(srv.w_iops, 0) ELSE 0 END                      w_iops
, CASE WHEN srv.server_type IN ('S', 'H') THEN NVL(srv.r_mbps, 0) + NVL(srv.w_mbps, 0) ELSE 0 END rw_mbps
, CASE WHEN srv.server_type IN ('S', 'H') THEN NVL(srv.r_mbps, 0) ELSE 0 END                      r_mbps
, CASE WHEN srv.server_type IN ('S', 'H') THEN NVL(srv.w_mbps, 0) ELSE 0 END                      w_mbps
-- spec
, srv.spec_id
, spc.version_date
, spc.hardware_vendor
, spc.system
, spc.num_cores
, spc.num_chips
, spc.num_cores_per_chip
, spc.num_threads_per_core
, spc.baseline
, spc.result
, CASE WHEN srv.server_type IN ('C', 'H') THEN NVL(spc.result_per_core, 0) ELSE 0 END result_per_core
, CASE WHEN srv.server_type IN ('C', 'H') THEN ROUND(NVL(srv.num_cpus, 0) * NVL(spc.result_per_core, 0), 1) ELSE 0 END num_cpus_spec
  FROM server        srv,
       configuration con,
       spec_v        spc
 WHERE con.config_id = srv.config_id
   AND spc.spec_id = srv.spec_id;
--------------------------------------------------------
--  DDL for View SPEC_V
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "SPEC_V" ("SPEC_ID", "VERSION_DATE", "HARDWARE_VENDOR", "SYSTEM", "NUM_CORES", "NUM_CHIPS", "NUM_CORES_PER_CHIP", "NUM_THREADS_PER_CORE", "BASELINE", "RESULT", "RESULT_PER_CORE") AS 
  SELECT
spec_id,
version_date,
--SUBSTR(hardware_vendor, 1, 50) hardware_vendor,
hardware_vendor,
--SUBSTR(system, 1, 100) system,
system,
TO_NUMBER(TRANSLATE(LOWER(num_cores),            '0123456789.,abcdefghijklmnopqrstuvwxyz-_ ''`~!@#$%&*()=+[]{}\|;:"<>/?'||CHR(0)||CHR(9)||CHR(10)||CHR(13)||CHR(38), '0123456789.')) num_cores,
TO_NUMBER(TRANSLATE(LOWER(num_chips),            '0123456789.,abcdefghijklmnopqrstuvwxyz-_ ''`~!@#$%&*()=+[]{}\|;:"<>/?'||CHR(0)||CHR(9)||CHR(10)||CHR(13)||CHR(38), '0123456789.')) num_chips,
TO_NUMBER(TRANSLATE(LOWER(num_cores_per_chip),   '0123456789.,abcdefghijklmnopqrstuvwxyz-_ ''`~!@#$%&*()=+[]{}\|;:"<>/?'||CHR(0)||CHR(9)||CHR(10)||CHR(13)||CHR(38), '0123456789.')) num_cores_per_chip,
TO_NUMBER(TRANSLATE(LOWER(num_threads_per_core), '0123456789.,abcdefghijklmnopqrstuvwxyz-_ ''`~!@#$%&*()=+[]{}\|;:"<>/?'||CHR(0)||CHR(9)||CHR(10)||CHR(13)||CHR(38), '0123456789.')) num_threads_per_core,
TO_NUMBER(TRANSLATE(LOWER(baseline),             '0123456789.,abcdefghijklmnopqrstuvwxyz-_ ''`~!@#$%&*()=+[]{}\|;:"<>/?'||CHR(0)||CHR(9)||CHR(10)||CHR(13)||CHR(38), '0123456789.')) baseline,
TO_NUMBER(TRANSLATE(LOWER(result),               '0123456789.,abcdefghijklmnopqrstuvwxyz-_ ''`~!@#$%&*()=+[]{}\|;:"<>/?'||CHR(0)||CHR(9)||CHR(10)||CHR(13)||CHR(38), '0123456789.')) result,
ROUND(
TO_NUMBER(TRANSLATE(LOWER(result),               '0123456789.,abcdefghijklmnopqrstuvwxyz-_ ''`~!@#$%&*()=+[]{}\|;:"<>/?'||CHR(0)||CHR(9)||CHR(10)||CHR(13)||CHR(38), '0123456789.'))/
TO_NUMBER(TRANSLATE(LOWER(num_cores),            '0123456789.,abcdefghijklmnopqrstuvwxyz-_ ''`~!@#$%&*()=+[]{}\|;:"<>/?'||CHR(0)||CHR(9)||CHR(10)||CHR(13)||CHR(38), '0123456789.'))
, 1) result_per_core
  FROM SPECint_rate2006_s
 WHERE benchmark != 'Benchmark';
--------------------------------------------------------
--  DDL for View TIME_SERIES_PEAKS_HOST_V
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "TIME_SERIES_PEAKS_HOST_V" ("PLAN_ID", "CLIENT_ID", "HOST_NAME", "ON_CPU", "ON_CPU_AND_RESMGR", "ON_CPU_99P", "ON_CPU_AND_RESMGR_99P", "ON_CPU_97P", "ON_CPU_AND_RESMGR_97P", "ON_CPU_95P", "ON_CPU_AND_RESMGR_95P", "ON_CPU_90P", "ON_CPU_AND_RESMGR_90P", "ON_CPU_75P", "ON_CPU_AND_RESMGR_75P", "ON_CPU_MED", "ON_CPU_AND_RESMGR_MED", "ON_CPU_AVG", "ON_CPU_AND_RESMGR_AVG", "SGA_GB", "PGA_GB", "MEM_GB", "R_IOPS", "W_IOPS", "RW_IOPS", "R_MBPS", "W_MBPS", "RW_MBPS") AS 
  WITH
stack_by_end_time AS (
SELECT
  plan_id
, client_id
, host_name
, end_time
, ROUND(SUM(on_cpu))                              on_cpu
, ROUND(SUM(on_cpu + resmgr_cpu_quantum))         on_cpu_and_resmgr
, ROUND(SUM(on_cpu_99p))                          on_cpu_99p
, ROUND(SUM(on_cpu_99p + resmgr_cpu_quantum_99p)) on_cpu_and_resmgr_99p
, ROUND(SUM(on_cpu_97p))                          on_cpu_97p
, ROUND(SUM(on_cpu_97p + resmgr_cpu_quantum_97p)) on_cpu_and_resmgr_97p
, ROUND(SUM(on_cpu_95p))                          on_cpu_95p
, ROUND(SUM(on_cpu_95p + resmgr_cpu_quantum_95p)) on_cpu_and_resmgr_95p
, ROUND(SUM(on_cpu_90p))                          on_cpu_90p
, ROUND(SUM(on_cpu_90p + resmgr_cpu_quantum_90p)) on_cpu_and_resmgr_90p
, ROUND(SUM(on_cpu_75p))                          on_cpu_75p
, ROUND(SUM(on_cpu_75p + resmgr_cpu_quantum_75p)) on_cpu_and_resmgr_75p
, ROUND(SUM(on_cpu_med))                          on_cpu_med
, ROUND(SUM(on_cpu_med + resmgr_cpu_quantum_med)) on_cpu_and_resmgr_med
, ROUND(SUM(on_cpu_avg))                          on_cpu_avg
, ROUND(SUM(on_cpu_avg + resmgr_cpu_quantum_avg)) on_cpu_and_resmgr_avg
, ROUND(SUM(sga_gb))                              sga_gb
, ROUND(SUM(pga_gb))                              pga_gb
, ROUND(SUM(r_iops))                              r_iops
, ROUND(SUM(w_iops))                              w_iops
, ROUND(SUM(r_mbps))                              r_mbps
, ROUND(SUM(w_mbps))                              w_mbps
  FROM time_series_v2
 GROUP BY
  plan_id
, client_id
, host_name
, end_time
)
SELECT
  plan_id
, client_id
, host_name
, MAX(on_cpu)                on_cpu
, MAX(on_cpu_and_resmgr)     on_cpu_and_resmgr
, MAX(on_cpu_99p)            on_cpu_99p
, MAX(on_cpu_and_resmgr_99p) on_cpu_and_resmgr_99p
, MAX(on_cpu_97p)            on_cpu_97p
, MAX(on_cpu_and_resmgr_97p) on_cpu_and_resmgr_97p
, MAX(on_cpu_95p)            on_cpu_95p
, MAX(on_cpu_and_resmgr_95p) on_cpu_and_resmgr_95p
, MAX(on_cpu_90p)            on_cpu_90p
, MAX(on_cpu_and_resmgr_90p) on_cpu_and_resmgr_90p
, MAX(on_cpu_75p)            on_cpu_75p
, MAX(on_cpu_and_resmgr_75p) on_cpu_and_resmgr_75p
, MAX(on_cpu_med)            on_cpu_med
, MAX(on_cpu_and_resmgr_med) on_cpu_and_resmgr_med
, MAX(on_cpu_avg)            on_cpu_avg
, MAX(on_cpu_and_resmgr_avg) on_cpu_and_resmgr_avg
, MAX(sga_gb)                sga_gb
, MAX(pga_gb)                pga_gb
, MAX(sga_gb) + MAX(pga_gb)  mem_gb
, MAX(r_iops)                r_iops
, MAX(w_iops)                w_iops
, MAX(r_iops) + MAX(w_iops)  rw_iops
, MAX(r_mbps)                r_mbps
, MAX(w_mbps)                w_mbps
, MAX(r_mbps) + MAX(w_mbps)  rw_mbps
  FROM stack_by_end_time
 GROUP BY
  plan_id
, client_id
, host_name;
--------------------------------------------------------
--  DDL for View TIME_SERIES_PEAKS_PLAN_V
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "TIME_SERIES_PEAKS_PLAN_V" ("PLAN_ID", "CLIENT_ID", "ON_CPU", "ON_CPU_AND_RESMGR", "ON_CPU_99P", "ON_CPU_AND_RESMGR_99P", "ON_CPU_97P", "ON_CPU_AND_RESMGR_97P", "ON_CPU_95P", "ON_CPU_AND_RESMGR_95P", "ON_CPU_90P", "ON_CPU_AND_RESMGR_90P", "ON_CPU_75P", "ON_CPU_AND_RESMGR_75P", "ON_CPU_MED", "ON_CPU_AND_RESMGR_MED", "ON_CPU_AVG", "ON_CPU_AND_RESMGR_AVG", "SGA_GB", "PGA_GB", "MEM_GB", "R_IOPS", "W_IOPS", "RW_IOPS", "R_MBPS", "W_MBPS", "RW_MBPS", "PERM", "UNDO", "TEMP", "DATABASE_SIZE_GB") AS 
  WITH
stack_by_end_time AS (
SELECT
  plan_id
, client_id
, end_time
, ROUND(SUM(on_cpu))                              on_cpu
, ROUND(SUM(on_cpu + resmgr_cpu_quantum))         on_cpu_and_resmgr
, ROUND(SUM(on_cpu_99p))                          on_cpu_99p
, ROUND(SUM(on_cpu_99p + resmgr_cpu_quantum_99p)) on_cpu_and_resmgr_99p
, ROUND(SUM(on_cpu_97p))                          on_cpu_97p
, ROUND(SUM(on_cpu_97p + resmgr_cpu_quantum_97p)) on_cpu_and_resmgr_97p
, ROUND(SUM(on_cpu_95p))                          on_cpu_95p
, ROUND(SUM(on_cpu_95p + resmgr_cpu_quantum_95p)) on_cpu_and_resmgr_95p
, ROUND(SUM(on_cpu_90p))                          on_cpu_90p
, ROUND(SUM(on_cpu_90p + resmgr_cpu_quantum_90p)) on_cpu_and_resmgr_90p
, ROUND(SUM(on_cpu_75p))                          on_cpu_75p
, ROUND(SUM(on_cpu_75p + resmgr_cpu_quantum_75p)) on_cpu_and_resmgr_75p
, ROUND(SUM(on_cpu_med))                          on_cpu_med
, ROUND(SUM(on_cpu_med + resmgr_cpu_quantum_med)) on_cpu_and_resmgr_med
, ROUND(SUM(on_cpu_avg))                          on_cpu_avg
, ROUND(SUM(on_cpu_avg + resmgr_cpu_quantum_avg)) on_cpu_and_resmgr_avg
, ROUND(SUM(sga_gb))                              sga_gb
, ROUND(SUM(pga_gb))                              pga_gb
, ROUND(SUM(r_iops))                              r_iops
, ROUND(SUM(w_iops))                              w_iops
, ROUND(SUM(r_mbps))                              r_mbps
, ROUND(SUM(w_mbps))                              w_mbps
, ROUND(SUM(perm))                                perm
, ROUND(SUM(undo))                                undo
, ROUND(SUM(temp))                                temp
  FROM time_series_v
 GROUP BY
  plan_id
, client_id
, end_time
)
SELECT
  plan_id
, client_id
, MAX(on_cpu)                on_cpu
, MAX(on_cpu_and_resmgr)     on_cpu_and_resmgr
, MAX(on_cpu_99p)            on_cpu_99p
, MAX(on_cpu_and_resmgr_99p) on_cpu_and_resmgr_99p
, MAX(on_cpu_97p)            on_cpu_97p
, MAX(on_cpu_and_resmgr_97p) on_cpu_and_resmgr_97p
, MAX(on_cpu_95p)            on_cpu_95p
, MAX(on_cpu_and_resmgr_95p) on_cpu_and_resmgr_95p
, MAX(on_cpu_90p)            on_cpu_90p
, MAX(on_cpu_and_resmgr_90p) on_cpu_and_resmgr_90p
, MAX(on_cpu_75p)            on_cpu_75p
, MAX(on_cpu_and_resmgr_75p) on_cpu_and_resmgr_75p
, MAX(on_cpu_med)            on_cpu_med
, MAX(on_cpu_and_resmgr_med) on_cpu_and_resmgr_med
, MAX(on_cpu_avg)            on_cpu_avg
, MAX(on_cpu_and_resmgr_avg) on_cpu_and_resmgr_avg
, MAX(sga_gb)                sga_gb
, MAX(pga_gb)                pga_gb
, MAX(sga_gb) + MAX(pga_gb)  mem_gb
, MAX(r_iops)                r_iops
, MAX(w_iops)                w_iops
, MAX(r_iops) + MAX(w_iops)  rw_iops
, MAX(r_mbps)                r_mbps
, MAX(w_mbps)                w_mbps
, MAX(r_mbps) + MAX(w_mbps)  rw_mbps
, MAX(perm)                  perm
, MAX(undo)                  undo
, MAX(temp)                  temp
, MAX(perm) + MAX(undo) + MAX(temp) database_size_gb
  FROM stack_by_end_time
 GROUP BY
  plan_id
, client_id;
--------------------------------------------------------
--  DDL for View TIME_SERIES_PEAKS_V
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "TIME_SERIES_PEAKS_V" ("PLAN_ID", "CLIENT_ID", "ON_CPU", "RESMGR_CPU_QUANTUM", "SGA_GB", "PGA_GB", "MEM_GB", "R_IOPS", "W_IOPS", "RW_IOPS", "R_MBPS", "W_MBPS", "RW_MBPS", "PERM", "UNDO", "TEMP", "DATABASE_SIZE_GB") AS 
  WITH
stack_by_end_time AS (
SELECT
  plan_id
, client_id
, end_time
, ROUND(SUM(on_cpu)) on_cpu
, ROUND(SUM(resmgr_cpu_quantum)) resmgr_cpu_quantum
, ROUND(SUM(sga_gb)) sga_gb
, ROUND(SUM(pga_gb)) pga_gb
, ROUND(SUM(r_iops)) r_iops
, ROUND(SUM(w_iops)) w_iops
, ROUND(SUM(r_mbps)) r_mbps
, ROUND(SUM(w_mbps)) w_mbps
, ROUND(SUM(perm)) perm
, ROUND(SUM(undo)) undo
, ROUND(SUM(temp)) temp
  FROM time_series_v
 GROUP BY
  plan_id
, client_id
, end_time
)
SELECT
  plan_id
, client_id
, MAX(on_cpu) on_cpu
, MAX(resmgr_cpu_quantum) resmgr_cpu_quantum
, MAX(sga_gb) sga_gb
, MAX(pga_gb) pga_gb
, MAX(sga_gb) + MAX(pga_gb) mem_gb
, MAX(r_iops) r_iops
, MAX(w_iops) w_iops
, MAX(r_iops) + MAX(w_iops) rw_iops
, MAX(r_mbps) r_mbps
, MAX(w_mbps) w_mbps
, MAX(r_mbps) + MAX(w_mbps) rw_mbps
, MAX(perm) perm
, MAX(undo) undo
, MAX(temp) temp
, MAX(perm) + MAX(undo) + MAX(temp) database_size_gb
  FROM stack_by_end_time
 GROUP BY
  plan_id
, client_id;
--------------------------------------------------------
--  DDL for View TIME_SERIES_V
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "TIME_SERIES_V" ("INST_ID", "DB_ID", "PLAN_ID", "CLIENT_ID", "HOST_NAME", "DBID", "DB_NAME", "DB_UNIQUE_NAME", "INSTANCE_NUMBER", "INSTANCE_NAME", "CPU_COUNT", "END_TIME", "ON_CPU", "RESMGR_CPU_QUANTUM", "ON_CPU_99P", "RESMGR_CPU_QUANTUM_99P", "ON_CPU_97P", "RESMGR_CPU_QUANTUM_97P", "ON_CPU_95P", "RESMGR_CPU_QUANTUM_95P", "ON_CPU_90P", "RESMGR_CPU_QUANTUM_90P", "ON_CPU_75P", "RESMGR_CPU_QUANTUM_75P", "ON_CPU_MED", "RESMGR_CPU_QUANTUM_MED", "ON_CPU_AVG", "RESMGR_CPU_QUANTUM_AVG", "SGA_GB", "PGA_GB", "R_IOPS", "W_IOPS", "R_MBPS", "W_MBPS", "PERM", "UNDO", "TEMP", "LOAD", "NUM_CPUS", "NUM_CPU_CORES", "PHYSICAL_MEMORY_GB") AS 
  SELECT
  tse.inst_id
, ins.db_id
, dbp.plan_id
, dbs.client_id
, ins.host_name
, dbs.dbid
, dbs.db_name
, dbs.db_unique_name
, ins.instance_number
, ins.instance_name
, ins.cpu_count
-- time
, tse.end_time
-- cpu
, tse.on_cpu
, tse.resmgr_cpu_quantum
, tse.on_cpu_99p
, tse.resmgr_cpu_quantum_99p
, NVL(tse.on_cpu_97p, ROUND((tse.on_cpu_99p + tse.on_cpu_95p) / 2)) on_cpu_97p
, NVL(tse.resmgr_cpu_quantum_97p, ROUND((tse.resmgr_cpu_quantum_99p + tse.resmgr_cpu_quantum_95p) / 2)) resmgr_cpu_quantum_97p
, tse.on_cpu_95p
, tse.resmgr_cpu_quantum_95p
, tse.on_cpu_90p
, tse.resmgr_cpu_quantum_90p
, tse.on_cpu_75p
, tse.resmgr_cpu_quantum_75p
, tse.on_cpu_med
, tse.resmgr_cpu_quantum_med
, tse.on_cpu_avg
, tse.resmgr_cpu_quantum_avg
-- mem
, tse.sga_gb
, tse.pga_gb
-- disk_perf
, tse.r_iops
, tse.w_iops
, tse.r_mbps
, tse.w_mbps
-- disk_space
, tse.perm
, tse.undo
, tse.temp
-- os stats
, tse.load
, tse.num_cpus
, tse.num_cpu_cores
, tse.physical_memory_gb
  FROM time_series tse,
       instances   ins,
       databases   dbs,
       db_per_plan dbp
 WHERE ins.inst_id = tse.inst_id
   AND dbs.db_id   = ins.db_id
   AND dbp.db_id   = dbs.db_id;
--------------------------------------------------------
--  DDL for View TIME_SERIES_V2
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "TIME_SERIES_V2" ("PLAN_ID", "CLIENT_ID", "HOST_NAME", "INSTANCES", "END_TIME", "ON_CPU", "RESMGR_CPU_QUANTUM", "ON_CPU_99P", "RESMGR_CPU_QUANTUM_99P", "ON_CPU_97P", "RESMGR_CPU_QUANTUM_97P", "ON_CPU_95P", "RESMGR_CPU_QUANTUM_95P", "ON_CPU_90P", "RESMGR_CPU_QUANTUM_90P", "ON_CPU_75P", "RESMGR_CPU_QUANTUM_75P", "ON_CPU_MED", "RESMGR_CPU_QUANTUM_MED", "ON_CPU_AVG", "RESMGR_CPU_QUANTUM_AVG", "SGA_GB", "PGA_GB", "R_IOPS", "W_IOPS", "R_MBPS", "W_MBPS", "LOAD", "NUM_CPUS", "NUM_CPU_CORES", "PHYSICAL_MEMORY_GB") AS 
  SELECT
  plan_id
, client_id
, host_name
, COUNT(*) instances
-- time
, end_time
-- cpu
, SUM(on_cpu) on_cpu
, SUM(resmgr_cpu_quantum) resmgr_cpu_quantum
, SUM(on_cpu_99p) on_cpu_99p
, SUM(resmgr_cpu_quantum_99p) resmgr_cpu_quantum_99p
, SUM(on_cpu_97p) on_cpu_97p
, SUM(resmgr_cpu_quantum_97p) resmgr_cpu_quantum_97p
, SUM(on_cpu_95p) on_cpu_95p
, SUM(resmgr_cpu_quantum_95p) resmgr_cpu_quantum_95p
, SUM(on_cpu_90p) on_cpu_90p
, SUM(resmgr_cpu_quantum_90p) resmgr_cpu_quantum_90p
, SUM(on_cpu_75p) on_cpu_75p
, SUM(resmgr_cpu_quantum_75p) resmgr_cpu_quantum_75p
, SUM(on_cpu_med) on_cpu_med
, SUM(resmgr_cpu_quantum_med) resmgr_cpu_quantum_med
, SUM(on_cpu_avg) on_cpu_avg
, SUM(resmgr_cpu_quantum_avg) resmgr_cpu_quantum_avg
-- mem
, SUM(sga_gb) sga_gb
, SUM(pga_gb) pga_gb
-- disk_perf
, SUM(r_iops) r_iops
, SUM(w_iops) w_iops
, SUM(r_mbps) r_mbps
, SUM(w_mbps) w_mbps
-- os stats
, MAX(load) load
, MAX(num_cpus) num_cpus
, MAX(num_cpu_cores) num_cpu_cores
, MAX(physical_memory_gb) physical_memory_gb
  FROM time_series_v
 GROUP BY
  plan_id
, client_id
, host_name
, end_time;
