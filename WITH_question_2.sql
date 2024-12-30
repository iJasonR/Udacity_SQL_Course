--For the region with the largest sales total_amt_usd, how many total orders were placed?

WITH t1 AS (
		SELECT r.name AS region_name,
	sum(o.total_amt_usd) AS total_usd,
	COUNT(o.total) AS total_qty
	FROM region r
	JOIN sales_reps s
	ON s.region_id = r.id
	JOIN accounts a
	ON s.id = a.sales_rep_id
	JOIN orders o
	ON a.id = o.account_id
	GROUP BY 1
	ORDER BY 2, 3)

SELECT t1.region_name,
MAX(t1.total_qty) AS total_qty
FROM t1
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;
