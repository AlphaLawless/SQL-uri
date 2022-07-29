-- Average Value of Products

-- In the company that you work is being done a survey on the values of the products that are marketed.

-- To help the industry that is doing this survey you should calculate and display the average value of the price of the products.

-- OBS: Show the value with two numbers after the period.

-- Schema
--    products
-- Column	  Type
-- id     	numeric
-- name	    varchar(255)
-- amount	  numeric
-- price	  numeric

-- Tables
-- products
-- id	name	              amount	price
-- 1	Two-doors wardrobe	100	    800
-- 2	Dining table	      1000	  560
-- 3	Towel holder	      10000	  25.50
-- 4	Computer desk	      350	    320.50
-- 5	Chair	              3000	  210.64
-- 6	Single bed	        750	    460 

-- Output Sample
-- price
-- 396.10

SELECT ROUND(AVG(products.price)::numeric, 2) FROM products;

-- References
-- https://stackoverflow.com/questions/13113096/how-to-round-an-average-to-2-decimal-places-in-postgresql

