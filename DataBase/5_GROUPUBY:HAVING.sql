
# city table에서 나라별 도시의 갯수를 출력
# GROUP BY
SELECT CountryCode, COUNT(CountryCode) AS count
FROM city
GROUP BY CountryCode;

# countrylanguage table에서 전체 언어의 갯수를 출력
SELECT * FROM countrylanguage;
SELECT COUNT(DISTINCT(Language)) FROM countrylanguage;

# 대륙 별 인구수와 GNP의 최댓값을 출력
SELECT Continent , MAX(GNP), MAX(Population) FROM country
GROUP BY Continent;

SELECT Continent , MAX(GNP), SUM(Population) FROM country
GROUP BY Continent;

# 인구에 1명당 GNP
SELECT Continent , SUM(GNP) / SUM(Population) FROM country
GROUP BY Continent;


# HAVING 
# 대륙별 전체인구를 구하고, 5억 이상인 대륙만 출력
# GROUP BY에서는 WHERE이 실행이 안됨. 
# WHERE는 위치 자체가, GROUP BY 보다 먼저 실행되도록 설계되어 있음. 
-- SELECT Continent , SUM(Population) FROM country
-- GROUP BY Continent
-- WHERE SUM(Population) > 500000000;

# HAVING은 GROUP BY가 실행되고 난 결과에 조건을 추가한다. 
# 뒤에 쓰는 수식이나, 비교문은 WHERE과 똑같다. 
SELECT Continent , SUM(Population) FROM country
GROUP BY Continent
HAVING SUM(Population) > 500000000;



# DATA TYPE


