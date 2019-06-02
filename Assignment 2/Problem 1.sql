#1
SELECT customername, contactFirstName, contactLastName, COUNT(customers.customerNumber) AS Quantity_Of_Orders
        FROM customers JOIN orders ON orders.customerNumber=customers.customerNumber AND country='Canada' GROUP BY customers.customerNumber;
#2
CREATE VIEW `Ray-Ban Buyers` AS
        SELECT C.salesRepEmployeeNumber,C.customerNumber,O.orderNumber,Od.productCode,P.productName
                FROM customers C,orders O,orderdetails Od,products P
                    WHERE C.customerNumber=O.customerNumber AND O.orderNumber=Od.orderNumber AND
                          Od.productCode=P.productCode AND P.productName='Ray-Ban Clubmaster eyeglasses'
                              ORDER BY O.orderNumber;
create VIEW `Ray-Ban Sellers` AS
            SELECT email,jobTitle,employeeNumber , customerNumber
                    FROM employees,schoonerBuyers
                          WHERE employeeNumber=salesRepEmployeeNumber;
SELECT email,jobTitle,employeenumber,Count(employeeNumber) AS `Sales` FROM `Ray-Ban Sellers` GROUP BY employeeNumber;

#3
CREATE VIEW PepsiBuyers AS
  SELECT Customers.customernumber,customername,productVendor, productLine FROM (((customers INNER JOIN orders ON customers.customerNumber=orders.customerNumber)
                                      INNER JOIN orderdetails ON orders.orderNumber=orderdetails.orderNumber)
                                      INNER JOIN products ON orderdetails.productCode=products.productCode AND productLine='Pepsi');
CREATE VIEW CustomersRank AS
SELECT customerNumber, Sum(amount) AS Buy
        FROM payments GROUP BY customerNumber ORDER BY Buy DESC ;
SELECT  CustomersRank.customerNumber, Buy
        FROM CustomersRank INNER JOIN PepsiBuyers on CustomersRank.customerNumber=PepsiBuyers.customernumber GROUP BY customerNumber order by Buy desc ;
#--------------------
#4
SELECT products.*
       FROM (((((products INNER JOIN orderdetails ON products.productCode=orderdetails.productCode AND priceEach='100')
                      INNER JOIN orders ON orderdetails.orderNumber=orders.orderNumber)
                      INNER JOIN customers ON orders.customerNumber=customers.customerNumber AND country='Iran')
                      INNER JOIN employees ON salesRepEmployeeNumber=employeeNumber)
                      INNER JOIN offices ON employees.officeCode=offices.officeCode AND offices.city='Frankfurt');

#5
CREATE VIEW NYCBuyers AS
  SELECT DISTINCT customers.customerNumber
      FROM customers JOIN orders ON customers.customerNumber=orders.customerNumber AND city='Nyc' AND shippedDate='2018-0-10 00:00:00';

SELECT customers.customerNumber,paymentDate, SUM(amount) AS `Pay in a Day`
      FROM customers
        JOIN payments ON customers.customerNumber=payments.customerNumber
                         AND paymentDate='2018-03-12 00:00:00'
                         AND payments.customerNumber IN (SELECT * FROM NYCBuyers)   GROUP BY customers.customerNumber;
#6
INSERT INTO payments VALUES ('52','3567-530','2018-04-22 00:00:00','200');
#7
UPDATE orderdetails
  SET quantityOrdered='2'
  WHERE orderNumber=(SELECT * FROM (SELECT orders.orderNumber
                      FROM (
                        ((orders
                          JOIN orderdetails
                            ON orders.orderNumber = orderdetails.orderNumber AND customerNumber = '67')
                          JOIN products
                            ON products.productCode = orderdetails.productCode AND productLine = '3' AND
                               products.productCode = 'DKC-1532')
                      )) as o
  ) AND productCode='DKC-1532';