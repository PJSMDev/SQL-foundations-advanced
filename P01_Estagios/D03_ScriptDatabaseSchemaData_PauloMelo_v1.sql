USE [master]
GO
/****** Object:  Database [Estagios]    Script Date: 07/03/2024 17:45:13 ******/
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
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Estagios].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Estagios] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Estagios] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Estagios] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Estagios] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Estagios] SET ARITHABORT OFF 
GO
ALTER DATABASE [Estagios] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Estagios] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Estagios] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Estagios] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Estagios] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Estagios] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Estagios] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Estagios] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Estagios] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Estagios] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Estagios] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Estagios] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Estagios] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Estagios] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Estagios] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Estagios] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Estagios] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Estagios] SET RECOVERY FULL 
GO
ALTER DATABASE [Estagios] SET  MULTI_USER 
GO
ALTER DATABASE [Estagios] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Estagios] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Estagios] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Estagios] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Estagios] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Estagios] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Estagios', N'ON'
GO
ALTER DATABASE [Estagios] SET QUERY_STORE = OFF
GO
USE [Estagios]
GO
/****** Object:  Table [dbo].[Area]    Script Date: 07/03/2024 17:45:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Area](
	[AreaId] [int] IDENTITY(1,1) NOT NULL,
	[Area] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Area_1] PRIMARY KEY CLUSTERED 
(
	[AreaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CodigoPostal]    Script Date: 07/03/2024 17:45:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CodigoPostal](
	[CodigoPostalId] [int] IDENTITY(1,1) NOT NULL,
	[CodigoPostal] [char](8) NOT NULL,
	[Localidade] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CodigoPostal] PRIMARY KEY CLUSTERED 
(
	[CodigoPostalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Curso]    Script Date: 07/03/2024 17:45:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Curso](
	[CursoId] [int] IDENTITY(1,1) NOT NULL,
	[SubareaId] [int] NOT NULL,
	[Nome] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Curso] PRIMARY KEY CLUSTERED 
(
	[CursoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empresa]    Script Date: 07/03/2024 17:45:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empresa](
	[EmpresaId] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[Estagiario]    Script Date: 07/03/2024 17:45:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estagiario](
	[EstagiarioId] [int] IDENTITY(1,1) NOT NULL,
	[CodigoPostalId] [int] NOT NULL,
	[EmpresaId] [int] NOT NULL,
	[CursoId] [int] NOT NULL,
	[Nome] [nvarchar](100) NOT NULL,
	[DataNascimento] [date] NOT NULL,
	[Morada] [nvarchar](70) NOT NULL,
 CONSTRAINT [PK_Estagiario] PRIMARY KEY CLUSTERED 
(
	[EstagiarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstagiarioEmail]    Script Date: 07/03/2024 17:45:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstagiarioEmail](
	[EstagiarioEmailId] [int] IDENTITY(1,1) NOT NULL,
	[EstagiarioId] [int] NOT NULL,
	[Email] [nvarchar](256) NULL,
 CONSTRAINT [PK_EstagiarioEmail] PRIMARY KEY CLUSTERED 
(
	[EstagiarioEmailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstagiarioTelefone]    Script Date: 07/03/2024 17:45:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstagiarioTelefone](
	[EstagiarioTelefoneId] [int] IDENTITY(1,1) NOT NULL,
	[EstagiarioId] [int] NOT NULL,
	[Telefone] [char](9) NULL,
 CONSTRAINT [PK_EstagiarioTelefone] PRIMARY KEY CLUSTERED 
(
	[EstagiarioTelefoneId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subarea]    Script Date: 07/03/2024 17:45:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subarea](
	[SubareaId] [int] IDENTITY(1,1) NOT NULL,
	[AreaId] [int] NOT NULL,
	[Subarea] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Subarea] PRIMARY KEY CLUSTERED 
(
	[SubareaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Area] ON 

INSERT [dbo].[Area] ([AreaId], [Area]) VALUES (1, N'Tecnologias de Informação')
INSERT [dbo].[Area] ([AreaId], [Area]) VALUES (2, N'Línguas')
INSERT [dbo].[Area] ([AreaId], [Area]) VALUES (3, N'Softskills')
SET IDENTITY_INSERT [dbo].[Area] OFF
GO
SET IDENTITY_INSERT [dbo].[CodigoPostal] ON 

INSERT [dbo].[CodigoPostal] ([CodigoPostalId], [CodigoPostal], [Localidade]) VALUES (1, N'1000-001', N'Gualtar')
INSERT [dbo].[CodigoPostal] ([CodigoPostalId], [CodigoPostal], [Localidade]) VALUES (2, N'1000-002', N'Lamas')
INSERT [dbo].[CodigoPostal] ([CodigoPostalId], [CodigoPostal], [Localidade]) VALUES (3, N'1000-003', N'Priscos')
INSERT [dbo].[CodigoPostal] ([CodigoPostalId], [CodigoPostal], [Localidade]) VALUES (4, N'2000-002', N'Tadim')
INSERT [dbo].[CodigoPostal] ([CodigoPostalId], [CodigoPostal], [Localidade]) VALUES (5, N'3000-003', N'Espinho')
INSERT [dbo].[CodigoPostal] ([CodigoPostalId], [CodigoPostal], [Localidade]) VALUES (6, N'4000-004', N'Sequeira')
INSERT [dbo].[CodigoPostal] ([CodigoPostalId], [CodigoPostal], [Localidade]) VALUES (9, N'5000-005', N'Ruílhe')
INSERT [dbo].[CodigoPostal] ([CodigoPostalId], [CodigoPostal], [Localidade]) VALUES (10, N'6000-006', N'Palmeira')
SET IDENTITY_INSERT [dbo].[CodigoPostal] OFF
GO
SET IDENTITY_INSERT [dbo].[Curso] ON 

INSERT [dbo].[Curso] ([CursoId], [SubareaId], [Nome]) VALUES (2, 1, N'Introdução às BDs')
INSERT [dbo].[Curso] ([CursoId], [SubareaId], [Nome]) VALUES (3, 2, N'C# Advanced')
INSERT [dbo].[Curso] ([CursoId], [SubareaId], [Nome]) VALUES (4, 3, N'Inglês Nível 1')
INSERT [dbo].[Curso] ([CursoId], [SubareaId], [Nome]) VALUES (5, 4, N'Gestão de Equipas')
SET IDENTITY_INSERT [dbo].[Curso] OFF
GO
SET IDENTITY_INSERT [dbo].[Empresa] ON 

INSERT [dbo].[Empresa] ([EmpresaId], [CodigoPostalId], [Nome], [Morada], [URL]) VALUES (2, 1, N'Cegid Lda', N'Rua Norton de Matos', N'www.cegid.pt')
INSERT [dbo].[Empresa] ([EmpresaId], [CodigoPostalId], [Nome], [Morada], [URL]) VALUES (3, 2, N'Primavera Lda', N'Rua da Avenida', N'www.primavera.pt')
INSERT [dbo].[Empresa] ([EmpresaId], [CodigoPostalId], [Nome], [Morada], [URL]) VALUES (4, 3, N'Tesla Inc', N'Rua da Ribeira', N'www.tesla.pt')
SET IDENTITY_INSERT [dbo].[Empresa] OFF
GO
SET IDENTITY_INSERT [dbo].[Estagiario] ON 

INSERT [dbo].[Estagiario] ([EstagiarioId], [CodigoPostalId], [EmpresaId], [CursoId], [Nome], [DataNascimento], [Morada]) VALUES (13, 4, 2, 2, N'A. Amaro', CAST(N'1990-01-01' AS Date), N'Rua da Manifestação')
INSERT [dbo].[Estagiario] ([EstagiarioId], [CodigoPostalId], [EmpresaId], [CursoId], [Nome], [DataNascimento], [Morada]) VALUES (15, 5, 3, 2, N'B. Baltasar', CAST(N'1980-01-01' AS Date), N'Rua D Pedro Quinto')
INSERT [dbo].[Estagiario] ([EstagiarioId], [CodigoPostalId], [EmpresaId], [CursoId], [Nome], [DataNascimento], [Morada]) VALUES (16, 6, 3, 4, N'C. Castro', CAST(N'1991-01-01' AS Date), N'Rua da Praceta')
INSERT [dbo].[Estagiario] ([EstagiarioId], [CodigoPostalId], [EmpresaId], [CursoId], [Nome], [DataNascimento], [Morada]) VALUES (19, 9, 4, 4, N'D. Dias', CAST(N'1992-01-01' AS Date), N'Rua da República')
INSERT [dbo].[Estagiario] ([EstagiarioId], [CodigoPostalId], [EmpresaId], [CursoId], [Nome], [DataNascimento], [Morada]) VALUES (20, 10, 4, 5, N'E. Eira', CAST(N'1992-01-01' AS Date), N'Rua da Aparecida')
SET IDENTITY_INSERT [dbo].[Estagiario] OFF
GO
SET IDENTITY_INSERT [dbo].[EstagiarioEmail] ON 

INSERT [dbo].[EstagiarioEmail] ([EstagiarioEmailId], [EstagiarioId], [Email]) VALUES (4, 13, N'amaro@gmail.pt')
INSERT [dbo].[EstagiarioEmail] ([EstagiarioEmailId], [EstagiarioId], [Email]) VALUES (5, 13, N'aamaro@gmail.pt')
INSERT [dbo].[EstagiarioEmail] ([EstagiarioEmailId], [EstagiarioId], [Email]) VALUES (7, 15, N'balt@gmail.pt')
INSERT [dbo].[EstagiarioEmail] ([EstagiarioEmailId], [EstagiarioId], [Email]) VALUES (8, 16, N'castro@gmail.pt')
INSERT [dbo].[EstagiarioEmail] ([EstagiarioEmailId], [EstagiarioId], [Email]) VALUES (9, 16, N'castro2@gmail.pt')
INSERT [dbo].[EstagiarioEmail] ([EstagiarioEmailId], [EstagiarioId], [Email]) VALUES (10, 19, N'diogodias@gmail.pt')
INSERT [dbo].[EstagiarioEmail] ([EstagiarioEmailId], [EstagiarioId], [Email]) VALUES (11, 20, N'ernesto@gmail.pt')
SET IDENTITY_INSERT [dbo].[EstagiarioEmail] OFF
GO
SET IDENTITY_INSERT [dbo].[EstagiarioTelefone] ON 

INSERT [dbo].[EstagiarioTelefone] ([EstagiarioTelefoneId], [EstagiarioId], [Telefone]) VALUES (5, 13, N'912345678')
INSERT [dbo].[EstagiarioTelefone] ([EstagiarioTelefoneId], [EstagiarioId], [Telefone]) VALUES (6, 13, N'921234567')
INSERT [dbo].[EstagiarioTelefone] ([EstagiarioTelefoneId], [EstagiarioId], [Telefone]) VALUES (7, 15, N'961234567')
INSERT [dbo].[EstagiarioTelefone] ([EstagiarioTelefoneId], [EstagiarioId], [Telefone]) VALUES (8, 15, N'969876543')
INSERT [dbo].[EstagiarioTelefone] ([EstagiarioTelefoneId], [EstagiarioId], [Telefone]) VALUES (9, 16, N'932345678')
INSERT [dbo].[EstagiarioTelefone] ([EstagiarioTelefoneId], [EstagiarioId], [Telefone]) VALUES (10, 19, N'962345678')
INSERT [dbo].[EstagiarioTelefone] ([EstagiarioTelefoneId], [EstagiarioId], [Telefone]) VALUES (11, 20, N'966655443')
SET IDENTITY_INSERT [dbo].[EstagiarioTelefone] OFF
GO
SET IDENTITY_INSERT [dbo].[Subarea] ON 

INSERT [dbo].[Subarea] ([SubareaId], [AreaId], [Subarea]) VALUES (1, 1, N'Base de dados')
INSERT [dbo].[Subarea] ([SubareaId], [AreaId], [Subarea]) VALUES (2, 1, N'Desenvolvimento')
INSERT [dbo].[Subarea] ([SubareaId], [AreaId], [Subarea]) VALUES (3, 2, N'Conversação')
INSERT [dbo].[Subarea] ([SubareaId], [AreaId], [Subarea]) VALUES (4, 3, N'Gestão')
SET IDENTITY_INSERT [dbo].[Subarea] OFF
GO
ALTER TABLE [dbo].[Curso]  WITH CHECK ADD  CONSTRAINT [FK_Curso_Subarea] FOREIGN KEY([SubareaId])
REFERENCES [dbo].[Subarea] ([SubareaId])
GO
ALTER TABLE [dbo].[Curso] CHECK CONSTRAINT [FK_Curso_Subarea]
GO
ALTER TABLE [dbo].[Empresa]  WITH CHECK ADD  CONSTRAINT [FK_Empresa_CodigoPostal] FOREIGN KEY([CodigoPostalId])
REFERENCES [dbo].[CodigoPostal] ([CodigoPostalId])
GO
ALTER TABLE [dbo].[Empresa] CHECK CONSTRAINT [FK_Empresa_CodigoPostal]
GO
ALTER TABLE [dbo].[Estagiario]  WITH CHECK ADD  CONSTRAINT [FK_Estagiario_CodigoPostal] FOREIGN KEY([CodigoPostalId])
REFERENCES [dbo].[CodigoPostal] ([CodigoPostalId])
GO
ALTER TABLE [dbo].[Estagiario] CHECK CONSTRAINT [FK_Estagiario_CodigoPostal]
GO
ALTER TABLE [dbo].[Estagiario]  WITH CHECK ADD  CONSTRAINT [FK_Estagiario_Curso] FOREIGN KEY([CursoId])
REFERENCES [dbo].[Curso] ([CursoId])
GO
ALTER TABLE [dbo].[Estagiario] CHECK CONSTRAINT [FK_Estagiario_Curso]
GO
ALTER TABLE [dbo].[Estagiario]  WITH CHECK ADD  CONSTRAINT [FK_Estagiario_Empresa] FOREIGN KEY([EmpresaId])
REFERENCES [dbo].[Empresa] ([EmpresaId])
GO
ALTER TABLE [dbo].[Estagiario] CHECK CONSTRAINT [FK_Estagiario_Empresa]
GO
ALTER TABLE [dbo].[EstagiarioEmail]  WITH CHECK ADD  CONSTRAINT [FK_EstagiarioEmail_Estagiario] FOREIGN KEY([EstagiarioId])
REFERENCES [dbo].[Estagiario] ([EstagiarioId])
GO
ALTER TABLE [dbo].[EstagiarioEmail] CHECK CONSTRAINT [FK_EstagiarioEmail_Estagiario]
GO
ALTER TABLE [dbo].[EstagiarioTelefone]  WITH CHECK ADD  CONSTRAINT [FK_EstagiarioTelefone_Estagiario] FOREIGN KEY([EstagiarioId])
REFERENCES [dbo].[Estagiario] ([EstagiarioId])
GO
ALTER TABLE [dbo].[EstagiarioTelefone] CHECK CONSTRAINT [FK_EstagiarioTelefone_Estagiario]
GO
ALTER TABLE [dbo].[Subarea]  WITH CHECK ADD  CONSTRAINT [FK_Subarea_Area] FOREIGN KEY([AreaId])
REFERENCES [dbo].[Area] ([AreaId])
GO
ALTER TABLE [dbo].[Subarea] CHECK CONSTRAINT [FK_Subarea_Area]
GO
USE [master]
GO
ALTER DATABASE [Estagios] SET  READ_WRITE 
GO
