-- Change databse context
USE [Northwind];
GO

-- 1 Aggregate
SELECT
	-- as funções de agregação já fazem agrupamento
	SUM([UnitPrice]) AS 'Total price',
	AVG([UnitPrice]) AS 'Average price',
	MIN([UnitPrice]) AS 'Min price',
	MAX([UnitPrice]) AS 'Max price',
	COUNT([ProductID]) AS 'Total products'
FROM
	[dbo].[Products];
GO

-- 2. Por categoria, os preços agregados e formatados para pt-pt
SELECT
    c.CategoryName AS 'Category',
    FORMAT(SUM(p.UnitPrice), 'C', 'pt-pt') AS 'Total price',
    FORMAT(AVG(p.UnitPrice), 'C', 'pt-pt') AS 'Average price',
    FORMAT(MIN(p.UnitPrice), 'C', 'pt-pt') AS 'Min price',
    FORMAT(MAX(p.UnitPrice), 'C', 'pt-pt') AS 'Max price',
    COUNT(p.ProductID) AS 'Total products'
FROM
    [dbo].[Categories] AS c    
INNER JOIN
    [dbo].[Products] AS p
ON
    c.CategoryID = p.CategoryID
GROUP BY
    c.CategoryName;
GO

