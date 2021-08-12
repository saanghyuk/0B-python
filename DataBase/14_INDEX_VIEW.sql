
# INDEX: 데이터를 검색할 때 빠르게 찾을 수 있도록 해주는 기능
# 색인

USE employees;

explain
SELECT COUNT(*) 
FROM salaries
WHERE to_Date > "2000-01-01"; # 0.524sec

SELECT *
FROM salaries
WHERE to_Date > "2000-01-01";

CREATE INDEX tdate 
ON salaries (to_date);

explain
SELECT COUNT(*) 
FROM salaries
WHERE to_Date > "2000-01-01"; # 0.524sec

ALTER TABLE salaries ADD INDEX f_date (from_date);


DROP INDEX tdate ON salaries;


# VIEW : 특정 쿼리문에 대한 결과를 저장하는 개념. 
USE world;
CREATE VIEW code_name AS
SELECT code, name FROM country;

SELECT * FROM city
JOIN code_name
ON city.countrycode = code_name.code;

