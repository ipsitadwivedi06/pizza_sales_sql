-- Calculate the percentage contribution of each pizza type to total revenue.

SELECT 
    pizza_types.category, 
ROUND((SUM(orders_details.quantity * pizzas.price) / total_sales.total)* 100,2) AS revenue_percentage
FROM 
    pizza_types
JOIN 
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN 
    orders_details ON pizzas.pizza_id = orders_details.pizza_id
CROSS JOIN 
    (SELECT ROUND(SUM(orders_details.quantity * pizzas.price), 2) AS total
     FROM orders_details
     JOIN pizzas ON orders_details.pizza_id = pizzas.pizza_id) AS total_sales
GROUP BY 
    pizza_types.category, total_sales.total
ORDER BY 
    revenue_percentage DESC;
