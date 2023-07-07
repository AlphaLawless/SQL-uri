# Resolved

### 2602

```sql
SELECT name
FROM customers
WHERE state = 'RS';
```

### 2603

```sql
SELECT name, street
FROM customers
WHERE city = 'Porto Alegre';
```

### 2604

```sql
SELECT products.id, products.name
FROM products
WHERE price < 10.00 or price > 100.00;
```

### 2605

```sql
SELECT products.name, providers.name
FROM products
INNER JOIN providers
  ON products.id_providers = providers.id
WHERE id_categories = 6;
```

### 2606

```sql
SELECT products.id, products.name
FROM products
INNER JOIN categories
  ON products.id_categories = categories.id
WHERE categories.name LIKE 'super%';
```

### 2607

```sql
SELECT DISTINCT providers.city
FROM providers
ORDER BY providers.city;
```

### 2608

```sql
SELECT MAX(products.price), MIN(products.price)
FROM products;
```

### 2609

```sql
SELECT categories.name, SUM(products.amount) AS sum
FROM products
INNER JOIN categories
  ON products.id_categories = categories.id
GROUP BY categories.name;
```

### 2610

```sql
SELECT ROUND(AVG(products.price)::numeric, 2)
FROM products;
```

### 2611

```sql
SELECT movies.id, movies.name
FROM movies
INNER JOIN genres
  ON movies.id_genres = genres.id
WHERE genres.description = 'Action';
```

### 2612

```sql
SELECT movies.id, movies.name
FROM movies
INNER JOIN prices
  ON movies.id_prices = prices.id
WHERE prices.value < 2.00;
```

### 2614

```sql
SELECT c.name, r.rentals_date
FROM rentals AS r
INNER JOIN customers AS c
    ON r.id_customers = c.id
WHERE r.rentals_date >= '2016-09-01'
AND r.rentals_date <= '2016-09-30';
```

### 2615

```sql
SELECT DISTINCT city
FROM customers;
```

### 2616

```sql
SELECT c.id, c.name
FROM customers AS c
WHERE c.id
  NOT IN(SELECT locations.id_customers
          FROM locations);
```

### 2617

```sql
SELECT pdt.name, pvd.name
FROM products AS pdt
INNER JOIN providers AS pvd
    ON pdt.id_providers = pvd.id
WHERE pvd.name = 'Ajax SA';
```

### 2618

```sql
SELECT pdt.name, pvd.name, ctg.name
FROM products AS pdt
INNER JOIN providers AS pvd
    ON pdt.id_providers = pvd.id
INNER JOIN categories AS ctg
    ON pdt.id_categoris = ctg.id
WHERE pvd.name = 'Sansul SA' AND ctg.name = 'Imported';
```

### 2619

```sql
SELECT pdt.name, pvd.name, pdt.price
FROM products AS pdt
INNER JOIN providers AS pvd
    ON pdt.id_providers = pvd.id
INNER JOIN categories AS ctg
    ON pdt.id_categories = ctg.id
WHERE pdt.price > 1000 AND ctg.name = 'Super Luxury';
```

### 2720

```sql
SELECT c.name, o.id
FROM customers AS c
INNER JOIN orders AS o
    ON o.id_customers = c.id
WHERE o.orders_date >= '2016-01-01'
AND o.orders_date <= '2016-06-30';
```

### 2721

```sql
SELECT pro.name
FROM providers AS p
INNER JOIN products AS pro
    ON pro.id_providers = p.id
WHERE pro.amount BETWEEN 10 AND 20 AND p.name LIKE 'P%';
```

### 2722

```sql
SELECT c.name
FROM customers AS c
WHERE c.id
  IN(SELECT l.id_customers
      FROM legal_person AS l);
```

### 2723

```sql
SELECT p.name, c.name
FROM products AS p
INNER JOIN categories AS c
    ON p.id_categories = c.id
WHERE p.amount > 100 AND p.id_categories IN(1,2,3,6,9);
```

### 2724

```sql
SELECT COUNT(DISTINCT c.city) AS count
FROM customers AS c;
```

### 2725

