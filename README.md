# Design and Implementation of T-mall User Shopping Data Analysis System Based on Hadoop Platform 

## Overview
This project takes the e-commerce platform Tmall as an example to analyzes user shopping data. Based on Hadoop platform technologies, the data is stored,processed,analyzed,and displayed to obtain representative analytical results.
## Core Functionalities
Based on Hadoop platform technologies (such as Spark, Hive, and other Hadoop-based software), this project analyzes user behavior on e-commerce websites (such as browsing, shopping, and adding items to favorites) to obtain representative analytical results. The main functional modules are data storage, analysis, and results display.
## Installation & Execution
### Prerequisites and installations
#### Used Software and Configuration with Remarks
- **CentOS6.4** --Linux Development Environment under a virtual machine
 - **hadoop-2.6.0-cdh5.7.0** --Hadoop software
 - **spark-2.2.0-bin-2.6.0-cdh5.7.0**-- Spark software
 - **hive-1.1.0-cdh5.7.0** --Data warehouse
 - **MySQL5.1.73** -- Database, relational database
 -  **SecureCRT** --Tool for remotely connecting to and managing Linux systems
 - **Xftp**  --Tool for uploading files from Windows to a virtual machine
 - **IntelliJ IDEA Community** -- Tool for implementing data analysis code
 - **Navicat Premium** --Connect to a MySQL database in a virtual machine to view data
 - **SpringBoot** --Tool for implementing a visualization front-end
 - **Echarts** --Used for drawing visualizations
####  Installation Steps 
**Step 1:** Download and install VMware Workstation Pro and CentOS 6 CD image files to Install a virtual machine.

**Step 2:** Create a dedicated directory for the virtual machine, create a new virtual machine and select this directory and select to install the Linux system.
**Step 3:**  Check if there is a network connection, and try pinging the network after setting the IP address and automatic startup settings in the vi editor.
```
ip addr
vi /etc/sysconfig/network-scripts/ifcfg-ens33 
```
##### In the vi editor, enter `i` to enter insert mode and modify the code in the editor
```
TYPE=Ethernet
PROXY METHOD=none
BROWSER ONLY=no
BOOTPROTO=static
IPADDR=192.168.1.7 
#(set the fixed IP address to 192.168.1.7)
PREFIX=24
GATEWAY=192.168.1.1
MATMASK=255.255.255.0(subnet mask)
INM-CONTROLLED=yes
DNS1=8.8.8.8
DNS2=8.8.4.4
DEVICE=ens33
ONBOOT=yes
```
##### Press the `Esc` key to exit edit mode, then enter 'wq’ to save and exit the editor
```
sudo service network restart
ip addr
ping -c 3 www.baidu.com
```
##### Configure the host mapping file
Input `vi /etc/hosts`and enter the hostname and IP address in the editor,then save and exit to ping both the virtual machine and the host machine.

**Step 4:** Setting up a Hadoop cluster
##### Install JDK：Upload the jdk.rpm file from Windows to the Linux system and place it in  `/usr/java`directory 

`mkdir /usr/java`

##### Add the paths and environment variables for JAVA_HOME, JRE_HOME, PATH, and CLASSPATH to the configuration file `/etc/profile`
```
export JAVA_HOME=/usr/java/jdk1.8.0_311-amd64
export CLASSPATH=.:$JAVA_HOME/jre/lib/rt.jar:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export PATH=$PATH:$JAVA_HOME/bin
```
##### Save and exit the editor, then type `source /etc/profile` to apply the changes to the configuration file, and use the `java -version` command to check the version number. A successful installation will display the version number.
##### Disable the firewall
```
Systemctl status firewalld  #check firewall status
Systemctl stop firewalld  #disable the firewall
Systemctl disable firewalld
```
##### Install and open hadoop 
```
ssh-keygen -t rsa
ssh-copy-id -i localhost
ssh localhost

su - root	
cd /home/hadoop/app
ls -l
cd hadoop-2.6.0-cdh5.7.0/
pwd
start-all.sh/start-dfs.sh
cd sbin
sh start-all.sh

jps
```	
```
ResourceManager -- Resource Manager [Responsible for the allocation and scheduling of overall system resources]

NodeManager -- Node Manager [Responsible for the management of NameNodes and DataNodes]

NameNode -- NameNode [Responsible for recording data metadata]

DataNode -- DataNode [Responsible for storing data]

SecondaryNameNode -- Secondary NameNode [Responsible for backing up the NameNode]	
```
##### Hadoop common commands and examples
###### List all contents in the root directory
```
hdfs dfs -ls /
```
###### List all contents of a specific directory
```
hdfs dfs -ls /name of the directory

hdfs dfs -ls /data
```
###### Create a directory
```
hdfs dfs -mkdir /name of the directory

hdfs dfs -mkdir /data/testdirectory

hdfs dfs -ls /data/
```
###### Upload files
```
hdfs dfs -put filename directory of hdfs

hdfs dfs -put zookeeper.out /data/
```
###### Download files
```
hdfs dfs -get files in hdfs_directory linux_directory

hdfs dfs -get /data/blacklist.txt .

hdfs dfs -get /data/blacklist.txt /tmp
```
###### Stop process
```
stop-all.sh
```

