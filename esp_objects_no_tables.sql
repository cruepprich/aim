--------------------------------------------------------
--  File created - Tuesday-November-03-2015   
--------------------------------------------------------


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
/
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
   /
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
  /
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
  /
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
  /
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
   /
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
/
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
 /
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
  /
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
   /
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
/
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
  /
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
   /
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
/
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
/
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
   /
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
 /
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
   /
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
/
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
  /
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
/
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
/
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
/
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
/
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
/
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
   /
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
/
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
  /
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
   /
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
  /
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
   /
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
  /
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
/
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
   /
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
  /
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
  /
--------------------------------------------------------
--  DDL for Package APP_UTIL
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "APP_UTIL" as

  /* ====================================================================
  This package contains helper programs for the eSP APEX application.

  =======================================================================*/
  -- Global variables --
  -- These variables are used to set the background colors of the node
  -- metrics on the instance allocation page (500)
  g_upper_cpu_threshold_perc constant number := 90;
  g_lower_cpu_threshold_perc constant number := 50;
  g_upper_mem_threshold_perc constant number := 90;
  g_lower_mem_threshold_perc constant number := 50;
  -------------------------------------------------

  procedure process_node(
      p_db_id in pls_integer
     ,p_db_alloc_id in pls_integer
     ,p_pln_cfg_id in pls_integer
     ,p_node in pls_integer
     ,p_val in varchar2);

  procedure process_failover(
      p_db_alloc_id in pls_integer
     ,p_node in pls_integer
     ,p_pln_cfg_id in pls_integer
     ,p_val in varchar2);

  procedure duplicate_database(
      p_db_id      in pls_integer
     ,p_nbr_copies in pls_integer);

  procedure duplicate_instance(
      p_inst_id    in pls_integer
     ,p_nbr_copies in pls_integer);

  procedure duplicate_server(
      p_server_id    in pls_integer
     ,p_nbr_copies in pls_integer);

  procedure renumber_server_nodes(
      p_config_id in pls_integer);


  function get_server_node_gaps(
      p_config_id in pls_integer)
  return pls_integer;

  function get_failover_node(
      p_db_alloc_id in pls_integer
     ,p_config_id   in pls_integer
     ,p_node        in pls_integer)
  return pls_integer;

  procedure duplicate_plan(
      p_plan_id in pls_integer);

  procedure toggle_fail_node(
      p_node      in pls_integer
     ,p_pln_cfg_id in pls_integer
     ,p_config_id in pls_integer);

  procedure write_blob_to_file (
      p_file_id in pls_integer);

  procedure load_file(p_file_id in pls_integer);

  procedure create_apex_session (
      p_app_id      IN apex_applications.application_id%TYPE,
      p_app_user    IN apex_workspace_activity_log.apex_user%TYPE,
      p_app_page_id IN apex_application_pages.page_id%TYPE);

  procedure set_apex_session(
      p_app_id in pls_integer default 200
     ,p_app_session in number
     ,p_workspace_name in varchar2 default 'DEV');

  procedure process_spreadsheet_load (
      p_plan_name in varchar2
     ,p_plan_desc in varchar2
     ,p_client_id in pls_integer
     ,p_db_cnt    out pls_integer
     ,p_inst_cnt  out pls_integer);
end app_util;

/
--------------------------------------------------------
--  DDL for Package ESP_UTIL
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "ESP_UTIL" AS

FUNCTION node_alloc
( p_pln_cfg_id  IN NUMBER
, p_failed_node IN NUMBER DEFAULT NULL
)
RETURN node_alloc_type_table PIPELINED;

PROCEDURE inst_alloc
( p_plan_id         IN NUMBER
, p_db_alloc_method IN VARCHAR2 DEFAULT 'B' /* (B)alanced, (D)ense */
, p_dense_percent   IN NUMBER   DEFAULT 100 /* 100, 90, 80, 70, etc. */
, p_pln_cfg_id      IN NUMBER   DEFAULT NULL
, p_pln_db_id       IN NUMBER   DEFAULT NULL
);

PROCEDURE db_alloc
( p_plan_id         IN NUMBER
, p_db_alloc_method IN VARCHAR2 DEFAULT 'B' /* (B)alanced, (D)ense */
, p_dense_percent   IN NUMBER   DEFAULT 100 /* 100, 90, 80, 70, etc. */
, p_pln_cfg_id      IN NUMBER   DEFAULT NULL
);

FUNCTION time_series
( p_plan_id   IN NUMBER
, p_host_name IN VARCHAR2 DEFAULT NULL
, p_db_name   IN VARCHAR2 DEFAULT NULL
, p_date_from IN DATE     DEFAULT NULL
, p_date_to   IN DATE     DEFAULT NULL
, p_compress  IN VARCHAR2 DEFAULT 'Y' /* Y, N */
)
RETURN time_series_type_table PIPELINED;

FUNCTION os_time_series
( p_plan_id   IN NUMBER
, p_host_name IN VARCHAR2 DEFAULT NULL
, p_date_from IN DATE     DEFAULT NULL
, p_date_to   IN DATE     DEFAULT NULL
, p_compress  IN VARCHAR2 DEFAULT 'Y' /* Y, N */
)
RETURN os_time_series_type_table PIPELINED;

FUNCTION line_chart
( p_plan_id   IN NUMBER
, p_host_name IN VARCHAR2 DEFAULT NULL
, p_db_name   IN VARCHAR2 DEFAULT NULL
, p_date_from IN DATE     DEFAULT NULL
, p_date_to   IN DATE     DEFAULT NULL
, p_type      IN VARCHAR2 DEFAULT 'CPU1' /* CPU1, CPU2, CPU3, MEM, DISK, IOPS, MBPS, OSLOAD, OSCPU, OSMEM */
, p_apex      IN VARCHAR2 DEFAULT 'Y' /* Y, N */
)
RETURN CLOB;

FUNCTION bar_chart
( p_plan_id   IN NUMBER
, p_host_name IN VARCHAR2 DEFAULT NULL
, p_db_name   IN VARCHAR2 DEFAULT NULL /* not used, needed by esp360_9h_clob_chart.sql */
, p_type      IN VARCHAR2 DEFAULT 'CPU' /* CPU, IOPS, MBPS */
, p_apex      IN VARCHAR2 DEFAULT 'Y' /* Y, N */
)
RETURN CLOB;

FUNCTION pie_chart
( p_plan_id   IN NUMBER
, p_host_name IN VARCHAR2 DEFAULT NULL
, p_db_name   IN VARCHAR2 DEFAULT NULL /* not used, needed by esp360_9h_clob_chart.sql */
, p_type      IN VARCHAR2 DEFAULT 'CPU' /* CPU, MEM, DISK, IOPS, MBPS */
, p_apex      IN VARCHAR2 DEFAULT 'Y' /* Y, N */
)
RETURN CLOB;

FUNCTION just_number (p_value IN VARCHAR2)
RETURN NUMBER;

PROCEDURE load_collection_from_external
( p_file_name IN VARCHAR2
);

PROCEDURE load_collection_from_file
( p_file_id   IN  NUMBER
);

PROCEDURE load_collection
( p_client_id                  IN  NUMBER
, p_file_name                  IN  VARCHAR2 DEFAULT 'esp_requirements.csv'
, p_spec_id                    IN  NUMBER   DEFAULT -1
, p_plan_name                  IN  VARCHAR2 DEFAULT 'Plan Name'
, p_plan_desc                  IN  VARCHAR2 DEFAULT 'Plan Description'
, p_cpu_method                 IN  VARCHAR2 DEFAULT 'EH' /* Entire History (EH), Hourly Statistics (HS), Manual Entry (MA) */
, p_cpu_statistic              IN  VARCHAR2 DEFAULT NULL /* PEAK, 99.99, 99.9, 99, 97, 95, 90, 75, MEDIAN, AVG */
, p_include_resmgr_cpu_quantum IN  VARCHAR2 DEFAULT NULL /* N, Y */
, p_cap_to_num_cpus            IN  VARCHAR2 DEFAULT NULL /* N, Y */
, p_disk_performance_method    IN  VARCHAR2 DEFAULT 'IH' /* Instance History (IH), Database History (DH), Manual Entry (MA) */
, p_disk_performance_statistic IN  VARCHAR2 DEFAULT NULL /* PEAK, 99.9, 99, 97, 95, 90, 75, MEDIAN, AVG */
, p_file_source                IN  VARCHAR2 DEFAULT 'F' /* (F)ile, (E)xternal */
, p_file_id                    IN  NUMBER   DEFAULT TO_NUMBER(NULL)
, x_plan_id                    OUT NUMBER
, x_file_rows                  OUT NUMBER
, x_collection_rows            OUT NUMBER
, x_host_count                 OUT NUMBER
, x_database_count             OUT NUMBER
, x_instance_count             OUT NUMBER
, x_cpu_demand                 OUT NUMBER
, x_mem_gb                     OUT NUMBER
, x_disk_gb                    OUT NUMBER
, x_rw_iops                    OUT NUMBER
, x_rw_mbps                    OUT NUMBER
, x_error_msg                  OUT VARCHAR2
);

PROCEDURE load_collection
( p_client_id                  IN  NUMBER
, p_file_name                  IN  VARCHAR2 DEFAULT 'esp_requirements.csv'
, p_spec_id                    IN  NUMBER   DEFAULT -1
, p_plan_name                  IN  VARCHAR2 DEFAULT 'Plan Name'
, p_plan_desc                  IN  VARCHAR2 DEFAULT 'Plan Description'
, p_cpu_method                 IN  VARCHAR2 DEFAULT 'EH' /* Entire History (EH), Hourly Statistics (HS), Manual Entry (MA) */
, p_cpu_statistic              IN  VARCHAR2 DEFAULT NULL /* PEAK, 99.99, 99.9, 99, 97, 95, 90, 75, MEDIAN, AVG */
, p_include_resmgr_cpu_quantum IN  VARCHAR2 DEFAULT NULL /* N, Y */
, p_cap_to_num_cpus            IN  VARCHAR2 DEFAULT NULL /* N, Y */
, p_disk_performance_method    IN  VARCHAR2 DEFAULT 'IH' /* Instance History (IH), Database History (DH), Manual Entry (MA) */
, p_disk_performance_statistic IN  VARCHAR2 DEFAULT NULL /* PEAK, 99.9, 99, 97, 95, 90, 75, MEDIAN, AVG */
, p_file_source                IN  VARCHAR2 DEFAULT 'F' /* (F)ile, (E)xternal */
, p_file_id                    IN  NUMBER   DEFAULT TO_NUMBER(NULL)
);

FUNCTION esp_collection
( p_file_id IN NUMBER
)
RETURN collection_type_type_table PIPELINED;

FUNCTION conf_pie
( p_pln_cfg_id IN NUMBER
, p_databases  IN NUMBER DEFAULT 7
)
RETURN conf_alloc_perc_type_table PIPELINED;

FUNCTION node_pie
( p_pln_cfg_id IN NUMBER
, p_srv_node   IN NUMBER
, p_databases  IN NUMBER DEFAULT 7
)
RETURN node_alloc_perc_type_table PIPELINED;

END esp_util;

/
--------------------------------------------------------
--  DDL for Package Body APP_UTIL
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "APP_UTIL" as
  /* ====================================================================
  PROCESS_NODE:
  Called from instance allocation page, when a checkbox is selected. If
  the checkbox is checked, a record is created in inst_allocation. If the
  checkbox is unchecked, the corresponding record is deleted.
  The checkbox value is passed along in p_val. The unchecked value comes
  accross as %null%.

  =======================================================================*/
procedure process_node(
    p_db_id in pls_integer
   ,p_db_alloc_id in pls_integer
   ,p_pln_cfg_id in pls_integer
   ,p_node in pls_integer
   ,p_val in varchar2)
is
  l_server_id pls_integer;
  l_updated pls_integer;
  l_inst_alloc_id pls_integer;
  l_f_inst_alloc_id pls_integer;
