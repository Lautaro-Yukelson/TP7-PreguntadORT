USE [PreguntadORT]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 17/8/2023 13:57:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[idCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](max) NOT NULL,
	[Foto] [varchar](max) NULL,
	[ColorFondo] [varchar](9) NOT NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[idCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dificultades]    Script Date: 17/8/2023 13:57:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dificultades](
	[idDificultad] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](max) NOT NULL,
	[Multiplicador] [decimal](10, 2) NOT NULL,
	[PorcentajeCorrecto] [int] NOT NULL,
 CONSTRAINT [PK_Dificultades] PRIMARY KEY CLUSTERED 
(
	[idDificultad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partidas]    Script Date: 17/8/2023 13:57:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partidas](
	[idPartida] [int] IDENTITY(1,1) NOT NULL,
	[idUsuario1] [int] NOT NULL,
	[idUsuario2] [int] NOT NULL,
	[idProgreso1] [int] NOT NULL,
	[idProgreso2] [int] NOT NULL,
 CONSTRAINT [PK_Partidas] PRIMARY KEY CLUSTERED 
(
	[idPartida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preguntas]    Script Date: 17/8/2023 13:57:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preguntas](
	[idPregunta] [int] IDENTITY(1,1) NOT NULL,
	[idCategoria] [int] NOT NULL,
	[idDificultad] [int] NOT NULL,
	[Enunciado] [varchar](max) NOT NULL,
	[Foto] [varchar](max) NULL,
 CONSTRAINT [PK_Preguntas] PRIMARY KEY CLUSTERED 
(
	[idPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Progresos]    Script Date: 17/8/2023 13:57:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Progresos](
	[idProgreso] [int] IDENTITY(1,1) NOT NULL,
	[Geografia] [bit] NOT NULL,
	[Ciencia] [bit] NOT NULL,
	[Historia] [bit] NOT NULL,
	[Deporte] [bit] NOT NULL,
	[Arte] [bit] NOT NULL,
	[Entretenimiento] [bit] NOT NULL,
 CONSTRAINT [PK_Progresos] PRIMARY KEY CLUSTERED 
(
	[idProgreso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuestas]    Script Date: 17/8/2023 13:57:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuestas](
	[idRespuestas] [int] IDENTITY(1,1) NOT NULL,
	[idPregunta] [int] NOT NULL,
	[Opcion] [int] NOT NULL,
	[Contenido] [varchar](max) NOT NULL,
	[Correcta] [bit] NOT NULL,
	[Foto] [varchar](max) NULL,
 CONSTRAINT [PK_Respuestas] PRIMARY KEY CLUSTERED 
(
	[idRespuestas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 17/8/2023 13:57:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](max) NOT NULL,
	[Contrasena] [varchar](max) NOT NULL,
	[Foto] [varchar](max) NULL,
 CONSTRAINT [PK_Puntajes] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Partidas]  WITH CHECK ADD  CONSTRAINT [FK_Partidas_Progresos] FOREIGN KEY([idProgreso1])
REFERENCES [dbo].[Progresos] ([idProgreso])
GO
ALTER TABLE [dbo].[Partidas] CHECK CONSTRAINT [FK_Partidas_Progresos]
GO
ALTER TABLE [dbo].[Partidas]  WITH CHECK ADD  CONSTRAINT [FK_Partidas_Progresos1] FOREIGN KEY([idProgreso2])
REFERENCES [dbo].[Progresos] ([idProgreso])
GO
ALTER TABLE [dbo].[Partidas] CHECK CONSTRAINT [FK_Partidas_Progresos1]
GO
ALTER TABLE [dbo].[Partidas]  WITH CHECK ADD  CONSTRAINT [FK_Partidas_Usuarios] FOREIGN KEY([idUsuario1])
REFERENCES [dbo].[Usuarios] ([idUsuario])
GO
ALTER TABLE [dbo].[Partidas] CHECK CONSTRAINT [FK_Partidas_Usuarios]
GO
ALTER TABLE [dbo].[Partidas]  WITH CHECK ADD  CONSTRAINT [FK_Partidas_Usuarios1] FOREIGN KEY([idUsuario2])
REFERENCES [dbo].[Usuarios] ([idUsuario])
GO
ALTER TABLE [dbo].[Partidas] CHECK CONSTRAINT [FK_Partidas_Usuarios1]
GO
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Categorias] FOREIGN KEY([idCategoria])
REFERENCES [dbo].[Categorias] ([idCategoria])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK_Preguntas_Categorias]
GO
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Dificultades] FOREIGN KEY([idDificultad])
REFERENCES [dbo].[Dificultades] ([idDificultad])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK_Preguntas_Dificultades]
GO
ALTER TABLE [dbo].[Respuestas]  WITH CHECK ADD  CONSTRAINT [FK_Respuestas_Preguntas] FOREIGN KEY([idPregunta])
REFERENCES [dbo].[Preguntas] ([idPregunta])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Respuestas] CHECK CONSTRAINT [FK_Respuestas_Preguntas]
GO
/****** Object:  StoredProcedure [dbo].[sp_AgregarPregunta]    Script Date: 17/8/2023 13:57:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_AgregarPregunta]
	@idCategoria int,
	@idDificultad int,
	@Enunciado varchar(MAX),
	@Foto varchar(MAX)
AS
BEGIN
	INSERT INTO Preguntas(idCategoria, idDificultad, Enunciado, Foto) VALUES (@idCategoria, @idDificultad, @Enunciado, @Foto)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AgregarUsuario]    Script Date: 17/8/2023 13:57:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_AgregarUsuario]
	@Nombre varchar(MAX),
	@Contrasena varchar(MAX),
	@Foto varchar(MAX)
AS
BEGIN

	INSERT INTO Usuarios (Nombre, Contrasena, Foto) VALUES (@Nombre, @Contrasena, @Foto)

END
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerPreguntas]    Script Date: 17/8/2023 13:57:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ObtenerPreguntas]
	@idDificultad int
AS
BEGIN
	SELECT * FROM Preguntas WHERE idDificultad = @iddificultad
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerRespuestas]    Script Date: 17/8/2023 13:57:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_ObtenerRespuestas]
	@idPregunta int
AS
BEGIN
	SELECT * FROM Respuestas WHERE idPregunta = @idPregunta
END
GO
