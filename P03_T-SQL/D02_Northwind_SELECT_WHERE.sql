-- Database conext
USE [Northwind];
GO

-- 0. Todos os produtos
-- 73
SELECT
	[ProductName]
FROM
	[dbo].[Products]
ORDER BY
	[ProductName];
GO

-- 1. Ver todos os produtos ordenados ASC pelo preço unitário
-- 72
SELECT
	[ProductName],
	[UnitPrice]
FROM
	[dbo].[Products]
ORDER BY
	[UnitPrice], [ProductName];
GO

-- 2. Ver os produtos começados por a, ordenados ASC pelo preço unitário
-- 2
SELECT
	[ProductName],
	[UnitPrice]
FROM
	[dbo].[Products]
WHERE
	--[ProductName] = 'a'	-- igual a
	[ProductName] LIKE 'a%'	-- começado por a
ORDER BY
	[UnitPrice], [ProductName];
GO

-- 3. Ver os produtos terminados com 's', ordenados ASC pelo preço unitário
-- 9
SELECT
	[ProductName],
	[UnitPrice]
FROM
	[dbo].[Products]
WHERE
	--[ProductName] = 'a'	-- igual 'a'
	[ProductName] LIKE '%s';	-- começado por 's'
--ORDER BY
--	[UnitPrice], [ProductName];
GO

-- 4. Clientes (empresa, contato) cujo nome da empresa contém 'com' (não sabemos princípio nem fim)
-- 5
SELECT
	[CompanyName],
	[ContactName]
FROM
	[dbo].[Customers]
WHERE
	[CompanyName] LIKE '%com%';
GO

-- 6. Operadores aritméticos
SELECT 
	10 + 10 AS 'Adição (+)',
	10 - 10 AS 'Subtração (-)',
	10 * 10 AS 'Multiplicação (*)',
	10 / 10 AS 'Divisão (/)',
	10 % 10 AS 'Resto da divisão inteira (%)'
GO
-- LIKE '____a%' só sei que o quinto caracter é o 'a'

-- Produtos (nome, preço) cujo preço é superior a 50
--7
SELECT
	[ProductName], 
	[UnitPrice]
FROM
	[dbo].[Products]
WHERE
	[UnitPrice] > 50;
GO

-- Produtos (nome, preço) cujo 3º carater do nome é 'u'
-- 5
SELECT
	[ProductName], 
	[UnitPrice]
FROM
	[dbo].[Products]
WHERE
	[ProductName] LIKE '__u%';
GO

-- Clientes (nome, contato, cidade, região) que não sejam de Berlin e região não pode ser nula
-- 31
SELECT
	[CompanyName],
	[ContactName],
	[City],
	[Region]
FROM
	[dbo].[Customers]
WHERE
	[City] <> 'Berlin' AND 
	[Region] <> 'NULL' AND
	[City] <> '' AND
	[Region] <> '';
GO

-- Clientes (nome, contato, cidade, região) de France, Spain, Germany, Brazil ou USA; ordenar por país, região e cidade
-- versão OR (normalmente mais consumista)
-- 49
SELECT
	[CompanyName],
	[ContactName],
	[City],
	[Region]
FROM
	[dbo].[Customers]
WHERE
	[Country] = 'France' OR
	[Country] = 'Spain' OR
	[Country] = 'Germany' OR
	[Country] = 'Brazil' OR
	[Country] = 'USA'
ORDER BY
	[Country], 
	[Region], 
	[City];
GO

-- Clientes (nome, contato, cidade, região) de France, Spain, Germany, Brazil ou USA; ordenar por país, região e cidade não podendo a região ser nula ou vazia
-- versão IN (normalmente menos consumista)
-- 22
SELECT
	[CompanyName],
	[ContactName],
	[City],
	[Region]
FROM
	[dbo].[Customers]
WHERE
	[Country] IN ('France', 'Spain', 'Germany', 'Brazil', 'USA') AND
	[Region] <> 'NULL' AND
	[Region] <> ''
ORDER BY
	[Country], 
	[Region], 
	[City];
GO

-- 9. Dos produtos com preço compreendido entre 40 e 200
-- 12
SELECT
	[ProductName],
	[UnitPrice]
FROM
	[dbo].[Products]
WHERE
	[UnitPrice] BETWEEN 40 AND 200
ORDER BY
	[UnitPrice];
GO

-- 10. Dos produtos com preço compreendido entre 40 e 200, os 5 mais caros
-- 5
SELECT TOP 5
	[ProductName],
	[UnitPrice]
