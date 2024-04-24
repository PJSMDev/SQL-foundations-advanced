-- Change database context
USE [Northwind];
GO

-- 1. Inner join
-- 53
SELECT
	r.RegionID AS 'Region #',
	r.RegionDescription AS 'Region description',
	t.TerritoryDescription AS 'Territory description'
FROM
	[dbo].[Region] AS r -- tabela da esquerda
INNER JOIN
	[dbo].[Territories] as t -- tabela da direita
ON
	r.RegionID = t.RegionID	-- campo de ligação
ORDER BY
	'Region description',
	'Territory description';
GO

-- 2. Categorias (nome) e produtos (nome e PU), ordenar como na imagem
-- 77
SELECT
	c.CategoryName AS 'Category',
	p.ProductName AS 'Product',
	p.UnitPrice AS 'Unit price'
FROM
	[dbo].[Categories] AS c
INNER JOIN
	[dbo].[Products] AS p
ON
	c.CategoryID = p.CategoryID
ORDER BY
	c.CategoryID,
	p.UnitPrice DESC;
GO

-- 3. categorias, produtos e fornecedores
-- 77
SELECT
	c.CategoryName AS 'Category',
	p.ProductName AS 'Product',
	s.CompanyName AS 'Supplier',
	CONCAT_WS(', ', s.City, s.Region, s.Country) AS 'Supplier location'
FROM
	[dbo].[Suppliers] AS s
INNER JOIN
	[dbo].[Products] AS p
ON
	s.SupplierID = p.SupplierID
INNER JOIN
	[dbo].[Categories] AS c
ON
	c.CategoryID = p.CategoryID
ORDER BY
	'Supplier';
GO

-- 4. quantos produtos existem por categoria e o seu preço médio
-- 8
SELECT
    c.CategoryName AS Category,
    COUNT(p.ProductID) AS 'Product Count',
    AVG(p.UnitPrice) AS 'Average Price'
FROM
    dbo.Categories AS c
INNER JOIN
    dbo.Products AS p
ON
    c.CategoryID = p.CategoryID
GROUP BY
    c.CategoryName;
GO

-- 5. Compra (nº, data e quantidade), categoria (nome), produto (nome, preço), cliente (nome), fornecedor (nome), colaborador (APELIDO, Nome)
-- 2155
SELECT
	o.OrderID AS 'Order nro.',
	FORMAT(o.OrderDate, 'dd-MM-yyyy') AS 'Date',
	od.Quantity AS 'Quantity',
	c.CategoryName AS 'Category',
	p.ProductName AS 'Product',
	FORMAT(p.UnitPrice, 'C2', 'pt-PT') AS 'Unit price',
	co.CompanyName AS 'Customer',
	s.CompanyName AS 'Supplier',
	CONCAT_WS(', ', UPPER(e.LastName), e.FirstName) AS 'Employee'
FROM
	[dbo].[Orders] AS o
INNER JOIN
	[dbo].[Order Details] AS od
ON
	o.OrderID = od.OrderID
INNER JOIN
	[dbo].[Products] AS p
ON
	od.ProductID = p.ProductID
INNER JOIN
	[dbo].[Categories] AS c
ON
	p.CategoryID = c.CategoryID
INNER JOIN
	[dbo].[Customers] AS co
ON
	o.CustomerID = co.CustomerID
INNER JOIN
	[dbo].[Suppliers] AS s
ON
	p.SupplierID = s.SupplierID
INNER JOIN
	[dbo].[Employees] AS e
ON
	e.EmployeeID = o.EmployeeID
ORDER BY
	o.OrderID,
	od.Quantity
GO

-- 6. Categoria (nome), produto (nome, PU, novo PU, diferença entre os preços)
-- 10
SELECT
	c.CategoryName AS 'Category',
	p.ProductName AS 'Product',
	FORMAT(p.UnitPrice, 'C2', 'pt-PT') AS 'Unit price',
	FORMAT(p.UnitPrice * 1.1, 'C2', 'pt-PT') AS 'Unit price +10%',
	FORMAT(p.UnitPrice - p.UnitPrice * 1.1, 'C2', 'pt-PT') AS 'Diff prices'
FROM
	[dbo].[Categories] AS c
INNER JOIN
	[dbo].[Products] AS p
ON
	c.CategoryID = p.CategoryID
WHERE
	p.UnitPrice > 45.00
ORDER BY
	p.UnitPrice DESC
GO
