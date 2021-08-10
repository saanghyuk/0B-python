
# UPDATE
-- UPDATE 
-- SET

# Entier Data Changed
UPDATE user1
SET age = 20, rdate="20191212";

# With condition
UPDATE user1
SET age = 20, rdate="20191212"
WHERE age BETWEEN 20 AND 29;


# DELETE
DELETE FROM user1
WHERE rdate > "20191101";

