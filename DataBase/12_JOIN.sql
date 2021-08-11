USE world;

CREATE TABLE user (
user_id int(11) unsigned NOT NULL AUTO_INCREMENT, 
name varchar(30) DEFAULT NULL,
PRIMARY KEY (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE addr (
id int(11) unsigned NOT NULL AUTO_INCREMENT, 
addr varchar(30) DEFAULT NULL,
user_id int(11) DEFAULT NULL,
PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO user(name) VALUES ("jin"),
("po"),
("alice"),
("petter");

INSERT INTO addr(addr, user_id) VALUES ("seoul", 1),
("pusan", 2),
("deajeon", 3),
("deagu", 5), ("seoul", 6);


#########START FROM HERE########

# INNER JOIN = JOIN
SELECT *
FROM addr 
JOIN user;

SELECT *
FROM addr 
JOIN user
ON addr.user_id = user.user_id;

SELECT addr.addr, addr.user_id, user.name
FROM addr 
JOIN user
ON addr.user_id = user.user_id;

# WORLD 도시이름, 국가이름을 출력 
USE world;
SELECT country.Name, city.Name
FROM country
JOIN city 
ON country.Code = city.CountryCode;


# LEFT JOIN = LEFT OUTER JOIN
USE world;

SELECT id, addr.addr, addr.user_id, IFNULL(user.name, "NO VALUES")
FROM addr
LEFT OUTER JOIN user
ON addr.user_id = user.user_id;


# RIGHT JOIN = RIGHT OUTER JOIN

SELECT id, addr.addr, user.user_id, IFNULL(user.name, "NO VALUES")
FROM addr
RIGHT OUTER JOIN user
ON addr.user_id = user.user_id;


# OUTER JOIN(MYSQL에 없음, UNION으로 만들어야 함)
# UNION : SELECT문의 결과를 합쳐서 출력
# 자동으로 중복을 제거해줌. 
SELECT name
FROM user
UNION
SELECT addr
FROM addr;


# UNION ALL: 중복 제거 X
SELECT name
FROM user
UNION ALL
SELECT addr
FROM addr;

# OUTER JOIN
(SELECT user.name, addr.addr 
FROM user
LEFT JOIN addr 
ON user.user_id = addr.user_id)
UNION 
(SELECT user.name, addr.addr 
FROM user
RIGHT JOIN addr 
ON user.user_id = addr.user_id);


