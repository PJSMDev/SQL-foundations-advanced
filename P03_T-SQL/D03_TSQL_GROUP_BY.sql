-- Database context
USE [TSQL];
GO

-- 1. Quantos empregados existem.
-- 9
SELECT
	COUNT([empid]) AS 'Nr. employees'
FROM
	[HR].[Employees];
GO
-- ORDER n�o faz sentido, o resultado � um valor escalar

-- 2. Quantos empregados existem por cidade.
-- 5
-- v1
SELECT
	[city],
	COUNT([empid]) AS 'Nr. employees'	-- 2� agrega��o
	-- posso usar o COUNT (ou qualquer tipo de agrupa��o) sem o GROUP BY
	-- implicitamente o agrupamento j� � feito
FROM
	[HR].[Employees]
--WHERE 
--	[city] <> 'Null'
GROUP BY
	[city]	-- 1� agrupamento
ORDER BY
	'Nr. employees' DESC;
GO

-- 2. Quantos empregados existem por cidade.
-- 5
-- v2: desfez o agrupamento
SELECT
	[firstname],
	[city],
	COUNT([empid]) AS 'Nr. employees'	-- 2� agrega��o
FROM
	[HR].[Employees]
--WHERE 
--	[city] <> 'Null'
GROUP BY
	[firstname],
	[city]	-- 1� agrupamento
ORDER BY
	'Nr. employees' DESC;
GO

-- 3. M�dia do pre�o (agrega��o) dos produtos por categoria 
SELECT
	[categoryid] AS 'Category Id',
	AVG([unitprice]) AS 'Average unit price'
FROM
	[Production].[Products]
GROUP BY
	[categoryid]
HAVING
	AVG([unitprice]) >= 30;
GO

-- 3. M�dia do pre�o dos produtos da categoria 1
-- v1: HAVING
SELECT
	[categoryid] AS 'Category Id',
	AVG([unitprice]) AS 'Average unit price'
FROM
	[Production].[Products]
GROUP BY
	[categoryid]
HAVING
	[categoryid] = 1;
GO

-- 3. M�dia do pre�o dos produtos da categoria 1
-- v2: WHERE
SELECT
	[categoryid] AS 'Category Id',
	AVG([unitprice]) AS 'Average unit price'
FROM
	[Production].[Products]
WHERE
	[categoryid] = 1
GROUP BY
	[categoryid];
GO

-- 4. Contagem dos clientes por pa�s, regi�o e cidade e a regi�o n�o pode ser nula
SELECT
	[country],
	[region],
	[city],
	COUNT([custid]) AS 'Total customers'
FROM
	[Sales].[Customers]
WHERE
	[region] IS NOT NULL
GROUP BY
	[country],
	[region],
	[city]
ORDER BY
	'Total customers' DESC;
GO

-- 5. Soma, m�dia, m�ximo e m�nimo dos produtos por categoria
SELECT
	[categoryid] AS 'Category Id',
	SUM([unitprice]) AS 'Unit price sum',
	AVG([unitprice]) AS 'Unit price average',
	MAX([unitprice]) AS 'Unit price maximum',
	MIN([unitprice]) AS 'Unit price minimum'
FROM
	[Production].[Products]
GROUP BY
	[categoryid]
ORDER BY
	[categoryid];
GO