**Step 5:**  Install MySQL
##### Install MySQL database,start and connect the virtual machine to MySQL.
```
apt-get install mysql-server mysql-client
lsof -i :3306
service mysqld start(or lsof -P -i :3306)
mysql -uroot -pxxxx
mysql -uroot -p
```
##### MySQL common commands
###### Show datebase
```
show datebases
```
###### Use datebase
```
use datebase_name
```
###### Show tables of datebase
```
show tables
```
###### List the relevant fields of the table
```
desc table_name
```
###### Print all data of the table
```
select * from table_name
```
###### Print limited data of the table
```
select * from table_name limit number
```
###### Print the number of items in the current table
```
select count(1) from table_name
select count(1) 1_number from table_name
```
###### Find the quantity
```
select field_name,count(field_name) from table_name group by field_name
```
**Step 6:**  Install and open Hive
```
nohup hive --service metastore >/tmp/metastore.log 2>&1 &、nohup hive --service hiveserver2 >/tmp/hiveserver.log 2>&1 &
lsof -i :9083/lsof -i :10000

beeline -u jdbc:hive2://hadoop000:10000 --maxwidth=10000 --color=true。
```

**Step 7:**  Install and open Spark
```
sudo mkdir /apache
sudo chmod 777 /apach

 sed -i 's/\/home\/hadoop\/app\/spark-2.2.0-bin-2.6.0-cdh5.7.0/\/apache\/spark/g' /home/hadoop/.bash_profile

source /home/hadoop/.bash_profile。

cd /apache
wget [http://124.222.175.218/spark.zip](http://124.222.175.218/spark.zip)
wget [http://124.222.175.218/scala.zip](http://124.222.175.218/scala.zip)
wget [http://124.222.175.218/java.zip](http://124.222.175.218/java.zip)

unzip spark.zip
unzip scala.zip
unzip java.zip

cd /apache/spark
sbin/start-all.sh
(or cd/apache/spark/sbin/start-all.sh)

jps
Master
Worker
```
##### Run data analysis script commands
```
cd xxx.scala

spark-shell: -i xxxx-analysis.scala
(or spark-shell < xxx-analysis.scala)
```
##### If reporte SSL error, add `?useSSL=false`after the URL
```
val url = "jdbc:mysql://ip:3306/datebase?useSSL=false"
```
##### Press`ctrl+d` to exit
### Execution and analysis
#### Execution steps 
**Step 1:** Unzip and upload data
##### Upload the data
```
hdfs dfs -mkdir /dbtaobao
hdfs dfs -put xxx.csv /dbtaobao；
```
##### Create Hive
```
CREATE EXTERNAL TABLE dbtaobao.user_log(user_id int,item_id bigint, category_id bigint,behavior_type string,action_timestamp string) COMMENT’user_log_result’

ROW FORMAT DELIMITED

FIELDS TERMINATED BY’,’STORED AS TEXTFILE LOCATION ‘/dbtaobao’;

<![if !supportLists]> <![endif]>Process the table and create the corresponding processed table.

create table dbtaobao.user_log_result stored as orc as

select user_id,item_id,category_id,behavior_type,action_timestamp,from_unixtime(bigint(action_timestamp),'yyyy-MM-dd HH:mm:ss') date_time, from_unixtime(bigint(action_timestamp),'yyyy-MM-dd') action_date,from_unixtime(bigint(action_timestamp),'HH') action_hour from dbtaobao.user_log;
```
**Step 2:**  Analyzation code
```
val user_log_result = spark.read.table("dbtaobao.user_log_result")

user_log_result.show()
user_log_result.columns
user_log_result.dtypes
```
##### Configure database connection
```

import java.util.Properties

val properties = new Properties()

properties.setProperty("user","root")

properties.setProperty("password","root")

val url = "jdbc:mysql://localhost:3306/dbtaobao"
```

