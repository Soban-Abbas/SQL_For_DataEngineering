-- wo products find kro jin ki price sare products ki avg price sy zada hu

SELECT p.product_name , p.price
from products as p 
where p.price >(
    select avg(p.price) from products as p 
)

ORDER BY p.price desc


