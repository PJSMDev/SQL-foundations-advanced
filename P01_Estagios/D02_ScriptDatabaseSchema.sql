USE [master]
GO
/****** Object:  Database [Estagios]    Script Date: 05/03/2024 19:37:18 ******/
CREATE DATABASE [Estagios]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Estagios', FILENAME = N'C:\RS11\Data\Estagios.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Estagios_log', FILENAME = N'C:\RS11\Data\Estagios_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Estagios] SET COMPATIBILITY_LEVEL = 150
GO

/****** Object:  Table [dbo].[Area]    Script Date: 05/03/2024 19:37:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Area](
	[AreaId] [int] IDENTITY(1,1) NOT NULL,
	[Area] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Area] PRIMARY KEY CLUSTERED 
(
	[AreaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CodigoPostal]    Script Date: 05/03/2024 19:37:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CodigoPostal](
	[CodigoPostalId] [int] NOT NULL,
	[CodigoPostal] [char](8) NOT NULL,
	[Localidade] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CodigoPostal] PRIMARY KEY CLUSTERED 
(
	[CodigoPostalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Curso]    Script Date: 05/03/2024 19:37:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Curso](
	[CursoId] [int] NOT NULL,
	[SubareaId] [int] NOT NULL,
	[Nome] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Curso] PRIMARY KEY CLUSTERED 
(
	[CursoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empresa]    Script Date: 05/03/2024 19:37:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empresa](
	[EmpresaId] [int] NOT NULL,
	[CodigoPostalId] [int] NOT NULL,
	[Nome] [nvarchar](70) NOT NULL,
	[Morada] [nvarchar](70) NOT NULL,
	[URL] [nvarchar](2083) NULL,
 CONSTRAINT [PK_Empresa] PRIMARY KEY CLUSTERED 
(
	[EmpresaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estagiario]    Script Date: 05/03/2024 19:37:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estagiario](
	[EstagiarioId] [int] NOT NULL,
	[CodigoPostalId] [int] NOT NULL,
	[EmpresaId] [int] NOT NULL,
	[CursoId] [int] NOT NULL,
	[Nome] [nvarchar](100) NOT NULL,
	[DataNascimento] [date] NOT NULL,
	[Morada] [nvarchar](70) NOT NULL,
 CONSTRAINT [PK_Estagio] PRIMARY KEY CLUSTERED 
(
	[EstagiarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstagiarioEmail]    Script Date: 05/03/2024 19:37:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstagiarioEmail](
	[EstagiarioEmailId] [int] NOT NULL,
	[EstagiarioId] [int] NOT NULL,
	[Email] [nvarchar](256) NULL,
 CONSTRAINT [PK_EstagiarioEmail] PRIMARY KEY CLUSTERED 
(
	[EstagiarioEmailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstagiarioTelefone]    Script Date: 05/03/2024 19:37:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstagiarioTelefone](
	[EstagiarioTelefoneId] [int] NOT NULL,
	[EstagiarioId] [int] NOT NULL,
	[Telefone] [char](9) NULL,
 CONSTRAINT [PK_EstagiarioTelefone] PRIMARY KEY CLUSTERED 
(
	[EstagiarioTelefoneId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subarea]    Script Date: 05/03/2024 19:37:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subarea](
	[SubareaId] [int] NOT NULL,
	[AreaId] [int] NOT NULL,
	[Subarea] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Subarea] PRIMARY KEY CLUSTERED 
(
	[SubareaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Estagios] SET  READ_WRITE 
GO
