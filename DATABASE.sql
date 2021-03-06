USE [master]
GO
/****** Object:  Database [Doanweb]    Script Date: 12/12/2021 2:56:18 PM ******/
CREATE DATABASE [Doanweb] ON  PRIMARY 
( NAME = N'Doanweb', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\Doanweb.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Doanweb_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\Doanweb_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Doanweb] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Doanweb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Doanweb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Doanweb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Doanweb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Doanweb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Doanweb] SET ARITHABORT OFF 
GO
ALTER DATABASE [Doanweb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Doanweb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Doanweb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Doanweb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Doanweb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Doanweb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Doanweb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Doanweb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Doanweb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Doanweb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Doanweb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Doanweb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Doanweb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Doanweb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Doanweb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Doanweb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Doanweb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Doanweb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Doanweb] SET  MULTI_USER 
GO
ALTER DATABASE [Doanweb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Doanweb] SET DB_CHAINING OFF 
GO
USE [Doanweb]
GO
/****** Object:  User [sv]    Script Date: 12/12/2021 2:56:18 PM ******/
CREATE USER [sv] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[CTHoaDon]    Script Date: 12/12/2021 2:56:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTHoaDon](
	[MaCTHD] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[MaSP] [int] NULL,
	[MaHD] [int] NULL,
	[SoLuong] [int] NULL,
	[MaKH] [int] NOT NULL,
	[TrangThai] [nvarchar](50) NULL,
	[SoTien] [money] NULL,
	[Ngay] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaCTHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 12/12/2021 2:56:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Ngay] [date] NULL,
	[TrangThai] [nvarchar](50) NULL,
	[SoTien] [money] NULL,
	[MaKH] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiSP]    Script Date: 12/12/2021 2:56:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSP](
	[MaLoaiSP] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[TenLoaiSP] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoaiSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 12/12/2021 2:56:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[TenSP] [nvarchar](100) NULL,
	[MoTaSP] [nvarchar](1000) NULL,
	[GiaSP] [money] NULL,
	[AnhSP] [nvarchar](100) NULL,
	[NGayTaoSP] [date] NULL,
	[SoLuongSP] [int] NULL,
	[MaLoaiSP] [int] NULL,
	[HangSX] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/12/2021 2:56:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[MaKH] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](255) NULL,
	[Phanquyen] [nvarchar](10) NULL,
	[Ho] [nvarchar](50) NULL,
	[Ten] [nvarchar](50) NULL,
	[Email] [nvarchar](max) NULL,
	[SDT] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CTHoaDon] ON 

INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaSP], [MaHD], [SoLuong], [MaKH], [TrangThai], [SoTien], [Ngay]) VALUES (6, 3, 6, 1, 2, N'1', 599000.0000, CAST(N'2021-12-12' AS Date))
SET IDENTITY_INSERT [dbo].[CTHoaDon] OFF
GO
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([MaHD], [Ngay], [TrangThai], [SoTien], [MaKH]) VALUES (6, CAST(N'2021-12-12' AS Date), N'Completed', 599000.0000, 2)
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiSP] ON 

