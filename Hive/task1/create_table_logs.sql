ADD JAR /opt/cloudera/parcels/CDH/lib/hive/lib/hive-contrib.jar;
ADD JAR /opt/cloudera/parcels/CDH/lib/hive/lib/hive-serde.jar;

USE glinistyjan;

SET hive.exec.dynamic.partition.mode=nonstrict;
SET hive.exec.max.dynamic.partitions=500;
SET hive.exec.max.dynamic.partitions.pernode=500;

DROP TABLE IF EXISTS UserLogs;

CREATE EXTERNAL TABLE UserLogs (
    ip STRING,
    request_date INT,
    request_data STRING,
    page_size SMALLINT,
    return_code SMALLINT,
    info STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.RegexSerDe'
WITH SERDEPROPERTIES (
    "input.regex" = '^(\\d+\\.\\d+\\.\\d+\\.\\d+)\t{3}(\\d{8})\\d+\\s+(\\S+)\\s+(\\d+)\\s+(\\d+)\\s+(.*)$'
)
STORED AS TEXTFILE
LOCATION '/data/user_logs/user_logs_M';

DROP TABLE IF EXISTS Logs;

CREATE EXTERNAL TABLE Logs (
    ip STRING,
    request_data STRING,
    page_size SMALLINT,
    return_code SMALLINT,
    info STRING
)
PARTITIONED BY (request_date INT)
STORED AS TEXTFILE;

INSERT OVERWRITE TABLE Logs PARTITION (request_date)
SELECT ip STRING,
	request_data STRING,
	page_size SMALLINT,
	return_code SMALLINT,
	info STRING,
	request_date INT
FROM UserLogs;

SELECT * FROM Logs LIMIT 10;
