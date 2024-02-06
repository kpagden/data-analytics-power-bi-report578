--1. How many staff are there in all of the UK stores?

SELECT SUM(staff_numbers)
FROM dim_store
WHERE country = 'UK';