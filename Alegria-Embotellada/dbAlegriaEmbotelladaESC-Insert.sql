GO
CREATE TABLE [dbo].[tb_Artículo](
	[PK_Artículo] [int] NOT NULL,
	[Nombre] [varchar](15) NOT NULL,
	[Marca] [varchar](50) NOT NULL,
	[Precio] [money] NOT NULL,
	[Existencia] [varchar](2) NOT NULL,
	[Presentacion] [int] NOT NULL,
	[FK_Proveedor] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_Artículo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tb_Artículo] ([PK_Artículo], [Nombre], [Marca], [Precio], [Existencia], [Presentacion], [FK_Proveedor]) VALUES (1, N'Cuah. Moctezuma', N'TEKATE', 12.5000, N'14', 355, 1)
INSERT [dbo].[tb_Artículo] ([PK_Artículo], [Nombre], [Marca], [Precio], [Existencia], [Presentacion], [FK_Proveedor]) VALUES (2, N'Cuah. Moctezuma', N'XX', 13.5000, N'14', 355, 1)
INSERT [dbo].[tb_Artículo] ([PK_Artículo], [Nombre], [Marca], [Precio], [Existencia], [Presentacion], [FK_Proveedor]) VALUES (3, N'Cuah. Moctezuma', N'Carta Blanca', 13.5000, N'14', 355, 1)
INSERT [dbo].[tb_Artículo] ([PK_Artículo], [Nombre], [Marca], [Precio], [Existencia], [Presentacion], [FK_Proveedor]) VALUES (4, N'Cuah.Moctezuma', N'Closter Light', 6.5000, N'13', 355, 1)
INSERT [dbo].[tb_Artículo] ([PK_Artículo], [Nombre], [Marca], [Precio], [Existencia], [Presentacion], [FK_Proveedor]) VALUES (5, N'Cuah. Moctezuma', N'Heineken', 7.5000, N'13', 355, 1)
INSERT [dbo].[tb_Artículo] ([PK_Artículo], [Nombre], [Marca], [Precio], [Existencia], [Presentacion], [FK_Proveedor]) VALUES (6, N'Cuah. Moctezuma', N'Indio', 12.0000, N'13', 355, 1)
INSERT [dbo].[tb_Artículo] ([PK_Artículo], [Nombre], [Marca], [Precio], [Existencia], [Presentacion], [FK_Proveedor]) VALUES (7, N'Cuah. Moctezuma', N'Sol', 12.5000, N'14', 355, 1)
INSERT [dbo].[tb_Artículo] ([PK_Artículo], [Nombre], [Marca], [Precio], [Existencia], [Presentacion], [FK_Proveedor]) VALUES (8, N'Cuah.Moctezuma', N'Bohemia', 16.0000, N'14', 355, 1)
INSERT [dbo].[tb_Artículo] ([PK_Artículo], [Nombre], [Marca], [Precio], [Existencia], [Presentacion], [FK_Proveedor]) VALUES (9, N'Cuah. Moctezuma', N'Coors Light', 12.0000, N'14', 355, 1)
INSERT [dbo].[tb_Artículo] ([PK_Artículo], [Nombre], [Marca], [Precio], [Existencia], [Presentacion], [FK_Proveedor]) VALUES (10, N'Cuah. Moctezuma', N'Superior', 10.5000, N'1', 355, 1)
/****** Object:  Table [dbo].[tb_Promoción]    Script Date: 08/02/2016 21:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Promoción](
	[PK_Promoción] [int] NOT NULL,
	[Dia_Inicio] [varchar](10) NOT NULL,
	[Dia_Finalización] [varchar](10) NOT NULL,
	[FK_Sucursal] [int] NOT NULL,
	[FK_Artículo] [int] NOT NULL,
	[Descripción] [varchar](100) NOT NULL,
	[Cantidad_Artículo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_Promoción] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tb_Promoción] ([PK_Promoción], [Dia_Inicio], [Dia_Finalización], [FK_Sucursal], [FK_Artículo], [Descripción], [Cantidad_Artículo]) VALUES (1, N'2016-10-01', N'2016-11-30', 1, 1, N'Six TEKATE de 355ml por $75.00', 1)
INSERT [dbo].[tb_Promoción] ([PK_Promoción], [Dia_Inicio], [Dia_Finalización], [FK_Sucursal], [FK_Artículo], [Descripción], [Cantidad_Artículo]) VALUES (2, N'02-11-2016', N'30-12-2016', 2, 2, N'Six XX de 355ml por $81.00', 1)
INSERT [dbo].[tb_Promoción] ([PK_Promoción], [Dia_Inicio], [Dia_Finalización], [FK_Sucursal], [FK_Artículo], [Descripción], [Cantidad_Artículo]) VALUES (3, N'27-12-2016', N'30-01-2017', 20, 3, N'Six Carta blanca de 355ml a $81.00', 1)
INSERT [dbo].[tb_Promoción] ([PK_Promoción], [Dia_Inicio], [Dia_Finalización], [FK_Sucursal], [FK_Artículo], [Descripción], [Cantidad_Artículo]) VALUES (4, N'25-06-2016', N'30-07-2016', 28, 4, N'Six Closter Light de 355ml a $39.00', 1)
INSERT [dbo].[tb_Promoción] ([PK_Promoción], [Dia_Inicio], [Dia_Finalización], [FK_Sucursal], [FK_Artículo], [Descripción], [Cantidad_Artículo]) VALUES (5, N'29-07-2016', N'30-08-2016', 16, 5, N'Six Heineken de 355ml a $45.00', 1)
INSERT [dbo].[tb_Promoción] ([PK_Promoción], [Dia_Inicio], [Dia_Finalización], [FK_Sucursal], [FK_Artículo], [Descripción], [Cantidad_Artículo]) VALUES (6, N'15-08-2016', N'30-09-2016', 14, 6, N'Six de Indio de 355ml a $72.00', 1)
INSERT [dbo].[tb_Promoción] ([PK_Promoción], [Dia_Inicio], [Dia_Finalización], [FK_Sucursal], [FK_Artículo], [Descripción], [Cantidad_Artículo]) VALUES (7, N'20-06-2016', N'30-07-2016', 30, 7, N'Six de Sol de 355ml a $75.00', 1)
INSERT [dbo].[tb_Promoción] ([PK_Promoción], [Dia_Inicio], [Dia_Finalización], [FK_Sucursal], [FK_Artículo], [Descripción], [Cantidad_Artículo]) VALUES (8, N'23-09-2016', N'30-10-2016', 44, 8, N'Six de Bohemia de 355ml a $96.00', 1)
INSERT [dbo].[tb_Promoción] ([PK_Promoción], [Dia_Inicio], [Dia_Finalización], [FK_Sucursal], [FK_Artículo], [Descripción], [Cantidad_Artículo]) VALUES (9, N'17-04-2016', N'30-05-2016', 27, 9, N'Six de Coors Light de 355ml a $72.00', 1)
INSERT [dbo].[tb_Promoción] ([PK_Promoción], [Dia_Inicio], [Dia_Finalización], [FK_Sucursal], [FK_Artículo], [Descripción], [Cantidad_Artículo]) VALUES (10, N'18-08-2016', N'18-09-2016', 39, 10, N'Six de Superior de 355ml a $63.00', 1)
/****** Object:  ForeignKey [id_Proveedor]    Script Date: 08/02/2016 21:15:30 ******/
ALTER TABLE [dbo].[tb_Artículo]  WITH CHECK ADD  CONSTRAINT [id_Proveedor] FOREIGN KEY([FK_Proveedor])
REFERENCES [dbo].[tb_Proveedor] ([PK_Proveedor])
GO
ALTER TABLE [dbo].[tb_Artículo] CHECK CONSTRAINT [id_Proveedor]
GO
/****** Object:  ForeignKey [cod_Usuario]    Script Date: 08/02/2016 21:15:30 ******/
ALTER TABLE [dbo].[tb_Consumidor]  WITH CHECK ADD  CONSTRAINT [cod_Usuario] FOREIGN KEY([FK_Usuario])
REFERENCES [dbo].[tb_Login] ([PK_Usuario])
GO
ALTER TABLE [dbo].[tb_Consumidor] CHECK CONSTRAINT [cod_Usuario]
GO
/****** Object:  ForeignKey [cod_Articulo]    Script Date: 08/02/2016 21:15:30 ******/
ALTER TABLE [dbo].[tb_Promoción]  WITH CHECK ADD  CONSTRAINT [cod_Articulo] FOREIGN KEY([FK_Artículo])
REFERENCES [dbo].[tb_Artículo] ([PK_Artículo])
GO
ALTER TABLE [dbo].[tb_Promoción] CHECK CONSTRAINT [cod_Articulo]
GO
/****** Object:  ForeignKey [cod_sucursal]    Script Date: 08/02/2016 21:15:30 ******/
ALTER TABLE [dbo].[tb_Promoción]  WITH CHECK ADD  CONSTRAINT [cod_sucursal] FOREIGN KEY([FK_Sucursal])
REFERENCES [dbo].[tb_Sucursal] ([PK_Sucursal])
GO
ALTER TABLE [dbo].[tb_Promoción] CHECK CONSTRAINT [cod_sucursal]
GO
