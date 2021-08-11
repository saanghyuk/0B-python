# 1. country 테이블에서 몇개의 대륙이 있는지 조회하세요.
SELECT COUNT(DISTINCT(Continent)) FROM country;

# 2. country 테이블에서 Continent(대륙)별 몇개의 나라가 있는지 조회하세요.
SELECT Continent, COUNT(*) AS count
FROM country
GROUP BY Continent
ORDER BY count DESC;

# 3. city 테이블에서 국가코드(CountryCode) 별로 총인구가 몇명인지 조회하고 총인구 순으로 내림차순하세요. (총인구가 5천만 이상인 도시만 출력)
SELECT CountryCode, SUM(Population) AS Population
FROM city
GROUP BY CountryCode
HAVING Population > 50000000
ORDER BY Population DESC;


# 4. countrylanguage 테이블에서 언어별 사용하는 국가수를 조회하고 많이 사용하는 언어를 5위에서 10위까지 조회하세요.
SELECT language, COUNT(*) FROM countrylanguage
GROUP BY language
ORDER BY COUNT(*) DESC
LIMIT 5, 6;

# 5. countrylanguage 테이블에서 언어별 15개 국가 이상에서 사용되는 언어를 조회하고 언어별 국가수에 따라 내림차순하세요.
SELECT language, COUNT(*) AS count FROM countrylanguage
GROUP BY language
HAVING count > 15
ORDER BY count DESC;



# 6. country 테이블에서 대륙별 전체 표면적크기를 구하고 표면적 크기 순으로 내림차순하세요.
SELECT Continent, SUM(SurfaceArea) AS surface_area FROM country
GROUP BY Continent
ORDER BY surface_area DESC;

