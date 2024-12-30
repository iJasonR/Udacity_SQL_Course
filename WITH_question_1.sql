--Provide the name of the sales_rep in each region with the largest amount of total_amt_usd sales.

WITH t1 AS (
	SELECT s.name AS sales_rep,
	r.name AS region_name,
	sum(o.total_amt_usd) AS total_amt
	FROM sales_reps s
	JOIN accounts a
	ON s.id = a.sales_rep_id
	JOIN orders o 
	ON a.id= o.account_id
	JOIN region r
	ON s.region_id = r.id
	GROUP BY 1, 2
	ORDER BY 3 DESC),
t2 AS (
	SELECT region_name,
	MAX(total_amt) AS total_amt
	FROM t1
	GROUP BY 1)
SELECT t1.sales_rep,
t1.region_name,
t1.total_amt
FROM t1
JOIN t2 
ON t1.region_name = t2.region_name AND t1.total_amt = t2.total_amt;
