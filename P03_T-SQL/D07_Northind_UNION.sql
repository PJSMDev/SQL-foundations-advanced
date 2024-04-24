-- Change database context
USE [Northwind];
GO

-- 1. Países com clientes ou fornecedores
-- v1: Sem UNION
SELECT [Country] FROM [dbo].[Customers] ORDER BY [Country]; -- 91
SELECT DISTINCT [Country] FROM [dbo].[Customers] ORDER BY [Country];	 -- 21
SELECT [Country] FROM [dbo].[Suppliers] ORDER BY [Country]; -- 16

-- v2: Com UNION (com distinct)
-- 25
SELECT DISTINCT [Country] FROM [dbo].[Customers]
UNION
SELECT [Country] FROM [dbo].[Suppliers]
ORDER BY [Country];
GO

-- v3: Com UNION ALL (sem distinct)
-- 120
SELECT [Country] FROM [dbo].[Customers]
UNION ALL
SELECT [Country] FROM [dbo].[Suppliers]
ORDER BY [Country];
GO

