use default;

CREATE TABLE `customer`(
  `c_custkey` int,
  `c_name` string,
  `c_address` string,
  `c_nationkey` int,
  `c_phone` string,
  `c_acctbal` decimal(12,2),
  `c_mktsegment` string,
  `c_comment` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  '/user/doris/tpch1.db/customer/'
TBLPROPERTIES (
  'transient_lastDdlTime'='1661955829');

CREATE TABLE `lineitem`(
  `l_orderkey` int,
  `l_partkey` int,
  `l_suppkey` int,
  `l_linenumber` int,
  `l_quantity` decimal(12,2),
  `l_extendedprice` decimal(12,2),
  `l_discount` decimal(12,2),
  `l_tax` decimal(12,2),
  `l_returnflag` string,
  `l_linestatus` string,
  `l_shipdate` date,
  `l_commitdate` date,
  `l_receiptdate` date,
  `l_shipinstruct` string,
  `l_shipmode` string,
  `l_comment` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  '/user/doris/tpch1.db/lineitem'
TBLPROPERTIES (
  'transient_lastDdlTime'='1661955829');

CREATE TABLE `nation`(
  `n_nationkey` int,
  `n_name` string,
  `n_regionkey` int,
  `n_comment` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  '/user/doris/tpch1.db/nation'
TBLPROPERTIES (
  'transient_lastDdlTime'='1661955829');

CREATE TABLE `orders`(
  `o_orderkey` int,
  `o_custkey` int,
  `o_orderstatus` string,
  `o_totalprice` decimal(12,2),
  `o_orderdate` date,
  `o_orderpriority` string,
  `o_clerk` string,
  `o_shippriority` int,
  `o_comment` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  '/user/doris/tpch1.db/orders'
TBLPROPERTIES (
  'transient_lastDdlTime'='1661955829');

CREATE TABLE `part`(
  `p_partkey` int,
  `p_name` string,
  `p_mfgr` string,
  `p_brand` string,
  `p_type` string,
  `p_size` int,
  `p_container` string,
  `p_retailprice` decimal(12,2),
  `p_comment` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  '/user/doris/tpch1.db/part'
TBLPROPERTIES (
  'transient_lastDdlTime'='1661955829');

CREATE TABLE `partsupp`(
  `ps_partkey` int,
  `ps_suppkey` int,
  `ps_availqty` int,
  `ps_supplycost` decimal(12,2),
  `ps_comment` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  '/user/doris/tpch1.db/partsupp'
TBLPROPERTIES (
  'transient_lastDdlTime'='1661955829');

CREATE TABLE `region`(
  `r_regionkey` int,
  `r_name` string,
  `r_comment` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  '/user/doris/tpch1.db/region'
TBLPROPERTIES (
  'transient_lastDdlTime'='1661955829');

CREATE TABLE `supplier`(
  `s_suppkey` int,
  `s_name` string,
  `s_address` string,
  `s_nationkey` int,
  `s_phone` string,
  `s_acctbal` decimal(12,2),
  `s_comment` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  '/user/doris/tpch1.db/supplier'
TBLPROPERTIES (
  'transient_lastDdlTime'='1661955829');

CREATE TABLE `partition_table`(
  `l_orderkey` int,
  `l_partkey` int,
  `l_suppkey` int,
  `l_linenumber` int,
  `l_quantity` decimal(12,2),
  `l_extendedprice` decimal(12,2),
  `l_discount` decimal(12,2),
  `l_tax` decimal(12,2),
  `l_returnflag` string,
  `l_linestatus` string,
  `l_shipdate` date,
  `l_commitdate` date,
  `l_receiptdate` date,
  `l_shipinstruct` string,
  `l_shipmode` string,
  `l_comment` string)
partitioned by (nation string, city string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  '/user/doris/parquet/partition_table'
TBLPROPERTIES (
  'transient_lastDdlTime'='1661955829');

msck repair table partition_table;

CREATE EXTERNAL TABLE IF NOT EXISTS `orc_all_types`(
  `tinyint_col` tinyint,
  `smallint_col` smallint,
  `int_col` int,
  `bigint_col` bigint,
  `boolean_col` boolean,
  `float_col` float,
  `double_col` double,
  `string_col` string,
  `binary_col` binary,
  `timestamp_col` timestamp,
  `decimal_col` decimal(12,4),
  `char_col` char(50),
  `varchar_col` varchar(50),
  `date_col` date,
  `list_double_col` array<double>,
  `list_string_col` array<string>)
PARTITIONED BY (
  `p1_col` string,
  `p2_col` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.orc.OrcSerde'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.orc.OrcInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.orc.OrcOutputFormat'
LOCATION
  '/user/doris/orc/orc_all_types';

msck repair table orc_all_types;

CREATE TABLE `student` (
  id varchar(50),
  name varchar(50),
  age int,
  gender varchar(50),
  addr varchar(50),
  phone varchar(50)
)
ROW FORMAT DELIMITED FIELDS TERMINATED by ','
LOCATION '/user/doris/data_case/student'
TBLPROPERTIES ('transient_lastDdlTime'='1658816839');

CREATE TABLE `lineorder` (
  `lo_orderkey` int, 
  `lo_linenumber` int,
  `lo_custkey` int, 
  `lo_partkey` int, 
  `lo_suppkey` int, 
  `lo_orderdate` int, 
  `lo_orderpriority` varchar(16),
  `lo_shippriority` int, 
  `lo_quantity` int, 
  `lo_extendedprice` int, 
  `lo_ordtotalprice` int, 
  `lo_discount` int,
  `lo_revenue` int,
  `lo_supplycost` int, 
  `lo_tax` int, 
  `lo_commitdate` int, 
  `lo_shipmode` varchar(11) 
)
ROW FORMAT DELIMITED FIELDS TERMINATED by ','
LOCATION '/user/doris/data_case/lineorder'
TBLPROPERTIES ('transient_lastDdlTime'='1658816839');

CREATE TABLE `test1` (
  col_1 int,
  col_2 varchar(20),
  col_3 int,
  col_4 int,
  col_5 varchar(20)
)
ROW FORMAT DELIMITED FIELDS TERMINATED by ','
LOCATION '/user/doris/data_case/test1'
TBLPROPERTIES ('transient_lastDdlTime'='1658816839');

CREATE TABLE `string_table` (
  p_partkey string,
  p_name string,
  p_mfgr string,
  p_brand string,
  p_type string,
  p_size string,
  p_con string,
  p_r_price string,
  p_comment string
)
ROW FORMAT DELIMITED FIELDS TERMINATED by ','
LOCATION '/user/doris/data_case/string_table'
TBLPROPERTIES ('transient_lastDdlTime'='1658816839');

CREATE TABLE `account_fund` (
  `batchno` string,
  `appsheet_no` string,
  `filedate` string,
  `t_no` string,
  `tano` string,
  `t_name` string,
  `chged_no` string,
  `mob_no2` string,
  `home_no` string,
  `off_no` string
)
ROW FORMAT DELIMITED FIELDS TERMINATED by ','
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  '/user/doris/data_case/account_fund'
TBLPROPERTIES ('transient_lastDdlTime'='1658816839');

create table sale_table (
  `bill_code` varchar(500),
  `dates` varchar(500),
  `ord_year` varchar(500),
  `ord_month` varchar(500),
  `ord_quarter` varchar(500),
  `on_time` varchar(500)
)
ROW FORMAT DELIMITED FIELDS TERMINATED by ','
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
    'org.apache.hadoop.hive.ql.io.orc.OrcOutputFormat'
LOCATION
  '/user/doris/data_case/sale_table'
TBLPROPERTIES ('transient_lastDdlTime'='1658816839');

create table t_hive (
  `k1` int,
  `k2` char(10),
  `k3` date,
  `k5` varchar(20),
  `k6` double
)
ROW FORMAT DELIMITED FIELDS TERMINATED by ','
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  '/user/doris/data_case/t_hive'
TBLPROPERTIES ('transient_lastDdlTime'='1658816839');

create table hive01 (
  first_year int,
  d_disease varchar(200),
  i_day int,
  card_cnt bigint
)
ROW FORMAT DELIMITED FIELDS TERMINATED by ','
LOCATION
  '/user/doris/data_case/hive01'
TBLPROPERTIES ('transient_lastDdlTime'='1658816839');

CREATE TABLE test2 (
id int,
name string ,
age string ,
avg_patient_time double,
dt date
)
row format delimited fields terminated by ','
stored as textfile
LOCATION '/user/doris/data_case/test2'
TBLPROPERTIES ('transient_lastDdlTime'='1658816839');

create table test_hive_doris(
id varchar(100),
age varchar(100)
)
row format delimited fields terminated by ','
stored as textfile
LOCATION '/user/doris/data_case/test_hive_doris'
TBLPROPERTIES ('transient_lastDdlTime'='1658816839');


show tables;

