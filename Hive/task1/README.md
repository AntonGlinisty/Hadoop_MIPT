### Задача

##### Cоздать внешние (EXTERNAL) таблицы по исходным данным. В результате будет 4 таблицы: логи пользователей, данные ip адресов, данные пользователей и подсети. Из таблицы логов перенести данные в другую таблицу, партицированную по датам – одна партиция на каждый день. На партиционированных таблицах и нужно будет выполнять запросы в следующих задачах.
##### Требуется, чтобы сериализация и десериализация данных осуществлялась с использованием регулярных выражений (см. org.apache.hadoop.hive.contrib.serde2.RegexSerDe, org.apache.hadoop.hive.serde2.RegexSerDe).
##### Проверить правильность создания таблиц с помощью простейших запросов (SELECT * FROM <table> LIMIT 10). Эти Select запросы нужно также добавлять в скрипт задачи.