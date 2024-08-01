-- Identify the most common pizza size ordered.

	SELECT 	pizzas.size , COUNT(orders_details.order_details_id) AS order_count
    FROM pizzas JOIN orders_details
    ON orders_details.pizza_id = pizzas.pizza_id
    GROUP BY pizzas.size
    ORDER BY order_count DESC ;