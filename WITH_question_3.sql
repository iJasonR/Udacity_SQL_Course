--How many accounts had more total purchases than the account name which has bought the most standard_qty paper throughout their lifetime as a customer?

WITH t1 AS (
		SELECT a.name AS account_name, SUM(o.standard_qty) AS total_std, SUM(o.total) AS total_qty
								FROM accounts a 
								JOIN orders o 
								ON a.id = o.account_id
								GROUP BY 1
								ORDER BY 2 DESC
								LIMIT 1),

t2 AS  (
		SELECT a.name
	FROM orders o
	JOIN accounts a 
	ON o.account_id = a.id
	GROUP BY 1
	HAVING SUM(o.total) > (SELECT total_qty
						   FROM t1))
SELECT COUNT(*)
FROM t2;
