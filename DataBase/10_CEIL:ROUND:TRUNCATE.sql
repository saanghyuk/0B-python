USE world;

# 소숫점 올림, 반올림, 버림
# 올림
SELECT CEIL(12.345);

# 둘쨋자리까지 반올림
SELECT ROUND(12.345, 2);

# 버림
SELECT TRUNCATE(12.345);

# 
SELECT Code, ROUND((GNP / Population) *1000, 1)  FROM country;

#




