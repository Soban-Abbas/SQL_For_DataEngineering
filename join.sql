-- Active: 1792225767449@@127.0.0.1@5432@dataEngineering
-- Saare customers show karo, including those who have never placed an order. Customer ka first_name aur order_id show karo.
SELECT c.first_name , o.order_id
from customers as c
LEFT JOIN orders  as o
on c.customer_id=o.customer_id