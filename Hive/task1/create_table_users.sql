USE glinistyjan;

DROP TABLE IF EXISTS Users;

CREATE EXTERNAL TABLE Users (
    ip STRING,
    browser STRING,
    gender STRING,
    age STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.contrib.serde2.RegexSerDe'
WITH SERDEPROPERTIES (
    "input.regex" = '^(\\d+\\.\\d+\\.\\d+\\.\\d+)\\s+(\\S+)\\s+(\\w+)\\s+(\\d+)'
)
LOCATION '/data/user_logs/user_data_M';

SELECT * FROM Users LIMIT 10;
