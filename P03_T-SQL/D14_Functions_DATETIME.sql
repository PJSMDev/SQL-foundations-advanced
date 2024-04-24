USE [Northwind];
GO

-- 1. Data e hora do sistema (timestamp)
SELECT
	GETDATE() AS 'GETDATE()',	-- datetime USAR ESTA!!!
	CURRENT_TIMESTAMP AS 'CURRENT_TIMESTAMP',	-- datetime
	SYSDATETIME() AS 'SYSDATETIME()',	--datetime2
	YEAR(GETDATE()) AS 'Ano atual';	-- substituível pelo DATEPART()
GO

-- 2. DATEADD(): adicionar ou subtrair datas
SELECT
	[OrderDate] AS 'Order date',
	FORMAT([OrderDate], 'd', 'pt-pt') AS 'Order date pt-pt',
	FORMAT(DATEADD(d, 10, [OrderDate]), 'd', 'pt-pt') AS 'Payment day +10',
	FORMAT(DATEADD(d, -10, [OrderDate]), 'd', 'pt-pt') AS 'Payment day -10',
	FORMAT(DATEADD(m, 1, [OrderDate]), 'd', 'pt-pt') AS 'Payment month +1',
	FORMAT(DATEADD(yy, 1, [OrderDate]), 'd', 'pt-pt') AS 'Payment year +1',
	FORMAT(DATEADD(YYYY, 10, [OrderDate]), 'd', 'pt-pt') AS 'Payment year +10'
FROM
	[dbo].[Orders];
GO

-- 3. FORMAT() + DATEADD() + DATEDIFF()
-- DATEDIFF(datepart, startdate, enddate)
SELECT
	FORMAT([OrderDate], 'dd/MM/yyyy') AS 'Order date',
	FORMAT(DATEADD(d, 10, [OrderDate]), 'dd/MM/yyyy') AS 'Payment day +10',
	DATEDIFF(d, [OrderDate], DATEADD(d, 10, [OrderDate])) AS 'Days untill payment',
	DATEDIFF(m, [OrderDate], DATEADD(d, 10, [OrderDate])) AS 'Months untill payment',
	DATEDIFF(m, [OrderDate], DATEADD(d, 32, [OrderDate])) AS 'Months untill payment'
	-- o DATEDIFF() pode dar valores negativos se o DATEADD() fôr negativo
FROM
	[dbo].[Orders];
GO

-- 3. DATEPART()
-- DATEPART(datepart, date)
-- v1
SELECT
	[OrderDate] AS 'Order date',
	DATEPART(d, [OrderDate]) AS 'Day',
	DATEPART(mm, [OrderDate]) AS 'Month',
	DATEPART(yyyy, [OrderDate]) AS 'Year',
	DATEPART(hh, [OrderDate]) AS 'Hour',
	DATEPART(mi, [OrderDate]) AS 'Minute',
	DATEPART(ss, [OrderDate]) AS 'Second'
FROM
	[dbo].[Orders];
GO

-- v2 -> gosto mais desta forma
SELECT
	[OrderDate] AS 'Order date',
	DATEPART(DAY, [OrderDate]) AS 'Day',
	DATEPART(MONTH, [OrderDate]) AS 'Month',
	DATEPART(YEAR, [OrderDate]) AS 'Year',
	DATEPART(HOUR, [OrderDate]) AS 'Hour',
	DATEPART(MINUTE, [OrderDate]) AS 'Minute',
	DATEPART(SECOND, [OrderDate]) AS 'Second'
FROM
	[dbo].[Orders];
GO

-- 5. DAY(), MONTH(), YEAR()
SELECT
	[OrderDate] AS 'Order date',
	DAY([OrderDate]) AS 'Day',
	MONTH([OrderDate]) AS 'Month',
	YEAR([OrderDate]) AS 'Year'
	-- não existe equivalente para horas, minutos, segundos...
	-- para isso usar o DATEPART() (acima)
FROM
	[dbo].[Orders];
GO

-- 6. DATENAME()
-- DATENAME(datepart, date)
SELECT
	[OrderDate] AS 'Order date',
	DATEPART(D, [OrderDate]) AS 'Day',
	DATEPART(M, [OrderDate]) AS 'Month number',
	DATENAME(M, [OrderDate]) AS 'Month name',
	DATENAME(D, [OrderDate]) AS 'Day name',	-- não faz sentido para o nome do dia
	-- só funciona com o nome dos meses
	DATEPART(YYYY, [OrderDate]) AS 'Year'
	-- não existe equivalente para horas, minutos, segundos...
	-- para isso usar o DATEPART() (acima)
FROM
	[dbo].[Orders];
GO

-- 7. Variables + functions
DECLARE @timestamp AS DATETIME = GETDATE();
DECLARE @date AS DATE = '2024-03-21';
DECLARE @time AS TIME = '21:15:10';

SELECT
	YEAR(@timestamp) AS 'Timestamp: ano',
	MONTH(@date) AS 'Timestamp: nº do mês',
	DAY(@date) AS 'Timestamp: dia',
	DATEPART(HOUR, @timestamp) AS 'Timestamp: hour',
	DATEPART(MINUTE, @time) AS 'Timestamp: minute',
	DATEPART(SECOND, @time) AS 'Timestamp: second';
	-- porque não há funções para minutos e segundos
	-- podia ter manipulado a @timestamp em todos eles porque tem toda a informação que todas as funções deste exemplo precisam
GO