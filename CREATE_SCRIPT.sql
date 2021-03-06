USE [master]
GO
/****** Object:  Database [FOODRECIPES]    Script Date: 3/25/2021 11:36:19 AM ******/
CREATE DATABASE [FOODRECIPES]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FOODRECIPES', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2021\MSSQL\DATA\FOODRECIPES.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FOODRECIPES_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2021\MSSQL\DATA\FOODRECIPES_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FOODRECIPES] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FOODRECIPES].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FOODRECIPES] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FOODRECIPES] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FOODRECIPES] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FOODRECIPES] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FOODRECIPES] SET ARITHABORT OFF 
GO
ALTER DATABASE [FOODRECIPES] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FOODRECIPES] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FOODRECIPES] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FOODRECIPES] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FOODRECIPES] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FOODRECIPES] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FOODRECIPES] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FOODRECIPES] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FOODRECIPES] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FOODRECIPES] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FOODRECIPES] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FOODRECIPES] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FOODRECIPES] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FOODRECIPES] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FOODRECIPES] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FOODRECIPES] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FOODRECIPES] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FOODRECIPES] SET RECOVERY FULL 
GO
ALTER DATABASE [FOODRECIPES] SET  MULTI_USER 
GO
ALTER DATABASE [FOODRECIPES] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FOODRECIPES] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FOODRECIPES] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FOODRECIPES] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FOODRECIPES] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FOODRECIPES] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FOODRECIPES', N'ON'
GO
ALTER DATABASE [FOODRECIPES] SET QUERY_STORE = OFF
GO
USE [FOODRECIPES]
GO
/****** Object:  Table [dbo].[ListaProduse]    Script Date: 3/25/2021 11:36:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListaProduse](
	[IDProdus] [int] IDENTITY(1,1) NOT NULL,
	[DenumireProdus] [varchar](40) NULL,
	[UnitateMasura] [varchar](20) NULL,
	[idcategorie] [int] NULL,
 CONSTRAINT [PK_ListaProduse] PRIMARY KEY CLUSTERED 
(
	[IDProdus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [ProdusUnic] UNIQUE NONCLUSTERED 
(
	[DenumireProdus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ListaRetete]    Script Date: 3/25/2021 11:36:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListaRetete](
	[Reteta] [varchar](40) NULL,
	[DescriereReteta] [varchar](500) NULL,
	[IDReteta] [int] IDENTITY(100,1) NOT NULL,
	[ComentariiSupl] [varchar](100) NULL,
 CONSTRAINT [PK_ListaRetete] PRIMARY KEY CLUSTERED 
(
	[IDReteta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReteteProduse]    Script Date: 3/25/2021 11:36:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReteteProduse](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDProdus] [int] NULL,
	[IDReteta] [int] NULL,
	[Cantitate] [decimal](10, 2) NULL,
 CONSTRAINT [PK_ReteteProduse] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategorieProdus]    Script Date: 3/25/2021 11:36:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategorieProdus](
	[DenumireCategorie] [varchar](20) NULL,
	[IDCategorie] [int] IDENTITY(1,1) NOT NULL,
	[OrdineCategorie] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDCategorie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ViewRetete]    Script Date: 3/25/2021 11:36:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewRetete]
AS
SELECT        dbo.ListaRetete.Reteta, dbo.ListaRetete.DescriereReteta, dbo.ListaRetete.IDReteta, dbo.ListaProduse.DenumireProdus, dbo.ListaProduse.IDProdus, dbo.ListaProduse.UnitateMasura, dbo.ReteteProduse.Cantitate, 
                         dbo.CategorieProdus.DenumireCategorie, dbo.CategorieProdus.IDCategorie, dbo.CategorieProdus.OrdineCategorie
FROM            dbo.ListaRetete INNER JOIN
                         dbo.ReteteProduse ON dbo.ListaRetete.IDReteta = dbo.ReteteProduse.IDReteta INNER JOIN
                         dbo.ListaProduse ON dbo.ReteteProduse.IDProdus = dbo.ListaProduse.IDProdus INNER JOIN
                         dbo.CategorieProdus ON dbo.ListaProduse.idcategorie = dbo.CategorieProdus.IDCategorie
GO
/****** Object:  View [dbo].[ViewALLRetete]    Script Date: 3/25/2021 11:36:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewALLRetete]
AS
SELECT        dbo.ListaRetete.Reteta, dbo.ListaRetete.DescriereReteta, dbo.ListaRetete.IDReteta, dbo.ListaProduse.DenumireProdus, dbo.ListaProduse.IDProdus, dbo.ListaProduse.UnitateMasura, dbo.ReteteProduse.Cantitate, 
                         dbo.CategorieProdus.DenumireCategorie, dbo.CategorieProdus.IDCategorie, dbo.CategorieProdus.OrdineCategorie, dbo.ReteteProduse.IDProdus AS Expr1
FROM            dbo.CategorieProdus FULL OUTER JOIN
                         dbo.ListaProduse ON dbo.CategorieProdus.IDCategorie = dbo.ListaProduse.idcategorie FULL OUTER JOIN
                         dbo.ListaRetete FULL OUTER JOIN
                         dbo.ReteteProduse ON dbo.ListaRetete.IDReteta = dbo.ReteteProduse.IDReteta ON dbo.ListaProduse.IDProdus = dbo.ReteteProduse.IDProdus
GO
ALTER TABLE [dbo].[ListaRetete] ADD  CONSTRAINT [Cstr_ComentariiSupl]  DEFAULT ('NoCommentYet') FOR [ComentariiSupl]
GO
ALTER TABLE [dbo].[ReteteProduse]  WITH CHECK ADD  CONSTRAINT [FK_ReteteProduse_LP_IDProdus] FOREIGN KEY([IDProdus])
REFERENCES [dbo].[ListaProduse] ([IDProdus])
GO
ALTER TABLE [dbo].[ReteteProduse] CHECK CONSTRAINT [FK_ReteteProduse_LP_IDProdus]
GO
ALTER TABLE [dbo].[ReteteProduse]  WITH CHECK ADD  CONSTRAINT [FK_ReteteProduse_LP_IDRetete] FOREIGN KEY([IDReteta])
REFERENCES [dbo].[ListaRetete] ([IDReteta])
GO
ALTER TABLE [dbo].[ReteteProduse] CHECK CONSTRAINT [FK_ReteteProduse_LP_IDRetete]
GO
/****** Object:  StoredProcedure [dbo].[ListaCumparaturiSaptamanala]    Script Date: 3/25/2021 11:36:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ListaCumparaturiSaptamanala]
AS
BEGIN
    SET NOCOUNT ON;
    SELECT   ListaProduse.DenumireProdus,
             ListaProduse.UnitateMasura,
             Sum(ReteteProduse.Cantitate) AS CantitateTotalaProduse,
             string_agg(concat(reteta, '(', Cantitate, ')'), '  ') AS DescriereRetete,
             CategorieProdus.DenumireCategorie,
             CategorieProdus.OrdineCategorie
    FROM     ListaProduse
             INNER JOIN
             ReteteProduse
             ON ReteteProduse.IDProdus = ListaProduse.IDProdus
             INNER JOIN
             ListaRetete
             ON ReteteProduse.IDReteta = ListaRetete.IDReteta
             INNER JOIN
             CategorieProdus
             ON ListaProduse.IDCategorie = CategorieProdus.IDCategorie
    GROUP BY DenumireProdus, UnitateMasura, CategorieProdus.DenumireCategorie, CategorieProdus.OrdineCategorie
    ORDER BY OrdineCategorie ASC;
END

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[42] 4[26] 2[13] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CategorieProdus"
            Begin Extent = 
               Top = 6
               Left = 455
               Bottom = 119
               Right = 647
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ListaProduse"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 216
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ListaRetete"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 209
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ReteteProduse"
            Begin Extent = 
               Top = 6
               Left = 247
               Bottom = 136
               Right = 417
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
        ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewALLRetete'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewALLRetete'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewALLRetete'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[42] 4[26] 2[22] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ListaRetete"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 209
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ReteteProduse"
            Begin Extent = 
               Top = 6
               Left = 247
               Bottom = 136
               Right = 417
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ListaProduse"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 216
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CategorieProdus"
            Begin Extent = 
               Top = 6
               Left = 455
               Bottom = 119
               Right = 647
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 2220
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewRetete'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewRetete'
GO
USE [master]
GO
ALTER DATABASE [FOODRECIPES] SET  READ_WRITE 
GO
