-- Determine the distribution of orders by hour of the day.

SELECT hour(order_time)  AS hour , COUNT(order_id) as order_count
FROM orders
GROUP BY hour(order_time);
