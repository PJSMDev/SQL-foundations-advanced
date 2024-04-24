/*	--------------------------------------------------------

	--------
	FORMAT
	--------

	FORMAT( value, format [, culture ] )  
	https://docs.microsoft.com/en-us/sql/t-sql/functions/format-transact-sql?view=sql-server-ver15


	------------------------
	Standard numeric formats
	------------------------
	https://docs.microsoft.com/en-us/dotnet/standard/base-types/standard-numeric-format-strings


	------------------------
	Language codes - CULTURE
	------------------------

	Indica: formato da data, carater decimal, carater separador milhares, s�mbolo dinheiro
	Afeta: opera��es de ordena��o e pesquisa

	Portuguese: pt-PT, pt-BR
	English:	en-US, en-GB, ...

	http://www.lingoes.net/en/translator/langcode.htm

-- -------------------------------------------------------- */

-- Database context
USE [Northwind];
GO

-- 1. 
-- From tables
SELECT
	[OrderDate] AS 'Order date',
	FORMAT([OrderDate], 'dd/MM/yyyy') AS 'M�s 1',	-- 01
	FORMAT([OrderDate], 'dd-MMM-yyyy') AS 'M�s 2',	-- jan
	FORMAT([OrderDate], 'dd.MMMM.yy') AS 'M�s 2',	-- janeiro
	-- formatos padr�o
	FORMAT([OrderDate], 'd', 'pt-pt') AS 'Data curta (pt-pt)',
	FORMAT([OrderDate], 'D', 'pt-pt') AS 'Data longa (pt-pt)'
FROM
	[dbo].[Orders];
GO

-- From variables
DECLARE @hora TIME = '19:30:15';
DECLARE @data DATE = '2024-03-21';	-- yyyy-mm-dd declarar sempre neste formato e depois formatar se for preciso

SELECT
	@hora AS 'Hora original',
	FORMAT(@hora, 't') AS 'Hour',
	FORMAT(@hora, 't', 'pt-pt') AS 'Hour (pt-pt)',
	FORMAT(@hora, 't', 'en-us') AS 'Hour (en-us)',
	@data AS 'Data original',
	FORMAT(@data, 'd', 'pt-pt') AS 'Data curta (pt-pt)',
	FORMAT(@data, 'd', 'pt-br') AS 'Data curta (pt-br)',
	FORMAT(@data, 'd', 'en-gb') AS 'Data curta (en-gb)',
	FORMAT(@data, 'D', 'en-gb') AS 'Data curta (pt-br)'
GO
-- n�o h� diferen�a cultural nas horas mas h� nas datas

-- 2. Format numbers

-- Moeda (currency)
SELECT
	[UnitPrice] AS 'Unit price',
	FORMAT([UnitPrice], 'C') AS 'Unit price',
	FORMAT([UnitPrice], 'c', 'pt-pt') AS 'Moeda (pt-pt)',
	FORMAT([UnitPrice], 'C1', 'pt-pt') AS 'Moeda (pt-pt)'
FROM
	[dbo].[Products];
GO

-- Smallint
SELECT
	[UnitsInStock] AS 'Units in stock',
	FORMAT([UnitsInStock], 'N') AS 'N�mero 2 dec',
	FORMAT([UnitsInStock], 'N1') AS 'N�mero 1 dec',
	FORMAT([UnitsInStock], 'G') AS 'Geral 0 dec'
FROM
	[dbo].[Products];
GO

-- Int + Decimal
-- carater literal: '-' (carateres para formatar que n�o fazem parte do valor)
DECLARE @numeroInteiro AS INT = 123456;
DECLARE @numeroDecimal AS DECIMAL(11,2) = 123456789.99;	-- o ponto n�o conta

SELECT
	@numeroInteiro AS 'N�mero inteiro',
	@numeroDecimal AS 'N�mero decimal',
	FORMAT(@numeroDecimal, '### ### ###') AS 'Formato personalizado INT',
	FORMAT(@numeroDecimal, '### ### ###.##') AS 'Formato personalizado DEC',
	FORMAT(@numeroInteiro, 'C', 'pt-pt') AS 'Moeda (pt-pt)',
	FORMAT(@numeroInteiro, 'C', 'pt-br') AS 'Moeda (pt-br)',
	FORMAT(@numeroInteiro, 'C', 'en-us') AS 'Moeda (en-us)',
	FORMAT(@numeroInteiro, 'C0', 'en-zm') AS 'Moeda (en-zm)'
GO
