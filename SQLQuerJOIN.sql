/*SQL Query 1 INNER JOIN*/
/*Afisati toti clientii care au plasat comenzi*/
SELECT dbo.Customers.ContactName
FROM dbo.Orders
INNER JOIN Customers ON dbo.Customers.CustomerID = dbo.Orders.CustomerID
GROUP BY dbo.Customers.ContactName

/*SQL Query 2 INNER JOIN*/

/*Afisati ID-ul clientului si numarul produselor comandate intre 1998.03.01 si 1998.03.31 pe o coloana denumita OrdersNumber Ordonati datele dupa CustomerID*/
SELECT dbo.Orders.CustomerID, COUNT(*)  AS OrderNumbers
FROM Orders
INNER JOIN Customers ON dbo.Customers.CustomerID = dbo.Orders.CustomerID
INNER JOIN dbo.[Order Details] on [Order Details].OrderID = dbo.Orders.OrderID
WHERE Orders.OrderDate >= '1995-03-01' AND Orders.OrderDate <= '1998-03-31'
GROUP BY Orders.CustomerID

/*SQL Query 1 RIGHT JOIN*/

/*Afiseaza ID-ul comenzii si numele angajatului care a procesat comanda folsind RIGHT JOIN*/
SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
FROM Orders
RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
ORDER BY Orders.OrderID

/*SQL Query TEMA*/
/*1. Afiseaza numele produsului si pretul, pentru produsul cu cel mai mare pret de lista vandut dupa 1995-04-01 (inclusiv această dată). 
Vei avea nevoie de 3 tabele: Orders, Order Details, Products*/
SELECT TOP 1 Products.ProductName, Products.UnitPrice As 'BiggestPrice'
FROM Orders
JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
JOIN Products ON [Order Details].ProductID = Products.ProductID
WHERE Orders.OrderDate >= '1995-04-01'
ORDER BY Products.UnitPrice DESC;

/*2. Afiseaza pentru fiecare client, numărul de comenzi plasate în martie 1995.
Ordoneaza dupa CustomerID.*/
SELECT Customers.CustomerID, COUNT(*) as OrdersNumber
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE MONTH(Orders.OrderDate) = 3 AND YEAR(Orders.OrderDate) = 1995
GROUP BY Customers.CustomerID
ORDER BY Customers.CustomerID;

/*Afiseaza produsele care nu au fost comandate.*/
SELECT Products.ProductID, Products.ProductName
FROM Products
LEFT JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
WHERE [Order Details].OrderID IS NULL;


/*SQL Query 2 LEFT JOIN*/
/*Afiseaza numele de contact al clientuilui si ID-ul comenzii pe care a plasat-o folosind LEFT JOIN*/
SELECT Customers.ContactName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.ContactName

/*SQL Query 3 FULL JOIN*/
/*Afiseaza numele de contact al clientuilui si ID-ul comenzii pe care a plasat-o folosind FULL JOIN*/
SELECT Customers.ContactName, Orders.OrderID
FROM Customers
FULL JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.ContactName

/*SQL Query 1, COUNT, GROUP BY, INNER JOIN, ALIAS*/
/*Afiseaza numarul de produse din fiecare categorie grupate dupa Category Name*/
SELECT CategoryName, COUNT(ProductID) AS ProductsNumber
FROM Products
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID
GROUP BY Categories.CategoryName

/*COUNT*/
/*Afiseaza nr de clienti din fiecare tara, daca numarul de clienti din tara respectiva este mai mare decat 5*/
SELECT COUNT(CustomerID) AS Customers, Country as Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5