INSERT [dbo].[LoaiSP] ([MaLoaiSP], [TenLoaiSP]) VALUES (1, N'Đồng hồ nam')
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [TenLoaiSP]) VALUES (2, N'Đồng hồ nữ')
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [TenLoaiSP]) VALUES (3, N'Đồng hồ trẻ em')
SET IDENTITY_INSERT [dbo].[LoaiSP] OFF
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NGayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX]) VALUES (2, N'skmei SK 1438 Trẻ em', N'Mẫu mới
đẹp', 499000.0000, N'images/sk-1240-hong-dam-1-1-600x600.jpg', CAST(N'2021-12-12' AS Date), 5, 3, N'Smile Kid')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NGayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX]) VALUES (3, N'orient 38mm KB005 Nữ', N'Mẫu mã thời thượng', 599000.0000, N'images/orient-ra-kb0005e00b-nu-1-600x600.jpg', CAST(N'2021-12-12' AS Date), 10, 2, N'orient')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NGayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX]) VALUES (4, N'Elio 39mm Nam ES064', N'Mẫu mã thời thượng', 699000.0000, N'images/elio-el016-01-nam-ava-600x600.jpg', CAST(N'2021-12-12' AS Date), 3, 1, N'elio')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NGayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX]) VALUES (5, N'Titan 27mm Nữ', N'', 960000.0000, N'images/titan-2565sm02-nu-bac-thum-600x600.jpg', CAST(N'2021-12-12' AS Date), 9, 2, N'Tian')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NGayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX]) VALUES (6, N'Smile Kid 48 mm Trẻ em SL068-02', N'Mẫu mã thời thượng', 474000.0000, N'images/smile-kid-sl069-01-tre-em-2-org.jpg', CAST(N'2021-12-12' AS Date), 6, 3, N'Smile Kid')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NGayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX]) VALUES (7, N'Nakzen sl4072gbn nam', N'Mẫu mã đẹp', 960000.0000, N'images/nakzen-sl4072gbn-7nr-nam-thum-600x600.jpg', CAST(N'2021-12-12' AS Date), 10, 1, N'Nakzen')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NGayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX]) VALUES (8, N'Ice 36 mm Nữ', N'Đồng hồ nữ thời trang', 699000.0000, N'images/ice-ice014427-xanh-duong-600x600.jpg', CAST(N'2021-12-12' AS Date), 3, 2, N'Ice')
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([MaKH], [Username], [Password], [Phanquyen], [Ho], [Ten], [Email], [SDT]) VALUES (0, N'admin', N'$2a$12$rsTYAhTtqFCI3rvvW7lsKOSnQllnSuJ2rSePsKdgVdmR3o7RkO5LW', N'admin', N'Phạm', N'Anh', N'sf1iPc3SC4PUZ5/FsYxXl4djBnaVYF08HTW4DAndrOk=', N'0987655664')
INSERT [dbo].[Users] ([MaKH], [Username], [Password], [Phanquyen], [Ho], [Ten], [Email], [SDT]) VALUES (2, N'user2', N'$2a$12$BzKVo8D3P5.ifUqnyz8AeuhzNnjiGy.zC.6QTD.1nYCYbvnWxSW.a', N'user', N'Tran Bao', N'Toan', N'4mxyX6i8ORJzyqCGC38ryE6rLuKejbLn2S2kZLNp5HM=', N'0987655664')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[CTHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_CTHoaDon_HoaDon] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
GO
ALTER TABLE [dbo].[CTHoaDon] CHECK CONSTRAINT [FK_CTHoaDon_HoaDon]
GO
ALTER TABLE [dbo].[CTHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_CTHoaDon_LoaiSP] FOREIGN KEY([MaSP])
REFERENCES [dbo].[LoaiSP] ([MaLoaiSP])
GO
ALTER TABLE [dbo].[CTHoaDon] CHECK CONSTRAINT [FK_CTHoaDon_LoaiSP]
GO
ALTER TABLE [dbo].[CTHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_CTHoaDon_Users] FOREIGN KEY([MaKH])
REFERENCES [dbo].[Users] ([MaKH])
GO
ALTER TABLE [dbo].[CTHoaDon] CHECK CONSTRAINT [FK_CTHoaDon_Users]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_Users] FOREIGN KEY([MaKH])
REFERENCES [dbo].[Users] ([MaKH])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_Users]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_LoaiSP] FOREIGN KEY([MaLoaiSP])
REFERENCES [dbo].[LoaiSP] ([MaLoaiSP])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_LoaiSP]
GO
/****** Object:  StoredProcedure [dbo].[SP_INS_NHANVIEN]    Script Date: 12/12/2021 2:56:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_INS_NHANVIEN]
    @Username nvarchar(50) ,
	@Password nvarchar(255) ,
	@Phanquyen nvarchar(10) ,
	@Ho nvarchar(50) ,
	@Ten nvarchar(50) ,
	@Email nvarchar(max) ,
	@SDT nvarchar(max) 

 AS
 BEGIN
 OPEN SYMMETRIC KEY MAHOA   
    DECRYPTION BY  PASSWORD = 'N18DCAT076';
 INSERT INTO Users VALUES
 (@Username,@Password, @Phanquyen,@Ho,@Ten,ENCRYPTBYKEY(Key_GUID('MAHOA'), @Email),ENCRYPTBYKEY(Key_GUID('MAHOA'), @SDT))
 CLOSE SYMMETRIC KEY MAHOA;
 END
GO
/****** Object:  StoredProcedure [dbo].[SP_SEL_NHANVIEN]    Script Date: 12/12/2021 2:56:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROC [dbo].[SP_SEL_NHANVIEN]
 AS
 BEGIN
 OPEN SYMMETRIC KEY MAHOA   
 DECRYPTION BY  PASSWORD = 'N18DCAT076';
 SELECT MaKH, Username, Password,Phanquyen,Ho,Ten,CONVERT(nvarchar(MAX), DECRYPTBYKEY(Email)) AS email,CONVERT(nvarchar(MAX), DECRYPTBYKEY(SDT)) AS sdt
 FROM Users
 CLOSE SYMMETRIC KEY MAHOA;
 END
GO
USE [master]
GO
ALTER DATABASE [Doanweb] SET  READ_WRITE 
GO
