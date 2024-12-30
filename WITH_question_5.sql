--What is the lifetime average amount spent in terms of total_amt_usd for the top 10 total spending accounts?

WITH t1 AS (
		SELECT a.name AS account_name, 
		SUM(o.total_amt_usd) AS total_spent
		FROM accounts a 
		JOIN orders o
		ON a.id = o.account_id
		GROUP BY 1
		ORDER BY 2 DESC
		LIMIT 10)

SELECT ROUND(AVG(total_spent), 2) AS avg_spent
FROM t1
ORDER BY 1 DESC;
