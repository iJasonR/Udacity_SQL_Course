-- For the customer that spent the most (in total over their lifetime as a customer) total_amt_usd, how many web_events did they have for each channel?

WITH t1 AS (
		SELECT a.id AS account_id, a.name AS account_name, SUM(o.total_amt_usd) AS total_usd
		FROM accounts a
		JOIN orders o 
		ON a.id = o.account_id
		GROUP BY 1,2
		ORDER BY 3 DESC
		LIMIT 1)
											


SELECT a.name,
w.channel,
COUNT(*)
FROM accounts a
JOIN web_events w
ON a.id = w.account_id and a.id = ( SELECT account_id
									FROM t1)
GROUP BY 1,2
ORDER BY 3 DESC;
