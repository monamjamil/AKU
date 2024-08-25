# 1. As root user: Create user matt with password test
CREATE USER 'matt' IDENTIFIED BY 'test';


# 2. Grant SELECT privilege for salesman table to matt
# As matt query all salesman
# As matt try to query all customer names from customer table. What happens and why?
GRANT SELECT ON mybusiness.salesman TO 'matt';
# '0 row(s) affected'
# QUERY WILL YIELD NO RESULT FOR CUSTOMER AS THE PRIVILEGES HAVE NOT BEEN GRANTED TO MATT FOR CUSTOMER


# 3. As root user:
# Grant SELECT and DELETE privileges to customer and orders tables to matt
# Grant UPDATE privilege to orders table to matt
GRANT SELECT, DELETE ON mybusiness.customer TO 'matt';
GRANT SELECT, DELETE, UPDATE ON mybusiness.orders TO 'matt';


# 4. As matt 
# Find all the customers (all columns) from customer table
SELECT * 
FROM mybusiness.customer;

# Update purch_amount to 5800 from order which id equals to 70008
UPDATE mybusiness.orders
SET purch_amt = 5800
WHERE ord_no = 70008;


# 5. As root user:
# Create user lisa with password test
CREATE USER 'lisa' IDENTIFIED BY 'test';


# 6. As root user:
# Create a role called staff
CREATE ROLE staff;

# Grant SELECT, UPDATE and INSERT privileges to all your tables in the database (salesman, customer, orders) to staff role
GRANT SELECT, UPDATE, INSERT ON mybusiness.* TO staff;

# Grant role staff to lisa and matt
GRANT staff TO 'matt'@'%','lisa'@'%';

SET ROLE staff;

FLUSH privileges;


# 7. As lisa
# Write SELECT, INSERT and UPDATE SQL command to one of the tables and check if that works.
SELECT customer_id
FROM orders;
#DIDN'T WORK, STATES NO TABLE SELECTED FOR LISA

INSERT INTO mybusiness.orders (ord_no)
VALUES (70015);
# NO DATABASE SELECTED

# Try to delete the row you inserted before. What happens? 
DELETE FROM orders
WHERE ord_no = 70015;
# NO DATABASE SELECTED


# 8. Do the same as in the previous task but as matt. Is there any difference compared to what you did as lisa?
# DATABASE IS AVAILABLE. 
# ALL COMMANDS RUN SUCCESSFULLY



# 9. As root user:
# drop DELETE privilege from customer and orders tables from matt. Try out that Matt cannot delete rows anymore from these tables. 
REVOKE DELETE 
ON mybusiness.customer
FROM 'matt';

REVOKE DELETE 
ON mybusiness.orders
FROM 'matt';

FLUSH privileges;
# MATT CAN'T DELETE OBJECTS NOW


# 10. As root user:
# Drop user lisa.
DROP USER 'lisa'@'%';



