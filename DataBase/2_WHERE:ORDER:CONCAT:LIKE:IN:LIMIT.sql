
# WHERE
SELECT * FROM user1 
WHERE age >= 30;

SELECT * FROM user1 
WHERE age = 28;

SELECT * FROM user1 
WHERE age != 28;

SELECT DISTINCT(name) FROM user1 
WHERE age = 28;

SELECT COUNT(DISTINCT(name)) FROM user1 
WHERE age = 28;

SELECT * FROM user1 
WHERE age >= 28 AND age <  40;


# BETWEEN
SELECT name FROM user1 
WHERE age BETWEEN  28 AND 40;

# ORDER BY
# DEFAULT ASC

SELECT * 
FROM user1
ORDER BY age ASC;

SELECT * 
FROM user1
ORDER BY age DESC;

SELECT * 
FROM user1
ORDER BY age DESC, name ASC;

# 나이가 20세 ~ 40세 사이에 있는 사용자를 이름 순으로 정렬하고, 중복 데이터를 제거해서 출력
SELECT DISTINCT(name)
FROM user1
WHERE age BETWEEN 20 AND 40
ORDER BY name DESC;


# CONCAT
SELECT name, age, CONCAT(name, " and ",age) AS "name_age"
FROM user1;


# LIKE : where 절에서, 특정 문자열이 들어간 데이터 조회
SELECT * 
FROM user1 
WHERE email LIKE "%@gmail.%";

SELECT * 
FROM user1 
WHERE email NOT LIKE "%@gmail.%";

SELECT * 
FROM user1 
WHERE email LIKE "p%";

# IN
SELECT * 
FROM user1 
WHERE name IN  ('SON', 'LEE');

# Subquery is mainly used with Subquery. 
SELECT * 
FROM user1 
WHERE name IN  (
		SELECT DISTINCT(name) 
		FROM user1 
		WHERE age > 30
);

# LIMIT
SELECT * FROM user1 LIMIT 3;

#  3번째부터 밑으로 5개 의미 
SELECT * FROM user1 LIMIT 3, 5;










