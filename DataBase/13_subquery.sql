# Sub-Query : 쿼리문 안에 쿼리가 있는 문법
# Select, from, where 절에서 다 쓸 수 있음. 



USE world;
# 전체 나라 수, 전체 도시 수, 전체 언어 수를 출력
# SELECT 절
SELECT
(SELECT COUNT(*)
FROM country) AS total_country, 
(SELECT COUNT(*)
FROM city) AS total_city,
(SELECT COUNT(DISTINCT(language))
FROM countrylanguage) AS total_language;

# FROM 
# 800만 이상이 되는 국가 코드, 이름, 도시 인구수를 출력
SELECT Code FROM country
WHERE Population > 8000000;


SELECT country_8.Code, country_8.Name, city.Name, city.Population FROM 
(SELECT Code, Name FROM country
WHERE Population > 8000000) AS country_8
LEFT OUTER JOIN city
ON country_8.Code = city.CountryCode;

# JOIN은 교집합만 출력
SELECT * 
FROM 
(SELECT countrycode, name, population 
FROM city
WHERE population >= 8000000) AS city
JOIN
(SELECT code, name
FROM country) AS country
ON city.countrycode = country.code;

SELECT countrycode, name, population 
FROM city
WHERE population >= 8000000;
SELECT code, name
FROM country;

# WHERE 절에 사용 
# 800만 이상 도시의 국가코드, 국가이름, 대통령 이름 출력
SELECT code, name, HeadOfState 
From country
WHERE Code in 
(SELECT Distinct(CountryCode) FROM city
WHERE Population > 8000000);



