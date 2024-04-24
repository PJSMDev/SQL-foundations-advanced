-- Change database context
USE [Northwind];
GO

-- 1. Pa�ses comuns a clientes e fornecedores
-- 12
SELECT [Country] FROM [dbo].[Customers]
INTERSECT
SELECT [Country] FROM [dbo].[Suppliers];
GO

-- 1. Pa�ses e regi�es comuns a clientes e fornecedores
-- 10
SELECT [Country], [Region] FROM [dbo].[Customers]
INTERSECT
SELECT [Country], [Region] FROM [dbo].[Suppliers];
--WHERE Region IS NOT NULL
GO

-- 1. Pa�ses, regi�es e cidades comuns a clientes e fornecedores
-- 4
SELECT [Country], [Region], [City] FROM [dbo].[Customers]
INTERSECT
SELECT [Country], [Region], [City] FROM [dbo].[Suppliers];
GO
