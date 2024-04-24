-- Change database context
USE [Northwind]
GO

-- 1. Todos os clientes, independentemente de terem ordens
-- v1 LEFT OUTER JOIN
-- 832
-- OUTER JOIN detetar anomalias
-- clientes que não têm faturas
SELECT
	c.CompanyName AS 'Customer',
	o.OrderID AS 'Order nro.',
	FORMAT(o.OrderDate, 'd', 'pt-PT') AS 'Date'
FROM
	[dbo].[Customers] AS c
LEFT OUTER JOIN
	[dbo].[Orders] AS o
ON
	c.CustomerID = o.CustomerID
ORDER BY
	o.OrderID;
GO

-- v2 RIGHT ORDER ID
SELECT
	c.CompanyName AS 'Customer',
	o.OrderID AS 'Order nro.',
	FORMAT(o.OrderDate, 'd', 'pt-PT') AS 'Date'
FROM
	[dbo].[Orders] AS o
RIGHT OUTER JOIN
	[dbo].[Customers] AS c
ON
	c.CustomerID = o.CustomerID
ORDER BY
	o.OrderID;
GO

-- 2. Todos os clientes sem ordens (clientes que não compraram nada)
-- 2
SELECT
	c.CompanyName AS 'Customer',
	o.OrderID AS 'Order nro.',
	FORMAT(o.OrderDate, 'd', 'pt-PT') AS 'Date'
FROM
	[dbo].[Customers] AS c
LEFT OUTER JOIN
	[dbo].[Orders] AS o
ON
	c.CustomerID = o.CustomerID
WHERE
	o.OrderID IS NULL
ORDER BY
	o.OrderID;
GO

-- 3. Quais os clientes que em 1998 fizeram compras?
-- 270
SELECT
    c.CompanyName AS 'Customer',
    --FORMAT(o.OrderDate, 'dd-MM-yyyy') AS 'Date',
	FORMAT(o.OrderDate, 'd', 'pt-PT') AS 'Date',
    o.OrderID AS 'Order Id'
FROM
    [dbo].[Customers] AS c
LEFT OUTER JOIN
    [dbo].[Orders] AS o
ON
    c.CustomerID = o.CustomerID
WHERE
    YEAR(o.OrderDate) = 1998
	--o.OrderDate BETWEEN '1998-01-01' AND '1998-12-31'
ORDER BY
    c.CompanyName;
GO

-- 4. Todos os fornecedores e os seus produtos com right outer join.
-- 77
SELECT
	s.CompanyName,
	p.ProductName
FROM
	[dbo].[Products] AS p
RIGHT OUTER JOIN
	[dbo].[Suppliers] AS s
ON
	s.SupplierID = p.SupplierID
ORDER BY
	s.CompanyName,
	p.ProductName;
GO
