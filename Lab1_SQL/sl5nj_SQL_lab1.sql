# 1. Write a query to get Product name and quantity/unit.  
select product_name, quantity_per_unit from products;

# 2. Write a query to get current Product list (Product ID and name).  
select id, product_name from products where discontinued = 0;

# 3. Write a query to get discontinued Product list (Product ID and name). 
select id, product_name from products where discontinued = 1;

# 4. Write a query to get most expense and least expensive Product list (name and unit price).  
select product_name, list_price from products where list_price in (select MAX(list_price) from products)
or list_price in(select MIN(list_price) from products);

# 5. Write a query to get Product list (id, name, unit price) where current products cost less than $20.  
select id, product_name, list_price from products where (list_price < 20) and (discontinued = 0); 

# 6. Write a query to get Product list (id, name, unit price) where products cost between $15 and $25.  
select id, product_name, list_price from products where (list_price >= 15 and list_price <= 25);

# 7. Write a query to get Product list (name, unit price) of above average price.
select product_name, list_price from products where list_price > (select avg(list_price) from products);

# 8. Write a query to get Product list (name, unit price) of ten most expensive products.  
select product_name, list_price from products as p 
where 10 >= (select count(list_price) from products as p2 where p2.list_price >= p.list_price);

# 9. Write a query to count current and discontinued products. 
select count(product_name) from products group by discontinued;

# 10. Write a query to get Product list (name, units on order, units in stock) of stock is less than the quantity on order.  
select product_name, reorder_level as units_in_stock , target_level as units_on_order from products where reorder_level < target_level;