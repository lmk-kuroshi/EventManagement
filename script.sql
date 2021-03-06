/****** Object:  Database [EventManagement]    Script Date: 11/26/2021 2:00:21 PM ******/
CREATE DATABASE [EventManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EventManagement', FILENAME = N'D:\rdsdbdata\DATA\EventManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EventManagement_log', FILENAME = N'D:\rdsdbdata\DATA\EventManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [EventManagement] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EventManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EventManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EventManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EventManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EventManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EventManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [EventManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EventManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EventManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EventManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EventManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EventManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EventManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EventManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EventManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EventManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EventManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EventManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EventManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EventManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EventManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EventManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EventManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EventManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [EventManagement] SET  MULTI_USER 
GO
ALTER DATABASE [EventManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EventManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EventManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EventManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EventManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EventManagement] SET QUERY_STORE = OFF
GO
/****** Object:  User [admin]    Script Date: 11/26/2021 2:00:24 PM ******/
CREATE USER [admin] FOR LOGIN [admin] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [admin]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 11/26/2021 2:00:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[categoryID] [nvarchar](50) NOT NULL,
	[categoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblComment]    Script Date: 11/26/2021 2:00:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblComment](
	[commentID] [nvarchar](50) NOT NULL,
	[eventID] [nvarchar](50) NULL,
	[commentDetail] [text] NOT NULL,
	[studentID] [nvarchar](50) NULL,
	[numberOfVote] [int] NULL,
 CONSTRAINT [PK_tblComment] PRIMARY KEY CLUSTERED 
(
	[commentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEvent]    Script Date: 11/26/2021 2:00:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEvent](
	[eventID] [nvarchar](50) NOT NULL,
	[eventName] [text] NULL,
	[creatorID] [nvarchar](50) NULL,
	[categoryID] [nvarchar](50) NULL,
	[locationID] [nvarchar](50) NULL,
	[eventDetail] [nvarchar](max) NULL,
	[seat] [int] NULL,
	[creatTime] [datetime] NULL,
	[startTime] [datetime] NULL,
	[endTime] [datetime] NULL,
	[image] [text] NULL,
	[video] [text] NULL,
	[status] [nvarchar](10) NULL,
 CONSTRAINT [PK_tblEvent] PRIMARY KEY CLUSTERED 
(
	[eventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFollow]    Script Date: 11/26/2021 2:00:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFollow](
	[followID] [nvarchar](50) NOT NULL,
	[eventID] [nvarchar](50) NULL,
	[studentID] [nvarchar](50) NULL,
	[followStatus] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblFollow] PRIMARY KEY CLUSTERED 
(
	[followID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFollowupEvent]    Script Date: 11/26/2021 2:00:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFollowupEvent](
	[followupID] [nvarchar](50) NOT NULL,
	[eventID] [nvarchar](50) NULL,
	[followupDetail] [text] NULL,
	[followupImage] [text] NULL,
	[followupVideo] [text] NULL,
 CONSTRAINT [PK_tblFollowupEvent] PRIMARY KEY CLUSTERED 
(
	[followupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLocation]    Script Date: 11/26/2021 2:00:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLocation](
	[locationID] [nvarchar](50) NOT NULL,
	[locationName] [nvarchar](50) NULL,
	[locationCapacity] [int] NULL,
 CONSTRAINT [PK_tblLocation] PRIMARY KEY CLUSTERED 
(
	[locationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMentorEvent]    Script Date: 11/26/2021 2:00:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMentorEvent](
	[mentorEventID] [nvarchar](50) NOT NULL,
	[eventID] [nvarchar](50) NULL,
	[mentorID] [nvarchar](50) NULL,
	[mentorEventStatus] [nvarchar](10) NULL,
 CONSTRAINT [PK_tblMentorEvent] PRIMARY KEY CLUSTERED 
(
	[mentorEventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblQandA]    Script Date: 11/26/2021 2:00:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQandA](
	[questionID] [nvarchar](50) NOT NULL,
	[mentorID] [nvarchar](50) NOT NULL,
	[studentID] [nvarchar](50) NOT NULL,
	[eventID] [nvarchar](50) NOT NULL,
	[questionDetail] [text] NOT NULL,
	[reply] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblQandA] PRIMARY KEY CLUSTERED 
(
	[questionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRegister]    Script Date: 11/26/2021 2:00:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRegister](
	[registerID] [nvarchar](50) NOT NULL,
	[userID] [nvarchar](50) NULL,
	[eventID] [nvarchar](50) NULL,
	[registerStatus] [nvarchar](10) NULL,
 CONSTRAINT [PK_tblRegister] PRIMARY KEY CLUSTERED 
(
	[registerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 11/26/2021 2:00:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRole](
	[roleID] [nvarchar](10) NOT NULL,
	[roleName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblRole] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStatus]    Script Date: 11/26/2021 2:00:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStatus](
	[statusID] [nvarchar](10) NOT NULL,
	[statusName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblStatus] PRIMARY KEY CLUSTERED 
(
	[statusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 11/26/2021 2:00:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[userID] [nvarchar](50) NOT NULL,
	[userName] [nvarchar](50) NULL,
	[userEmail] [text] NULL,
	[statusID] [nvarchar](10) NULL,
	[roleID] [nvarchar](10) NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'IB', N'International Business')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'IT', N'Information Technology')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'LA', N'Languages')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'OT', N'Others')
GO
INSERT [dbo].[tblEvent] ([eventID], [eventName], [creatorID], [categoryID], [locationID], [eventDetail], [seat], [creatTime], [startTime], [endTime], [image], [video], [status]) VALUES (N'EV-25112021_1637855241891', N'Intelligent Automation Exchange', N'118213997743056858575', N'IB', N'H1', N'<p>On 26th and 30th November, FPT will be joining the Intelligent Automation Exchange, hosted by IQPC Exchange in London, United Kingdom. The two-day event welcomes senior Artificial Intelligence and Process Automation thought leaders to discuss the current and upcoming business challenges and how to overcome them with innovations.</p><p>As one of this year’s sponsors, FPT will be showcasing its Intelligent Automation solutions, Intelligent Assistance technologies, conversational technologies, and data solutions. These digital products are expected to assist businesses across all industries in streamlining their processes and accelerating business growth.</p><p>To learn more about the event and register, visit this <a href="https://www.intelligentautomation.network/events-intelligentautomationexchange">page</a>.</p>', 100, CAST(N'2021-11-25T22:47:21.890' AS DateTime), CAST(N'2021-11-26T20:00:00.000' AS DateTime), CAST(N'2021-11-30T12:00:00.000' AS DateTime), N'https://www.fpt-software.com/wp-content/uploads/sites/2/2021/11/1200x625.png', N'', N'Complete')
INSERT [dbo].[tblEvent] ([eventID], [eventName], [creatorID], [categoryID], [locationID], [eventDetail], [seat], [creatTime], [startTime], [endTime], [image], [video], [status]) VALUES (N'EV-25112021_1637855399950', N'CX Asia Week 2021 – Hybrid Edition', N'118213997743056858575', N'IB', N'H1', N'<p>On November 23-24, FPT will be joining <strong>CX Asia Week 2021 – Hybrid Edition</strong>, which will take place both virtually and live at Grand Hyatt Singapore. This is Asia’s only event that offers comprehensive coverage on customer experience.</p><p>Themed “<strong>Adapting and transforming to the new normal post-pandemic</strong>”, CX Asia Week 2021 is a must-attend event for CX leaders looking to rethink customer experience excellence and strategies by integrating technology solutions and human touch.</p><p>At the event, FPT will showcase digital capabilities including <strong>cloud, low-code, intelligent automation</strong> and more to help companies worldwide transform digitally and stay afloat during turbulent times.</p><p>Learn more about the events and register <a href="https://www.cxnetwork.com/events-customerexperienceasia">here</a>.</p>', 50, CAST(N'2021-11-25T22:49:59.950' AS DateTime), CAST(N'2021-11-23T00:00:00.000' AS DateTime), CAST(N'2021-11-24T05:00:00.000' AS DateTime), N'https://www.fpt-software.com/wp-content/uploads/sites/2/2021/11/FPT-Sponsor-Banners.png', N'', N'Ongoing')
INSERT [dbo].[tblEvent] ([eventID], [eventName], [creatorID], [categoryID], [locationID], [eventDetail], [seat], [creatTime], [startTime], [endTime], [image], [video], [status]) VALUES (N'EV-25112021_1637859976772', N'new', N'118213997743056858575', N'IB', N'H1', N'<p>adsfdgfh</p>', 9, CAST(N'2021-11-25T17:06:16.773' AS DateTime), CAST(N'2021-11-24T00:07:00.000' AS DateTime), CAST(N'2021-11-23T00:07:00.000' AS DateTime), N'https://www.fpt-software.com/wp-content/uploads/sites/2/2021/10/1000x300.png', N'https://www.youtube.com/embed/QW51Vpcn664', N'Canceled')
INSERT [dbo].[tblEvent] ([eventID], [eventName], [creatorID], [categoryID], [locationID], [eventDetail], [seat], [creatTime], [startTime], [endTime], [image], [video], [status]) VALUES (N'EV-26112021_1637860197647', N'CX Asia Week 2021 – Hybrid Edition', N'118213997743056858575', N'IB', N'H1', N'<p>On November 23-24, FPT will be joining <strong>CX Asia Week 2021 – Hybrid Edition</strong>, which will take place both virtually and live at Grand Hyatt Singapore. This is Asia’s only event that offers comprehensive coverage on customer experience.</p><p>Themed “<strong>Adapting and transforming to the new normal post-pandemic</strong>”, CX Asia Week 2021 is a must-attend event for CX leaders looking to rethink customer experience excellence and strategies by integrating technology solutions and human touch.</p><p>At the event, FPT will showcase digital capabilities including <strong>cloud, low-code, intelligent automation</strong> and more to help companies worldwide transform digitally and stay afloat during turbulent times.</p>', 100, CAST(N'2021-11-26T00:09:57.647' AS DateTime), CAST(N'2021-11-26T00:09:00.000' AS DateTime), CAST(N'2021-11-29T00:09:00.000' AS DateTime), N'https://www.fpt-software.com/wp-content/uploads/sites/2/2021/11/FPT-Sponsor-Banners.png', N'', N'Canceled')
INSERT [dbo].[tblEvent] ([eventID], [eventName], [creatorID], [categoryID], [locationID], [eventDetail], [seat], [creatTime], [startTime], [endTime], [image], [video], [status]) VALUES (N'EV-26112021_1637885536973', N'Machine Learning', N'118213997743056858575', N'IT', N'H1', N'<p>Even when they’re trying out new media and technology, people expect intuitive, assistive, and creative experiences from brands. See how leading companies are putting the latest tech trends to use — and how they might experiment with advances on the horizon.</p>', 18, CAST(N'2021-11-26T00:12:16.973' AS DateTime), CAST(N'2021-11-28T07:11:00.000' AS DateTime), CAST(N'2021-11-29T07:11:00.000' AS DateTime), N'https://topdev.vn/blog/wp-content/uploads/2021/04/machine-learning.jpg', N'https://www.youtube.com/embed/eIrMbAQSU34', N'Ongoing')
INSERT [dbo].[tblEvent] ([eventID], [eventName], [creatorID], [categoryID], [locationID], [eventDetail], [seat], [creatTime], [startTime], [endTime], [image], [video], [status]) VALUES (N'EV-26112021_1637886559094', N' When less is more: Drive business innovation with low-code', N'118213997743056858575', N'IB', N'H1', N'<p>Unprecedented challenges of the COVID-19 pandemic have forced businesses to achieve more with less. Companies looking to stay relevant in the recovery phase are relying on low-code platforms to speed up time to market of their products and services, while at the same time narrowing the skills gap and tightening their belts.</p><p>This February, mark your calendar for our virtual event on low-code adoption. Experts from FPT and Inswave System will look into the predicted popularity surge of low-code in 2021 and real experiences on how it empowers businesses with the innovation and agility they need to stay afloat during the pandemic era.</p>', 100, CAST(N'2021-11-26T07:29:19.093' AS DateTime), CAST(N'2021-11-27T09:30:00.000' AS DateTime), CAST(N'2021-11-27T13:30:00.000' AS DateTime), N'https://www.fpt-software.com/wp-content/uploads/sites/2/2021/02/bg.png', N'', N'Ongoing')
INSERT [dbo].[tblEvent] ([eventID], [eventName], [creatorID], [categoryID], [locationID], [eventDetail], [seat], [creatTime], [startTime], [endTime], [image], [video], [status]) VALUES (N'EV-26112021_1637888831646', N'GITEX TECHNOLOGY WEEK 2021', N'118213997743056858575', N'IB', N'H1', N'<p>On 17-21 October 2021, FPT will be attending GITEX Technology Week 2021, hosted in Dubai World Trade Center, UAE. The event brings together the world’s technology leaders, enterprises, and startups to explore business transformation.</p><p>Joining other industry leaders, FPT will be showcasing its digital capabilities at <strong>Hall 2 – Booth D25</strong>. These digital solutions, including low-code, no-code, automation, cybersecurity, and more, are expected to help businesses transform at speed.</p>', 119, CAST(N'2021-11-26T01:07:11.647' AS DateTime), CAST(N'2021-11-27T10:42:00.000' AS DateTime), CAST(N'2021-11-28T10:42:00.000' AS DateTime), N'https://www.fpt-software.com/wp-content/uploads/sites/2/2021/09/242965074_445625936880550_3413465208132561650_n.jpg', N'https://www.youtube.com/embed/LQ_esuBPShI', N'Upcoming')
INSERT [dbo].[tblEvent] ([eventID], [eventName], [creatorID], [categoryID], [locationID], [eventDetail], [seat], [creatTime], [startTime], [endTime], [image], [video], [status]) VALUES (N'EV-26112021_1637889005927', N'CIOlondon', N'118213997743056858575', N'LA', N'H2', N'<p>On 7 October 2021, FPT will be attending the CIOsynergy London. The event gathers 60 leading CIOs and IT strategists from the biggest brands and largest enterprises under one roof for one day of riveting keynotes, revealing panels, engaging round-tables and unparalleled networking. Don’t miss out on this networking opportunity with local leaders that will share their knowledge, experience, and insights for years to come.</p><p>As the sponsor the CIOSYNERGY London, we will be showcasing our cutting-edge digital products and solutions. Visit our booth and meet our experts in-person to explore how to accelerate digital transformation in your business.</p>', 130, CAST(N'2021-11-26T01:10:05.927' AS DateTime), CAST(N'2021-11-26T08:09:00.000' AS DateTime), CAST(N'2021-11-28T08:10:00.000' AS DateTime), N'https://www.fpt-software.com/wp-content/uploads/sites/2/2021/09/242816846_978932915986193_2437239708738970972_n-1024x536.jpg', N'', N'Ongoing')
INSERT [dbo].[tblEvent] ([eventID], [eventName], [creatorID], [categoryID], [locationID], [eventDetail], [seat], [creatTime], [startTime], [endTime], [image], [video], [status]) VALUES (N'EV-26112021_1637889459584', N'Industry of Things World 2021', N'118213997743056858575', N'IT', N'H1', N'<p>On 21 September 2021, FPT will be joining the Industry of Things World 2021, both live in Berlin, Germany and online. This hybrid event brings together over 450 top experts from leading European manufacturing companies to discuss use and business cases like IIoT Strategy, New Business &amp; Service Models, Smart Factory, Industry 4.0, Smart Supply Chain, and more.</p><p>Live at 8:45AM (GMT+1) on 21 September, leaders and experts from FPT, Schaeffler &amp; Vreeda will hold a 30-minute keynote session on “<strong>IoT Integration made easy for any devices – Success stories from Schaeffler &amp; Vreeda</strong>”. During the section, the speakers will share specific use cases on how they make and boost up the independent devices, apps, and data work well together in different industries.</p><p>Keynote speakers:</p><ul><li>Mr. Pitt Sebens – Director of Customer Relations, FPT</li><li>Mr. Tibor Gujdan – Head of Smart Solutions, FPT</li><li>Mr. Andre Heskamp – Head of Digitalization and Operations IT APAC, Schaeffler</li><li>Mr. Olaf Schindler – CEO, Vreeda</li></ul><p>Join the live session to:</p><ul><li>Learn how Schaeffler implements IoT Program in their factory: use cases, best practices, and lessons learned.</li><li>Learn how Vreeda, an Digital Innovation company builds up the IoT Platform and empowers the industry opportunities.</li><li>Learn how FPT Corporation is considered as the ideal IT partner to accelerate and support the IoT integration &amp; platforms.</li></ul>', 140, CAST(N'2021-11-26T01:17:39.583' AS DateTime), CAST(N'2021-11-26T08:14:00.000' AS DateTime), CAST(N'2021-11-27T08:14:00.000' AS DateTime), N'https://www.fpt-software.com/wp-content/uploads/sites/2/2021/09/IIOT-768x401.jpg', N'', N'Upcoming')
INSERT [dbo].[tblEvent] ([eventID], [eventName], [creatorID], [categoryID], [locationID], [eventDetail], [seat], [creatTime], [startTime], [endTime], [image], [video], [status]) VALUES (N'EV-26112021_1637889719381', N'Virtual Business Mission – Hong Kong', N'118213997743056858575', N'LA', N'H1', N'<p>The global spread of COVID-19 has put the spotlight on the business partnership. The unprecedented pandemic challenges are urging companies to join forces across industry and geographical boundaries.</p><p>From September 14 to September 16, FPT Software will be attending the event <strong>Virtual Business Mission –&nbsp; Hong Kong. </strong>The event is part of a seminar and business matching series hosted by Vietnam Software and IT Services Association (VINASA) to help businesses find their potential partners in several markets.</p><p>Companies joining the event will have opportunities to:</p><ul><li>Update the economy and market situation in Vietnam and Hong Kong</li><li>Learn experiences from top ICT companies</li><li>Explore business cooperation opportunities through 1:1 online business matching</li></ul>', 120, CAST(N'2021-11-26T01:21:59.380' AS DateTime), CAST(N'2021-11-26T08:22:00.000' AS DateTime), CAST(N'2021-11-28T08:22:00.000' AS DateTime), N'https://www.fpt-software.com/wp-content/uploads/sites/2/2021/09/VBM-768x401.png', N'', N'Ongoing')
INSERT [dbo].[tblEvent] ([eventID], [eventName], [creatorID], [categoryID], [locationID], [eventDetail], [seat], [creatTime], [startTime], [endTime], [image], [video], [status]) VALUES (N'EV-26112021_1637890291006', N'OpenInfra Days Asia 2021', N'118213997743056858575', N'LA', N'H1', N'<p>On September 11 2021, FPT will be joining <strong>OpenInfra Days Asia 2021</strong>, an annual event hosted by several regional Open Infrastructure User Groups in Asia.</p><p>Focusing on developing open infrastructure community across the region, the event brings together experts from industry leaders like Red Hat, LINE, VMWare, and more. They will deliver technical talks, use cases and other useful resources for people and companies looking to overcome their business challenges with open source and cloud solutions.</p><p>As a Diamond Sponsor, FPT will have its experts to share insights on IT infrastructure migration and centralization and the vision of FPT in Open Infra strategy. The company will also showcase its digital capabilities including the <a href="https://www.fpt-software.com/akasuite/">akaSuite</a> – an integrated toolset for digital transformation, and its tailored solutions for various industries’ needs. Make sure to visit the booth to explore how FPT can help your business unlock new value pools, achieve operational excellence and reimagine experiences in the new normal.</p>', 130, CAST(N'2021-11-26T01:31:31.007' AS DateTime), CAST(N'2021-11-26T08:31:00.000' AS DateTime), CAST(N'2021-11-27T08:31:00.000' AS DateTime), N'https://www.fpt-software.com/wp-content/uploads/sites/2/2021/09/OpenInfraday_FB-1200-x-628-copy-768x402.jpg', N'', N'Ongoing')
INSERT [dbo].[tblEvent] ([eventID], [eventName], [creatorID], [categoryID], [locationID], [eventDetail], [seat], [creatTime], [startTime], [endTime], [image], [video], [status]) VALUES (N'EV-26112021_1637890641678', N'Japan Virtual Event: Accelerating Digital Transformation', N'118213997743056858575', N'LA', N'H1', N'<p>On September 9th, FPT will be hosting Japan Virtual Event: Accelerating Digital Transformation. This event features sharing sessions, virtual exhibition and networking lounge to create a hub for companies in Japan to exchange knowledge, explore cutting-edge technology solutions and expand their network.</p><p>Convening top-tier executives and experts from FPT and its partners, including Sitecore, Mitsui, OutSystems and more, the event aims to provide business leaders with the latest insights into market trends, market demands, digital transformation approach and opportunities to turn the current pandemic threats into sustainable business growth.</p><p>With the theme of “Accelerating Digital Transformation”, the event focuses on various topics:</p><ul><li>Adapting to disruption</li><li>Enabling agile business transformation – Enhance the present</li><li>Enabling agile business transformation – Build the future of business</li><li>How to execute the transformation</li></ul><p>At the event, participants can have the chance to win the Most Active Participation Awards, bringing home prizes such as Apple iPad, Amazon Kindle, and Amazon Echo.</p>', 140, CAST(N'2021-11-26T01:37:21.677' AS DateTime), CAST(N'2021-11-26T08:36:00.000' AS DateTime), CAST(N'2021-11-27T08:36:00.000' AS DateTime), N'https://www.fpt-software.com/wp-content/uploads/sites/2/2021/08/JVC_Banner-Social_Updated_Facebook_ENG-1024x576.png', N'', N'Upcoming')
INSERT [dbo].[tblEvent] ([eventID], [eventName], [creatorID], [categoryID], [locationID], [eventDetail], [seat], [creatTime], [startTime], [endTime], [image], [video], [status]) VALUES (N'EV-26112021_1637890735006', N'North Texas Tech Connect 2021', N'118213997743056858575', N'IT', N'H2', N'<p>On Thursday, October 28th 2021, FPT will be joining the <strong>North Texas Tech Connect 2021</strong>, the only conference designed and led by senior technology leaders in the area.</p><p>Hosted by the <strong>Dallas/Fort Worth Area Chapter of SIM (SIM DFW)</strong>, the event brings together IT leaders across the region, including those from <strong>FPT, CBRE, the Perot Companies, Pioneer Natural Resources, </strong>and more, to discuss the latest technology insights and upskilling topics. The captivating content, compelling speakers, and engaging format are expected to provide participants with fresh insights and experience.</p><p>As an Executive Leadership Track Sponsor, FPT will also be showcasing its digital capabilities, including <a href="https://www.fpt-software.com/akaSuite/"><strong>akaSuite</strong></a> – an integrated suite of innovative digital tools, and its ready-made digital solutions for several industries such as <a href="https://www.fpt-software.com/industries/logistics/"><strong>logistics</strong></a><strong>, </strong><a href="https://www.fpt-software.com/industries/aviation/"><strong>aviation</strong></a><strong>, </strong><a href="https://www.fpt-software.com/industries/manufacturing/"><strong>manufacturing</strong></a><strong>,</strong> and so on. These solutions can help companies of all sizes and industries address existing challenges and strengthen competitive edges.</p>', 100, CAST(N'2021-11-26T01:38:55.007' AS DateTime), CAST(N'2021-11-28T08:38:00.000' AS DateTime), CAST(N'2021-11-30T08:38:00.000' AS DateTime), N'https://www.fpt-software.com/wp-content/uploads/sites/2/2021/08/243156723_349083013632813_1263064451049752263_n-1024x537.jpg', N'', N'Ongoing')
INSERT [dbo].[tblEvent] ([eventID], [eventName], [creatorID], [categoryID], [locationID], [eventDetail], [seat], [creatTime], [startTime], [endTime], [image], [video], [status]) VALUES (N'EV-26112021_1637895447978', N'2021 HMG Live! U.K. CIO Executive Leadership Summit', N'118213997743056858575', N'IB', N'H1', N'<p>Next Wednesday, FPT Software’s Global Director of Digital Transformation (DX) Division, Frank Bignone, will be speaking at the <strong>2021 HMG Live! U.K. CIO Executive Leadership Summit</strong>.</p><p>The Digital Summit features top-level content and thought leadership discussions on new ways to drive change and innovation within their organisations while maintaining the culture of connectedness in an isolated setting.</p><p>Themed “<strong>Courageous Leadership and Fearless Reinvention: Guiding the Modern Enterprise in Dynamic Times</strong>”, the event focuses on these areas:</p><ul><li>Leading Courageously and Authentically in Times of Crisis</li><li>Reimagining the Business and the Future of Work</li><li>Winning the War on Talent</li><li>Creating a Workplace of Diversity and Inclusion to Foster Innovation</li><li>Becoming Boardroom Ready</li><li>Blazing the Path to Secure Innovation</li><li>Strengthening Your Personal Brand</li></ul><p>Live at 10:45 ET on 16 June, Frank Bignone will be holding an executive interview on “<strong>Succeeding your Digital Transformation: From a Caterpillar to a Butterfly</strong>”. His session will outline the phases to a successful digital transformation, as well as the challenges that may arise and how to tackle them.</p><p>Before joining FPT Software as the Global Director of Digital Transformation (DX) Division, Frank Bignone was Airbus’s Vice President and Head of Digital Transformation for the Asia Pacific Region and China. Bignone also held various managerial positions at Airbus Defense and Space, Spot Image, Astrium Geo-Information Services, EADS Astrium, and ISTAR.</p>', 150, CAST(N'2021-11-26T02:57:27.977' AS DateTime), CAST(N'2021-11-27T09:57:00.000' AS DateTime), CAST(N'2021-11-28T09:57:00.000' AS DateTime), N'https://www.fpt-software.com/wp-content/uploads/sites/2/2021/06/HMG-Live-2nd-U.K.-CIO_Linked-post-1200-x-627-copy-4-1024x535.jpg', N'', N'Complete')
INSERT [dbo].[tblEvent] ([eventID], [eventName], [creatorID], [categoryID], [locationID], [eventDetail], [seat], [creatTime], [startTime], [endTime], [image], [video], [status]) VALUES (N'EV-26112021_1637895509603', N'2021 HMG Live! Dallas CIO Executive Leadership Summit', N'118213997743056858575', N'IB', N'H1', N'<p>Next Thursday, FPT’s Chief Digital Transformation Advisor, Phuong Tram, will be speaking at <strong>2021 HMG Live! Dallas CIO Executive Leadership Summit</strong> for the first time.</p><p>The online event brings together top-tier executives and world-class technology leaders from industry giants such as Visa, AWS, Bain &amp; Company, and so on to discuss the best practices in leadership, management, technology and career development.</p><p>Themed “<strong>Courageous Leadership and Fearless Reinvention: Guiding the Modern Enterprise in Dynamic Times”</strong>, the event focuses on these areas:</p><ul><li>Leading Courageously and Authentically in Times of Crisis</li><li>Reimagining the Business and the Future of Work</li><li>Winning the War on Talent</li><li>Creating a Workplace of Diversity and Inclusion to Foster Innovation</li><li>Becoming Boardroom Ready</li><li>Blazing the Path to Secure Innovation</li><li>Strengthening Your Personal Brand</li></ul><p>Phuong Tram will be delivering a 10-minute talk on “<strong>The Role of Emerging Technologies in Business Digital Transformation</strong>“. With his wealth of experience as former global Chief Information Officer at DuPont and now Chief Advisor on Digital Transformation at FPT, his sharing is expected to help participants gain insights into the role of emerging technologies in assisting businesses to create and reinforce competitive edge, especially amid the new normal.</p>', 120, CAST(N'2021-11-26T02:58:29.603' AS DateTime), CAST(N'2021-11-17T09:58:00.000' AS DateTime), CAST(N'2021-11-25T09:58:00.000' AS DateTime), N'https://www.fpt-software.com/wp-content/uploads/sites/2/2021/03/163440662_907263656738062_6190877678982928602_n-1024x535.jpg', N'', N'Complete')
INSERT [dbo].[tblEvent] ([eventID], [eventName], [creatorID], [categoryID], [locationID], [eventDetail], [seat], [creatTime], [startTime], [endTime], [image], [video], [status]) VALUES (N'EV-26112021_1637895557462', N'When Less is More: Drive Business Innovation with Low-code', N'118213997743056858575', N'IT', N'H2', N'<p>Unprecedented challenges of the COVID-19 pandemic have forced businesses to achieve more with less. Companies looking to stay relevant in the recovery phase are relying on low-code platforms to speed up time to market of their products and services, while at the same time narrowing the skills gap and tightening their belts.</p><p>On February 24, mark your calendar for our virtual event on low-code adoption. Experts from FPT and Inswave System will look into the predicted popularity surge of low-code in 2021 and real experiences on how it empowers businesses with the innovation and agility they need to stay afloat during the pandemic era.</p><p><strong>Agenda:</strong></p><ul><li>15:00 – 15:02 (KST): <strong>Welcome</strong></li><li>15:02 – 15:15 (KST): <strong>Disruptive trend 2021: Low-code and its hypergrowth&nbsp;</strong></li><li>15:15 – 15:30 (KST): <strong>The ‘’Why’’: Speed-up overall digital transformation initiatives</strong></li><li>15:30 – 15:50 (KST): <strong>HTML5 Enterprise UI Platform for Digital Transformation</strong></li><li>15:50 – 16:00 (KST): <strong>Q&amp;A</strong></li></ul>', 120, CAST(N'2021-11-26T02:59:17.463' AS DateTime), CAST(N'2021-11-16T09:59:00.000' AS DateTime), CAST(N'2021-11-17T09:59:00.000' AS DateTime), N'https://www.fpt-software.com/wp-content/uploads/sites/2/2021/02/FKR-webinar.jpg', N'', N'Complete')
INSERT [dbo].[tblEvent] ([eventID], [eventName], [creatorID], [categoryID], [locationID], [eventDetail], [seat], [creatTime], [startTime], [endTime], [image], [video], [status]) VALUES (N'EV-26112021_1637901799445', N'Through the Pandemic and Beyond: Why Digital Responsiveness Matters', N'118213997743056858575', N'IT', N'H1', N'<p>As the business world continues to see ever-accelerating disruptions, enterprises are under a mandate to improve their adaptability, responsiveness, and resilience to thrive in the post-pandemic era. With the ability to drive rapid innovation, such hyper-available application platforms like Microsoft Power Platform are now in higher demand than ever before.</p>', 30, CAST(N'2021-11-26T11:43:19.447' AS DateTime), CAST(N'2021-11-27T11:42:00.000' AS DateTime), CAST(N'2021-11-28T11:42:00.000' AS DateTime), N'https://www.fpt-software.com/wp-content/uploads/sites/2/2021/06/LANDING-PAGE-OF-EVENT_about-even-banner-no-text-100x300-copy.jpg', N'https://www.youtube.com/embed/8do9xULpC-o', N'Upcoming')
INSERT [dbo].[tblEvent] ([eventID], [eventName], [creatorID], [categoryID], [locationID], [eventDetail], [seat], [creatTime], [startTime], [endTime], [image], [video], [status]) VALUES (N'EV-5112021_1636088825810', N'ElevateIT: Houston Technology Summit 2021', N'103845032699681146666', N'IT', N'H1', N'<p>On Wednesday, October 13 2021, FPT will be attending <strong>The 3rd Annual</strong> <strong>ElevateIT: Houston Technology Summit 2021. </strong>The event takes place both<strong> virtually </strong>and<strong> in-person </strong>at the NRG Center – 1 NRG Park Houston, Texas.</p><p>Themed “Expanding and Evolving within the Digital Revolution”, the event will host educational presentations by industry leaders and offer the opportunity for peer-to-peer&nbsp;networking with 50+ IT services providers. Participants will gain fresh insights on what to consider in terms of digitization to achieve efficiency, more effective use of resources, and evolution of culture.</p><p>As one of the proud sponsors for the event, FPT will be showcasing its digital capabilities including akaBot – a comprehensive RPA platform, and akaSuite – an integrated suite of innovative tools for turbocharging digital transformation. These solutions can help companies of all sizes and industries prepare for the unprecedented future and keep pace with the on-going digital evolution. Visit us at Booth 107 or our virtual booth on the event’s online platform.</p><p>To find out more information about the event and register, please visit this page.</p>', 99, CAST(N'2021-11-05T12:07:05.810' AS DateTime), CAST(N'2021-10-13T09:00:00.000' AS DateTime), CAST(N'2021-10-13T17:00:00.000' AS DateTime), N'https://www.fpt-software.com/wp-content/uploads/sites/2/2021/10/243131173_4852818781413682_6792855501265211115_n.jpg', N'', N'Complete')
INSERT [dbo].[tblEvent] ([eventID], [eventName], [creatorID], [categoryID], [locationID], [eventDetail], [seat], [creatTime], [startTime], [endTime], [image], [video], [status]) VALUES (N'EV-5112021_1636089100996', N'Mortgage Bankers Association Annual Convention & Expo (MBA ANNUAL21)', N'103845032699681146666', N'OT', N'H1', N'<p>This October, FPT will be joining <strong>the Mortgage Bankers Association Annual Convention &amp; Expo (MBA ANNUAL21</strong>). This is the largest gathering of real estate finance professionals in the US, embracing in-person networking and insight sharing.</p><p>Taking place at San Diego Convention Centre, this year’s event is expected to welcome over 3,500 participants, including government representatives, regulators, as well as executives and experts from leading companies such as KPMG, Wells Fargo, Bank of America, FPT, and so on.</p><p>At<strong> booth 524</strong> in the Exhibition Hall, FPT will demonstrate our digital capabilities, including <strong>intelligent automation</strong> and <strong>digital mortgage</strong>, helping companies streamline their process, reduce operational costs, boost productivity, and more.</p><p>To learn more about the event and register, please visit this website.</p>', 47, CAST(N'2021-11-05T12:11:40.997' AS DateTime), CAST(N'2021-10-17T08:00:00.000' AS DateTime), CAST(N'2021-10-20T17:00:00.000' AS DateTime), N'https://www.fpt-software.com/wp-content/uploads/sites/2/2021/10/243496014_468098644311008_2689485780647356129_n.jpg', N'', N'Complete')
INSERT [dbo].[tblEvent] ([eventID], [eventName], [creatorID], [categoryID], [locationID], [eventDetail], [seat], [creatTime], [startTime], [endTime], [image], [video], [status]) VALUES (N'EV-5112021_1636089482911', N'European Manufacturing Strategies Summit', N'103845032699681146666', N'IB', N'H1', N'<p>FPT will be attending the 17th Annual European Manufacturing Strategies Summit, a hybrid event focusing on future-proof manufacturing strategies from industry leaders. The three-day summit will be held in Berlin, Germany as well as online starting from November 8.</p><p>The 2021 <strong>European Manufacturing Strategies Summit</strong> (EMS) covers topics in five main streams:</p><ul><li>Lean &amp; Operational Excellence</li><li>Advanced Production Strategies</li><li>Industry 4.0 &amp; Technology</li><li>Leadership &amp; Workforce Development</li><li>Strategic Operations</li></ul><p>Joining as a Thought Leadership Plus Sponsor, FPT will have its leaders to share insights on Lean &amp; Operational Excellence. The company will also be showcasing its digital capabilities at booth No.18 on the Exhibition Floor.</p><p><strong>Speaking session</strong>: How to unlock data value from manufacturing end-to-end value processes<br><strong>Time</strong>: Day 1 – November 8, 13:35 – 14:05 (CET)<br><strong>Speakers</strong>:</p><ul><li>Frank Bignone, Global Director of Digital Transformation (DX) Division at FPT</li><li>Pitt Sebens, Director of Customer Relations at FPT</li></ul><p><strong>Networking Lunch &amp; Roundtable</strong>: The Hidden Value of Data in Manufacturing<br><strong>Time</strong>: Day 2 – November 9, 12.35 (CET)</p>', 196, CAST(N'2021-11-05T12:18:02.910' AS DateTime), CAST(N'2021-11-08T13:35:00.000' AS DateTime), CAST(N'2021-11-09T12:35:00.000' AS DateTime), N'https://www.fpt-software.com/wp-content/uploads/sites/2/2021/11/249727105_739739753663493_2090900846365363558_n.jpg', N'', N'Upcoming')
GO
INSERT [dbo].[tblFollow] ([followID], [eventID], [studentID], [followStatus]) VALUES (N'FL_ID-1637857427519', N'EV-5112021_1636089100996', N'118213997743056858575', N'followed')
INSERT [dbo].[tblFollow] ([followID], [eventID], [studentID], [followStatus]) VALUES (N'FL_ID-1637858800521', N'EV-25112021_1637855399950', N'118213997743056858575', N'followed')
INSERT [dbo].[tblFollow] ([followID], [eventID], [studentID], [followStatus]) VALUES (N'FL_ID-1637861303960', N'EV-25112021_1637859976772', N'103845032699681146666', N'followed')
INSERT [dbo].[tblFollow] ([followID], [eventID], [studentID], [followStatus]) VALUES (N'FL_ID-1637885630254', N'EV-26112021_1637885536973', N'118213997743056858575', N'followed')
INSERT [dbo].[tblFollow] ([followID], [eventID], [studentID], [followStatus]) VALUES (N'FL_ID-1637889576967', N'EV-26112021_1637885536973', N'103845032699681146666', N'followed')
INSERT [dbo].[tblFollow] ([followID], [eventID], [studentID], [followStatus]) VALUES (N'FL_ID-1637901913323', N'EV-26112021_1637886559094', N'118213997743056858575', N'followed')
GO
INSERT [dbo].[tblFollowupEvent] ([followupID], [eventID], [followupDetail], [followupImage], [followupVideo]) VALUES (N'FL-1637855808438', N'EV-25112021_1637855241891', N'<p>On 29th and 30th November, FPT will be joining the Intelligent Automation Exchange, hosted by IQPC Exchange in London, United Kingdom. The two-day event welcomes senior Artificial Intelligence and Process Automation thought leaders to discuss the current and upcoming business challenges and how to overcome them with innovations.</p><p>As one of this year’s sponsors, FPT will be showcasing its Intelligent Automation solutions, Intelligent Assistance technologies, conversational technologies, and data solutions. These digital products are expected to assist businesses across all industries in streamlining their processes and accelerating business growth.</p><p>To learn more about the event and register, visit this <a href="https://www.intelligentautomation.network/events-intelligentautomationexchange">page</a>.</p>', N'https://www.fpt-software.com/wp-content/uploads/sites/2/2021/11/1200x625.png', N'https://www.youtube.com/embed/foTalkLDDA8')
INSERT [dbo].[tblFollowupEvent] ([followupID], [eventID], [followupDetail], [followupImage], [followupVideo]) VALUES (N'FL-1637856016148', N'EV-25112021_1637855241891', N'', N'https://www.fpt-software.com/wp-content/uploads/sites/2/2021/11/1200x625.png', N'https://www.youtube.com/embed/FMd_M02hp2Y')
INSERT [dbo].[tblFollowupEvent] ([followupID], [eventID], [followupDetail], [followupImage], [followupVideo]) VALUES (N'FL-1637856402600', N'EV-25112021_1637855241891', N'', N'https://www.fpt-software.com/wp-content/uploads/sites/2/2021/11/1200x625.png', N'')
INSERT [dbo].[tblFollowupEvent] ([followupID], [eventID], [followupDetail], [followupImage], [followupVideo]) VALUES (N'FL-1637861383210', N'EV-25112021_1637859976772', N'', N'https://www.fpt-software.com/wp-content/uploads/sites/2/2021/11/1200x625.png', N'https://www.youtube.com/embed/foTalkLDDA8')
INSERT [dbo].[tblFollowupEvent] ([followupID], [eventID], [followupDetail], [followupImage], [followupVideo]) VALUES (N'FL-1637892704109', N'EV-26112021_1637885536973', N'<p>Welcome to machine Learning event…</p>', N'https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/136854/Originals/Hoc-may-03.jpg', N'')
INSERT [dbo].[tblFollowupEvent] ([followupID], [eventID], [followupDetail], [followupImage], [followupVideo]) VALUES (N'FL-1637902011019', N'EV-25112021_1637855399950', N'<p>Microsoft will co-host a webinar on the growing importance of rapid application development.</p>', N'https://user-cdn.uef.edu.vn/newsimg/uefenglish/tech.jpg', N'')
GO
INSERT [dbo].[tblLocation] ([locationID], [locationName], [locationCapacity]) VALUES (N'H1', N'Hall 1', 1)
INSERT [dbo].[tblLocation] ([locationID], [locationName], [locationCapacity]) VALUES (N'H2', N'Hall 2', NULL)
GO
INSERT [dbo].[tblMentorEvent] ([mentorEventID], [eventID], [mentorID], [mentorEventStatus]) VALUES (N'MTEV_ID-1637855561913', N'EV-25112021_1637855241891', N'103845032699681146666', N'DACT')
INSERT [dbo].[tblMentorEvent] ([mentorEventID], [eventID], [mentorID], [mentorEventStatus]) VALUES (N'MTEV_ID-1637886388989', N'EV-26112021_1637885536973', N'103845032699681146666', N'ACT')
INSERT [dbo].[tblMentorEvent] ([mentorEventID], [eventID], [mentorID], [mentorEventStatus]) VALUES (N'MTEV_ID-1637889129318', N'EV-26112021_1637886559094', N'103845032699681146666', N'ACT')
INSERT [dbo].[tblMentorEvent] ([mentorEventID], [eventID], [mentorID], [mentorEventStatus]) VALUES (N'MTEV_ID-1637890204966', N'EV-26112021_1637889719381', N'103845032699681146666', N'ACT')
INSERT [dbo].[tblMentorEvent] ([mentorEventID], [eventID], [mentorID], [mentorEventStatus]) VALUES (N'MTEV_ID-1637898518754', N'EV-26112021_1637885536973', N'103928174095349287932', N'ACT')
INSERT [dbo].[tblMentorEvent] ([mentorEventID], [eventID], [mentorID], [mentorEventStatus]) VALUES (N'MTEV_ID-1637898571313', N'EV-26112021_1637888831646', N'103928174095349287932', N'ACT')
INSERT [dbo].[tblMentorEvent] ([mentorEventID], [eventID], [mentorID], [mentorEventStatus]) VALUES (N'MTEV_ID-1637898601047', N'EV-26112021_1637889459584', N'103928174095349287932', N'ACT')
INSERT [dbo].[tblMentorEvent] ([mentorEventID], [eventID], [mentorID], [mentorEventStatus]) VALUES (N'MTEV_ID-1637898619460', N'EV-26112021_1637890641678', N'103928174095349287932', N'ACT')
INSERT [dbo].[tblMentorEvent] ([mentorEventID], [eventID], [mentorID], [mentorEventStatus]) VALUES (N'MTEV_ID-1637902096359', N'EV-26112021_1637888831646', N'103845032699681146666', N'ACT')
GO
INSERT [dbo].[tblQandA] ([questionID], [mentorID], [studentID], [eventID], [questionDetail], [reply]) VALUES (N'QA_ID-1637886594848', N'103845032699681146666', N'118213997743056858575', N'EV-26112021_1637885536973', N'Do Machine Learning help improve coding?', N'No')
INSERT [dbo].[tblQandA] ([questionID], [mentorID], [studentID], [eventID], [questionDetail], [reply]) VALUES (N'QA_ID-1637899162338', N'103928174095349287932', N'118213997743056858575', N'EV-26112021_1637888831646', N'What is Gitex', NULL)
INSERT [dbo].[tblQandA] ([questionID], [mentorID], [studentID], [eventID], [questionDetail], [reply]) VALUES (N'QA_ID-1637899181729', N'103928174095349287932', N'103845032699681146666', N'EV-26112021_1637888831646', N'What is GITEX TECHNOLOGY WEEK?', N'It is GITEX TECHNOLOGY ')
INSERT [dbo].[tblQandA] ([questionID], [mentorID], [studentID], [eventID], [questionDetail], [reply]) VALUES (N'QA_ID-1637899534230', N'103845032699681146666', N'103928174095349287932', N'EV-26112021_1637889719381', N'why are we still here just to suffer?', NULL)
INSERT [dbo].[tblQandA] ([questionID], [mentorID], [studentID], [eventID], [questionDetail], [reply]) VALUES (N'QA_ID-1637901375735', N'103928174095349287932', N'103845032699681146666', N'EV-26112021_1637885536973', N'hi, i have question', N'no')
GO
INSERT [dbo].[tblRegister] ([registerID], [userID], [eventID], [registerStatus]) VALUES (N'RG_ID-1636131606120', N'108099858236617221557', N'EV-5112021_1636088825810', N'Registed')
INSERT [dbo].[tblRegister] ([registerID], [userID], [eventID], [registerStatus]) VALUES (N'RG_ID-1637780216777', N'108099858236617221557', N'EV-5112021_1636089482911', N'Registed')
INSERT [dbo].[tblRegister] ([registerID], [userID], [eventID], [registerStatus]) VALUES (N'RG_ID-1637823687909', N'108099858236617221557', N'EV-5112021_1636089100996', N'Registed')
INSERT [dbo].[tblRegister] ([registerID], [userID], [eventID], [registerStatus]) VALUES (N'RG_ID-1637837282501', N'103845032699681146666', N'EV-5112021_1636089482911', N'Registed')
INSERT [dbo].[tblRegister] ([registerID], [userID], [eventID], [registerStatus]) VALUES (N'RG_ID-1637857458438', N'118213997743056858575', N'EV-5112021_1636089100996', N'Registed')
INSERT [dbo].[tblRegister] ([registerID], [userID], [eventID], [registerStatus]) VALUES (N'RG_ID-1637858823943', N'118213997743056858575', N'EV-5112021_1636089482911', N'Registed')
INSERT [dbo].[tblRegister] ([registerID], [userID], [eventID], [registerStatus]) VALUES (N'RG_ID-1637861329476', N'103845032699681146666', N'EV-25112021_1637859976772', N'Registed')
INSERT [dbo].[tblRegister] ([registerID], [userID], [eventID], [registerStatus]) VALUES (N'RG_ID-1637885817004', N'118213997743056858575', N'EV-26112021_1637885536973', N'Registed')
INSERT [dbo].[tblRegister] ([registerID], [userID], [eventID], [registerStatus]) VALUES (N'RG_ID-1637889460428', N'118213997743056858575', N'EV-26112021_1637888831646', N'Registed')
INSERT [dbo].[tblRegister] ([registerID], [userID], [eventID], [registerStatus]) VALUES (N'RG_ID-1637901297216', N'103845032699681146666', N'EV-26112021_1637885536973', N'Registed')
GO
INSERT [dbo].[tblRole] ([roleID], [roleName]) VALUES (N'AD', N'Admin')
INSERT [dbo].[tblRole] ([roleID], [roleName]) VALUES (N'LD', N'Leader')
INSERT [dbo].[tblRole] ([roleID], [roleName]) VALUES (N'MT', N'Mentor')
INSERT [dbo].[tblRole] ([roleID], [roleName]) VALUES (N'STU', N'Student')
GO
INSERT [dbo].[tblStatus] ([statusID], [statusName]) VALUES (N'ACT', N'Active')
INSERT [dbo].[tblStatus] ([statusID], [statusName]) VALUES (N'DACT ', N'Deactive')
GO
INSERT [dbo].[tblUser] ([userID], [userName], [userEmail], [statusID], [roleID]) VALUES (N'103845032699681146666', N'Ton Trong Nghia (K15 HCM)', N'nghiattse150525@fpt.edu.vn', N'ACT', N'MT')
INSERT [dbo].[tblUser] ([userID], [userName], [userEmail], [statusID], [roleID]) VALUES (N'103928174095349287932', N'Vo Tuan Khanh (K15 HCM)', N'khanhvtse150420@fpt.edu.vn', N'ACT', N'MT')
INSERT [dbo].[tblUser] ([userID], [userName], [userEmail], [statusID], [roleID]) VALUES (N'108099858236617221557', N'Nguyen Dinh Duy (K15 HCM)', N'duyndse150396@fpt.edu.vn', N'ACT', N'STU')
INSERT [dbo].[tblUser] ([userID], [userName], [userEmail], [statusID], [roleID]) VALUES (N'110582335939354138563', N'Tran Nguyen Khoi Nguyen (K15 HCM)', N'nguyentnkse150353@fpt.edu.vn', N'ACT', N'AD')
INSERT [dbo].[tblUser] ([userID], [userName], [userEmail], [statusID], [roleID]) VALUES (N'117183747599827402996', N'Nguyen Thien Quang (K15 HCM)', N'quangntse150500@fpt.edu.vn', N'ACT', N'STU')
INSERT [dbo].[tblUser] ([userID], [userName], [userEmail], [statusID], [roleID]) VALUES (N'118213997743056858575', N'Le Minh Khoa (K15 HCM)', N'khoalmse150443@fpt.edu.vn', N'ACT', N'LD')
GO
ALTER TABLE [dbo].[tblComment]  WITH CHECK ADD  CONSTRAINT [FK_tblComment_tblEvent] FOREIGN KEY([eventID])
REFERENCES [dbo].[tblEvent] ([eventID])
GO
ALTER TABLE [dbo].[tblComment] CHECK CONSTRAINT [FK_tblComment_tblEvent]
GO
ALTER TABLE [dbo].[tblComment]  WITH CHECK ADD  CONSTRAINT [FK_tblComment_tblUser] FOREIGN KEY([studentID])
REFERENCES [dbo].[tblUser] ([userID])
GO
ALTER TABLE [dbo].[tblComment] CHECK CONSTRAINT [FK_tblComment_tblUser]
GO
ALTER TABLE [dbo].[tblEvent]  WITH CHECK ADD  CONSTRAINT [FK_tblEvent_tblCategory] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategory] ([categoryID])
GO
ALTER TABLE [dbo].[tblEvent] CHECK CONSTRAINT [FK_tblEvent_tblCategory]
GO
ALTER TABLE [dbo].[tblEvent]  WITH CHECK ADD  CONSTRAINT [FK_tblEvent_tblLocation] FOREIGN KEY([locationID])
REFERENCES [dbo].[tblLocation] ([locationID])
GO
ALTER TABLE [dbo].[tblEvent] CHECK CONSTRAINT [FK_tblEvent_tblLocation]
GO
ALTER TABLE [dbo].[tblEvent]  WITH CHECK ADD  CONSTRAINT [FK_tblEvent_tblUser] FOREIGN KEY([creatorID])
REFERENCES [dbo].[tblUser] ([userID])
GO
ALTER TABLE [dbo].[tblEvent] CHECK CONSTRAINT [FK_tblEvent_tblUser]
GO
ALTER TABLE [dbo].[tblFollow]  WITH CHECK ADD  CONSTRAINT [FK_tblFollow_tblEvent] FOREIGN KEY([eventID])
REFERENCES [dbo].[tblEvent] ([eventID])
GO
ALTER TABLE [dbo].[tblFollow] CHECK CONSTRAINT [FK_tblFollow_tblEvent]
GO
ALTER TABLE [dbo].[tblFollow]  WITH CHECK ADD  CONSTRAINT [FK_tblFollow_tblUser] FOREIGN KEY([studentID])
REFERENCES [dbo].[tblUser] ([userID])
GO
ALTER TABLE [dbo].[tblFollow] CHECK CONSTRAINT [FK_tblFollow_tblUser]
GO
ALTER TABLE [dbo].[tblFollowupEvent]  WITH CHECK ADD  CONSTRAINT [FK_tblFollowupEvent_tblEvent] FOREIGN KEY([eventID])
REFERENCES [dbo].[tblEvent] ([eventID])
GO
ALTER TABLE [dbo].[tblFollowupEvent] CHECK CONSTRAINT [FK_tblFollowupEvent_tblEvent]
GO
ALTER TABLE [dbo].[tblMentorEvent]  WITH CHECK ADD  CONSTRAINT [FK_tblMentorEvent_tblEvent] FOREIGN KEY([eventID])
REFERENCES [dbo].[tblEvent] ([eventID])
GO
ALTER TABLE [dbo].[tblMentorEvent] CHECK CONSTRAINT [FK_tblMentorEvent_tblEvent]
GO
ALTER TABLE [dbo].[tblMentorEvent]  WITH CHECK ADD  CONSTRAINT [FK_tblMentorEvent_tblUser] FOREIGN KEY([mentorID])
REFERENCES [dbo].[tblUser] ([userID])
GO
ALTER TABLE [dbo].[tblMentorEvent] CHECK CONSTRAINT [FK_tblMentorEvent_tblUser]
GO
ALTER TABLE [dbo].[tblQandA]  WITH CHECK ADD  CONSTRAINT [FK_tblQandA_tblEvent] FOREIGN KEY([eventID])
REFERENCES [dbo].[tblEvent] ([eventID])
GO
ALTER TABLE [dbo].[tblQandA] CHECK CONSTRAINT [FK_tblQandA_tblEvent]
GO
ALTER TABLE [dbo].[tblQandA]  WITH CHECK ADD  CONSTRAINT [FK_tblQandA_tblUser] FOREIGN KEY([studentID])
REFERENCES [dbo].[tblUser] ([userID])
GO
ALTER TABLE [dbo].[tblQandA] CHECK CONSTRAINT [FK_tblQandA_tblUser]
GO
ALTER TABLE [dbo].[tblQandA]  WITH CHECK ADD  CONSTRAINT [FK_tblQandA_tblUser1] FOREIGN KEY([mentorID])
REFERENCES [dbo].[tblUser] ([userID])
GO
ALTER TABLE [dbo].[tblQandA] CHECK CONSTRAINT [FK_tblQandA_tblUser1]
GO
ALTER TABLE [dbo].[tblRegister]  WITH CHECK ADD  CONSTRAINT [FK_tblRegister_tblEvent] FOREIGN KEY([eventID])
REFERENCES [dbo].[tblEvent] ([eventID])
GO
ALTER TABLE [dbo].[tblRegister] CHECK CONSTRAINT [FK_tblRegister_tblEvent]
GO
ALTER TABLE [dbo].[tblRegister]  WITH CHECK ADD  CONSTRAINT [FK_tblRegister_tblUser] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUser] ([userID])
GO
ALTER TABLE [dbo].[tblRegister] CHECK CONSTRAINT [FK_tblRegister_tblUser]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK_tblUser_tblRole] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRole] ([roleID])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK_tblUser_tblRole]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK_tblUser_tblStatus] FOREIGN KEY([statusID])
REFERENCES [dbo].[tblStatus] ([statusID])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK_tblUser_tblStatus]
GO
ALTER DATABASE [EventManagement] SET  READ_WRITE 
GO
