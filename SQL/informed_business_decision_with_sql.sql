Scenario: 
As a method of increasing future sales, the company has decided to give bonuses for exemplary performance in sales.
Bonuses will be awarded to employees responsible for the five highest order amounts. 
Business Question
●	How can We identify employees responsible for the five highest order amounts?
A/ Find the Top 5 salespeople with the highest sales amounts. 

First Task
Which tables would I use to solve the business question? 
A/ I would use the Employees table and the Orders table
*We need four tables Employees, Orders, OrderDetails, and Products.

●	 [Tables] and Columns needed to be the query 
○	[Employees]
■	EmployeeId + LastName + FirstName
○	[Orders]
■	EmployeeId + OrderId
○	[OrderDetails]
■	OrderId + ProductId + Quantity
○	[Products]
■	ProductId + Price. 

●	Chunk needed to generate query the tables and columns:

SELECT LastName, FirstName, Orders.OrderId, Products.ProductId, Quantity, Price 
FROM Employees
 INNER JOIN Orders
 ON Employees.EmployeeId = Orders.Employeeid
 INNER JOIN OrderDetails
 ON Orders.OrderId = OrderDetails.OrderId
 INNER JOIN Products
 ON OrderDetails.ProductId = Products.Productid
ORDER BY LastName, FirstName 

*Note: When declaring the SELECT variables, specify the primary key table position Ex: 

SELECT LastName, FirstName, Orders.OrderId, Products.ProductId, Quantity, Price 




Practice Task 
Query a table with the CustomerName, OrderId, and OrderDate: 

 SELECT CustomerName,OrderId,OrderDate
 FROM Customers
   INNER JOIN Orders
    ON Customers.CustomerId = Orders.CustomerId


Second Task
Let's create a temporary new column to calculate the Sales amount and then group the rows by OrderId to recognize the sales amount per Order. 
SELECT LastName, FirstName, Orders.OrderId, Products.ProductId, Quantity, Price, SUM(Quantity * Price) AS SalesAmt
FROM Employees
 INNER JOIN Orders
 ON Employees.EmployeeId = Orders.Employeeid
 INNER JOIN OrderDetails
 ON Orders.OrderId = OrderDetails.OrderId
 INNER JOIN Products
 ON OrderDetails.ProductId = Products.Productid
GROUP BY Orders.OrderId

*Note: Don’t forget to specify the table name when GROUP BY by column is needed. 
Ex:
GROUP BY Orders.OrderId


Third Task 
Let’s answer the Business question, querying the top 5 biggest SalesAmt according to their respective Salesperson (Without double counting any salesperson):

SELECT LastName, FirstName, Orders.OrderId, SUM(Quantity * Price) AS SalesAmt
FROM Employees
 INNER JOIN Orders
 ON Employees.EmployeeId = Orders.Employeeid
 INNER JOIN OrderDetails
 ON Orders.OrderId = OrderDetails.OrderId
 INNER JOIN Products
 ON OrderDetails.ProductId = Products.Productid
GROUP BY Orders.OrderId
ORDER BY SalesAmt Desc 
LIMIT 5


We got the top 5 SalesAmt, but that is not answering our question. We need the top 5 salespeople who got the highest SalesAmt. So, let's check it out,

SELECT LastName, FirstName, Orders.OrderId, SUM(Quantity * Price) AS SalesAmt
FROM Employees
 INNER JOIN Orders
 ON Employees.EmployeeId = Orders.Employeeid
 INNER JOIN OrderDetails
 ON Orders.OrderId = OrderDetails.OrderId
 INNER JOIN Products
 ON OrderDetails.ProductId = Products.Productid
GROUP BY Orders.OrderId
HAVING orders.orderid IN (10372, 10424, 10417, 10324, 10351)
ORDER BY SalesAmt Desc 
LIMIT 5


Cumulative Challenge
Scenario: My Sales manager is assigning customers' accounts to new sales representatives and needs to know many orders have been placed by each customer. 
Business question: How many orders have been placed by each customer? 
To answer the business question, I will query two columns from two different tables. 

SELECT Customers.CustomerName, COUNT (OrderId) As Total_Orders
FROM Orders
INNER JOIN Customers
ON Customers.CustomerId = Orders.CustomerID
GROUP BY Customers.CustomerName
ORDER BY Total_Orders Desc

