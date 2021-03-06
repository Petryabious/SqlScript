USE [master]
GO
/****** Object:  Database [garmet_factory]    Script Date: 04.02.2021 20:32:15 ******/
CREATE DATABASE [garmet_factory]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'garmet_factory', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.PETRYABIUS\MSSQL\DATA\garmet_factory.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'garmet_factory_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.PETRYABIUS\MSSQL\DATA\garmet_factory_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [garmet_factory] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [garmet_factory].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [garmet_factory] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [garmet_factory] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [garmet_factory] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [garmet_factory] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [garmet_factory] SET ARITHABORT OFF 
GO
ALTER DATABASE [garmet_factory] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [garmet_factory] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [garmet_factory] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [garmet_factory] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [garmet_factory] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [garmet_factory] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [garmet_factory] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [garmet_factory] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [garmet_factory] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [garmet_factory] SET  DISABLE_BROKER 
GO
ALTER DATABASE [garmet_factory] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [garmet_factory] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [garmet_factory] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [garmet_factory] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [garmet_factory] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [garmet_factory] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [garmet_factory] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [garmet_factory] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [garmet_factory] SET  MULTI_USER 
GO
ALTER DATABASE [garmet_factory] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [garmet_factory] SET DB_CHAINING OFF 
GO
ALTER DATABASE [garmet_factory] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [garmet_factory] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [garmet_factory] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [garmet_factory] SET QUERY_STORE = OFF
GO
USE [garmet_factory]
GO
/****** Object:  Table [dbo].[Cloth]    Script Date: 04.02.2021 20:32:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cloth](
	[idCodeCloth] [int] NOT NULL,
	[nameOfCloth] [varchar](50) NOT NULL,
	[color] [varchar](30) NULL,
	[illustration] [varbinary](max) NULL,
	[compound] [varchar](150) NULL,
	[width] [decimal](10, 2) NOT NULL,
	[length] [decimal](10, 2) NOT NULL,
	[priceOfCloth] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Cloth] PRIMARY KEY CLUSTERED 
(
	[idCodeCloth] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cloth_Of_products]    Script Date: 04.02.2021 20:32:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cloth_Of_products](
	[idCodeOfCloth] [int] NOT NULL,
	[idCodeOfProducts] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Furniture]    Script Date: 04.02.2021 20:32:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Furniture](
	[idCodeFurniture] [int] NOT NULL,
	[nameOfFurniture] [varchar](50) NOT NULL,
	[typeofFurniture] [varchar](50) NOT NULL,
	[width] [decimal](10, 2) NOT NULL,
	[length] [decimal](10, 2) NULL,
	[weight] [decimal](10, 2) NULL,
	[imageOfFurniture] [varbinary](max) NULL,
	[price] [decimal](10, 2) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Furniture_Of_Products]    Script Date: 04.02.2021 20:32:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Furniture_Of_Products](
	[idCodeOfFurniture] [int] NOT NULL,
	[idCodeOfProduct] [int] NOT NULL,
	[location] [varchar](50) NOT NULL,
	[wigth] [decimal](10, 2) NULL,
	[length] [decimal](10, 2) NULL,
	[angleOfRotation] [decimal](10, 2) NULL,
	[amount] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ordered_products]    Script Date: 04.02.2021 20:32:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ordered_products](
	[idOrders] [int] NOT NULL,
	[idCode] [int] NOT NULL,
	[count] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 04.02.2021 20:32:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[idOrder] [int] NOT NULL,
	[dateOrder] [datetime] NOT NULL,
	[stageOfExecute] [varchar](30) NOT NULL,
	[customers] [varchar](50) NOT NULL,
	[manager] [varchar](50) NULL,
	[price] [decimal](10, 2) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[idOrder] ASC,
	[dateOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 04.02.2021 20:32:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[idCode] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[width] [decimal](10, 2) NOT NULL,
	[length] [decimal](10, 2) NOT NULL,
	[image] [varbinary](max) NULL,
	[commet] [varchar](300) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[idCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Storage_Of_Cloth]    Script Date: 04.02.2021 20:32:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Storage_Of_Cloth](
	[idRoll] [int] NOT NULL,
	[idCodeOfCloth] [int] NOT NULL,
	[width] [decimal](10, 2) NOT NULL,
	[length] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Storage_Of_Cloth] PRIMARY KEY CLUSTERED 
(
	[idRoll] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Storage_Of_Furniture]    Script Date: 04.02.2021 20:32:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Storage_Of_Furniture](
	[idCodeBatch] [int] NOT NULL,
	[idCodeOfFurniture] [int] NULL,
	[amount] [int] NULL,
 CONSTRAINT [PK_Storage_Of_Furniture] PRIMARY KEY CLUSTERED 
(
	[idCodeBatch] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 04.02.2021 20:32:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[login] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[role] [varchar](50) NOT NULL,
	[nameUser] [varchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[login] ASC,
	[password] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [garmet_factory] SET  READ_WRITE 
GO
