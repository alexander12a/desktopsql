USE [PizzaItalia]
GO
/****** Object:  Table [dbo].[ingredients_base]    Script Date: 11/14/2022 6:29:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ingredients_base](
	[id] [int] NULL,
	[quantity] [int] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[ingredients_base] ([id], [quantity]) VALUES (1, 6)
INSERT [dbo].[ingredients_base] ([id], [quantity]) VALUES (10, 6)
INSERT [dbo].[ingredients_base] ([id], [quantity]) VALUES (11, 4)
INSERT [dbo].[ingredients_base] ([id], [quantity]) VALUES (12, 4)
INSERT [dbo].[ingredients_base] ([id], [quantity]) VALUES (13, 1)
INSERT [dbo].[ingredients_base] ([id], [quantity]) VALUES (2, 6)
INSERT [dbo].[ingredients_base] ([id], [quantity]) VALUES (3, 6)
INSERT [dbo].[ingredients_base] ([id], [quantity]) VALUES (4, 9)
INSERT [dbo].[ingredients_base] ([id], [quantity]) VALUES (5, 6)
INSERT [dbo].[ingredients_base] ([id], [quantity]) VALUES (6, 10)
INSERT [dbo].[ingredients_base] ([id], [quantity]) VALUES (7, 3)
INSERT [dbo].[ingredients_base] ([id], [quantity]) VALUES (8, 6)
INSERT [dbo].[ingredients_base] ([id], [quantity]) VALUES (9, 3)
