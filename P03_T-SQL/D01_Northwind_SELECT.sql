-- Change database context
USE [Northwind];
GO

-- Employee data (all: data + columns)
SELECT * FROM [dbo].[Employees];
GO

-- Employee data (full name, city, country)
SELECT [FirstName], [LastName], [City] , [Country] FROM [dbo].[Employees];
GO

-- Employee data (full name, city, country)
-- Ordenar por FirstName
SELECT [FirstName], [LastName], [City] , [Country] FROM [dbo].[Employees] ORDER BY [FirstName];
GO

-- Employee data (full name, city, country)
-- Ordenar por Country e por City (ascendentemente, por default)
SELECT [FirstName], [LastName], [City] , [Country] FROM [dbo].[Employees] ORDER BY [Country], [City];
GO

-- Employee data (full name, city, country)
-- Ordenar por Country e por City (descendentemente)
-- Comando em linha
SELECT [FirstName], [LastName], [City] , [Country] FROM [dbo].[Employees] ORDER BY [Country] DESC, [City] DESC, [FirstName];
GO

-- Employee data (full name, city, country)
-- Ordenar por Country e por City (descendentemente)
-- Comando em bloco
SELECT 
	[FirstName], 
	[LastName], 
	[City] , 
	[Country] 
FROM 
	[dbo].[Employees] 
ORDER BY 
	[Country] DESC, 
	[City] DESC, 
	[FirstName];
GO

-- Empregados: nome completo, morada completa; ordenar por nome
SELECT
	[FirstName] + ' ' + [LastName],	-- concatenar (juntar texto)
	[Address] + ', ' + [PostalCode] + ', ' + [City] + ', ' + [Region] + ', ' + [Country]
FROM
	[dbo].[Employees]
ORDER BY
	[FirstName] + [LastName];
GO

-- Empregados: nome completo, morada completa; ordenar por nome
-- Versão com alias
SELECT
	[FirstName] + ' ' + [LastName] AS 'Full name',	-- concatenar (juntar texto) (alias em plicas ou parênteses retos)
	[Address] + ', ' + [PostalCode] + ', ' + [City] + ', ' + [Region] + ', ' + [Country] AS 'Full address'
FROM
	[dbo].[Employees]
ORDER BY
	'Full name';
GO
-- alias não precisam ser Pascal Case
-- quanto mais explícito, melhor (acentos, espaços, etc...)

-- Concatenar 

