-- Change database context
USE [Northwind];
GO

-- 1. Clientes de países sem fornecedores
SELECT [Country] FROM [dbo].[Customers]	-- usa o lado esquerdo como referência
EXCEPT
SELECT [Country] FROM [dbo].[Suppliers]
GO