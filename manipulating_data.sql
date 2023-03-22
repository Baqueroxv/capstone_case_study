Inserting 
Data to the database 

INSERT  INTO Product
VALUES
(377,'Outdoor 2-Gallon CoolerPack','ny10',20.20,'2020-05-15')

In case of making a mistake 
INSERT INTO Products
VALUES
(400,'Canoe Pack',cv11,$72.99,2020-22-22')

The Correct way would be 
INSERT INTO Product
VALUES
(412,'Canoe Pack','cv11',72.99,'2020-22-22')

To change and update data
*To update an entire row with an arithmetic operation. 
UPDATE Product
SET prodcost = (prodcost*1.07)

*To update a specific value 
UPDATE Supplier
SET supcompanyname = 'Fergus Textiles'
WHERE supID = 22

*Making a script for data entry
INSERT INTO Customer
VALUES
(22000, 'Jonas', 'Ricky', 0),
(33000, 'Chow', 'Mickey', 5),
(40000, 'Gagner', 'Evelyn', 5)
(42000, 'Victoria', 'Elvia', 0),
(53000, 'Fagbemi', 'Wana', 5),
(60000, 'Rose', 'Robert John', 5)
;

*Deleting data 
To delete a Row
DELETE FROM Customer
WHERE CustID = 22000

To delete multiple Rows
DELETE FROM Customer
WHERE CustDiscount = 5
