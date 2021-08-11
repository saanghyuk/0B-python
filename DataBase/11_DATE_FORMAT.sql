
# DATE_FORMAT
# 날짜 데이터의 포맷을 변경해주는 함수
# FORMAT : https://dev.mysql.com/doc/refman/5.7/en/date-and-time-functions.html


USE sakila;
#payment에서 월별 총 매출 출력
SELECT DATE_FORMAT(payment_date, "%Y-%m") AS monthly, amount
FROM payment;

SELECT DATE_FORMAT(payment_date, "%Y-%m") AS monthly, SUM(amount)
FROM payment
GROUP BY monthly;

SELECT AVG(amount), SUM(amount), COUNT(amount)
FROM payment
GROUP BY  DATE_FORMAT(payment_date, "%Y-%m");




