-- Usar uma SP
USE [Northwind];

EXECUTE [dbo].[Sales by Year] '1997-12-11', '1997-12-15'	-- só pode ser executada com a sintaxe com que foi definida

-- -----------------------------------------------------------------------
-- Dá erro porque o script de criação deve ser único no batch
-- Para demonstração, selecionar antes de executar
-- é possível usar GO para lidar com essa situação
-- -----------------------------------------------------------------------

-- v1
-- Apagar o procedure
DROP PROCEDURE IF EXISTS
	dbo.uspPartesEsquerdaDireitaMaiusculas;
GO

-- Criar o procedure
CREATE PROCEDURE dbo.uspPartesEsquerdaDireitaMaiusculas @texto NVARCHAR(50), @tamanho INT
AS
	SELECT @texto AS [Texto], UPPER(LEFT(@texto, @tamanho)) AS [Esquerda], UPPER(RIGHT(@texto, @tamanho)) AS [Direita];
GO

-- Usar o procedure
EXEC dbo.uspPartesEsquerdaDireitaMaiusculas 'SQL Server', 3;
GO

EXEC dbo.uspPartesEsquerdaDireitaMaiusculas 'Milena Reis e Sousa', 2;
GO

-- v2
-- Apagar o procedure
DROP PROCEDURE IF EXISTS
	dbo.uspViewOrders;
GO

-- Criar o procedure
CREATE PROCEDURE dbo.uspViewOrders @BeginningDate DATETIME, @EndingDate DATETIME
AS
BEGIN
	SELECT * FROM [dbo].[vOrders] WHERE [OrderDate] BETWEEN FORMAT(@BeginningDate, datetime) AND FORMAT(@EndingDate, datetime)
END
GO

-- 3. Use a procedure
EXEC dbo.uspViewOrders '1997-12-01', '1997-12-31'