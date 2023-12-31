USE [PreguntadORT]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 5/9/2023 11:40:50 ******/
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
/****** Object:  Table [dbo].[Dificultades]    Script Date: 5/9/2023 11:40:50 ******/
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
/****** Object:  Table [dbo].[Partidas]    Script Date: 5/9/2023 11:40:50 ******/
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
/****** Object:  Table [dbo].[Preguntas]    Script Date: 5/9/2023 11:40:50 ******/
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
/****** Object:  Table [dbo].[Progresos]    Script Date: 5/9/2023 11:40:50 ******/
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
/****** Object:  Table [dbo].[Respuestas]    Script Date: 5/9/2023 11:40:50 ******/
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
/****** Object:  Table [dbo].[Usuarios]    Script Date: 5/9/2023 11:40:50 ******/
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
SET IDENTITY_INSERT [dbo].[Categorias] ON 

INSERT [dbo].[Categorias] ([idCategoria], [Nombre], [Foto], [ColorFondo]) VALUES (1, N'Arte', N'/images/personajes/Arte.png', N'#ff2732')
INSERT [dbo].[Categorias] ([idCategoria], [Nombre], [Foto], [ColorFondo]) VALUES (2, N'Ciencia', N'/images/personajes/Ciencia.png', N'#00cb61')
INSERT [dbo].[Categorias] ([idCategoria], [Nombre], [Foto], [ColorFondo]) VALUES (3, N'Deporte', N'/images/personajes/Deporte.png', N'#ff9520')
INSERT [dbo].[Categorias] ([idCategoria], [Nombre], [Foto], [ColorFondo]) VALUES (4, N'Entretenimiento', N'/images/personajes/Entretenimiento.png', N'#ff4db3')
INSERT [dbo].[Categorias] ([idCategoria], [Nombre], [Foto], [ColorFondo]) VALUES (5, N'Geografia', N'/images/personajes/Geografia.png', N'#007acb')
INSERT [dbo].[Categorias] ([idCategoria], [Nombre], [Foto], [ColorFondo]) VALUES (6, N'Historia', N'/images/personajes/Historia.png', N'#ffc800')
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[Dificultades] ON 

INSERT [dbo].[Dificultades] ([idDificultad], [Nombre], [Multiplicador], [PorcentajeCorrecto]) VALUES (1, N'Facil', CAST(0.50 AS Decimal(10, 2)), 25)
INSERT [dbo].[Dificultades] ([idDificultad], [Nombre], [Multiplicador], [PorcentajeCorrecto]) VALUES (2, N'Normal', CAST(1.00 AS Decimal(10, 2)), 50)
INSERT [dbo].[Dificultades] ([idDificultad], [Nombre], [Multiplicador], [PorcentajeCorrecto]) VALUES (3, N'Dificil', CAST(2.00 AS Decimal(10, 2)), 75)
SET IDENTITY_INSERT [dbo].[Dificultades] OFF
GO
SET IDENTITY_INSERT [dbo].[Partidas] ON 

INSERT [dbo].[Partidas] ([idPartida], [idUsuario1], [idUsuario2], [idProgreso1], [idProgreso2], [Turno]) VALUES (4, 4, 3, 7, 8, 4)
SET IDENTITY_INSERT [dbo].[Partidas] OFF
GO
SET IDENTITY_INSERT [dbo].[Preguntas] ON 

INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (1, 1, 1, N'¿Quién pintó "La Gioconda"?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (2, 1, 1, N'¿Qué pintor es conocido por cortar parte de su oreja?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (3, 1, 1, N'¿Cuál de estos pintores es famoso por su estilo "Surrealista"?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (4, 1, 1, N'¿Cuál de estas pinturas es de Vincent van Gogh?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (5, 1, 1, N'¿Quién pintó el techo de la Capilla Sixtina en el Vaticano?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (6, 1, 2, N'¿Quién es el autor de la pintura "Guernica"?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (7, 1, 2, N'¿Cuál de estas pinturas es de Salvador Dalí?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (8, 1, 2, N'¿Cuál de estas esculturas fue creada por Miguel Ángel?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (9, 1, 2, N'¿Quién pintó "La última cena"?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (10, 1, 2, N'¿Cuál de estas pinturas es de Claude Monet?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (11, 1, 3, N'¿Quién pintó la obra "El nacimiento de Venus"?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (12, 1, 3, N'¿Cuál de estas obras pertenece a Vincent van Gogh?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (13, 1, 3, N'¿Cuál de estas obras es un fresco de Michelangelo?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (14, 1, 3, N'¿Cuál de los siguientes pintores es conocido por su estilo "surrealista"?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (15, 1, 3, N'¿Cuál de estas esculturas fue esculpida por Auguste Rodin?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (16, 2, 1, N'¿Cuál es el símbolo químico del agua?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (17, 2, 1, N'¿Cuál es la fórmula química del dióxido de carbono?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (18, 2, 1, N'¿Cuál es el planeta más grande del sistema solar?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (19, 2, 1, N'¿Cuál es el hueso más largo del cuerpo humano?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (20, 2, 1, N'¿Cuál es el proceso natural por el cual los organismos evolucionan y se adaptan a su entorno?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (21, 2, 2, N'¿Cuál es la fórmula química del etanol?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (22, 2, 2, N'¿Cuál es el proceso en el que las células se dividen para producir nuevas células?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (23, 2, 2, N'¿Qué es un ácido en términos químicos?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (24, 2, 2, N'¿Qué científico propuso la teoría de la relatividad?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (25, 2, 2, N'¿Cuál es el proceso por el cual las plantas convierten la luz solar en energía?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (26, 2, 3, N'¿Cuál es el número atómico del helio?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (27, 2, 3, N'¿Cuál es el proceso mediante el cual las células obtienen energía de la glucosa?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (28, 2, 3, N'¿Qué es un agujero negro en astronomía?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (29, 2, 3, N'¿Qué científico enunció la ley de la gravedad?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (30, 2, 3, N'¿Cuál es la estructura que lleva información genética en las células?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (31, 3, 1, N'¿En qué deporte se utiliza una pelota de golf?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (32, 3, 1, N'¿Cuántos jugadores conforman un equipo de fútbol?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (33, 3, 1, N'¿Qué deporte se juega en una pista con cuatro esquinas y una red en el medio?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (34, 3, 1, N'¿Cuál es el deporte más popular en Estados Unidos?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (35, 3, 1, N'¿Cuál es el nombre del torneo de tenis más importante del mundo?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (36, 3, 2, N'¿En qué deporte se utiliza una raqueta para golpear un volante?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (37, 3, 2, N'¿Cuál es el nombre del equipo de baloncesto de Chicago?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (38, 3, 2, N'¿En qué deporte se premia al ganador con una camiseta amarilla?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (39, 3, 2, N'¿Cuál es el único país que ha ganado todas las Copas del Mundo de Rugby?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (40, 3, 2, N'¿Cuál es el nombre del trofeo que se otorga al ganador del Super Bowl?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (41, 3, 3, N'¿Cuál es el deporte que se juega en una cancha con cajones y rampas?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (42, 3, 3, N'¿En qué año se celebraron los primeros Juegos Olímpicos modernos?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (43, 3, 3, N'¿Cuál es el nombre del luchador de artes marciales mixtas apodado "The Notorious"?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (44, 3, 3, N'¿Cuál es el único equipo de la NFL que ha conseguido una temporada perfecta?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (45, 3, 3, N'¿En qué año se llevó a cabo el primer Mundial de Fútbol?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (46, 4, 1, N'¿Cuál es el nombre del protagonista de la saga "Harry Potter"?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (47, 4, 1, N'¿Qué película ganó el Oscar a la Mejor Película en el año 2020?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (48, 4, 1, N'¿Cuál es la saga de películas basada en los libros de J.R.R. Tolkien?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (49, 4, 1, N'¿Quién interpreta a Iron Man en el Universo Cinematográfico de Marvel?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (50, 4, 1, N'¿Cuál es la serie de televisión que sigue las vidas de los Stark en Winterfell?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (51, 4, 2, N'¿Quién interpreta a Katniss Everdeen en la saga "Los Juegos del Hambre"?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (52, 4, 2, N'¿Cuál es la película dirigida por Christopher Nolan sobre los sueños compartidos?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (53, 4, 2, N'¿Cuál es el nombre del robot de inteligencia artificial en la película "Blade Runner"?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (54, 4, 2, N'¿Qué actor interpretó a Jack Dawson en la película "Titanic"?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (55, 4, 2, N'¿En qué serie de televisión podemos encontrar a los personajes Walter White y Jesse Pinkman?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (56, 4, 3, N'¿Cuál es la película de ciencia ficción de 1968 dirigida por Stanley Kubrick?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (57, 4, 3, N'¿Qué serie de televisión británica es conocida por su protagonista, un detective excéntrico?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (58, 4, 3, N'¿Cuál es la película de Quentin Tarantino que presenta a una asesina conocida como "La Novia"?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (59, 4, 3, N'¿Cuál es la serie de ciencia ficción distópica basada en una novela de Margaret Atwood?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (60, 4, 3, N'¿En qué película de 1999 los personajes principales luchan contra la realidad simulada?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (61, 5, 1, N'¿Cuál es la capital de Francia?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (62, 5, 1, N'¿En qué país se encuentra la Gran Muralla China?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (63, 5, 1, N'¿Cuál es el río más largo del mundo?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (64, 5, 1, N'¿En qué continente se encuentra Australia?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (65, 5, 1, N'¿Cuál es el país más grande del mundo en términos de área?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (66, 5, 2, N'¿Cuál es la montaña más alta del mundo?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (67, 5, 2, N'¿En qué país se encuentra el Taj Mahal?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (68, 5, 2, N'¿Cuál es el lago más grande de América del Norte?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (69, 5, 2, N'¿En qué país se encuentra el desierto del Sahara?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (70, 5, 2, N'¿Cuál es el país más poblado del mundo?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (71, 5, 3, N'¿En qué país se encuentra el Monte Kilimanjaro?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (72, 5, 3, N'¿Cuál es el país con mayor número de islas en el mundo?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (73, 5, 3, N'¿En qué continente se encuentra el lago Baikal?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (74, 5, 3, N'¿Cuál es la capital de Mongolia?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (75, 5, 3, N'¿En qué país se encuentra el Archipiélago de Svalbard?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (76, 6, 1, N'¿En qué año se produjo la caída del Muro de Berlín?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (77, 6, 1, N'¿Quién fue el primer presidente de los Estados Unidos?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (78, 6, 1, N'¿Cuál fue el resultado de la Revolución Francesa?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (79, 6, 1, N'¿En qué año comenzó la Segunda Guerra Mundial?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (80, 6, 1, N'¿Qué líder político fue conocido como "El Canciller de Hierro"?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (81, 6, 2, N'¿Cuál fue el imperio más grande de la historia?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (82, 6, 2, N'¿En qué año se firmó la Declaración de Independencia de Estados Unidos?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (83, 6, 2, N'¿Qué tratado puso fin a la Primera Guerra Mundial?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (84, 6, 2, N'¿Quién fue el último zar de Rusia?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (85, 6, 2, N'¿Cuál fue la causa principal de la Guerra de los Cien Años?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (86, 6, 3, N'¿Qué evento marcó el inicio de la Revolución Rusa?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (87, 6, 3, N'¿Cuál fue el período conocido como "La Gran Depresión"?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (88, 6, 3, N'¿Qué líder militar y político fue conocido como "El Águila de la Victoria"?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (89, 6, 3, N'¿En qué año se produjo la Revolución China?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (90, 6, 3, N'¿Cuál fue la primera dinastía de China?', NULL)
SET IDENTITY_INSERT [dbo].[Preguntas] OFF
GO
SET IDENTITY_INSERT [dbo].[Progresos] ON 

INSERT [dbo].[Progresos] ([idProgreso], [Arte], [Ciencia], [Deporte], [Entretenimiento], [Geografia], [Historia]) VALUES (7, 1, 0, 1, 0, 0, 0)
INSERT [dbo].[Progresos] ([idProgreso], [Arte], [Ciencia], [Deporte], [Entretenimiento], [Geografia], [Historia]) VALUES (8, 0, 0, 1, 1, 0, 0)
SET IDENTITY_INSERT [dbo].[Progresos] OFF
GO
SET IDENTITY_INSERT [dbo].[Respuestas] ON 

INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (1, 1, 1, N'Leonardo da Vinci', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (2, 1, 2, N'Pablo Picasso', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (3, 1, 3, N'Vincent van Gogh', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (4, 1, 4, N'Miguel Ángel', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (5, 2, 1, N'Pablo Picasso', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (6, 2, 2, N'Vincent van Gogh', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (7, 2, 3, N'Leonardo da Vinci', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (8, 2, 4, N'Miguel Ángel', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (9, 3, 1, N'Salvador Dalí', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (10, 3, 2, N'Pablo Picasso', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (11, 3, 3, N'Claude Monet', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (12, 3, 4, N'Vincent van Gogh', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (13, 4, 1, N'Noche estrellada', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (14, 4, 2, N'Los girasoles', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (15, 4, 3, N'La última cena', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (16, 4, 4, N'Guernica', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (17, 5, 1, N'Rafael', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (18, 5, 2, N'Leonardo da Vinci', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (19, 5, 3, N'Miguel Ángel', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (20, 5, 4, N'Donatello', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (21, 6, 1, N'Salvador Dalí', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (22, 6, 2, N'Pablo Picasso', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (23, 6, 3, N'Vincent van Gogh', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (24, 6, 4, N'Pablo Picasso', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (25, 7, 1, N'La persistencia de la memoria', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (26, 7, 2, N'El grito', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (27, 7, 3, N'La última cena', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (28, 7, 4, N'La noche estrellada', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (29, 8, 1, N'El pensador', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (30, 8, 2, N'David', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (31, 8, 3, N'La piedad', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (32, 8, 4, N'El David', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (33, 9, 1, N'Leonardo da Vinci', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (34, 9, 2, N'Rafael', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (35, 9, 3, N'Michelangelo', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (36, 9, 4, N'Donatello', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (37, 10, 1, N'Nenúfares', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (38, 10, 2, N'La noche estrellada', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (39, 10, 3, N'El jardín de las delicias', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (40, 10, 4, N'Los amantes', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (41, 11, 1, N'Leonardo da Vinci', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (42, 11, 2, N'Rafael', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (43, 11, 3, N'Vincent van Gogh', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (44, 11, 4, N'Sandro Botticelli', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (45, 12, 1, N'Noche estrellada', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (46, 12, 2, N'Los lirios de agua', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (47, 12, 3, N'El grito', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (48, 12, 4, N'La persistencia de la memoria', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (49, 13, 1, N'La creación de Adán', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (50, 13, 2, N'El juicio final', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (51, 13, 3, N'La última cena', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (52, 13, 4, N'La bóveda de la Capilla Sixtina', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (53, 14, 1, N'Salvador Dalí', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (54, 14, 2, N'Claude Monet', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (55, 14, 3, N'René Magritte', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (56, 14, 4, N'Pablo Picasso', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (57, 15, 1, N'El pensador', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (58, 15, 2, N'La puerta del infierno', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (59, 15, 3, N'David', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (60, 15, 4, N'La piedad', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (61, 16, 1, N'H2O', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (62, 16, 2, N'CO2', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (63, 16, 3, N'O2', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (64, 16, 4, N'NaCl', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (65, 17, 1, N'CO2', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (66, 17, 2, N'H2O', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (67, 17, 3, N'O2', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (68, 17, 4, N'NaCl', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (69, 18, 1, N'Jupiter', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (70, 18, 2, N'Saturno', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (71, 18, 3, N'Neptuno', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (72, 18, 4, N'Marte', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (73, 19, 1, N'Femur', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (74, 19, 2, N'Humero', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (75, 19, 3, N'Tibia', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (76, 19, 4, N'Perone', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (77, 20, 1, N'Seleccion natural', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (78, 20, 2, N'Evolucion artificial', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (79, 20, 3, N'Seleccion artificial', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (80, 20, 4, N'Adaptacion natural', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (81, 21, 1, N'C2H5OH', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (82, 21, 2, N'CH4', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (83, 21, 3, N'H2O', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (84, 21, 4, N'CO2', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (85, 22, 1, N'Mitosis', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (86, 22, 2, N'Meiosis', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (87, 22, 3, N'Citoquinesis', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (88, 22, 4, N'Fotosintesis', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (89, 23, 1, N'Una sustancia que dona protones', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (90, 23, 2, N'Una sustancia que acepta electrones', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (91, 23, 3, N'Una sustancia que libera electrones', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (92, 23, 4, N'Una sustancia que libera iones positivos', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (93, 24, 1, N'Albert Einstein', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (94, 24, 2, N'Isaac Newton', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (95, 24, 3, N'Galileo Galilei', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (96, 24, 4, N'Stephen Hawking', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (97, 25, 1, N'Fotosintesis', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (98, 25, 2, N'Respiracion celular', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (99, 25, 3, N'Fusion nuclear', 0, NULL)
GO
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (100, 25, 4, N'Fision nuclear', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (101, 26, 1, N'2', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (102, 26, 2, N'4', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (103, 26, 3, N'6', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (104, 26, 4, N'8', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (105, 27, 1, N'Glucolisis', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (106, 27, 2, N'Gluconeogenesis', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (107, 27, 3, N'Ciclo de Krebs', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (108, 27, 4, N'Fosforilacion oxidativa', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (109, 28, 1, N'Una region del espacio-tiempo de la cual nada puede escapar', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (110, 28, 2, N'Un objeto formado por la explosion de una supernova', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (111, 28, 3, N'Una region donde la gravedad es mas debil', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (112, 28, 4, N'Un agujero en la atmosfera de la Tierra', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (113, 29, 1, N'Isaac Newton', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (114, 29, 2, N'Galileo Galilei', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (115, 29, 3, N'Albert Einstein', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (116, 29, 4, N'Stephen Hawking', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (117, 30, 1, N'ADN', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (118, 30, 2, N'ARN', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (119, 30, 3, N'Ribosomas', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (120, 30, 4, N'Lisosomas', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (121, 31, 1, N'Fútbol', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (122, 31, 2, N'Baloncesto', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (123, 31, 3, N'Golf', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (124, 31, 4, N'Tenis', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (125, 32, 1, N'9', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (126, 32, 2, N'11', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (127, 32, 3, N'7', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (128, 32, 4, N'10', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (129, 33, 1, N'Voleibol', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (130, 33, 2, N'Béisbol', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (131, 33, 3, N'Baloncesto', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (132, 33, 4, N'Tenis', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (133, 34, 1, N'Fútbol Americano', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (134, 34, 2, N'Baloncesto', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (135, 34, 3, N'Béisbol', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (136, 34, 4, N'Fútbol', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (137, 35, 1, N'Wimbledon', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (138, 35, 2, N'US Open', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (139, 35, 3, N'Australian Open', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (140, 35, 4, N'Roland Garros', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (141, 36, 1, N'Bádminton', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (142, 36, 2, N'Tenis', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (143, 36, 3, N'Squash', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (144, 36, 4, N'Baloncesto', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (145, 37, 1, N'Chicago Bulls', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (146, 37, 2, N'Los Angeles Lakers', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (147, 37, 3, N'Miami Heat', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (148, 37, 4, N'Golden State Warriors', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (149, 38, 1, N'Tour de Francia', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (150, 38, 2, N'Giro de Italia', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (151, 38, 3, N'Vuelta a España', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (152, 38, 4, N'Giro de Francia', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (153, 39, 1, N'Nueva Zelanda', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (154, 39, 2, N'Inglaterra', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (155, 39, 3, N'Sudáfrica', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (156, 39, 4, N'Australia', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (157, 40, 1, N'Lombardi Trophy', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (158, 40, 2, N'World Series Trophy', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (159, 40, 3, N'NBA Championship Trophy', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (160, 40, 4, N'Stanley Cup', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (161, 41, 1, N'Skateboarding', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (162, 41, 2, N'BMX', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (163, 41, 3, N'Patinaje sobre hielo', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (164, 41, 4, N'Snowboarding', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (165, 42, 1, N'1896', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (166, 42, 2, N'1904', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (167, 42, 3, N'1924', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (168, 42, 4, N'1932', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (169, 43, 1, N'Conor McGregor', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (170, 43, 2, N'Jon Jones', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (171, 43, 3, N'Anderson Silva', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (172, 43, 4, N'Georges St-Pierre', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (173, 44, 1, N'Miami Dolphins', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (174, 44, 2, N'Pittsburgh Steelers', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (175, 44, 3, N'New England Patriots', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (176, 44, 4, N'San Francisco 49ers', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (177, 45, 1, N'2', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (178, 45, 2, N'3', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (179, 45, 3, N'4', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (180, 45, 4, N'5', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (181, 46, 1, N'Harry Potter', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (182, 46, 2, N'Hermione Granger', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (183, 46, 3, N'Ron Weasley', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (184, 46, 4, N'Severus Snape', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (185, 47, 1, N'Parasite', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (186, 47, 2, N'1917', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (187, 47, 3, N'Joker', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (188, 47, 4, N'The Irishman', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (189, 48, 1, N'El Señor de los Anillos', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (190, 48, 2, N'Harry Potter', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (191, 48, 3, N'Crepúsculo', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (192, 48, 4, N'Los Juegos del Hambre', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (193, 49, 1, N'Robert Downey Jr.', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (194, 49, 2, N'Chris Hemsworth', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (195, 49, 3, N'Chris Evans', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (196, 49, 4, N'Mark Ruffalo', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (197, 50, 1, N'Game of Thrones', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (198, 50, 2, N'The Walking Dead', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (199, 50, 3, N'Breaking Bad', 0, NULL)
GO
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (200, 50, 4, N'Stranger Things', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (201, 51, 1, N'Jennifer Lawrence', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (202, 51, 2, N'Emma Watson', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (203, 51, 3, N'Scarlett Johansson', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (204, 51, 4, N'Keira Knightley', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (205, 52, 1, N'Inception', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (206, 52, 2, N'Interstellar', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (207, 52, 3, N'The Matrix', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (208, 52, 4, N'Blade Runner', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (209, 53, 1, N'Roy Batty', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (210, 53, 2, N'HAL 9000', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (211, 53, 3, N'R2-D2', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (212, 53, 4, N'C-3PO', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (213, 54, 1, N'Leonardo DiCaprio', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (214, 54, 2, N'Tom Hanks', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (215, 54, 3, N'Brad Pitt', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (216, 54, 4, N'Johnny Depp', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (217, 55, 1, N'Breaking Bad', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (218, 55, 2, N'The Sopranos', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (219, 55, 3, N'House of Cards', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (220, 55, 4, N'Dexter', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (221, 56, 1, N'2001: A Space Odyssey', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (222, 56, 2, N'Star Wars', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (223, 56, 3, N'Close Encounters of the Third Kind', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (224, 56, 4, N'E.T. the Extra-Terrestrial', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (225, 57, 1, N'Sherlock', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (226, 57, 2, N'Poirot', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (227, 57, 3, N'Columbo', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (228, 57, 4, N'Monk', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (229, 58, 1, N'Kill Bill', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (230, 58, 2, N'Pulp Fiction', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (231, 58, 3, N'Reservoir Dogs', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (232, 58, 4, N'Django Unchained', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (233, 59, 1, N'The Handmaid sTales Tale', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (234, 59, 2, N'Brave New World', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (235, 59, 3, N'Fahrenheit 451', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (236, 59, 4, N'1984', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (237, 60, 1, N'The Matrix', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (238, 60, 2, N'Inception', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (239, 60, 3, N'Minority Report', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (240, 60, 4, N'Total Recall', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (241, 61, 1, N'París', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (242, 61, 2, N'Londres', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (243, 61, 3, N'Madrid', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (244, 61, 4, N'Roma', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (245, 62, 1, N'China', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (246, 62, 2, N'India', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (247, 62, 3, N'Japón', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (248, 62, 4, N'Brasil', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (249, 63, 1, N'Nilo', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (250, 63, 2, N'Amazonas', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (251, 63, 3, N'Yangtsé', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (252, 63, 4, N'Misisipi', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (253, 64, 1, N'Oceanía', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (254, 64, 2, N'Europa', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (255, 64, 3, N'América', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (256, 64, 4, N'Asia', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (257, 65, 1, N'Rusia', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (258, 65, 2, N'Canadá', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (259, 65, 3, N'Estados Unidos', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (260, 65, 4, N'China', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (261, 66, 1, N'Monte Everest', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (262, 66, 2, N'Aconcagua', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (263, 66, 3, N'K2', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (264, 66, 4, N'Monte Kilimanjaro', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (265, 67, 1, N'India', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (266, 67, 2, N'China', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (267, 67, 3, N'Egipto', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (268, 67, 4, N'Italia', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (269, 68, 1, N'Superior', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (270, 68, 2, N'Michigan', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (271, 68, 3, N'Baikal', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (272, 68, 4, N'Victoria', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (273, 69, 1, N'África', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (274, 69, 2, N'Asia', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (275, 69, 3, N'América', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (276, 69, 4, N'Europa', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (277, 70, 1, N'China', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (278, 70, 2, N'India', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (279, 70, 3, N'Estados Unidos', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (280, 70, 4, N'Indonesia', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (281, 71, 1, N'Tanzania', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (282, 71, 2, N'Kenia', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (283, 71, 3, N'Etiopía', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (284, 71, 4, N'Uganda', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (285, 72, 1, N'Finlandia', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (286, 72, 2, N'Canadá', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (287, 72, 3, N'Indonesia', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (288, 72, 4, N'Filipinas', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (289, 73, 1, N'Asia', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (290, 73, 2, N'Europa', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (291, 73, 3, N'África', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (292, 73, 4, N'América', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (293, 74, 1, N'Ulán Bator', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (294, 74, 2, N'Astana', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (295, 74, 3, N'Biskek', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (296, 74, 4, N'Dusambé', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (297, 75, 1, N'Noruega', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (298, 75, 2, N'Canadá', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (299, 75, 3, N'Groenlandia', 0, NULL)
GO
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (300, 75, 4, N'Rusia', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (301, 76, 1, N'1989', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (302, 76, 2, N'1991', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (303, 76, 3, N'1979', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (304, 76, 4, N'1993', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (305, 77, 1, N'George Washington', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (306, 77, 2, N'Abraham Lincoln', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (307, 77, 3, N'Thomas Jefferson', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (308, 77, 4, N'Benjamin Franklin', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (309, 78, 1, N'El establecimiento de una monarquía constitucional', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (310, 78, 2, N'La independencia de España', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (311, 78, 3, N'El fin de la Edad Media', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (312, 78, 4, N'La consolidación del feudalismo', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (313, 79, 1, N'1939', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (314, 79, 2, N'1941', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (315, 79, 3, N'1945', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (316, 79, 4, N'1942', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (317, 80, 1, N'Otto von Bismarck', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (318, 80, 2, N'Napoleón Bonaparte', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (319, 80, 3, N'Winston Churchill', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (320, 80, 4, N'Vladimir Lenin', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (321, 81, 1, N'Imperio Mongol', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (322, 81, 2, N'Imperio Romano', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (323, 81, 3, N'Imperio Británico', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (324, 81, 4, N'Imperio Otomano', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (325, 82, 1, N'1776', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (326, 82, 2, N'1789', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (327, 82, 3, N'1804', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (328, 82, 4, N'1812', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (329, 83, 1, N'Tratado de Versalles', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (330, 83, 2, N'Tratado de Tordesillas', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (331, 83, 3, N'Tratado de Westfalia', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (332, 83, 4, N'Tratado de Viena', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (333, 84, 1, N'Nicolás II', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (334, 84, 2, N'Pedro I', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (335, 84, 3, N'Alejandro III', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (336, 84, 4, N'Iván IV', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (337, 85, 1, N'Conflicto entre Francia e Inglaterra por la posesión del territorio francés', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (338, 85, 2, N'Disputa entre la Casa de Lancaster y la Casa de York por el trono inglés', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (339, 85, 3, N'Lucha por la independencia de Escocia', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (340, 85, 4, N'Enfrentamiento entre España y Portugal por el control de América', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (341, 86, 1, N'La Revolución de Febrero de 1917', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (342, 86, 2, N'La Revolución de Octubre de 1917', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (343, 86, 3, N'La Revolución de Octubre de 1905', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (344, 86, 4, N'La Revolución de Febrero de 1905', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (345, 87, 1, N'La crisis económica y financiera que comenzó en 1929', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (346, 87, 2, N'La guerra entre China y Japón en 1937', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (347, 87, 3, N'El fin de la Primera Guerra Mundial', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (348, 87, 4, N'La caída del Imperio Otomano', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (349, 88, 1, N'Napoleón Bonaparte', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (350, 88, 2, N'Julio César', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (351, 88, 3, N'Alejandro Magno', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (352, 88, 4, N'Augusto', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (353, 89, 1, N'Bolcheviques', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (354, 89, 2, N'Mensheviks', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (355, 89, 3, N'Ejército Blanco', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (356, 89, 4, N'Ejército Rojo', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (357, 90, 1, N'Partido Nazi', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (358, 90, 2, N'Partido Comunista', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (359, 90, 3, N'Partido Socialista', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (360, 90, 4, N'Partido Fascista', 0, NULL)
SET IDENTITY_INSERT [dbo].[Respuestas] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([idUsuario], [Nombre], [Contrasena]) VALUES (3, N'Yukel', N'$2a$11$gdwsTFsSwjEUrKdIRo0E.uCnkddjP.NGiyg2ext4RnfIcZeXNRzUm')
INSERT [dbo].[Usuarios] ([idUsuario], [Nombre], [Contrasena]) VALUES (4, N'Iao', N'$2a$11$9GTivd031KsCFJrR3ZPc8u1wih9yGhfURIQNpJxG0s1mAxUGku1T.')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
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
/****** Object:  StoredProcedure [dbo].[sp_ActualizarProgreso]    Script Date: 5/9/2023 11:40:50 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ActualizarTurno]    Script Date: 5/9/2023 11:40:50 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_AgregarUsuario]    Script Date: 5/9/2023 11:40:50 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_CrearPartida]    Script Date: 5/9/2023 11:40:50 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_EliminarPartida]    Script Date: 5/9/2023 11:40:50 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ObtenerPartida]    Script Date: 5/9/2023 11:40:50 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ObtenerPartidas]    Script Date: 5/9/2023 11:40:50 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ObtenerPregunta]    Script Date: 5/9/2023 11:40:50 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ObtenerPreguntas]    Script Date: 5/9/2023 11:40:50 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ObtenerProgreso]    Script Date: 5/9/2023 11:40:50 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ObtenerRespuestas]    Script Date: 5/9/2023 11:40:50 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ObtenerUsuario]    Script Date: 5/9/2023 11:40:50 ******/
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
