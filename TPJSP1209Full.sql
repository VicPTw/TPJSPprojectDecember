USE [master]
GO
/****** Object:  Database [TPJSP]    Script Date: 2018/12/9 上午 02:47:32 ******/
CREATE DATABASE [TPJSP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TPJSP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DB\TPJSP.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TPJSP_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DB\TPJSP_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TPJSP] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TPJSP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TPJSP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TPJSP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TPJSP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TPJSP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TPJSP] SET ARITHABORT OFF 
GO
ALTER DATABASE [TPJSP] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TPJSP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TPJSP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TPJSP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TPJSP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TPJSP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TPJSP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TPJSP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TPJSP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TPJSP] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TPJSP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TPJSP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TPJSP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TPJSP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TPJSP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TPJSP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TPJSP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TPJSP] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TPJSP] SET  MULTI_USER 
GO
ALTER DATABASE [TPJSP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TPJSP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TPJSP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TPJSP] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TPJSP] SET DELAYED_DURABILITY = DISABLED 
GO
USE [TPJSP]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 2018/12/9 上午 02:47:32 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[user_id] [nvarchar](50) NOT NULL,
	[user_pass] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MainPage]    Script Date: 2018/12/9 上午 02:47:32 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[MainPage](
	[MainTitle] [nvarchar](50) NOT NULL,
	[MainImg] [nvarchar](max) NULL,
	[MainContent] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Partner]    Script Date: 2018/12/9 上午 02:47:32 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partner](
	[P_id] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [DF_Partner_P_id]  DEFAULT (newid()),
	[P_Title] [nvarchar](50) NULL,
	[P_Img] [nvarchar](max) NULL,
	[P_Content] [nvarchar](max) NULL,
	[P_Link] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Service]    Script Date: 2018/12/9 上午 02:47:32 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[S_id] [nvarchar](20) NOT NULL,
	[S_Title] [nvarchar](50) NULL,
	[S_Content] [nvarchar](max) NULL,
	[S_Img] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubService]    Script Date: 2018/12/9 上午 02:47:32 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubService](
	[Sb_id] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [DF_SubService_Sb_id]  DEFAULT (newid()),
	[Sb_Img] [nvarchar](max) NULL,
	[Sb_Title] [nvarchar](100) NULL,
	[Sb_Content] [nvarchar](max) NULL,
	[S_id] [nvarchar](20) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[Admin] ([user_id], [user_pass]) VALUES (N'admin001', N'admin001')
INSERT [dbo].[MainPage] ([MainTitle], [MainImg], [MainContent]) VALUES (N'header', NULL, N'TAIWAN IMMIGRATION & RELOCATION CO.LTD

Professional Trustworthy Honest ')
INSERT [dbo].[MainPage] ([MainTitle], [MainImg], [MainContent]) VALUES (N'banner', N'taipei-taiwan-2057818_1920.jpg"', N'WELCOMES TO TAIWAN
Your Total Supoort Immigration & Relacation Soultions')
INSERT [dbo].[MainPage] ([MainTitle], [MainImg], [MainContent]) VALUES (N'about', NULL, N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Possimus minus minima impedit, modi, magni unde ratione tempora deleniti quas ullam maxime, quisquam in quibusdam! Tenetur distinctio, deserunt officia saepe sit. ipsum dolor sit amet, consectetur adipisicing elit. Culpa sit soluta eligendi ullam facilis quam molestias nemo fuga perspiciatis quasi, hic esse odit assumenda non rem ex, voluptatibus optio perferendis. ipsum dolor sit amet, consectetur adipisicing elit. Tenetur vero saepe, nihil unde tempora, quae ducimus nesciunt hic voluptates accusantium fuga ut architecto eligendi! Nam natus officia eos ipsam velit.

Taiwan Immigration & Relacation CO(TIRC) provide')
INSERT [dbo].[MainPage] ([MainTitle], [MainImg], [MainContent]) VALUES (N'service', NULL, NULL)
INSERT [dbo].[MainPage] ([MainTitle], [MainImg], [MainContent]) VALUES (N'content4', N'night-market-1714683_1280.jpg', NULL)
INSERT [dbo].[MainPage] ([MainTitle], [MainImg], [MainContent]) VALUES (N'cbrief', NULL, N'COUNTRY BRIEF

Taiwan''s population currently numbers over 21milion. Which makes ths island one of the worlds''s most densely populated places. Except for approximately 325,000 aborigines, the people of Taiwan originate from the Chinese mainland.

Famed for centuries as Ilha Formosa (Beautiful Island),this is a land with more faces than the 11-headed Guanyin.Towering. Towering sea cliffs,marble-walled gorges and tropical forests are just the start of your journey, which could take you as far as Yushan, Taiwan''s 3952m alpine roof.

In Taiwan you can criss-cross mountains on colonial-era hiking trails or cycle alone highway with the blue Placific on one side and green volcanic arcs on the other. And if you Simply want a classic landscape to enjoy, you will find them around every corner.')
INSERT [dbo].[MainPage] ([MainTitle], [MainImg], [MainContent]) VALUES (N'OUR PARTNERS & MEMBERSHIPS', NULL, NULL)
INSERT [dbo].[MainPage] ([MainTitle], [MainImg], [MainContent]) VALUES (N'contact', NULL, N'CONTACT　US')
INSERT [dbo].[MainPage] ([MainTitle], [MainImg], [MainContent]) VALUES (N'footer', NULL, N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt omnis vero itaque distinctio. Tempore neque id, fugiat fuga magnam blanditiis labore aperiam ipsa suscipit. Maxime explicabo necessitatibus, provident corporis inventore.')
INSERT [dbo].[Partner] ([P_id], [P_Title], [P_Img], [P_Content], [P_Link]) VALUES (N'd9b0c410-469d-4739-bf8c-c12c5b63d59d', N'PEREGRINE IMMIGRATION', N'img/partner2.JPG', N'Website description...
 Website description...Website description...Website description...
 Website description...Website description...Website description...Website description...Website description...', N'https://www.google.com.tw')
INSERT [dbo].[Partner] ([P_id], [P_Title], [P_Img], [P_Content], [P_Link]) VALUES (N'bdbb96f2-250c-425c-9423-1e19772b5da4', N'EURA MEMBER', N'img/partner1.JPG', N'Website description...
 Website description...Website description...Website description...
 Website description...Website description...Website description...Website description...Website description...', N'https://www.google.com.tw')
INSERT [dbo].[Partner] ([P_id], [P_Title], [P_Img], [P_Content], [P_Link]) VALUES (N'4c1b1ef7-02cb-4bae-a75f-5b17ca225d6e', N'PEREGRINE IMMIGRATION', N'img/partner2.JPG', N'Website description...
 Website description...Website description...Website description...
 Website description...Website description...Website description...Website description...Website description...', N'https://www.google.com.tw')
INSERT [dbo].[Partner] ([P_id], [P_Title], [P_Img], [P_Content], [P_Link]) VALUES (N'a6564787-0b13-4896-9caa-ff83e01b7361', N'EURA MEMBER', N'img/partner1.JPG', N'Website description...
 Website description...Website description...Website description...
 Website description...Website description...Website description...Website description...Website description...', N'https://www.google.com.tw')
INSERT [dbo].[Service] ([S_id], [S_Title], [S_Content], [S_Img]) VALUES (N's01', N'VISA/IMMIGRATION', NULL, N'img/visa.jpg')
INSERT [dbo].[Service] ([S_id], [S_Title], [S_Content], [S_Img]) VALUES (N's02', N'RELOCATION SERVICES ', NULL, N'img/relocation.jpg')
INSERT [dbo].[Service] ([S_id], [S_Title], [S_Content], [S_Img]) VALUES (N's03', N'HOME FINDING ', NULL, N'img/home.jpg')
INSERT [dbo].[SubService] ([Sb_id], [Sb_Img], [Sb_Title], [Sb_Content], [S_id]) VALUES (N'a42b5c33-6480-4262-a596-07ce3eb0966e', N'../img/Temp.jpeg', N'Work Permt', N'Temp words...
  Temp wordsTemp words...
  Temp wordsTemp wordsTemp words...', N's01')
INSERT [dbo].[SubService] ([Sb_id], [Sb_Img], [Sb_Title], [Sb_Content], [S_id]) VALUES (N'bd1a4907-1e2c-4ea7-812d-fb769dbdbc0f', N'../img/Temp.jpeg', N'Resident Visa', N'Temp words...
  Temp wordsTemp words...
  Temp wordsTemp wordsTemp words...', N's01')
INSERT [dbo].[SubService] ([Sb_id], [Sb_Img], [Sb_Title], [Sb_Content], [S_id]) VALUES (N'3086a908-7f41-4ac4-9aa4-529c6953ed19', N'../img/Temp.jpeg', N'ARC ', N'Temp words...
  Temp wordsTemp words...
  Temp wordsTemp wordsTemp words...', N's01')
INSERT [dbo].[SubService] ([Sb_id], [Sb_Img], [Sb_Title], [Sb_Content], [S_id]) VALUES (N'd6be52b7-91e6-4362-aeca-5fbdfc4a03ac', N'../img/Temp.jpeg', N'Pre-move Orientation ', N'Temp words...
  Temp wordsTemp words...
  Temp wordsTemp wordsTemp words...', N's02')
INSERT [dbo].[SubService] ([Sb_id], [Sb_Img], [Sb_Title], [Sb_Content], [S_id]) VALUES (N'f760fb23-9f6a-44d5-baff-c2afbac4dfda', N'../img/Temp.jpeg', N'School Search ', N'Temp words...
  Temp wordsTemp words...
  Temp wordsTemp wordsTemp words...', N's02')
INSERT [dbo].[SubService] ([Sb_id], [Sb_Img], [Sb_Title], [Sb_Content], [S_id]) VALUES (N'63943ef8-95c9-4735-87df-3cfd3a94b470', N'../img/Temp.jpeg', N'Car Rental ', N'Temp words...
  Temp wordsTemp words...
  Temp wordsTemp wordsTemp words...', N's02')
INSERT [dbo].[SubService] ([Sb_id], [Sb_Img], [Sb_Title], [Sb_Content], [S_id]) VALUES (N'5996d52a-2f8a-4fbd-960b-089206fca9d2', N'../img/Temp.jpeg', N'Driving Licence Exchange', N'Temp words...
  Temp wordsTemp words...
  Temp wordsTemp wordsTemp words...', N's02')
INSERT [dbo].[SubService] ([Sb_id], [Sb_Img], [Sb_Title], [Sb_Content], [S_id]) VALUES (N'ded18030-bf9f-4de9-8b80-95e24762336a', N'../img/Temp.jpeg', N'Furniture Purchase ', N'Temp words...
  Temp wordsTemp words...
  Temp wordsTemp wordsTemp words...', N's02')
INSERT [dbo].[SubService] ([Sb_id], [Sb_Img], [Sb_Title], [Sb_Content], [S_id]) VALUES (N'06fd1e4b-5bb7-4f0d-8ec0-7d917d272dd1', N'../img/Temp.jpeg', N'Intercultural Training', N'Temp words...
  Temp wordsTemp words...
  Temp wordsTemp wordsTemp words...', N's02')
INSERT [dbo].[SubService] ([Sb_id], [Sb_Img], [Sb_Title], [Sb_Content], [S_id]) VALUES (N'32359c7f-ae9b-4626-b305-5e81d3af464b', N'../img/Temp.jpeg', N'Temporary Accommodation', N'Temp words...
  Temp wordsTemp words...
  Temp wordsTemp wordsTemp words...', N's02')
INSERT [dbo].[SubService] ([Sb_id], [Sb_Img], [Sb_Title], [Sb_Content], [S_id]) VALUES (N'2daf5841-5976-456a-843e-8ec880a111cd', N'../img/Temp.jpeg', N'Ongoing Support', N'Temp words...
  Temp wordsTemp words...
  Temp wordsTemp wordsTemp words...', N's02')
INSERT [dbo].[SubService] ([Sb_id], [Sb_Img], [Sb_Title], [Sb_Content], [S_id]) VALUES (N'efaddd49-c2ba-4411-bc05-9a7385925522', N'../img/Temp.jpeg', N'Settling In', N'Temp words...
  Temp wordsTemp words...
  Temp wordsTemp wordsTemp words...', N's03')
INSERT [dbo].[SubService] ([Sb_id], [Sb_Img], [Sb_Title], [Sb_Content], [S_id]) VALUES (N'58967f2d-72ea-4b7a-b40a-17b122e788ab', N'../img/Temp.jpeg', N'Departure Service', N'Temp words...
  Temp wordsTemp words...
  Temp wordsTemp wordsTemp words...', N's03')
INSERT [dbo].[SubService] ([Sb_id], [Sb_Img], [Sb_Title], [Sb_Content], [S_id]) VALUES (N'9ce10c7d-2d26-4937-90c0-b22e15ee3cf6', N'../img/Temp.jpeg', N'Short-term Rental', N'Temp words...
  Temp wordsTemp words...
  Temp wordsTemp wordsTemp words...', N's03')
INSERT [dbo].[SubService] ([Sb_id], [Sb_Img], [Sb_Title], [Sb_Content], [S_id]) VALUES (N'542e624f-c446-4d8b-982a-55e54295853d', N'../img/Temp.jpeg', N'Tenancy Management', N'Temp words...
  Temp wordsTemp words...
  Temp wordsTemp wordsTemp words...', N's03')
INSERT [dbo].[SubService] ([Sb_id], [Sb_Img], [Sb_Title], [Sb_Content], [S_id]) VALUES (N'9136db91-c166-4ed5-9fb3-0ebaaeb35c1e', N'../img/Temp.jpeg', N'Real Estate Management', N'Temp words...
  Temp wordsTemp words...
  Temp wordsTemp wordsTemp words...', N's03')
SET ANSI_PADDING ON

GO
/****** Object:  Index [XPKuser]    Script Date: 2018/12/9 上午 02:47:32 ******/
ALTER TABLE [dbo].[Admin] ADD  CONSTRAINT [XPKuser] PRIMARY KEY NONCLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [XPKMainPage]    Script Date: 2018/12/9 上午 02:47:32 ******/
ALTER TABLE [dbo].[MainPage] ADD  CONSTRAINT [XPKMainPage] PRIMARY KEY NONCLUSTERED 
(
	[MainTitle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [XPKParther]    Script Date: 2018/12/9 上午 02:47:32 ******/
ALTER TABLE [dbo].[Partner] ADD  CONSTRAINT [XPKParther] PRIMARY KEY NONCLUSTERED 
(
	[P_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [XPKService]    Script Date: 2018/12/9 上午 02:47:32 ******/
ALTER TABLE [dbo].[Service] ADD  CONSTRAINT [XPKService] PRIMARY KEY NONCLUSTERED 
(
	[S_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [XPKSubServic]    Script Date: 2018/12/9 上午 02:47:32 ******/
ALTER TABLE [dbo].[SubService] ADD  CONSTRAINT [XPKSubServic] PRIMARY KEY NONCLUSTERED 
(
	[Sb_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SubService]  WITH CHECK ADD  CONSTRAINT [R_9] FOREIGN KEY([S_id])
REFERENCES [dbo].[Service] ([S_id])
GO
ALTER TABLE [dbo].[SubService] CHECK CONSTRAINT [R_9]
GO
USE [master]
GO
ALTER DATABASE [TPJSP] SET  READ_WRITE 
GO
