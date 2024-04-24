USE [AdventureWorks2019];
GO

-- Nome e côr e se fôr NULL mudar para '' em New color
-- v1
-- 504
SELECT
	p.Name AS 'Name',
	p.Color AS 'Color',
	IIF(p.Color IS NULL, '', p.Color) AS 'New color'
FROM
	[Production].[Product] as p;
GO

-- v2. ISNULL (implementação Microsoft (não universal))
-- 504
SELECT
	p.Name AS 'Name',
	p.Color AS 'Color',
	ISNULL(p.Color, '') AS 'New color'
FROM
	[Production].[Product] as p;
GO

-- 3. COALESCE (universal)
-- v1
-- 504
SELECT
	p.Name AS 'Name',
	p.Color AS 'Color',
	COALESCE(p.Color, '') AS 'New color COALESCE'
FROM
	[Production].[Product] as p;
GO

-- 3. COALESCE (universal)
-- v2
-- 504
USE [Northwind];
GO

SELECT
	[CompanyName],
	[Region],
	[City],
	[Address],
	COALESCE([Region], [City], [Address]) AS 'Location'
FROM
	[dbo].[Customers]
ORDER BY
	[CompanyName];
GO
