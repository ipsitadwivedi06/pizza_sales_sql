-- Determine the top 3 most ordered pizza types based on revenue.

SELECT pizza_types.name, 
SUM(pizzas.price * orders_details.quantity) AS total_price
FROM pizza_types
JOIN pizzas
ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN orders_details
ON pizzas.pizza_id = orders_details.pizza_id
GROUP BY pizza_types.name
ORDER BY total_price desc limit 3;


