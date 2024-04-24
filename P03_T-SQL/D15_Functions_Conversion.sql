/*	--------------------------------------------------------
	CONVERSION FUNCTIONS


	CAST ( expression AS data_type [ ( length ) ] )  
	
	CONVERT ( data_type [ ( length ) ] , expression [ , style ] )  

	https://docs.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-ver15	

-- -------------------------------------------------------- */
-- 1. CAST(): Converter um número noutro número
-- CAST ( expression AS data_type [ ( length ) ] )
-- converte um dado de um tipo noutro

-- Auto cast
-- evitar auto cast a todo o custo
SELECT
	10 + 10,	-- 20
	10 + '20',	-- 30
	-- 10 + '1a'	-- nok
	50 - '10',	-- 40
	'20' * 4,	-- 80
	500 / '50';	-- 10
GO

-- Force cast before calculation
SELECT
	10 + 10,
	10 - CAST('20' AS int),
	CAST(10 AS char(2)) + '1a',	-- 1a1a: como são strings o + concatena-as
	50 - CAST('10' AS int),
	CAST('20' AS int) * 4,
	500 / CAST('50' AS int);
GO

-- Cast
SELECT
	CAST(0.1 AS int) AS [Decimal to Int],
	CAST('10' AS int) AS [String to Int],
	CAST('11-13-2021' AS date) AS [String to Date1],	-- yyy-dd-13
	CAST('11/13/2021' AS date) AS [String to Date2],
	CAST('2021/11/13' AS date) AS [String to Date3];	-- yyyy-mm-dd
GO

SELECT 
	SYSDATETIME(),
	CAST(SYSDATETIME() AS date),
	CAST(SYSDATETIME() AS time);
GO

SELECT CAST(SYSDATETIME() AS int);	-- Erro
-- uma data não pode ser convertida para um inteiro
GO

SELECT
	SYSDATETIME(),
	CAST(SYSDATETIME() AS varchar(30));	-- não dá erro
GO

-- DB
USE Northwind;
GO

SELECT
	[OrderDate],
	CAST([OrderDate] AS date) AS Date1,	-- muda o tipo do dado
	-- posso converter com o CAST() e converter a seguir para poder usar os dados em cálculo
	FORMAT([OrderDate], 'yyyy-MM-dd') AS Date2	-- mais consumista
	-- não muda o tipo, FORMAT() devolve strings
FROM
	[dbo].[Orders];
GO

-- -----------------------------------------------------------
-- 2. CONVERT(): Converter dados de um tipo noutro tipo
-- CONVERT ( data_type [ ( length ) ] , expression [ , style ] )
-- a diferença entre ambas está na sintaxe e na funcionalidade mas cumprem a mesma função
-- CONVERT() é mais atual que o CAST()
-- -----------------------------------------------------------
SELECT
	CONVERT(char(8), GETDATE(), 112) AS ISO_style,		-- yyyymmdd
	CONVERT(char(10), GETDATE(), 103) AS FR_style,
	CONVERT(char(10), GETDATE(), 105) AS PT_style,		-- italian
	CONVERT(char(11), GETDATE()) AS US_default_style;
GO

SELECT
	CONVERT(int, 25.65) AS [Decimal to Int],
	-- é possível guardar numa variável, usar ROUND() e depois converter
	CONVERT(int, '10') AS [String to Int], 
	CONVERT(date, '04-11-2019') AS [String to Date],
	CONVERT(date, '04-11-2019', 103) AS [String to Varchar, France],
	CONVERT(date, '04-11-2019', 105) AS [String to Varchar, Europe],
	CONVERT(date, '04-11-2019', 110) AS [String to Varchar, US];
GO

-- 	TRY_CONVERT ( data_type [ ( length ) ], expression [, style ] )
-- tenta converter dados de um tipo noutro e se não conseguir, em vez de causar erro (como a CONVERT()) devolve NULL
SELECT
	10 + TRY_CAST('1A' AS int) AS [TRY_CAST],	-- null
--	10 + CONVERT(int, '1A') AS [TRY_CONVERT],
-- dá erro porque não consegue converte uma string que não tem (apenas) uma data (texto corrido) numa data
	10 + TRY_CONVERT(int, '1A') AS [TRY_CONVERT],
--	10 + CONVERT(int, '1A') AS [CONVERT],
-- dá erro porque não consegue converter a string '1A' num valor numérico (por causa do caracter 'A') e não é possível somar um número (10) a um não número, neste caso, uma string
	10 + TRY_PARSE('1A' AS int) AS [TRY_PARSE],
	10 + '20';
-- type cast automático -> evitar!!!
GO
-- não suspende o script em caso de erro

-- -----------------------------------------------------------
-- 3. PARSE(): Converter uma string num número (date, time, number)
--	PARSE ( string_value AS data_type [ USING culture ] ) 
-- dá erro se falar a conversão
-- -----------------------------------------------------------
SELECT
	PARSE('12/31/2012' AS datetime2 USING 'en-US') AS [Datetime2],
	PARSE('31/12/2012' AS date USING 'pt-PT') AS [Date pt_PT],
	PARSE('12/31/2012' AS date) AS [Date];
	-- PARSE() com a culture converte e formata simultaneamente
GO

-- -----------------------------------------------------------
-- 4. TRY_PARSE(): Converter de forma segura, sem dar erro
-- 	TRY_PARSE ( string_value AS data_type [ USING culture ] )
-- devolve null em vez de erro se falar a conversão
-- -----------------------------------------------------------
SELECT PARSE('SQL Server' AS date USING 'pt-PT') AS parse_result;			-- error
GO

SELECT TRY_PARSE('SQL Server' AS date USING 'pt-PT') AS try_parse_result;	-- null, not error
GO
-- não suspende o script em caso de erro

