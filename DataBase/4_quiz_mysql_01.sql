USE world;

# 1. country 테이블에서 중복을 제거한 Continent를 조회하세요.
SELECT DISTINCT(Continent) 
FROM country
ORDER BY Continent;


# 2.  한국 도시중에 인구가 100만이 넘는 도시를 조회하여 인구순으로 내림차순하세요.
SELECT code FROM country WHERE Name Like "%KO%";

SELECT Name, Population 
FROM city 
WHERE CountryCode = "KOR" AND Population >= 1000000
ORDER BY Population DESC;


# 3. city 테이블에서 population이 800만 ~ 1000만 사이인 도시 데이터를 인구수순으로 내림차순하세요.
SELECT name, population, countrycode FROM city 
WHERE Population BETWEEN 8000000 AND 10000000
ORDER BY Population DESC;
 
# 4. country 테이블에서 1940 ~ 1950년도 사이에 독립한 국가들을 조회하고 독립한 년도 순으로 오름차순하세 요.
SHOW COLUMNS FROM country;
SELECT Code, CONCAT(Name, "(", IndepYear, ")") AS NameIndep, Continent, Population FROM country
WHERE IndepYear BETWEEN 1940 AND 1950
ORDER BY IndepYear ASC, Population DESC;


# 5.  contrylanguage 테이블에서 스페인어, 한국어, 영어를 95% 이상 사용하는 국가 코드를 Percentage로 내림차순하여 아래와 같이 조회하세요.

SELECT * FROM countrylanguage
WHERE Language IN ('English', 'Spanish', 'Korean')  AND Percentage >= 95
ORDER BY Percentage DESC;


# 6.  country 테이블에서 Code가 A로 시작하고 GovernmentForm에 Republic이 포함되는 데이터를 아래와 같이 조회하세요.
SHOW COLUMNS FROM country;
SELECT * FROM country
WHERE Code LIKE "A%" AND GovernmentForm LIKE "%Republic%";
