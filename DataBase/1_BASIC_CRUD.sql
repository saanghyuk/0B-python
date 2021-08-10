# Server - Database - Test

# Create

# 1-1 DataBase

SHOW DATABASES;

# CREATE
CREATE DATABASE test;

# CHOOSE
USE test;

# Check the current Database
SELECT DATABASE();

# 1-2 Table

# 제약조건이 없는 user1 테이블 생성 
CREATE TABLE user1(
user_id INT,
name Varchar(20), email Varchar(30), age INT(3),
rdate DATE
);

# 제약조건이 있는 user2 테이블 생성 
CREATE TABLE user2(
	user_id INT PRIMARY KEY AUTO_INCREMENT, 
    name Varchar(20) NOT NULL,
	email Varchar(30) UNIQUE NOT NULL,
	age INT(3) DEFAULT '30',
	rdate TIMESTAMP 
    );
    
    
# 2. Ammend

# 2-1 데이터베이스

# 인코딩 확인 및 변경
SHOW VARIABLES LIKE "character_set_database";
ALTER DATABASE test CHARACTER SET = utf8;
ALTER TABLE user2 CONVERT TO CHARACTER SET utf8;

# 2-2 테이블 

ALTER TABLE user2 ADD tmp TEXT;
ALTER TABLE user2 MODIFY COLUMN tmp INT(3);
ALTER TABLE user2 DROP COLUMN tmp;



# 3. Drop
 
 # 3-1 데이터베이스 삭제
 CREATE DATABASE tmp;
 DROP DATABASE tmp;
SHOW DATABASES;

# 3-2 Table Drop
SELECT DATABASE();
DROP TABLE user3;


# 4. Insert data into table
INSERT INTO user1 (user_id, name, email, age, rdate) 
VALUE (1, "SON", "saanghyuk@gmail.com", "32", now());
SELECT NOW();

# if multiple
INSERT INTO user1 (user_id, name, email, age, rdate) 
VALUE
(2, "SON", "saanghyuk@gmail.com", "28", now()),
(3, "SON", "saanghyuk@gmail.com", "28", now()),
(4, "SON", "saanghyuk@gmail.com", "28", now()),
(5, "SON", "saanghyuk@gmail.com", "28", now()),
(6, "SON", "saanghyuk@gmail.com", "28", now());


# 5. Select 

SELECT user_id, name, age
FROM user1;

SELECT * FROM user1;

# alias(as)
SELECT user_id AS "ID", name as "NAME", age as "AGE" FROM user1;

# DSITINCT
SELECT DISTINCT(user_id) FROM user1;








 







