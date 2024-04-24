-- Change database context
USE [Northwind];
GO

-- 1. Clientes de pa�ses sem fornecedores
SELECT [Country] FROM [dbo].[Customers]	-- usa o lado esquerdo como refer�ncia
EXCEPT
SELECT [Country] FROM [dbo].[Suppliers]
GO