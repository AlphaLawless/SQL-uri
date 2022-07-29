-- Higher and Lower Price

-- The financial sector of our company, wants to know the smaller and higher values of the products, which we sell.

-- For this you must display only the highest and lowest price of the products table.

-- Schema
--      products
-- Column	    Type
-- id     	  numeric
-- name	      varchar(255)
-- amount	    numeric
-- price	    numeric

-- Tables
-- products
-- id	name	              amount	price
-- 1	Two-doors wardrobe	100	    800
-- 2	Dining table	      1000	  560
-- 3	Towel holder	      10000	  25.50
-- 4	Computer desk	      350	    320.50
-- 5	Chair	              3000    210.64
-- 6	Single bed	        750	    460 

-- Output Sample
-- price	price
-- 800	25.50

SELECT MAX(products.price), MIN(products.price)
    FROM products;