begin

  -- if p_pln_cfg_id is not null, get the server_id for this node
  if p_pln_cfg_id is not null then
  select srv.server_id
    into l_server_id
    from config_per_plan cop
        ,server srv
   where cop.config_id = srv.config_id
     and srv.server_type = 'C'
     and cop.pln_cfg_id = p_pln_cfg_id
     and srv.node = p_node;
  end if;

  log_msg('Processing db_id: '||p_db_id||', db_alloc_id: '||p_db_alloc_id||', pln_cfg_id: '||p_pln_cfg_id||', server_id: '||l_server_id||', node: '||p_node||', val: '||p_val);

  -- If db_alloc_id is not null, just update the allocation node layout
  if p_db_alloc_id is not null and l_server_id is not null then
    if p_val = '%null%' then
      -- Remove the instance allocation. This requries to first remove the failover allocation
      -- if it exists.

     -- Get inst_alloc_id for this node (also get inst_alloc_id_f, in case we're deleting)
    select inst_alloc_id
           ,inst_alloc_id_f
      into l_inst_alloc_id, l_f_inst_alloc_id
      from inst_allocation
     where db_alloc_id = p_db_alloc_id
       and server_id = l_server_id
       and node_layout = 'P';

       -- First, set current failover id to null so we can delete the child record
      update inst_allocation
         set inst_alloc_id_f = null
       where inst_alloc_id = l_inst_alloc_id;

      log_msg('Set failover id to null, rows: '||sql%rowcount);

      -- Second, delete failover allocation record
      delete inst_allocation
       where inst_alloc_id = l_f_inst_alloc_id;

      log_msg('Deleted failover inst_allocation, rows: ' ||sql%rowcount);

      -- Finally, delete the primary instance allocation
      delete inst_allocation
       where inst_alloc_id = l_inst_alloc_id;
      log_msg('deletied inst_allocation '||l_inst_alloc_id||', rows: '||sql%rowcount);

    else

      log_msg('updating inst_allocation :'||p_val||', '||p_db_alloc_id);
      update inst_allocation
         set node_layout = p_val
       where db_alloc_id = p_db_alloc_id
         and server_id = l_server_id
      returning inst_alloc_id into l_inst_alloc_id;

      l_updated := sql%rowcount;
      log_msg('updated rows '|| l_updated||' inst_alloc_id: '||l_inst_alloc_id);

      if l_updated = 0 then

        insert into inst_allocation (db_alloc_id,server_id,node_layout)
        values (p_db_alloc_id,l_server_id,p_val)
        returning inst_alloc_id into l_inst_alloc_id;

        log_msg('inserted rows '||sql%rowcount||' inst_alloc_id: '||l_inst_alloc_id);
      end if;

    end if;
    /*
  elsif p_val != '%null%' then
  -- If no allocation exists and p_val is not %null% then create a row

    -- Get the server_id for this node

    log_msg('insert into inst_allocation');
    --insert into inst_allocation (db_alloc_id,server_id,node_layout)
    --values (p_db_alloc_id,l_server_id,p_val);
  else
    --There is no allocation and p_val is %null%
    --therefore there is nothing to do.
    log_msg('nothing to do');
    */
  end if;

  exception
    when others then
      raise;
end process_node;

/* ====================================================================
PROCESS_FAILOVER:
Called from the instance allocation page when a failover instance is
selected from the select list. If the select list value is %null%, the
corresponding record is deleted from inst_allocation. Else, a new record
is created.
The select list value is passed in p_val.

=======================================================================*/
procedure process_failover(p_db_alloc_id in pls_integer
                           ,p_node       in pls_integer
                           ,p_pln_cfg_id in pls_integer
                           ,p_val        in varchar2)
is
  l_val             varchar2(6);
  l_p_server_id     pls_integer; --server id of primary instance
  l_p_inst_alloc_id pls_integer; --inst_alloc_id of primary instance
  l_f_server_id     pls_integer; --failover server id
  l_f_inst_alloc_id pls_integer; --return value of newly created record
begin
    log_msg('process_failover start');

    -- If p_pln_cfg_id is not null, get the server_id for this node
    select srv.server_id
      into l_p_server_id
      from config_per_plan cop
           ,server srv
     where cop.config_id = srv.config_id
       and srv.server_type = 'C'
       and cop.pln_cfg_id = p_pln_cfg_id
       and srv.node = p_node;

    -- Get inst_alloc_id for this node (also get inst_alloc_id_f, in case we're deleting)
    select inst_alloc_id
           ,inst_alloc_id_f
      into l_p_inst_alloc_id, l_f_inst_alloc_id
      from inst_allocation
     where db_alloc_id = p_db_alloc_id
       and server_id = l_p_server_id
       and node_layout = 'P';

    log_msg('process_failover db_alloc_id: '
            ||p_db_alloc_id
            ||', pln_cfg_id: '
            ||p_pln_cfg_id
            ||', p_server_id: '
            ||l_p_server_id
            ||'l_p_inst_alloc_id: '
            || l_p_inst_alloc_id
            ||', val: '
            ||p_val);

    select decode(p_val, '%null%', null,
                         p_val)
      into l_val
      from dual;

    if l_val is not null then

      -- Remove current failover record. This is done in case another failover
      -- instance was assigned.


      -- First, set current failover id to null so we can delete the child record
      update inst_allocation
         set inst_alloc_id_f = null
       where inst_alloc_id = l_p_inst_alloc_id;

      log_msg('Set failover id to null, rows: '||sql%rowcount);

      -- Second, delete failover allocation record
      delete inst_allocation
       where inst_alloc_id = l_f_inst_alloc_id;

      log_msg('Deleted previous allocation record, rows: '||sql%rowcount);

      -- Get the server_id for the failover instance
      select srv.server_id
        into l_f_server_id
        from config_per_plan cop
             ,server srv
       where cop.config_id = srv.config_id
         and srv.server_type = 'C'
         and cop.pln_cfg_id = p_pln_cfg_id
         and srv.node = l_val;

      -- Create a new inst_allocation record
      insert into inst_allocation
                  (db_alloc_id
                   ,server_id
                   ,node_layout)
           values ( p_db_alloc_id
                   ,l_f_server_id
                   ,'F')
      returning inst_alloc_id into l_f_inst_alloc_id;

      log_msg('Created new failover record inst_alloc_id: '
              ||l_f_inst_alloc_id);

      --Update current node with failover inst_alloc_id.
      update inst_allocation
         set inst_alloc_id_f = l_f_inst_alloc_id
       where inst_alloc_id = l_p_inst_alloc_id;

      log_msg('Updated inst_alloc_id_f, rows: '||sql%rowcount);


    else
      -- First, set current failover id to null so we can delete the child record
      update inst_allocation
         set inst_alloc_id_f = null
       where inst_alloc_id = l_p_inst_alloc_id;

      log_msg('Set failover id to null, rows: '||sql%rowcount);

      -- Second, delete failover record
      delete inst_allocation
       where inst_alloc_id = l_f_inst_alloc_id;

      log_msg('Deleted inst_allocation, rows: ' ||sql%rowcount);
    end if;

    log_msg('process_failover done');
exception
  when others then
             log_msg('process_failover error '
                     || sqlerrm);

             raise;
end process_failover;


/* ====================================================================
DUPLICATE_DATABASE:
Called from the Maintain Database admin page. The procedure first
creates a duplicate record of the database. Then, with the new db_id,
it creates a duplicates of all the instances associated with the
database that is being copied.
The database and instance name are appended with _n, where n is the
copy number.

=======================================================================*/
procedure duplicate_database(
    p_db_id      in pls_integer
   ,p_nbr_copies in pls_integer)
is
    l_db_id      PLS_INTEGER;
    l_db_rec     databases%rowtype;
    l_ext        varchar2(20);
    l_cnt        pls_integer := 0;
begin
    -- Fetch a copy of the database record
    select *
      into l_db_rec
      from databases
     where db_id = p_db_id;

    for idx in 1..p_nbr_copies loop
        l_cnt := 0; --reset instances count
        -- Create an extenstion to apped to db_name and db_unique_name
        l_ext := '_'||idx;
        l_db_rec.db_name := substr(l_db_rec.db_name, 1, 9 - length(l_ext)) || l_ext;
        l_db_rec.db_unique_name := substr(l_db_rec.db_unique_name, 1, 9 - length(l_ext)) || l_ext;

        -- Create a duplicate database record and return the new db_id
        insert into databases values l_db_rec
        returning db_id into l_db_id;

        log_msg('created new database l_db_id: '
                             ||l_db_id);

        -- Duplicate all instances for this database and use new db_id
        for r1 in (select * from instances where db_id = p_db_id)
        loop
          l_cnt := l_cnt + 1;
          r1.db_id := l_db_id; --newly created db_id
          r1.instance_number := l_cnt;
          r1.instance_name := substr(r1.instance_name, 1, 16 - length(l_ext))  || l_ext;

          insert into instances values r1;

        end loop;

    end loop;

    commit;
exception
    when others then
      log_msg('Duplicate database '||sqlerrm);
      raise;
end duplicate_database;


/* ====================================================================
DUPLICATE_INSTANCE:
Called from the Instance Maintenance screen. It creates a number of
copies of the given instance for the same database. The instance names
are appended with _n, where n is the copy number.

=======================================================================*/
procedure duplicate_instance(
  p_inst_id    in pls_integer
 ,p_nbr_copies in pls_integer)
is
begin
  log_msg('Duplicating '||p_nbr_copies||' instances.');

  insert into instances
              ( db_id
               ,spec_id
               ,instance_number
               ,instance_name
               ,host_name
               ,aas_cpu_demand
               ,sga_size_gb
               ,pga_size_gb
               ,r_iops
               ,w_iops
               ,r_mbps
               ,w_mbps )
    with inst
       as (select *
             from instances
            where inst_id = p_inst_id)
      select db_id
             ,spec_id
             ,instance_number + level instance_number
             ,instance_name ||'_' ||level instance_name
             ,host_name
             ,aas_cpu_demand
             ,sga_size_gb
             ,pga_size_gb
             ,r_iops
             ,w_iops
             ,r_mbps
             ,w_mbps
        from inst
     connect by level <= p_nbr_copies;

  log_msg('duplicated '||sql%rowcount||' instances');
exception
  when others then
    log_msg('P874 duplicating instances '|| sqlerrm);
    raise;

end duplicate_instance;

/* ====================================================================
DUPLICATE_SERVER:
Called from the Server Maintenance screen. It creates a number of
copies of the given server for the same configuration. The node number
is increased starting with the current max node number for this
configuration.

=======================================================================*/
procedure duplicate_server(
  p_server_id    in pls_integer
 ,p_nbr_copies in pls_integer)
is
  l_max_node pls_integer;
  l_config_id server.config_id%type;
  l_server_type server.server_type%type;
begin

  -- Get config_id and server type
  select config_id, server_type
    into l_config_id, l_server_type
    from server
   where server_id = p_server_id;

  -- Get max node for this server type
  select max(node)
    into l_max_node
    from server srv
   where srv.config_id = l_config_id
     and srv.server_type = l_server_type;


  log_msg('Duplicating '||p_nbr_copies||' servers. max node: '||l_max_node);
  insert into server
              (server_id
               ,config_id
               ,node
               ,spec_id
               ,server_type
               ,num_cpus
               ,memory_size_gb
               ,disk_size_raw_gb
               ,r_iops
               ,w_iops
               ,r_mbps
               ,w_mbps )
  with srvr
       as (select *
             from server
            where server_id = p_server_id)
      select server_id
             ,config_id
             ,l_max_node + level as node
             ,spec_id
             ,server_type
             ,num_cpus
             ,memory_size_gb
             ,disk_size_raw_gb
             ,r_iops
             ,w_iops
             ,r_mbps
             ,w_mbps
        from srvr
      connect by level <= p_nbr_copies;

  log_msg('duplicated '||sql%rowcount||' server');
exception
  when others then
    log_msg('P877 duplicating server '|| sqlerrm);
    raise;

end duplicate_server;

/* ====================================================================
RENUMBER_SERVER_NODES:
Called from the configuration maintenance page. The nodes for a
configuration are renumbered consecutively as not to leave any gaps.
=======================================================================*/
procedure renumber_server_nodes(
      p_config_id in pls_integer)
is
begin
  for r1 in (select distinct server_type from server where config_id = p_config_id) loop
    update server
       set node = rownum
      where config_id = p_config_id
        and server_type = r1.server_type;
  end loop; --r1
end renumber_server_nodes;

/* ====================================================================
GET_SERVER_NODE_GAPS:
Checks whether there are any gaps in the consecutive node numbering
of a given configuration.
=======================================================================*/
function get_server_node_gaps(
      p_config_id in pls_integer)
return pls_integer
is
  l_cnt pls_integer := 0;
begin
  for r1 in (select distinct server_type from server where config_id = p_config_id) loop
    select count(*)
      into l_cnt
      from (select rownum rn
                   ,node
              from (select node
                      from server
                     where config_id = p_config_id
                       and server_type = r1.server_type
                     order by node))
     where rn <> node;

     if l_cnt > 0 then
       return 1;
     end if;

  end loop; --r1
  return 0; -- no gaps
end get_server_node_gaps;

/* ====================================================================
GET_FAILOVER_NODE:
Called from the Instance Allocation page, failover select list. The
value returned is to set the selected value in the nodes select list.
This query could have been included in the select lists p_value parameter,
however, this method makes it more readable.
=======================================================================*/
function get_failover_node(
    p_db_alloc_id in pls_integer
   ,p_config_id   in pls_integer
   ,p_node        in pls_integer)
return pls_integer
is
  l_failover_node pls_integer;
begin
  select srvf.node
    into l_failover_node
    from server srv
        ,inst_allocation ial
        ,inst_allocation ialf
        ,server srvf
   where srv.config_id = p_config_id
     and srv.node      = p_node
     and srv.server_type = 'C'
     --
     and ial.db_alloc_id = p_db_alloc_id
     and ial.server_id = srv.server_id
     --
     and ial.inst_alloc_id_f = ialf.inst_alloc_id(+)
     and ialf.server_id = srvf.server_id
     and srvf.server_type = 'C';

  return l_failover_node;

end get_failover_node;

procedure duplicate_plan(
    p_plan_id in pls_integer)
is
  l_plan_id pls_integer;
  l_ext constant varchar2(2) := '_1';
  l_plan_rec plan%rowtype;

begin
  -- Duplicate plan
    select *
      into l_plan_rec
      from plan
     where plan_id = p_plan_id;


  insert into plan (plan_name,plan_desc,client_id)
  values (substr(l_plan_rec.plan_name, 1, 40 - length(l_ext)) || l_ext
         ,l_plan_rec.plan_desc
         ,l_plan_rec.client_id)
  returning plan_id into l_plan_id;

 -- Duplicate DB Per Plan
 insert into db_per_plan (plan_id,db_id)
 select l_plan_id, db_id
   from db_per_plan
  where plan_id = p_plan_id;

 -- Duplicate Config Per Plan
 insert into config_per_plan
              (plan_id
               ,config_id
               ,redundancy_level
               ,thread_efficiency
               ,num_cpus_adj
               ,memory_adj
               ,disk_size_adj
               ,offloading_adj
               ,compression_adj
               ,backup_adj
               ,r_iops_adj
               ,w_iops_adj
               ,r_mbps_adj
               ,w_mbps_adj
               ,pln_cfg_name)
  select l_plan_id
        ,config_id
        ,redundancy_level
        ,thread_efficiency
        ,num_cpus_adj
        ,memory_adj
        ,disk_size_adj
        ,offloading_adj
        ,compression_adj
        ,backup_adj
        ,r_iops_adj
        ,w_iops_adj
        ,r_mbps_adj
        ,w_mbps_adj
        ,pln_cfg_name
    from config_per_plan
   where plan_id = p_plan_id;

 -- Duplicate DB Allocation
  insert into inst_allocation
              (db_alloc_id
               ,server_id
               ,node_layout
               ,inst_alloc_id_f)
  select db_alloc_id
         ,server_id
         ,node_layout
         ,inst_alloc_id_f
    from inst_allocation
   where db_alloc_id in (select db_alloc_id
                           from db_allocation
                          where plan_id = p_plan_id) ;
 -- Duplicate Instance Allocation



end duplicate_plan;

/* ====================================================================
TOGGLE_FAIL_NODE:
Called from Instance Allocation page (500) when the red X above a node
is clicked. When a node is failed, we need to check whether the node
has a failover node assigned. If so, the failover api is called. If
then node has no failover node assigned, the node_layout for this node
in this configuration plan is set to X. This way the view that aggregates
the node metrics can ignore the node, and assign its load to another.
When the node is toggled back, the node_layout is set back to P.
=======================================================================*/
procedure toggle_fail_node(p_node in pls_integer
                          ,p_pln_cfg_id in pls_integer
                          ,p_config_id in pls_integer)
is
  l_node_layout varchar2(1) := 'X';
  l_server_id   pls_integer;
begin
    log_msg('toggle_fail_node p_node: '||p_node ||', p_pln_cfg_id: '
            ||p_pln_cfg_id ||', p_config_id: '||p_config_id);

    -- Reset the databases for this pln_cfg_id to P
    update inst_allocation ial
       set ial.node_layout = 'P'
     where ial.db_alloc_id in (select dal.db_alloc_id
                                 from db_allocation dal
                                where pln_cfg_id = p_pln_cfg_id)
       and ial.node_layout = 'X';

    log_msg('toggle_fail_node reset rows: '
            || sql%rowcount);

    select nvl(max(srv.server_id), -1)
      into l_server_id
      from server srv
     where srv.config_id = p_config_id
       and srv.server_type = 'C'
       and srv.node = p_node;

    dbms_output.put_line('l_server_id: '
                         || l_server_id);

    if p_node > 0 then
      -- Set the node_layout to X for only those databases
      -- that do not have a failover node assigned.
      update inst_allocation ial
         set ial.node_layout = l_node_layout
       where ial.server_id = (select srv.server_id
                                from server srv
                               where srv.config_id = p_config_id
                                 and srv.server_type = 'C'
                                 and srv.node = p_node)
         and ial.inst_alloc_id_f is null;

      log_msg('toggle_fail_node updated rows: '
              || sql%rowcount);
    end if;
exception
  when others then
             log_msg('toggle_fail_node '
                     ||sqlerrm);
end toggle_fail_node;


/* ====================================================================
WRITE_BLOB_TO_FILE:
Called from Admin -> Data Loading (895) on submit.
After a file is uploaded to the file_transfer table, this procedure
writes the blob back to the server file system. Afterwards, the load_data
procedure is called, which in turn calls the esp_util.load_collection
procedure.
=======================================================================*/
procedure write_blob_to_file (p_file_id in pls_integer)
as
  l_file_blob   blob;
  l_file_name   file_transfer.file_name%type;
  l_blob_size   number;
  l_dir         varchar2(200) := 'ESP_DIR';
  l_buffer      raw(32767);
  l_buffer_size binary_integer;
  l_amount      binary_integer;
  l_offset      number(38) := 1;
  l_chuncksize  integer;
  l_out_file    utl_file.file_type;
begin
    log_msg('write_blob_to_file p_file_id: '||p_file_id);

    -- Get blob info
    select file_blob
          ,file_name
          ,dbms_lob.getlength(file_blob)
      into l_file_blob, l_file_name, l_blob_size
      from file_transfer
     where file_id = p_file_id;

    log_msg('write_blob_to_file file_name: '||l_file_name||', size: '||l_blob_size);


    l_chuncksize := dbms_lob.getchunksize(l_file_blob);

    if ( l_chuncksize < 32767 ) then
      l_buffer_size := l_chuncksize;
    else
      l_buffer_size := 32767;
    end if;

    l_amount := l_buffer_size;

    dbms_lob.open(l_file_blob, dbms_lob.lob_readonly);

    -- write to file
    l_out_file := utl_file.fopen(location => l_dir
                                ,filename => l_file_name
                                ,open_mode => 'wb'
                                ,max_linesize => 32767);

    while l_amount >= l_buffer_size loop
        dbms_lob.read(lob_loc => l_file_blob
                     ,amount => l_amount
                     ,offset => l_offset
                     ,buffer => l_buffer);

        l_offset := l_offset + l_amount;

        utl_file.put_raw (file => l_out_file
                         ,buffer => l_buffer
                         ,autoflush => true)
        ;

        utl_file.fflush(file => l_out_file);

    end loop;

    utl_file.fflush(file => l_out_file);

    utl_file.fclose(l_out_file);

    dbms_lob.close(l_file_blob);

    update file_transfer
       set blob_size = l_blob_size
     where file_id = p_file_id;

exception
  when others then
             log_msg('write_blob_to_file error: '|| sqlerrm);

             raise;
end write_blob_to_file;

/* ====================================================================
*** DEPRECATED **
LOAD_FILE:
Called from Admin -> Data Loading (p895) on submit, after the blob from
file_transfer has been written to the file system. This procedure calls
esp_util.load_collection to load the file data into the esp schema.
=======================================================================*/
procedure load_file(p_file_id in pls_integer)
is
  l_rec file_transfer%rowtype;
begin
  null;
  /*
  log_msg('load_file p_file_id: '|| p_file_id);
    -- Get blob info
    select *
      into l_rec
      from file_transfer
     where file_id = p_file_id;

    esp_util.load_collection (
         p_client_id              => l_rec.client_id
        ,p_file_name              => l_rec.file_name
        ,p_cpu_percentile         => l_rec.cpu_percentile
        ,p_include_resmgr_quantum => l_rec.include_resmgr_quantum
        ,p_disk_perf_percentile   => l_rec.disk_perf_percentile
        ,p_disk_perf_method       => l_rec.disk_perf_method);
  */
exception
  when others then
             log_msg('load_file error: '
                     ||sqlerrm);

             raise;
end load_file;


/* ====================================================================
CREATE_APEX_SESSION:
From http://www.talkapex.com/2012/08/how-to-create-apex-session-in-plsql.html
=======================================================================*/
procedure create_apex_session (
    p_app_id      in apex_applications.application_id%type,
    p_app_user    in apex_workspace_activity_log.apex_user%type,
    p_app_page_id in apex_application_pages.page_id%type)
is
  l_workspace_id apex_applications.workspace_id%type;
  l_cgivar_name  owa.vc_arr;
  l_cgivar_val   owa.vc_arr;
begin

  htp.init;

  l_cgivar_name(1) := 'request_protocol';
  l_cgivar_val(1) := 'http';

  owa.init_cgi_env(
    num_params => 1,
    param_name => l_cgivar_name,
    param_val => l_cgivar_val );

  select workspace_id
  into l_workspace_id
  from apex_applications
  where application_id = p_app_id;

  wwv_flow_api.set_security_group_id(l_workspace_id);

  apex_application.g_instance := 1;
  apex_application.g_flow_id := p_app_id;
  apex_application.g_flow_step_id := p_app_page_id;

  apex_custom_auth.post_login(
    p_uname => p_app_user,
    p_session_id => null, -- could use apex_custom_auth.get_next_session_id
    p_app_page => apex_application.g_flow_id||':'||p_app_page_id);
end create_apex_session;

procedure set_apex_session(
    p_app_id in pls_integer default 200
   ,p_app_session in number
   ,p_workspace_name in varchar2 default 'DEV')
is
  v_workspace_id apex_workspaces.workspace_id%type;
begin
  select workspace_id
    into v_workspace_id
    from apex_workspaces
   where workspace = p_workspace_name;

   -- Set Workspace ID
   apex_util.set_security_group_id(v_workspace_id);

   -- Set Application ID
   apex_application.g_flow_id  := p_app_id;

   -- Set Session ID
   apex_application.g_instance := p_app_session;
end set_apex_session;


/* ====================================================================
PROCESS_SPREADSHEET_LOAD:
Called from the spreadsheed dataload wizard. It creates records in:
databases, instances, plan, db_per_plan from the data in spreadsheet_stage.
=======================================================================*/
procedure process_spreadsheet_load (
        p_plan_name in varchar2
       ,p_plan_desc in varchar2
       ,p_client_id in pls_integer
       ,p_db_cnt    out pls_integer
       ,p_inst_cnt  out pls_integer)
is
  l_db   spreadsheet_stage%rowtype;
  l_inst spreadsheet_stage%rowtype;
  l_inst_nbr pls_integer;
  l_db_id databases.db_id%type;
  l_inst_nbr instances.instance_number%type;
  l_spec_id  spec_v.spec_id%type := -1;
  l_cnt pls_integer := 0;
  l_plan plan%rowtype;
  l_load_date date := sysdate;
  l_plan_id  number;
  l_prc constant varchar2(30) := 'PROCESS_SPREADSHEET_LOAD ';

  l_r_iops databases.r_iops%type;
  l_w_iops databases.w_iops%type;
  l_r_mbps databases.r_mbps%type;
  l_w_mbps databases.w_mbps%type;
begin

log_msg(l_prc||'start');
p_db_cnt   := 0;
p_inst_cnt := 0;
-- create a new plan
l_plan := null;
l_plan.client_id                  := p_client_id;
l_plan.plan_name                  := p_plan_name;
l_plan.plan_desc                  := p_plan_desc;
l_plan.cpu_method                  := 'EH';
l_plan.cpu_statistic               := 'PEAK';
l_plan.include_resmgr_cpu_quantum  := 'N';
l_plan.cap_to_num_cpus             := 'N';
l_plan.disk_performance_method     := 'IH';
l_plan.disk_performance_statistic  := 'PEAK';
l_plan.source                      := 'manual';
l_plan.load_date                   := l_load_date;

insert into plan values l_plan returning plan_id into l_plan_id;

log_msg(l_prc||'plan created rows: '||sql%rowcount);

for r1 in (select  db_name
                  ,sum(sga_size) sga_size
                  ,sum(pga_size) pga_size
                  ,sum(rw_iops) rw_iops
                  ,sum(r_iops) r_iops
                  ,sum(w_iops) w_iops
                  ,sum(rw_mbps) rw_mbps
                  ,sum(r_mbps) r_mbps
                  ,sum(w_mbps) w_mbps
             from spreadsheet_stage
            where db_name is not null
            group by db_name
            order by db_name)
loop
    l_cnt := 0;
    select * into l_db from spreadsheet_stage where db_name = r1.db_name and rownum = 1;

    dbms_output.put_line('creating db '|| r1.db_name);
    -- create database record
    insert into databases
                (db_name
                 ,platform_name
                 ,host_name_src
                 ,version
                 ,db_desc
                 ,database_size_gb
                 ,aas_cpu_demand
                 ,sga_size_gb
                 ,pga_size_gb
                 ,r_iops
                 ,w_iops
                 ,r_mbps
                 ,w_mbps
                 ,client_id
                 ,collection_key
                 ,collection_date
                 ,load_date
                 ,cpu_count)
         values ( l_db.db_name
                 ,l_db.os
                 ,l_db.hostname
                 ,l_db.db_version
                 ,null --db_desc
                 ,(select sum(db_size) from spreadsheet_stage where db_name = r1.db_name)
                 ,(select sum(cpu_aas) from spreadsheet_stage where db_name = r1.db_name)
                 ,r1.sga_size
                 ,r1.pga_size
                 ,r1.r_iops
                 ,r1.w_iops
                 ,r1.r_mbps
                 ,r1.w_mbps
                 ,p_client_id
                 ,null --collection_key
                 ,null --collection_date
                 ,l_load_date
                 ,(select sum(nbr_of_cpus) from spreadsheet_stage where db_name = r1.db_name)
                 )
        returning db_id into l_db_id;

        p_db_cnt := p_db_cnt + 1;
        log_msg(l_prc||'created db_id: '||l_db_id);

    -- create instance records
    for r2 in (select * from spreadsheet_stage where db_name = r1.db_name)
    loop
        l_cnt := l_cnt + 1;
        insert into instances
                    (db_id
                     ,spec_id
                     ,instance_number
                     ,instance_name
                     ,host_name
                     ,aas_cpu_demand
                     ,sga_size_gb
                     ,pga_size_gb
                     ,r_iops
                     ,w_iops
                     ,r_mbps
                     ,w_mbps
                     ,cpu_count)
             values (l_db_id
                     ,l_spec_id
                     ,l_cnt
                     ,nvl(l_db.instance_name,l_db.db_name)
                     ,r2.hostname
                     ,r2.cpu_aas
                     ,r2.sga_size
                     ,r2.pga_size
                     ,nvl(r2.r_iops,round(r2.rw_iops*.8,0))
                     ,nvl(r2.w_iops,round(r2.rw_iops*.2,0))
                     ,nvl(r2.r_mbps,round(r2.rw_mbps*.8,0))
                     ,nvl(r2.w_mbps,round(r2.rw_mbps*.2,0))
                     ,r2.nbr_of_cpus );

             p_inst_cnt := p_inst_cnt + 1;

        log_msg(l_prc||'created instance: '||p_inst_cnt);
    end loop;

   -- sum up iops and mbps
   select sum(r_iops),sum(w_iops),sum(r_mbps),sum(w_mbps)
     into l_r_iops, l_w_iops, l_r_mbps, l_w_mbps
     from instances
    where db_id = l_db_id;

   update databases
      set r_iops = l_r_iops
         ,w_iops = l_w_iops
         ,r_mbps = l_r_mbps
         ,w_mbps = l_w_mbps
    where db_id = l_db_id;

   insert into db_per_plan (plan_id, db_id, target_instances)
   values (l_plan_id, l_db_id, l_cnt);

   log_msg(l_prc||'insert into db_per_plan rows: '|| sql%rowcount);
end loop;

exception
  when others then
    log_msg(l_prc||sqlerrm);
    raise;
end process_spreadsheet_load;

end app_util;

/
--------------------------------------------------------
--  DDL for Package Body ESP_UTIL
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "ESP_UTIL" AS

  H_HEAD CONSTANT VARCHAR2(32767) := '<html>
<!-- $Header: eSP Copyright (c) 2015, All rights reserved. SYSDATE $-->
<!-- Author: carlos.sierra.usa@gmail.com -->

<head>
<title>TITLE</title>
';

  H_CSS CONSTANT VARCHAR2(32767) := '<style type="text/css">
body          {font:10pt Arial,Helvetica,Geneva,sans-serif; color:black; background:white;}
h1            {font-size:16pt; font-weight:bold; color:#336699; border-bottom:1px solid #cccc99; margin-top:0pt; margin-bottom:0pt; padding:0px 0px 0px 0px;}
h2            {font-size:14pt; font-weight:bold; color:#336699; margin-top:4pt; margin-bottom:0pt;}
h3            {font-size:12pt; font-weight:bold; color:#336699; margin-top:4pt; margin-bottom:0pt;}
pre           {font:8pt monospace;Monaco,"Courier New",Courier;}
a             {color:#663300;}
table         {font-size:8pt; border_collapse:collapse; empty-cells:show; white-space:nowrap; border:1px solid #cccc99;}
li            {font-size:8pt; color:black; padding-left:4px; padding-right:4px; padding-bottom:2px;}
th            {font-weight:bold; color:white; background:#0066CC; padding-left:4px; padding-right:4px; padding-bottom:2px;}
tr            {color:black; background:#fcfcf0;}
td            {vertical-align:top; border:1px solid #cccc99;}
td.c          {text-align:center;}
font.n        {font-size:8pt; font-style:italic; color:#336699;}
font.f        {font-size:8pt; color:#999999; border-top:1px solid #cccc99; margin-top:30pt;}
</style>
';

  H_BODY_H1 CONSTANT VARCHAR2(32767) := '</head>
<body>
<h1>TITLE</h1>
<br>';

  H_BODY CONSTANT VARCHAR2(32767) := 'ABSTRACT

<div id="chart_div_NNNN" style="width: 900px; height: 500px;"></div>

<font class="n">Notes:NOTES</font>';

  H_TAIL CONSTANT VARCHAR2(32767) := '
<br>
<font class="f">eSP (c) 2015. Version v1503 (2015-02-08). Chart generated on SYSDATE.</font>
</body>
</html>';

FUNCTION node_alloc
( p_pln_cfg_id  IN NUMBER
, p_failed_node IN NUMBER DEFAULT NULL
)
RETURN node_alloc_type_table PIPELINED
IS
  r_conf_per_plan_v conf_per_plan_v%ROWTYPE;
  r_node_alloc_type node_alloc_type := node_alloc_type(NULL, NULL, NULL, NULL, NULL);
BEGIN
  SELECT * INTO r_conf_per_plan_v FROM conf_per_plan_v WHERE pln_cfg_id = p_pln_cfg_id;
  FOR i IN 1 .. r_conf_per_plan_v.compute_servers
  LOOP
    FOR j IN (SELECT CASE i WHEN p_failed_node THEN 0 ELSE SUM(ial_num_cpu_perc) END cpu_perc_allocated,
                     CASE i WHEN p_failed_node THEN 0 ELSE SUM(ial_mem_size_perc) END mem_perc_allocated,
                     CASE i WHEN p_failed_node THEN 0 ELSE 100 - SUM(ial_num_cpu_perc) END cpu_perc_available,
                     CASE i WHEN p_failed_node THEN 0 ELSE 100 - SUM(ial_mem_size_perc) END mem_perc_available
                FROM inst_alloc_v
               WHERE pln_cfg_id = p_pln_cfg_id
                 AND ((srv_node = i AND node_layout = 'P') OR (srv_node = p_failed_node AND srf_node = i)))
    LOOP
      r_node_alloc_type.node               := i;
      r_node_alloc_type.cpu_perc_allocated := j.cpu_perc_allocated;
      r_node_alloc_type.mem_perc_allocated := j.mem_perc_allocated;
      r_node_alloc_type.cpu_perc_available := j.cpu_perc_available;
      r_node_alloc_type.mem_perc_available := j.mem_perc_available;
      PIPE ROW(r_node_alloc_type);
    END LOOP;
  END LOOP;
  RETURN;
END node_alloc;

/* ------------------------------------------------------------------------- */

PROCEDURE inst_alloc
( p_plan_id         IN NUMBER
, p_db_alloc_method IN VARCHAR2 DEFAULT 'B' /* (B)alanced, (D)ense */
, p_dense_percent   IN NUMBER   DEFAULT 100 /* 100, 90, 80, 70, etc. */
, p_pln_cfg_id      IN NUMBER   DEFAULT NULL
, p_pln_db_id       IN NUMBER   DEFAULT NULL
)
IS
BEGIN
  FOR i IN (SELECT db_alloc_id FROM db_allocation WHERE plan_id = p_plan_id AND pln_cfg_id = NVL(p_pln_cfg_id, pln_cfg_id) AND pln_db_id = NVL(p_pln_db_id, pln_db_id))
  LOOP
    UPDATE inst_allocation SET inst_alloc_id_f = NULL WHERE db_alloc_id = i.db_alloc_id AND inst_alloc_id_f IS NOT NULL;
    DELETE inst_allocation WHERE db_alloc_id = i.db_alloc_id;
  END LOOP;
  FOR i IN (SELECT COALESCE(target_instances, source_instances, 1) instances,
                   db_alloc_id,
                   pln_cfg_id,
                   dbs_cpu_demand_spec,
                   dbs_mem_size_gb
              FROM db_alloc_v
             WHERE plan_id = p_plan_id
               AND pln_cfg_id = NVL(p_pln_cfg_id, pln_cfg_id)
               AND pln_db_id = NVL(p_pln_db_id, pln_db_id))
  LOOP
    FOR j IN 1 .. i.instances
    LOOP
      FOR k IN (SELECT server_id
                  FROM node_alloc_v2
                 WHERE plan_id = p_plan_id
                   AND pln_cfg_id = i.pln_cfg_id
                   AND (p_dense_percent * cap_num_cpu_spec / 100) - ial_num_cpu_spec > i.dbs_cpu_demand_spec / i.instances
                   AND (p_dense_percent * cap_mem_size_gb / 100)  - ial_mem_size_gb  > i.dbs_mem_size_gb  / i.instances
                   AND server_id NOT IN (SELECT server_id FROM inst_allocation WHERE db_alloc_id = i.db_alloc_id)
                 ORDER BY
                   CASE p_db_alloc_method
                   WHEN 'B' THEN ial_num_cpu_perc
                   WHEN 'D' THEN - ial_num_cpu_perc
                   END,
                   srv_node)

      LOOP
        INSERT INTO inst_allocation (db_alloc_id, server_id)
        VALUES (i.db_alloc_id, k.server_id);
        EXIT;
      END LOOP;
    END LOOP;
  END LOOP;
  COMMIT;
END inst_alloc;

/* ------------------------------------------------------------------------- */

PROCEDURE db_alloc
( p_plan_id         IN NUMBER
, p_db_alloc_method IN VARCHAR2 DEFAULT 'B' /* (B)alanced, (D)ense */
, p_dense_percent   IN NUMBER   DEFAULT 100 /* 100, 90, 80, 70, etc. */
, p_pln_cfg_id      IN NUMBER   DEFAULT NULL
)
IS
BEGIN
  FOR i IN (SELECT db_alloc_id FROM db_allocation WHERE plan_id = p_plan_id AND pln_cfg_id = NVL(p_pln_cfg_id, pln_cfg_id))
  LOOP
    UPDATE inst_allocation SET inst_alloc_id_f = NULL WHERE db_alloc_id = i.db_alloc_id AND inst_alloc_id_f IS NOT NULL;
    DELETE inst_allocation WHERE db_alloc_id = i.db_alloc_id;
  END LOOP;
  DELETE db_allocation WHERE plan_id = p_plan_id AND pln_cfg_id = NVL(p_pln_cfg_id, pln_cfg_id);
  FOR i IN (SELECT pln_db_id,
                   aas_cpu_demand_spec,
                   mem_size_gb,
                   database_size_gb,
                   rw_iops,
                   r_iops,
                   w_iops,
                   rw_mbps,
                   r_mbps,
                   w_mbps
               FROM db_per_plan_v
             WHERE plan_id = p_plan_id
             ORDER BY
                   aas_cpu_demand_spec DESC)
  LOOP
    FOR j IN (SELECT pln_cfg_id
                FROM config_alloc_v
               WHERE plan_id = p_plan_id
                 AND pln_cfg_id = NVL(p_pln_cfg_id, pln_cfg_id)
                 AND (p_dense_percent * cap_num_cpu_spec / 100) - cal_num_cpu_spec > i.aas_cpu_demand_spec
                 AND (p_dense_percent * cap_mem_size_gb / 100)  - cal_mem_size_gb  > i.mem_size_gb
                 AND (p_dense_percent * cap_disk_size_gb / 100) - cal_disk_size_gb > i.database_size_gb
                 AND (p_dense_percent * cap_rw_iops / 100)      - cal_rw_iops      > i.rw_iops
                 AND (p_dense_percent * cap_r_iops / 100)       - cal_r_iops       > i.r_iops
                 AND (p_dense_percent * cap_w_iops / 100)       - cal_w_iops       > i.w_iops
                 AND (p_dense_percent * cap_rw_mbps / 100)      - cal_rw_mbps      > i.rw_mbps
                 AND (p_dense_percent * cap_r_mbps / 100)       - cal_r_mbps       > i.r_mbps
                 AND (p_dense_percent * cap_w_mbps / 100)       - cal_w_mbps       > i.w_mbps
               ORDER BY
                     CASE p_db_alloc_method
                     WHEN 'B' THEN cal_num_cpu_perc
                     WHEN 'D' THEN - cap_num_cpu_spec
                     END,
                     CASE p_db_alloc_method
                     WHEN 'B' THEN - cap_num_cpu_spec
                     WHEN 'D' THEN - cal_num_cpu_perc
                     END)

    LOOP
      INSERT INTO db_allocation (pln_db_id, pln_cfg_id, plan_id)
      VALUES (i.pln_db_id, j.pln_cfg_id, p_plan_id);
      EXIT;
    END LOOP;
  END LOOP;
  COMMIT;
END db_alloc;

/* ------------------------------------------------------------------------- */

FUNCTION time_series
( p_plan_id   IN NUMBER
, p_host_name IN VARCHAR2 DEFAULT NULL
, p_db_name   IN VARCHAR2 DEFAULT NULL
, p_date_from IN DATE     DEFAULT NULL
, p_date_to   IN DATE     DEFAULT NULL
, p_compress  IN VARCHAR2 DEFAULT 'Y' /* Y, N */
)
RETURN time_series_type_table PIPELINED
IS
  l_days NUMBER;
  l_format_model VARCHAR2(2);
  l_group VARCHAR2(2);
  r_time_series_type time_series_type := time_series_type
  ( NULL -- time
  , NULL -- cpu_count
  , NULL -- on_cpu
  , NULL -- resmgr_cpu_quantum
  , NULL -- on_cpu_99p
  , NULL -- resmgr_cpu_quantum_99p
  , NULL -- on_cpu_97p
  , NULL -- resmgr_cpu_quantum_97p
  , NULL -- on_cpu_95p
  , NULL -- resmgr_cpu_quantum_95p
  , NULL -- on_cpu_90p
  , NULL -- resmgr_cpu_quantum_90p
  , NULL -- on_cpu_75p
  , NULL -- resmgr_cpu_quantum_75p
  , NULL -- on_cpu_med
  , NULL -- resmgr_cpu_quantum_med
  , NULL -- on_cpu_avg
  , NULL -- resmgr_cpu_quantum_avg
  , NULL -- sga_gb
  , NULL -- pga_gb
  , NULL -- r_iops
  , NULL -- w_iops
  , NULL -- r_mbps
  , NULL -- w_mbps
  , NULL -- perm_gb
  , NULL -- undo_gb
  , NULL -- temp_gb
  );
BEGIN
  WITH
  my_hosts AS (
  SELECT host_name,
         db_name,
         MAX(cpu_count) cpu_count
    FROM time_series_v
   WHERE plan_id   = p_plan_id
     AND host_name = NVL(p_host_name, host_name)
     AND db_name   = NVL(p_db_name, db_name)
   GROUP BY
         host_name,
         db_name
   )
   SELECT SUM(cpu_count)
     INTO r_time_series_type.cpu_count
     FROM my_hosts;

  IF p_compress = 'Y' THEN
    SELECT MAX(end_time) - MIN(end_time)
      INTO l_days
      FROM time_series_v
     WHERE plan_id   = p_plan_id
       AND host_name = NVL(p_host_name, host_name)
       AND db_name   = NVL(p_db_name, db_name)
       AND end_time >= NVL(TRUNC(p_date_from), end_time)
       AND end_time <= NVL(TRUNC(p_date_to) + 1, end_time);

    IF l_days < 416.666 THEN
      l_format_model := 'HH'; -- up to 416.666 * 24 = 10,000 rows
    ELSE
      l_format_model := 'DD'; -- up to 365 rows per year
    END IF;
  ELSE -- no compress
    l_format_model := 'HH'; -- up to 365.25 * 24 = 8,766 rows per year
  END IF;

  FOR i IN (SELECT TRUNC(v.end_time, l_format_model) time,
                   MAX(v.on_cpu)                 on_cpu,
                   MAX(v.resmgr_cpu_quantum)     resmgr_cpu_quantum,
                   MAX(v.on_cpu_99p)             on_cpu_99p,
                   MAX(v.resmgr_cpu_quantum_99p) resmgr_cpu_quantum_99p,
                   MAX(v.on_cpu_97p)             on_cpu_97p,
                   MAX(v.resmgr_cpu_quantum_97p) resmgr_cpu_quantum_97p,
                   MAX(v.on_cpu_95p)             on_cpu_95p,
                   MAX(v.resmgr_cpu_quantum_95p) resmgr_cpu_quantum_95p,
                   MAX(v.on_cpu_90p)             on_cpu_90p,
                   MAX(v.resmgr_cpu_quantum_90p) resmgr_cpu_quantum_90p,
                   MAX(v.on_cpu_75p)             on_cpu_75p,
                   MAX(v.resmgr_cpu_quantum_75p) resmgr_cpu_quantum_75p,
                   MAX(v.on_cpu_med)             on_cpu_med,
                   MAX(v.resmgr_cpu_quantum_med) resmgr_cpu_quantum_med,
                   MAX(v.on_cpu_avg)             on_cpu_avg,
                   MAX(v.resmgr_cpu_quantum_avg) resmgr_cpu_quantum_avg,
                   MAX(v.sga_gb)                 sga_gb,
                   MAX(v.pga_gb)                 pga_gb,
                   MAX(v.r_iops)                 r_iops,
                   MAX(v.w_iops)                 w_iops,
                   MAX(v.r_mbps)                 r_mbps,
                   MAX(v.w_mbps)                 w_mbps,
                   MAX(v.perm)                   perm,
                   MAX(v.undo)                   undo,
                   MAX(v.temp)                   temp
              FROM
           (SELECT end_time,
                   SUM(on_cpu)                 on_cpu,
                   SUM(resmgr_cpu_quantum)     resmgr_cpu_quantum,
                   SUM(on_cpu_99p)             on_cpu_99p,
                   SUM(resmgr_cpu_quantum_99p) resmgr_cpu_quantum_99p,
                   SUM(on_cpu_97p)             on_cpu_97p,
                   SUM(resmgr_cpu_quantum_97p) resmgr_cpu_quantum_97p,
                   SUM(on_cpu_95p)             on_cpu_95p,
                   SUM(resmgr_cpu_quantum_95p) resmgr_cpu_quantum_95p,
                   SUM(on_cpu_90p)             on_cpu_90p,
                   SUM(resmgr_cpu_quantum_90p) resmgr_cpu_quantum_90p,
                   SUM(on_cpu_75p)             on_cpu_75p,
                   SUM(resmgr_cpu_quantum_75p) resmgr_cpu_quantum_75p,
                   SUM(on_cpu_med)             on_cpu_med,
                   SUM(resmgr_cpu_quantum_med) resmgr_cpu_quantum_med,
                   SUM(on_cpu_avg)             on_cpu_avg,
                   SUM(resmgr_cpu_quantum_avg) resmgr_cpu_quantum_avg,
                   SUM(sga_gb)                 sga_gb,
                   SUM(pga_gb)                 pga_gb,
                   SUM(r_iops)                 r_iops,
                   SUM(w_iops)                 w_iops,
                   SUM(r_mbps)                 r_mbps,
                   SUM(w_mbps)                 w_mbps,
                   SUM(perm)                   perm,
                   SUM(undo)                   undo,
                   SUM(temp)                   temp
              FROM time_series_v
             WHERE plan_id   = p_plan_id
               AND host_name = NVL(p_host_name, host_name)
               AND db_name   = NVL(p_db_name, db_name)
               AND end_time >= NVL(TRUNC(p_date_from), end_time)
               AND end_time <= NVL(TRUNC(p_date_to) + 1, end_time)
             GROUP BY
                   end_time) v
             GROUP BY
                   TRUNC(v.end_time, l_format_model)
             ORDER BY
                   TRUNC(v.end_time, l_format_model))
  LOOP
    r_time_series_type.time                   := i.time              ;
    r_time_series_type.on_cpu                 := i.on_cpu            ;
    r_time_series_type.resmgr_cpu_quantum     := i.resmgr_cpu_quantum;
    r_time_series_type.on_cpu_99p             := i.on_cpu_99p            ;
    r_time_series_type.resmgr_cpu_quantum_99p := i.resmgr_cpu_quantum_99p;
    r_time_series_type.on_cpu_97p             := i.on_cpu_97p            ;
    r_time_series_type.resmgr_cpu_quantum_97p := i.resmgr_cpu_quantum_97p;
    r_time_series_type.on_cpu_95p             := i.on_cpu_95p            ;
    r_time_series_type.resmgr_cpu_quantum_95p := i.resmgr_cpu_quantum_95p;
    r_time_series_type.on_cpu_90p             := i.on_cpu_90p            ;
    r_time_series_type.resmgr_cpu_quantum_90p := i.resmgr_cpu_quantum_90p;
    r_time_series_type.on_cpu_75p             := i.on_cpu_75p            ;
    r_time_series_type.resmgr_cpu_quantum_75p := i.resmgr_cpu_quantum_75p;
    r_time_series_type.on_cpu_med             := i.on_cpu_med            ;
    r_time_series_type.resmgr_cpu_quantum_med := i.resmgr_cpu_quantum_med;
    r_time_series_type.on_cpu_avg             := i.on_cpu_avg            ;
    r_time_series_type.resmgr_cpu_quantum_avg := i.resmgr_cpu_quantum_avg;
    r_time_series_type.sga_gb                 := i.sga_gb            ;
    r_time_series_type.pga_gb                 := i.pga_gb            ;
    r_time_series_type.r_iops                 := i.r_iops            ;
    r_time_series_type.w_iops                 := i.w_iops            ;
    r_time_series_type.r_mbps                 := i.r_mbps            ;
    r_time_series_type.w_mbps                 := i.w_mbps            ;
    r_time_series_type.perm_gb                := i.perm              ;
    r_time_series_type.undo_gb                := i.undo              ;
    r_time_series_type.temp_gb                := i.temp              ;
    PIPE ROW(r_time_series_type);
  END LOOP;
  RETURN;
END time_series;

/* ------------------------------------------------------------------------- */

FUNCTION os_time_series
( p_plan_id   IN NUMBER
, p_host_name IN VARCHAR2 DEFAULT NULL
, p_date_from IN DATE     DEFAULT NULL
, p_date_to   IN DATE     DEFAULT NULL
, p_compress  IN VARCHAR2 DEFAULT 'Y' /* Y, N */
)
RETURN os_time_series_type_table PIPELINED
IS
  l_days NUMBER;
  l_format_model VARCHAR2(2);
  l_group VARCHAR2(2);
  r_time_series_type os_time_series_type := os_time_series_type
  ( NULL -- time
  , NULL -- on_cpu
  , NULL -- resmgr_cpu_quantum
  , NULL -- on_cpu_99p
  , NULL -- resmgr_cpu_quantum_99p
  , NULL -- on_cpu_97p
  , NULL -- resmgr_cpu_quantum_97p
  , NULL -- on_cpu_95p
  , NULL -- resmgr_cpu_quantum_95p
  , NULL -- on_cpu_90p
  , NULL -- resmgr_cpu_quantum_90p
  , NULL -- on_cpu_75p
  , NULL -- resmgr_cpu_quantum_75p
  , NULL -- on_cpu_med
  , NULL -- resmgr_cpu_quantum_med
  , NULL -- on_cpu_avg
  , NULL -- resmgr_cpu_quantum_avg
  , NULL -- sga_gb
  , NULL -- pga_gb
  , NULL -- r_iops
  , NULL -- w_iops
  , NULL -- r_mbps
  , NULL -- w_mbps
  , NULL -- load
  , NULL -- num_cpus
  , NULL -- num_cpu_cores
  , NULL -- physical_memory_gb
  );
BEGIN
  IF p_compress = 'Y' THEN
    SELECT MAX(end_time) - MIN(end_time)
      INTO l_days
      FROM time_series_v
     WHERE plan_id   = p_plan_id
       AND host_name = NVL(p_host_name, host_name)
       AND end_time >= NVL(TRUNC(p_date_from), end_time)
       AND end_time <= NVL(TRUNC(p_date_to) + 1, end_time);

    IF l_days < 416.666 THEN
      l_format_model := 'HH'; -- up to 416.666 * 24 = 10,000 rows
    ELSE
      l_format_model := 'DD'; -- up to 365 rows per year
    END IF;
  ELSE -- no compress
    l_format_model := 'HH'; -- up to 365.25 * 24 = 8,766 rows per year
  END IF;

  FOR i IN (SELECT TRUNC(v.end_time, l_format_model) time,
                   MAX(v.on_cpu)                 on_cpu,
                   MAX(v.resmgr_cpu_quantum)     resmgr_cpu_quantum,
                   MAX(v.on_cpu_99p)             on_cpu_99p,
                   MAX(v.resmgr_cpu_quantum_99p) resmgr_cpu_quantum_99p,
                   MAX(v.on_cpu_97p)             on_cpu_97p,
                   MAX(v.resmgr_cpu_quantum_97p) resmgr_cpu_quantum_97p,
                   MAX(v.on_cpu_95p)             on_cpu_95p,
                   MAX(v.resmgr_cpu_quantum_95p) resmgr_cpu_quantum_95p,
                   MAX(v.on_cpu_90p)             on_cpu_90p,
                   MAX(v.resmgr_cpu_quantum_90p) resmgr_cpu_quantum_90p,
                   MAX(v.on_cpu_75p)             on_cpu_75p,
                   MAX(v.resmgr_cpu_quantum_75p) resmgr_cpu_quantum_75p,
                   MAX(v.on_cpu_med)             on_cpu_med,
                   MAX(v.resmgr_cpu_quantum_med) resmgr_cpu_quantum_med,
                   MAX(v.on_cpu_avg)             on_cpu_avg,
                   MAX(v.resmgr_cpu_quantum_avg) resmgr_cpu_quantum_avg,
                   MAX(v.sga_gb)                 sga_gb,
                   MAX(v.pga_gb)                 pga_gb,
                   MAX(v.r_iops)                 r_iops,
                   MAX(v.w_iops)                 w_iops,
                   MAX(v.r_mbps)                 r_mbps,
                   MAX(v.w_mbps)                 w_mbps,
                   MAX(v.load)               load,
                   MAX(v.num_cpus)           num_cpus,
                   MAX(v.num_cpu_cores)      num_cpu_cores,
                   MAX(v.physical_memory_gb) physical_memory_gb
              FROM
           (SELECT end_time,
                   SUM(on_cpu)                 on_cpu,
                   SUM(resmgr_cpu_quantum)     resmgr_cpu_quantum,
                   SUM(on_cpu_99p)             on_cpu_99p,
                   SUM(resmgr_cpu_quantum_99p) resmgr_cpu_quantum_99p,
                   SUM(on_cpu_97p)             on_cpu_97p,
                   SUM(resmgr_cpu_quantum_97p) resmgr_cpu_quantum_97p,
                   SUM(on_cpu_95p)             on_cpu_95p,
                   SUM(resmgr_cpu_quantum_95p) resmgr_cpu_quantum_95p,
                   SUM(on_cpu_90p)             on_cpu_90p,
                   SUM(resmgr_cpu_quantum_90p) resmgr_cpu_quantum_90p,
                   SUM(on_cpu_75p)             on_cpu_75p,
                   SUM(resmgr_cpu_quantum_75p) resmgr_cpu_quantum_75p,
                   SUM(on_cpu_med)             on_cpu_med,
                   SUM(resmgr_cpu_quantum_med) resmgr_cpu_quantum_med,
                   SUM(on_cpu_avg)             on_cpu_avg,
                   SUM(resmgr_cpu_quantum_avg) resmgr_cpu_quantum_avg,
                   SUM(sga_gb)                 sga_gb,
                   SUM(pga_gb)                 pga_gb,
                   SUM(r_iops)                 r_iops,
                   SUM(w_iops)                 w_iops,
                   SUM(r_mbps)                 r_mbps,
                   SUM(w_mbps)                 w_mbps,
                   SUM(load)                   load,
                   SUM(num_cpus)               num_cpus,
                   SUM(num_cpu_cores)          num_cpu_cores,
                   SUM(physical_memory_gb)     physical_memory_gb
              FROM time_series_v2
             WHERE plan_id   = p_plan_id
               AND host_name = NVL(p_host_name, host_name)
               AND end_time >= NVL(TRUNC(p_date_from), end_time)
               AND end_time <= NVL(TRUNC(p_date_to) + 1, end_time)
             GROUP BY
                   end_time) v
             GROUP BY
                   TRUNC(v.end_time, l_format_model)
             ORDER BY
                   TRUNC(v.end_time, l_format_model))
  LOOP
    r_time_series_type.time                   := i.time              ;
    r_time_series_type.on_cpu                 := i.on_cpu            ;
    r_time_series_type.resmgr_cpu_quantum     := i.resmgr_cpu_quantum;
    r_time_series_type.on_cpu_99p             := i.on_cpu_99p            ;
    r_time_series_type.resmgr_cpu_quantum_99p := i.resmgr_cpu_quantum_99p;
    r_time_series_type.on_cpu_97p             := i.on_cpu_97p            ;
    r_time_series_type.resmgr_cpu_quantum_97p := i.resmgr_cpu_quantum_97p;
    r_time_series_type.on_cpu_95p             := i.on_cpu_95p            ;
    r_time_series_type.resmgr_cpu_quantum_95p := i.resmgr_cpu_quantum_95p;
    r_time_series_type.on_cpu_90p             := i.on_cpu_90p            ;
    r_time_series_type.resmgr_cpu_quantum_90p := i.resmgr_cpu_quantum_90p;
    r_time_series_type.on_cpu_75p             := i.on_cpu_75p            ;
    r_time_series_type.resmgr_cpu_quantum_75p := i.resmgr_cpu_quantum_75p;
    r_time_series_type.on_cpu_med             := i.on_cpu_med            ;
    r_time_series_type.resmgr_cpu_quantum_med := i.resmgr_cpu_quantum_med;
    r_time_series_type.on_cpu_avg             := i.on_cpu_avg            ;
    r_time_series_type.resmgr_cpu_quantum_avg := i.resmgr_cpu_quantum_avg;
    r_time_series_type.sga_gb                 := i.sga_gb            ;
    r_time_series_type.pga_gb                 := i.pga_gb            ;
    r_time_series_type.r_iops                 := i.r_iops            ;
    r_time_series_type.w_iops                 := i.w_iops            ;
    r_time_series_type.r_mbps                 := i.r_mbps            ;
    r_time_series_type.w_mbps                 := i.w_mbps            ;
    r_time_series_type.load                   := i.load              ;
    r_time_series_type.num_cpus               := i.num_cpus          ;
    r_time_series_type.num_cpu_cores          := i.num_cpu_cores     ;
    r_time_series_type.physical_memory_gb     := i.physical_memory_gb;
    PIPE ROW(r_time_series_type);
  END LOOP;
  RETURN;
END os_time_series;

/* ------------------------------------------------------------------------- */

FUNCTION line_chart
( p_plan_id   IN NUMBER
, p_host_name IN VARCHAR2 DEFAULT NULL
, p_db_name   IN VARCHAR2 DEFAULT NULL
, p_date_from IN DATE     DEFAULT NULL
, p_date_to   IN DATE     DEFAULT NULL
, p_type      IN VARCHAR2 DEFAULT 'CPU1' /* CPU1, CPU2, CPU3, MEM, DISK, IOPS, MBPS, OSLOAD, OSCPU, OSMEM */
, p_apex      IN VARCHAR2 DEFAULT 'Y' /* Y, N */
)
RETURN CLOB
IS
  H_SCRIPT_HEAD CONSTANT VARCHAR2(32767) := '<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
  google.load("visualization", "1", {packages:["corechart"]})
  google.setOnLoadCallback(drawChart)

  function drawChart() {
    var data = google.visualization.arrayToDataTable([';

  H_SCRIPT_TAIL CONSTANT VARCHAR2(32767) := '], false);

    var options = { isStacked: true,
    backgroundColor: {fill: "#fcfcf0", stroke: "#336699", strokeWidth: 1},
    explorer: {actions: ["dragToZoom", "rightClickToReset"], maxZoomIn: 0.05},
    title: "TITLE",
    titleTextStyle: {fontSize: 16, bold: false},
    focusTarget: "category",
    legend: {position: "right", textStyle: {fontSize: 12}},
    tooltip: {textStyle: {fontSize: 10}},
    hAxis: {title: "HAXIS", gridlines: {count: -1}},
    vAxis: {title: "VAXIS", gridlines: {count: -1}}
    }

    var chart = new google.visualization.AreaChart(document.getElementById("chart_div_NNNN"))
    chart.draw(data, options)
  }
</script>
';

  l_chart CLOB;
  l_title VARCHAR2(256);
  l_chart_title VARCHAR2(256);
  l_nnnn VARCHAR2(4);
  l_haxis VARCHAR2(256);
  l_vaxis VARCHAR2(256);
  l_abstract VARCHAR2(4000);
  l_column_title VARCHAR2(256);
  l_line VARCHAR2(256);
  l_notes VARCHAR2(4000);
  l_count NUMBER;
  l_cpu_count NUMBER;
  l_cores NUMBER;
  l_cpus NUMBER;
  l_active NUMBER;
  l_os_mem NUMBER;
  l_inst_mem NUMBER;
  l_load NUMBER;
  l_mem_gb NUMBER;
  l_disk_gb NUMBER;
  l_r_iops NUMBER;
  l_w_iops NUMBER;
  l_rw_iops NUMBER;
  l_r_mbps NUMBER;
  l_w_mbps NUMBER;
  l_rw_mbps NUMBER;

  PROCEDURE p (p_text IN VARCHAR2)
  IS
  BEGIN
    DBMS_LOB.WRITEAPPEND(l_chart, LENGTH(p_text||CHR(10)), p_text||CHR(10));
  END p;

  FUNCTION value_or_null (p_value IN NUMBER)
  RETURN VARCHAR2
  IS
  BEGIN
    IF p_value > 0 OR l_count = 1 THEN
      RETURN TO_CHAR(p_value);
    ELSE
      RETURN 'null';
    END IF;
  END value_or_null;

BEGIN
  IF NOT p_apex IN ('Y', 'N') THEN
    RETURN 'invalid p_apex value "'||p_apex||'". expected "Y" or "N".';
  END IF;

  IF NOT UPPER(p_type) IN ('CPU1', 'CPU2', 'CPU3', 'MEM', 'DISK', 'IOPS', 'MBPS', 'OSLOAD', 'OSCPU', 'OSMEM') THEN
    RETURN 'invalid p_type value "'||p_type||'". expected "CPU1" or "CPU2" or "CPU3" or "MEM" or "DISK" or "IOPS" or "MBPS" or "OSLOAD" or "OSCPU" or "OSMEM".';
  END IF;

  IF UPPER(p_type) IN ('OSLOAD', 'OSCPU', 'OSMEM') AND p_db_name IS NOT NULL THEN
    RETURN 'invalid p_db_name value "'||p_db_name||'". expected NULL for p_db_name when p_type is "OSLOAD" or "OSCPU" or "OSMEM".';
  END IF;

  DBMS_LOB.CREATETEMPORARY(l_chart, TRUE, DBMS_LOB.CALL);

  CASE UPPER(p_type)
  WHEN 'CPU1' THEN
    l_title := 'ON CPU Hourly Peak<br>Max Active Sessions ON CPU per Hour';
    l_abstract := 'Number of Active Sessions ON CPU as per Active Session History (ASH).<br>'||CHR(10)||
                  'Computed as the Maximum value (Peak) within each hour of History.';
    l_chart_title := 'ON CPU Hourly Peak';
    l_haxis := 'Active Sessions ON CPU (peak for each hour)';
    l_vaxis := 'Active Sessions ON CPU';
    l_column_title := '["Date", "ON CPU", "resmgr:cpu quantum"]';
  WHEN 'CPU2' THEN
    l_title := 'ON CPU Hourly Percentile<br>Active Sessions ON CPU per Hour';
    l_abstract := 'Number of Active Sessions ON CPU as per Active Session History (ASH).<br>'||CHR(10)||
                  'Computed using several Percentiles (100th, 99th, 97th, 95th, 90th, 75th and 50th) within each hour of History.<br>'||CHR(10)||
                  'Peak (or Max) is 100th Percentiles and Median is 50th Percentile.';
    l_chart_title := 'ON CPU Hourly Percentile';
    l_haxis := 'Active Sessions ON CPU (percentiles for each hour)';
    l_vaxis := 'Active Sessions ON CPU';
    l_column_title := '["Date", "50th Percentile (Median)", "75th Percentile", "90th Percentile", "95th Percentile", "97th Percentile", "99th Percentile", "100th Percentile (Max or Peak)"]';
  WHEN 'CPU3' THEN
    l_title := 'ON CPU plus RESMGR Hourly Percentile<br>Active Sessions ON CPU plus RESMGR per Hour';
    l_abstract := 'Number of Active Sessions ON CPU or Waiting on RESMGR as per Active Session History (ASH).<br>'||CHR(10)||
                  'Computed using several Percentiles (100th, 99th, 97th, 95th, 90th, 75th and 50th) within each hour of History.<br>'||CHR(10)||
                  'Peak (or Max) is 100th Percentiles and Median is 50th Percentile.';
    l_chart_title := 'ON CPU plus RESMGR Hourly Percentile';
    l_haxis := 'Active Sessions ON CPU (percentiles for each hour) including RESMGR';
    l_vaxis := 'Active Sessions ON CPU + RESMGR';
    l_column_title := '["Date", "50th Percentile (Median)", "75th Percentile", "90th Percentile", "95th Percentile", "97th Percentile", "99th Percentile", "100th Percentile (Max or Peak)"]';
  WHEN 'MEM'  THEN
    l_title := 'Memory in GBs - SGA and PGA';
    l_abstract := 'Allocated SGA and PGA for Instance(s).';
    l_chart_title := 'Memory in GBs';
    l_haxis := 'SGA and PGA on GBs';
    l_vaxis := 'GBs';
    l_column_title := '["Date", "SGA", "PGA"]';
  WHEN 'DISK' THEN
    l_title := 'Disk Space in GBs';
    l_abstract := 'Database Disk Space in GBs as per Tablespaces size.';
    l_chart_title := 'Disk Space in GBs';
    l_haxis := 'Disk Space in GBs';
    l_vaxis := 'GBs';
    l_column_title := '["Date", "Permanent", "Undo", "Temporary"]';
  WHEN 'IOPS' THEN
    l_title := 'I/O Operations per Second (IOPS)';
    l_abstract := '';
    l_chart_title := 'IOPS';
    l_haxis := 'I/O Operations per Second (IOPS)';
    l_vaxis := 'IOPS';
    l_column_title := '["Date", "R-IOPS", "W-IOPS"]';
  WHEN 'MBPS' THEN
    l_title := 'I/O Mega Bytes per Second (MBPS)';
    l_abstract := '';
    l_chart_title := 'I/O MBPS';
    l_haxis := 'I/O Mega Bytes per Second (MBPS)';
    l_vaxis := 'MBPS';
    l_column_title := '["Date", "R-MBPS", "W-MBPS"]';
  WHEN 'OSLOAD' THEN
    l_title := 'Operating System (OS) Load and Number of CPU Cores';
    l_abstract := 'OS Load should remain below 70% of OS Number of Cores in order to avoid CPU contention risk (starvation).';
    l_chart_title := 'OS Load and Cores';
    l_haxis := 'OS Load and CPU Cores';
    l_vaxis := 'OS Load and CPU Cores';
    l_column_title := '["Date", "OS Load", "OS Number of Cores headroom"]';
  WHEN 'OSCPU' THEN
    l_title := 'Operating System (OS) Number of CPUs and Active Sessions ON CPU';
    l_abstract := 'Active Sessions ON CPU should remain below 70% of OS Number of CPUs in order to avoid CPU contention risk (starvation).';
    l_chart_title := 'OS Number of CPUs and Active Sessions ON CPU';
    l_haxis := 'Active Sessions ON CPU and OS Number of CPUs';
    l_vaxis := 'Active Sessions ON CPU and OS Number of CPUs';
    l_column_title := '["Date", "Active Sessions ON CPU", "OS Number of CPUs headroom"]';
  WHEN 'OSMEM' THEN
    l_title := 'Operating System (OS) Memory and (SGA + PGA) Memory';
    l_abstract := 'SGA + PGA Memory should remain below 80% of OS Memory in order to avoid Memory contention risk (paging).';
    l_chart_title := 'OS Memory and (SGA + PGA) Memory in GBs';
    l_haxis := 'OS Memory and (SGA + PGA) Memory';
    l_vaxis := 'Memory in GBs';
    l_column_title := '["Date", "SGA + PGA Memory", "OS Memory headroom"]';
  END CASE;

  IF p_host_name IS NULL AND p_db_name IS NULL THEN
    IF UPPER(p_type) IN ('CPU1', 'CPU2', 'CPU3', 'MEM', 'DISK', 'IOPS', 'MBPS') THEN
      l_title := l_title||' from all Hosts/Databases for Plan '||p_plan_id;
      l_haxis := l_haxis||' from all Hosts/Databases for Plan '||p_plan_id;
    ELSIF UPPER(p_type) IN ('OSLOAD', 'OSCPU', 'OSMEM') THEN
      l_title := l_title||' from all Hosts for Plan '||p_plan_id;
      l_haxis := l_haxis||' from all Hosts for Plan '||p_plan_id;
    END IF;
  ELSIF p_host_name IS NOT NULL AND p_db_name IS NOT NULL THEN
    l_title := l_title||' from Database '||p_db_name||' and Host '||p_host_name||' for Plan '||p_plan_id;
    l_haxis := l_haxis||' from Database '||p_db_name||' and Host '||p_host_name||' for Plan '||p_plan_id;
  ELSIF p_host_name IS NOT NULL THEN
    IF UPPER(p_type) IN ('CPU1', 'CPU2', 'CPU3', 'MEM', 'DISK', 'IOPS', 'MBPS') THEN
      l_title := l_title||' from all Databases on Host '||p_host_name||' for Plan '||p_plan_id;
      l_haxis := l_haxis||' from all Databases on Host '||p_host_name||' for Plan '||p_plan_id;
    ELSIF UPPER(p_type) IN ('OSLOAD', 'OSCPU', 'OSMEM') THEN
      l_title := l_title||' from Host '||p_host_name||' for Plan '||p_plan_id;
      l_haxis := l_haxis||' from Host '||p_host_name||' for Plan '||p_plan_id;
    END IF;
  ELSIF p_db_name IS NOT NULL THEN
    l_title := l_title||' from all Instances of Database '||p_db_name||' for Plan '||p_plan_id;
    l_haxis := l_haxis||' from all Instances of Database '||p_db_name||' for Plan '||p_plan_id;
  END IF;
  SELECT LPAD(SUBSTR(MOD(ORA_HASH(l_title), 1e4), 1, 4), 4, '0') INTO l_nnnn FROM DUAL;

  BEGIN
    IF p_apex = 'N' THEN
      p(REPLACE(REPLACE(H_HEAD, 'SYSDATE', TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS')), 'TITLE', REPLACE(l_title, '<br>', ' - ')));
    END IF;
    p(H_CSS);
    p(H_SCRIPT_HEAD);
    p(l_column_title);
  END;

  IF UPPER(p_type) IN ('CPU1', 'CPU2', 'CPU3', 'MEM', 'DISK', 'IOPS', 'MBPS') THEN
    l_count := 0;
    FOR i IN (SELECT * FROM TABLE(esp_util.time_series(p_plan_id => p_plan_id, p_host_name => p_host_name, p_db_name => p_db_name, p_date_from => p_date_from, p_date_to => p_date_to)))
    LOOP
      l_count := l_count + 1;
      l_cpu_count := GREATEST(NVL(l_cpu_count, 0), NVL(i.cpu_count, 0));
      l_mem_gb := GREATEST(NVL(l_mem_gb, 0), NVL(i.sga_gb, 0) + NVL(i.pga_gb, 0));
      l_disk_gb := GREATEST(NVL(l_disk_gb, 0), NVL(i.perm_gb, 0) + NVL(i.undo_gb, 0) + NVL(i.temp_gb, 0));
      l_r_iops := GREATEST(NVL(l_r_iops, 0), NVL(i.r_iops, 0));
      l_w_iops := GREATEST(NVL(l_w_iops, 0), NVL(i.w_iops, 0));
      l_rw_iops := GREATEST(NVL(l_rw_iops, 0), NVL(i.r_iops, 0) + NVL(i.w_iops, 0));
      l_r_mbps := GREATEST(NVL(l_r_mbps, 0), NVL(i.r_mbps, 0));
      l_w_mbps := GREATEST(NVL(l_w_mbps, 0), NVL(i.w_mbps, 0));
      l_rw_mbps := GREATEST(NVL(l_rw_mbps, 0), NVL(i.r_mbps, 0) + NVL(i.w_mbps, 0));

      l_line := ', [new Date('||
      TO_CHAR(i.time, 'YYYY')||','||
      (TO_NUMBER(TO_CHAR(i.time, 'MM')) - 1)||','||
      TO_CHAR(i.time, 'DD')||','||
      TO_CHAR(i.time, 'HH24')||','||
      TO_CHAR(i.time, 'MI')||','||
      TO_CHAR(i.time, 'SS')||'),';

      CASE UPPER(p_type)
      WHEN 'CPU1' THEN
        IF i.on_cpu > 0 THEN
          l_line := l_line||
          TO_CHAR(i.on_cpu)||','||
          value_or_null(i.resmgr_cpu_quantum)||']';
          p(l_line);
        END IF;
      WHEN 'CPU2' THEN
        IF i.on_cpu > 0 THEN
          l_line := l_line||
          TO_CHAR(i.on_cpu_med)||','||
          TO_CHAR(i.on_cpu_75p - i.on_cpu_med)||','||
          TO_CHAR(i.on_cpu_90p - i.on_cpu_75p)||','||
          TO_CHAR(i.on_cpu_95p - i.on_cpu_90p)||','||
          TO_CHAR(i.on_cpu_97p - i.on_cpu_95p)||','||
          TO_CHAR(i.on_cpu_99p - i.on_cpu_97p)||','||
          TO_CHAR(i.on_cpu - i.on_cpu_99p)||']';
          p(l_line);
        END IF;
      WHEN 'CPU3' THEN
        IF i.on_cpu > 0 THEN
          l_line := l_line||
          TO_CHAR(i.on_cpu_med + i.resmgr_cpu_quantum_med)||','||
          TO_CHAR(i.on_cpu_75p + i.resmgr_cpu_quantum_75p - i.on_cpu_med - i.resmgr_cpu_quantum_med)||','||
          TO_CHAR(i.on_cpu_90p + i.resmgr_cpu_quantum_90p - i.on_cpu_75p - i.resmgr_cpu_quantum_75p)||','||
          TO_CHAR(i.on_cpu_95p + i.resmgr_cpu_quantum_95p - i.on_cpu_90p - i.resmgr_cpu_quantum_90p)||','||
          TO_CHAR(i.on_cpu_97p + i.resmgr_cpu_quantum_97p - i.on_cpu_95p - i.resmgr_cpu_quantum_95p)||','||
          TO_CHAR(i.on_cpu_99p + i.resmgr_cpu_quantum_99p - i.on_cpu_97p - i.resmgr_cpu_quantum_97p)||','||
          TO_CHAR(i.on_cpu + i.resmgr_cpu_quantum - i.on_cpu_99p - i.resmgr_cpu_quantum_99p)||']';
          p(l_line);
        END IF;
      WHEN 'MEM' THEN
        IF i.sga_gb > 0 THEN
          l_line := l_line||
          TO_CHAR(i.sga_gb)||','||
          TO_CHAR(i.pga_gb)||']';
          p(l_line);
        END IF;
      WHEN 'DISK' THEN
        IF i.perm_gb > 0 THEN
          l_line := l_line||
          TO_CHAR(i.perm_gb)||','||
          TO_CHAR(i.undo_gb)||','||
          TO_CHAR(i.temp_gb)||']';
          p(l_line);
        END IF;
      WHEN 'IOPS' THEN
        IF i.r_iops > 0 THEN
          l_line := l_line||
          TO_CHAR(i.r_iops)||','||
          TO_CHAR(i.w_iops)||']';
          p(l_line);
        END IF;
      WHEN 'MBPS' THEN
        IF i.r_mbps > 0 THEN
          l_line := l_line||
          TO_CHAR(i.r_mbps)||','||
          TO_CHAR(i.w_mbps)||']';
          p(l_line);
        END IF;
      END CASE;
    END LOOP;
  END IF;

  IF UPPER(p_type) IN ('OSLOAD', 'OSCPU', 'OSMEM') THEN
    FOR i IN (SELECT * FROM TABLE(esp_util.os_time_series(p_plan_id => p_plan_id, p_host_name => p_host_name, p_date_from => p_date_from, p_date_to => p_date_to)))
    LOOP
      l_load := GREATEST(NVL(l_load, 0), NVL(i.load, 0));
      l_cores := GREATEST(NVL(l_cores, 0), NVL(i.num_cpu_cores, 0));
      l_cpus := GREATEST(NVL(l_cpus, 0), NVL(i.num_cpus, 0));
      l_active := GREATEST(NVL(l_active, 0), NVL(i.on_cpu, 0));
      l_os_mem := GREATEST(NVL(l_os_mem, 0), NVL(i.physical_memory_gb, 0));
      l_inst_mem := GREATEST(NVL(l_inst_mem, 0), NVL(i.sga_gb, 0) + NVL(i.pga_gb, 0));

      l_line := ', [new Date('||
      TO_CHAR(i.time, 'YYYY')||','||
      (TO_NUMBER(TO_CHAR(i.time, 'MM')) - 1)||','||
      TO_CHAR(i.time, 'DD')||','||
      TO_CHAR(i.time, 'HH24')||','||
      TO_CHAR(i.time, 'MI')||','||
      TO_CHAR(i.time, 'SS')||'),';

      CASE UPPER(p_type)
      WHEN 'OSLOAD' THEN
        IF i.load > 0 AND i.num_cpu_cores > 0 THEN
          l_line := l_line||
          TO_CHAR(i.load)||','||
          value_or_null(i.num_cpu_cores - i.load)||']';
          p(l_line);
        END IF;
      WHEN 'OSCPU' THEN
        IF i.on_cpu > 0 AND i.num_cpus > 0 THEN
          l_line := l_line||
          TO_CHAR(i.on_cpu)||','||
          value_or_null(i.num_cpus - i.on_cpu)||']';
          p(l_line);
        END IF;
      WHEN 'OSMEM' THEN
        IF i.sga_gb > 0 AND i.physical_memory_gb > 0 THEN
          l_line := l_line||
          TO_CHAR(i.sga_gb + i.pga_gb)||','||
          value_or_null(i.physical_memory_gb - i.sga_gb - i.pga_gb)||']';
          p(l_line);
        END IF;
      END CASE;
    END LOOP;
  END IF;

  l_notes := '<br>1) drag to zoom, and right click to reset.<br>'||CHR(10);
  CASE UPPER(p_type)
  WHEN 'CPU1' THEN
    l_notes := l_notes||'2) sum cpu_count: '||l_cpu_count||' (be aware of possible over-subscription).<br>'||CHR(10);
  WHEN 'CPU2' THEN
    l_notes := l_notes||'2) sum cpu_count: '||l_cpu_count||' (be aware of possible over-subscription).<br>'||CHR(10);
  WHEN 'CPU3' THEN
    l_notes := l_notes||'2) sum cpu_count: '||l_cpu_count||' (be aware of possible over-subscription).<br>'||CHR(10);
  WHEN 'MEM'  THEN
    l_notes := l_notes||'2) max memory in GB: '||ROUND(l_mem_gb, 1)||'.<br>'||CHR(10);
  WHEN 'DISK' THEN
    l_notes := l_notes||'2) max disk space in GB: '||ROUND(l_disk_gb, 1)||'.<br>'||CHR(10);
  WHEN 'IOPS' THEN
    l_notes := l_notes||'2) max r-iops: '||l_r_iops||', max w-iops: '||l_w_iops||', max rw-iops: '||l_rw_iops||'.<br>'||CHR(10);
  WHEN 'MBPS' THEN
    l_notes := l_notes||'2) max r-mbps: '||ROUND(l_r_mbps)||', max w-mbps: '||ROUND(l_w_mbps)||', max rw-mbps: '||ROUND(l_rw_mbps)||'.<br>'||CHR(10);
  WHEN 'OSLOAD' THEN
    l_notes := l_notes||'2) max load: '||l_load||', max num_cpu_cores: '||l_cores||'.<br>'||CHR(10);
  WHEN 'OSCPU' THEN
    l_notes := l_notes||'2) max active sessions ON CPU: '||l_active||', max num_cpus: '||l_cpus||'.<br>'||CHR(10);
  WHEN 'OSMEM' THEN
    l_notes := l_notes||'2) max (sga + pga) in GBs: '||ROUND(l_inst_mem, 1)||', max os memory in GBs: '||ROUND(l_os_mem, 1)||'.<br>'||CHR(10);
  END CASE;

  BEGIN
    p(REPLACE(REPLACE(REPLACE(REPLACE(H_SCRIPT_TAIL, 'TITLE', l_chart_title), 'NNNN', l_nnnn), 'HAXIS', l_haxis), 'VAXIS', l_vaxis));
    IF p_apex = 'N' THEN
      p(REPLACE(H_BODY_H1, 'TITLE', l_title));
    END IF;
    p(REPLACE(REPLACE(REPLACE(H_BODY, 'ABSTRACT', l_abstract), 'NNNN', l_nnnn), 'NOTES', l_notes));
    IF p_apex = 'N' THEN
      p(REPLACE(H_TAIL, 'SYSDATE', TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS')));
    END IF;
  END;

  RETURN l_chart;
END line_chart;

/* ------------------------------------------------------------------------- */

FUNCTION bar_chart
( p_plan_id   IN NUMBER
, p_host_name IN VARCHAR2 DEFAULT NULL
, p_db_name   IN VARCHAR2 DEFAULT NULL /* not used, needed by esp360_9h_clob_chart.sql */
, p_type      IN VARCHAR2 DEFAULT 'CPU' /* CPU, IOPS, MBPS */
, p_apex      IN VARCHAR2 DEFAULT 'Y' /* Y, N */
)
RETURN CLOB
IS
  H_SCRIPT_HEAD CONSTANT VARCHAR2(32767) := '<script type="text/javascript" src="https://www.google.com/jsapi"></script>
  <script type="text/javascript">
    google.load("visualization", "1", {packages:["corechart"]});
    google.setOnLoadCallback(drawVisualization);

  function drawVisualization() {
    var data = google.visualization.arrayToDataTable([';

  H_SCRIPT_TAIL CONSTANT VARCHAR2(32767) := '  ]);

    var options = {
    backgroundColor: {fill: "#fcfcf0", stroke: "#336699", strokeWidth: 1},
    title : "TITLE",
    vAxis: {title: "VAXIS"},
    hAxis: {title: "HAXIS"},
    seriesType: "bars"SERIES
    };

    var chart = new google.visualization.ComboChart(document.getElementById("chart_div_NNNN"));
    chart.draw(data, options);
  }
</script>
';

  l_plan plan_v%ROWTYPE;
  l_host_req host_per_plan_v2%ROWTYPE;
  l_plan_req plan_requirements_v2%ROWTYPE;
  l_chart CLOB;
  l_title VARCHAR2(256);
  l_chart_title VARCHAR2(256);
  l_nnnn VARCHAR2(4);
  l_haxis VARCHAR2(256);
  l_vaxis VARCHAR2(256);
  l_abstract VARCHAR2(4000);
  l_series VARCHAR2(4000);
  l_notes VARCHAR2(4000);
  l_tail  VARCHAR2(4000);

  PROCEDURE p (p_text IN VARCHAR2)
  IS
  BEGIN
    DBMS_LOB.WRITEAPPEND(l_chart, LENGTH(p_text||CHR(10)), p_text||CHR(10));
  END p;

BEGIN
  IF NOT p_apex IN ('Y', 'N') THEN
    RETURN 'invalid p_apex value "'||p_apex||'". expected "Y" or "N".';
  END IF;

  IF NOT UPPER(p_type) IN ('CPU', 'IOPS', 'MBPS') THEN
    RETURN 'invalid p_type value "'||p_type||'". expected "CPU" or "IOPS" or "MBPS".';
  END IF;

  SELECT * INTO l_plan FROM plan_v WHERE plan_id = p_plan_id;

  IF p_host_name IS NOT NULL THEN
    SELECT * INTO l_host_req FROM host_per_plan_v2 WHERE plan_id = p_plan_id AND host_name = p_host_name;
  ELSE
    SELECT * INTO l_plan_req FROM plan_requirements_v2 WHERE plan_id = p_plan_id;
  END IF;

  DBMS_LOB.CREATETEMPORARY(l_chart, TRUE, DBMS_LOB.CALL);

  IF UPPER(p_type) = 'CPU' AND p_host_name IS NOT NULL THEN
    l_title := 'CPU Requirements from Host '||p_host_name;
    SELECT LPAD(SUBSTR(MOD(ORA_HASH(l_title), 1e4), 1, 4), 4, '0') INTO l_nnnn FROM DUAL;
    l_abstract := 'CPU Requirements as per Plan Attributes below:'||CHR(10)||'<ol>'||CHR(10)||
                  '<li>CPU Method: '||l_plan.cpu_method_desc||'</li>'||CHR(10)||
                  '<li>Metric used: '||l_plan.cpu_statistic_desc||'</li>'||CHR(10)||
                  '<li>Include RESMGR CPU quantum?: '||l_plan.incl_resmgr_cpu_quantum_desc||'</li>'||CHR(10)||
                  '<li>Cap CPU demand to Instance CPU count?: '||l_plan.cap_to_num_cpus_desc||'</li>'||CHR(10)||'</ol>';
    l_notes := '<br>1) EH: Entire History. HS: Hourly Statistics. MAN: Manual Entry. REQ: CPUs Required as per Plan Attributes.'||CHR(10)||
               '<br>2) CPU Count Sum: '||l_host_req.inst_cpu_count_sum||CHR(10)||
               '<br>3) CPU Count Max: '||l_host_req.inst_cpu_count_max||CHR(10)||
               '<br>4) Num of CPUs: '||l_host_req.host_num_cpus||CHR(10)||
               '<br>5) Num of CPU Cores: '||l_host_req.host_num_cpu_cores||CHR(10)||
               '<br>6) Host Load: '||l_host_req.host_load||CHR(10)||
               '<br>';
    l_chart_title := 'CPU Requirements from Host '||p_host_name;
    l_vaxis := 'Active Sessions';
    l_haxis := 'CPU Metric';
    l_series := ','||CHR(10)||'    series: {2: {type: "line"}, 3: {type: "line"}, 4: {type: "line"}, 5: {type: "line"}, 6: {type: "line"}}';
    IF p_apex = 'N' THEN
      p(REPLACE(REPLACE(H_HEAD, 'SYSDATE', TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS')), 'TITLE', REPLACE(l_title, '<br>', ' - ')));
    END IF;

    p(H_CSS);
    p(H_SCRIPT_HEAD);
    p('     ["Metric", "CPU+RESMGR", "CPU", "CPU CNT SUM", "CPU CNT MAX", "Num CPUs", "Num Cores", "Load"]');

    l_tail := ', '||l_host_req.inst_cpu_count_sum||', '||l_host_req.inst_cpu_count_max||', '||l_host_req.host_num_cpus||', '||l_host_req.host_num_cpu_cores||', '||l_host_req.host_load||']';

    p('    ,["EH Peak", '||l_host_req.eh_cpu_and_resmgr_max||', '||l_host_req.eh_cpu_max||l_tail);
    p('    ,["EH 99.99th", '||l_host_req.eh_cpu_and_resmgr_9999p||', '||l_host_req.eh_cpu_9999p||l_tail);
    p('    ,["EH 99.9th", '||l_host_req.eh_cpu_and_resmgr_999p||', '||l_host_req.eh_cpu_999p||l_tail);
    p('    ,["EH 99th", '||l_host_req.eh_cpu_and_resmgr_99p||', '||l_host_req.eh_cpu_99p||l_tail);
    p('    ,["EH 97th", '||l_host_req.eh_cpu_and_resmgr_97p||', '||l_host_req.eh_cpu_97p||l_tail);
    p('    ,["EH 95th", '||l_host_req.eh_cpu_and_resmgr_95p||', '||l_host_req.eh_cpu_95p||l_tail);
    p('    ,["EH 90th", '||l_host_req.eh_cpu_and_resmgr_90p||', '||l_host_req.eh_cpu_90p||l_tail);
    p('    ,["EH 75th", '||l_host_req.eh_cpu_and_resmgr_75p||', '||l_host_req.eh_cpu_75p||l_tail);
    p('    ,["EH Med", '||l_host_req.eh_cpu_and_resmgr_med||', '||l_host_req.eh_cpu_med||l_tail);
    p('    ,["EH Avg", '||l_host_req.eh_cpu_and_resmgr_avg||', '||l_host_req.eh_cpu_avg||l_tail);

    p('    ,["HS Peak", '||l_host_req.hs_cpu_and_resmgr_max||', '||l_host_req.hs_cpu_max||l_tail);
    p('    ,["HS 99th", '||l_host_req.hs_cpu_and_resmgr_99p||', '||l_host_req.hs_cpu_99p||l_tail);
    p('    ,["HS 97th", '||l_host_req.hs_cpu_and_resmgr_97p||', '||l_host_req.hs_cpu_97p||l_tail);
    p('    ,["HS 95th", '||l_host_req.hs_cpu_and_resmgr_95p||', '||l_host_req.hs_cpu_95p||l_tail);
    p('    ,["HS 90th", '||l_host_req.hs_cpu_and_resmgr_90p||', '||l_host_req.hs_cpu_90p||l_tail);
    p('    ,["HS 75th", '||l_host_req.hs_cpu_and_resmgr_75p||', '||l_host_req.hs_cpu_75p||l_tail);
    p('    ,["HS Med", '||l_host_req.hs_cpu_and_resmgr_med||', '||l_host_req.hs_cpu_med||l_tail);
    p('    ,["HS Avg", '||l_host_req.hs_cpu_and_resmgr_avg||', '||l_host_req.hs_cpu_avg||l_tail);

    p('    ,["MAN", '||l_host_req.cpus_manual_entry||', 0'||l_tail);
    p('    ,["REQ", '||l_host_req.cpus_required||', 0'||l_tail);

    p(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(H_SCRIPT_TAIL, 'TITLE', l_chart_title), 'NNNN', l_nnnn), 'HAXIS', l_haxis), 'VAXIS', l_vaxis), 'SERIES', l_series));
    IF p_apex = 'N' THEN
      p(REPLACE(H_BODY_H1, 'TITLE', l_title));
    END IF;
    p(REPLACE(REPLACE(REPLACE(H_BODY, 'ABSTRACT', l_abstract), 'NNNN', l_nnnn), 'NOTES', l_notes));
    IF p_apex = 'N' THEN
      p(REPLACE(H_TAIL, 'SYSDATE', TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS')));
    END IF;
  ELSIF UPPER(p_type) = 'IOPS' AND p_host_name IS NOT NULL THEN
    l_title := 'IOPS Requirements from Host '||p_host_name;
    SELECT LPAD(SUBSTR(MOD(ORA_HASH(l_title), 1e4), 1, 4), 4, '0') INTO l_nnnn FROM DUAL;
    l_abstract := 'IOPS Requirements as per Plan Attributes below:'||CHR(10)||'<ol>'||CHR(10)||
                  '<li>Disk Performance Method: '||l_plan.disk_performance_method_desc||'</li>'||CHR(10)||
                  '<li>Metric used: '||l_plan.disk_perf_statistic_desc||'</li>'||CHR(10)||'</ol>';
    l_notes := '<br>1) IH: Instance History. DH: Database History. MAN: Manual Entry. REQ: IOPS Required as per Plan Attributes.'||CHR(10)||
               '<br>';
    l_chart_title := 'IOPS Requirements from Host '||p_host_name;
    l_vaxis := 'IOPS';
    l_haxis := 'IOPS Metric';
    l_series := NULL;
    IF p_apex = 'N' THEN
      p(REPLACE(REPLACE(H_HEAD, 'SYSDATE', TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS')), 'TITLE', REPLACE(l_title, '<br>', ' - ')));
    END IF;

    p(H_CSS);
    p(H_SCRIPT_HEAD);
    p('     ["Metric", "RW-IOPS", "R-IOPS", "W-IOPS"]');

    l_tail := NULL;

    p('    ,["IH Peak", '||l_host_req.ih_rw_iops_peak||', '||l_host_req.ih_r_iops_peak||', '||l_host_req.ih_w_iops_peak||']');
    p('    ,["IH 99.9th", '||l_host_req.ih_rw_iops_999||', '||l_host_req.ih_r_iops_999||', '||l_host_req.ih_w_iops_999||']');
    p('    ,["IH 99th", '||l_host_req.ih_rw_iops_99||', '||l_host_req.ih_r_iops_99||', '||l_host_req.ih_w_iops_99||']');
    p('    ,["IH 97th", '||l_host_req.ih_rw_iops_97||', '||l_host_req.ih_r_iops_97||', '||l_host_req.ih_w_iops_97||']');
    p('    ,["IH 95th", '||l_host_req.ih_rw_iops_95||', '||l_host_req.ih_r_iops_95||', '||l_host_req.ih_w_iops_95||']');
    p('    ,["IH 90th", '||l_host_req.ih_rw_iops_90||', '||l_host_req.ih_r_iops_90||', '||l_host_req.ih_w_iops_90||']');
    p('    ,["IH 75th", '||l_host_req.ih_rw_iops_75||', '||l_host_req.ih_r_iops_75||', '||l_host_req.ih_w_iops_75||']');
    p('    ,["IH Med", '||l_host_req.ih_rw_iops_median||', '||l_host_req.ih_r_iops_median||', '||l_host_req.ih_w_iops_median||']');
    p('    ,["IH Avg", '||l_host_req.ih_rw_iops_avg||', '||l_host_req.ih_r_iops_avg||', '||l_host_req.ih_w_iops_avg||']');

    p('    ,["MAN", '||l_host_req.rw_iops_man||', '||l_host_req.r_iops_man||', '||l_host_req.w_iops_man||']');
    p('    ,["REQ", '||l_host_req.rw_iops_required||', '||l_host_req.r_iops_required||', '||l_host_req.w_iops_required||']');

    p(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(H_SCRIPT_TAIL, 'TITLE', l_chart_title), 'NNNN', l_nnnn), 'HAXIS', l_haxis), 'VAXIS', l_vaxis), 'SERIES', l_series));
    IF p_apex = 'N' THEN
      p(REPLACE(H_BODY_H1, 'TITLE', l_title));
    END IF;
    p(REPLACE(REPLACE(REPLACE(H_BODY, 'ABSTRACT', l_abstract), 'NNNN', l_nnnn), 'NOTES', l_notes));
    IF p_apex = 'N' THEN
      p(REPLACE(H_TAIL, 'SYSDATE', TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS')));
    END IF;
  ELSIF UPPER(p_type) = 'MBPS' AND p_host_name IS NOT NULL THEN
    l_title := 'MBPS Requirements from Host '||p_host_name;
    SELECT LPAD(SUBSTR(MOD(ORA_HASH(l_title), 1e4), 1, 4), 4, '0') INTO l_nnnn FROM DUAL;
    l_abstract := 'MBPS Requirements as per Plan Attributes below:'||CHR(10)||'<ol>'||CHR(10)||
                  '<li>Disk Performance Method: '||l_plan.disk_performance_method_desc||'</li>'||CHR(10)||
                  '<li>Metric used: '||l_plan.disk_perf_statistic_desc||'</li>'||CHR(10)||'</ol>';
    l_notes := '<br>1) IH: Instance History. DH: Database History. MAN: Manual Entry. REQ: MBPS Required as per Plan Attributes.'||CHR(10)||
               '<br>';
    l_chart_title := 'MBPS Requirements from Host '||p_host_name;
    l_vaxis := 'MBPS';
    l_haxis := 'MBPS Metric';
    l_series := NULL;
    IF p_apex = 'N' THEN
      p(REPLACE(REPLACE(H_HEAD, 'SYSDATE', TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS')), 'TITLE', REPLACE(l_title, '<br>', ' - ')));
    END IF;

    p(H_CSS);
    p(H_SCRIPT_HEAD);
    p('     ["Metric", "RW-MBPS", "R-MBPS", "W-MBPS"]');

    l_tail := NULL;

    p('    ,["IH Peak", '||l_host_req.ih_rw_mbps_peak||', '||l_host_req.ih_r_mbps_peak||', '||l_host_req.ih_w_mbps_peak||']');
    p('    ,["IH 99.9th", '||l_host_req.ih_rw_mbps_999||', '||l_host_req.ih_r_mbps_999||', '||l_host_req.ih_w_mbps_999||']');
    p('    ,["IH 99th", '||l_host_req.ih_rw_mbps_99||', '||l_host_req.ih_r_mbps_99||', '||l_host_req.ih_w_mbps_99||']');
    p('    ,["IH 97th", '||l_host_req.ih_rw_mbps_97||', '||l_host_req.ih_r_mbps_97||', '||l_host_req.ih_w_mbps_97||']');
    p('    ,["IH 95th", '||l_host_req.ih_rw_mbps_95||', '||l_host_req.ih_r_mbps_95||', '||l_host_req.ih_w_mbps_95||']');
    p('    ,["IH 90th", '||l_host_req.ih_rw_mbps_90||', '||l_host_req.ih_r_mbps_90||', '||l_host_req.ih_w_mbps_90||']');
    p('    ,["IH 75th", '||l_host_req.ih_rw_mbps_75||', '||l_host_req.ih_r_mbps_75||', '||l_host_req.ih_w_mbps_75||']');
    p('    ,["IH Med", '||l_host_req.ih_rw_mbps_median||', '||l_host_req.ih_r_mbps_median||', '||l_host_req.ih_w_mbps_median||']');
    p('    ,["IH Avg", '||l_host_req.ih_rw_mbps_avg||', '||l_host_req.ih_r_mbps_avg||', '||l_host_req.ih_w_mbps_avg||']');

    p('    ,["MAN", '||l_host_req.rw_mbps_man||', '||l_host_req.r_mbps_man||', '||l_host_req.w_mbps_man||']');
    p('    ,["REQ", '||l_host_req.rw_mbps_required||', '||l_host_req.r_mbps_required||', '||l_host_req.w_mbps_required||']');

    p(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(H_SCRIPT_TAIL, 'TITLE', l_chart_title), 'NNNN', l_nnnn), 'HAXIS', l_haxis), 'VAXIS', l_vaxis), 'SERIES', l_series));
    IF p_apex = 'N' THEN
      p(REPLACE(H_BODY_H1, 'TITLE', l_title));
    END IF;
    p(REPLACE(REPLACE(REPLACE(H_BODY, 'ABSTRACT', l_abstract), 'NNNN', l_nnnn), 'NOTES', l_notes));
    IF p_apex = 'N' THEN
      p(REPLACE(H_TAIL, 'SYSDATE', TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS')));
    END IF;
  ELSIF UPPER(p_type) = 'CPU' AND p_host_name IS NULL THEN
    l_title := 'CPU Requirements for Plan '||l_plan.plan_name;
    SELECT LPAD(SUBSTR(MOD(ORA_HASH(l_title), 1e4), 1, 4), 4, '0') INTO l_nnnn FROM DUAL;
    l_abstract := 'CPU Requirements as per Plan Attributes below:'||CHR(10)||'<ol>'||CHR(10)||
                  '<li>CPU Method: '||l_plan.cpu_method_desc||'</li>'||CHR(10)||
                  '<li>Metric used: '||l_plan.cpu_statistic_desc||'</li>'||CHR(10)||
                  '<li>Include RESMGR CPU quantum?: '||l_plan.incl_resmgr_cpu_quantum_desc||'</li>'||CHR(10)||
                  '<li>Cap CPU demand to Instance CPU count?: '||l_plan.cap_to_num_cpus_desc||'</li>'||CHR(10)||'</ol>';
    l_notes := '<br>1) EH: Entire History. HS: Hourly Statistics. MAN: Manual Entry. REQ: CPUs Required as per Plan Attributes.'||CHR(10)||
               '<br>2) CPU Count Sum: '||l_plan_req.inst_cpu_count_sum||CHR(10)||
               '<br>3) CPU Count Max: '||l_plan_req.inst_cpu_count_max||CHR(10)||
               '<br>4) Num of CPUs: '||l_plan_req.host_num_cpus||CHR(10)||
               '<br>5) Num of CPU Cores: '||l_plan_req.host_num_cpu_cores||CHR(10)||
               '<br>6) Host Load: '||l_plan_req.host_load||CHR(10)||
               '<br>';
    l_chart_title := 'CPU Requirements for Plan '||l_plan.plan_name;
    l_vaxis := 'Active Sessions';
    l_haxis := 'CPU Metric';
    l_series := ','||CHR(10)||'    series: {2: {type: "line"}, 3: {type: "line"}, 4: {type: "line"}, 5: {type: "line"}, 6: {type: "line"}}';
    IF p_apex = 'N' THEN
      p(REPLACE(REPLACE(H_HEAD, 'SYSDATE', TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS')), 'TITLE', REPLACE(l_title, '<br>', ' - ')));
    END IF;

    p(H_CSS);
    p(H_SCRIPT_HEAD);
    p('     ["Metric", "CPU+RESMGR", "CPU", "CPU CNT SUM", "CPU CNT MAX", "Num CPUs", "Num Cores", "Load"]');

    l_tail := ', '||l_plan_req.inst_cpu_count_sum||', '||l_plan_req.inst_cpu_count_max||', '||l_plan_req.host_num_cpus||', '||l_plan_req.host_num_cpu_cores||', '||l_plan_req.host_load||']';

    p('    ,["EH Peak", '||l_plan_req.eh_cpu_and_resmgr_max||', '||l_plan_req.eh_cpu_max||l_tail);
    p('    ,["EH 99.99th", '||l_plan_req.eh_cpu_and_resmgr_9999p||', '||l_plan_req.eh_cpu_9999p||l_tail);
    p('    ,["EH 99.9th", '||l_plan_req.eh_cpu_and_resmgr_999p||', '||l_plan_req.eh_cpu_999p||l_tail);
    p('    ,["EH 99th", '||l_plan_req.eh_cpu_and_resmgr_99p||', '||l_plan_req.eh_cpu_99p||l_tail);
    p('    ,["EH 97th", '||l_plan_req.eh_cpu_and_resmgr_97p||', '||l_plan_req.eh_cpu_97p||l_tail);
    p('    ,["EH 95th", '||l_plan_req.eh_cpu_and_resmgr_95p||', '||l_plan_req.eh_cpu_95p||l_tail);
    p('    ,["EH 90th", '||l_plan_req.eh_cpu_and_resmgr_90p||', '||l_plan_req.eh_cpu_90p||l_tail);
    p('    ,["EH 75th", '||l_plan_req.eh_cpu_and_resmgr_75p||', '||l_plan_req.eh_cpu_75p||l_tail);
    p('    ,["EH Med", '||l_plan_req.eh_cpu_and_resmgr_med||', '||l_plan_req.eh_cpu_med||l_tail);
    p('    ,["EH Avg", '||l_plan_req.eh_cpu_and_resmgr_avg||', '||l_plan_req.eh_cpu_avg||l_tail);

    p('    ,["HS Peak", '||l_plan_req.hs_cpu_and_resmgr_max||', '||l_plan_req.hs_cpu_max||l_tail);
    p('    ,["HS 99th", '||l_plan_req.hs_cpu_and_resmgr_99p||', '||l_plan_req.hs_cpu_99p||l_tail);
    p('    ,["HS 97th", '||l_plan_req.hs_cpu_and_resmgr_97p||', '||l_plan_req.hs_cpu_97p||l_tail);
    p('    ,["HS 95th", '||l_plan_req.hs_cpu_and_resmgr_95p||', '||l_plan_req.hs_cpu_95p||l_tail);
    p('    ,["HS 90th", '||l_plan_req.hs_cpu_and_resmgr_90p||', '||l_plan_req.hs_cpu_90p||l_tail);
    p('    ,["HS 75th", '||l_plan_req.hs_cpu_and_resmgr_75p||', '||l_plan_req.hs_cpu_75p||l_tail);
    p('    ,["HS Med", '||l_plan_req.hs_cpu_and_resmgr_med||', '||l_plan_req.hs_cpu_med||l_tail);
    p('    ,["HS Avg", '||l_plan_req.hs_cpu_and_resmgr_avg||', '||l_plan_req.hs_cpu_avg||l_tail);

    p('    ,["MAN", '||l_plan_req.cpus_manual_entry||', 0'||l_tail);
    p('    ,["REQ", '||l_plan_req.cpus_required||', 0'||l_tail);

    p(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(H_SCRIPT_TAIL, 'TITLE', l_chart_title), 'NNNN', l_nnnn), 'HAXIS', l_haxis), 'VAXIS', l_vaxis), 'SERIES', l_series));
    IF p_apex = 'N' THEN
      p(REPLACE(H_BODY_H1, 'TITLE', l_title));
    END IF;
    p(REPLACE(REPLACE(REPLACE(H_BODY, 'ABSTRACT', l_abstract), 'NNNN', l_nnnn), 'NOTES', l_notes));
    IF p_apex = 'N' THEN
      p(REPLACE(H_TAIL, 'SYSDATE', TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS')));
    END IF;
  ELSIF UPPER(p_type) = 'IOPS' AND p_host_name IS NULL THEN
    l_title := 'IOPS Requirements for Plan '||l_plan.plan_name;
    SELECT LPAD(SUBSTR(MOD(ORA_HASH(l_title), 1e4), 1, 4), 4, '0') INTO l_nnnn FROM DUAL;
    l_abstract := 'IOPS Requirements as per Plan Attributes below:'||CHR(10)||'<ol>'||CHR(10)||
                  '<li>Disk Performance Method: '||l_plan.disk_performance_method_desc||'</li>'||CHR(10)||
                  '<li>Metric used: '||l_plan.disk_perf_statistic_desc||'</li>'||CHR(10)||'</ol>';
    l_notes := '<br>1) IH: Instance History. DH: Database History. MAN: Manual Entry. REQ: IOPS Required as per Plan Attributes.'||CHR(10)||
               '<br>';
    l_chart_title := 'IOPS Requirements for Plan '||l_plan.plan_name;
    l_vaxis := 'IOPS';
    l_haxis := 'IOPS Metric';
    l_series := NULL;
    IF p_apex = 'N' THEN
      p(REPLACE(REPLACE(H_HEAD, 'SYSDATE', TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS')), 'TITLE', REPLACE(l_title, '<br>', ' - ')));
    END IF;

    p(H_CSS);
    p(H_SCRIPT_HEAD);
    p('     ["Metric", "RW-IOPS", "R-IOPS", "W-IOPS"]');

    l_tail := NULL;

    p('    ,["IH Peak", '||l_plan_req.ih_rw_iops_peak||', '||l_plan_req.ih_r_iops_peak||', '||l_plan_req.ih_w_iops_peak||']');
    p('    ,["IH 99.9th", '||l_plan_req.ih_rw_iops_999||', '||l_plan_req.ih_r_iops_999||', '||l_plan_req.ih_w_iops_999||']');
    p('    ,["IH 99th", '||l_plan_req.ih_rw_iops_99||', '||l_plan_req.ih_r_iops_99||', '||l_plan_req.ih_w_iops_99||']');
    p('    ,["IH 97th", '||l_plan_req.ih_rw_iops_97||', '||l_plan_req.ih_r_iops_97||', '||l_plan_req.ih_w_iops_97||']');
    p('    ,["IH 95th", '||l_plan_req.ih_rw_iops_95||', '||l_plan_req.ih_r_iops_95||', '||l_plan_req.ih_w_iops_95||']');
    p('    ,["IH 90th", '||l_plan_req.ih_rw_iops_90||', '||l_plan_req.ih_r_iops_90||', '||l_plan_req.ih_w_iops_90||']');
    p('    ,["IH 75th", '||l_plan_req.ih_rw_iops_75||', '||l_plan_req.ih_r_iops_75||', '||l_plan_req.ih_w_iops_75||']');
    p('    ,["IH Med", '||l_plan_req.ih_rw_iops_median||', '||l_plan_req.ih_r_iops_median||', '||l_plan_req.ih_w_iops_median||']');
    p('    ,["IH Avg", '||l_plan_req.ih_rw_iops_avg||', '||l_plan_req.ih_r_iops_avg||', '||l_plan_req.ih_w_iops_avg||']');

    p('    ,["DH Peak", '||l_plan_req.dh_rw_iops_peak||', '||l_plan_req.dh_r_iops_peak||', '||l_plan_req.dh_w_iops_peak||']');
    p('    ,["DH 99.9th", '||l_plan_req.dh_rw_iops_999||', '||l_plan_req.dh_r_iops_999||', '||l_plan_req.dh_w_iops_999||']');
    p('    ,["DH 99th", '||l_plan_req.dh_rw_iops_99||', '||l_plan_req.dh_r_iops_99||', '||l_plan_req.dh_w_iops_99||']');
    p('    ,["DH 97th", '||l_plan_req.dh_rw_iops_97||', '||l_plan_req.dh_r_iops_97||', '||l_plan_req.dh_w_iops_97||']');
    p('    ,["DH 95th", '||l_plan_req.dh_rw_iops_95||', '||l_plan_req.dh_r_iops_95||', '||l_plan_req.dh_w_iops_95||']');
    p('    ,["DH 90th", '||l_plan_req.dh_rw_iops_90||', '||l_plan_req.dh_r_iops_90||', '||l_plan_req.dh_w_iops_90||']');
    p('    ,["DH 75th", '||l_plan_req.dh_rw_iops_75||', '||l_plan_req.dh_r_iops_75||', '||l_plan_req.dh_w_iops_75||']');
    p('    ,["DH Med", '||l_plan_req.dh_rw_iops_median||', '||l_plan_req.dh_r_iops_median||', '||l_plan_req.dh_w_iops_median||']');
    p('    ,["DH Avg", '||l_plan_req.dh_rw_iops_avg||', '||l_plan_req.dh_r_iops_avg||', '||l_plan_req.dh_w_iops_avg||']');

    p('    ,["MAN", '||l_plan_req.rw_iops_man||', '||l_plan_req.r_iops_man||', '||l_plan_req.w_iops_man||']');
    p('    ,["REQ", '||l_plan_req.rw_iops_required||', '||l_plan_req.r_iops_required||', '||l_plan_req.w_iops_required||']');

    p(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(H_SCRIPT_TAIL, 'TITLE', l_chart_title), 'NNNN', l_nnnn), 'HAXIS', l_haxis), 'VAXIS', l_vaxis), 'SERIES', l_series));
    IF p_apex = 'N' THEN
      p(REPLACE(H_BODY_H1, 'TITLE', l_title));
    END IF;
    p(REPLACE(REPLACE(REPLACE(H_BODY, 'ABSTRACT', l_abstract), 'NNNN', l_nnnn), 'NOTES', l_notes));
    IF p_apex = 'N' THEN
      p(REPLACE(H_TAIL, 'SYSDATE', TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS')));
    END IF;
  ELSIF UPPER(p_type) = 'MBPS' AND p_host_name IS NULL THEN
    l_title := 'MBPS Requirements for Plan '||l_plan.plan_name;
    SELECT LPAD(SUBSTR(MOD(ORA_HASH(l_title), 1e4), 1, 4), 4, '0') INTO l_nnnn FROM DUAL;
    l_abstract := 'MBPS Requirements as per Plan Attributes below:'||CHR(10)||'<ol>'||CHR(10)||
                  '<li>Disk Performance Method: '||l_plan.disk_performance_method_desc||'</li>'||CHR(10)||
                  '<li>Metric used: '||l_plan.disk_perf_statistic_desc||'</li>'||CHR(10)||'</ol>';
    l_notes := '<br>1) IH: Instance History. DH: Database History. MAN: Manual Entry. REQ: MBPS Required as per Plan Attributes.'||CHR(10)||
               '<br>';
    l_chart_title := 'MBPS Requirements for Plan '||l_plan.plan_name;
    l_vaxis := 'MBPS';
    l_haxis := 'MBPS Metric';
    l_series := NULL;
    IF p_apex = 'N' THEN
      p(REPLACE(REPLACE(H_HEAD, 'SYSDATE', TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS')), 'TITLE', REPLACE(l_title, '<br>', ' - ')));
    END IF;

    p(H_CSS);
    p(H_SCRIPT_HEAD);
    p('     ["Metric", "RW-MBPS", "R-MBPS", "W-MBPS"]');

    l_tail := NULL;

    p('    ,["IH Peak", '||l_plan_req.ih_rw_mbps_peak||', '||l_plan_req.ih_r_mbps_peak||', '||l_plan_req.ih_w_mbps_peak||']');
    p('    ,["IH 99.9th", '||l_plan_req.ih_rw_mbps_999||', '||l_plan_req.ih_r_mbps_999||', '||l_plan_req.ih_w_mbps_999||']');
    p('    ,["IH 99th", '||l_plan_req.ih_rw_mbps_99||', '||l_plan_req.ih_r_mbps_99||', '||l_plan_req.ih_w_mbps_99||']');
    p('    ,["IH 97th", '||l_plan_req.ih_rw_mbps_97||', '||l_plan_req.ih_r_mbps_97||', '||l_plan_req.ih_w_mbps_97||']');
    p('    ,["IH 95th", '||l_plan_req.ih_rw_mbps_95||', '||l_plan_req.ih_r_mbps_95||', '||l_plan_req.ih_w_mbps_95||']');
    p('    ,["IH 90th", '||l_plan_req.ih_rw_mbps_90||', '||l_plan_req.ih_r_mbps_90||', '||l_plan_req.ih_w_mbps_90||']');
    p('    ,["IH 75th", '||l_plan_req.ih_rw_mbps_75||', '||l_plan_req.ih_r_mbps_75||', '||l_plan_req.ih_w_mbps_75||']');
    p('    ,["IH Med", '||l_plan_req.ih_rw_mbps_median||', '||l_plan_req.ih_r_mbps_median||', '||l_plan_req.ih_w_mbps_median||']');
    p('    ,["IH Avg", '||l_plan_req.ih_rw_mbps_avg||', '||l_plan_req.ih_r_mbps_avg||', '||l_plan_req.ih_w_mbps_avg||']');

    p('    ,["DH Peak", '||l_plan_req.dh_rw_mbps_peak||', '||l_plan_req.dh_r_mbps_peak||', '||l_plan_req.dh_w_mbps_peak||']');
    p('    ,["DH 99.9th", '||l_plan_req.dh_rw_mbps_999||', '||l_plan_req.dh_r_mbps_999||', '||l_plan_req.dh_w_mbps_999||']');
    p('    ,["DH 99th", '||l_plan_req.dh_rw_mbps_99||', '||l_plan_req.dh_r_mbps_99||', '||l_plan_req.dh_w_mbps_99||']');
    p('    ,["DH 97th", '||l_plan_req.dh_rw_mbps_97||', '||l_plan_req.dh_r_mbps_97||', '||l_plan_req.dh_w_mbps_97||']');
    p('    ,["DH 95th", '||l_plan_req.dh_rw_mbps_95||', '||l_plan_req.dh_r_mbps_95||', '||l_plan_req.dh_w_mbps_95||']');
    p('    ,["DH 90th", '||l_plan_req.dh_rw_mbps_90||', '||l_plan_req.dh_r_mbps_90||', '||l_plan_req.dh_w_mbps_90||']');
    p('    ,["DH 75th", '||l_plan_req.dh_rw_mbps_75||', '||l_plan_req.dh_r_mbps_75||', '||l_plan_req.dh_w_mbps_75||']');
    p('    ,["DH Med", '||l_plan_req.dh_rw_mbps_median||', '||l_plan_req.dh_r_mbps_median||', '||l_plan_req.dh_w_mbps_median||']');
    p('    ,["DH Avg", '||l_plan_req.dh_rw_mbps_avg||', '||l_plan_req.dh_r_mbps_avg||', '||l_plan_req.dh_w_mbps_avg||']');

    p('    ,["MAN", '||l_plan_req.rw_mbps_man||', '||l_plan_req.r_mbps_man||', '||l_plan_req.w_mbps_man||']');
    p('    ,["REQ", '||l_plan_req.rw_mbps_required||', '||l_plan_req.r_mbps_required||', '||l_plan_req.w_mbps_required||']');

    p(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(H_SCRIPT_TAIL, 'TITLE', l_chart_title), 'NNNN', l_nnnn), 'HAXIS', l_haxis), 'VAXIS', l_vaxis), 'SERIES', l_series));
    IF p_apex = 'N' THEN
      p(REPLACE(H_BODY_H1, 'TITLE', l_title));
    END IF;
    p(REPLACE(REPLACE(REPLACE(H_BODY, 'ABSTRACT', l_abstract), 'NNNN', l_nnnn), 'NOTES', l_notes));
    IF p_apex = 'N' THEN
      p(REPLACE(H_TAIL, 'SYSDATE', TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS')));
    END IF;
  END IF;
  RETURN l_chart;
END bar_chart;

/* ------------------------------------------------------------------------- */

FUNCTION pie_chart
( p_plan_id   IN NUMBER
, p_host_name IN VARCHAR2 DEFAULT NULL
, p_db_name   IN VARCHAR2 DEFAULT NULL /* not used, needed by esp360_9h_clob_chart.sql */
, p_type      IN VARCHAR2 DEFAULT 'CPU' /* CPU, MEM, DISK, IOPS, MBPS */
, p_apex      IN VARCHAR2 DEFAULT 'Y' /* Y, N */
)
RETURN CLOB
IS
  H_SCRIPT_HEAD CONSTANT VARCHAR2(32767) := '<script type="text/javascript" src="https://www.google.com/jsapi"></script>
  <script type="text/javascript">
    google.load("visualization", "1", {packages:["corechart"]});
    google.setOnLoadCallback(drawChart);

  function drawChart() {
    var data = google.visualization.arrayToDataTable([';

  H_SCRIPT_TAIL CONSTANT VARCHAR2(32767) := '  ]);

    var options = {
    backgroundColor: {fill: "#fcfcf0", stroke: "#336699", strokeWidth: 1},
    title: "TITLE",
    is3D: true,
    sliceVisibilityThreshold: 3/360
    };

    var chart = new google.visualization.PieChart(document.getElementById("chart_div_NNNN"));
    chart.draw(data, options);
  }
</script>
';

  l_plan plan_v%ROWTYPE;
  l_chart CLOB;
  l_title VARCHAR2(256);
  l_chart_title VARCHAR2(256);
  l_nnnn VARCHAR2(4);
  l_abstract VARCHAR2(4000);
  l_notes VARCHAR2(4000);
  l_value NUMBER;

  PROCEDURE p (p_text IN VARCHAR2)
  IS
  BEGIN
    DBMS_LOB.WRITEAPPEND(l_chart, LENGTH(p_text||CHR(10)), p_text||CHR(10));
  END p;

BEGIN
  IF NOT p_apex IN ('Y', 'N') THEN
    RETURN 'invalid p_apex value "'||p_apex||'". expected "Y" or "N".';
  END IF;

  IF NOT UPPER(p_type) IN ('CPU', 'MEM', 'DISK', 'IOPS', 'MBPS') THEN
    RETURN 'invalid p_type value "'||p_type||'". expected "CPU" or "MEM" or "DISK" or "IOPS" or "MBPS".';
  END IF;

  SELECT * INTO l_plan FROM plan_v WHERE plan_id = p_plan_id;

  DBMS_LOB.CREATETEMPORARY(l_chart, TRUE, DBMS_LOB.CALL);

  CASE UPPER(p_type)
    WHEN 'CPU' THEN l_chart_title := 'Active Sessions ON CPU';
    WHEN 'MEM' THEN l_chart_title := 'Memory in GBs';
    WHEN 'DISK' THEN l_chart_title := 'Disk Space in GBs';
    WHEN 'IOPS' THEN l_chart_title := 'IOPS';
    WHEN 'MBPS' THEN l_chart_title := 'MBPS';
    ELSE l_chart_title := 'Unknown';
  END CASE;

  IF p_host_name IS NOT NULL THEN
    l_title := UPPER(p_type)||' Instance Requirements from Host '||p_host_name;
    l_chart_title := l_chart_title||' for Host '||p_host_name;
    SELECT SUM(
           CASE UPPER(p_type)
           WHEN 'CPU' THEN cpu_demand
           WHEN 'MEM' THEN mem_size_gb
           WHEN 'IOPS' THEN rw_iops
           WHEN 'MBPS' THEN rw_mbps
           ELSE cpu_demand
           END
           ) value
      INTO l_value
      FROM inst_per_plan_v2
     WHERE plan_id = p_plan_id
       AND host_name = p_host_name;
  ELSE -- p_host_name IS NULL
    l_title := UPPER(p_type)||' Database Requirements for Plan '||l_plan.plan_name;
    l_chart_title := l_chart_title||' for Plan';
    SELECT SUM(
           CASE UPPER(p_type)
           WHEN 'CPU' THEN cpu_demand
           WHEN 'MEM' THEN mem_size_gb
           WHEN 'DISK' THEN database_size_gb
           WHEN 'IOPS' THEN rw_iops
           WHEN 'MBPS' THEN rw_mbps
           ELSE cpu_demand
           END
           ) value
      INTO l_value
      FROM db_per_plan_v2
     WHERE plan_id = p_plan_id;
  END IF;

  l_notes := '<br>1) Total: '||l_value||CHR(10)||'<br>';
  SELECT LPAD(SUBSTR(MOD(ORA_HASH(l_title), 1e4), 1, 4), 4, '0') INTO l_nnnn FROM DUAL;
  IF p_apex = 'N' THEN
    p(REPLACE(REPLACE(H_HEAD, 'SYSDATE', TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS')), 'TITLE', REPLACE(l_title, '<br>', ' - ')));
  END IF;
  p(H_CSS);
  p(H_SCRIPT_HEAD);
  p('     ["Database", "Value"]');

  IF p_host_name IS NOT NULL THEN
    FOR i IN (SELECT db_name,
                     CASE UPPER(p_type)
                     WHEN 'CPU' THEN cpu_demand
                     WHEN 'MEM' THEN mem_size_gb
                     WHEN 'IOPS' THEN rw_iops
                     WHEN 'MBPS' THEN rw_mbps
                     ELSE cpu_demand
                     END value
                FROM inst_per_plan_v2
               WHERE plan_id = p_plan_id
                 AND host_name = p_host_name
               ORDER BY
                     CASE UPPER(p_type)
                     WHEN 'CPU' THEN cpu_demand
                     WHEN 'MEM' THEN mem_size_gb
                     WHEN 'IOPS' THEN rw_iops
                     WHEN 'MBPS' THEN rw_mbps
                     ELSE cpu_demand
                     END DESC)
    LOOP
      p('    ,["'||i.db_name||'", '||i.value||']');
    END LOOP;
  ELSE -- p_host_name IS NULL
    FOR i IN (SELECT db_name,
                     CASE UPPER(p_type)
                     WHEN 'CPU' THEN cpu_demand
                     WHEN 'MEM' THEN mem_size_gb
                     WHEN 'DISK' THEN database_size_gb
                     WHEN 'IOPS' THEN rw_iops
                     WHEN 'MBPS' THEN rw_mbps
                     ELSE cpu_demand
                     END value
                FROM db_per_plan_v2
               WHERE plan_id = p_plan_id
               ORDER BY
                     CASE UPPER(p_type)
                     WHEN 'CPU' THEN cpu_demand
                     WHEN 'MEM' THEN mem_size_gb
                     WHEN 'DISK' THEN database_size_gb
                     WHEN 'IOPS' THEN rw_iops
                     WHEN 'MBPS' THEN rw_mbps
                     ELSE cpu_demand
                     END DESC)
    LOOP
      p('    ,["'||i.db_name||'", '||i.value||']');
    END LOOP;
  END IF;

  p(REPLACE(REPLACE(H_SCRIPT_TAIL, 'TITLE', l_chart_title), 'NNNN', l_nnnn));
  IF p_apex = 'N' THEN
    p(REPLACE(H_BODY_H1, 'TITLE', l_title));
  END IF;
  p(REPLACE(REPLACE(REPLACE(H_BODY, 'ABSTRACT', l_abstract), 'NNNN', l_nnnn), 'NOTES', l_notes));
  IF p_apex = 'N' THEN
    p(REPLACE(H_TAIL, 'SYSDATE', TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS')));
  END IF;

  RETURN l_chart;
END pie_chart;

/* ------------------------------------------------------------------------- */

FUNCTION just_number (p_value IN VARCHAR2)
RETURN NUMBER
IS
BEGIN
  RETURN TO_NUMBER(REPLACE(TRANSLATE(LOWER(p_value),
  '0123456789.-abcdefghijklmnopqrstuvwxyz_ ''`~!@#$%&*()=+[]{}\|;:",<>/?'||CHR(0)||CHR(9)||CHR(10)||CHR(13)||CHR(38),
  '0123456789.-'), '--'));
END just_number;

/* ------------------------------------------------------------------------- */

PROCEDURE load_collection_from_external
( p_file_name IN VARCHAR2
)
IS
BEGIN
  -- modify name of file behind external table
  EXECUTE IMMEDIATE 'ALTER TABLE collection_e LOCATION ('''||p_file_name||''')';
  -- insert new collection rows into gtt
  DELETE collection;
  INSERT INTO collection
  SELECT SUBSTR(TRIM(collection_host),1,64),
         SUBSTR(TRIM(collection_key),1,13),
         SUBSTR(TRIM(category),1,12),
         SUBSTR(TRIM(data_element),1,30),
         SUBSTR(TRIM(source),1,30),
         esp_util.just_number(instance_number),
         esp_util.just_number(inst_id),
         SUBSTR(TRIM(value),1,256)
    FROM collection_e;
END load_collection_from_external;

/* ------------------------------------------------------------------------- */

PROCEDURE load_collection_from_file
( p_file_id IN NUMBER
)
IS
BEGIN
  -- insert new collection rows into gtt
  DELETE collection;
  INSERT INTO collection
  SELECT SUBSTR(TRIM(collection_host),1,64),
         SUBSTR(TRIM(collection_key),1,13),
         SUBSTR(TRIM(category),1,12),
         SUBSTR(TRIM(data_element),1,30),
         SUBSTR(TRIM(source),1,30),
         esp_util.just_number(instance_number),
         esp_util.just_number(inst_id),
         SUBSTR(TRIM(value),1,256)
    FROM TABLE(esp_util.esp_collection(p_file_id));
END load_collection_from_file;

/* ------------------------------------------------------------------------- */

PROCEDURE load_collection
( p_client_id                  IN  NUMBER
, p_file_name                  IN  VARCHAR2 DEFAULT 'esp_requirements.csv'
, p_spec_id                    IN  NUMBER   DEFAULT -1
, p_plan_name                  IN  VARCHAR2 DEFAULT 'Plan Name'
, p_plan_desc                  IN  VARCHAR2 DEFAULT 'Plan Description'
, p_cpu_method                 IN  VARCHAR2 DEFAULT 'EH' /* Entire History (EH), Hourly Statistics (HS), Manual Entry (MA) */
, p_cpu_statistic              IN  VARCHAR2 DEFAULT NULL /* PEAK, 99.99, 99.9, 99, 97, 95, 90, 75, MEDIAN, AVG */
, p_include_resmgr_cpu_quantum IN  VARCHAR2 DEFAULT NULL /* N, Y */
, p_cap_to_num_cpus            IN  VARCHAR2 DEFAULT NULL /* N, Y */
, p_disk_performance_method    IN  VARCHAR2 DEFAULT 'IH' /* Instance History (IH), Database History (DH), Manual Entry (MA) */
, p_disk_performance_statistic IN  VARCHAR2 DEFAULT NULL /* PEAK, 99.9, 99, 97, 95, 90, 75, MEDIAN, AVG */
, p_file_source                IN  VARCHAR2 DEFAULT 'F' /* (F)ile, (E)xternal */
, p_file_id                    IN  NUMBER   DEFAULT TO_NUMBER(NULL)
, x_plan_id                    OUT NUMBER
, x_file_rows                  OUT NUMBER
, x_collection_rows            OUT NUMBER
, x_host_count                 OUT NUMBER
, x_database_count             OUT NUMBER
, x_instance_count             OUT NUMBER
, x_cpu_demand                 OUT NUMBER
, x_mem_gb                     OUT NUMBER
, x_disk_gb                    OUT NUMBER
, x_rw_iops                    OUT NUMBER
, x_rw_mbps                    OUT NUMBER
, x_error_msg                  OUT VARCHAR2
)
IS
  l_cpu_method                 VARCHAR2(2) := NVL(p_cpu_method, 'EH');
  l_cpu_statistic              VARCHAR2(6) := p_cpu_statistic;
  l_include_resmgr_cpu_quantum VARCHAR2(1) := p_include_resmgr_cpu_quantum;
  l_cap_to_num_cpus            VARCHAR2(1) := p_cap_to_num_cpus;
  l_disk_performance_method    VARCHAR2(2) := NVL(p_disk_performance_method, 'IH');
  l_disk_performance_statistic VARCHAR2(6) := p_disk_performance_statistic;
  l_clients clients%ROWTYPE;
  l_plan plan%ROWTYPE;
  l_databases databases%ROWTYPE;
  l_instances instances%ROWTYPE;
  l_db_id NUMBER;
  l_inst_id NUMBER;
  l_cpu_cap NUMBER;
  l_instances_count NUMBER;
  l_category collection.category%TYPE;
  l_source collection.source%TYPE;
  l_instance_number NUMBER;
  l_instance_id NUMBER;
  l_data_element_cpu VARCHAR2(30);
  l_data_element_disk_perf VARCHAR2(30);
  l_disk_perf_method NUMBER;
  l_load_date DATE := SYSDATE;
  l_count INTEGER;
  l_collection_host VARCHAR2(64);
  l_collection_key VARCHAR2(13);

  FUNCTION get_value (p_data_element IN VARCHAR2)
  RETURN VARCHAR2
  IS
    l_value collection.value%TYPE;
  BEGIN
    SELECT MAX(value)
      INTO l_value
      FROM collection
     WHERE collection_host = l_collection_host
       AND collection_key = l_databases.collection_key
       AND category = l_category
       AND data_element = p_data_element
       AND source = l_source
       AND instance_number = NVL(l_instance_number, instance_number)
       AND inst_id = NVL(l_instance_id, inst_id);
    RETURN l_value;
  END get_value;
BEGIN
  -- initialize
  x_plan_id         := 0;
  x_file_rows       := 0;
  x_collection_rows := 0;
  x_host_count      := 0;
  x_database_count  := 0;
  x_instance_count  := 0;
  x_cpu_demand      := 0;
  x_mem_gb          := 0;
  x_disk_gb         := 0;
  x_rw_iops         := 0;
  x_rw_mbps         := 0;
  x_error_msg       := NULL;
  -- plan configuration validation
  IF l_cpu_method NOT IN ('EH', 'HS', 'MA') THEN
    x_error_msg := 'Invalid CPU Method: '||l_cpu_method;
    DBMS_OUTPUT.PUT_LINE(x_error_msg);
    RETURN;
  END IF;
  IF l_cpu_method = 'MA' THEN
    l_cpu_statistic := NULL;
    l_include_resmgr_cpu_quantum := NULL;
    l_cap_to_num_cpus := NULL;
  ELSE
    l_cpu_statistic := NVL(l_cpu_statistic, 'PEAK');
    l_include_resmgr_cpu_quantum := NVL(l_include_resmgr_cpu_quantum, 'N');
    l_cap_to_num_cpus := NVL(l_cap_to_num_cpus, 'N');
    IF l_cpu_method = 'EH' AND l_cpu_statistic NOT IN ('PEAK', '99.99', '99.9', '99', '97', '95', '90', '75', 'MEDIAN', 'AVG') THEN
      x_error_msg := 'Invalid CPU Statistic: '||l_cpu_statistic;
      DBMS_OUTPUT.PUT_LINE(x_error_msg);
      RETURN;
    ELSIF l_cpu_method = 'HS' AND l_cpu_statistic NOT IN ('PEAK', '99', '97', '95', '90', '75', 'MEDIAN', 'AVG') THEN
      x_error_msg := 'Invalid CPU Statistic: '||l_cpu_statistic;
      DBMS_OUTPUT.PUT_LINE(x_error_msg);
      RETURN;
    END IF;
  END IF;
  IF l_disk_performance_method NOT IN ('MA', 'IH', 'DH') THEN
    x_error_msg := 'Invalid Disk Performance Method: '||l_disk_performance_method;
    DBMS_OUTPUT.PUT_LINE(x_error_msg);
    RETURN;
  END IF;
  IF l_disk_performance_method = 'MA' THEN
    l_disk_performance_statistic := NULL;
  ELSE
    l_disk_performance_statistic := NVL(l_disk_performance_statistic, 'PEAK');
    IF l_disk_performance_statistic NOT IN ('PEAK', '99.9', '99', '97', '95', '90', '75', 'MEDIAN', 'AVG') THEN
      x_error_msg := 'Invalid Disk Performance Statistic: '||l_disk_performance_statistic;
      DBMS_OUTPUT.PUT_LINE(x_error_msg);
      RETURN;
    END IF;
  END IF;
  -- validate client_id
  SELECT COUNT(*)
    INTO l_count
    FROM clients
   WHERE client_id = p_client_id;
  IF l_count != 1 THEN
    x_error_msg := 'Invalid client_id: '||p_client_id;
    DBMS_OUTPUT.PUT_LINE(x_error_msg);
    RETURN;
  END IF;
  -- get collection
  IF p_file_source = 'E' THEN -- External
    load_collection_from_external(p_file_name);
  ELSE -- p_file_source = 'F' (default)
    load_collection_from_file(p_file_id);
  END IF;
  -- counting new loaded rows
  SELECT COUNT(*)
    INTO x_file_rows
    FROM collection;
  -- counting new recognized loaded rows
  SELECT COUNT(*)
    INTO x_collection_rows
    FROM collection
   WHERE category IN ('id', 'cpu', 'mem', 'db_size', 'disk_perf', 'rman', 'osstat', 'cpu_ts', 'cpu_ts_99p', 'cpu_ts_97p', 'cpu_ts_95p', 'cpu_ts_90p', 'cpu_ts_75p', 'cpu_ts_med', 'cpu_ts_avg', 'mem_ts', 'disk_perf_ts', 'db_size_ts', 'os_ts');
  -- exit if nothing valid on file
  IF x_collection_rows = 0 THEN
    x_error_msg := 'Invalid file content';
    DBMS_OUTPUT.PUT_LINE(x_error_msg);
    RETURN;
  END IF;
  -- check if file has been loaded for given client_id
  SELECT COUNT(*)
    INTO l_count
    FROM collection col,
         databases dbs
   WHERE dbs.client_id = p_client_id
     AND dbs.collection_key = col.collection_key
     AND ROWNUM = 1;
  -- exit if file has been loaded for given client
  IF l_count > 0 THEN
    x_error_msg := 'File already loaded for this client';
    DBMS_OUTPUT.PUT_LINE(x_error_msg);
    RETURN;
  END IF;
  -- counting hosts
  SELECT COUNT(DISTINCT value)
    INTO x_host_count
    FROM collection
   WHERE category = 'id'
     AND data_element = 'server_host';
  -- validate spec_id
  SELECT COUNT(*) INTO l_count FROM spec_v WHERE spec_id = p_spec_id;
  IF l_count != 1 THEN
    DBMS_OUTPUT.PUT_LINE('Spec does not exist, or there are duplicates');
    RETURN;
  END IF;
  -- cpu method
  IF l_cpu_method IN ('EH', 'MA') THEN
    IF NVL(l_include_resmgr_cpu_quantum, 'N') = 'N' THEN
      l_data_element_cpu := 'aas_on_cpu_'||LOWER(REPLACE(NVL(l_cpu_statistic, 'PEAK'), '.'));
    ELSE
      l_data_element_cpu := 'aas_on_cpu_and_resmgr_'||LOWER(REPLACE(NVL(l_cpu_statistic, 'PEAK'), '.'));
    END IF;
  END IF;
  -- aggregate (-1) is simple SUM of all instances (conservative)
  -- combined (-2) works like superimposed time series
  IF l_disk_performance_method = 'IH' THEN
    l_disk_perf_method := -1;
  ELSIF l_disk_performance_method = 'DH' THEN
    l_disk_perf_method := -2;
  ELSE
    l_disk_perf_method := -1;
  END IF;
  -- disk perf percentile
  l_data_element_disk_perf := LOWER(REPLACE(NVL(l_disk_performance_statistic, 'PEAK'), '.'));
  -- plan
  l_plan                            := NULL;
  l_plan.client_id                  := p_client_id;
  l_plan.plan_name                  := p_plan_name;
  l_plan.plan_desc                  := p_plan_desc;
  l_plan.cpu_method                 := l_cpu_method;
  l_plan.cpu_statistic              := l_cpu_statistic;
  l_plan.include_resmgr_cpu_quantum := l_include_resmgr_cpu_quantum;
  l_plan.cap_to_num_cpus            := l_cap_to_num_cpus;
  l_plan.disk_performance_method    := l_disk_performance_method;
  l_plan.disk_performance_statistic := l_disk_performance_statistic;
  l_plan.source                     := 'collect';
  l_plan.csv_file_name              := p_file_name;
  l_plan.load_date                  := l_load_date;
  INSERT INTO plan VALUES l_plan RETURNING plan_id INTO x_plan_id;
  -- loop for all distinct databases on file
  FOR i IN (SELECT TO_NUMBER(c1.value) dbid,
                   c2.value db_name,
                   c3.value db_unique_name,
                   MIN(c1.collection_key||' '||c1.collection_host) collection_key_host
              FROM collection c1, -- dbid
                   collection c2, -- db_name
                   collection c3  -- db_unique_name
             WHERE c1.category = 'id'
               AND c1.data_element = 'dbid'
               AND c1.instance_number = 0
               AND c1.inst_id = 0
               AND c2.category = 'id'
               AND c2.data_element = 'db_name'
               AND c2.instance_number = 0
               AND c2.inst_id = 0
               AND c2.collection_host = c1.collection_host
               AND c2.collection_key = c1.collection_key
               AND c3.category = 'id'
               AND c3.data_element = 'db_unique_name'
               AND c3.instance_number = 0
               AND c3.inst_id = 0
               AND c3.collection_host = c1.collection_host
               AND c3.collection_key = c1.collection_key
             GROUP BY
                   TO_NUMBER(c1.value), -- dbid
                   c2.value, -- db_name
                   c3.value -- db_unique_name
             HAVING NOT EXISTS (SELECT NULL
                                  FROM databases dbs
                                 WHERE dbs.client_id = p_client_id
                                   AND dbs.collection_key = MIN(c1.collection_key))
             ORDER BY
                   TO_NUMBER(c1.value), -- dbid
                   c2.value, -- db_name
                   c3.value) -- db_unique_name
  LOOP
    l_collection_key := SUBSTR(i.collection_key_host, 1, INSTR(i.collection_key_host, ' ') - 1);
    l_collection_host := SUBSTR(i.collection_key_host, INSTR(i.collection_key_host, ' ') + 1);
    l_instances_count := 0;
    l_databases := NULL;
    l_databases.client_id := p_client_id;
    l_databases.dbid := i.dbid;
    l_databases.db_name := i.db_name;
    l_databases.db_unique_name := i.db_unique_name;
    l_databases.collection_key := l_collection_key;
    l_databases.load_date := l_load_date;
    l_category := 'id';
    l_source := 'sysdate';
    l_instance_number := 0;
    l_instance_id := 0;
    l_databases.collection_date := TO_DATE(get_value('collection_date'), 'YYYY-MM-DD/HH24:MI:SS');
    l_source := 'v$database';
    l_databases.platform_name := get_value('platform_name');
    l_source := 'gv$instance';
    l_instance_number := NULL;
    l_instance_id := NULL;
    l_databases.version := get_value('version');
    l_source := 'sys_context';
    l_instance_number := 0;
    l_instance_id := 0;
    l_databases.host_name_src := get_value('host');
    l_category := 'mem';
    l_source := 'gv$system_parameter';
    l_instance_number := -1;
    l_instance_id := -1;
    l_databases.cpu_count := TO_NUMBER(get_value('cpu_count'));
    l_source := 'dba_hist_parameter';
    l_databases.cpu_count := NVL(l_databases.cpu_count, TO_NUMBER(get_value('cpu_count')));
    IF NVL(l_cap_to_num_cpus, 'N') = 'N' THEN
      l_cpu_cap := 999999;
    ELSE
      l_cpu_cap := l_databases.cpu_count;
      IF l_cpu_cap = 0 THEN
        l_cpu_cap := 999999;
      END IF;
    END IF;
    l_category := 'cpu';
    l_source := 'dba_hist_active_sess_history';
    l_databases.aas_cpu_demand := 0;
    IF l_cpu_method IN ('EH', 'MA') THEN
      l_databases.aas_cpu_demand := LEAST(l_cpu_cap, TO_NUMBER(get_value(l_data_element_cpu)));
    END IF;
    l_databases.aas_on_cpu_peak := TO_NUMBER(get_value('aas_on_cpu_peak'));
    l_databases.aas_on_cpu_9999 := TO_NUMBER(get_value('aas_on_cpu_9999'));
    l_databases.aas_on_cpu_999 := TO_NUMBER(get_value('aas_on_cpu_999'));
    l_databases.aas_on_cpu_99 := TO_NUMBER(get_value('aas_on_cpu_99'));
    l_databases.aas_on_cpu_97 := TO_NUMBER(get_value('aas_on_cpu_97'));
    l_databases.aas_on_cpu_95 := TO_NUMBER(get_value('aas_on_cpu_95'));
    -- older files missed 97
    IF l_databases.aas_on_cpu_97 IS NULL THEN
      l_databases.aas_on_cpu_97 := ROUND((l_databases.aas_on_cpu_95 + l_databases.aas_on_cpu_99) / 2);
    END IF;
    l_databases.aas_on_cpu_90 := TO_NUMBER(get_value('aas_on_cpu_90'));
    l_databases.aas_on_cpu_75 := TO_NUMBER(get_value('aas_on_cpu_75'));
    l_databases.aas_on_cpu_median := TO_NUMBER(get_value('aas_on_cpu_median'));
    l_databases.aas_on_cpu_avg := TO_NUMBER(get_value('aas_on_cpu_avg'));
    l_databases.aas_on_cpu_and_resmgr_peak := TO_NUMBER(get_value('aas_on_cpu_and_resmgr_peak'));
    l_databases.aas_on_cpu_and_resmgr_9999 := TO_NUMBER(get_value('aas_on_cpu_and_resmgr_9999'));
    l_databases.aas_on_cpu_and_resmgr_999 := TO_NUMBER(get_value('aas_on_cpu_and_resmgr_999'));
    l_databases.aas_on_cpu_and_resmgr_99 := TO_NUMBER(get_value('aas_on_cpu_and_resmgr_99'));
    l_databases.aas_on_cpu_and_resmgr_97 := TO_NUMBER(get_value('aas_on_cpu_and_resmgr_97'));
    l_databases.aas_on_cpu_and_resmgr_95 := TO_NUMBER(get_value('aas_on_cpu_and_resmgr_95'));
    -- older files missed 97
    IF l_databases.aas_on_cpu_and_resmgr_97 IS NULL THEN
      l_databases.aas_on_cpu_and_resmgr_97 := ROUND((l_databases.aas_on_cpu_and_resmgr_95 + l_databases.aas_on_cpu_and_resmgr_99) / 2);
    END IF;
    l_databases.aas_on_cpu_and_resmgr_90 := TO_NUMBER(get_value('aas_on_cpu_and_resmgr_90'));
    l_databases.aas_on_cpu_and_resmgr_75 := TO_NUMBER(get_value('aas_on_cpu_and_resmgr_75'));
    l_databases.aas_on_cpu_and_resmgr_median := TO_NUMBER(get_value('aas_on_cpu_and_resmgr_median'));
    l_databases.aas_on_cpu_and_resmgr_avg := TO_NUMBER(get_value('aas_on_cpu_and_resmgr_avg'));
    l_source := 'gv$active_session_history';
    IF l_cpu_method IN ('EH', 'MA') THEN
      l_databases.aas_cpu_demand := LEAST(l_cpu_cap, NVL(l_databases.aas_cpu_demand, TO_NUMBER(get_value(l_data_element_cpu))));
    END IF;
    l_databases.aas_on_cpu_peak := NVL(l_databases.aas_on_cpu_peak, TO_NUMBER(get_value('aas_on_cpu_peak')));
    l_databases.aas_on_cpu_9999 := NVL(l_databases.aas_on_cpu_9999, TO_NUMBER(get_value('aas_on_cpu_9999')));
    l_databases.aas_on_cpu_999 := NVL(l_databases.aas_on_cpu_999, TO_NUMBER(get_value('aas_on_cpu_999')));
    l_databases.aas_on_cpu_99 := NVL(l_databases.aas_on_cpu_99, TO_NUMBER(get_value('aas_on_cpu_99')));
    l_databases.aas_on_cpu_97 := NVL(l_databases.aas_on_cpu_97, TO_NUMBER(get_value('aas_on_cpu_97')));
    l_databases.aas_on_cpu_95 := NVL(l_databases.aas_on_cpu_95, TO_NUMBER(get_value('aas_on_cpu_95')));
    -- older files missed 97
    IF l_databases.aas_on_cpu_97 IS NULL THEN
      l_databases.aas_on_cpu_97 := ROUND((l_databases.aas_on_cpu_95 + l_databases.aas_on_cpu_99) / 2);
    END IF;
    l_databases.aas_on_cpu_90 := NVL(l_databases.aas_on_cpu_90, TO_NUMBER(get_value('aas_on_cpu_90')));
    l_databases.aas_on_cpu_75 := NVL(l_databases.aas_on_cpu_75, TO_NUMBER(get_value('aas_on_cpu_75')));
    l_databases.aas_on_cpu_median := NVL(l_databases.aas_on_cpu_median, TO_NUMBER(get_value('aas_on_cpu_median')));
    l_databases.aas_on_cpu_avg := NVL(l_databases.aas_on_cpu_avg, TO_NUMBER(get_value('aas_on_cpu_avg')));
    l_databases.aas_on_cpu_and_resmgr_peak := NVL(l_databases.aas_on_cpu_and_resmgr_peak, TO_NUMBER(get_value('aas_on_cpu_and_resmgr_peak')));
    l_databases.aas_on_cpu_and_resmgr_9999 := NVL(l_databases.aas_on_cpu_and_resmgr_9999, TO_NUMBER(get_value('aas_on_cpu_and_resmgr_9999')));
    l_databases.aas_on_cpu_and_resmgr_999 := NVL(l_databases.aas_on_cpu_and_resmgr_999, TO_NUMBER(get_value('aas_on_cpu_and_resmgr_999')));
    l_databases.aas_on_cpu_and_resmgr_99 := NVL(l_databases.aas_on_cpu_and_resmgr_99, TO_NUMBER(get_value('aas_on_cpu_and_resmgr_99')));
    l_databases.aas_on_cpu_and_resmgr_97 := NVL(l_databases.aas_on_cpu_and_resmgr_97, TO_NUMBER(get_value('aas_on_cpu_and_resmgr_97')));
    l_databases.aas_on_cpu_and_resmgr_95 := NVL(l_databases.aas_on_cpu_and_resmgr_95, TO_NUMBER(get_value('aas_on_cpu_and_resmgr_95')));
    -- older files missed 97
    IF l_databases.aas_on_cpu_and_resmgr_97 IS NULL THEN
      l_databases.aas_on_cpu_and_resmgr_97 := ROUND((l_databases.aas_on_cpu_and_resmgr_95 + l_databases.aas_on_cpu_and_resmgr_99) / 2);
    END IF;
    l_databases.aas_on_cpu_and_resmgr_90 := NVL(l_databases.aas_on_cpu_and_resmgr_90, TO_NUMBER(get_value('aas_on_cpu_and_resmgr_90')));
    l_databases.aas_on_cpu_and_resmgr_75 := NVL(l_databases.aas_on_cpu_and_resmgr_75, TO_NUMBER(get_value('aas_on_cpu_and_resmgr_75')));
    l_databases.aas_on_cpu_and_resmgr_median := NVL(l_databases.aas_on_cpu_and_resmgr_median, TO_NUMBER(get_value('aas_on_cpu_and_resmgr_median')));
    l_databases.aas_on_cpu_and_resmgr_avg := NVL(l_databases.aas_on_cpu_and_resmgr_avg, TO_NUMBER(get_value('aas_on_cpu_and_resmgr_avg')));
    l_category := 'mem';
    l_source := 'dba_hist_sga';
    l_databases.sga_size_gb := ROUND(TO_NUMBER(get_value('sga_alloc')) / POWER(2, 30), 1);
    l_source := 'gv$sgainfo';
    l_databases.sga_size_gb := NVL(l_databases.sga_size_gb, ROUND(TO_NUMBER(get_value('sga_alloc')) / POWER(2, 30), 1));
    l_source := 'dba_hist_parameter';
    l_databases.sga_size_gb := NVL(l_databases.sga_size_gb, ROUND(TO_NUMBER(get_value('sga_target')) / POWER(2, 30), 1));
    l_source := 'gv$system_parameter';
    l_databases.sga_size_gb := NVL(l_databases.sga_size_gb, ROUND(TO_NUMBER(get_value('sga_target')) / POWER(2, 30), 1));
    l_source := 'dba_hist_parameter';
    l_databases.sga_size_gb := NVL(l_databases.sga_size_gb, ROUND(TO_NUMBER(get_value('sga_max_size')) / POWER(2, 30), 1));
    l_source := 'gv$system_parameter' ;
    l_databases.sga_size_gb := NVL(l_databases.sga_size_gb, ROUND(TO_NUMBER(get_value('sga_max_size')) / POWER(2, 30), 1));
    l_source := 'dba_hist_pgastat';
    l_databases.pga_size_gb := ROUND(TO_NUMBER(get_value('pga_alloc')) / POWER(2, 30), 1);
    l_source := 'gv$pgastat';
    l_databases.pga_size_gb := NVL(l_databases.pga_size_gb, ROUND(TO_NUMBER(get_value('pga_alloc')) / POWER(2, 30), 1));
    l_source := 'dba_hist_parameter';
    l_databases.pga_size_gb := NVL(l_databases.pga_size_gb, ROUND(TO_NUMBER(get_value('pga_aggregate_target')) / POWER(2, 30), 1));
    l_source := 'gv$system_parameter' ;
    l_databases.pga_size_gb := NVL(l_databases.pga_size_gb, ROUND(TO_NUMBER(get_value('pga_aggregate_target')) / POWER(2, 30), 1));
    x_mem_gb := x_mem_gb + NVL(l_databases.sga_size_gb, 0) + NVL(l_databases.pga_size_gb, 0);
    l_category := 'db_size';
    l_source := 'v$';
    l_databases.database_size_gb := ROUND(TO_NUMBER(get_value('total')) / POWER(2, 30));
    x_disk_gb := x_disk_gb + NVL(l_databases.database_size_gb, 0);
    l_category := 'disk_perf';
    l_source := 'dba_hist_sysstat';
    l_instance_number := l_disk_perf_method;
    l_instance_id := l_disk_perf_method;
    l_databases.r_iops := TO_NUMBER(get_value('r_iops_'||l_data_element_disk_perf));
    l_databases.w_iops := TO_NUMBER(get_value('w_iops_'||l_data_element_disk_perf));
    x_rw_iops := x_rw_iops + NVL(l_databases.r_iops, 0) + NVL(l_databases.w_iops, 0);
    l_instance_number := -2;
    l_instance_id := -2;
    l_databases.rw_iops_peak := TO_NUMBER(get_value('rw_iops_peak'));
    l_databases.r_iops_peak := TO_NUMBER(get_value('r_iops_peak'));
    l_databases.w_iops_peak := TO_NUMBER(get_value('w_iops_peak'));
    l_databases.rw_iops_999 := TO_NUMBER(get_value('rw_iops_999'));
    l_databases.r_iops_999 := TO_NUMBER(get_value('r_iops_999'));
    l_databases.w_iops_999 := TO_NUMBER(get_value('w_iops_999'));
    l_databases.rw_iops_99 := TO_NUMBER(get_value('rw_iops_99'));
    l_databases.r_iops_99 := TO_NUMBER(get_value('r_iops_99'));
    l_databases.w_iops_99 := TO_NUMBER(get_value('w_iops_99'));
    l_databases.rw_iops_97 := TO_NUMBER(get_value('rw_iops_97'));
    l_databases.r_iops_97 := TO_NUMBER(get_value('r_iops_97'));
    l_databases.w_iops_97 := TO_NUMBER(get_value('w_iops_97'));
    l_databases.rw_iops_95 := TO_NUMBER(get_value('rw_iops_95'));
    l_databases.r_iops_95 := TO_NUMBER(get_value('r_iops_95'));
    l_databases.w_iops_95 := TO_NUMBER(get_value('w_iops_95'));
    -- older files missed 97
    IF l_databases.rw_iops_97 IS NULL THEN
      l_databases.rw_iops_97 := ROUND((l_databases.rw_iops_95 + l_databases.rw_iops_99) / 2);
      l_databases.r_iops_97 := ROUND((l_databases.r_iops_95 + l_databases.r_iops_99) / 2);
      l_databases.w_iops_97 := ROUND((l_databases.w_iops_95 + l_databases.w_iops_99) / 2);
    END IF;
    l_databases.rw_iops_90 := TO_NUMBER(get_value('rw_iops_90'));
    l_databases.r_iops_90 := TO_NUMBER(get_value('r_iops_90'));
    l_databases.w_iops_90 := TO_NUMBER(get_value('w_iops_90'));
    l_databases.rw_iops_75 := TO_NUMBER(get_value('rw_iops_75'));
    l_databases.r_iops_75 := TO_NUMBER(get_value('r_iops_75'));
    l_databases.w_iops_75 := TO_NUMBER(get_value('w_iops_75'));
    l_databases.rw_iops_median := TO_NUMBER(get_value('rw_iops_median'));
    l_databases.r_iops_median := TO_NUMBER(get_value('r_iops_median'));
    l_databases.w_iops_median := TO_NUMBER(get_value('w_iops_median'));
    l_databases.rw_iops_avg := TO_NUMBER(get_value('rw_iops_avg'));
    l_databases.r_iops_avg := TO_NUMBER(get_value('r_iops_avg'));
    l_databases.w_iops_avg := TO_NUMBER(get_value('w_iops_avg'));
    l_instance_number := l_disk_perf_method;
    l_instance_id := l_disk_perf_method;
    l_databases.r_mbps := TO_NUMBER(get_value('r_mbps_'||l_data_element_disk_perf));
    l_databases.w_mbps := TO_NUMBER(get_value('w_mbps_'||l_data_element_disk_perf));
    x_rw_mbps := x_rw_mbps + NVL(l_databases.r_mbps, 0) + NVL(l_databases.w_mbps, 0);
    l_instance_number := -2;
    l_instance_id := -2;
    l_databases.rw_mbps_peak := TO_NUMBER(get_value('rw_mbps_peak'));
    l_databases.r_mbps_peak := TO_NUMBER(get_value('r_mbps_peak'));
    l_databases.w_mbps_peak := TO_NUMBER(get_value('w_mbps_peak'));
    l_databases.rw_mbps_999 := TO_NUMBER(get_value('rw_mbps_999'));
    l_databases.r_mbps_999 := TO_NUMBER(get_value('r_mbps_999'));
    l_databases.w_mbps_999 := TO_NUMBER(get_value('w_mbps_999'));
    l_databases.rw_mbps_99 := TO_NUMBER(get_value('rw_mbps_99'));
    l_databases.r_mbps_99 := TO_NUMBER(get_value('r_mbps_99'));
    l_databases.w_mbps_99 := TO_NUMBER(get_value('w_mbps_99'));
    l_databases.rw_mbps_97 := TO_NUMBER(get_value('rw_mbps_97'));
    l_databases.r_mbps_97 := TO_NUMBER(get_value('r_mbps_97'));
    l_databases.w_mbps_97 := TO_NUMBER(get_value('w_mbps_97'));
    l_databases.rw_mbps_95 := TO_NUMBER(get_value('rw_mbps_95'));
    l_databases.r_mbps_95 := TO_NUMBER(get_value('r_mbps_95'));
    l_databases.w_mbps_95 := TO_NUMBER(get_value('w_mbps_95'));
    -- older files missed 97
    IF l_databases.rw_mbps_97 IS NULL THEN
      l_databases.rw_mbps_97 := ROUND((l_databases.rw_mbps_97 + l_databases.rw_mbps_97) / 2);
      l_databases.r_mbps_97 := ROUND((l_databases.r_mbps_97 + l_databases.r_mbps_97) / 2);
      l_databases.w_mbps_97 := ROUND((l_databases.w_mbps_97 + l_databases.w_mbps_97) / 2);
    END IF;
    l_databases.rw_mbps_90 := TO_NUMBER(get_value('rw_mbps_90'));
    l_databases.r_mbps_90 := TO_NUMBER(get_value('r_mbps_90'));
    l_databases.w_mbps_90 := TO_NUMBER(get_value('w_mbps_90'));
    l_databases.rw_mbps_75 := TO_NUMBER(get_value('rw_mbps_75'));
    l_databases.r_mbps_75 := TO_NUMBER(get_value('r_mbps_75'));
    l_databases.w_mbps_75 := TO_NUMBER(get_value('w_mbps_75'));
    l_databases.rw_mbps_median := TO_NUMBER(get_value('rw_mbps_median'));
    l_databases.r_mbps_median := TO_NUMBER(get_value('r_mbps_median'));
    l_databases.w_mbps_median := TO_NUMBER(get_value('w_mbps_median'));
    l_databases.rw_mbps_avg := TO_NUMBER(get_value('rw_mbps_avg'));
    l_databases.r_mbps_avg := TO_NUMBER(get_value('r_mbps_avg'));
    l_databases.w_mbps_avg := TO_NUMBER(get_value('w_mbps_avg'));
    -- inser database and get db_id
    INSERT INTO databases VALUES l_databases RETURNING db_id INTO l_db_id;
    x_database_count := x_database_count + 1;
    DBMS_OUTPUT.PUT_LINE('database       : '||l_databases.db_name||' ('||l_db_id||')');
    -- get all instances for database
    FOR j IN (SELECT DISTINCT instance_number, inst_id, value instance_name
                FROM collection
               WHERE collection_host = l_collection_host
                 AND collection_key = l_collection_key
                 AND category = 'id'
                 AND data_element = 'instance_name'
                 AND source = 'gv$instance'
                 AND instance_number > 0
                 AND inst_id > 0)
    LOOP
      l_instances_count := l_instances_count + 1;
      l_instances := NULL;
      l_instances.db_id := l_db_id;
      l_instances.spec_id := p_spec_id;
      l_instances.instance_number := j.instance_number;
      l_instances.instance_name := j.instance_name;
      l_category := 'id';
      l_source := 'gv$instance';
      l_instance_number := j.instance_number;
      l_instance_id := j.inst_id;
      l_instances.host_name := get_value('host_name');
      l_instance_number := 0;
      l_category := 'osstat';
      l_source := 'gv$osstat';
      l_instances.host_load := TO_NUMBER(get_value('LOAD'));
      l_instances.host_num_cpus := TO_NUMBER(get_value('NUM_CPUS'));
      l_instances.host_num_cpu_cores := TO_NUMBER(get_value('NUM_CPU_CORES'));
      l_instances.host_num_cpu_sockets := TO_NUMBER(get_value('NUM_CPU_SOCKETS'));
      l_instances.host_physical_memory_gb :=  ROUND(TO_NUMBER(get_value('PHYSICAL_MEMORY_BYTES')) / POWER(2, 30), 3);
      l_category := 'mem';
      l_source := 'gv$system_parameter';
      l_instances.cpu_count := TO_NUMBER(get_value('cpu_count'));
      -- old files, which may lack gv$osstat
      IF l_instances.host_num_cpus IS NULL THEN
        SELECT MAX(source)
          INTO l_source
          FROM collection
         WHERE collection_host = l_collection_host
           AND collection_key = l_databases.collection_key
           AND category = 'os_ts'
           AND instance_number = j.instance_number;
        IF l_source IS NOT NULL THEN
          l_category := 'os_ts';
          l_instance_number := j.instance_number;
          l_instance_id := 0;
          l_instances.host_load := NVL(NVL(l_instances.host_load, TO_NUMBER(get_value('load'))), 0);
          l_instances.host_num_cpus := NVL(NVL(l_instances.host_num_cpus, TO_NUMBER(get_value('num_cpus'))), 0);
          l_instances.host_num_cpu_cores := NVL(NVL(l_instances.host_num_cpu_cores, TO_NUMBER(get_value('num_cpu_cores'))), 0);
          l_instances.host_num_cpu_sockets := NVL(NVL(l_instances.host_num_cpu_sockets, TO_NUMBER(get_value('num_cpu_sockets'))), 0);
          l_instances.host_physical_memory_gb := NVL(NVL(l_instances.host_physical_memory_gb, TO_NUMBER(get_value('physical_memory_gb'))), 0);
        END IF;
      END IF;
      l_source := 'dba_hist_parameter';
      l_instance_number := j.instance_number;
      l_instance_id := 0;
      l_instances.cpu_count := NVL(l_instances.cpu_count, TO_NUMBER(get_value('cpu_count')));
      IF NVL(l_cap_to_num_cpus, 'N') = 'N' THEN
        l_cpu_cap := 999999;
      ELSE
        l_cpu_cap := l_instances.cpu_count;
        IF l_cpu_cap = 0 THEN
          l_cpu_cap := 999999;
        END IF;
      END IF;
      l_category := 'cpu';
      l_source := 'dba_hist_active_sess_history';
      l_instance_number := j.instance_number;
      l_instance_id := 0;
      IF l_cpu_method IN ('EH', 'MA') THEN
        l_instances.aas_cpu_demand := LEAST(l_cpu_cap, TO_NUMBER(get_value(l_data_element_cpu)));
      END IF;
      l_instances.aas_on_cpu_peak := TO_NUMBER(get_value('aas_on_cpu_peak'));
      l_instances.aas_on_cpu_9999 := TO_NUMBER(get_value('aas_on_cpu_9999'));
      l_instances.aas_on_cpu_999 := TO_NUMBER(get_value('aas_on_cpu_999'));
      l_instances.aas_on_cpu_99 := TO_NUMBER(get_value('aas_on_cpu_99'));
      l_instances.aas_on_cpu_97 := TO_NUMBER(get_value('aas_on_cpu_97'));
      l_instances.aas_on_cpu_95 := TO_NUMBER(get_value('aas_on_cpu_95'));
      -- older files missed 97
      IF l_instances.aas_on_cpu_97 IS NULL THEN
        l_instances.aas_on_cpu_97 := ROUND((l_instances.aas_on_cpu_95 + l_instances.aas_on_cpu_99) / 2);
      END IF;
      l_instances.aas_on_cpu_90 := TO_NUMBER(get_value('aas_on_cpu_90'));
      l_instances.aas_on_cpu_75 := TO_NUMBER(get_value('aas_on_cpu_75'));
      l_instances.aas_on_cpu_median := TO_NUMBER(get_value('aas_on_cpu_median'));
      l_instances.aas_on_cpu_avg := TO_NUMBER(get_value('aas_on_cpu_avg'));
      l_instances.aas_on_cpu_and_resmgr_peak := TO_NUMBER(get_value('aas_on_cpu_and_resmgr_peak'));
      l_instances.aas_on_cpu_and_resmgr_9999 := TO_NUMBER(get_value('aas_on_cpu_and_resmgr_9999'));
      l_instances.aas_on_cpu_and_resmgr_999 := TO_NUMBER(get_value('aas_on_cpu_and_resmgr_999'));
      l_instances.aas_on_cpu_and_resmgr_99 := TO_NUMBER(get_value('aas_on_cpu_and_resmgr_99'));
      l_instances.aas_on_cpu_and_resmgr_97 := TO_NUMBER(get_value('aas_on_cpu_and_resmgr_97'));
      l_instances.aas_on_cpu_and_resmgr_95 := TO_NUMBER(get_value('aas_on_cpu_and_resmgr_95'));
      -- older files missed 97
      IF l_instances.aas_on_cpu_and_resmgr_97 IS NULL THEN
        l_instances.aas_on_cpu_and_resmgr_97 := ROUND((l_instances.aas_on_cpu_and_resmgr_95 + l_instances.aas_on_cpu_and_resmgr_99) / 2);
      END IF;
      l_instances.aas_on_cpu_and_resmgr_90 := TO_NUMBER(get_value('aas_on_cpu_and_resmgr_90'));
      l_instances.aas_on_cpu_and_resmgr_75 := TO_NUMBER(get_value('aas_on_cpu_and_resmgr_75'));
      l_instances.aas_on_cpu_and_resmgr_median := TO_NUMBER(get_value('aas_on_cpu_and_resmgr_median'));
      l_instances.aas_on_cpu_and_resmgr_avg := TO_NUMBER(get_value('aas_on_cpu_and_resmgr_avg'));
      l_source := 'gv$active_session_history';
      l_instance_number := 0;
      l_instance_id := j.inst_id;
      IF l_cpu_method IN ('EH', 'MA') THEN
        l_instances.aas_cpu_demand := LEAST(l_cpu_cap, NVL(l_instances.aas_cpu_demand, TO_NUMBER(get_value(l_data_element_cpu))));
      END IF;
      l_instances.aas_on_cpu_peak := NVL(l_instances.aas_on_cpu_peak, TO_NUMBER(get_value('aas_on_cpu_peak')));
      l_instances.aas_on_cpu_9999 := NVL(l_instances.aas_on_cpu_9999, TO_NUMBER(get_value('aas_on_cpu_9999')));
      l_instances.aas_on_cpu_999 := NVL(l_instances.aas_on_cpu_999, TO_NUMBER(get_value('aas_on_cpu_999')));
      l_instances.aas_on_cpu_99 := NVL(l_instances.aas_on_cpu_99, TO_NUMBER(get_value('aas_on_cpu_99')));
      l_instances.aas_on_cpu_97 := NVL(l_instances.aas_on_cpu_97, TO_NUMBER(get_value('aas_on_cpu_97')));
      l_instances.aas_on_cpu_95 := NVL(l_instances.aas_on_cpu_95, TO_NUMBER(get_value('aas_on_cpu_95')));
      -- older files missed 97
      IF l_instances.aas_on_cpu_97 IS NULL THEN
        l_instances.aas_on_cpu_97 := ROUND((l_instances.aas_on_cpu_95 + l_instances.aas_on_cpu_99) / 2);
      END IF;
      l_instances.aas_on_cpu_90 := NVL(l_instances.aas_on_cpu_90, TO_NUMBER(get_value('aas_on_cpu_90')));
      l_instances.aas_on_cpu_75 := NVL(l_instances.aas_on_cpu_75, TO_NUMBER(get_value('aas_on_cpu_75')));
      l_instances.aas_on_cpu_median := NVL(l_instances.aas_on_cpu_median, TO_NUMBER(get_value('aas_on_cpu_median')));
      l_instances.aas_on_cpu_avg := NVL(l_instances.aas_on_cpu_avg, TO_NUMBER(get_value('aas_on_cpu_avg')));
      l_instances.aas_on_cpu_and_resmgr_peak := NVL(l_instances.aas_on_cpu_and_resmgr_peak, TO_NUMBER(get_value('aas_on_cpu_and_resmgr_peak')));
      l_instances.aas_on_cpu_and_resmgr_9999 := NVL(l_instances.aas_on_cpu_and_resmgr_9999, TO_NUMBER(get_value('aas_on_cpu_and_resmgr_9999')));
      l_instances.aas_on_cpu_and_resmgr_999 := NVL(l_instances.aas_on_cpu_and_resmgr_999, TO_NUMBER(get_value('aas_on_cpu_and_resmgr_999')));
      l_instances.aas_on_cpu_and_resmgr_99 := NVL(l_instances.aas_on_cpu_and_resmgr_99, TO_NUMBER(get_value('aas_on_cpu_and_resmgr_99')));
      l_instances.aas_on_cpu_and_resmgr_97 := NVL(l_instances.aas_on_cpu_and_resmgr_97, TO_NUMBER(get_value('aas_on_cpu_and_resmgr_97')));
      l_instances.aas_on_cpu_and_resmgr_95 := NVL(l_instances.aas_on_cpu_and_resmgr_95, TO_NUMBER(get_value('aas_on_cpu_and_resmgr_95')));
      -- older files missed 97
      IF l_instances.aas_on_cpu_and_resmgr_97 IS NULL THEN
        l_instances.aas_on_cpu_and_resmgr_97 := ROUND((l_instances.aas_on_cpu_and_resmgr_95 + l_instances.aas_on_cpu_and_resmgr_99) / 2);
      END IF;
      l_instances.aas_on_cpu_and_resmgr_90 := NVL(l_instances.aas_on_cpu_and_resmgr_90, TO_NUMBER(get_value('aas_on_cpu_and_resmgr_90')));
      l_instances.aas_on_cpu_and_resmgr_75 := NVL(l_instances.aas_on_cpu_and_resmgr_75, TO_NUMBER(get_value('aas_on_cpu_and_resmgr_75')));
      l_instances.aas_on_cpu_and_resmgr_median := NVL(l_instances.aas_on_cpu_and_resmgr_median, TO_NUMBER(get_value('aas_on_cpu_and_resmgr_median')));
      l_instances.aas_on_cpu_and_resmgr_avg := NVL(l_instances.aas_on_cpu_and_resmgr_avg, TO_NUMBER(get_value('aas_on_cpu_and_resmgr_avg')));
      l_category := 'mem';
      l_source := 'dba_hist_sga';
      l_instance_number := j.instance_number;
      l_instance_id := 0;
      l_instances.sga_size_gb := ROUND(TO_NUMBER(get_value('sga_alloc')) / POWER(2, 30), 1);
      l_source := 'gv$sgainfo';
      l_instance_number := 0;
      l_instance_id := j.inst_id;
      l_instances.sga_size_gb := NVL(l_instances.sga_size_gb, ROUND(TO_NUMBER(get_value('sga_alloc')) / POWER(2, 30), 1));
      l_source := 'dba_hist_parameter';
      l_instance_number := j.instance_number;
      l_instance_id := 0;
      l_instances.sga_size_gb := NVL(l_instances.sga_size_gb, ROUND(TO_NUMBER(get_value('sga_target')) / POWER(2, 30), 1));
      l_source := 'gv$system_parameter';
      l_instance_number := 0;
      l_instance_id := j.inst_id;
      l_instances.sga_size_gb := NVL(l_instances.sga_size_gb, ROUND(TO_NUMBER(get_value('sga_target')) / POWER(2, 30), 1));
      l_source := 'dba_hist_parameter';
      l_instance_number := j.instance_number;
      l_instance_id := 0;
      l_instances.sga_size_gb := NVL(l_instances.sga_size_gb, ROUND(TO_NUMBER(get_value('sga_max_size')) / POWER(2, 30), 1));
      l_source := 'gv$system_parameter' ;
      l_instance_number := 0;
      l_instance_id := j.inst_id;
      l_instances.sga_size_gb := NVL(l_instances.sga_size_gb, ROUND(TO_NUMBER(get_value('sga_max_size')) / POWER(2, 30), 1));
      l_source := 'dba_hist_pgastat';
      l_instance_number := j.instance_number;
      l_instance_id := 0;
      l_instances.pga_size_gb := ROUND(TO_NUMBER(get_value('pga_alloc')) / POWER(2, 30), 1);
      l_source := 'gv$pgastat';
      l_instance_number := 0;
      l_instance_id := j.inst_id;
      l_instances.pga_size_gb := NVL(l_instances.pga_size_gb, ROUND(TO_NUMBER(get_value('pga_alloc')) / POWER(2, 30), 1));
      l_source := 'dba_hist_parameter';
      l_instance_number := j.instance_number;
      l_instance_id := 0;
      l_instances.pga_size_gb := NVL(l_instances.pga_size_gb, ROUND(TO_NUMBER(get_value('pga_aggregate_target')) / POWER(2, 30), 1));
      l_source := 'gv$system_parameter' ;
      l_instance_number := 0;
      l_instance_id := j.inst_id;
      l_instances.pga_size_gb := NVL(l_instances.pga_size_gb, ROUND(TO_NUMBER(get_value('pga_aggregate_target')) / POWER(2, 30), 1));
      l_category := 'disk_perf';
      l_source := 'dba_hist_sysstat';
      l_instance_number := j.instance_number;
      l_instance_id := 0;
      l_instances.r_iops := TO_NUMBER(get_value('r_iops_'||l_data_element_disk_perf));
      l_instances.w_iops := TO_NUMBER(get_value('w_iops_'||l_data_element_disk_perf));
      l_instances.rw_iops_peak := TO_NUMBER(get_value('rw_iops_peak'));
      l_instances.r_iops_peak := TO_NUMBER(get_value('r_iops_peak'));
      l_instances.w_iops_peak := TO_NUMBER(get_value('w_iops_peak'));
      l_instances.rw_iops_999 := TO_NUMBER(get_value('rw_iops_999'));
      l_instances.r_iops_999 := TO_NUMBER(get_value('r_iops_999'));
      l_instances.w_iops_999 := TO_NUMBER(get_value('w_iops_999'));
      l_instances.rw_iops_99 := TO_NUMBER(get_value('rw_iops_99'));
      l_instances.r_iops_99 := TO_NUMBER(get_value('r_iops_99'));
      l_instances.w_iops_99 := TO_NUMBER(get_value('w_iops_99'));
      l_instances.rw_iops_97 := TO_NUMBER(get_value('rw_iops_97'));
      l_instances.r_iops_97 := TO_NUMBER(get_value('r_iops_97'));
      l_instances.w_iops_97 := TO_NUMBER(get_value('w_iops_97'));
      l_instances.rw_iops_95 := TO_NUMBER(get_value('rw_iops_95'));
      l_instances.r_iops_95 := TO_NUMBER(get_value('r_iops_95'));
      l_instances.w_iops_95 := TO_NUMBER(get_value('w_iops_95'));
      -- older files missed 97
      IF l_instances.rw_iops_97 IS NULL THEN
        l_instances.rw_iops_97 := ROUND((l_instances.rw_iops_95 + l_instances.rw_iops_99) / 2);
        l_instances.r_iops_97 := ROUND((l_instances.r_iops_95 + l_instances.r_iops_99) / 2);
        l_instances.w_iops_97 := ROUND((l_instances.w_iops_95 + l_instances.w_iops_99) / 2);
      END IF;
      l_instances.rw_iops_90 := TO_NUMBER(get_value('rw_iops_90'));
      l_instances.r_iops_90 := TO_NUMBER(get_value('r_iops_90'));
      l_instances.w_iops_90 := TO_NUMBER(get_value('w_iops_90'));
      l_instances.rw_iops_75 := TO_NUMBER(get_value('rw_iops_75'));
      l_instances.r_iops_75 := TO_NUMBER(get_value('r_iops_75'));
      l_instances.w_iops_75 := TO_NUMBER(get_value('w_iops_75'));
      l_instances.rw_iops_median := TO_NUMBER(get_value('rw_iops_median'));
      l_instances.r_iops_median := TO_NUMBER(get_value('r_iops_median'));
      l_instances.w_iops_median := TO_NUMBER(get_value('w_iops_median'));
      l_instances.rw_iops_avg := TO_NUMBER(get_value('rw_iops_avg'));
      l_instances.r_iops_avg := TO_NUMBER(get_value('r_iops_avg'));
      l_instances.w_iops_avg := TO_NUMBER(get_value('w_iops_avg'));
      l_instances.r_mbps := TO_NUMBER(get_value('r_mbps_'||l_data_element_disk_perf));
      l_instances.w_mbps := TO_NUMBER(get_value('w_mbps_'||l_data_element_disk_perf));
      l_instances.rw_mbps_peak := TO_NUMBER(get_value('rw_mbps_peak'));
      l_instances.r_mbps_peak := TO_NUMBER(get_value('r_mbps_peak'));
      l_instances.w_mbps_peak := TO_NUMBER(get_value('w_mbps_peak'));
      l_instances.rw_mbps_999 := TO_NUMBER(get_value('rw_mbps_999'));
      l_instances.r_mbps_999 := TO_NUMBER(get_value('r_mbps_999'));
      l_instances.w_mbps_999 := TO_NUMBER(get_value('w_mbps_999'));
      l_instances.rw_mbps_99 := TO_NUMBER(get_value('rw_mbps_99'));
      l_instances.r_mbps_99 := TO_NUMBER(get_value('r_mbps_99'));
      l_instances.w_mbps_99 := TO_NUMBER(get_value('w_mbps_99'));
      l_instances.rw_mbps_97 := TO_NUMBER(get_value('rw_mbps_97'));
      l_instances.r_mbps_97 := TO_NUMBER(get_value('r_mbps_97'));
      l_instances.w_mbps_97 := TO_NUMBER(get_value('w_mbps_97'));
      l_instances.rw_mbps_95 := TO_NUMBER(get_value('rw_mbps_95'));
      l_instances.r_mbps_95 := TO_NUMBER(get_value('r_mbps_95'));
      l_instances.w_mbps_95 := TO_NUMBER(get_value('w_mbps_95'));
      -- older files missed 97
      IF l_instances.rw_mbps_97 IS NULL THEN
        l_instances.rw_mbps_97 := ROUND((l_instances.rw_mbps_95 + l_instances.rw_mbps_99) / 2);
        l_instances.r_mbps_97 := ROUND((l_instances.r_mbps_95 + l_instances.r_mbps_99) / 2);
        l_instances.w_mbps_97 := ROUND((l_instances.w_mbps_95 + l_instances.w_mbps_99) / 2);
      END IF;
      l_instances.rw_mbps_90 := TO_NUMBER(get_value('rw_mbps_90'));
      l_instances.r_mbps_90 := TO_NUMBER(get_value('r_mbps_90'));
      l_instances.w_mbps_90 := TO_NUMBER(get_value('w_mbps_90'));
      l_instances.rw_mbps_75 := TO_NUMBER(get_value('rw_mbps_75'));
      l_instances.r_mbps_75 := TO_NUMBER(get_value('r_mbps_75'));
      l_instances.w_mbps_75 := TO_NUMBER(get_value('w_mbps_75'));
      l_instances.rw_mbps_median := TO_NUMBER(get_value('rw_mbps_median'));
      l_instances.r_mbps_median := TO_NUMBER(get_value('r_mbps_median'));
      l_instances.w_mbps_median := TO_NUMBER(get_value('w_mbps_median'));
      l_instances.rw_mbps_avg := TO_NUMBER(get_value('rw_mbps_avg'));
      l_instances.r_mbps_avg := TO_NUMBER(get_value('r_mbps_avg'));
      l_instances.w_mbps_avg := TO_NUMBER(get_value('w_mbps_avg'));
      -- insert instance and get inst_id
      INSERT INTO instances VALUES l_instances RETURNING inst_id INTO l_inst_id;
      x_instance_count := x_instance_count + 1;
      DBMS_OUTPUT.PUT_LINE('instance       : '||l_instances.instance_name||' ('||l_inst_id||')');
      -- time series
      INSERT INTO time_series
      ( inst_id
      , end_time
      , on_cpu
      , resmgr_cpu_quantum
      , on_cpu_99p
      , resmgr_cpu_quantum_99p
      , on_cpu_97p
      , resmgr_cpu_quantum_97p
      , on_cpu_95p
      , resmgr_cpu_quantum_95p
      , on_cpu_90p
      , resmgr_cpu_quantum_90p
      , on_cpu_75p
      , resmgr_cpu_quantum_75p
      , on_cpu_med
      , resmgr_cpu_quantum_med
      , on_cpu_avg
      , resmgr_cpu_quantum_avg
      , sga_gb
      , pga_gb
      , r_iops
      , w_iops
      , r_mbps
      , w_mbps
      , perm
      , undo
      , temp
      , load
      , num_cpus
      , num_cpu_cores
      , physical_memory_gb
      )
      WITH
      c AS (
      SELECT category,
             data_element,
             source,
             NVL(MAX(esp_util.just_number(value)), 0) value -- expected only one value per group. this is just to avoid unexpected duplicates
        FROM collection
       WHERE collection_host = l_collection_host
         AND collection_key = l_databases.collection_key
         AND category IN ('cpu_ts', 'cpu_ts_99p', 'cpu_ts_97p', 'cpu_ts_95p', 'cpu_ts_90p', 'cpu_ts_75p', 'cpu_ts_med', 'cpu_ts_avg', 'mem_ts', 'disk_perf_ts', 'db_size_ts', 'os_ts')
         AND instance_number = l_instances.instance_number
       GROUP BY
             category,
             data_element,
             source
      ),
      a AS (
      SELECT DISTINCT source FROM c
      )
      SELECT l_inst_id inst_id,
             TO_DATE(a.source, 'YYYY-MM-DD/HH24:MI:SS') end_time,
             NVL(c01.value, 0) on_cpu,
             NVL(c02.value, 0) resmgr_cpu_quantum,
             NVL(c03.value, 0) on_cpu_99p,
             NVL(c04.value, 0) resmgr_cpu_quantum_99p,
             NVL(c28.value, ROUND((NVL(c03.value, 0) + NVL(c05.value, 0)) / 2)) on_cpu_97p,
             NVL(c29.value, ROUND((NVL(c04.value, 0) + NVL(c06.value, 0)) / 2)) resmgr_cpu_quantum_97p,
             NVL(c05.value, 0) on_cpu_95p,
             NVL(c06.value, 0) resmgr_cpu_quantum_95p,
             NVL(c07.value, 0) on_cpu_90p,
             NVL(c08.value, 0) resmgr_cpu_quantum_90p,
             NVL(c09.value, 0) on_cpu_75p,
             NVL(c10.value, 0) resmgr_cpu_quantum_75p,
             NVL(c11.value, 0) on_cpu_med,
             NVL(c12.value, 0) resmgr_cpu_quantum_med,
             NVL(c13.value, 0) on_cpu_avg,
             NVL(c14.value, 0) resmgr_cpu_quantum_avg,
             NVL(c15.value, 0) sga_gb,
             NVL(c16.value, 0) pga_gb,
             NVL(c17.value, 0) r_iops,
             NVL(c18.value, 0) w_iops,
             NVL(c19.value, 0) r_mbps,
             NVL(c20.value, 0) w_mbps,
             NVL(c21.value, 0) perm,
             NVL(c22.value, 0) undo,
             NVL(c23.value, 0) temp,
             NVL(c24.value, 0) load,
             NVL(c25.value, 0) num_cpus,
             NVL(c26.value, 0) num_cpu_cores,
             NVL(c27.value, 0) physical_memory_gb
        FROM a, c c01, c c02, c c03, c c04, c c05, c c06, c c07, c c08, c c09, c c10, c c11, c c12, c c13, c c14, c c15, c c16, c c17, c c18, c c19, c c20, c c21, c c22, c c23, c c24, c c25, c c26, c c27, c c28, c c29
       WHERE c01.source(+) = a.source AND c01.category(+) = 'cpu_ts'       AND c01.data_element(+) = 'ON CPU'
         AND c02.source(+) = a.source AND c02.category(+) = 'cpu_ts'       AND c02.data_element(+) = 'resmgr:cpu quantum'
         AND c03.source(+) = a.source AND c03.category(+) = 'cpu_ts_99p'   AND c03.data_element(+) = 'ON CPU'
         AND c04.source(+) = a.source AND c04.category(+) = 'cpu_ts_99p'   AND c04.data_element(+) = 'resmgr:cpu quantum'
         AND c28.source(+) = a.source AND c28.category(+) = 'cpu_ts_97p'   AND c28.data_element(+) = 'ON CPU'
         AND c29.source(+) = a.source AND c29.category(+) = 'cpu_ts_97p'   AND c29.data_element(+) = 'resmgr:cpu quantum'
         AND c05.source(+) = a.source AND c05.category(+) = 'cpu_ts_95p'   AND c05.data_element(+) = 'ON CPU'
         AND c06.source(+) = a.source AND c06.category(+) = 'cpu_ts_95p'   AND c06.data_element(+) = 'resmgr:cpu quantum'
         AND c07.source(+) = a.source AND c07.category(+) = 'cpu_ts_90p'   AND c07.data_element(+) = 'ON CPU'
         AND c08.source(+) = a.source AND c08.category(+) = 'cpu_ts_90p'   AND c08.data_element(+) = 'resmgr:cpu quantum'
         AND c09.source(+) = a.source AND c09.category(+) = 'cpu_ts_75p'   AND c09.data_element(+) = 'ON CPU'
         AND c10.source(+) = a.source AND c10.category(+) = 'cpu_ts_75p'   AND c10.data_element(+) = 'resmgr:cpu quantum'
         AND c11.source(+) = a.source AND c11.category(+) = 'cpu_ts_med'   AND c11.data_element(+) = 'ON CPU'
         AND c12.source(+) = a.source AND c12.category(+) = 'cpu_ts_med'   AND c12.data_element(+) = 'resmgr:cpu quantum'
         AND c13.source(+) = a.source AND c13.category(+) = 'cpu_ts_avg'   AND c13.data_element(+) = 'ON CPU'
         AND c14.source(+) = a.source AND c14.category(+) = 'cpu_ts_avg'   AND c14.data_element(+) = 'resmgr:cpu quantum'
         AND c15.source(+) = a.source AND c15.category(+) = 'mem_ts'       AND c15.data_element(+) = 'sga'
         AND c16.source(+) = a.source AND c16.category(+) = 'mem_ts'       AND c16.data_element(+) = 'pga'
         AND c17.source(+) = a.source AND c17.category(+) = 'disk_perf_ts' AND c17.data_element(+) = 'r_iops'
         AND c18.source(+) = a.source AND c18.category(+) = 'disk_perf_ts' AND c18.data_element(+) = 'w_iops'
         AND c19.source(+) = a.source AND c19.category(+) = 'disk_perf_ts' AND c19.data_element(+) = 'r_mbps'
         AND c20.source(+) = a.source AND c20.category(+) = 'disk_perf_ts' AND c20.data_element(+) = 'w_mbps'
         AND c21.source(+) = a.source AND c21.category(+) = 'db_size_ts'   AND c21.data_element(+) = 'perm'
         AND c22.source(+) = a.source AND c22.category(+) = 'db_size_ts'   AND c22.data_element(+) = 'undo'
         AND c23.source(+) = a.source AND c23.category(+) = 'db_size_ts'   AND c23.data_element(+) = 'temp'
         AND c24.source(+) = a.source AND c24.category(+) = 'os_ts'        AND c24.data_element(+) = 'load'
         AND c25.source(+) = a.source AND c25.category(+) = 'os_ts'        AND c25.data_element(+) = 'num_cpus'
         AND c26.source(+) = a.source AND c26.category(+) = 'os_ts'        AND c26.data_element(+) = 'num_cpu_cores'
         AND c27.source(+) = a.source AND c27.category(+) = 'os_ts'        AND c27.data_element(+) = 'physical_memory_gb';
      -- CPU Hourly Statitics
      SELECT MAX(on_cpu + resmgr_cpu_quantum),
             MAX(on_cpu),
             MAX(on_cpu_99p + resmgr_cpu_quantum_99p),
             MAX(on_cpu_99p),
             MAX(on_cpu_97p + resmgr_cpu_quantum_97p),
             MAX(on_cpu_97p),
             MAX(on_cpu_95p + resmgr_cpu_quantum_95p),
             MAX(on_cpu_95p),
             MAX(on_cpu_90p + resmgr_cpu_quantum_90p),
             MAX(on_cpu_90p),
             MAX(on_cpu_75p + resmgr_cpu_quantum_75p),
             MAX(on_cpu_75p),
             MAX(on_cpu_med + resmgr_cpu_quantum_med),
             MAX(on_cpu_med),
             MAX(on_cpu_avg + resmgr_cpu_quantum_avg),
             MAX(on_cpu_avg)
        INTO l_instances.cas_on_cpu_and_resmgr_max,
             l_instances.cas_on_cpu_max,
             l_instances.cas_on_cpu_and_resmgr_99p,
             l_instances.cas_on_cpu_99p,
             l_instances.cas_on_cpu_and_resmgr_97p,
             l_instances.cas_on_cpu_97p,
             l_instances.cas_on_cpu_and_resmgr_95p,
             l_instances.cas_on_cpu_95p,
             l_instances.cas_on_cpu_and_resmgr_90p,
             l_instances.cas_on_cpu_90p,
             l_instances.cas_on_cpu_and_resmgr_75p,
             l_instances.cas_on_cpu_75p,
             l_instances.cas_on_cpu_and_resmgr_med,
             l_instances.cas_on_cpu_med,
             l_instances.cas_on_cpu_and_resmgr_avg,
             l_instances.cas_on_cpu_avg
        FROM time_series
       WHERE inst_id = l_inst_id;
      IF l_cpu_method = 'HS' THEN
        IF l_cpu_statistic = 'PEAK' THEN
          IF l_include_resmgr_cpu_quantum = 'N' THEN
            l_instances.aas_cpu_demand := LEAST(l_cpu_cap, l_instances.cas_on_cpu_max);
          ELSE
            l_instances.aas_cpu_demand := LEAST(l_cpu_cap, l_instances.cas_on_cpu_and_resmgr_max);
          END IF;
        ELSIF l_cpu_statistic = '99' THEN
          IF l_include_resmgr_cpu_quantum = 'N' THEN
            l_instances.aas_cpu_demand := LEAST(l_cpu_cap, l_instances.cas_on_cpu_99p);
          ELSE
            l_instances.aas_cpu_demand := LEAST(l_cpu_cap, l_instances.cas_on_cpu_and_resmgr_99p);
          END IF;
        ELSIF l_cpu_statistic = '97' THEN
          IF l_include_resmgr_cpu_quantum = 'N' THEN
            l_instances.aas_cpu_demand := LEAST(l_cpu_cap, l_instances.cas_on_cpu_97p);
          ELSE
            l_instances.aas_cpu_demand := LEAST(l_cpu_cap, l_instances.cas_on_cpu_and_resmgr_97p);
          END IF;
        ELSIF l_cpu_statistic = '95' THEN
          IF l_include_resmgr_cpu_quantum = 'N' THEN
            l_instances.aas_cpu_demand := LEAST(l_cpu_cap, l_instances.cas_on_cpu_95p);
          ELSE
            l_instances.aas_cpu_demand := LEAST(l_cpu_cap, l_instances.cas_on_cpu_and_resmgr_95p);
          END IF;
        ELSIF l_cpu_statistic = '90' THEN
          IF l_include_resmgr_cpu_quantum = 'N' THEN
            l_instances.aas_cpu_demand := LEAST(l_cpu_cap, l_instances.cas_on_cpu_90p);
          ELSE
            l_instances.aas_cpu_demand := LEAST(l_cpu_cap, l_instances.cas_on_cpu_and_resmgr_90p);
          END IF;
        ELSIF l_cpu_statistic = '75' THEN
          IF l_include_resmgr_cpu_quantum = 'N' THEN
            l_instances.aas_cpu_demand := LEAST(l_cpu_cap, l_instances.cas_on_cpu_75p);
          ELSE
            l_instances.aas_cpu_demand := LEAST(l_cpu_cap, l_instances.cas_on_cpu_and_resmgr_75p);
          END IF;
        ELSIF l_cpu_statistic = 'MEDIAN' THEN
          IF l_include_resmgr_cpu_quantum = 'N' THEN
            l_instances.aas_cpu_demand := LEAST(l_cpu_cap, l_instances.cas_on_cpu_med);
          ELSE
            l_instances.aas_cpu_demand := LEAST(l_cpu_cap, l_instances.cas_on_cpu_and_resmgr_med);
          END IF;
        ELSIF l_cpu_statistic = 'AVG' THEN
          IF l_include_resmgr_cpu_quantum = 'N' THEN
            l_instances.aas_cpu_demand := LEAST(l_cpu_cap, l_instances.cas_on_cpu_avg);
          ELSE
            l_instances.aas_cpu_demand := LEAST(l_cpu_cap, l_instances.cas_on_cpu_and_resmgr_avg);
          END IF;
        END IF;
      END IF;
      UPDATE instances SET
          aas_cpu_demand            = l_instances.aas_cpu_demand
        , cas_on_cpu_and_resmgr_max = l_instances.cas_on_cpu_and_resmgr_max
        , cas_on_cpu_max            = l_instances.cas_on_cpu_max
        , cas_on_cpu_and_resmgr_99p = l_instances.cas_on_cpu_and_resmgr_99p
        , cas_on_cpu_99p            = l_instances.cas_on_cpu_99p
        , cas_on_cpu_and_resmgr_97p = l_instances.cas_on_cpu_and_resmgr_97p
        , cas_on_cpu_97p            = l_instances.cas_on_cpu_97p
        , cas_on_cpu_and_resmgr_95p = l_instances.cas_on_cpu_and_resmgr_95p
        , cas_on_cpu_95p            = l_instances.cas_on_cpu_95p
        , cas_on_cpu_and_resmgr_90p = l_instances.cas_on_cpu_and_resmgr_90p
        , cas_on_cpu_90p            = l_instances.cas_on_cpu_90p
        , cas_on_cpu_and_resmgr_75p = l_instances.cas_on_cpu_and_resmgr_75p
        , cas_on_cpu_75p            = l_instances.cas_on_cpu_75p
        , cas_on_cpu_and_resmgr_med = l_instances.cas_on_cpu_and_resmgr_med
        , cas_on_cpu_med            = l_instances.cas_on_cpu_med
        , cas_on_cpu_and_resmgr_avg = l_instances.cas_on_cpu_and_resmgr_avg
        , cas_on_cpu_avg            = l_instances.cas_on_cpu_avg
      WHERE inst_id = l_inst_id;
    END LOOP;
    -- CPU Hourly Statitics
    SELECT CASE l_cpu_method WHEN 'HS' THEN SUM(aas_cpu_demand) ELSE l_databases.aas_cpu_demand END,
           SUM(cas_on_cpu_and_resmgr_max),
           SUM(cas_on_cpu_max),
           SUM(cas_on_cpu_and_resmgr_99p),
           SUM(cas_on_cpu_99p),
           SUM(cas_on_cpu_and_resmgr_97p),
           SUM(cas_on_cpu_97p),
           SUM(cas_on_cpu_and_resmgr_95p),
           SUM(cas_on_cpu_95p),
           SUM(cas_on_cpu_and_resmgr_90p),
           SUM(cas_on_cpu_90p),
           SUM(cas_on_cpu_and_resmgr_75p),
           SUM(cas_on_cpu_75p),
           SUM(cas_on_cpu_and_resmgr_med),
           SUM(cas_on_cpu_med),
           SUM(cas_on_cpu_and_resmgr_avg),
           SUM(cas_on_cpu_avg)
      INTO l_databases.aas_cpu_demand,
           l_databases.cas_on_cpu_and_resmgr_max,
           l_databases.cas_on_cpu_max,
           l_databases.cas_on_cpu_and_resmgr_99p,
           l_databases.cas_on_cpu_99p,
           l_databases.cas_on_cpu_and_resmgr_97p,
           l_databases.cas_on_cpu_97p,
           l_databases.cas_on_cpu_and_resmgr_95p,
           l_databases.cas_on_cpu_95p,
           l_databases.cas_on_cpu_and_resmgr_90p,
           l_databases.cas_on_cpu_90p,
           l_databases.cas_on_cpu_and_resmgr_75p,
           l_databases.cas_on_cpu_75p,
           l_databases.cas_on_cpu_and_resmgr_med,
           l_databases.cas_on_cpu_med,
           l_databases.cas_on_cpu_and_resmgr_avg,
           l_databases.cas_on_cpu_avg
      FROM instances
     WHERE db_id = l_db_id;
    UPDATE databases SET
        aas_cpu_demand            = l_databases.aas_cpu_demand
      , cas_on_cpu_and_resmgr_max = l_databases.cas_on_cpu_and_resmgr_max
      , cas_on_cpu_max            = l_databases.cas_on_cpu_max
      , cas_on_cpu_and_resmgr_99p = l_databases.cas_on_cpu_and_resmgr_99p
      , cas_on_cpu_99p            = l_databases.cas_on_cpu_99p
      , cas_on_cpu_and_resmgr_97p = l_databases.cas_on_cpu_and_resmgr_97p
      , cas_on_cpu_97p            = l_databases.cas_on_cpu_97p
      , cas_on_cpu_and_resmgr_95p = l_databases.cas_on_cpu_and_resmgr_95p
      , cas_on_cpu_95p            = l_databases.cas_on_cpu_95p
      , cas_on_cpu_and_resmgr_90p = l_databases.cas_on_cpu_and_resmgr_90p
      , cas_on_cpu_90p            = l_databases.cas_on_cpu_90p
      , cas_on_cpu_and_resmgr_75p = l_databases.cas_on_cpu_and_resmgr_75p
      , cas_on_cpu_75p            = l_databases.cas_on_cpu_75p
      , cas_on_cpu_and_resmgr_med = l_databases.cas_on_cpu_and_resmgr_med
      , cas_on_cpu_med            = l_databases.cas_on_cpu_med
      , cas_on_cpu_and_resmgr_avg = l_databases.cas_on_cpu_and_resmgr_avg
      , cas_on_cpu_avg            = l_databases.cas_on_cpu_avg
    WHERE db_id = l_db_id;
    x_cpu_demand := x_cpu_demand + NVL(l_databases.aas_cpu_demand, 0);
    INSERT INTO db_per_plan (plan_id, db_id, target_instances) VALUES (x_plan_id, l_db_id, l_instances_count);
  END LOOP;

  COMMIT;
  x_error_msg := NVL(x_error_msg, 'no errors');

  DBMS_OUTPUT.PUT_LINE('plan_id        : '||x_plan_id        );
  DBMS_OUTPUT.PUT_LINE('file_rows      : '||x_file_rows      );
  DBMS_OUTPUT.PUT_LINE('collection_rows: '||x_collection_rows);
  DBMS_OUTPUT.PUT_LINE('host_count     : '||x_host_count     );
  DBMS_OUTPUT.PUT_LINE('database_count : '||x_database_count );
  DBMS_OUTPUT.PUT_LINE('instance_count : '||x_instance_count );
  DBMS_OUTPUT.PUT_LINE('cpu_demand     : '||x_cpu_demand     );
  DBMS_OUTPUT.PUT_LINE('mem_gb         : '||x_mem_gb         );
  DBMS_OUTPUT.PUT_LINE('disk_gb        : '||x_disk_gb        );
  DBMS_OUTPUT.PUT_LINE('rw_iops        : '||x_rw_iops        );
  DBMS_OUTPUT.PUT_LINE('rw_mbps        : '||x_rw_mbps        );
  DBMS_OUTPUT.PUT_LINE('error          : '||x_error_msg      );
END load_collection;

/* ------------------------------------------------------------------------- */

PROCEDURE load_collection
( p_client_id                  IN  NUMBER
, p_file_name                  IN  VARCHAR2 DEFAULT 'esp_requirements.csv'
, p_spec_id                    IN  NUMBER   DEFAULT -1
, p_plan_name                  IN  VARCHAR2 DEFAULT 'Plan Name'
, p_plan_desc                  IN  VARCHAR2 DEFAULT 'Plan Description'
, p_cpu_method                 IN  VARCHAR2 DEFAULT 'EH' /* Entire History (EH), Hourly Statistics (HS), Manual Entry (MA) */
, p_cpu_statistic              IN  VARCHAR2 DEFAULT NULL /* PEAK, 99.99, 99.9, 99, 97, 95, 90, 75, MEDIAN, AVG */
, p_include_resmgr_cpu_quantum IN  VARCHAR2 DEFAULT NULL /* N, Y */
, p_cap_to_num_cpus            IN  VARCHAR2 DEFAULT NULL /* N, Y */
, p_disk_performance_method    IN  VARCHAR2 DEFAULT 'IH' /* Instance History (IH), Database History (DH), Manual Entry (MA) */
, p_disk_performance_statistic IN  VARCHAR2 DEFAULT NULL /* PEAK, 99.9, 99, 97, 95, 90, 75, MEDIAN, AVG */
, p_file_source                IN  VARCHAR2 DEFAULT 'F' /* (F)ile, (E)xternal */
, p_file_id                    IN  NUMBER   DEFAULT TO_NUMBER(NULL)
)
IS
  l_plan_id         NUMBER;
  l_file_rows       NUMBER;
  l_collection_rows NUMBER;
  l_host_count      NUMBER;
  l_database_count  NUMBER;
  l_instance_count  NUMBER;
  l_cpu_demand      NUMBER;
  l_mem_gb          NUMBER;
  l_disk_gb         NUMBER;
  l_rw_iops         NUMBER;
  l_rw_mbps         NUMBER;
  l_error_msg       VARCHAR2(32767);
BEGIN
  load_collection (
    p_client_id                  => p_client_id                 ,
    p_file_name                  => p_file_name                 ,
    p_spec_id                    => p_spec_id                   ,
    p_plan_name                  => p_plan_name                 ,
    p_plan_desc                  => p_plan_desc                 ,
    p_cpu_method                 => p_cpu_method                ,
    p_cpu_statistic              => p_cpu_statistic             ,
    p_include_resmgr_cpu_quantum => p_include_resmgr_cpu_quantum,
    p_cap_to_num_cpus            => p_cap_to_num_cpus           ,
    p_disk_performance_method    => p_disk_performance_method   ,
    p_disk_performance_statistic => p_disk_performance_statistic,
    p_file_source                => p_file_source               ,
    p_file_id                    => p_file_id                   ,
    x_plan_id                    => l_plan_id                   ,
    x_file_rows                  => l_file_rows                 ,
    x_collection_rows            => l_collection_rows           ,
    x_host_count                 => l_host_count                ,
    x_database_count             => l_database_count            ,
    x_instance_count             => l_instance_count            ,
    x_cpu_demand                 => l_cpu_demand                ,
    x_mem_gb                     => l_mem_gb                    ,
    x_disk_gb                    => l_disk_gb                   ,
    x_rw_iops                    => l_rw_iops                   ,
    x_rw_mbps                    => l_rw_mbps                   ,
    x_error_msg                  => l_error_msg
  );
END load_collection;

/* ------------------------------------------------------------------------- */

FUNCTION esp_collection
( p_file_id IN NUMBER
)
RETURN collection_type_type_table PIPELINED
IS
  l_blob         BLOB;
  l_clob         CLOB;
  l_dest_offset  INTEGER := 1;
  l_src_offset   INTEGER := 1;
  l_lang_context INTEGER := DBMS_LOB.DEFAULT_LANG_CTX;
  l_warning      INTEGER;
  l_offset       INTEGER := 1;
  l_next_lf      INTEGER;
  l_line         VARCHAR2(32767);
  l_line_num     INTEGER := 0;
  l_line_offset  INTEGER;
  l_next_sep     INTEGER;
  r_collection_type collection_type;
BEGIN
  SELECT file_blob
    INTO l_blob
    FROM file_transfer
   WHERE file_id = p_file_id;

  DBMS_LOB.CREATETEMPORARY (
    lob_loc => l_clob,
    cache   => TRUE,
    dur     => DBMS_LOB.SESSION
  );

  DBMS_LOB.CONVERTTOCLOB (
    dest_lob     => l_clob,
    src_blob     => l_blob,
    amount       => DBMS_LOB.LOBMAXSIZE,
    dest_offset  => l_dest_offset,
    src_offset   => l_src_offset,
    blob_csid    => DBMS_LOB.DEFAULT_CSID,
    lang_context => l_lang_context,
    warning      => l_warning
  );

  WHILE l_offset < l_dest_offset
  LOOP
    l_next_lf := DBMS_LOB.INSTR(l_clob, CHR(10), l_offset);
    IF l_next_lf = 0 THEN -- last character is not a LF
      l_next_lf := l_dest_offset;
    END IF;
    l_line := REPLACE(REPLACE(DBMS_LOB.SUBSTR(l_clob, l_next_lf - l_offset, l_offset), CHR(13)), CHR(9)); -- remove possible CR and TAB
    l_line_num := l_line_num + 1;
    DBMS_OUTPUT.PUT_LINE(l_line_num||':'||l_line);
    l_offset := l_next_lf + 1;
    -- collection_host
    r_collection_type := collection_type(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
    l_line_offset := 1;
    l_next_sep := INSTR(l_line, ',', l_line_offset);
    r_collection_type.collection_host := NVL(SUBSTR(TRIM(SUBSTR(l_line, l_line_offset, l_next_sep - l_line_offset)), 1, 64), 'UNKNOWN'); -- old files may not have collection host
    -- collection_key
    l_line_offset := l_next_sep + 1;
    l_next_sep := INSTR(l_line, ',', l_line_offset);
    r_collection_type.collection_key  := SUBSTR(TRIM(SUBSTR(l_line, l_line_offset, l_next_sep - l_line_offset)), 1, 14);
    -- category
    l_line_offset := l_next_sep + 1;
    l_next_sep := INSTR(l_line, ',', l_line_offset);
    r_collection_type.category        := SUBSTR(TRIM(SUBSTR(l_line, l_line_offset, l_next_sep - l_line_offset)), 1, 12);
    -- data_element
    l_line_offset := l_next_sep + 1;
    l_next_sep := INSTR(l_line, ',', l_line_offset);
    r_collection_type.data_element    := SUBSTR(TRIM(SUBSTR(l_line, l_line_offset, l_next_sep - l_line_offset)), 1, 30);
    -- source
    l_line_offset := l_next_sep + 1;
    l_next_sep := INSTR(l_line, ',', l_line_offset);
    r_collection_type.source          := SUBSTR(TRIM(SUBSTR(l_line, l_line_offset, l_next_sep - l_line_offset)), 1, 30);
    -- instance_number
    l_line_offset := l_next_sep + 1;
    l_next_sep := INSTR(l_line, ',', l_line_offset);
    r_collection_type.instance_number := SUBSTR(TRIM(SUBSTR(l_line, l_line_offset, l_next_sep - l_line_offset)), 1, 15);
    -- inst_id
    l_line_offset := l_next_sep + 1;
    l_next_sep := INSTR(l_line, ',', l_line_offset);
    r_collection_type.inst_id         := SUBSTR(TRIM(SUBSTR(l_line, l_line_offset, l_next_sep - l_line_offset)), 1, 7);
    -- value
    r_collection_type.value           := SUBSTR(TRIM(SUBSTR(l_line, l_next_sep + 1)), 1, 256);
    -- return
    PIPE ROW(r_collection_type);
  END LOOP;

  DBMS_LOB.FREETEMPORARY(lob_loc => l_clob);
  RETURN;
END esp_collection;

/* ------------------------------------------------------------------------- */

FUNCTION conf_pie
( p_pln_cfg_id IN NUMBER
, p_databases  IN NUMBER DEFAULT 7
)
RETURN conf_alloc_perc_type_table PIPELINED
IS
  l_cpu_perc_other NUMBER;
  l_mem_perc_other NUMBER;
  l_disk_perc_other NUMBER;
  l_iops_perc_other NUMBER;
  l_mbps_perc_other NUMBER;
  r_conf_alloc_perc_type conf_alloc_perc_type;
BEGIN
  IF p_databases <= 0 THEN
    RETURN;
  END IF;

  SELECT SUM(cpu_perc_allocated), SUM(mem_perc_allocated), SUM(disk_perc_allocated), SUM(rw_iops_perc_allocated), SUM(rw_mbps_perc_allocated)
    INTO l_cpu_perc_other, l_mem_perc_other, l_disk_perc_other, l_iops_perc_other, l_mbps_perc_other
    FROM db_alloc_v2
   WHERE pln_cfg_id = p_pln_cfg_id;

  -- free
  r_conf_alloc_perc_type := conf_alloc_perc_type(NULL, 'free', NULL, 0, 0, 0, 0, 0);
  IF l_cpu_perc_other < 100 THEN
    r_conf_alloc_perc_type.cpu_perc := 100 - l_cpu_perc_other;
  END IF;
  IF l_mem_perc_other < 100 THEN
    r_conf_alloc_perc_type.mem_perc := 100 - l_mem_perc_other;
  END IF;
  IF l_disk_perc_other < 100 THEN
    r_conf_alloc_perc_type.disk_perc := 100 - l_disk_perc_other;
  END IF;
  IF l_iops_perc_other < 100 THEN
    r_conf_alloc_perc_type.iops_perc := 100 - l_iops_perc_other;
  END IF;
  IF l_mbps_perc_other < 100 THEN
    r_conf_alloc_perc_type.mbps_perc := 100 - l_mbps_perc_other;
  END IF;
  IF r_conf_alloc_perc_type.cpu_perc > 0 OR r_conf_alloc_perc_type.mem_perc > 0 OR r_conf_alloc_perc_type.disk_perc > 0 OR r_conf_alloc_perc_type.iops_perc > 0 OR r_conf_alloc_perc_type.mbps_perc > 0 THEN
    PIPE ROW(r_conf_alloc_perc_type);
  END IF;

  -- databases
  FOR i IN (SELECT dbid,
                   db_name,
                   db_unique_name,
                   cpu_perc_allocated cpu_perc,
                   mem_perc_allocated mem_perc,
                   disk_perc_allocated disk_perc,
                   rw_iops_perc_allocated iops_perc,
                   rw_mbps_perc_allocated mbps_perc
              FROM db_alloc_v2
             WHERE pln_cfg_id = p_pln_cfg_id
             ORDER BY
                   cpu_perc_allocated DESC,
                   db_name)
  LOOP
    r_conf_alloc_perc_type.dbid           := i.dbid;
    r_conf_alloc_perc_type.db_name        := i.db_name;
    r_conf_alloc_perc_type.db_unique_name := i.db_unique_name;
    r_conf_alloc_perc_type.cpu_perc       := i.cpu_perc;
    r_conf_alloc_perc_type.mem_perc       := i.mem_perc;
    r_conf_alloc_perc_type.disk_perc      := i.disk_perc;
    r_conf_alloc_perc_type.iops_perc      := i.iops_perc;
    r_conf_alloc_perc_type.mbps_perc      := i.mbps_perc;
    PIPE ROW(r_conf_alloc_perc_type);

    l_cpu_perc_other := l_cpu_perc_other - i.cpu_perc;
    l_mem_perc_other := l_mem_perc_other - i.mem_perc;
    l_disk_perc_other := l_disk_perc_other - i.disk_perc;
    l_iops_perc_other := l_iops_perc_other - i.iops_perc;
    l_mbps_perc_other := l_mbps_perc_other - i.mbps_perc;
  END LOOP;

  -- other
  r_conf_alloc_perc_type := conf_alloc_perc_type(NULL, 'other', NULL, l_cpu_perc_other, l_mem_perc_other, l_disk_perc_other, l_iops_perc_other, l_mbps_perc_other);
  IF r_conf_alloc_perc_type.cpu_perc > 0 OR r_conf_alloc_perc_type.mem_perc > 0 OR r_conf_alloc_perc_type.disk_perc > 0 OR r_conf_alloc_perc_type.iops_perc > 0 OR r_conf_alloc_perc_type.mbps_perc > 0 THEN
    PIPE ROW(r_conf_alloc_perc_type);
  END IF;

  RETURN;
END conf_pie;

FUNCTION node_pie
( p_pln_cfg_id IN NUMBER
, p_srv_node   IN NUMBER
, p_databases  IN NUMBER DEFAULT 7
)
RETURN node_alloc_perc_type_table PIPELINED
IS
  l_cpu_perc_other NUMBER;
  l_mem_perc_other NUMBER;
  r_node_alloc_perc_type node_alloc_perc_type;
BEGIN
  IF p_databases <= 0 THEN
    RETURN;
  END IF;

  SELECT SUM(cpu_perc_allocated), SUM(mem_perc_allocated)
    INTO l_cpu_perc_other, l_mem_perc_other
    FROM inst_alloc_v2
   WHERE pln_cfg_id = p_pln_cfg_id
     AND srv_node = p_srv_node;

  -- free
  r_node_alloc_perc_type := node_alloc_perc_type(NULL, 'free', NULL, 0, 0);
  IF l_cpu_perc_other < 100 THEN
    r_node_alloc_perc_type.cpu_perc := 100 - l_cpu_perc_other;
  END IF;
  IF l_mem_perc_other < 100 THEN
    r_node_alloc_perc_type.mem_perc := 100 - l_mem_perc_other;
  END IF;
  IF r_node_alloc_perc_type.cpu_perc > 0 OR r_node_alloc_perc_type.mem_perc > 0 THEN
    PIPE ROW(r_node_alloc_perc_type);
  END IF;

  -- databases
  FOR i IN (SELECT dbid,
                   db_name,
                   db_unique_name,
                   cpu_perc_allocated cpu_perc,
                   mem_perc_allocated mem_perc
              FROM inst_alloc_v2
             WHERE pln_cfg_id = p_pln_cfg_id
               AND srv_node = p_srv_node
             ORDER BY
                   cpu_perc_allocated DESC,
                   db_name)
  LOOP
    r_node_alloc_perc_type.dbid           := i.dbid;
    r_node_alloc_perc_type.db_name        := i.db_name;
    r_node_alloc_perc_type.db_unique_name := i.db_unique_name;
    r_node_alloc_perc_type.cpu_perc       := i.cpu_perc;
    r_node_alloc_perc_type.mem_perc       := i.mem_perc;
    PIPE ROW(r_node_alloc_perc_type);

    l_cpu_perc_other := l_cpu_perc_other - i.cpu_perc;
    l_mem_perc_other := l_mem_perc_other - i.mem_perc;
  END LOOP;

  -- other
  r_node_alloc_perc_type := node_alloc_perc_type(NULL, 'other', NULL, l_cpu_perc_other, l_mem_perc_other);
  IF r_node_alloc_perc_type.cpu_perc > 0 OR r_node_alloc_perc_type.mem_perc > 0 THEN
    PIPE ROW(r_node_alloc_perc_type);
  END IF;

  RETURN;
END node_pie;

END esp_util;

/
