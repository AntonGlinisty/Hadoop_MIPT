USE glinistyjan;

SELECT ip, request_date, request_data, page_size, return_code, SPLIT(info, ' ')[0] AS browser
FROM ( 
	SELECT TRANSFORM(ip, request_date, request_data, page_size, return_code, info)
	USING 'sed "s|.ru/|.com/|"' AS ip, request_date, request_data, page_size, return_code, info 
	FROM Logs
) AS domen LIMIT 10
