
SELECT DISTINCT TOP 5 ContactName as 'Customers'
FROM Customers

SELECT *
FROM Products
WHERE UnitPrice BETWEEN 20 AND 30

/*OR */
SELECT ProductName, UnitPrice as Price
FROM Products
WHERE UnitPrice BETWEEN 20 AND 30

/*OR*/
SELECT ProductName, UnitPrice as Price
FROM Products
WHERE UnitPrice > 10 AND UnitPrice < 20