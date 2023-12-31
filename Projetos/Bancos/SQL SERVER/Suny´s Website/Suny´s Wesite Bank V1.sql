USE [Suny´s Website]
GO
/****** Object:  Table [dbo].[Cadastro]    Script Date: 27/06/2023 10:07:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cadastro](
	[idCadastro] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](50) NOT NULL,
	[dataDeCadastro] [datetime] NULL,
	[Idade] [int] NULL,
	[Genero] [varchar](50) NOT NULL,
	[Sexualidade] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Cadastro] PRIMARY KEY CLUSTERED 
(
	[idCadastro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mensagem]    Script Date: 27/06/2023 10:07:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mensagem](
	[idMensagem] [int] NOT NULL,
	[Descrição] [varchar](50) NOT NULL,
	[fkCadastro] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Mensagem] PRIMARY KEY CLUSTERED 
(
	[idMensagem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
