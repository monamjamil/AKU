# 1. Write a SQL statement showing name and commission for all the salesmen.
SELECT name, commission 
FROM salesman;


#2. Find salesmen living in 'Paris'. Show name and city for each person.
SELECT name, city
FROM  salesman
WHERE city = 'Paris';


#3. Find the details of all employees whose name includes ‘James’ or ‘Adam’. Show salesman_id and name.
SELECT name, salesman_id
FROM  salesman
WHERE name LIKE '%James%' OR name LIKE '%Adam%';


#4. Find the details of salesmen whose name starts with any letter within 'A' and 'L' (not inclusive). Show salesman_id, name, city, commission for each salesman. You can use between comparison for name field.
SELECT *
FROM salesman
WHERE name BETWEEN 'A%' AND 'L%'; 


#5. Find those salesmen whose commission is greater than or equal to 0.13. Show name, commission for each salesman
SELECT name, commission
FROM salesman
WHERE commission >= 0.13;


#6. Find the orders, which are delivered by a salesman of ID 5001. Show ord_no, ord_date, purch_amt for each order.
SELECT orders.ord_no, orders.ord_date, orders.purch_amt
FROM orders
INNER JOIN salesman ON orders.salesman_id = salesman.salesman_id
WHERE salesman.salesman_id = 5001;


#7. Find the orders, which are delivered by a salesperson of ID 5001 and purchace amount is more than 1000. Show ord_no, ord_date, purch_amt for each order.
SELECT orders.ord_no, orders.ord_date, orders.purch_amt
FROM orders
INNER JOIN salesman ON orders.salesman_id = salesman.salesman_id
WHERE salesman.salesman_id = 5001 AND orders.purch_amt > 1000;


#8. Find the products whose price is between 1000 and 4000. Show ord_no, ord_date, purch_amt for each product.
SELECT ord_no, ord_date, purch_amt
FROM orders
WHERE purch_amt BETWEEN 1000 AND 4000; 


#9. Find all the orders which purchase amount is less than 500€ and done before October 2012 or which purchase amount is greater than 2000 and done in October 2012. Show ord_no, purch_amt, ord_date for each order.
SELECT ord_no, ord_date, purch_amt
FROM orders
WHERE (purch_amt < 500 AND ord_date < '2012-10-01')
OR (purch_amt > 2000 AND ord_date >= '2012-10-1' AND ord_date < '2012-11-1'); 


#10. Find the orders done in October 2012 and order the results by customer_id. Show all columns for each order
SELECT *
FROM orders
WHERE ord_date >= '2012-10-1' AND ord_date < '2012-11-1'
ORDER BY customer_id;


#11. Find 5 most recent orders. Show all the columns for each order
SELECT *
FROM orders
ORDER BY ord_date DESC
LIMIT 5;


#12. Find all customers. Order the results by city and cust_name
SELECT customer.customer_id, customer.cust_name, customer.city
FROM customer
INNER JOIN orders ON customer.customer_id = orders.customer_id
ORDER BY customer.city, customer.cust_name;


#13. Write SQL query to calculate average purchase amount of all orders
SELECT AVG(purch_amt)
FROM orders;


#14. Write SQL query to calculate the average purchase amount for salesman having id 5001
SELECT AVG(purch_amt)
FROM orders
WHERE salesman_id = 5001;


#15. Write SQL query to calculate total purchase amount of all orders
SELECT SUM(purch_amt) AS Total
FROM orders;


#16. Write SQL query to count the number of orders
SELECT COUNT(ord_no) AS Number_Of_Orders
FROM orders;


#17. Write SQL query to count the number salesmen
SELECT DISTINCT COUNT(salesman_id) AS Number_Of_Salesman
FROM salesman;


#18. Write SQL query to count the number of orders after 2012-07-01
SELECT COUNT(ord_no) AS Number_Of_Orders
FROM orders
WHERE ord_date > '2012-07-01';