```sql
SELECT CONCAT(SUBSTRING(n.cpf,1,3),'.',
              SUBSTRING(n.cpf,4,3),'.',
              SUBSTRING(n.cpf,7,3),'-',
              SUBSTRING(n.cpf,10,2)) AS CPF
FROM natural_person AS n
WHERE id_customers IN(SELECT c.id FROM customers AS c);
```

### 2737

```sql
SELECT lawyers.name, customers_number 
FROM lawyers 
WHERE customers_number = (SELECT MAX(customers_number) FROM lawyers)
UNION ALL
SELECT lawyers.name, MIN(customers_number) 
FROM lawyers 
WHERE customers_number = (SELECT MIN(customers_number) FROM lawyers) GROUP BY name
UNION ALL
SELECT 'Average', ROUND(AVG(customers_number)) FROM lawyers;
```

### 2738

```sql
SELECT c.name, ROUND((((s.math * 2) + (s.specific * 3) + (s.project_plan * 5)) / 10)::numeric, 2) AS avg
FROM candidate AS c
INNER JOIN score AS s
	ON c.id = s.candidate_id
ORDER BY avg DESC
```

### 2739

```sql
SELECT
  name,
  CAST(EXTRACT(day FROM payday) AS INT) AS "day"
FROM loan;
```

### 2740

```sql
SELECT CONCAT('Podium: ', team) "name"
FROM league
WHERE position BETWEEN 1 AND 3
UNION ALL
SELECT CONCAT('Demoted: ', team)
FROM league, (SELECT position FROM league ORDER BY position DESC LIMIT 2) tmp
WHERE tmp.position = league.position;
```

### 2741

```sql
SELECT CONCAT('Approved: ', name), grade
FROM students
WHERE grade >= 7
ORDER BY grade DESC;
```

### 2742

```sql
SELECT l.name, ROUND((l.omega * 1.618), 3) AS "The N Factor"
FROM life_registry l
INNER JOIN dimensions d
	ON d.id = l.dimensions_id
WHERE d.name IN ('C875', 'C774') AND l.name LIKE 'Richard%'
ORDER BY omega;
```

### 2743

```sql
SELECT name, LENGTH(name) AS length
FROM people
ORDER BY length DESC;
```

### 2744

```sql
SELECT id, password, MD5(password) AS MD5
FROM account;
```

### 2745

```sql
SELECT name, round((salary * 10 / 100), 2) AS tax
FROM people
WHERE salary > 3000;
```

### 2988

```sql
SELECT t.name, COUNT(m.team_1 + m.team_2) AS matches,
	SUM(CASE
    WHEN (m.team_1_goals > m.team_2_goals
			AND t.id = m.team_1)
			OR (m.team_2_goals > m.team_1_goals
      AND t.id = m.team_2) THEN 1 ELSE 0 END) AS victories,
	SUM(CASE
    WHEN (m.team_1_goals > m.team_2_goals
			AND t.id = m.team_1)
			OR (m.team_1_goals < m.team_2_goals
      AND t.id = m.team_2) THEN 1 ELSE 0 END) AS defeats,
	SUM(case
		when (m.team_1_goals = m.team_2_goals
			and t.id = m.team_1)
			or (m.team_1_goals = m.team_2_goals
        and t.id = m.team_2) then 1 else 0 END) AS draws,
	SUM(CASE
    WHEN (m.team_1_goals = m.team_2_goals
			AND t.id = m.team_1)
			OR (m.team_1_goals = m.team_2_goals
      AND t.id = m.team_2) THEN 1 ELSE 0 END) +
	SUM(CASE
    WHEN (m.team_1_goals > m.team_2_goals
			AND t.id = m.team_1)
			OR (m.team_1_goals < m.team_2_goals
      AND t.id = m.team_2) THEN 3 ELSE 0 END) AS score
FROM teams AS t, matches AS m
WHERE t.id = m.team_1 OR t.id = m.team_2
GROUP BY t.name ORDER BY score DESC;
```

### 2746

```sql

```

### 2746

```sql

```

### 2746

```sql

```

### 2746

```sql

```

### 2746

```sql

```

### 2746

```sql

```

### 2746

```sql

```

### 2746

```sql

```

### 2746

```sql

```
