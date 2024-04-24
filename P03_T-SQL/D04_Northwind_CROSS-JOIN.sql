-- Change database context
USE [Northwind];
GO

-- 1. Listar as tabelas separadamente
-- 4 + 53
SELECT * FROM [dbo].[Region];

SELECT * FROM [dbo].[Territories];
GO

-- 2. Cross join entre as tabelas
-- 4 * 53 = 212
SELECT
	r.RegionID AS 'Region #',	-- ou t.RegionID
	r.RegionDescription AS 'Region description',
	t.TerritoryDescription AS 'Territory description'
FROM
	[dbo].[Region] AS r
CROSS JOIN
	[dbo].[Territories] AS t
ORDER BY
	r.RegionDescription,
	t.TerritoryDescription;
GO

-- Four part names (não usar)
-- caminho completo
-- [Formacaolimpa].[Northwind].[dbo].[Region].[RegionDescription]
-- Servidor.BD.schema.Tabela.Coluna
-- Two part names (usar)
-- schema.tabela
