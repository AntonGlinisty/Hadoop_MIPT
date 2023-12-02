USE glinistyjan;

ADD FILE ./reverse.py;

SELECT TRANSFORM(ip)
USING 'python3 reverse.py' AS reverse
FROM Logs LIMIT 10
