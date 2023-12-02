USE glinistyjan;

DROP TABLE IF EXISTS IPRegions;

CREATE EXTERNAL TABLE IPRegions (
    ip STRING,
    region STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.contrib.serde2.RegexSerDe'
WITH SERDEPROPERTIES (
    "input.regex" = '^(\\d+\\.\\d+\\.\\d+\\.\\d+)\\s+(.+)'
)
LOCATION '/data/user_logs/ip_data_M';

SELECT * FROM IPRegions LIMIT 10;