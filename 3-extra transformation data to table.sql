USE [PizzaItalia]
GO
/****** Object:  Table [dbo].[ingredients_extras]    Script Date: 11/14/2022 8:24:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ingredients_extras](
	[order_id] [int] NULL,
	[pizza_id] [int] NULL,
	[extras] [varchar](30) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[ingredients_extras] ([order_id], [pizza_id], [extras]) VALUES (5, 1, N'1')
INSERT [dbo].[ingredients_extras] ([order_id], [pizza_id], [extras]) VALUES (7, 2, N'1')
INSERT [dbo].[ingredients_extras] ([order_id], [pizza_id], [extras]) VALUES (9, 1, N'1')
INSERT [dbo].[ingredients_extras] ([order_id], [pizza_id], [extras]) VALUES (9, 1, N'5')
INSERT [dbo].[ingredients_extras] ([order_id], [pizza_id], [extras]) VALUES (10, 1, N'1')
INSERT [dbo].[ingredients_extras] ([order_id], [pizza_id], [extras]) VALUES (10, 1, N'4')
INSERT [dbo].[ingredients_extras] ([order_id], [pizza_id], [extras]) VALUES (11, 3, N'8')