#19. Write SQL query to count the number of orders in October 2012.
SELECT COUNT(ord_no) AS Number_Of_Orders
FROM orders
WHERE ord_date >= '2012-10-1' AND ord_date < '2012-11-1';


#20. Write SQL query to find the maximum purchase amount.
SELECT MAX(purch_amt) AS Maximum_Purchase
FROM  orders;


#21. Write SQL query to find the lowest purchase amount ordered by each customer. Show customer ID, minimum purchase amount for each customer. Order the results by customer_id. 
SELECT DISTINCT customer_id, MIN(purch_amt)
FROM orders
GROUP BY customer_id
ORDER BY customer_id;


#22. Write SQL query to find the highest purchase amount ordered on a particular date. Show order date and the highest purchase amount.
SELECT MAX(purch_amt), ord_date
FROM orders
WHERE ord_date = '2012-09-10'
ORDER BY purch_amt;


#23. Write SQL query to find highest purchase amount by each customer. Show only those results where highest amount is more than 2000€. Show customer id and maximum purchase amount.
SELECT customer_id, MAX(purch_amt)
FROM orders
WHERE purch_amt > 2000
GROUP BY customer_id;


#24. Write SQL query to find the maximum purchase amount by each salesman whose ID is between 5003 and 5008 (Begin and end values are included.). Return salesperson id and maximum purchase amount for each row.
SELECT salesman_id, MAX(purch_amt)
FROM orders
WHERE salesman_id >= 5003 AND salesman_id < 5008
GROUP BY salesman_id;


#25. Write SQL query to count how many orders haven been made on '2012-08-17'. Return number of orders.
SELECT COUNT(ord_no) AS Number_Of_Orders
FROM orders
WHERE ord_date = '2012-08-17';


#26. Show how many orders have been made each date. 
SELECT COUNT(ord_no), ord_date
FROM orders
GROUP BY ord_date
ORDER BY ord_date;


#27. Write SQL query to calculate average purchase amount of each salesman. Show salesman_id and average purchase amount. Order the results in decreasing order by average purchase amount
SELECT AVG(purch_amt), salesman_id
FROM orders
GROUP BY salesman_id
ORDER BY AVG(purch_amt) DESC;


#28. Write a SQL query to find the purch_amt which are greater than the average order value of 10th October 2012. Return ord_no, purch_amt, ord_date, customer_id, salesman_id
SELECT *
FROM orders
WHERE purch_amt > (
	SELECT AVG(purch_amt)
	FROM orders
	WHERE ord_date = '2012-10-10')
ORDER BY ord_date;


#29. Write SQL query to find all the orders. Instead of showing customer_id you should show cuostomer’s name. Show ord_no, purch_amt, ord_date, customer_name for each order. You need to join orders and customer tables. 
SELECT orders.ord_no, orders.purch_amt, orders.ord_date, customer.cust_name
FROM orders
INNER JOIN customer ON orders.customer_id = customer.customer_id;


#30. Write SQL query to find all the orders. Instead of showing salesman id you should show salesman’s name and instead of showing customer id you should show customer name. Return ord_no, purch_amt, ord_date, customer name and salesman name. You need to join orders, salesman and customers tables.
SELECT orders.ord_no, orders.purch_amt, orders.ord_date, customer.cust_name, salesman.name
FROM orders
INNER JOIN customer ON orders.customer_id = customer.customer_id
INNER JOIN salesman ON orders.salesman_id = salesman.salesman_id;


#31. Find the salesperson and customer who belong to same city. Return Salesman, cust_name and city. Order the results by city. 
SELECT salesman.name AS Salesman, customer.cust_name AS Customer, customer.city AS City
FROM salesman
INNER JOIN customer ON salesman.city = customer.city
ORDER BY customer.city;


# 32. Calculate the average purchase amount of each customer. Return customer name and average purchase. Return also the rows for those customers who have not purchasedanything (Marion Cameron) Hint: You need information from two tables. Hint 2: You should include both id and cust_name to group by clause 
SELECT customer.cust_name, AVG(orders.purch_amt) 
FROM customer
LEFT JOIN orders ON customer.customer_id = orders.customer_id
GROUP BY orders.customer_id, customer.cust_name
ORDER BY orders.customer_id;


