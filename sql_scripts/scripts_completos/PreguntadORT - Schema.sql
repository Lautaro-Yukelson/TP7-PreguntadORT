USE [PreguntadORT]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 5/9/2023 11:41:48 ******/
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
)
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dificultades]    Script Date: 5/9/2023 11:41:48 ******/
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
)
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partidas]    Script Date: 5/9/2023 11:41:48 ******/
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
	[Turno] [int] NULL,
 CONSTRAINT [PK_Partidas] PRIMARY KEY CLUSTERED 
(
	[idPartida] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preguntas]    Script Date: 5/9/2023 11:41:48 ******/
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
)
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Progresos]    Script Date: 5/9/2023 11:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Progresos](
	[idProgreso] [int] IDENTITY(1,1) NOT NULL,
	[Arte] [bit] NOT NULL,
	[Ciencia] [bit] NOT NULL,
	[Deporte] [bit] NOT NULL,
	[Entretenimiento] [bit] NOT NULL,
	[Geografia] [bit] NOT NULL,
	[Historia] [bit] NOT NULL,
 CONSTRAINT [PK_Progresos] PRIMARY KEY CLUSTERED 
(
	[idProgreso] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuestas]    Script Date: 5/9/2023 11:41:48 ******/
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
)
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 5/9/2023 11:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](max) NOT NULL,
	[Contrasena] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Puntajes] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)
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
/****** Object:  StoredProcedure [dbo].[sp_ActualizarProgreso]    Script Date: 5/9/2023 11:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_ActualizarProgreso]
	@idProgreso int,
	@Arte bit,
	@Ciencia bit,
	@Deporte bit,
	@Entretenimiento bit,
	@Geografia bit,
	@Historia bit
AS
BEGIN
	UPDATE Progresos
	SET Arte = @Arte, Ciencia = @Ciencia, Deporte = @Deporte, Entretenimiento = @Entretenimiento, Geografia = @Geografia, Historia = @Historia
	WHERE idProgreso = @idProgreso;

END
GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizarTurno]    Script Date: 5/9/2023 11:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_ActualizarTurno]
	@idPartida int,
	@idUsuario int
AS
BEGIN
	UPDATE Partidas
	SET Turno = @idUsuario
	WHERE idPartida = @idPartida;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AgregarUsuario]    Script Date: 5/9/2023 11:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_AgregarUsuario]
	@Nombre varchar(MAX),
	@Contrasena varchar(MAX)
AS
BEGIN

	INSERT INTO Usuarios (Nombre, Contrasena) VALUES (@Nombre, @Contrasena)

END
GO
/****** Object:  StoredProcedure [dbo].[sp_CrearPartida]    Script Date: 5/9/2023 11:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_CrearPartida]
	@idUsuario int,
	@idUsuarioVS int
AS
BEGIN
	DECLARE @idProgreso1 int;
	DECLARE @idProgreso2 int;

	INSERT INTO Progresos(Arte, Ciencia, Deporte, Entretenimiento, Geografia, Historia) VALUES (0,0,0,0,0,0) SET @idProgreso1 = SCOPE_IDENTITY()
	INSERT INTO Progresos(Arte, Ciencia, Deporte, Entretenimiento, Geografia, Historia) VALUES (0,0,0,0,0,0) SET @idProgreso2 = SCOPE_IDENTITY()

	INSERT INTO Partidas(idUsuario1, idUsuario2, idProgreso1, idProgreso2, Turno) VALUES (@idUsuario, @idUsuarioVS, @idProgreso1, @idProgreso2, @idUsuario)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarPartida]    Script Date: 5/9/2023 11:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_EliminarPartida]
	@idPartida int
AS
BEGIN
	declare @idProgreso1 int;
	declare @idProgreso2 int;
	SELECT @idProgreso1 = idProgreso1, @idProgreso2 = idProgreso2 FROM Partidas WHERE idPartida = @idPartida
	DELETE FROM Partidas WHERE idPartida = @idPartida
	DELETE FROM Progresos WHERE idProgreso = @idProgreso1 OR idProgreso = @idProgreso2
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerPartida]    Script Date: 5/9/2023 11:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_ObtenerPartida]
	@idPartida int
AS
BEGIN
	SELECT * FROM Partidas WHERE idPartida = @idPartida
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerPartidas]    Script Date: 5/9/2023 11:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_ObtenerPartidas]
	@idUsuario int
AS
BEGIN
	SELECT * FROM Partidas WHERE idUsuario1 = @idUsuario OR idUsuario2 = @idUsuario
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerPregunta]    Script Date: 5/9/2023 11:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_ObtenerPregunta]
	@idPregunta int
AS
BEGIN
	SELECT * FROM Preguntas WHERE idPregunta = @idPregunta
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerPreguntas]    Script Date: 5/9/2023 11:41:48 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ObtenerProgreso]    Script Date: 5/9/2023 11:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_ObtenerProgreso]
	@idProgreso int
AS
BEGIN
	SELECT * FROM Progresos WHERE idProgreso = @idProgreso
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerRespuestas]    Script Date: 5/9/2023 11:41:48 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ObtenerUsuario]    Script Date: 5/9/2023 11:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_ObtenerUsuario]
	@idUsuario int
AS
BEGIN
	SELECT * FROM Usuarios WHERE idUsuario = @idUsuario
END
GO
