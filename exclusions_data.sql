USE [PizzaItalia]
GO
/****** Object:  Table [dbo].[ingredients_exclusions]    Script Date: 11/14/2022 9:45:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ingredients_exclusions](
	[order_id] [int] NULL,
	[pizza_id] [int] NULL,
	[exclusions] [varchar](30) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[ingredients_exclusions] ([order_id], [pizza_id], [exclusions]) VALUES (4, 1, N'4')
INSERT [dbo].[ingredients_exclusions] ([order_id], [pizza_id], [exclusions]) VALUES (4, 2, N'4')
INSERT [dbo].[ingredients_exclusions] ([order_id], [pizza_id], [exclusions]) VALUES (9, 1, N'4')
INSERT [dbo].[ingredients_exclusions] ([order_id], [pizza_id], [exclusions]) VALUES (10, 1, N'2')
INSERT [dbo].[ingredients_exclusions] ([order_id], [pizza_id], [exclusions]) VALUES (10, 1, N'6')
