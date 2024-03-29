USE [master]
GO
/****** Object:  Database [CreativeBuildersDB]    Script Date: 6/19/2020 10:00:10 PM ******/
CREATE DATABASE [CreativeBuildersDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CreativeBuildersDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CreativeBuildersDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CreativeBuildersDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CreativeBuildersDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CreativeBuildersDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CreativeBuildersDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CreativeBuildersDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CreativeBuildersDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CreativeBuildersDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CreativeBuildersDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CreativeBuildersDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CreativeBuildersDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CreativeBuildersDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CreativeBuildersDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CreativeBuildersDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CreativeBuildersDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CreativeBuildersDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CreativeBuildersDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CreativeBuildersDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CreativeBuildersDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CreativeBuildersDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CreativeBuildersDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CreativeBuildersDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CreativeBuildersDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CreativeBuildersDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CreativeBuildersDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CreativeBuildersDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CreativeBuildersDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CreativeBuildersDB] SET RECOVERY FULL 
GO
ALTER DATABASE [CreativeBuildersDB] SET  MULTI_USER 
GO
ALTER DATABASE [CreativeBuildersDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CreativeBuildersDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CreativeBuildersDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CreativeBuildersDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CreativeBuildersDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CreativeBuildersDB', N'ON'
GO
ALTER DATABASE [CreativeBuildersDB] SET QUERY_STORE = OFF
GO
USE [CreativeBuildersDB]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 6/19/2020 10:00:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[SubTotal] [float] NULL,
	[Taxes] [float] NULL,
	[Total] [float] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartItem]    Script Date: 6/19/2020 10:00:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItem](
	[CartId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NULL,
	[Price] [float] NULL,
 CONSTRAINT [PK_CartItem] PRIMARY KEY CLUSTERED 
(
	[CartId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/19/2020 10:00:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 6/19/2020 10:00:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[DOB] [date] NULL,
	[Phone] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[StreetName] [nvarchar](50) NULL,
	[DistictName] [nvarchar](50) NULL,
	[Age]  AS (datediff(year,[DOB],getdate())),
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 6/19/2020 10:00:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NULL,
	[Price] [float] NULL,
 CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 6/19/2020 10:00:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[CartId] [int] NOT NULL,
	[SubTotal] [float] NULL,
	[Taxes] [float] NULL,
	[Total] [float] NULL,
	[OrderDate] [date] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 6/19/2020 10:00:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CategoryId] [int] NULL,
	[SupplierId] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 6/19/2020 10:00:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Foundation_Name] [nvarchar](255) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Commercial_Id] [nvarchar](255) NULL,
	[Location] [nvarchar](max) NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/19/2020 10:00:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[Phone] [nvarchar](50) NULL,
	[Avatar] [nvarchar](max) NULL,
	[Gender] [char](10) NULL,
	[Address] [nvarchar](max) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([CartId], [UserId], [SubTotal], [Taxes], [Total]) VALUES (1, 1, 25, 1.25, 26.25)
INSERT [dbo].[Cart] ([CartId], [UserId], [SubTotal], [Taxes], [Total]) VALUES (2, 2, NULL, NULL, NULL)
INSERT [dbo].[Cart] ([CartId], [UserId], [SubTotal], [Taxes], [Total]) VALUES (3, 1002, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
INSERT [dbo].[CartItem] ([CartId], [ProductId], [Quantity], [Price]) VALUES (1, 2, 1, 5)
INSERT [dbo].[CartItem] ([CartId], [ProductId], [Quantity], [Price]) VALUES (1, 1003, 1, 20)
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [Description]) VALUES (1, N'One Category', N'')
INSERT [dbo].[Categories] ([Id], [Name], [Description]) VALUES (2, N'Two Category', N'Some Small Description')
INSERT [dbo].[Categories] ([Id], [Name], [Description]) VALUES (42, N'Third Category', N'')
INSERT [dbo].[Categories] ([Id], [Name], [Description]) VALUES (1002, N'New Category', N'no description')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [Email], [Password], [DOB], [Phone], [City], [StreetName], [DistictName]) VALUES (1, N'Ehab', N'Ibrahim', N'ehab@ehab.com', N'000', CAST(N'1995-06-29' AS Date), N'', N'test', N'', N'')
INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [Email], [Password], [DOB], [Phone], [City], [StreetName], [DistictName]) VALUES (2, N'test', N'test', N'test@test.com', N'1234', CAST(N'2020-01-01' AS Date), N'', N'', N'', N'')
INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [Email], [Password], [DOB], [Phone], [City], [StreetName], [DistictName]) VALUES (1002, N'Abduelrahman', N'Abduallah', N'abdo@abdo.com', N'789', CAST(N'1996-06-20' AS Date), N'011', N'jeddah', N'test updated', N'test')
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
INSERT [dbo].[OrderItems] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (1002, 1, 2, 2.5)
INSERT [dbo].[OrderItems] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (1002, 2, 2, 5)
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderId], [CartId], [SubTotal], [Taxes], [Total], [OrderDate]) VALUES (1002, 3, 15, 3, 18, CAST(N'2020-06-19' AS Date))
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Quantity], [Price], [Image], [Description], [CategoryId], [SupplierId]) VALUES (1, N'One Product', 25, 2.5, N'elmoustafa.png', N'Some Few Description', 1, 1)
INSERT [dbo].[Products] ([Id], [Name], [Quantity], [Price], [Image], [Description], [CategoryId], [SupplierId]) VALUES (2, N'Two Product', 30, 5, N'logoAbeer.jpg', N'Small Desc', 2, 1)
INSERT [dbo].[Products] ([Id], [Name], [Quantity], [Price], [Image], [Description], [CategoryId], [SupplierId]) VALUES (1003, N'Third Product', 30, 20, N'diego-ph-fIq0tET6llw-unsplash.jpg', N'Small Description about Third Product', 1, 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([Id], [Foundation_Name], [Email], [Commercial_Id], [Location]) VALUES (1, N'One Foundation', N'Foundation@foundation.com', N'1235467', N'cairo')
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Name], [Email], [Password], [Phone], [Avatar], [Gender], [Address]) VALUES (1, N'admin', N'admin@admin.com', N'123', N'01228785463', N'male.jpg', N'M         ', N'saudia arabia')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Cart] ADD  CONSTRAINT [DF_Cart_SubTotal]  DEFAULT ((0.0)) FOR [SubTotal]
GO
ALTER TABLE [dbo].[Cart] ADD  CONSTRAINT [DF_Cart_Taxes]  DEFAULT ((0.0)) FOR [Taxes]
GO
ALTER TABLE [dbo].[Cart] ADD  CONSTRAINT [DF_Cart_Total]  DEFAULT ((0.0)) FOR [Total]
GO
/****** Object:  StoredProcedure [dbo].[AddItemToCart]    Script Date: 6/19/2020 10:00:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[AddItemToCart]
@CartId int,
@ProductId int,
@Quantity int,
@Price float
as
INSERT INTO [dbo].[CartItem]
           ([CartId]
           ,[ProductId]
           ,[Quantity]
           ,[Price])
     VALUES
           (@CartId,@ProductId,@Quantity,@Price)

GO
/****** Object:  StoredProcedure [dbo].[AddNewCategory]    Script Date: 6/19/2020 10:00:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AddNewCategory]
@Name nvarchar(50),
@Description nvarchar(max)
as 
INSERT INTO [dbo].[Categories]
           ([Name]
           ,[Description])
     VALUES
           (@Name
           ,@Description)

GO
/****** Object:  StoredProcedure [dbo].[AddNewProduct]    Script Date: 6/19/2020 10:00:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AddNewProduct]
@Name nvarchar(50),
@Quantity int,
@Price float,
@Image nvarchar(max),
@Description nvarchar(max),
@CategoryId int,
@SupplierId int
as
INSERT INTO [dbo].[Products]
           ([Name]
           ,[Quantity]
           ,[Price]
           ,[Image]
           ,[Description]
           ,[CategoryId]
           ,[SupplierId])
     VALUES
           (@Name,@Quantity,@Price,@Image,@Description,@CategoryId,@SupplierId)


GO
/****** Object:  StoredProcedure [dbo].[AddNewSupplier]    Script Date: 6/19/2020 10:00:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AddNewSupplier]
@Foundation_Name nvarchar(255),
@Email nvarchar(50),
@Commercial_Id nvarchar(255),
@Location nvarchar(max)
as
INSERT INTO [dbo].[Suppliers]
           ([Foundation_Name]
           ,[Email]
           ,[Commercial_Id]
           ,[Location])
     VALUES
           (@Foundation_Name,@Email,@Commercial_Id,@Location)


GO
/****** Object:  StoredProcedure [dbo].[AddOrderItems]    Script Date: 6/19/2020 10:00:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AddOrderItems]
@OrderId int,
@ProductId int,
@Quantity int,
@Price float
as
INSERT INTO [dbo].[OrderItems]
           ([OrderId]
           ,[ProductId]
           ,[Quantity]
           ,[Price])
     VALUES
           (@OrderId,@ProductId,@Quantity,@Price)

GO
/****** Object:  StoredProcedure [dbo].[AdminLogin]    Script Date: 6/19/2020 10:00:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[AdminLogin]
@Email nvarchar(255),
@Password nvarchar(255)
as
select * from users where Email=@Email and Password=@Password
GO
/****** Object:  StoredProcedure [dbo].[CheckIfItemExistsInCart]    Script Date: 6/19/2020 10:00:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CheckIfItemExistsInCart]
@CartId int,
@ProductId int
as
select * from CartItem where CartId=@CartId and ProductId=@ProductId
GO
/****** Object:  StoredProcedure [dbo].[CreateNewCart]    Script Date: 6/19/2020 10:00:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CreateNewCart]
@UserId int
as
insert into Cart (UserId) values(@UserId)
GO
/****** Object:  StoredProcedure [dbo].[CreateOrder]    Script Date: 6/19/2020 10:00:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CreateOrder]
@CartId int,
@SubTotal float,
@Taxes float,
@Total float,
@OrderDate date
as
INSERT INTO [dbo].[Orders]
           ([CartId]
           ,[SubTotal]
           ,[Taxes]
           ,[Total]
           ,[OrderDate])
     VALUES
           (@CartId,@SubTotal,@Taxes,@Total,@OrderDate)

GO
/****** Object:  StoredProcedure [dbo].[CustomerLogin]    Script Date: 6/19/2020 10:00:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CustomerLogin]
@Email nvarchar(50),
@Password nvarchar(50)
as
select * from Customers where Email=@Email and Password=@Password
GO
/****** Object:  StoredProcedure [dbo].[CustomerRegister]    Script Date: 6/19/2020 10:00:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CustomerRegister]
@FirstName nvarchar(50),
@LastName nvarchar(50),
@Email nvarchar(50),
@Password nvarchar(50),
@DOB date,
@Phone nvarchar(50),
@City nvarchar(50),
@StreetName nvarchar(50),
@DistictName nvarchar(50)
as
INSERT INTO [dbo].[Customers]
           ([FirstName]
           ,[LastName]
           ,[Email]
           ,[Password]
           ,[DOB]
           ,[Phone]
           ,[City]
           ,[StreetName]
           ,[DistictName])
     VALUES
           (@FirstName,@LastName,@Email,@Password,@DOB,@Phone,@City,@StreetName,@DistictName)

GO
/****** Object:  StoredProcedure [dbo].[DeleteCartItem]    Script Date: 6/19/2020 10:00:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DeleteCartItem]
@CartId int,
@ProductId int
as
delete from CartItem where CartId=@CartId and ProductId=@ProductId
GO
/****** Object:  StoredProcedure [dbo].[DeleteCartItems]    Script Date: 6/19/2020 10:00:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DeleteCartItems]
@CartId int
as
delete from CartItem where CartId=@CartId
GO
/****** Object:  StoredProcedure [dbo].[DeleteCategory]    Script Date: 6/19/2020 10:00:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DeleteCategory]
@Id int
as 
Delete from [dbo].[Categories] 
 WHERE Id=@Id


GO
/****** Object:  StoredProcedure [dbo].[DeleteOrder]    Script Date: 6/19/2020 10:00:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DeleteOrder]
@OrderId int
as
delete from Orders where OrderId=@OrderId
GO
/****** Object:  StoredProcedure [dbo].[DeleteOrderItems]    Script Date: 6/19/2020 10:00:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DeleteOrderItems]
@OrderId int
as
delete from OrderItems where OrderId=@OrderId
GO
/****** Object:  StoredProcedure [dbo].[DeleteProduct]    Script Date: 6/19/2020 10:00:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DeleteProduct]
@Id int 
as delete from Products
where Products.Id=@Id
GO
/****** Object:  StoredProcedure [dbo].[DeleteSupplier]    Script Date: 6/19/2020 10:00:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DeleteSupplier]
@Id int
as
Delete from Suppliers
 WHERE Id=@Id




GO
/****** Object:  StoredProcedure [dbo].[getAllCategories]    Script Date: 6/19/2020 10:00:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getAllCategories]
as 
select * from Categories

GO
/****** Object:  StoredProcedure [dbo].[getAllOrders]    Script Date: 6/19/2020 10:00:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getAllOrders]
as
select * from Orders
GO
/****** Object:  StoredProcedure [dbo].[getAllProducts]    Script Date: 6/19/2020 10:00:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getAllProducts]
as
select * from Products



GO
/****** Object:  StoredProcedure [dbo].[getAllSuppliers]    Script Date: 6/19/2020 10:00:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getAllSuppliers]
as
select * from Suppliers
GO
/****** Object:  StoredProcedure [dbo].[getAllUsers]    Script Date: 6/19/2020 10:00:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getAllUsers]
as 
select * from Customers
GO
/****** Object:  StoredProcedure [dbo].[getCartItems]    Script Date: 6/19/2020 10:00:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getCartItems]
@CartId int
as
select p.Image,p.Id,p.Name,p.Price,p.Quantity as "stock",ci.Quantity,p.Price*ci.Quantity as "TotalPrice"
from CartItem ci , Products p
where ci.ProductId=p.Id
and ci.CartId=@CartId
GO
/****** Object:  StoredProcedure [dbo].[getCartItemsCount]    Script Date: 6/19/2020 10:00:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getCartItemsCount]
@CartId int
as
select * from CartItem where CartId=@CartId
GO
/****** Object:  StoredProcedure [dbo].[getcustomeraccountdata]    Script Date: 6/19/2020 10:00:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getcustomeraccountdata]
@Id int
as 
select * from Customers where Id=@Id
GO
/****** Object:  StoredProcedure [dbo].[getCustomerCartId]    Script Date: 6/19/2020 10:00:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getCustomerCartId]
@UserId int
as
select CartId from Cart where UserId = @UserId
GO
/****** Object:  StoredProcedure [dbo].[getLatestCustomerId]    Script Date: 6/19/2020 10:00:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getLatestCustomerId]
as 
select top(1) * from customers order by Id desc
GO
/****** Object:  StoredProcedure [dbo].[getLatestOrderId]    Script Date: 6/19/2020 10:00:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getLatestOrderId]
as 
select top(1) * from Orders order by OrderId desc
GO
/****** Object:  StoredProcedure [dbo].[getOrdereExtraInfo]    Script Date: 6/19/2020 10:00:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getOrdereExtraInfo]
@CartId int,
@UserId int
as
select * from Cart where CartId=@CartId and UserId=@UserId
GO
/****** Object:  StoredProcedure [dbo].[getOrdersWithCustomerName]    Script Date: 6/19/2020 10:00:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getOrdersWithCustomerName]
as
select o.*,CONCAT(cs.FirstName,' ',cs.LastName) as "FullName" 
from Orders o,Cart c , Customers cs
where o.CartId=c.CartId
and c.UserId=cs.Id
GO
/****** Object:  StoredProcedure [dbo].[getProductPrice]    Script Date: 6/19/2020 10:00:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getProductPrice]
@Id int
as
select Price from products where Id=@Id
GO
/****** Object:  StoredProcedure [dbo].[getRelatedProduct]    Script Date: 6/19/2020 10:00:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getRelatedProduct]
@CategoryId int,
@Id int
as
select top(4) * from products where CategoryId=@CategoryId
and Id<>@Id
GO
/****** Object:  StoredProcedure [dbo].[getSingleCategory]    Script Date: 6/19/2020 10:00:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getSingleCategory]
@Id int
as 
select * from [dbo].[Categories] 
 WHERE Id=@Id


GO
/****** Object:  StoredProcedure [dbo].[getSingleOrder]    Script Date: 6/19/2020 10:00:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getSingleOrder]
@OrderId int
as
select o.*,CONCAT(cs.FirstName,' ',cs.LastName) as "FullName",cs.Email ,i.*,p.Name
from Orders o,Cart c , Customers cs,OrderItems i,Products p
where o.OrderId=i.OrderId 
and i.ProductId=p.Id
and o.CartId=c.CartId
and c.UserId=cs.Id
and o.OrderId=@OrderId
GO
/****** Object:  StoredProcedure [dbo].[getSingleProduct]    Script Date: 6/19/2020 10:00:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getSingleProduct]
@Id int 
as select products.*,Categories.Name as CatName from Products inner join Categories on   Categories.Id = Products.CategoryId
where Products.Id=@Id
GO
/****** Object:  StoredProcedure [dbo].[getSingleSupplier]    Script Date: 6/19/2020 10:00:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getSingleSupplier]
@Id int
as
select * from Suppliers where Id=@Id
GO
/****** Object:  StoredProcedure [dbo].[getSingleUser]    Script Date: 6/19/2020 10:00:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getSingleUser]
@Id int
as 
select * from Users where Id=@Id
GO
/****** Object:  StoredProcedure [dbo].[getTop12Products]    Script Date: 6/19/2020 10:00:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getTop12Products]
as
select top(12) * from Products
order by Id desc
GO
/****** Object:  StoredProcedure [dbo].[ProceedToCheckout]    Script Date: 6/19/2020 10:00:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ProceedToCheckout]
@CartId int,
@SubTotal float,
@Taxes float,
@Total float
as
UPDATE [dbo].[Cart]
   SET [SubTotal] = @SubTotal
      ,[Taxes] = @Taxes
      ,[Total] = @Total
 WHERE CartId=@CartId
GO
/****** Object:  StoredProcedure [dbo].[UpdateCard]    Script Date: 6/19/2020 10:00:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdateCard]
@CartId int
as
UPDATE [dbo].[Cart]
   SET [SubTotal] = 0.0
      ,[Taxes] = 0.0
      ,[Total] = 0.0
 WHERE CartId=@CartId



GO
/****** Object:  StoredProcedure [dbo].[UpdateCategory]    Script Date: 6/19/2020 10:00:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdateCategory]
@Id int,
@Name nvarchar(50),
@Description nvarchar(max)
as 
UPDATE [dbo].[Categories]
   SET [Name] = @Name
      ,[Description] = @Description
 WHERE Id=@Id


GO
/****** Object:  StoredProcedure [dbo].[UpdateCustomerAccountdata]    Script Date: 6/19/2020 10:00:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdateCustomerAccountdata]
@Id int,
@FirstName nvarchar(50),
@LastName nvarchar(50),
@Email nvarchar(50),
@DOB date,
@Phone nvarchar(50),
@City nvarchar(50),
@StreetName nvarchar(50),
@DistictName nvarchar(50)
as
UPDATE [dbo].[Customers]
           set  [FirstName] =@FirstName
           ,[LastName]=@LastName
           ,[Email]=@Email
         
           ,[DOB]=@DOB
           ,[Phone]=@Phone
           ,[City]=@City
           ,[StreetName]=@StreetName
           ,[DistictName]=@DistictName
where Id=@Id
GO
/****** Object:  StoredProcedure [dbo].[UpdateCustomerPassword]    Script Date: 6/19/2020 10:00:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdateCustomerPassword]
@Id int,
@Password nvarchar(50)
as 
UPDATE [dbo].[Customers]
   SET Password=@Password
 WHERE Id=@Id
GO
/****** Object:  StoredProcedure [dbo].[UpdateItemInCart]    Script Date: 6/19/2020 10:00:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdateItemInCart]
@CartId int,
@ProductId int,
@Quantity int,
@Price float
as
UPDATE [dbo].[CartItem]
   SET [Quantity] = @Quantity
      ,[Price] = @Price
 WHERE CartId=@CartId and ProductId=@ProductId





GO
/****** Object:  StoredProcedure [dbo].[UpdateProduct]    Script Date: 6/19/2020 10:00:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdateProduct]
@Name nvarchar(50),
@Quantity int,
@Price float,
@Image nvarchar(max),
@Description nvarchar(max),
@CategoryId int,
@SupplierId int,
@Id int
as
UPDATE [dbo].[Products]
   SET [Name] = @Name
      ,[Quantity] = @Quantity
      ,[Price] = @Price
      ,[Image] = @Image
      ,[Description] = @Description
      ,[CategoryId] = @CategoryId
      ,[SupplierId] = @SupplierId
 WHERE Id=@Id




GO
/****** Object:  StoredProcedure [dbo].[UpdateSupplier]    Script Date: 6/19/2020 10:00:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdateSupplier]
@Foundation_Name nvarchar(255),
@Email nvarchar(50),
@Commercial_Id nvarchar(255),
@Location nvarchar(max),
@Id int
as
UPDATE [dbo].[Suppliers]
   SET [Foundation_Name] = @Foundation_Name
      ,[Email] = @Email
      ,[Commercial_Id] = @Commercial_Id
      ,[Location] = @Location
 WHERE Id=@Id




GO
/****** Object:  StoredProcedure [dbo].[UpdateUserPassword]    Script Date: 6/19/2020 10:00:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdateUserPassword]
@Id int,
@Password nvarchar(255)
as 
UPDATE [dbo].[Users]
   SET Password=@Password
 WHERE Id=@Id
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserProfile]    Script Date: 6/19/2020 10:00:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdateUserProfile]
@Id int,
@Name nvarchar(255),
@Email nvarchar(255),
@Phone nvarchar(50),
@Avatar nvarchar(max),
@Gender char(10),
@Address nvarchar(max)
as 
UPDATE [dbo].[Users]
   SET [Name] = @Name
      ,[Email] = @Email
      ,[Phone] = @Phone
      ,[Avatar] =@Avatar
      ,[Gender] = @Gender
      ,[Address] = @Address
 WHERE Id=@Id
GO
USE [master]
GO
ALTER DATABASE [CreativeBuildersDB] SET  READ_WRITE 
GO
