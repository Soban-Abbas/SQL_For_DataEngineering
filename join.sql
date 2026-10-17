-- Active: 1792225767449@@127.0.0.1@5432@dataEngineering
-- Saare customers show karo, including those who have never placed an order. Customer ka first_name aur order_id show karo.
SELECT c.first_name , o.order_id
from customers as c
LEFT JOIN orders  as o
on c.customer_id=o.customer_id

--Customer ka first_name, order_id aur status show karo, lekin sirf completed orders ke liye.

select c.first_name , o.order_id , o.status
from customers as c 
inner JOIN orders as O
on c.customer_id = o.customer_id AND o.status='completed'