# 33. Write SQL query to find all customers and their salesman. Show customer nameand salesman name. You need information from salesman and customer tables.
SELECT salesman.name AS Salesman, customer.cust_name AS Customer
FROM salesman
INNER JOIN customer ON salesman.salesman_id = customer.salesman_id;


# 34. Find all customers who are not living in the same city as his/her salesman. Show cust_name and his / her city + salesman’s name and his/her city.
SELECT customer.cust_name AS Customer, customer.city AS C_City, salesman.name AS Salesman, salesman.city AS S_City
FROM customer
INNER JOIN salesman ON customer.salesman_id = salesman.salesman_id
WHERE customer.city != salesman.city;


# 35. Find all the orders issued by the salesman 'Paul Adam’. Show ord_no, purch_amt, ord_date and salesman’s name.
SELECT orders.ord_no AS Order_No, orders.purch_amt AS Amount, orders.ord_date AS Date, salesman.name
FROM orders
INNER JOIN salesman ON orders.salesman_id = salesman.salesman_id
WHERE salesman.name = 'Paul Adam';


# 36. Write SQL query to find all the orders, which are generated by those salesmen, who live in the city of London. Show ord_no salesman’s name and city.
SELECT salesman.name AS Name, orders.ord_no AS Order_No, salesman.city AS City
FROM salesman
INNER JOIN orders ON salesman.salesman_id = orders.salesman_id
WHERE salesman.city = 'London';


# 37. Write a SQL query to find the commission of the salesmen whose customer is in Paris. Return salesman id, salesman name and commission
SELECT salesman.salesman_id AS ID, salesman.name AS Name, salesman.commission AS Commission
FROM salesman
INNER JOIN customer ON salesman.salesman_id = customer.salesman_id
WHERE customer.city = 'Paris';


# 38. Create a view for those salesmen living in the city 'Paris’. Show Salesman id, name and city.
CREATE VIEW Paris_Salesmen AS
SELECT salesman_id, name, city
FROM salesman
WHERE city = 'Paris';


# 39. Create a view for showing all customers with following information: customer_id, cust_name and salesman’s name. 
CREATE VIEW Customer_Salesman AS 
SELECT customer.customer_id AS ID, customer.cust_name AS C_Name, salesman.name AS S_Name
from customer
INNER JOIN salesman ON customer.salesman_id = salesman.salesman_id;


# 40. create a view to compute average purchase amount and total purchase amount for each salesperson. Return name, average purchase and total purchase amount. (Assume all names are unique).
CREATE VIEW amounts AS 
SELECT salesman.name AS Name, AVG(orders.purch_amt), SUM(orders.purch_amt)
FROM orders
INNER JOIN salesman ON orders.salesman_id = salesman.salesman_id
GROUP BY salesman.name;


# 41. Update salesman whose id is 5007 name to be Paul White and his city to London. 
UPDATE salesman
SET name = 'Paul White', city = 'London'
WHERE salesman_id = 5007;


# 42. Update customer whose id is 3005 grade to be 300.
UPDATE customer
SET grade = 300
WHERE customer_id = 3005;


# 43. Change salesman whose id is 5007 id to be 5009. should notice the contradiction if you try to modify the id because it is referenced as foreign key from customer and orders table. There are two options to do the task given. 
# USED CHATGPT
SET foreign_key_checks = 0;
UPDATE salesman
SET salesman_id = 5009
WHERE salesman_id = 5007;
SET foreign_key_checks = 1;


# 44. Delete order number 70014 from orders. 
DELETE FROM orders
WHERE ord_no = 70014;


# 45. Delete salesman whose id is 5010 and all the customers who has the reference to this salesman. Hint: You have to delete first the customers who has the reference to salesman_id 5010. 
DELETE FROM customer
WHERE salesman_id = 5010;

DELETE FROM salesman
WHERE salesman_id = 5010;
