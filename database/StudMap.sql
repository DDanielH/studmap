USE [StudMap]
GO
/****** Object:  Table [dbo].[Edges]    Script Date: 29.10.2013 08:19:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Edges](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GraphId] [int] NOT NULL,
	[NodeStartId] [int] NOT NULL,
	[NodeEndId] [int] NOT NULL,
	[CreationTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Edges] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Floors]    Script Date: 29.10.2013 08:19:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Floors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MapId] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[CreationTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Floors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Graphs]    Script Date: 29.10.2013 08:19:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Graphs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MapId] [int] NOT NULL,
	[CreationTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Graphs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Maps]    Script Date: 29.10.2013 08:19:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Maps](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[CreationTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Maps] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NodeInformation]    Script Date: 29.10.2013 08:19:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NodeInformation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NodeId] [int] NOT NULL,
	[DisplayName] [nvarchar](50) NULL,
	[RoomName] [nvarchar](255) NULL,
	[PoI] [nvarchar](255) NULL,
	[QRCode] [nvarchar](255) NULL,
	[NFCTag] [nvarchar](50) NULL,
	[CreationTime] [datetime] NOT NULL,
 CONSTRAINT [PK_NodeInformation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Nodes]    Script Date: 29.10.2013 08:19:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nodes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FloorId] [int] NOT NULL,
	[X] [decimal](18, 4) NOT NULL,
	[Y] [decimal](18, 4) NOT NULL,
	[CreationTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Nodes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ActiveUsers]    Script Date: 30.10.2013 10:23:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ActiveUsers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[LoginDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ActiveUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

GO
ALTER TABLE [dbo].[Edges] ADD  CONSTRAINT [DF_Edges_CreationTime]  DEFAULT (getdate()) FOR [CreationTime]
GO
ALTER TABLE [dbo].[Floors] ADD  CONSTRAINT [DF_Floors_CreationTime]  DEFAULT (getdate()) FOR [CreationTime]
GO
ALTER TABLE [dbo].[Graphs] ADD  CONSTRAINT [DF_Graphs_CreationTime]  DEFAULT (getdate()) FOR [CreationTime]
GO
ALTER TABLE [dbo].[Maps] ADD  CONSTRAINT [DF_Maps_CreationTime]  DEFAULT (getdate()) FOR [CreationTime]
GO
ALTER TABLE [dbo].[NodeInformation] ADD  CONSTRAINT [DF_NodeInformation_CreationTime]  DEFAULT (getdate()) FOR [CreationTime]
GO
ALTER TABLE [dbo].[Nodes] ADD  CONSTRAINT [DF_Nodes_CreationTime]  DEFAULT (getdate()) FOR [CreationTime]
GO
ALTER TABLE [dbo].[Edges]  WITH CHECK ADD  CONSTRAINT [FK_Edges_EndNodes] FOREIGN KEY([NodeEndId])
REFERENCES [dbo].[Nodes] ([Id])
GO
ALTER TABLE [dbo].[Edges] CHECK CONSTRAINT [FK_Edges_EndNodes]
GO
ALTER TABLE [dbo].[Edges]  WITH CHECK ADD  CONSTRAINT [FK_Edges_Graphs] FOREIGN KEY([GraphId])
REFERENCES [dbo].[Graphs] ([Id])
GO
ALTER TABLE [dbo].[Edges] CHECK CONSTRAINT [FK_Edges_Graphs]
GO
ALTER TABLE [dbo].[Edges]  WITH CHECK ADD  CONSTRAINT [FK_Edges_StartNodes] FOREIGN KEY([NodeStartId])
REFERENCES [dbo].[Nodes] ([Id])
GO
ALTER TABLE [dbo].[Edges] CHECK CONSTRAINT [FK_Edges_StartNodes]
GO
ALTER TABLE [dbo].[Floors]  WITH CHECK ADD  CONSTRAINT [FK_Floors_Maps] FOREIGN KEY([MapId])
REFERENCES [dbo].[Maps] ([Id])
GO
ALTER TABLE [dbo].[Floors] CHECK CONSTRAINT [FK_Floors_Maps]
GO
ALTER TABLE [dbo].[Graphs]  WITH CHECK ADD  CONSTRAINT [FK_Graphs_Maps] FOREIGN KEY([MapId])
REFERENCES [dbo].[Maps] ([Id])
GO
ALTER TABLE [dbo].[Graphs] CHECK CONSTRAINT [FK_Graphs_Maps]
GO
ALTER TABLE [dbo].[NodeInformation]  WITH CHECK ADD  CONSTRAINT [FK_NodeInformation_Nodes] FOREIGN KEY([NodeId])
REFERENCES [dbo].[Nodes] ([Id])
GO
ALTER TABLE [dbo].[NodeInformation] CHECK CONSTRAINT [FK_NodeInformation_Nodes]
GO
ALTER TABLE [dbo].[Nodes]  WITH CHECK ADD  CONSTRAINT [FK_Nodes_Floors] FOREIGN KEY([FloorId])
REFERENCES [dbo].[Floors] ([Id])
GO
ALTER TABLE [dbo].[Nodes] CHECK CONSTRAINT [FK_Nodes_Floors]
GO
