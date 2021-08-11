

# 조건문

# IF : IF(조건, 참, 거짓)
# 도시의 인구가 100만 이상, big city, 100만 미만 small city
SELECT name, Population, IF(Population >= 1000000, 'BIG CITY', 'SMALL CITY') AS city_scale FROM city;

# IFNULL
# IFNULL : IFNULL(NULL아닐 때, NULL일 때)
# Country테이블에서 독립년도(IndepYear) 가 없으면 0으로 출력 
SELECT Name, IFNULL(IndepYear, 0) AS IndepYear
FROM country;


# CASE
# CASE 
# WHEN (조건1) THEN (출력1)
# WHEN (조건2) THEN (출력2)
# END AS (컬럼명)

# 나라별 10억 이상, 1억 이상, 1억 이하 조건을 출력 
SELECT Name, Population,
CASE 
	WHEN Population >= 1000000000 THEN "upper 1 bilion"
	WHEN Population >= 100000000 THEN "upper 100 million"
	ELSE "below 100 milion"
END AS result
FROM country;


Error Code: 1054. Unknown column 'Name' in 'field list'
