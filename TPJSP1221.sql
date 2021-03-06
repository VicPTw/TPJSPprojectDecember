USE [master]
GO
/****** Object:  Database [TPJSP]    Script Date: 2018/12/21 上午 08:48:33 ******/
CREATE DATABASE [TPJSP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TPJSP', FILENAME = N'C:\DB\TPJSP.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TPJSP_log', FILENAME = N'C:\DB\TPJSP_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
ALTER DATABASE [TPJSP] SET AUTO_CREATE_STATISTICS ON 
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
USE [TPJSP]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 2018/12/21 上午 08:48:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[user_id] [nvarchar](50) NOT NULL,
	[user_pass] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MainPage]    Script Date: 2018/12/21 上午 08:48:33 ******/
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
/****** Object:  Table [dbo].[Partner]    Script Date: 2018/12/21 上午 08:48:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partner](
	[P_id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[P_Title] [nvarchar](50) NULL,
	[P_Img] [nvarchar](max) NULL,
	[P_Content] [nvarchar](max) NULL,
	[P_Link] [nvarchar](max) NULL,
	[P_Date] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Service]    Script Date: 2018/12/21 上午 08:48:33 ******/
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
/****** Object:  Table [dbo].[SubService]    Script Date: 2018/12/21 上午 08:48:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubService](
	[Sb_id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Sb_Img] [nvarchar](max) NULL,
	[Sb_Title] [nvarchar](100) NULL,
	[Sb_Content] [nvarchar](max) NULL,
	[S_id] [nvarchar](20) NULL,
	[Sb_Date] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[Admin] ([user_id], [user_pass]) VALUES (N'admin001', N'admin001')
INSERT [dbo].[MainPage] ([MainTitle], [MainImg], [MainContent]) VALUES (N'header', NULL, N'TAIWAN IMMIGRATION & RELOCATION CO.LTD

Professional Trustworthy Honest ')
INSERT [dbo].[MainPage] ([MainTitle], [MainImg], [MainContent]) VALUES (N'banner', N'img/banner.jpg', N'WELCOMES TO TAIWAN<br>Your Total Supoort Immigration &amp;Relacation Soultions')
INSERT [dbo].[MainPage] ([MainTitle], [MainImg], [MainContent]) VALUES (N'about', NULL, N'Taiwan Immigration &amp; Relocation Company was established in 2010. Our team provides services to help employee from International Company to adapting the living and culture in Taiwan.<br><br>If you have foreign employee are moving to Taiwan to work, we can support all the relocation solutions. We also help foreign professionals and their family to get familiar with life in Taiwan.')
INSERT [dbo].[MainPage] ([MainTitle], [MainImg], [MainContent]) VALUES (N'service', NULL, NULL)
INSERT [dbo].[MainPage] ([MainTitle], [MainImg], [MainContent]) VALUES (N'cbrief', N'img/CountryBrief2.jpg', N'Taiwan&apos;s population currently numbers over 21 million. Which makes the island one of the worlds&apos;s most densely populated places. Famed for centuries as Ilha Formosa (Beautiful Island), this is a land with more faces. In Taiwan you can criss-cross mountains on hiking trails or cycle alone highway with the blue Placific on one side and green volcanic arcs on the other. And if you simply want a classic landscape to enjoy, you will find them around every corner.<br><br>Life in Taiwan is so convenient, You can find convenience stores everywhere, even in the remote mountainous area around Alishan, and on the offshore islands of Penghu and Matsu. People in Taiwan are friendly, public security here is very well, it is also very safe to go out in the early morning. <br><br>Taiwan seems to have everything, and be able to accommodate any type of travel plan you could think of, you can ascend above a sea of clouds, climbing one of Taiwan&apos;s over 200 three thousand meter peaks, you can also take the opportunity to relax in the blue ocean, on Taiwan&apos;s endless stretches of coastline, You can experience superior service in Taiwan&apos;s vibrant cities, or experience the slower rhythms of life in Taiwan&apos;s rustic village, all these places may not be as far away as you think, just a short trip on Taiwan&apos;s high speed rail or other transportation, can lead you to vastly different experiences.<br>')
INSERT [dbo].[MainPage] ([MainTitle], [MainImg], [MainContent]) VALUES (N'OUR PARTNERS & MEMBERSHIPS', NULL, NULL)
INSERT [dbo].[MainPage] ([MainTitle], [MainImg], [MainContent]) VALUES (N'contact', N'img/contact_us.jpg', N'CONTACT　US')
INSERT [dbo].[MainPage] ([MainTitle], [MainImg], [MainContent]) VALUES (N'footer', NULL, N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt omnis vero itaque distinctio. Tempore neque id, fugiat fuga magnam blanditiis labore aperiam ipsa suscipit. Maxime explicabo necessitatibus, provident corporis inventore.')
INSERT [dbo].[Partner] ([P_id], [P_Title], [P_Img], [P_Content], [P_Link], [P_Date]) VALUES (N'39a27217-56f6-4375-ab80-ca691ee65c08', N'Taiwan Immigration', N'img/meeting-1019875_1280.jpg', N'Taiwan Immigration &amp;Relocation Company was established in 2010. Our team provides services to help employee from International Company to adapting the living and culture in Taiwan.<br><br>If you have foreign employee are moving to Taiwan to work, we can support all the relocation solutions. We also help foreign professionals and their family to get familiar with life in Taiwan.<br>', N'https://tw.yahoo.com/', CAST(0x0000A9BB00E6BA73 AS DateTime))
INSERT [dbo].[Partner] ([P_id], [P_Title], [P_Img], [P_Content], [P_Link], [P_Date]) VALUES (N'bdbb96f2-250c-425c-9423-1e19772b5da4', N'EURA MEMBER', N'img/partner1.JPG', N'Website description...
 Website description...Website description...Website description...
 Website description...Website description...Website description...Website description...Website description...', N'https://www.google.com.tw', CAST(0x0000A9BB00E6BA73 AS DateTime))
INSERT [dbo].[Partner] ([P_id], [P_Title], [P_Img], [P_Content], [P_Link], [P_Date]) VALUES (N'f9b8f5c4-6c20-4cb1-8025-21cf14c6033e', N'Taiwan Immigration', N'img/partner2.JPG', N'Taiwan seems to have everything, and be able to accommodate any type of travel plan you could think of, you can ascend above a sea of clouds, climbing one of ', N'https://tw.yahoo.com/', CAST(0x0000A9BB01037AAF AS DateTime))
INSERT [dbo].[Partner] ([P_id], [P_Title], [P_Img], [P_Content], [P_Link], [P_Date]) VALUES (N'6f409728-b9ab-4442-afa5-e6a9c83029cf', N'Koala', N'img/Koala.jpg', N'Just Koala', N'http://google.com.tw', CAST(0x0000A9BC00C9FAD3 AS DateTime))
INSERT [dbo].[Service] ([S_id], [S_Title], [S_Content], [S_Img]) VALUES (N's01', N'VISA/IMMIGRATION', NULL, N'img/visa.jpg')
INSERT [dbo].[Service] ([S_id], [S_Title], [S_Content], [S_Img]) VALUES (N's02', N'RELOCATION SERVICES ', NULL, N'img/relocation.jpg')
INSERT [dbo].[Service] ([S_id], [S_Title], [S_Content], [S_Img]) VALUES (N's03', N'HOME FINDING ', NULL, N'img/home.jpg')
INSERT [dbo].[SubService] ([Sb_id], [Sb_Img], [Sb_Title], [Sb_Content], [S_id], [Sb_Date]) VALUES (N'9c0ac717-6940-47d1-9c14-6f6853fd9fb7', N'../img/Lighthouse.jpg', N'Work Permit', N'Foreign professionals who want to work in Taiwan are required to apply for and obtain a work permit before starting work.', N's01', CAST(0x0000A9BC00E6038C AS DateTime))
INSERT [dbo].[SubService] ([Sb_id], [Sb_Img], [Sb_Title], [Sb_Content], [S_id], [Sb_Date]) VALUES (N'd4342551-e28c-4742-be55-fb3216f6bc68', N'../img/o-SNOW-facebook.jpg', N'Resident Visa', N'When foreign professionals enter Taiwan, and plan to stay more than 6 months, will need to apply for Resident Visa.', N's01', CAST(0x0000A9BC00E61B03 AS DateTime))
INSERT [dbo].[SubService] ([Sb_id], [Sb_Img], [Sb_Title], [Sb_Content], [S_id], [Sb_Date]) VALUES (N'3086a908-7f41-4ac4-9aa4-529c6953ed19', N'../img/Temp.jpeg', N'Alien Resident Certificate (ARC)', N'Resident Visa holders are required to apply Alien Resident Certificates (ARC) within 15 days after arrival.', N's01', CAST(0x0000A9BB00EBB232 AS DateTime))
INSERT [dbo].[SubService] ([Sb_id], [Sb_Img], [Sb_Title], [Sb_Content], [S_id], [Sb_Date]) VALUES (N'b401bb2e-198c-4083-ba5e-ae2a75cc45de', N'../img/Lighthouse.jpg', N'Pre-move Orientation', N'Pre-move Orientation. Pre-move Orientation.', N's02', CAST(0x0000A9BC00E6B049 AS DateTime))
INSERT [dbo].[SubService] ([Sb_id], [Sb_Img], [Sb_Title], [Sb_Content], [S_id], [Sb_Date]) VALUES (N'52610ff9-396b-49d6-a754-8fa75c191688', N'../img/111798556-565x376_1.jpg', N'School Search', N'School Search. School Search.', N's02', CAST(0x0000A9BC00E6EBBB AS DateTime))
INSERT [dbo].[SubService] ([Sb_id], [Sb_Img], [Sb_Title], [Sb_Content], [S_id], [Sb_Date]) VALUES (N'878b0b2c-d2b8-4a59-8475-f1398e65b087', N'../img/IMG_0577.PNG', N'Car Rental', N'If you need to driving in Taiwan, we can Car Rental.', N's02', CAST(0x0000A9BC00E71DF0 AS DateTime))
INSERT [dbo].[SubService] ([Sb_id], [Sb_Img], [Sb_Title], [Sb_Content], [S_id], [Sb_Date]) VALUES (N'5996d52a-2f8a-4fbd-960b-089206fca9d2', N'../img/Temp.jpeg', N'Driving Licence Exchange', N'Temp words...
  Temp wordsTemp words...
  Temp wordsTemp wordsTemp words...', N's02', CAST(0x0000A9BB00EBB232 AS DateTime))
INSERT [dbo].[SubService] ([Sb_id], [Sb_Img], [Sb_Title], [Sb_Content], [S_id], [Sb_Date]) VALUES (N'ded18030-bf9f-4de9-8b80-95e24762336a', N'../img/Temp.jpeg', N'Furniture Purchase ', N'Temp words...
  Temp wordsTemp words...
  Temp wordsTemp wordsTemp words...', N's02', CAST(0x0000A9BB00EBB232 AS DateTime))
INSERT [dbo].[SubService] ([Sb_id], [Sb_Img], [Sb_Title], [Sb_Content], [S_id], [Sb_Date]) VALUES (N'6320ed69-81af-484e-8be0-0934583006a3', N'../img/meeting-1019875_1280.jpg', N'Taiwan seems to have everything', N'Taiwan seems to have everything', N's02', CAST(0x0000A9BB00EBB232 AS DateTime))
INSERT [dbo].[SubService] ([Sb_id], [Sb_Img], [Sb_Title], [Sb_Content], [S_id], [Sb_Date]) VALUES (N'5f4cc9c7-9c7d-4f13-a837-4f683ab40444', N'../img/noun_Camera_2020224 (1).png', N'Intercultural Training', N'Intercultural Training Intercultural Training .', N's01', CAST(0x0000A9BC00E75179 AS DateTime))
INSERT [dbo].[SubService] ([Sb_id], [Sb_Img], [Sb_Title], [Sb_Content], [S_id], [Sb_Date]) VALUES (N'4d05e3a5-bf78-4db6-a7ca-336625487678', N'../img/meeting-1019875_12802.jpg', N'Temporary Accommodation', N'Temporary Accommodation Temporary Accommodation .', N's01', CAST(0x0000A9BC00E76382 AS DateTime))
INSERT [dbo].[SubService] ([Sb_id], [Sb_Img], [Sb_Title], [Sb_Content], [S_id], [Sb_Date]) VALUES (N'316c0744-b530-4ee6-bdce-3514223231de', N'../img/car-communication-3100983_1280.jpg', N'Ongoing Support', N'Once you become our customer. Ongoing Support.', N's02', CAST(0x0000A9BC00E78452 AS DateTime))
INSERT [dbo].[SubService] ([Sb_id], [Sb_Img], [Sb_Title], [Sb_Content], [S_id], [Sb_Date]) VALUES (N'58967f2d-72ea-4b7a-b40a-17b122e788ab', N'../img/Temp.jpeg', N'Departure Service', N'Temp words...<br>  Temp wordsTemp words...<br>  Temp wordsTemp wordsTemp words...', N's03', CAST(0x0000A9BB00EBB232 AS DateTime))
INSERT [dbo].[SubService] ([Sb_id], [Sb_Img], [Sb_Title], [Sb_Content], [S_id], [Sb_Date]) VALUES (N'9ce10c7d-2d26-4937-90c0-b22e15ee3cf6', N'../img/Temp.jpeg', N'Short-term Rental', N'Temp words...
  Temp wordsTemp words...
  Temp wordsTemp wordsTemp words...', N's03', CAST(0x0000A9BB00EBB232 AS DateTime))
INSERT [dbo].[SubService] ([Sb_id], [Sb_Img], [Sb_Title], [Sb_Content], [S_id], [Sb_Date]) VALUES (N'8f155428-aa1b-437c-8513-05897fb512cc', N'../img/passport-3127925_1280.jpg', N'Settling In', N'Settling In Settling In.', N's03', CAST(0x0000A9BC00E7BDE5 AS DateTime))
INSERT [dbo].[SubService] ([Sb_id], [Sb_Img], [Sb_Title], [Sb_Content], [S_id], [Sb_Date]) VALUES (N'd02b9612-b7a2-4367-b769-d3d22acb92f0', N'../img/kolala.jpg', N'Tenancy Management', N'Tenancy Management Tenancy Management .', N's03', CAST(0x0000A9BC00E7DE4A AS DateTime))
INSERT [dbo].[SubService] ([Sb_id], [Sb_Img], [Sb_Title], [Sb_Content], [S_id], [Sb_Date]) VALUES (N'1a37951a-0857-4ff1-93a7-ab22c8412a50', N'../img/phone-612061_1280.jpg', N'Real Estate Management', N'Real Estate Management Real Estate Management .', N's03', CAST(0x0000A9BC00E80267 AS DateTime))
INSERT [dbo].[SubService] ([Sb_id], [Sb_Img], [Sb_Title], [Sb_Content], [S_id], [Sb_Date]) VALUES (N'7fab12a2-deda-4b15-9614-6545f2efd087', N'../img/squad-3370836_1920.jpg', N'Taiwan''s biggest news', N'Taiwan''s biggest news', N's02', CAST(0x0000A9BB00EBB232 AS DateTime))
SET ANSI_PADDING ON

GO
/****** Object:  Index [XPKuser]    Script Date: 2018/12/21 上午 08:48:33 ******/
ALTER TABLE [dbo].[Admin] ADD  CONSTRAINT [XPKuser] PRIMARY KEY NONCLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [XPKMainPage]    Script Date: 2018/12/21 上午 08:48:33 ******/
ALTER TABLE [dbo].[MainPage] ADD  CONSTRAINT [XPKMainPage] PRIMARY KEY NONCLUSTERED 
(
	[MainTitle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [XPKParther]    Script Date: 2018/12/21 上午 08:48:33 ******/
ALTER TABLE [dbo].[Partner] ADD  CONSTRAINT [XPKParther] PRIMARY KEY NONCLUSTERED 
(
	[P_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [XPKService]    Script Date: 2018/12/21 上午 08:48:33 ******/
ALTER TABLE [dbo].[Service] ADD  CONSTRAINT [XPKService] PRIMARY KEY NONCLUSTERED 
(
	[S_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [XPKSubServic]    Script Date: 2018/12/21 上午 08:48:33 ******/
ALTER TABLE [dbo].[SubService] ADD  CONSTRAINT [XPKSubServic] PRIMARY KEY NONCLUSTERED 
(
	[Sb_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Partner] ADD  CONSTRAINT [DF_Partner_P_id]  DEFAULT (newid()) FOR [P_id]
GO
ALTER TABLE [dbo].[Partner] ADD  CONSTRAINT [DF_Partner_P_Date]  DEFAULT (getdate()) FOR [P_Date]
GO
ALTER TABLE [dbo].[SubService] ADD  CONSTRAINT [DF_SubService_Sb_id]  DEFAULT (newid()) FOR [Sb_id]
GO
ALTER TABLE [dbo].[SubService] ADD  CONSTRAINT [DF_SubService_Sb_Date]  DEFAULT (getdate()) FOR [Sb_Date]
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
