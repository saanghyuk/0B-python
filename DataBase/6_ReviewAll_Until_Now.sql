# 
USE world;
#
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'country'
ORDER BY ORDINAL_POSITION;

#
SELECT CountryCode AS Code, Name, Population FROM city;

# WHERE
SELECT CountryCode AS Code, Name, Population 
FROM city
WHERE Population > 5000000;
#
SELECT CountryCode AS Code, Name, Population 
FROM city
WHERE Population > 5000000 AND Population <= 8000000
AND CountryCode = "CHN";
#
SELECT CountryCode AS Code, Name, Population 
FROM city
WHERE Population Between  5000000 AND  8000000
ORDER BY Code, Population DESC;
#
SELECT CountryCode AS Code, Name, Population, 
CONCAT(Name, "(",Population,")") AS city_population
FROM city
WHERE Population Between  5000000 AND  8000000
ORDER BY Code, Population DESC;
#
SELECT CountryCode AS Code, Name, Population, 
CONCAT(Name, "(",Population,")") AS city_population
FROM city
WHERE Population Between  5000000 AND  8000000
AND CountryCode like "C%"
ORDER BY Code, Population DESC;
#
SELECT CountryCode AS Code, Name, Population, 
CONCAT(Name, "(",Population,")") AS city_population
FROM city
WHERE Population Between  5000000 AND  8000000
AND CountryCode like "%R%"
AND CountryCode  in ("BRA", "GBR")
ORDER BY Code, Population DESC;

#
SELECT CountryCode AS Code, Name, Population, 
CONCAT(Name, "(",Population,")") AS city_population
FROM city
WHERE Population Between  5000000 AND  8000000
AND CountryCode like "%R%"
AND CountryCode  in ("BRA", "GBR")
ORDER BY Code, Population DESC
LIMIT 5, 3; # 5번째 부터 3개





















