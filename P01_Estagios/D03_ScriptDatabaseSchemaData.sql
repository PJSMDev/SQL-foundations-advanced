USE [master]
GO
/****** Object:  Database [Estagios]    Script Date: 06/03/2024 19:35:05 ******/
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
USE [Estagios]
GO
/****** Object:  Table [dbo].[Area]    Script Date: 06/03/2024 19:35:05 ******/
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
/****** Object:  Table [dbo].[CodigoPostal]    Script Date: 06/03/2024 19:35:05 ******/
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
/****** Object:  Table [dbo].[Curso]    Script Date: 06/03/2024 19:35:05 ******/
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
/****** Object:  Table [dbo].[Empresa]    Script Date: 06/03/2024 19:35:05 ******/
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
/****** Object:  Table [dbo].[Estagiario]    Script Date: 06/03/2024 19:35:05 ******/
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
/****** Object:  Table [dbo].[EstagiarioEmail]    Script Date: 06/03/2024 19:35:05 ******/
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
/****** Object:  Table [dbo].[EstagiarioTelefone]    Script Date: 06/03/2024 19:35:05 ******/
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
/****** Object:  Table [dbo].[Subarea]    Script Date: 06/03/2024 19:35:05 ******/
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
GO
INSERT [dbo].[Area] ([AreaId], [Area]) VALUES (1, N'Tecnologias de Informação')
GO
INSERT [dbo].[Area] ([AreaId], [Area]) VALUES (2, N'Línguas')
GO
INSERT [dbo].[Area] ([AreaId], [Area]) VALUES (3, N'Softskills')
GO
SET IDENTITY_INSERT [dbo].[Area] OFF
GO
SET IDENTITY_INSERT [dbo].[CodigoPostal] ON 
GO
INSERT [dbo].[CodigoPostal] ([CodigoPostalId], [CodigoPostal], [Localidade]) VALUES (1, N'1000-001', N'Gualtar')
GO
INSERT [dbo].[CodigoPostal] ([CodigoPostalId], [CodigoPostal], [Localidade]) VALUES (2, N'1000-002', N'Lamas')
GO
INSERT [dbo].[CodigoPostal] ([CodigoPostalId], [CodigoPostal], [Localidade]) VALUES (3, N'1000-003', N'Priscos')
GO
INSERT [dbo].[CodigoPostal] ([CodigoPostalId], [CodigoPostal], [Localidade]) VALUES (4, N'2000-002', N'Tadim')
GO
INSERT [dbo].[CodigoPostal] ([CodigoPostalId], [CodigoPostal], [Localidade]) VALUES (5, N'3000-003', N'Espinho')
GO
INSERT [dbo].[CodigoPostal] ([CodigoPostalId], [CodigoPostal], [Localidade]) VALUES (6, N'4000-004', N'Sequeira')
GO
INSERT [dbo].[CodigoPostal] ([CodigoPostalId], [CodigoPostal], [Localidade]) VALUES (9, N'5000-005', N'Ruílhe')
GO
INSERT [dbo].[CodigoPostal] ([CodigoPostalId], [CodigoPostal], [Localidade]) VALUES (10, N'6000-006', N'Palmeira')
GO
SET IDENTITY_INSERT [dbo].[CodigoPostal] OFF
GO
SET IDENTITY_INSERT [dbo].[Curso] ON 
GO
INSERT [dbo].[Curso] ([CursoId], [SubareaId], [Nome]) VALUES (2, 1, N'Introdução às BDs')
GO
INSERT [dbo].[Curso] ([CursoId], [SubareaId], [Nome]) VALUES (3, 2, N'C# Advanced')
GO
INSERT [dbo].[Curso] ([CursoId], [SubareaId], [Nome]) VALUES (4, 3, N'Inglês Nível 1')
GO
INSERT [dbo].[Curso] ([CursoId], [SubareaId], [Nome]) VALUES (5, 4, N'Gestão de Equipas')
GO
SET IDENTITY_INSERT [dbo].[Curso] OFF
GO
SET IDENTITY_INSERT [dbo].[Empresa] ON 
GO
INSERT [dbo].[Empresa] ([EmpresaId], [CodigoPostalId], [Nome], [Morada], [URL]) VALUES (2, 1, N'Cegid Lda', N'Rua Norton de Matos', N'www.cegid.pt')
GO
INSERT [dbo].[Empresa] ([EmpresaId], [CodigoPostalId], [Nome], [Morada], [URL]) VALUES (3, 2, N'Primavera Lda', N'Rua da Avenida', N'www.primavera.pt')
GO
INSERT [dbo].[Empresa] ([EmpresaId], [CodigoPostalId], [Nome], [Morada], [URL]) VALUES (4, 3, N'Tesla Inc', N'Rua da Ribeira', N'www.tesla.pt')
GO
SET IDENTITY_INSERT [dbo].[Empresa] OFF
GO
SET IDENTITY_INSERT [dbo].[Subarea] ON 
GO
INSERT [dbo].[Subarea] ([SubareaId], [AreaId], [Subarea]) VALUES (1, 1, N'Base de dados')
GO
INSERT [dbo].[Subarea] ([SubareaId], [AreaId], [Subarea]) VALUES (2, 1, N'Desenvolvimento')
GO
INSERT [dbo].[Subarea] ([SubareaId], [AreaId], [Subarea]) VALUES (3, 2, N'Conversação')
GO
INSERT [dbo].[Subarea] ([SubareaId], [AreaId], [Subarea]) VALUES (4, 3, N'Gestão')
GO
SET IDENTITY_INSERT [dbo].[Subarea] OFF
GO
ALTER TABLE [dbo].[Curso]  WITH CHECK ADD  CONSTRAINT [FK_Curso_Subarea] FOREIGN KEY([SubareaId])
REFERENCES [dbo].[Subarea] ([SubareaId])
GO
ALTER TABLE [dbo].[Curso] CHECK CONSTRAINT [FK_Curso_Subarea]
GO
ALTER TABLE [dbo].[Estagiario]  WITH CHECK ADD  CONSTRAINT [FK_Estagiario_CodigoPostal] FOREIGN KEY([CodigoPostalId])
REFERENCES [dbo].[CodigoPostal] ([CodigoPostalId])
GO
ALTER TABLE [dbo].[Estagiario] CHECK CONSTRAINT [FK_Estagiario_CodigoPostal]
GO
ALTER TABLE [dbo].[Estagiario]  WITH CHECK ADD  CONSTRAINT [FK_Estagiario_Curso1] FOREIGN KEY([CursoId])
REFERENCES [dbo].[Curso] ([CursoId])
GO
ALTER TABLE [dbo].[Estagiario] CHECK CONSTRAINT [FK_Estagiario_Curso1]
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
