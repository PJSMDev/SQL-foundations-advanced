-- -----------------------------------------------------
-- 1. Manipular a string 'Microsoft SQL Server 2015'
-- -----------------------------------------------------

-- 1. Declarar variáveis (camelCase)
DECLARE @sqlServer AS nvarchar(50);
DECLARE @lastYear AS char(4);
DECLARE @newYear AS char(4);

-- GO -- erro -> assinala o fim de um batch

-- 2. Atribuir valores às variáveis
SET @sqlServer = 'Microsoft SQL Server 2015';
SET @lastYear = '2015';
SET @newYear = '2019';

-- 3. Declarar e atribuir
DECLARE @edition AS nvarchar(25) = 'Enterprise Edition';

-- GO -- erro -> assinala o fim de um batch

-- 4. Usar as variáveis com funções String
SELECT
	UPPER(@sqlServer) AS 'Upper',
	LOWER(@sqlServer) AS 'Lower',
	LEFT(@sqlServer, 9) AS 'Left',
	SUBSTRING(@sqlServer, 11, 3) AS 'Substring',
	RIGHT(@sqlServer, 4) AS 'Right',
	LEN(@sqlServer) AS 'Len',
	REPLACE(@sqlServer, '2015', '2019') AS 'Replace (without variables)',
	REPLACE(@sqlServer, @lastYear, @newYear) AS 'Replace (with variables)';
GO -- não causa erro, todo o script é um batch

-- 2. O nome completo em maiúsculas dos clientes da AdventureWorks e o seu comprimento
-- Ordenar DESC pelo comprimento
-- Só os 10 primeiros
-- BD: AdventureWorkds2019
-- v1: WHERE
-- 10
USE [AdventureWorks2019];
GO

SELECT TOP 10
    UPPER(CONCAT_WS(' ', p.FirstName, p.MiddleName, p.LastName)) AS 'Client name',
    LEN(CONCAT_WS(' ', p.FirstName, p.MiddleName, p.LastName)) AS 'Name length'
FROM
    [Person].[Person] AS p
WHERE
	p.PersonType = 'IN' -- Person-Person/Columns/properties/extended properties
	-- podia também ter usado um JOIN
ORDER BY
    'Name length' DESC;
GO

-- v2: JOIN
-- 10
SELECT TOP 10
    UPPER(CONCAT_WS(' ', p.FirstName, p.MiddleName, p.LastName)) AS 'Client name',
    LEN(CONCAT_WS(' ', p.FirstName, p.MiddleName, p.LastName)) AS 'Name length'
FROM
	[Sales].[Customer] AS c
INNER JOIN
	[Person].[Person] AS p
ON
	c.PersonID = p.BusinessEntityID
ORDER BY
    'Name length' DESC;
GO

-- -------------------------------------------------------------
-- 3. Get an automatic email from your name
--	  (use 'learning.pt' as email domain)
--    Ex:
--		Milena Reis e Sousa
--		m.sousa@learning.pt
--	  Pedido:
--		Usar variáveis para os diferentes componentes do email
--	  Dicas:
--		REVERSE(), CHARINDEX()
-- -------------------------------------------------------------
DECLARE @fullName AS nvarchar(50) = 'Paulo Silva Melo';
DECLARE @firstLetter AS nvarchar(1) = LEFT(LOWER(@fullName), 1);
DECLARE @ponto AS char(1) = '.';
DECLARE @arroba AS char(1) = '@';
DECLARE @domain AS nvarchar(20) = 'learning.pt';
-- DECLARE @lastSpacePosition AS int = CHARINDEX(' ', @fullName, 5);
DECLARE @lastName AS nvarchar(20) = LOWER(REVERSE(SUBSTRING(REVERSE(@fullname), 1, CHARINDEX(' ', REVERSE(@fullname)) -1)));
-- usar RIGHT: muito mais simples
DECLARE @newEmail AS nvarchar(100) = CONCAT(@firstLetter, @ponto, @lastName, @arroba, @domain);

SELECT
	@fullName AS 'Name',
	@newEmail AS 'E-mail';
	-- versão da Milena
	-- @fullName AS 'Name',
	-- LOWER(CONCAT(@firstLetter, @dot, @lastName, @at, @domain)) AS 'E-mail';
GO