###### 1.pv_number
```
create table dbtaobao.pv_number stored as orc as select behavior_type,count(behavior_type) bt from user_log_result where behavior_type='pv' group by behavior_type;

val pv_number = user_log_result.select("behavior_type").filter("behavior_type='pv'").groupBy("behavior_type").count

pv_number.show()

pv_number.write.mode("overwrite").jdbc(url,"pv_number",properties)
```
###### 2. pv_day
```
create table dbtaobao.pv_day stored as orc as select actiondate,count(behavior_type) daybt from user_log_result where behavior_type='pv' group by actiondate order by actiondate;

val pv_day = user_log_result.filter("behavior_type = 'pv'").select("actiondate").groupBy("actiondate").count.orderBy("actiondate")

pv_day.show()

pv_day.write.mode("overwrite").jdbc(url,"pv_day",properties)
```
###### 3. hour_analysis
```
create table dbtaobao.hour_analysis stored as orc as select action_hour,count(action_hour) cnt from user_log_result group by action_hour;

val hour_analysis = user_log_result.select("action_hour").groupBy("action_hour").count

hour_analysis.show()

hour_analysis.write.mode("overwrite").jdbc(url,"hour_analysis",properties)
```
###### 4. user-id/user-name
```
create table dbtaobao.user_number stored as orc as select count(user_id) uid from user_log_result;

val user_number = user_log_result.groupBy("user_id").count.count

println("total quantity:" + user_number)
```
###### 5. userbt_number
```
create table dbtaobao.userbt_number stored as orc as select behavior_type, count(user_id) uid from user_log_result group by behavior_type;

val userbt_number = user_log_result.select("behavior_type","user_id").groupBy("behavior_type","user_id").count.groupBy("behavior_type").count

userbt_number.show()

userbt_number.write.mode("overwrite").jdbc(url,"userbt_number",properties)
```
###### 6.user_behavior
```
val user_buy_count = user_log_result.groupBy("user_id").count.count

val user_dupbuy_count = user_log_result.groupBy("user_id").count.filter("count >=2").count

val user_single_count = user_buy_count - user_dupbuy_count

duplicate_buy_rate = user_dupbuy_count/user_buy_count

val dup_buy_rate = user_dupbuy_count/user_buy_count
```
###### 7. shpping behaviour 
```
val user_behavior_analysis = user_log_result.groupBy("behavior_type").count

user_behavior_analysis.show()

user_behavior_analysis.write.mode("overwrite").jdbc(url,"user_behavior_analysis",properties)
```
######  8. User purchase behavior conversion rate
```
val user_buytyperate = user_log_result.
```
**Step 3:** Connect to the front end
```
Table structure for UserBehavior
DROP TABLE IF EXISTS `UserBehavior`;
CREATE TABLE `UserBehavior` (
`1` varchar(255) DEFAULT NULL,
`2268318` varchar(255) DEFAULT NULL,
`2520377` varchar(255) DEFAULT NULL,
`pv` varchar(255) DEFAULT NULL,
`1511544070` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

Records of UserBehavior
BEGIN;
COMMIT;
Table structure for allBuyUser
DROP TABLE IF EXISTS `allBuyUser`;
CREATE TABLE `allBuyUser` (
`allBuyUser` bigint(21) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

Records of allBuyUser
BEGIN;
INSERT INTO `allBuyUser` VALUES (6689);
COMMIT;

Table structure for allPv

DROP TABLE IF EXISTS `allPv`;
CREATE TABLE `allPv` (
`ALLPv` bigint(21) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
BEGIN;
INSERT INTO `allPv` VALUES (895636);
COMMIT;
Table structure for alluser
DROP TABLE IF EXISTS `alluser`;
CREATE TABLE `alluser` (
`allUser` bigint(21) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

Records of alluser
BEGIN;
INSERT INTO `alluser` VALUES (9739);
COMMIT;

Table structure for avgPv
DROP TABLE IF EXISTS `avgPv`;
CREATE TABLE `avgPv` (
`dates` date NOT NULL,
`avgPv` bigint(21) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
```
##### Startup class
```
package com.dmc;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class DMCApplicationTests {
   @Test
public void contextLoads() {
   }
}
```
