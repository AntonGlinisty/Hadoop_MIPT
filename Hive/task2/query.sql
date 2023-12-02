USE glinistyjan;

SELECT request_date, count(*) AS count
FROM logs
GROUP BY request_date
ORDER BY count DESC;
