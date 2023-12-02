USE glinistyjan;
SET hive.auto.convert.join=true;

add jar /opt/cloudera/parcels/CDH/lib/hive/lib/hive-contrib.jar;
add jar /opt/cloudera/parcels/CDH/lib/hive/lib/hive-serde.jar;

SELECT region, SUM(males) AS males, SUM(females) AS females
FROM (
   SELECT
      region,
      IF(gender='male', 1, 0) AS males,
      IF(gender='female', 1, 0) AS females
   FROM IPRegions JOIN Users on Users.ip = IPRegions.ip
) AS table
GROUP BY region;