FROM
	[dbo].[Products]
WHERE
	[UnitPrice] BETWEEN 40 AND 200
ORDER BY
	[UnitPrice] DESC;
GO

-- 11. Dos produtos com preço compreendido entre 40 e 200, os 5 mais caros, calcular o novo preço (desconto 10%)
-- [UnitPrice] * (100% - 10%)
-- [UnitPrice] * (1 - 0,1)
-- UnitPrice e New unit price são de tipos diferentes (um usa , e o outro usa . e não dá para fazer cálculos entre eles)
-- 5
SELECT TOP 5
	[ProductName],
	[UnitPrice],
	[UnitPrice] * .1 AS 'Discount',
	[UnitPrice] * .9 AS 'New unit price'
FROM
	[dbo].[Products]
WHERE
	[UnitPrice] BETWEEN 40 AND 200
ORDER BY
	'New unit price';
GO

-- 12. Produtos, preços e indicação se são caros (superior a 50) ou baratos
-- IIF(boolean_expression, true_value, false_value)
-- 77
SELECT
	[ProductName] AS 'Product name',
	[UnitPrice] AS 'Unit price',
	IIF([UnitPrice] > 50, 'Expensive', 'Cheap') AS 'Classification'
FROM
	[dbo].[Products]
ORDER BY
	'Classification',
	[ProductName];
GO

-- 13. Produtos, preços, novo preço (barato, acresce 10%; caro, desconta 10%) e indicação se são caros (superior a 50), normais ou baratos (inferior a 25)
-- v1
-- 77
SELECT
	[ProductName] AS 'Product name',
	[UnitPrice] AS 'Unit price',
	IIF([UnitPrice] < 25, 'Cheap', IIF([UnitPrice] > 50, 'Expensive', 'Normal')) AS 'Classification'
FROM
	[dbo].[Products];
--ORDER BY
--	'Classification',
--	[ProductName];
GO

-- v2
-- 77
SELECT
	[ProductName] AS 'Product name',
	[UnitPrice] AS 'Previous price',
	IIF([UnitPrice] < 25, [UnitPrice] * 1.1, IIF([UnitPrice] > 50, [UnitPrice] * .9, [UnitPrice])) AS 'New price',
	IIF([UnitPrice] < 25, 'Cheap', IIF([UnitPrice] > 50, 'Expensive', 'Normal')) AS 'Classification'
FROM
	[dbo].[Products];
--ORDER BY
--	'Classification',
--	[ProductName];
GO

-- 14. Create a list of employees with the employee full name
-- in upper case in one column and create an output column name
-- gender based on the Title of Courtesy field (Mrs. and Ms.
-- are females and Mr. are males). Consider that may be an
-- employee with no gender that should appear as Unknown (edited) 
-- v1: IIF
-- 9
SELECT
	UPPER(CONCAT_WS(' ', [FirstName], [LastName])) AS 'Full name',
	[TitleOfCourtesy] AS 'Title of Courtesy',
	IIF([TitleOfCourtesy] IN('Mrs.', 'Ms.'), 'F', 
		IIF([TitleOfCourtesy] = 'Mr.', 'M', 'U')
	) AS 'Gender'	-- programação em bloco
FROM
	[dbo].[Employees];
GO

-- v2: CASE (enumerações - lista fechada de valores)
-- 9
SELECT
	UPPER(CONCAT_WS(' ', [FirstName], [LastName])) AS 'Full name',
	[TitleOfCourtesy] AS 'Title of Courtesy',
	CASE
		WHEN [TitleOfCourtesy] = 'Ms.' OR [TitleOfCourtesy] = 'Mrs.' THEN 'F'
		WHEN [TitleOfCourtesy] = 'Mr.' THEN 'M'
		ELSE 'U'
	END AS 'Gender'
FROM
	[dbo].[Employees];
GO -- Microsoft, pode ser alterado

-- v3: CASE e IN (enumerações - lista fechada de valores)
-- 9
-- mais legível que IIF
-- mais fácil acrescentar mais casos do que usando o IIF
SELECT
	UPPER(CONCAT_WS(' ', [FirstName], [LastName])) AS 'Full name',
	[TitleOfCourtesy] AS 'Title of Courtesy',
	CASE
		WHEN [TitleOfCourtesy] IN('Ms.', 'Mrs.') THEN 'F'
		WHEN [TitleOfCourtesy] = 'Mr.' THEN 'M'
		ELSE 'U'
	END AS 'Gender'
FROM
	[dbo].[Employees];
GO	-- Microsoft, pode ser alterado
