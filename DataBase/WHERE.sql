
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



