/* SQL Query 1*/
SELECT ProductName, QuantityPerUnit, UnitPrice
FROM dbo.Products
ORDER BY ProductName DESC

/* SQL Query 2*/

SELECT ProductName, QuantityPerUnit, UnitPrice
FROM dbo.Products
WHERE UnitsInStock >= 10 AND UnitPrice <= 30
ORDER BY ProductName, UnitPrice

/* SQL Query 3*/

SELECT FirstName, LastName
FROM Employees
WHERE BirthDate = (SELECT MAX(BirthDate) FROM Employees)

/* SQL Query 4*/

SELECT FirstName, LastName, Title
FROM Employees
WHERE Title = 'Sales Representative' or Title ='Sales Manager'
/*Folosim OR ca sa ii returneze pe ambii indiferent ca au un titlu sau altul*/ 

/* SQL Query 5*/

SELECT * 
FROM Employees
WHERE City <> 'London'
ORDER BY Title ASC, FirstName DESC

/* SQL Query 5*/

SELECT * 
FROM Employees
WHERE City != 'London'
ORDER BY Title ASC, FirstName DESC

/* SQL Query 5*/

SELECT * 
FROM Employees
WHERE City = 'London'
ORDER BY Title ASC, FirstName DESC

/* SQL Query 6*/

SELECT FirstName, LastName, BirthDate, 
FROM Employees
WHERE BirthDate = (SELECT MIN(BirthDate) FROM Employees)

/*OR*/
SELECT FirstName, LastName, BirthDate,  DATEDIFF(YEAR, BirthDate, GETDATE()) AS Age
FROM Employees
WHERE BirthDate = (SELECT MIN(BirthDate) FROM Employees)

/*SQL Query 7*/

SELECT City, CompanyName, ContactName
FROM dbo.Customers
WHERE City LIKE'A%' OR City LIKE'B%'
ORDER BY ContactName DESC

/*SQL Query 8 */

SELECT FirstName, LastName
FROM Employees
WHERE FirstName LIKE '[J-M]%'

