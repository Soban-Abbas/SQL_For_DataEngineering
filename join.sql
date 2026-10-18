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



--Un customers ka customer_id aur first_name nikalo jinhon ne koi order place nahi kiye
select c.*,o.*
from customers as c
left JOIN orders as O
on c.customer_id=o.customer_id 
where o.status is NULL


-- Har order ka order_id, order_date, customer ka first_name aur last_name show karo.

select c.* , o.order_id,o.order_date
from customers as c 
inner join orders as o 
on c.customer_id= o.customer_id


-- order_id, order status aur payment_status show karo. Sirf un orders ko include karo jinka payment record maujood hai

SELECT o.order_id,o.status,p.payment_status
from orders as o 
inner join payments as p
on o.order_id=p.order_id

--Har customer ke total orders count karo, including zero-order customers.

select c.customer_id, c.first_name ,count(o.order_id) as total_orders
from customers as c 
left join orders as o 
on c.customer_id= o.customer_id

GROUP BY c.customer_id,c.first_name

-- Har category ki total sold quantity calculate karo.

select  p.category,sum(oi.quantity) as total_sold
from order_items as oi 
left join products as p 
on oi.product_id=p.product_id
GROUP BY p.category
ORDER BY total_sold desc


-- Customer-wise total order value nikalo using order_items.quantity * order_items.unit_price mtlab customer ky total orders , total quantity purchase , and total money spend

SELECT c.customer_id , c.first_name, count( DISTINCT o.order_id) as total_orders , sum(oi.quantity) as total_items_purchased , sum(oi.quantity*oi.unit_price) as total_spend
from customers as c 
inner join orders as o 
on c.customer_id = o.customer_id
inner join order_items as oi 
on o.order_id= oi.order_id
GROUP BY c.customer_id , c.first_name




-- Un products ko identify karo jo kisi order item mein appear nahi hote.
select p.*
from products as p 
left join order_items as oi 
on p.product_id=oi.product_id
where oi.product_id is NULL


-- make report on payment

SELECT p.* , o.*
from payments as p 
inner join orders as o 
on o.order_id=p.order_id



-- Har customer ke completed orders count karo aur sirf unhein show karo jinke completed orders ek se zyada hain.


select c.customer_id,c.first_name,count(o.order_id) as total_orders_completed
from customers as c 
inner join orders as o 
on c.customer_id=o.customer_id
where o.status ='completed'
GROUP BY c.customer_id,c.first_name
HAVING count(o.order_id)>1