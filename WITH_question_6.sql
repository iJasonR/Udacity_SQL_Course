--What is the lifetime average amount spent in terms of total_amt_usd, 
--including only the companies that spent more per order, on average, than the average of all orders.

WITH t1 AS (SELECT 
			AVG(total_amt_usd) AS avg_total
			FROM accounts a
			JOIN orders o 
			ON a.id = o.account_id),
			
t2 AS 	(SELECT 
		o.account_id AS account_id,
		AVG(o.total_amt_usd) AS avg_amt
		FROM orders o
		GROUP BY 1
		HAVING AVG(o.total_amt_usd) > (SELECT *
								FROM t1))
							

SELECT AVG(avg_amt)
FROM t2
