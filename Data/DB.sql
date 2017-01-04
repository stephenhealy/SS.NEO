/****** Object:  Table [AdvertisementClicks]    Script Date: 1/4/2017 11:09:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [AdvertisementClicks](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AdvertisementID] [int] NOT NULL,
	[IPAddress] [varchar](15) NULL,
	[Created] [datetime] NOT NULL,
 CONSTRAINT [PK_AdvertisementClicks] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Advertisements]    Script Date: 1/4/2017 11:09:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Advertisements](
	[AssetID] [int] NOT NULL,
	[Name] [varchar](100) NULL,
	[Heading] [varchar](75) NULL,
	[Message] [varchar](max) NULL,
	[Link] [varchar](max) NULL,
	[Label] [varchar](25) NULL,
	[Above] [varchar](max) NULL,
	[Frequency] [int] NOT NULL,
	[Times] [int] NOT NULL,
	[Total] [int] NOT NULL,
	[Last] [datetime] NULL,
	[Enabled] [bit] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Advertisements] PRIMARY KEY CLUSTERED 
(
	[AssetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Assets]    Script Date: 1/4/2017 11:09:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Assets](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Assets] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Bocce]    Script Date: 1/4/2017 11:09:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Bocce](
	[AssetID] [int] NOT NULL,
	[Message] [varchar](max) NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_Bocce] PRIMARY KEY CLUSTERED 
(
	[AssetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Carousel]    Script Date: 1/4/2017 11:09:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Carousel](
	[AssetID] [int] NOT NULL,
	[Title] [varchar](50) NULL,
	[Lead] [varchar](100) NULL,
	[Description] [varchar](max) NULL,
	[Image] [varchar](100) NULL,
	[Label] [varchar](50) NULL,
	[Link] [varchar](100) NULL,
	[Left] [bit] NOT NULL,
	[Display] [int] NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Carousel] PRIMARY KEY CLUSTERED 
(
	[AssetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Clinics]    Script Date: 1/4/2017 11:09:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Clinics](
	[AssetID] [int] NOT NULL,
	[SportID] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[Description] [varchar](max) NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Deadline] [datetime] NOT NULL,
	[Cost] [float] NOT NULL,
	[UserID] [int] NOT NULL,
	[EZRegister] [varchar](max) NULL,
	[Link] [varchar](max) NULL,
	[Enabled] [bit] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Clinics] PRIMARY KEY CLUSTERED 
(
	[AssetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [EventLog]    Script Date: 1/4/2017 11:09:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [EventLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Event] [varchar](30) NULL,
	[Message] [varchar](max) NULL,
	[Error] [bit] NOT NULL,
	[Debug] [bit] NOT NULL,
	[Created] [datetime] NOT NULL,
 CONSTRAINT [PK_EventLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [EventRegistration]    Script Date: 1/4/2017 11:09:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [EventRegistration](
	[AssetID] [int] NOT NULL,
	[SportID] [int] NOT NULL,
	[First] [varchar](50) NULL,
	[Last] [varchar](50) NULL,
	[Email] [varchar](100) NULL,
	[Phone] [varchar](20) NULL,
	[StartDate] [datetime] NOT NULL,
	[Description] [varchar](max) NULL,
	[Website] [varchar](100) NULL,
	[Submitted] [datetime] NOT NULL,
	[Scheduled] [datetime] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_EventRegistration] PRIMARY KEY CLUSTERED 
(
	[AssetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Events]    Script Date: 1/4/2017 11:09:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Events](
	[AssetID] [int] NOT NULL,
	[Title] [varchar](100) NULL,
	[Description] [varchar](max) NULL,
	[StartDate] [datetime] NOT NULL,
	[UserID] [int] NOT NULL,
	[Link] [varchar](max) NULL,
	[Enabled] [bit] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Events] PRIMARY KEY CLUSTERED 
(
	[AssetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Keys]    Script Date: 1/4/2017 11:09:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Keys](
	[id] [int] IDENTITY(100000,3) NOT NULL,
	[val] [varchar](100) NULL,
	[created] [datetime] NULL,
	[deleted] [datetime] NULL,
 CONSTRAINT [PK_Keys] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Leagues]    Script Date: 1/4/2017 11:09:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Leagues](
	[AssetID] [int] NOT NULL,
	[SessionID] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[Description] [varchar](max) NULL,
	[Night] [int] NOT NULL,
	[EZRegister] [varchar](max) NULL,
	[EZSchedule] [varchar](max) NULL,
	[Cost] [float] NOT NULL,
	[Display] [int] NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Leagues] PRIMARY KEY CLUSTERED 
(
	[AssetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Lessons]    Script Date: 1/4/2017 11:09:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Lessons](
	[AssetID] [int] NOT NULL,
	[SportID] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[Rate] [float] NOT NULL,
	[Hourly] [bit] NOT NULL,
	[Benefit1] [varchar](50) NULL,
	[Benefit2] [varchar](50) NULL,
	[Benefit3] [varchar](50) NULL,
	[Value] [varchar](10) NULL,
	[Display] [int] NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Lessons] PRIMARY KEY CLUSTERED 
(
	[AssetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [LessonsRegister]    Script Date: 1/4/2017 11:09:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [LessonsRegister](
	[AssetID] [int] NOT NULL,
	[SportID] [int] NOT NULL,
	[First] [varchar](50) NULL,
	[Last] [varchar](50) NULL,
	[Parent] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[Phone] [varchar](20) NULL,
	[Participants] [int] NOT NULL,
	[Submitted] [datetime] NOT NULL,
	[Scheduled] [datetime] NOT NULL,
	[Instructor] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_LessonsRegister] PRIMARY KEY CLUSTERED 
(
	[AssetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Log]    Script Date: 1/4/2017 11:09:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Log](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Key] [varchar](30) NULL,
	[AssetID] [int] NOT NULL,
	[Latest] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Log] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [LogDetails]    Script Date: 1/4/2017 11:09:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [LogDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LogID] [int] NOT NULL,
	[Field] [varchar](100) NULL,
	[Was] [varchar](max) NULL,
	[Now] [varchar](max) NULL,
 CONSTRAINT [PK_LogDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [News]    Script Date: 1/4/2017 11:09:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [News](
	[AssetID] [int] NOT NULL,
	[Title] [varchar](100) NULL,
	[Description] [varchar](max) NULL,
	[Link] [varchar](max) NULL,
	[Display] [int] NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[AssetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [PhotoAlbums]    Script Date: 1/4/2017 11:09:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [PhotoAlbums](
	[AssetID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Name] [varchar](100) NULL,
	[Display] [int] NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_PhotoAlbums] PRIMARY KEY CLUSTERED 
(
	[AssetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [PhotoCategories]    Script Date: 1/4/2017 11:09:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [PhotoCategories](
	[AssetID] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[Display] [int] NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_PhotoCategories] PRIMARY KEY CLUSTERED 
(
	[AssetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Photos]    Script Date: 1/4/2017 11:09:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Photos](
	[AssetID] [int] NOT NULL,
	[AlbumID] [int] NOT NULL,
	[Title] [varchar](30) NULL,
	[Caption] [varchar](100) NULL,
	[Image] [varchar](100) NULL,
	[Display] [int] NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Photos] PRIMARY KEY CLUSTERED 
(
	[AssetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Players]    Script Date: 1/4/2017 11:09:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Players](
	[AssetID] [int] NOT NULL,
	[Email] [varchar](100) NULL,
	[Password] [nvarchar](100) NULL,
	[First] [varchar](50) NULL,
	[Last] [varchar](50) NULL,
	[Address] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](10) NULL,
	[Phone] [varchar](15) NULL,
	[PrivatePhone] [bit] NOT NULL,
	[PrivateEmail] [bit] NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Players] PRIMARY KEY CLUSTERED 
(
	[AssetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [PositionMembers]    Script Date: 1/4/2017 11:09:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PositionMembers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SeekingID] [int] NOT NULL,
	[PlayerID] [int] NOT NULL,
	[PositionID] [int] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Deleted] [datetime] NULL,
 CONSTRAINT [PK_PositionMembers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Positions]    Script Date: 1/4/2017 11:09:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Positions](
	[AssetID] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[Description] [varchar](max) NULL,
	[Display] [int] NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Positions] PRIMARY KEY CLUSTERED 
(
	[AssetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Seeking]    Script Date: 1/4/2017 11:09:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Seeking](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PlayerID] [int] NOT NULL,
	[Team] [varchar](50) NULL,
	[Description] [varchar](max) NULL,
	[Filled] [datetime] NULL,
	[Created] [datetime] NOT NULL,
	[Updated] [datetime] NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Seeking] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Sessions]    Script Date: 1/4/2017 11:09:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Sessions](
	[AssetID] [int] NOT NULL,
	[SportID] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[Deadline] [datetime] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Sessions] PRIMARY KEY CLUSTERED 
(
	[AssetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Settings]    Script Date: 1/4/2017 11:09:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Settings](
	[AssetID] [int] NOT NULL,
	[Alert] [varchar](max) NULL,
	[AlertStart] [datetime] NULL,
	[AlertEnd] [datetime] NULL,
	[EmailFrom] [varchar](100) NULL,
	[EventTo] [varchar](200) NULL,
	[EventCc] [varchar](200) NULL,
	[EventBcc] [varchar](200) NULL,
	[ContactTo] [varchar](200) NULL,
	[ContactCc] [varchar](200) NULL,
	[ContactBcc] [varchar](200) NULL,
	[LeagueError] [int] NULL,
	[LeagueWarning] [int] NULL,
	[Lesson] [int] NULL,
	[Event] [int] NULL,
	[Players] [int] NULL,
	[Teams] [int] NULL,
	[Date] [datetime] NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Settings] PRIMARY KEY CLUSTERED 
(
	[AssetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Sidebar]    Script Date: 1/4/2017 11:09:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Sidebar](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SportID] [int] NOT NULL,
	[Alt] [varchar](50) NULL,
	[Image] [varchar](100) NULL,
	[Display] [int] NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Sidebar] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Sponsors]    Script Date: 1/4/2017 11:09:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Sponsors](
	[AssetID] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[Logo] [varchar](100) NULL,
	[Web] [varchar](100) NULL,
	[Address] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](10) NULL,
	[Phone] [varchar](15) NULL,
	[Description] [varchar](max) NULL,
	[Display] [int] NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Sponsors] PRIMARY KEY CLUSTERED 
(
	[AssetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Sports]    Script Date: 1/4/2017 11:09:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Sports](
	[AssetID] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[Display] [int] NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Sports] PRIMARY KEY CLUSTERED 
(
	[AssetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [SubscriptionMembers]    Script Date: 1/4/2017 11:09:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SubscriptionMembers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SubscriptionID] [int] NOT NULL,
	[TypeID] [int] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_SubscriptionMembers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Subscriptions]    Script Date: 1/4/2017 11:09:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Subscriptions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](100) NULL,
	[Created] [datetime] NULL,
 CONSTRAINT [PK_Subscriptions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [SubscriptionTypes]    Script Date: 1/4/2017 11:09:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [SubscriptionTypes](
	[AssetID] [int] NOT NULL,
	[SportID] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[Display] [int] NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_SubscriptionTypes] PRIMARY KEY CLUSTERED 
(
	[AssetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Testimonials]    Script Date: 1/4/2017 11:09:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Testimonials](
	[AssetID] [int] NOT NULL,
	[Name] [varchar](100) NULL,
	[Company] [varchar](100) NULL,
	[Testimonial] [varchar](max) NULL,
	[Email] [varchar](100) NULL,
	[Image] [varchar](100) NULL,
	[Display] [int] NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Testimonials] PRIMARY KEY CLUSTERED 
(
	[AssetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Tournaments]    Script Date: 1/4/2017 11:09:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Tournaments](
	[AssetID] [int] NOT NULL,
	[SportID] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[Description] [varchar](max) NULL,
	[Location] [varchar](100) NULL,
	[Date] [datetime] NOT NULL,
	[Deadline] [datetime] NOT NULL,
	[Cost] [float] NOT NULL,
	[UserID] [int] NOT NULL,
	[EZRegister] [varchar](max) NULL,
	[EZSchedule] [varchar](max) NULL,
	[Enabled] [bit] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Tournaments] PRIMARY KEY CLUSTERED 
(
	[AssetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Users]    Script Date: 1/4/2017 11:09:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Users](
	[AssetID] [int] NOT NULL,
	[First] [varchar](50) NULL,
	[Last] [varchar](50) NULL,
	[Email] [varchar](100) NULL,
	[Password] [nvarchar](100) NULL,
	[Staff] [bit] NOT NULL,
	[Title] [varchar](50) NULL,
	[Bio] [varchar](max) NULL,
	[Image] [varchar](100) NULL,
	[Facebook] [varchar](100) NULL,
	[Twitter] [varchar](100) NULL,
	[Phone] [varchar](15) NULL,
	[Display] [int] NOT NULL,
	[Super] [bit] NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[AssetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [AdvertisementClicks] ON 

GO
INSERT [AdvertisementClicks] ([ID], [AdvertisementID], [IPAddress], [Created]) VALUES (1, 93, N'::1', CAST(N'2016-09-27 18:46:56.537' AS DateTime))
GO
SET IDENTITY_INSERT [AdvertisementClicks] OFF
GO
INSERT [Advertisements] ([AssetID], [Name], [Heading], [Message], [Link], [Label], [Above], [Frequency], [Times], [Total], [Last], [Enabled], [Deleted]) VALUES (92, N'SiteSteam', N'Get the website you''ve always wanted!', N'SiteSteam, LLC is a professional website design and development company and is offering 10% off new websites for <strong>NEO Sports Plant customers</strong>. Mention this advertisement when ordering.', N'http://www.sitesteam.com/', N'Signup Today!', N'Fully compatible: &nbsp;&nbsp; <i class="fa fa-mobile fa-2x"></i> &nbsp;&nbsp; <i class="fa fa-tablet fa-2x"></i> &nbsp;&nbsp; <i class="fa fa-desktop fa-2x"></i>', 5, 159, 159, CAST(N'2016-12-16 15:14:36.003' AS DateTime), 1, 0)
GO
INSERT [Advertisements] ([AssetID], [Name], [Heading], [Message], [Link], [Label], [Above], [Frequency], [Times], [Total], [Last], [Enabled], [Deleted]) VALUES (93, N'Diversified Insurance Concepts', N'Let Us Do the Shopping For You', N'Diversified Insurance Concepts’ commitment to superior customer service is the driving factor that sets us apart from our competitors. We treat each client with the urgency, reliability and respect they should expect from their independent agent.', N'http://www.diversifiedinsuranceconcepts.com/', N'Contact Us', NULL, 7, 220, 220, CAST(N'2016-12-16 15:15:04.707' AS DateTime), 1, 0)
GO
SET IDENTITY_INSERT [Assets] ON 

GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (1, 0, CAST(N'2016-05-18 20:57:03.110' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (2, 0, CAST(N'2016-05-18 23:22:55.730' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (3, 0, CAST(N'2016-05-19 14:31:33.417' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (4, 0, CAST(N'2016-06-06 19:01:56.277' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (5, 4, CAST(N'2016-06-06 20:05:36.953' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (6, 4, CAST(N'2016-06-06 20:06:21.927' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (7, 4, CAST(N'2016-06-06 20:09:47.540' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (8, 4, CAST(N'2016-06-06 20:10:32.450' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (9, 4, CAST(N'2016-06-06 20:10:42.540' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (10, 4, CAST(N'2016-06-06 20:10:59.207' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (11, 4, CAST(N'2016-06-06 20:11:12.000' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (12, 4, CAST(N'2016-06-06 20:11:30.283' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (13, 4, CAST(N'2016-06-06 20:13:08.813' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (14, 4, CAST(N'2016-06-06 20:14:17.893' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (15, 4, CAST(N'2016-06-13 20:22:39.920' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (16, 4, CAST(N'2016-06-13 20:44:05.720' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (17, 4, CAST(N'2016-06-13 20:44:14.320' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (18, 4, CAST(N'2016-06-13 20:45:03.440' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (19, 4, CAST(N'2016-06-14 02:43:51.897' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (20, 4, CAST(N'2016-06-14 02:46:42.937' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (21, 4, CAST(N'2016-06-14 02:48:54.847' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (22, 4, CAST(N'2016-06-15 14:02:00.087' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (23, 4, CAST(N'2016-06-15 14:29:26.367' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (24, 4, CAST(N'2016-06-15 14:55:56.983' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (25, 4, CAST(N'2016-06-15 15:17:24.150' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (26, 4, CAST(N'2016-06-15 15:24:00.827' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (27, 4, CAST(N'2016-06-15 15:41:53.027' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (28, 4, CAST(N'2016-06-15 17:36:25.547' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (29, 4, CAST(N'2016-06-15 17:39:42.573' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (30, 0, CAST(N'2016-06-15 21:10:06.170' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (31, 0, CAST(N'2016-06-15 21:13:08.547' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (32, 0, CAST(N'2016-06-15 21:14:04.543' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (33, 0, CAST(N'2016-06-15 21:45:28.730' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (34, 0, CAST(N'2016-06-15 21:46:56.057' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (35, 0, CAST(N'2016-06-15 21:49:33.037' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (36, 4, CAST(N'2016-06-16 13:08:43.247' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (37, 4, CAST(N'2016-06-16 13:09:46.450' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (38, 4, CAST(N'2016-06-16 13:13:06.223' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (39, 0, CAST(N'2016-06-16 14:37:37.893' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (40, 0, CAST(N'2016-06-16 14:44:09.107' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (41, 0, CAST(N'2016-06-16 14:46:57.977' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (42, 4, CAST(N'2016-06-16 16:30:43.087' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (43, 4, CAST(N'2016-06-16 16:31:56.753' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (44, 4, CAST(N'2016-06-16 17:25:04.913' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (45, 4, CAST(N'2016-06-16 17:26:03.657' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (46, 4, CAST(N'2016-06-16 18:15:34.017' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (47, 4, CAST(N'2016-06-16 19:03:18.223' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (48, 4, CAST(N'2016-06-20 12:40:42.950' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (49, 0, CAST(N'2016-06-20 14:04:53.150' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (50, 0, CAST(N'2016-06-20 14:06:28.777' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (51, 0, CAST(N'2016-06-20 14:07:35.193' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (52, 4, CAST(N'2016-06-22 20:44:51.520' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (53, 4, CAST(N'2016-06-22 20:57:08.137' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (54, 4, CAST(N'2016-06-22 21:01:00.967' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (55, 4, CAST(N'2016-06-22 21:01:53.580' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (56, 4, CAST(N'2016-06-22 21:08:23.857' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (57, 4, CAST(N'2016-06-23 01:42:17.553' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (58, 4, CAST(N'2016-06-23 14:36:47.643' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (59, 4, CAST(N'2016-06-23 14:37:01.207' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (60, 4, CAST(N'2016-06-23 14:37:15.817' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (61, -1, CAST(N'2016-06-23 14:37:15.817' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (62, -1, CAST(N'2016-06-23 20:54:14.287' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (63, 4, CAST(N'2016-06-27 19:13:00.173' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (64, 4, CAST(N'2016-06-27 19:13:54.570' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (65, 4, CAST(N'2016-06-27 19:14:19.747' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (66, 4, CAST(N'2016-06-30 13:47:36.973' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (67, 4, CAST(N'2016-06-30 13:47:54.213' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (68, 4, CAST(N'2016-06-30 13:48:10.357' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (69, -1, CAST(N'2016-06-30 18:36:35.507' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (70, 4, CAST(N'2016-06-30 21:20:07.493' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (71, 4, CAST(N'2016-07-04 13:08:02.097' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (72, 4, CAST(N'2016-07-04 13:08:33.043' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (73, 4, CAST(N'2016-07-04 13:09:01.907' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (74, 4, CAST(N'2016-07-04 13:09:28.007' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (75, 4, CAST(N'2016-07-04 13:09:52.843' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (76, 4, CAST(N'2016-07-04 13:10:17.540' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (77, 0, CAST(N'2016-07-07 19:21:41.973' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (78, 4, CAST(N'2016-08-20 13:19:40.687' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (79, 4, CAST(N'2016-08-20 13:46:14.160' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (80, 4, CAST(N'2016-09-04 11:36:08.007' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (81, 4, CAST(N'2016-09-04 11:36:35.937' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (82, 4, CAST(N'2016-09-04 11:36:59.650' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (83, 4, CAST(N'2016-09-04 11:38:17.580' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (84, 4, CAST(N'2016-09-04 20:14:05.723' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (85, 4, CAST(N'2016-09-08 13:52:39.673' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (86, 4, CAST(N'2016-09-08 13:52:54.070' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (87, 4, CAST(N'2016-09-08 13:55:54.607' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (88, 4, CAST(N'2016-09-08 13:56:16.537' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (89, 4, CAST(N'2016-09-08 13:56:36.693' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (90, 4, CAST(N'2016-09-08 13:57:36.787' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (91, 4, CAST(N'2016-09-27 14:27:21.983' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (92, 4, CAST(N'2016-09-27 17:10:51.757' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (93, 4, CAST(N'2016-09-27 18:09:08.687' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (94, 4, CAST(N'2016-10-06 15:29:13.050' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (95, 4, CAST(N'2016-10-06 15:29:34.490' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (96, 4, CAST(N'2016-11-12 14:38:24.483' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (97, 4, CAST(N'2016-11-12 14:39:58.563' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (98, 4, CAST(N'2016-11-12 14:41:07.370' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (99, 4, CAST(N'2016-11-12 14:41:11.357' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (100, 4, CAST(N'2016-11-12 14:41:16.693' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (101, 4, CAST(N'2016-11-12 14:41:16.717' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (102, 4, CAST(N'2016-11-12 14:41:16.727' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (103, 4, CAST(N'2016-11-12 14:41:16.740' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (104, 4, CAST(N'2016-11-12 15:09:49.137' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (105, 4, CAST(N'2016-11-12 15:09:49.223' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (106, 4, CAST(N'2016-11-12 15:09:49.233' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (107, 4, CAST(N'2016-11-12 15:09:49.240' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (108, 4, CAST(N'2016-11-12 15:09:49.247' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (109, 4, CAST(N'2016-11-12 15:09:49.253' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (110, 4, CAST(N'2016-12-07 14:48:17.377' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (111, 4, CAST(N'2016-12-07 14:49:10.757' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (112, 4, CAST(N'2016-12-07 14:49:41.393' AS DateTime))
GO
INSERT [Assets] ([ID], [CreatedBy], [CreatedOn]) VALUES (113, 4, CAST(N'2016-12-07 17:30:25.237' AS DateTime))
GO
SET IDENTITY_INSERT [Assets] OFF
GO
INSERT [Bocce] ([AssetID], [Message], [Deleted]) VALUES (113, N'Open all day today.
Thanks,
Steve', 0)
GO
INSERT [Carousel] ([AssetID], [Title], [Lead], [Description], [Image], [Label], [Link], [Left], [Display], [Enabled], [Deleted]) VALUES (13, N'Fall Volleyball League Registration', N'Register now to get 10% off our team price.', N'Need help finding a team or a player? No problem! Check out our <a class="red-link" href="/About/">player''s connection page</a> to connect with people looking.', N'/img/volleyball-molton.jpg', N'Register Now', N'/Volleyball/Indoor/Leagues', 0, 1, 1, 0)
GO
INSERT [Carousel] ([AssetID], [Title], [Lead], [Description], [Image], [Label], [Link], [Left], [Display], [Enabled], [Deleted]) VALUES (14, N'Beach Volleyball Coming This Summer!', N'', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
Nisi ut aliquip ex ea commodo consequat.', N'/img/volleyball-sunset.jpg', N'Learn More', N'/About/', 1, 2, 1, 0)
GO
INSERT [Carousel] ([AssetID], [Title], [Lead], [Description], [Image], [Label], [Link], [Left], [Display], [Enabled], [Deleted]) VALUES (15, N'test', NULL, N'test', N'test', N'test', N'test', 1, 2, 0, 0)
GO
INSERT [Clinics] ([AssetID], [SportID], [Name], [Description], [StartDate], [EndDate], [Deadline], [Cost], [UserID], [EZRegister], [Link], [Enabled], [Deleted]) VALUES (78, 16, N'Test VB Clinic', N'Here is the desc.
Next line.

Next P.', CAST(N'2016-08-24 00:00:00.000' AS DateTime), CAST(N'2016-08-31 00:00:00.000' AS DateTime), CAST(N'2016-08-17 00:00:00.000' AS DateTime), 250, 27, N'http://www.google.com', N'http://www.google.com', 1, 1)
GO
INSERT [Clinics] ([AssetID], [SportID], [Name], [Description], [StartDate], [EndDate], [Deadline], [Cost], [UserID], [EZRegister], [Link], [Enabled], [Deleted]) VALUES (91, 16, N'K thru 2nd Grade Volleyball Skills Mini Camp', N'

These Classes Will Run Tuesday Evenings From 5:30-6:30pm', CAST(N'2016-09-27 00:00:00.000' AS DateTime), CAST(N'2016-11-15 00:00:00.000' AS DateTime), CAST(N'2016-09-25 00:00:00.000' AS DateTime), 90, 27, N'https://tms.ezfacility.com/OnlineRegistrations/Register.aspx?CompanyID=5325&GroupID=1611110', N'', 1, 0)
GO
SET IDENTITY_INSERT [EventLog] ON 

GO
INSERT [EventLog] ([ID], [Event], [Message], [Error], [Debug], [Created]) VALUES (1, N'Email', N'Sending New Lesson Registration To [healy@sitesteam.com;steve.healy21@gmail.com] Cc = [], Bcc = []', 0, 0, CAST(N'2016-06-16 14:44:14.617' AS DateTime))
GO
INSERT [EventLog] ([ID], [Event], [Message], [Error], [Debug], [Created]) VALUES (2, N'Email', N'New Lesson Registration Sent.', 0, 0, CAST(N'2016-06-16 14:45:09.987' AS DateTime))
GO
INSERT [EventLog] ([ID], [Event], [Message], [Error], [Debug], [Created]) VALUES (3, N'Email', N'Sending New Lesson Registration To [healy@sitesteam.com;steve.healy21@gmail.com] Cc = [], Bcc = []', 0, 0, CAST(N'2016-06-16 14:47:02.480' AS DateTime))
GO
INSERT [EventLog] ([ID], [Event], [Message], [Error], [Debug], [Created]) VALUES (4, N'Email', N'New Lesson Registration Sent.', 0, 0, CAST(N'2016-06-16 14:47:49.583' AS DateTime))
GO
INSERT [EventLog] ([ID], [Event], [Message], [Error], [Debug], [Created]) VALUES (5, N'Email', N'Sending Host an Event Registration To [steve.healy21@gmail.com;healy@sitesteam.com] Cc = [], Bcc = []', 0, 0, CAST(N'2016-06-20 14:04:53.703' AS DateTime))
GO
INSERT [EventLog] ([ID], [Event], [Message], [Error], [Debug], [Created]) VALUES (6, N'Email', N'Host an Event Registration Sent.', 0, 0, CAST(N'2016-06-20 14:04:54.647' AS DateTime))
GO
INSERT [EventLog] ([ID], [Event], [Message], [Error], [Debug], [Created]) VALUES (7, N'Email', N'Sending Host an Event Registration To [steve.healy21@gmail.com;healy@sitesteam.com] Cc = [], Bcc = []', 0, 0, CAST(N'2016-06-20 14:06:28.783' AS DateTime))
GO
INSERT [EventLog] ([ID], [Event], [Message], [Error], [Debug], [Created]) VALUES (8, N'Email', N'Host an Event Registration Sent.', 0, 0, CAST(N'2016-06-20 14:06:29.447' AS DateTime))
GO
INSERT [EventLog] ([ID], [Event], [Message], [Error], [Debug], [Created]) VALUES (9, N'Email', N'Sending Host an Event Registration To [steve.healy21@gmail.com;healy@sitesteam.com] Cc = [], Bcc = []', 0, 0, CAST(N'2016-06-20 14:07:35.567' AS DateTime))
GO
INSERT [EventLog] ([ID], [Event], [Message], [Error], [Debug], [Created]) VALUES (10, N'Email', N'Host an Event Registration Sent.', 0, 0, CAST(N'2016-06-20 14:07:36.320' AS DateTime))
GO
INSERT [EventLog] ([ID], [Event], [Message], [Error], [Debug], [Created]) VALUES (11, N'Forgot', N'Sending Forgot Password To [healy@sitesteam.com]', 0, 0, CAST(N'2016-06-30 16:14:28.153' AS DateTime))
GO
INSERT [EventLog] ([ID], [Event], [Message], [Error], [Debug], [Created]) VALUES (12, N'Forgot', N'Forgot Password Sent.', 0, 0, CAST(N'2016-06-30 16:14:29.063' AS DateTime))
GO
INSERT [EventLog] ([ID], [Event], [Message], [Error], [Debug], [Created]) VALUES (13, N'Forgot', N'Sending Forgot Password To [healy@sitesteam.com]', 0, 0, CAST(N'2016-06-30 16:17:37.490' AS DateTime))
GO
INSERT [EventLog] ([ID], [Event], [Message], [Error], [Debug], [Created]) VALUES (14, N'Forgot', N'Forgot Password Sent.', 0, 0, CAST(N'2016-06-30 16:17:38.130' AS DateTime))
GO
INSERT [EventLog] ([ID], [Event], [Message], [Error], [Debug], [Created]) VALUES (15, N'Email', N'Sending Contact Us Form To [healy@sitesteam.com] Cc = [], Bcc = []', 0, 0, CAST(N'2016-07-14 15:26:16.360' AS DateTime))
GO
INSERT [EventLog] ([ID], [Event], [Message], [Error], [Debug], [Created]) VALUES (16, N'Email', N'Contact Us Form Sent.', 0, 0, CAST(N'2016-07-14 15:26:17.153' AS DateTime))
GO
SET IDENTITY_INSERT [EventLog] OFF
GO
INSERT [EventRegistration] ([AssetID], [SportID], [First], [Last], [Email], [Phone], [StartDate], [Description], [Website], [Submitted], [Scheduled], [Deleted]) VALUES (49, 16, N'Steve', N'Healy', N'steve@yahoo.coms', N'216', CAST(N'2016-06-22 12:45:00.000' AS DateTime), N'', N'', CAST(N'2016-06-20 14:04:53.593' AS DateTime), CAST(N'1753-01-01 00:00:00.000' AS DateTime), 0)
GO
INSERT [EventRegistration] ([AssetID], [SportID], [First], [Last], [Email], [Phone], [StartDate], [Description], [Website], [Submitted], [Scheduled], [Deleted]) VALUES (50, 16, N'Jim', N'Smith', N'jim@aol.com', N'2161234567', CAST(N'2016-05-01 21:00:00.000' AS DateTime), N'Just an event', N'http://www.google.com', CAST(N'2016-05-01 21:00:00.000' AS DateTime), CAST(N'1753-01-01 00:00:00.000' AS DateTime), 0)
GO
INSERT [EventRegistration] ([AssetID], [SportID], [First], [Last], [Email], [Phone], [StartDate], [Description], [Website], [Submitted], [Scheduled], [Deleted]) VALUES (51, 16, N'MAtt', N'John', N'jim@aol.com', N'214578956', CAST(N'2016-07-04 21:00:00.000' AS DateTime), N'', N'', CAST(N'2016-06-20 14:07:35.500' AS DateTime), CAST(N'2016-07-07 00:00:00.000' AS DateTime), 0)
GO
INSERT [EventRegistration] ([AssetID], [SportID], [First], [Last], [Email], [Phone], [StartDate], [Description], [Website], [Submitted], [Scheduled], [Deleted]) VALUES (77, 0, N'Tony', N'Santilla', N'theboss@yahoo.com', N'2168745210', CAST(N'2016-12-21 17:00:00.000' AS DateTime), N'We are hoping to have a nice birthday party for my niece.
Thanks,
Steve', N'http://www.sitesteam.com', CAST(N'2016-07-07 19:21:42.120' AS DateTime), CAST(N'1753-01-01 00:00:00.000' AS DateTime), 0)
GO
INSERT [Events] ([AssetID], [Title], [Description], [StartDate], [UserID], [Link], [Enabled], [Deleted]) VALUES (24, N'Big Event coming soon!', N'Here is the big event

To be announced later.', CAST(N'2016-08-20 04:00:00.000' AS DateTime), 4, NULL, 1, 0)
GO
INSERT [Events] ([AssetID], [Title], [Description], [StartDate], [UserID], [Link], [Enabled], [Deleted]) VALUES (63, N'SEcond event', N'Here it is.

Dang.', CAST(N'2016-07-20 04:00:00.000' AS DateTime), 27, N'http://www.yahoo.com', 1, 0)
GO
INSERT [Events] ([AssetID], [Title], [Description], [StartDate], [UserID], [Link], [Enabled], [Deleted]) VALUES (64, N'Missed', N'HJerwereafd

asfdsa
fsdaf', CAST(N'2016-05-31 04:00:00.000' AS DateTime), 4, N'', 1, 0)
GO
INSERT [Events] ([AssetID], [Title], [Description], [StartDate], [UserID], [Link], [Enabled], [Deleted]) VALUES (65, N'Missed agba', N'dsfsfa
sdaf sd
afsa
f', CAST(N'2016-04-06 04:00:00.000' AS DateTime), 4, N'sdfsad', 1, 0)
GO
SET IDENTITY_INSERT [Keys] ON 

GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100000, N'9L2AU7FHP4Z8B16MGA52O7RU2UBDGVFB54QV08Z1WK1U46NTME', CAST(N'2016-06-09 21:41:38.147' AS DateTime), NULL)
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100003, N'O2ZLJPTTBK8KXYY9V1SZV59D91H4R8F2MPZTCOA6E0B0Z8VW72', CAST(N'2016-06-09 21:42:21.680' AS DateTime), CAST(N'2016-06-09 21:42:23.370' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100006, N'LCN81JM3GZMZ6HBZQ41SEWGS2OD1ALBD6LP2ZAA2BTIK82MBES', CAST(N'2016-06-09 21:49:36.407' AS DateTime), CAST(N'2016-06-09 21:49:36.423' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100009, N'C659XOXSN4MSIBQE5UFVW42HTBO7Z3GOIWKS7ZVP3U9NBLA3GR', CAST(N'2016-06-09 21:55:27.983' AS DateTime), CAST(N'2016-06-09 21:55:28.587' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100012, N'VQ91G19BDTSLAE4OESD9CTK09WYVC9KQXIC32DVKHKFCCOLC1C', CAST(N'2016-06-09 21:57:26.143' AS DateTime), CAST(N'2016-06-09 21:57:26.163' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100015, N'EALHOU3X1BY99F5HOY511RTV1I5PSEV66PII5SYWCGZBO6GZ13', CAST(N'2016-06-09 21:58:35.967' AS DateTime), CAST(N'2016-06-09 21:58:35.980' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100018, N'274SDAZCTG2GLCQZH1RVAY7AIHS1P5WJF4HKG2N42WT17FCSBH', CAST(N'2016-06-09 21:59:08.567' AS DateTime), CAST(N'2016-06-09 21:59:08.577' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100021, N'DFA3DW70OFNPWMQEW59NJ6QUB6JFR2TWJRWPM4QQ43ITUQQAYV', CAST(N'2016-06-09 21:59:15.487' AS DateTime), CAST(N'2016-06-09 21:59:15.497' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100024, N'RNJ1H3JWODZPEPZZK5QUH1M2YER203QSIODVOS6GBKW3HMH6JE', CAST(N'2016-06-09 21:59:31.763' AS DateTime), CAST(N'2016-06-09 21:59:31.773' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100027, N'R1UI72WCLO6010263FQ302JH4ROHXBS2MBLQ4HOON2K5OH0VTA', CAST(N'2016-06-09 21:59:56.953' AS DateTime), CAST(N'2016-06-09 21:59:56.963' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100030, N'5ZYPN8IEH2MB9FES221LYWCGA96BAVYFJCXP65LG2YFC20RXDU', CAST(N'2016-06-09 22:00:24.597' AS DateTime), CAST(N'2016-06-09 22:00:24.607' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100033, N'PJ7VTDDN16R3JSSWI4F56TBFZT0QB579OYI35UWQL663T4H9LY', CAST(N'2016-06-09 22:00:38.990' AS DateTime), CAST(N'2016-06-09 22:00:39.000' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100036, N'JNCY8LZPI55LGOSRN3ZMLN9DWHDEOHVDPGM203M1IAE6PPS12N', CAST(N'2016-06-09 22:00:50.017' AS DateTime), CAST(N'2016-06-09 22:00:50.027' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100039, N'LV4SBPBDJ2LH700GR19FTQUQ21L0RTY752Z4DYRR3SNOFINGS6', CAST(N'2016-06-09 22:01:13.847' AS DateTime), CAST(N'2016-06-09 22:01:13.853' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100042, N'1PRF1FKA42LFJ0TVJO9A48U0QH5LNODMBDJD0P0JDBD4NZKI87', CAST(N'2016-06-09 22:01:24.190' AS DateTime), CAST(N'2016-06-09 22:01:24.200' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100045, N'C4BPSWLGZP28JU3E73O51ZBLCTM44P1E9J74N2TGJFJ5UKN60M', CAST(N'2016-06-09 22:02:53.350' AS DateTime), CAST(N'2016-06-09 22:02:53.363' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100048, N'VQUTKA93B7WPLHPNECDFWNF19MY7FGV4M8QIHMARCI4NI581TV', CAST(N'2016-06-11 16:09:41.527' AS DateTime), CAST(N'2016-06-11 16:09:42.343' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100051, N'VPMQNTGDCB7DBDMTBBCMMGD7ZYU0O5I4XQEU0PA5K6TRWXT2GF', CAST(N'2016-06-11 16:10:20.270' AS DateTime), CAST(N'2016-06-11 16:10:20.280' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100054, N'NMB221GMV2IX2XOOTNUPIOBUQ95RJF55Z1S6YBU13B4SQAWONR', CAST(N'2016-06-11 16:14:44.897' AS DateTime), CAST(N'2016-06-11 16:14:44.913' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100057, N'V6FH7D1WW91KZZRBJX81CXE5SSR1AVUBC9FXCDQ6ZIXP46B3MR', CAST(N'2016-06-11 16:16:24.510' AS DateTime), CAST(N'2016-06-11 16:16:24.517' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100060, N'YWD05UN8ZHYSA9NDEVH09L5OI7PTSXPBACL2A6PECLTV4LRC74', CAST(N'2016-06-13 13:48:09.893' AS DateTime), CAST(N'2016-06-13 13:48:11.127' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100063, N'SXWPJE3JOBKLZFYDY2ZL2KZ3D5XQB7MMKY9R1MBG1T32LTVO1C', CAST(N'2016-06-13 14:15:56.533' AS DateTime), CAST(N'2016-06-13 14:15:57.037' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100066, N'R5JRHDRZIU8PX0OC3OJRZTU36XIKPPZQ0GY2X4SX33MJVIY4XY', CAST(N'2016-06-13 14:26:50.133' AS DateTime), CAST(N'2016-06-13 14:26:50.663' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100069, N'PBSSDLICD10FN8V5PK1T2LOSNYF7NUG4RUTKKI1RVJTXSCX0IH', CAST(N'2016-06-13 14:31:06.230' AS DateTime), CAST(N'2016-06-13 14:31:06.240' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100072, N'7G2NGPZNII5PJV5NZAWHDZ7MXWL8U0SSJAV1Z57CG0XQ1RD6HA', CAST(N'2016-06-13 14:34:57.950' AS DateTime), CAST(N'2016-06-13 14:34:57.967' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100075, N'3PT1GQ8CBERC2VB2SLM1ZAJU6ZKOTFVDZWBDSF4JE11U0179DF', CAST(N'2016-06-13 14:40:19.547' AS DateTime), CAST(N'2016-06-13 14:40:19.557' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100078, N'N7PJ8LS4XDHC1T8AGLAX2X9QHV6XOGKFQMMWDWLOS4GKP3FM49', CAST(N'2016-06-13 14:40:47.027' AS DateTime), CAST(N'2016-06-13 14:40:47.033' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100081, N'45B3GDSF89WCDQJBPJ77STBXMJIMS13H0UZHLL1VFQUAF3JQWC', CAST(N'2016-06-13 14:40:57.883' AS DateTime), CAST(N'2016-06-13 14:40:57.890' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100084, N'2WKAFV1M55B90OMSR54CS6EEGODYSH1ZFDXAF2RVCWXHDJKV3H', CAST(N'2016-06-13 14:41:19.080' AS DateTime), CAST(N'2016-06-13 14:41:19.087' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100087, N'7W15KOURMBKCKNNHC4A8JIHGGE46VL6KZC3GHOPRHI9JC0CQ5M', CAST(N'2016-06-13 14:41:54.170' AS DateTime), CAST(N'2016-06-13 14:41:54.177' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100090, N'0WWHTDYWWQE0UUTPNPG6FMGZ2DX3H7AT8YN1QPLXG3SKFG59GM', CAST(N'2016-06-13 14:42:23.967' AS DateTime), CAST(N'2016-06-13 14:42:23.973' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100093, N'C2QZCOQ47RLAY4P5Y2MR52BNUF1BGQUXHOU3FCG9NFBA0UIU58', CAST(N'2016-06-13 14:43:02.687' AS DateTime), CAST(N'2016-06-13 14:43:02.693' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100096, N'B10R2CEW28BSZK118CV0UADM5T49OB3Y2ITY02862VFWNQUCGO', CAST(N'2016-06-13 14:43:44.390' AS DateTime), CAST(N'2016-06-13 14:43:44.400' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100099, N'7DX6XGCDKKADGHN1XFFCQYDK89PSIUN2LJQFC4CDYZ2OKE9YE5', CAST(N'2016-06-13 14:45:56.187' AS DateTime), CAST(N'2016-06-13 14:45:56.200' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100102, N'FWR3EPDCE4BUGSHRVPR6KFN386BG7E4A9IQYSI8T1GDQWI4NKJ', CAST(N'2016-06-13 14:46:05.360' AS DateTime), CAST(N'2016-06-13 14:46:05.363' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100105, N'WCYVJ07ZTVIZ1QPLIA38C0L4UV4AZX9IF9VR242EY32LMGAOR7', CAST(N'2016-06-13 14:46:22.660' AS DateTime), CAST(N'2016-06-13 14:46:22.667' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100108, N'6XPEZNWZIS48KISXLFNKMZF93MR53VHTD76R18MEAL6DF8NT19', CAST(N'2016-06-13 14:46:51.453' AS DateTime), CAST(N'2016-06-13 14:46:51.457' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100111, N'MOUOSVRLKFWJ2GGGQTSBR4A7M3MGH5CIUCUKGLN4S32BR6CGDA', CAST(N'2016-06-13 14:47:52.957' AS DateTime), CAST(N'2016-06-13 14:47:53.203' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100114, N'RGPB36NIAN8BYICAQHOH4UZX3OMYG828PSRKUWXDE1L9FIX1T3', CAST(N'2016-06-13 14:52:44.720' AS DateTime), CAST(N'2016-06-13 14:52:44.730' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100117, N'19SFLOYANBT5YGWSKGA6K8OZDS9DSH6CENCF1XZCANBZ08Q4PO', CAST(N'2016-06-13 14:53:11.600' AS DateTime), CAST(N'2016-06-13 14:53:11.607' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100120, N'258WPNQT043KSZP7DYFJW7Q29OY0LU7AXR20EGHISOM5YIXOQC', CAST(N'2016-06-13 14:53:49.613' AS DateTime), CAST(N'2016-06-13 14:53:49.620' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100123, N'EON165MQKR0LD020JZJUFX9H7P5AKL013NGBTW8U16LTKRRKVD', CAST(N'2016-06-13 14:54:01.733' AS DateTime), CAST(N'2016-06-13 14:54:01.737' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100126, N'S482OE0BB3KKROT1AHMJIJTGWU9VC0MKZACY11MZOOGKMLC8X0', CAST(N'2016-06-13 14:55:07.970' AS DateTime), CAST(N'2016-06-13 14:55:07.980' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100129, N'ZXKLD7DAQRMD35C1AWT5AR4TCHGC7078ABBHCIX3DV55LIZUVG', CAST(N'2016-06-13 14:56:04.060' AS DateTime), CAST(N'2016-06-13 14:56:04.073' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100132, N'0ZXLHW9MY13C9PBPGW8LPOS5KRE6J9LCYOB6TT2WL4ZSTNVHYN', CAST(N'2016-06-13 14:56:30.073' AS DateTime), CAST(N'2016-06-13 14:56:30.080' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100135, N'HGABRA7N9DHEAEEH8B5422A7L4PB53WU5FU7JAYF2P5IR8HWF8', CAST(N'2016-06-13 14:56:51.163' AS DateTime), CAST(N'2016-06-13 14:56:51.173' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100138, N'PS0Q4RZECW4FHX80NAMD8SFHU0KHGGULO57DF25AU0H7LV6587', CAST(N'2016-06-13 14:57:08.547' AS DateTime), CAST(N'2016-06-13 14:57:08.560' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100141, N'FD3JW047V3V9I8QST2H0PS4FKWTCO9L98N61WSLQEPR2EDPAGA', CAST(N'2016-06-13 14:57:26.233' AS DateTime), CAST(N'2016-06-13 14:57:26.240' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100144, N'KCWTVVQ4YV0VURBL113G94HL8MTGFE4LBW58X8JF71UFN04Q96', CAST(N'2016-06-13 14:57:51.413' AS DateTime), CAST(N'2016-06-13 14:57:51.417' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100147, N'KHHU23DHNQ0TENIGK6I7WG9CE916Y4WIZKK9G9GQMWDSDQBZ33', CAST(N'2016-06-13 14:58:05.293' AS DateTime), CAST(N'2016-06-13 14:58:05.300' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100150, N'AV7F1I57J9JI1Z0C1YHY9XEV0FIIMXWZM47J0Z9DXNXBO59QLY', CAST(N'2016-06-13 14:58:34.497' AS DateTime), CAST(N'2016-06-13 14:58:34.503' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100153, N'IE1CIS65DTK01AU2Z7SS2EPF0C56BHD8B383GD5TZ47D093FQC', CAST(N'2016-06-13 14:58:43.677' AS DateTime), CAST(N'2016-06-13 14:58:43.683' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100156, N'69WPS8MOQHUA2LKFCGOP3P3F9OUB9YMQAU1NGLXP33WRKVT8W6', CAST(N'2016-06-13 14:58:56.750' AS DateTime), CAST(N'2016-06-13 14:58:56.927' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100159, N'QTJGU12JGTPMFBIXWPAAPLF68VGIY733AVN7NOGNIEKJ9ALNA7', CAST(N'2016-06-13 14:59:27.543' AS DateTime), CAST(N'2016-06-13 14:59:27.550' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100162, N'OHF73FY9GI8BMCC998J3A71ABKTHUNBSWWLEVL8XYFFTBFXEJV', CAST(N'2016-06-13 15:02:45.670' AS DateTime), CAST(N'2016-06-13 15:02:45.690' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100165, N'ZJUEYDRUNR6A2M1015LBMVR9PX7ZMJ48NCAW0PFLUG9CNTOPZX', CAST(N'2016-06-13 15:03:17.477' AS DateTime), CAST(N'2016-06-13 15:03:17.493' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100168, N'JF1K3L2XVD5MNFX3BOBP6NF0DS19MNVEB5JW1OBHWF1POXCH6Z', CAST(N'2016-06-13 15:05:07.957' AS DateTime), CAST(N'2016-06-13 15:05:11.733' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100171, N'LBG8VZ8CVJI1GJN66GJCFRIIGB1JOVX7NP02E3Q7QUZFRFFRD1', CAST(N'2016-06-13 15:06:43.780' AS DateTime), CAST(N'2016-06-13 15:06:44.313' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100174, N'7LSYB35560VCH057LBZN4TV4VM6JGV5EMUOPFCSZUR0NO0U27X', CAST(N'2016-06-13 15:11:24.483' AS DateTime), CAST(N'2016-06-13 15:11:24.907' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100177, N'I02Y2W1VHDX1IN1HLZE9YXKDMZ025VM3P7HT6VIQJJBEYZ8QC4', CAST(N'2016-06-13 15:12:21.007' AS DateTime), CAST(N'2016-06-13 15:12:21.017' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100180, N'CHMICQXG0G7HEQCENG6LB1YYFJCM9F28M84DF5PX6B822SAH6E', CAST(N'2016-06-13 15:18:13.423' AS DateTime), CAST(N'2016-06-13 15:18:13.827' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100183, N'YEGG3VQEJP89R4PDWWD7ZXXAI0IUI1JALCDQY5Y1MGSNEPHA3O', CAST(N'2016-06-13 15:18:13.977' AS DateTime), CAST(N'2016-06-13 15:18:13.983' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100186, N'TUN3SQ5284NG01RJZ6M07JG0VWMUOFU3UCD4TIO61LXAS75QFL', CAST(N'2016-06-13 15:18:30.103' AS DateTime), CAST(N'2016-06-13 15:18:30.240' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100189, N'MA22NB21ZQOU78G03E8TJGX6EM8YAQL3TEHBK0SQRNP3YOR5VQ', CAST(N'2016-06-13 15:18:30.373' AS DateTime), CAST(N'2016-06-13 15:18:30.380' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100192, N'TBIKR33273EHOX1HYST5ZR7MNU39U0I3IH9SDP8WNX7K22X0Z7', CAST(N'2016-06-13 15:20:10.137' AS DateTime), CAST(N'2016-06-13 15:20:10.150' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100195, N'8KLBNH7XBUQG8VC80KRY2H844PEYCDCSLZQARYQ9SRICJXFFD5', CAST(N'2016-06-13 15:20:10.363' AS DateTime), CAST(N'2016-06-13 15:20:10.377' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100198, N'9GE1YQ08IQP8BN7AIBFJIS7RGM4QNOSWQ1S69T5F4R7W9GAFYV', CAST(N'2016-06-13 15:20:25.670' AS DateTime), CAST(N'2016-06-13 15:20:25.680' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100201, N'B0ADL4Y3NL9PU9B2U6X5HLJOD7NIQ6QDC4OZE6WPY5DVA8CLSP', CAST(N'2016-06-13 15:20:25.873' AS DateTime), CAST(N'2016-06-13 15:20:25.883' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100204, N'PNK2Q9IIN8YCFGN3VPD9HQX6U3TIRMGUOZO0I5XGIBO94B68AA', CAST(N'2016-06-13 15:21:10.673' AS DateTime), CAST(N'2016-06-13 15:21:10.677' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100207, N'NMRBYIC75F9GC6Y6PABHZHC9I6J2UEPJIQQQTFLC7L1LLB9YXP', CAST(N'2016-06-13 15:21:10.780' AS DateTime), CAST(N'2016-06-13 15:21:10.783' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100210, N'08AQTO1J2OSRIJAXWKSXGD5VBRO31NNPLAFQBRKBPK3YF1JJT3', CAST(N'2016-06-13 15:21:52.243' AS DateTime), CAST(N'2016-06-13 15:21:52.250' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100213, N'2S62G3ZE6JC925DP8FAJF6GS8C7V34L67DBJG4BKKZ8XGTLQNX', CAST(N'2016-06-13 15:21:52.443' AS DateTime), CAST(N'2016-06-13 15:21:52.450' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100216, N'JJDJ583PD9929GIXED1CZLOZP1AHYE8HUPTYCUZIDXL3W8WM24', CAST(N'2016-06-13 15:22:08.660' AS DateTime), CAST(N'2016-06-13 15:22:08.667' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100219, N'7WXNTF9FT9557T70OSUYQ6I9IQIUWYAMJ8125X4LM4919EVUUR', CAST(N'2016-06-13 15:22:08.790' AS DateTime), CAST(N'2016-06-13 15:22:08.793' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100222, N'KJCPS0WP3SH9TR2GB4XOO92LX0I84H71S19O6D2C8PXZE6XSAV', CAST(N'2016-06-13 15:22:21.433' AS DateTime), CAST(N'2016-06-13 15:22:21.443' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100225, N'0AK9FLNNWIP50MJYQE39W9U6WGCFBW1UCOS6OYGTNBJY4J2Y6W', CAST(N'2016-06-13 15:22:21.700' AS DateTime), CAST(N'2016-06-13 15:22:21.713' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100228, N'OTB43RGZ59VU9NF8UQRE6UILERQDA8GP3Y3ZWQL5HEBVD6LZ8F', CAST(N'2016-06-13 15:22:58.400' AS DateTime), CAST(N'2016-06-13 15:22:58.403' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100231, N'6LDFJ3C9GSTMISMNFGZTW4V3O3U1DV1TUVKQ41BQ8QKJMKNFG1', CAST(N'2016-06-13 15:22:58.553' AS DateTime), CAST(N'2016-06-13 15:22:58.560' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100234, N'D5U5TJ0308GU8FR0WS679USHPP75WMBCV6A12Y0P3XQ0FEPYJ8', CAST(N'2016-06-13 15:23:14.487' AS DateTime), CAST(N'2016-06-13 15:23:14.497' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100237, N'948O81OGZM213UC6JY2M8BMN2XM737SRJNEHNJCHGHGODDVDT2', CAST(N'2016-06-13 15:23:14.700' AS DateTime), CAST(N'2016-06-13 15:23:14.707' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100240, N'RDPSRGB8433II9YZVJ273DQ5WXDNMOS185FV0AIFGFPWA2SGKR', CAST(N'2016-06-13 15:23:53.450' AS DateTime), CAST(N'2016-06-13 15:23:53.457' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100243, N'WGKOYT1GGQ8TR3YEQCVEPPE1MYQEBFHXJOBXZPIWXBTQ3CFN89', CAST(N'2016-06-13 15:23:53.590' AS DateTime), CAST(N'2016-06-13 15:23:53.597' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100246, N'GH7HHTX24AKMU1KXX8DYXWOOI3Y1N7S3X8RCN9F3CRRWJI2CAR', CAST(N'2016-06-13 15:26:30.097' AS DateTime), CAST(N'2016-06-13 15:26:30.140' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100249, N'G0A3CGPLPBF7BCYS2OTSEGFO3R7CTHZ9E1PU3WU9UFA71978SZ', CAST(N'2016-06-13 15:26:30.403' AS DateTime), CAST(N'2016-06-13 15:26:30.450' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100252, N'6E9E0XL7HITLKWFDO6UU7OYC1NOQM27GS9151ZL24YLPCBKXNN', CAST(N'2016-06-13 15:26:56.307' AS DateTime), CAST(N'2016-06-13 15:26:56.327' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100255, N'5F764DSNELS9FAMII31TJYX94QDJ3BEIRYXOD954BVSTLK23NT', CAST(N'2016-06-13 15:26:56.567' AS DateTime), CAST(N'2016-06-13 15:26:56.577' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100258, N'8U0LYMJVC2IQK42MUPNRHVG3RJTRFTTVDUCRHFCREM2Q0T8WGN', CAST(N'2016-06-13 15:27:40.913' AS DateTime), CAST(N'2016-06-13 15:27:40.923' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100261, N'BW2QD83S5WY4QND4I2D6KYJ36OW17CQGH3AJR4Z4KTJXB3YSSK', CAST(N'2016-06-13 15:27:41.177' AS DateTime), CAST(N'2016-06-13 15:27:41.183' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100264, N'GMRX6PXBR5C8G2J4BHJEKOM4AV2B2BZCBB8WDG128UX7MA2HE4', CAST(N'2016-06-13 15:37:03.717' AS DateTime), CAST(N'2016-06-13 15:37:04.483' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100267, N'Z1VQZQDHDMKO8HL0IY506URJN48EKZV9LYHIMDD8VXCFWYHWF1', CAST(N'2016-06-13 15:37:04.683' AS DateTime), CAST(N'2016-06-13 15:37:04.690' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100270, N'HW1AZA8T6CUFFFQNTXN08SU1NGAQ2NVG07NEOQL6C15UI9NVJ6', CAST(N'2016-06-13 16:04:19.000' AS DateTime), CAST(N'2016-06-13 16:04:19.653' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100273, N'CZL053I8CT5S9H3HRYF03D56617FNRP9MBNW5KS9QZW4GR41SG', CAST(N'2016-06-13 16:04:19.847' AS DateTime), CAST(N'2016-06-13 16:04:19.853' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100276, N'PORFD3O9BQYA9SAHHVV78AUSQBYC2NMG1Q8KEHJC1F1XWUKBCK', CAST(N'2016-06-13 16:04:19.860' AS DateTime), CAST(N'2016-06-13 16:04:19.870' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100279, N'RWB3C0JV6DOJ3B1PI577EXK7O3YWT78DLLN488E9SS7D5RTU3L', CAST(N'2016-06-13 16:10:06.640' AS DateTime), CAST(N'2016-06-13 16:10:07.620' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100282, N'8VPR7YM8V41NARTJOM7TYDUO942UMXK66SWY81UGMUI9D6HU96', CAST(N'2016-06-13 16:10:08.047' AS DateTime), CAST(N'2016-06-13 16:10:08.057' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100285, N'I0GLN9NKH6726O4KIRZ6DJTCPWW818Y9MXZYD7N5291MN0MSJT', CAST(N'2016-06-13 16:10:53.353' AS DateTime), CAST(N'2016-06-13 16:10:53.363' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100288, N'PN7SI0BNWNWVZ48SPE9ZYOS5BISRSGLMJJQTHYDXEKAFI2B515', CAST(N'2016-06-13 16:10:53.700' AS DateTime), CAST(N'2016-06-13 16:10:53.727' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100291, N'FO2ML5K3LW5NFDTB3Z2917L9JDYXMXY5RAKCMLH7D6QGI6H3TI', CAST(N'2016-06-13 16:11:43.240' AS DateTime), CAST(N'2016-06-13 16:11:44.000' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100294, N'X3DPMGUXPKO64H7A40M2445QKQTJ8D3SVNVO6SH8PKI18U07IU', CAST(N'2016-06-13 16:11:44.327' AS DateTime), CAST(N'2016-06-13 16:11:44.333' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100297, N'GCGI0RF5CRL2RCRDOJUKHPF5EMU5ZJJOW2SKZPVDPJFPQLB65B', CAST(N'2016-06-13 16:13:46.747' AS DateTime), CAST(N'2016-06-13 16:13:46.770' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100300, N'7R2R3L6TLLXJV9QXMCFKADCEMG5SPNIFQUZG1HNT4VKUD1ZA8V', CAST(N'2016-06-13 16:13:47.147' AS DateTime), CAST(N'2016-06-13 16:13:47.157' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100303, N'MD6ZGU1RRANME48BTQSBPZ1PO8PU7UUF7HQTM5120Z9UMIRDB5', CAST(N'2016-06-13 16:15:20.023' AS DateTime), CAST(N'2016-06-13 16:15:20.037' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100306, N'KWGUIQNYUJTBT5X8SR6CN97SY0NPHW9BI1Q2C1548Y5HL90ZGT', CAST(N'2016-06-13 16:15:20.447' AS DateTime), CAST(N'2016-06-13 16:15:20.457' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100309, N'WY2RLC2IVKGRSNEAG6UDPIB0E6EIO1YKTYVD0ZC4820V9K67EI', CAST(N'2016-06-13 16:21:01.837' AS DateTime), CAST(N'2016-06-13 16:21:02.590' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100312, N'LG0GMQ8WSOTISWHNIF87X04BGHXCVGJDE4018ANRD2JYCJ9S4X', CAST(N'2016-06-13 16:21:02.957' AS DateTime), CAST(N'2016-06-13 16:21:02.977' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100315, N'XVR61LEMEK34Q947IIB6UHP6CG2I4FE9ZESQ79KT5ANPYDO4HJ', CAST(N'2016-06-13 16:21:33.370' AS DateTime), CAST(N'2016-06-13 16:21:33.397' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100318, N'2HPO3LXDB840GFIHJRJ7XD33M6OKZF9BQQMBMBZG5V9V9FG7NA', CAST(N'2016-06-13 16:21:33.817' AS DateTime), CAST(N'2016-06-13 16:21:33.833' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100321, N'LWLEZ6KSYTM5YQHKN6409C6NPRQGQST9CUJ9FABZ0ND7XWHNBR', CAST(N'2016-06-13 16:22:13.557' AS DateTime), CAST(N'2016-06-13 16:22:13.587' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100324, N'9T83I1J20VDSDELH21EEGHQW3475VM1LH7PWN0W6SIKHSTLQKN', CAST(N'2016-06-13 16:22:14.003' AS DateTime), CAST(N'2016-06-13 16:22:14.013' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100327, N'EGSAES121GOCVBX4E127E079XTR27PIGNL66YPEUY4R8ANQE6D', CAST(N'2016-06-13 16:22:37.167' AS DateTime), CAST(N'2016-06-13 16:22:37.187' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100330, N'PO9KPOUA3LMIANT13ZWEG82XRWHUWNUKEJS3XJ8YFJSOOHE9V4', CAST(N'2016-06-13 16:22:37.597' AS DateTime), CAST(N'2016-06-13 16:22:37.603' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100333, N'FP9Z9OKGQ3LRS7TN5LEIET1A3RS061FXAOKT0H6SSX7T5GN8RB', CAST(N'2016-06-13 16:23:52.783' AS DateTime), CAST(N'2016-06-13 16:23:52.797' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100336, N'MC064F9J6LAKLNWVB8OBZZ04PDOJXA198ACO48WJ48GMZIDL9N', CAST(N'2016-06-13 16:23:53.127' AS DateTime), CAST(N'2016-06-13 16:23:53.140' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100339, N'6GHUAK4AYKO88RPA8CN96MDPOLX0LZUTNCXVQ2HFSUJGFJO85H', CAST(N'2016-06-13 16:48:59.750' AS DateTime), CAST(N'2016-06-13 16:49:00.060' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100342, N'SDBT0PX8HTP0K539HSUVUIC1Q248ULBVNF6892QI8Z32QGV11R', CAST(N'2016-06-13 16:49:00.317' AS DateTime), CAST(N'2016-06-13 16:49:00.340' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100345, N'4C5PMVY0BEFNDUI76BCKVE13P06OX2CATM23737P2GTGR0OB71', CAST(N'2016-06-13 16:50:06.970' AS DateTime), CAST(N'2016-06-13 16:50:07.013' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100348, N'9Q9FA3CICOWRXFV0T0RAQAOUKE1AINWK5DXBGWUXQN86K8RWE5', CAST(N'2016-06-13 16:50:12.317' AS DateTime), CAST(N'2016-06-13 16:50:12.337' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100351, N'287T4ESIKAWER6DQUKL3OJN07GIHR28YLTJMSGV070IUVRDTTL', CAST(N'2016-06-13 16:50:51.507' AS DateTime), CAST(N'2016-06-13 16:50:51.807' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100354, N'PM6LMQ7JSIT2QHYGFI1IGPFETI87OQP432UZFTZ8YXDNF67C8Y', CAST(N'2016-06-13 16:50:52.107' AS DateTime), CAST(N'2016-06-13 16:50:52.120' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100357, N'EB023N1AXM55SADCW18OOLP6RRYOY0FUVRIOL717SWIP2JWBAH', CAST(N'2016-06-13 16:52:34.377' AS DateTime), CAST(N'2016-06-13 16:52:34.667' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100360, N'HX4SDXEQCHG4G51OQUFW77I5RLAAWTJLGUE0BJ3QGRH6ULR33M', CAST(N'2016-06-13 16:52:34.927' AS DateTime), CAST(N'2016-06-13 16:52:34.937' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100363, N'GATLARBS3P7MQYIO3W6B21ZYCNCQFR1D1J912WEP4UXBHXURV5', CAST(N'2016-06-13 16:53:22.460' AS DateTime), CAST(N'2016-06-13 16:53:23.577' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100366, N'M4X6M56ZXDCQHO6AVB9CHDVRAY8JV3EGTFSZZ5U2IU7DB05OAF', CAST(N'2016-06-13 16:53:24.050' AS DateTime), CAST(N'2016-06-13 16:53:24.060' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100369, N'WCJVR3MX79S6E1WRBKX2P0J302VKVWYUBGWD2RGWJBW1OSXEVC', CAST(N'2016-06-13 16:53:37.377' AS DateTime), CAST(N'2016-06-13 16:53:37.403' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100372, N'0PWC5D4B463ZJS8B20D41MKZ75Q8LAQTDVGKPY0B5A2QHMFXF9', CAST(N'2016-06-13 16:53:39.397' AS DateTime), CAST(N'2016-06-13 16:53:39.423' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100375, N'7S0VNL8WDZXLAP16MJ55CEE86RABH0M6AYELFJ2CAN0CUNN063', CAST(N'2016-06-13 16:55:22.737' AS DateTime), CAST(N'2016-06-13 16:55:22.793' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100378, N'6C3GI80FY1S6S0F0RZLYSY58RFJNOATCRSC4V5HISCINCETWNC', CAST(N'2016-06-13 16:55:23.057' AS DateTime), CAST(N'2016-06-13 16:55:23.077' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100381, N'GF7CJ67P2G0ITK839TTC8ORBX8JR62GVSDKHWM8L3X8DAUNFP3', CAST(N'2016-06-13 16:56:33.883' AS DateTime), CAST(N'2016-06-13 16:56:33.920' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100384, N'DYH7M3TX5P668LX08U7D5ZWD60HMG4WR2XLQMJCMAW309LV0UQ', CAST(N'2016-06-13 16:56:34.293' AS DateTime), CAST(N'2016-06-13 16:56:34.307' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100387, N'JSQ8SICT74TLGCE7SK4XQPLV0DBO7BH3MVN5NLJP8Y2A2M9T55', CAST(N'2016-06-13 16:56:48.777' AS DateTime), CAST(N'2016-06-13 16:56:48.793' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100390, N'W008V5BDS2GNYZ01NXZXB60G5CBWSHKII36CC4PY12QFZHUY7I', CAST(N'2016-06-13 16:56:49.097' AS DateTime), CAST(N'2016-06-13 16:56:49.120' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100393, N'E0A48WXASCMKUXZ6W6IUR264CYCB45P27LP45A8UVW4RHGF9NN', CAST(N'2016-06-13 16:58:43.643' AS DateTime), CAST(N'2016-06-13 16:58:43.677' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100396, N'URJPVHN8L2VG0THOAHPGZ2YPBE7IBKJVR88LOVLBAJRR7TLEJO', CAST(N'2016-06-13 16:58:43.900' AS DateTime), CAST(N'2016-06-13 16:58:43.910' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100399, N'C056AIC2C945YNKS614RDXBHJP4MSRKWAIPDIKTG7VFDTHR4OO', CAST(N'2016-06-13 16:59:51.490' AS DateTime), CAST(N'2016-06-13 16:59:51.503' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100402, N'QIP8QKRFQS3DVNBWZDFAVOS0RWWWUJCM9BC7573EZE7AHZAG9I', CAST(N'2016-06-13 16:59:56.733' AS DateTime), CAST(N'2016-06-13 16:59:56.777' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100405, N'LWPTILZ7E4P2BPME45U71JWPTTZLCDARNXCTQZNM3TDPYKFJ5M', CAST(N'2016-06-13 17:01:36.647' AS DateTime), CAST(N'2016-06-13 17:01:36.653' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100408, N'3OR4YXVGPNMVJVTTPV2MRT973549G0WUDUTKYAD7V6MD7YIZD8', CAST(N'2016-06-13 17:01:36.803' AS DateTime), CAST(N'2016-06-13 17:01:36.810' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100411, N'7UWSDFOH6M7TTNY1JLGA4BJD3K4MX95WBEKVQ91JR7RYGMJZ42', CAST(N'2016-06-13 17:02:03.227' AS DateTime), CAST(N'2016-06-13 17:02:03.253' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100414, N'7EZD82GZRO2EBYCWO1W3LVADO8DY3IC3S7ID6WHOAW99YDOVMB', CAST(N'2016-06-13 17:02:03.543' AS DateTime), CAST(N'2016-06-13 17:02:03.553' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100417, N'G3Y5CGDP8PPVRYK6AERUFI4UL1A1W54AL4QHO4MJAENH1N60BP', CAST(N'2016-06-13 17:02:17.017' AS DateTime), CAST(N'2016-06-13 17:02:17.030' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100420, N'9JD4819OZBQ8Y59OEMCNRGM05SV5IGUBL5UOFMQ30HF973SFSU', CAST(N'2016-06-13 17:02:17.300' AS DateTime), CAST(N'2016-06-13 17:02:17.307' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100423, N'GY2QCTGEV2P7TS4D9S3H7NPTR3VCR6ZXAATADLJ4OGQIP08QNO', CAST(N'2016-06-13 17:02:58.110' AS DateTime), CAST(N'2016-06-13 17:02:58.120' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100426, N'VPBA0D7DNSY3ZNMVN393ENIEQJQJZMTQUXDSW7WL43CHFEDWJO', CAST(N'2016-06-13 17:02:58.370' AS DateTime), CAST(N'2016-06-13 17:02:58.390' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100429, N'Y7FAEDMG29166VC3XCE77MN2G2HRUQSEAFVIT2VJAMZL6U1SAI', CAST(N'2016-06-13 17:03:11.197' AS DateTime), CAST(N'2016-06-13 17:03:11.207' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100432, N'AGPAH0L0N8O9OIYYSP97S33NL1H0GWVT6NEQIL1R3RNP3OMXBU', CAST(N'2016-06-13 17:03:11.520' AS DateTime), CAST(N'2016-06-13 17:03:11.530' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100435, N'6E76S4AF8CHO2D0EYTLCAD63DK3RL6EZOV0KK3ERCPSSQM1Y1Z', CAST(N'2016-06-13 17:03:40.570' AS DateTime), CAST(N'2016-06-13 17:03:40.583' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100438, N'M5FQFP1D12QK88IWD4RYHEYOC0XYSL8S8IJ13OS7SBFRF074X0', CAST(N'2016-06-13 17:03:40.833' AS DateTime), CAST(N'2016-06-13 17:03:40.843' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100441, N'PDJ0BV6TOL2ZS4BQ21HBIIU66JEELZPC6EP4EFXR1IEKGZQ4F9', CAST(N'2016-06-13 17:03:54.743' AS DateTime), CAST(N'2016-06-13 17:03:54.757' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100444, N'C7G6YJTBAQ52A4ILIJHXU4VK7XWTCDZB7T2YL5MUARR2INFRCE', CAST(N'2016-06-13 17:03:55.043' AS DateTime), CAST(N'2016-06-13 17:03:55.057' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100447, N'Y5OZ6KOKBQGM8RBQZ97O985N9PT4Q5UXXXTARWXX3ETEJRI134', CAST(N'2016-06-13 17:04:08.847' AS DateTime), CAST(N'2016-06-13 17:04:08.870' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100450, N'3AAD94RK289HE987TE9OQ3CEDQ65RCH5DDJ5SBSK3WR04BKP4D', CAST(N'2016-06-13 17:04:09.147' AS DateTime), CAST(N'2016-06-13 17:04:09.163' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100453, N'DMKEH9B2QV1AZPBP78JYWECXO63O5TSVHP73QJG6XY2S8IVQZU', CAST(N'2016-06-13 17:04:20.127' AS DateTime), CAST(N'2016-06-13 17:04:20.140' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100456, N'62ZDCU81HH1O6W06CG5R8BU37WPSR4JWHRBAH1LQN1UKDYH5F0', CAST(N'2016-06-13 17:04:20.413' AS DateTime), CAST(N'2016-06-13 17:04:20.423' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100459, N'PIQRCTTFHCDL4RHYXXBU2HOCV6K0LR2394RUT3X1MFJIDG9YP6', CAST(N'2016-06-13 17:04:31.313' AS DateTime), CAST(N'2016-06-13 17:04:31.337' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100462, N'P1TC7HMX3E86M3WT2DRNI1ECGUTBR189PYPC9QC7531TV8EU6E', CAST(N'2016-06-13 17:04:31.623' AS DateTime), CAST(N'2016-06-13 17:04:31.653' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100465, N'NLVILYQ48TEZU6X716BA71S5DLV1Z3GS4YCHSLDSVWH6HL22VW', CAST(N'2016-06-13 17:05:20.417' AS DateTime), CAST(N'2016-06-13 17:05:20.427' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100468, N'G19IGIM30FFD1DLO5EX3JZABWCH5LE7S4ZGNK3HBLZ9ZN2OGB1', CAST(N'2016-06-13 17:05:20.693' AS DateTime), CAST(N'2016-06-13 17:05:20.710' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100471, N'OJKIBU4REGMS6T0MNIRZZWKIT58Z2PWUFGFHICQGBO8D3DT19D', CAST(N'2016-06-13 17:06:27.887' AS DateTime), CAST(N'2016-06-13 17:06:27.900' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100474, N'X75GZCY5DQ0H1JTR1L3L2B49QNEYP59HJB4MCSSBZP4UHGFP4A', CAST(N'2016-06-13 17:06:28.117' AS DateTime), CAST(N'2016-06-13 17:06:28.127' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100477, N'U7P1BEIWYFI7283TLN45AWODZGKYE4XOOC5WSNQ58TZ0F3QW1B', CAST(N'2016-06-13 17:23:25.247' AS DateTime), CAST(N'2016-06-13 17:23:25.597' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100480, N'GMOSTPXX6NGW1JOJ6MKK22FSLIAOCSDT5KF8F0VD0QUTZJLFFO', CAST(N'2016-06-13 17:23:25.853' AS DateTime), CAST(N'2016-06-13 17:23:25.863' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100483, N'D07MQERP559DL4F1QTYSQEBNXPP7PYWB18RWSTS0N640WB22US', CAST(N'2016-06-13 17:23:35.213' AS DateTime), CAST(N'2016-06-13 17:23:35.240' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100486, N'BZEWXNLDNCKHIUP4JEW085QQLTFQTQ40VZTM24GWBGHCDB5SH7', CAST(N'2016-06-13 17:23:35.323' AS DateTime), CAST(N'2016-06-13 17:23:35.333' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100489, N'KNYUL5FRLMY6DKI9WH8LBKAHJBLQF7INZUIRWLISYGDURDRGC4', CAST(N'2016-06-13 17:23:35.557' AS DateTime), CAST(N'2016-06-13 17:23:35.570' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100492, N'WKDBERBPATUL704IUQ88YCBLZO95P856AWP0NES0WVH55TF6CI', CAST(N'2016-06-13 17:23:53.027' AS DateTime), CAST(N'2016-06-13 17:23:53.867' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100495, N'FGT8697M3G81J1O77A1V6IN5ILO91QAXWF3BBYO5J1LX5ZM0JX', CAST(N'2016-06-13 17:23:54.157' AS DateTime), CAST(N'2016-06-13 17:23:54.180' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100498, N'2Z8BCZLAFGG06DHMBOMNCGK8IC4P51IQVYW7ITI1MA5XYE2T6U', CAST(N'2016-06-13 17:24:01.690' AS DateTime), CAST(N'2016-06-13 17:24:01.707' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100501, N'UCWSCC5HS6TTEV92FKZOUVIKO3QJEWAEQ27L8CQGTQ3YCL9RA8', CAST(N'2016-06-13 17:24:01.807' AS DateTime), CAST(N'2016-06-13 17:24:01.887' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100504, N'UWZD7ZY0D8OEW7NWLZFHAF8K9RZUL6GL7W54OY6LCEL9UCENSG', CAST(N'2016-06-13 17:24:02.117' AS DateTime), CAST(N'2016-06-13 17:24:02.127' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100507, N'RHTQ73RWHH4EXDIBOOG9GMF04LLEUIOCV6OKMTWOWB9L84HZC9', CAST(N'2016-06-13 17:24:25.507' AS DateTime), CAST(N'2016-06-13 17:24:25.517' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100510, N'5O5Z69J06CSTKMW1Q459PUWO6HVTYGKOSPC9Z2IVIJQMXPLYEG', CAST(N'2016-06-13 17:24:25.567' AS DateTime), CAST(N'2016-06-13 17:24:25.577' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100513, N'UMLEIWOLQ78D1LOVCEGHE81UWQNYZHKA4CG6XIF7L4JJANMC0W', CAST(N'2016-06-13 17:24:25.910' AS DateTime), CAST(N'2016-06-13 17:24:25.920' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100516, N'1CAVSAY04F573V0HONHEBXSEMZ5NI16K8E85A34G07TZ1Y7PC0', CAST(N'2016-06-13 17:25:18.410' AS DateTime), CAST(N'2016-06-13 17:25:18.477' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100519, N'SRV4V3POC8HO7S01MG1E5MPNUTGA845B26F2CVWWFJY4NEVTGK', CAST(N'2016-06-13 17:25:18.797' AS DateTime), CAST(N'2016-06-13 17:25:18.807' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100522, N'N23H9413B65UISVDIUDRYJBDH31OCGE8HR5ERBUSKK71G35IWH', CAST(N'2016-06-13 18:20:43.067' AS DateTime), CAST(N'2016-06-13 18:20:43.357' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100525, N'VAQ0S9O0VIE4VV2D0D56HHL40AHZ57Y12FS21FCSQ8LTBXW29N', CAST(N'2016-06-13 18:20:43.613' AS DateTime), CAST(N'2016-06-13 18:20:43.627' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100528, N'G59QMD49DFPKC72YHDLQ9Z6WBVEH6PBX8630JPA5Z3S0L4ABVQ', CAST(N'2016-06-13 18:32:02.043' AS DateTime), CAST(N'2016-06-13 18:32:02.440' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100531, N'01AYKRRWDV2FMAR0JERKEMLA2FB8I41O10E3DZ754JPYD1KUFE', CAST(N'2016-06-13 18:32:02.713' AS DateTime), CAST(N'2016-06-13 18:32:02.723' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100534, N'G91CEGLK6J7TW1JLYAP0X7Z9CDQTXMZ3H0I3S15XOB1C6TVCZK', CAST(N'2016-06-13 18:37:12.727' AS DateTime), CAST(N'2016-06-13 18:37:13.037' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100537, N'AP9YCR3GM2Q2LDDEIX4B4VWOSBJMFC76NXIN7DGKDYB15J8WZW', CAST(N'2016-06-13 18:40:26.497' AS DateTime), CAST(N'2016-06-13 18:40:26.777' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100540, N'DJMAKF6KRPA6W1UG09M1E4IUOESZN6UF6KGZIJBF3AG766MK0K', CAST(N'2016-06-13 18:42:21.427' AS DateTime), CAST(N'2016-06-13 18:42:21.447' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100543, N'MXAKQY4AQ858MCL06JRDBMKC0TCH7HMLSSKKXEKNWJBDULDRC7', CAST(N'2016-06-13 18:45:52.920' AS DateTime), CAST(N'2016-06-13 18:45:53.303' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100546, N'HPAA7OX7USNCA9990BZDPE5BEFLOQQEMJ4MJTPQ8DIYVX5GYXB', CAST(N'2016-06-13 18:46:40.363' AS DateTime), CAST(N'2016-06-13 18:46:40.380' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100549, N'5E9XVMGWKHJVG8BV2CQWY2KH2FTWY7CFGAP8VOROWISWPZGISY', CAST(N'2016-06-13 18:46:52.647' AS DateTime), CAST(N'2016-06-13 18:46:52.663' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100552, N'LWVMGAZI3ZAVLZB45L0V4HDM574F722O9DF2FXEQSA9BE2D9BW', CAST(N'2016-06-13 18:47:07.257' AS DateTime), CAST(N'2016-06-13 18:47:07.267' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100555, N'GWLSJXFPSTK3T0UNVNLHZT7Q1FDMWH0UEIINSDAG3V4DC2V7US', CAST(N'2016-06-13 18:49:06.997' AS DateTime), CAST(N'2016-06-13 18:49:07.033' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100558, N'CEAS6XTIZF2QB8CUQPVCJ8KMJZASL6VP7TPC0G2EROF79DMM7C', CAST(N'2016-06-13 18:49:16.987' AS DateTime), CAST(N'2016-06-13 18:49:17.007' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100561, N'2J7G3SMX81UH7O9RW75H01LFIURXUHLVIGYJKF0SV9GFK0UPJV', CAST(N'2016-06-13 18:49:38.320' AS DateTime), CAST(N'2016-06-13 18:49:38.330' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100564, N'FUR0SC7LNTFX7E4MMEBU1FQA7HFGQW2D52U6N52JM4KJ6DZ8Y0', CAST(N'2016-06-13 18:50:08.090' AS DateTime), CAST(N'2016-06-13 18:50:08.100' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100567, N'V1O1AL6BK4B465OYPYW57C4MKJ4V6SCKHPK82P41MIO8APKQ73', CAST(N'2016-06-13 18:50:59.570' AS DateTime), CAST(N'2016-06-13 18:50:59.580' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100570, N'I93L0326QRMEGXH7Q8VM8ET59XRG6AW1BS9MWZCCZSRN1S950M', CAST(N'2016-06-13 18:51:34.517' AS DateTime), CAST(N'2016-06-13 18:51:34.527' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100573, N'E2O6XP3HRYRI1NB6OX7SZ08BFR2CAW84KD35A4V10WZY5SUJDS', CAST(N'2016-06-13 18:52:12.403' AS DateTime), CAST(N'2016-06-13 18:52:12.413' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100576, N'2XERUHI1V656OQ7WVUXKV99PEC56WR278U8N6Y1DUKHUAUYUUH', CAST(N'2016-06-13 19:25:30.773' AS DateTime), CAST(N'2016-06-13 19:25:30.797' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100579, N'VVRP51O1NEWFQMV2EN2HDJE2VO6XZ0MEX5KZ19VRLIUOUINE4T', CAST(N'2016-06-13 19:26:06.683' AS DateTime), CAST(N'2016-06-13 19:26:06.693' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100582, N'S6ZZHZTW6WB98TCG16WI7VO4559GRKJKY8SZKE1345SPH4MYMY', CAST(N'2016-06-13 19:26:47.567' AS DateTime), CAST(N'2016-06-13 19:26:47.580' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100585, N'YBKDLIWWXF55EB8YWBYINQVV96LGTR7TEOIULSWQ5OPB2OOMM8', CAST(N'2016-06-13 19:26:47.870' AS DateTime), CAST(N'2016-06-13 19:26:47.900' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100588, N'X8CPCF1MBVVER7RL9AYSRNGUG8TBF7UGK2ZJLGR4USA3JI0LYC', CAST(N'2016-06-13 19:26:50.680' AS DateTime), CAST(N'2016-06-13 19:26:50.693' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100591, N'MTZQISTNYDZ1BHI0BTZ9Q6CMJG1VTP1RJI9EF74F40USEGJECU', CAST(N'2016-06-13 19:28:35.470' AS DateTime), CAST(N'2016-06-13 19:28:35.497' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100594, N'0PYU62HB8N08JTE77XSXEI8Z2CTN5U28H6RF8HXF47X72FUXEQ', CAST(N'2016-06-13 19:28:46.553' AS DateTime), CAST(N'2016-06-13 19:28:46.580' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100597, N'M2P71KIQ6U6FEWDCAXKQMUHBK5QJ77C30G29BUQD2NZHVLWUUS', CAST(N'2016-06-13 19:28:46.797' AS DateTime), CAST(N'2016-06-13 19:28:46.810' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100600, N'PD242XOUTDE8KVT5VI0QXJTZX1B88BIFNP5WS4PTTIPJZY0KHM', CAST(N'2016-06-13 19:52:45.067' AS DateTime), CAST(N'2016-06-13 19:52:48.367' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100603, N'92NF3G8IG5G4AMWVS9VEMDSZ9L6MHHBYRZ0K3XWDY1WSZ7H2X5', CAST(N'2016-06-13 19:53:03.867' AS DateTime), CAST(N'2016-06-13 19:53:03.887' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100606, N'1I2EZ15H7RHHGTKDWHH7YB95SBSQ3S2ZR14QVF0XO4OL4O3GDA', CAST(N'2016-06-13 19:53:04.137' AS DateTime), CAST(N'2016-06-13 19:53:04.170' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100609, N'2N950ZS31JR3SHRLRDCRIA4BGYYB4KEPTR7FA40780SJ15MAN7', CAST(N'2016-06-13 19:53:40.710' AS DateTime), CAST(N'2016-06-13 19:53:40.727' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100612, N'N00IVGSIYPY9NJQQUD4JQMDNZRV76WPKC1H9DHT56HUUUBO728', CAST(N'2016-06-13 19:53:40.960' AS DateTime), CAST(N'2016-06-13 19:53:40.977' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100615, N'UFM09KPQLQX3ZBCSRUVCII1D64LV9EFK7J0U46TIREM7HIW4JL', CAST(N'2016-06-15 14:45:12.893' AS DateTime), CAST(N'2016-06-15 14:45:13.703' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100618, N'IXLPAYV4IUAUZKF4T396Q0UP8F4OGT0DSP4ICI45VE5AKGYQ91', CAST(N'2016-06-15 14:45:13.997' AS DateTime), CAST(N'2016-06-15 14:45:14.020' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100621, N'YDT6YXCMGU8WG0ZHSEY926EAN3G4V9YGSBOH1DMQSM7WMGGMBO', CAST(N'2016-06-15 19:35:06.097' AS DateTime), NULL)
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100624, N'9NA0KG7E5MRI8D8X1DRDSAN40GUU8G9XNCG2JMLUSKCOX9CJBV', CAST(N'2016-06-15 19:35:42.477' AS DateTime), NULL)
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100627, N'EWQUSAWPZQVFEE2KFO1B8P9OW2BGUGLSFB4A0U8GNI7QLKZ168', CAST(N'2016-06-15 19:40:40.673' AS DateTime), NULL)
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100630, N'V1BKB1N6RKW8VM7KQODJWWY5V2O78ZHQS08H22BZ1JJZ5MYU8W', CAST(N'2016-06-15 19:42:00.507' AS DateTime), NULL)
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100633, N'SA3SGU0M2S5NDW0U5V29UHI3T6R2PYOHEE9XIUKVVA542R2N8W', CAST(N'2016-06-15 19:44:11.680' AS DateTime), CAST(N'2016-06-15 19:44:12.897' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100636, N'0M19ZS3G1CPEE8X3AMYM0FXJ2IB1WW7MNXRXKHP64C7CZL9MUT', CAST(N'2016-06-15 19:53:15.407' AS DateTime), CAST(N'2016-06-15 19:53:16.473' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100639, N'FYVLKVL652D89X77I3OE5PJJVVOIXYSVDIHADTAG4QY4VNILZ2', CAST(N'2016-06-22 13:16:45.480' AS DateTime), CAST(N'2016-06-22 13:16:49.027' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100642, N'KMKCXT0164IFEVLRDLU3QVJBUWAIM6F8D6NWDGRX5ISB62UQR0', CAST(N'2016-06-22 13:16:49.237' AS DateTime), CAST(N'2016-06-22 13:16:49.247' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100645, N'GQI55SSF6VMTD2AJOZGDPX262GWNVPUNKXO5YFUCECN2LN2SLA', CAST(N'2016-06-22 13:17:00.170' AS DateTime), CAST(N'2016-06-22 13:17:00.180' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100648, N'IBEHT6Q9AQ6BXODB0UYZOQD3Z0GFY7S471JY3SLL8RS1MF4ZF4', CAST(N'2016-06-22 13:17:00.360' AS DateTime), CAST(N'2016-06-22 13:17:00.393' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100651, N'QQKDXN9J2NYN21CTFGB2U6QO78G7E4BAJ5OSTMQXJQ0MD6T0VT', CAST(N'2016-06-22 13:17:50.987' AS DateTime), CAST(N'2016-06-22 13:17:51.180' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100654, N'92I00D4NH1FXVTN0C112J9F3E44NK8UVW51D697R5HE9NBYNX9', CAST(N'2016-06-22 13:17:51.357' AS DateTime), CAST(N'2016-06-22 13:17:51.367' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100657, N'YEXH8XRVCK596JYWULXZZN5JLRJCSHI0T4J3MJMHVU5XWXV52U', CAST(N'2016-06-22 13:18:26.817' AS DateTime), CAST(N'2016-06-22 13:18:26.823' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100660, N'NANEOCJOHJX9QUUOGIZDUJRVX1A7G3K90TU6IZNOFS53IMH2BK', CAST(N'2016-06-22 13:18:27.000' AS DateTime), CAST(N'2016-06-22 13:18:27.013' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100663, N'V7YSUL25NAJBOZI5TPXHTMGBV86VH198KMC683BH0F59CTG6OF', CAST(N'2016-06-22 13:18:38.560' AS DateTime), CAST(N'2016-06-22 13:18:38.567' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100666, N'DZZ39XZFYTG4X5PKEF5VJWTT5KBJKOUCAJTXGF12RSEXL7IMW2', CAST(N'2016-06-22 13:18:38.717' AS DateTime), CAST(N'2016-06-22 13:18:38.727' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100669, N'TO61J9WVALWL4N3OM4MKHUDWKIE8LV6FBG91CESAWEMHXBCGVW', CAST(N'2016-06-22 14:06:38.330' AS DateTime), CAST(N'2016-06-22 14:06:38.350' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100672, N'RQ4TMQ3B7OVAZ1ATF2TKT3BTML4223EH945KOOCB3BTK6KUMU1', CAST(N'2016-06-22 14:06:38.597' AS DateTime), CAST(N'2016-06-22 14:06:38.607' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100675, N'J3PS6HBIIR980RDI5YVMWEEKMPRP0L0Y543HVKFMW8GUEFPNPV', CAST(N'2016-06-22 14:07:43.143' AS DateTime), CAST(N'2016-06-22 14:07:43.157' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100678, N'5FG51YCXFYFFVTDN8YMF3QNW4HPL2XBTODEBYY9LTOH47LRK4W', CAST(N'2016-06-22 14:07:43.380' AS DateTime), CAST(N'2016-06-22 14:07:43.387' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100681, N'FBGIYHO7TJDGPCTC2YTAN7HUJKUB3PEJOLOG7GGCCHWS0BK3XL', CAST(N'2016-06-22 14:08:17.383' AS DateTime), CAST(N'2016-06-22 14:08:17.390' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100684, N'X3HSDTKG42B9YI0SNO1ODHUCTWYZ6CZNEH57FR5X3T5G9ONJ68', CAST(N'2016-06-22 14:08:17.530' AS DateTime), CAST(N'2016-06-22 14:08:17.537' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100687, N'J9S8BFIWNM7G88ELLFIC41NAVOVI5FD988ZN0O9G2DH297WFH3', CAST(N'2016-06-22 14:08:35.917' AS DateTime), CAST(N'2016-06-22 14:08:35.923' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100690, N'11UJRRE6Y548HEL065QRUB0S50Z682YCY4GE8ZZ0TQRQILZVQP', CAST(N'2016-06-22 14:08:36.073' AS DateTime), CAST(N'2016-06-22 14:08:36.080' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100693, N'J4L6JIRCBYD9P0XYLTFOGJ21J9LQ2YPJ3MTA2E6NZ908Q5B9WL', CAST(N'2016-06-22 14:12:46.700' AS DateTime), CAST(N'2016-06-22 14:12:46.720' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100696, N'D25Y6A9ERJAKI5T62JABXRC9KKQCDBFOLTZGX96B044843LDUT', CAST(N'2016-06-22 14:12:47.023' AS DateTime), CAST(N'2016-06-22 14:12:47.033' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100699, N'RPA9HZRZJ9CQZKNSHA3UZZLY532Z7OZ60RSW4RA3JV33OJ7PEX', CAST(N'2016-06-22 14:14:03.963' AS DateTime), CAST(N'2016-06-22 14:14:04.800' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100702, N'5JVA24WO09LV2S82023AKT9LYZ3DVFE2CS95TW7RP530UFRCWT', CAST(N'2016-06-22 14:14:04.963' AS DateTime), CAST(N'2016-06-22 14:14:04.970' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100705, N'EUVYIFS3YW7SP7ES1YCWF19NISYUPFEPN3RR7YKYURCUZY6XUU', CAST(N'2016-06-22 14:15:55.947' AS DateTime), CAST(N'2016-06-22 14:15:55.953' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100708, N'17F25NZUEW3VMK3UBD5H5M3WCH67NZGUCM0V02Q13X0TB454MH', CAST(N'2016-06-22 14:15:56.080' AS DateTime), CAST(N'2016-06-22 14:15:56.087' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100711, N'4JQUHIB7KN7N0774Q3F9EGVM5YUXXX33HMQVA31JFMJTGPCKP4', CAST(N'2016-06-22 14:16:49.737' AS DateTime), CAST(N'2016-06-22 14:16:49.747' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100714, N'QVH7CZCMHUETVA69T372MS4YNRSTZ9DX1W1PDHUHC3L4AVEH45', CAST(N'2016-06-22 14:16:49.977' AS DateTime), CAST(N'2016-06-22 14:16:49.987' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100717, N'PYOF3WHJNRZS96A59IALQC8SSRDDFLSMTN8LG2KIW2YFXNLU09', CAST(N'2016-06-22 14:17:35.640' AS DateTime), CAST(N'2016-06-22 14:17:36.450' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100720, N'Q331G2H74VGGC2OF1CVU896U1DOTOGBAPA45WBQ3RWSJOFO7Y2', CAST(N'2016-06-22 14:17:36.623' AS DateTime), CAST(N'2016-06-22 14:17:36.627' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100723, N'KV75R8DYIBL03QU3IWQFJZXNCDREESA9DKCPP2UNA9SL2NZPHO', CAST(N'2016-06-22 14:17:51.917' AS DateTime), CAST(N'2016-06-22 14:17:51.927' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100726, N'68YIMPEDFIR7YSU8LWH8RB6ZU5PAG4L3WTNJSFNM8QTVVT1MWP', CAST(N'2016-06-22 14:17:52.157' AS DateTime), CAST(N'2016-06-22 14:17:52.167' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100729, N'6EJSF5HEGW9E1KXU9473QWVOPIWCH3J2F4KCSUD83ZXYCF3AF6', CAST(N'2016-06-22 14:18:02.867' AS DateTime), CAST(N'2016-06-22 14:18:02.877' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100732, N'ZUYRAQED7IAS8RMCECTW3UDU88IG4E93F6OIJCISU2PRIVOOVB', CAST(N'2016-06-22 14:18:03.153' AS DateTime), CAST(N'2016-06-22 14:18:03.170' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100735, N'GUP9NKJ1FZWP0GTBT3CODJY2ULCG2AZHQFGC7X0Z1MIEGI96WC', CAST(N'2016-06-22 14:18:17.793' AS DateTime), CAST(N'2016-06-22 14:18:17.800' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100738, N'BBYZBWLBPEMZ8X7Q4QZA8Q15O771LTHSWQISO5GM3FXU4YRVP2', CAST(N'2016-06-22 14:18:17.957' AS DateTime), CAST(N'2016-06-22 14:18:17.967' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100741, N'S15GZ0PMW4KSG8CYAPQ3S59C6XANG343J2Z7KV4LWD90KD2R4A', CAST(N'2016-06-22 14:18:34.177' AS DateTime), CAST(N'2016-06-22 14:18:34.247' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100744, N'LIKFVLLLOQK6MF1GFWCW43RIPNVR2EV3J44ECD85MG1TQUO6KF', CAST(N'2016-06-22 14:18:34.460' AS DateTime), CAST(N'2016-06-22 14:18:34.470' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100747, N'LZWQHGG8I8U76MFXM9M5M9Z33ZGF433SNG0PRVPOYWDXLJBBV9', CAST(N'2016-06-22 14:19:32.423' AS DateTime), CAST(N'2016-06-22 14:19:32.427' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100750, N'Q2RMPS6HUVZHEGEDH2ED8MM0T0T6SUSOYZVRPAO6FSHSETXIKS', CAST(N'2016-06-22 14:19:32.567' AS DateTime), CAST(N'2016-06-22 14:19:32.573' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100753, N'PYQUTJ95UHSMXTG8XICAHXZOKQ9TQ5MKSDI6XTKKXH5ED8QMHF', CAST(N'2016-06-22 14:19:44.833' AS DateTime), CAST(N'2016-06-22 14:19:44.847' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100756, N'9AOHW9389V9WQLRGU32A70N3QMX8VA645EVQBH1FI7J0NDV8JW', CAST(N'2016-06-22 14:19:45.187' AS DateTime), CAST(N'2016-06-22 14:19:45.197' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100759, N'5URKLE01ARJLDYLL2I5EUY8OX6IT9EMLKC36NPPO1WYB2SEJHG', CAST(N'2016-06-22 14:20:05.253' AS DateTime), CAST(N'2016-06-22 14:20:05.257' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100762, N'AXMGTQQ9LDPVMSL0XBYLGAVLN7WKX5AHVVZ8M4O6IT25V21Q5Z', CAST(N'2016-06-22 14:20:05.393' AS DateTime), CAST(N'2016-06-22 14:20:05.403' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100765, N'JBHZY2HGA0R0TDU0FTVNVHXHKPGR9WE3DW7ERA0TQT5MFA6IGL', CAST(N'2016-06-22 14:20:39.330' AS DateTime), CAST(N'2016-06-22 14:20:40.157' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100768, N'3RLSR4XLWHYGLSWWN9HAHN2VWYMUSKB0NKF016CYDXKVPYMXII', CAST(N'2016-06-22 14:20:40.320' AS DateTime), CAST(N'2016-06-22 14:20:40.337' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100771, N'CZM6R6MUYKGIJ4I1E2SURUNDEGS8RH9EYALMZ2WZW3HEAY9YP4', CAST(N'2016-06-22 14:20:54.107' AS DateTime), CAST(N'2016-06-22 14:20:54.117' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100774, N'YUJCEU8BKPJL14PWTKSG3HNRET9NIVJDZPYG6SL14CTWCNZLM9', CAST(N'2016-06-22 14:20:54.400' AS DateTime), CAST(N'2016-06-22 14:20:54.413' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100777, N'7PK9YSQKVG33WFGJHGM4V5BRR1LWBCVJM8FVP2828VRQ6MAUIZ', CAST(N'2016-06-22 14:21:21.547' AS DateTime), CAST(N'2016-06-22 14:21:21.557' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100780, N'78NUUGJ2GIYODRUDMW2XBO1RCPU8IM2Q32DE5PN7RJ91ODFQZ8', CAST(N'2016-06-22 14:21:21.867' AS DateTime), CAST(N'2016-06-22 14:21:21.880' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100783, N'QNN4692D3JBGI4VDAU6NA9NQJMX7N4S5JGXOON0JIH0T5FNNUX', CAST(N'2016-06-22 14:21:42.220' AS DateTime), CAST(N'2016-06-22 14:21:42.227' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100786, N'VQH0EMTLE6GRQYVT5NYUWLAN9OAYBVG1TYTQN2Z1ZD4OYQAUIF', CAST(N'2016-06-22 14:21:42.357' AS DateTime), CAST(N'2016-06-22 14:21:42.363' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100789, N'FHKOC9CGI5M2O1EMU6UKZA3TPVXI3DULJJVPDL8EEKI4GSVA0M', CAST(N'2016-06-22 14:21:55.027' AS DateTime), CAST(N'2016-06-22 14:21:55.033' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100792, N'Q5YDSIC5Z8PNM2WODO8ZKY7HY9EZM1ZJSOI4WSMDDB09CVE875', CAST(N'2016-06-22 14:21:55.157' AS DateTime), CAST(N'2016-06-22 14:21:55.163' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100795, N'RN8R1JFYMGB1AAHHE87MJB5TLV3HS16G07JAXGC12VCL285ZT3', CAST(N'2016-06-22 14:22:20.857' AS DateTime), CAST(N'2016-06-22 14:22:20.863' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100798, N'2BLGHSGO3KEN8CZKXQK15ZAHU9KXBPBD9C7PHMR00LVQYBOY1M', CAST(N'2016-06-22 14:22:20.987' AS DateTime), CAST(N'2016-06-22 14:22:20.990' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100801, N'GOJZA1WNQLG2DMT2TY5UL93OR56AKD60LB221MYJZQSISSP5JX', CAST(N'2016-06-22 14:23:16.783' AS DateTime), CAST(N'2016-06-22 14:23:16.790' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100804, N'QT9RPQC4DUQOUASXIJQ9SYFI78XSWVJR6CU6YGWJYIZ7FDZJWX', CAST(N'2016-06-22 14:23:17.063' AS DateTime), CAST(N'2016-06-22 14:23:17.073' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100807, N'B9BQ5KMBPV5A60ECNQ873SXIRGALLMF8EBJI1VBIFDQC6ZF35L', CAST(N'2016-06-22 14:23:30.827' AS DateTime), CAST(N'2016-06-22 14:23:30.830' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100810, N'GC6MCWCJ1HALFUERIJ0EP4LEHHNB9D44PUFL0ABZXAU6Z91AU3', CAST(N'2016-06-22 14:23:30.960' AS DateTime), CAST(N'2016-06-22 14:23:30.967' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100813, N'3I80TP23ACROGB1VGQNDUVQL57GBUPCIPKL80ILUBDM9XL235A', CAST(N'2016-06-22 14:35:52.500' AS DateTime), CAST(N'2016-06-22 14:35:53.320' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100816, N'15O2MXACKONJUZIIQMY0P9COKCXTIA4RXSHJNOJ7KPJIWVLG8F', CAST(N'2016-06-22 14:35:53.540' AS DateTime), CAST(N'2016-06-22 14:35:53.550' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100819, N'53FU56L9LUSAYPEKJM8GUGU93DZQZ2IW0W394ICTZHA306P0TQ', CAST(N'2016-06-22 14:37:23.147' AS DateTime), CAST(N'2016-06-22 14:37:23.153' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100822, N'A6AQCJBHXGYL7JE0EF1OGSH6TFCGNT6SBEZC3XBBGEEYTGC7H8', CAST(N'2016-06-22 14:37:23.287' AS DateTime), CAST(N'2016-06-22 14:37:23.290' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100825, N'VD9TGJ2TFD9BNAJYXIHL2XJCOYQQ91D6J52SCU5ICW93TRSRH7', CAST(N'2016-06-22 14:37:35.630' AS DateTime), CAST(N'2016-06-22 14:37:35.640' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100828, N'41UR31W7EON0I1C3ALT75C33LGXPWIRTN1SX6B7DZX5K7UEFC4', CAST(N'2016-06-22 14:37:35.877' AS DateTime), CAST(N'2016-06-22 14:37:35.903' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100831, N'TXAYTFK4NZKBG486RSUAJHBAL1PJEBKD30E1ODBDL2DRSVKE91', CAST(N'2016-06-22 14:37:39.377' AS DateTime), CAST(N'2016-06-22 14:37:39.410' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100834, N'S66T68XW26AZ1JY2H79ALK9NISBH2O4ZB1PCOTN02Q7P8X0PM4', CAST(N'2016-06-22 14:38:03.593' AS DateTime), CAST(N'2016-06-22 14:38:03.603' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100837, N'CI4G9YS0HKR9TB8AESZAANX2POZX8SNJO12W2H5VNHLBI35BOK', CAST(N'2016-06-22 14:38:03.950' AS DateTime), CAST(N'2016-06-22 14:38:03.967' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100840, N'OQAXWDUO22KOOWS7QMCE8IU8PBX2GSKFQ0XS02BAKGLZNCJZJP', CAST(N'2016-06-22 14:38:23.643' AS DateTime), CAST(N'2016-06-22 14:38:23.663' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100843, N'2XM5WJMSQX92A66XS20EHQBWS78HKQGROKLHDBXH6O20CXMYLW', CAST(N'2016-06-22 14:38:23.707' AS DateTime), CAST(N'2016-06-22 14:38:23.717' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100846, N'BL63J1G6O7NR5WZ265D0K4UNPPFG76TERFAM7S0CTOYHP08MGT', CAST(N'2016-06-22 14:38:23.950' AS DateTime), CAST(N'2016-06-22 14:38:23.960' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100849, N'PRY83IEJ59WCOMG7N3Q5KE1686Z3EIZQ23CS6YH6MNPGSM1IOK', CAST(N'2016-06-22 14:41:08.313' AS DateTime), CAST(N'2016-06-22 14:41:08.897' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100852, N'H8SVS6KSO2YBWR1C2VZSYXGHJA2J0W4RVUJ7SQKWUGO46CI8RF', CAST(N'2016-06-22 14:41:09.053' AS DateTime), CAST(N'2016-06-22 14:41:09.057' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100855, N'K8TIXRN1T2P34K9HBRY8MLS4EULS803BP5L7PCX0ZQEM6XWNPK', CAST(N'2016-06-22 14:41:18.410' AS DateTime), CAST(N'2016-06-22 14:41:18.420' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100858, N'31OJ5TPMMECSF06U3W8FV4QJ02ZW7UGOLB08NDZP2SAYYBVDBS', CAST(N'2016-06-22 14:41:18.443' AS DateTime), CAST(N'2016-06-22 14:41:18.450' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100861, N'EP27L2PB3HFDD1OWMELTHSV79GGDQILMVGNN7JDO0IS3VEECIA', CAST(N'2016-06-22 14:41:18.573' AS DateTime), CAST(N'2016-06-22 14:41:18.580' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100864, N'L6WXHPUHLBTF8QY1K3TH7HVMJD7L0NW3JXH9EWBI37U33VA7WS', CAST(N'2016-06-22 14:42:15.957' AS DateTime), CAST(N'2016-06-22 14:42:15.970' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100867, N'CMH6KIL4U45WCMYLIWDH05SVR7I9QQWUDPN5GP3YIKZ8PBZBZB', CAST(N'2016-06-22 14:42:16.340' AS DateTime), CAST(N'2016-06-22 14:42:16.347' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100870, N'F3YC6CECJPM9TJD792N1AVAPG1K1SN26GUH4V19DWESXZ1FDSB', CAST(N'2016-06-22 14:42:22.413' AS DateTime), CAST(N'2016-06-22 14:42:22.427' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100873, N'UC132PJ8NGY9CHOYBUKUDLB7XWUQA0WVIBYMAARQ083PGWYS69', CAST(N'2016-06-22 14:42:22.633' AS DateTime), CAST(N'2016-06-22 14:42:22.650' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100876, N'Q5N1PCR9XL1D7LCVS0SQMBTGV1Y5MF3KWIRUYTFRK45BD8RE2Z', CAST(N'2016-06-22 14:44:24.653' AS DateTime), CAST(N'2016-06-22 14:44:27.220' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100879, N'R5VX16O6JR38D2V3UHPDSQL5EO6XXAATKJWK5PFSDO75US8IOI', CAST(N'2016-06-22 14:44:34.107' AS DateTime), CAST(N'2016-06-22 14:44:34.117' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100882, N'ML3MPHRHT6SILK9I54DZNXN99B1IGTS4QUY1NXWFFGMMJ9Q7G8', CAST(N'2016-06-22 14:44:34.277' AS DateTime), CAST(N'2016-06-22 14:44:34.303' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100885, N'207PRRU8IYXTZ5WYBHBS48P9IQKIN3RA30ZRD2NDL6C4YOOL9Y', CAST(N'2016-06-22 14:44:58.177' AS DateTime), CAST(N'2016-06-22 14:44:58.187' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100888, N'Y1CQ2HVDX87LS8D5YZGZY8299XZV8372WFX0ZMVAGDWKNX9HWI', CAST(N'2016-06-22 14:44:58.553' AS DateTime), CAST(N'2016-06-22 14:44:58.563' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100891, N'4Z93A3HSCE5CP28BFAZ3GM4XNL3FDYKR2OKYUA6581HX7D7LHJ', CAST(N'2016-06-22 14:45:10.683' AS DateTime), CAST(N'2016-06-22 14:45:10.690' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100894, N'P79YC5OJ6B3IIDNHKOH7MSLQ81G9V9QE9YLNNH2VZH4Z9URXZA', CAST(N'2016-06-22 14:46:56.797' AS DateTime), CAST(N'2016-06-22 14:46:56.910' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100897, N'VDVCGPRJXUXDOWJYFTJ73NSHC2TAWGEMOEBINWXIZZ1LUDTLZJ', CAST(N'2016-06-22 14:46:57.100' AS DateTime), CAST(N'2016-06-22 14:46:57.110' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100900, N'ZJOK15QRR7LS5542MJHBN5RINHKSPO9X3O9RI0L07BFVTV60YM', CAST(N'2016-06-22 14:47:33.447' AS DateTime), CAST(N'2016-06-22 14:47:34.537' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100903, N'S6FXDBSUX12I9LDYDIVCTA6NIW4612QOX05111F6048WYDDYCP', CAST(N'2016-06-22 14:47:34.967' AS DateTime), CAST(N'2016-06-22 14:47:34.977' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100906, N'W615CKOSN3X1VBW1LAOUIJEIF0QSB927EXIS03A265XI9IC5CC', CAST(N'2016-06-22 14:47:37.917' AS DateTime), CAST(N'2016-06-22 14:47:37.953' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100909, N'AF4W8YSOQVA0F96TN2LMM9F1WV0HSNXWGEZAFCSFAZ8AQDUKQA', CAST(N'2016-06-22 14:47:38.143' AS DateTime), CAST(N'2016-06-22 14:47:38.157' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100912, N'UOKWRB8XCI5LFU46MRZHM8CB8FWEW6PCDHNRYVE46NV0PT1U2I', CAST(N'2016-06-22 14:47:47.790' AS DateTime), CAST(N'2016-06-22 14:47:47.823' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100915, N'2PSLB2FJ37FY65147DWJC0P1SB2XZTKG6XX2DDW8Z4UY2ZUMRC', CAST(N'2016-06-22 14:47:50.527' AS DateTime), CAST(N'2016-06-22 14:47:50.553' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100918, N'PKPRYQ11PDI1O48ZMWW5OMQFTPJCQ7UF7CAWK3LA7C7G4NJ9OG', CAST(N'2016-06-22 14:47:50.823' AS DateTime), CAST(N'2016-06-22 14:47:50.840' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100921, N'XOCJLMRLABJFJKHULUMHHWDU2LFAG994LGKZ1Q0PVP9UYV3WXA', CAST(N'2016-06-22 14:48:03.633' AS DateTime), CAST(N'2016-06-22 14:48:03.653' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100924, N'7WSTWIKUCHHLYXDRASGOK37IWO4167L8BF5W1JUUC4AADQSQM1', CAST(N'2016-06-22 14:48:04.070' AS DateTime), CAST(N'2016-06-22 14:48:04.077' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100927, N'MII8PPE9NMF6FUF2CQJ5NLIMH6MPRLPV564IDY1X0REPJPM1E2', CAST(N'2016-06-22 14:48:22.730' AS DateTime), CAST(N'2016-06-22 14:48:24.073' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100930, N'4CD94F00WGQCARTZJIZS3T4FQTAF9D3E7AY245Q60Q0JVQD0A8', CAST(N'2016-06-22 14:49:34.400' AS DateTime), CAST(N'2016-06-22 14:49:34.460' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100933, N'8G5XF8XP55UBE00J78ZZ1FQ9IYDZEDZCGHPNFU9POJAHX9IDYW', CAST(N'2016-06-22 14:49:34.810' AS DateTime), CAST(N'2016-06-22 14:49:34.857' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100936, N'71MIN1NSQLAXHB6OZ1ZQWXKAEX8Y98GXJKM1XQF5OZSG7D807Q', CAST(N'2016-06-22 14:52:58.803' AS DateTime), CAST(N'2016-06-22 14:52:59.753' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100939, N'9A00I9ETYM6NL41L96IES7K94RBIQV48I3BXYYS5XVAVHOJGFL', CAST(N'2016-06-22 14:53:00.297' AS DateTime), CAST(N'2016-06-22 14:53:00.303' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100942, N'UCD4B86IPIOR2WMDBCZNKNGRO7J4XU7P6Y3C84S5EIH3X7Q85A', CAST(N'2016-06-22 14:55:40.117' AS DateTime), CAST(N'2016-06-22 14:55:40.167' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100945, N'UWGP6VY1BKICK708GSFG066R9VRF44EWMR1VOR7AW70EFYV4MJ', CAST(N'2016-06-22 14:55:40.430' AS DateTime), CAST(N'2016-06-22 14:55:40.457' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100948, N'JYMLJREOSZG543VICIZXJBVB1UOKXRDOD538A0SMXO1WGJ7MX1', CAST(N'2016-06-22 14:56:07.530' AS DateTime), CAST(N'2016-06-22 14:56:09.013' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100951, N'HDGAL3VAHYJQFEV8QU5WRI9B3W6F790G5Q1NAXAUO2J9N9U31V', CAST(N'2016-06-22 14:56:13.820' AS DateTime), CAST(N'2016-06-22 14:56:13.840' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100954, N'Q1088KQOF8XFA5OD3WHIVXS20ECFUPE38LQS4EDPB3FQ1BGRWS', CAST(N'2016-06-22 14:56:14.050' AS DateTime), CAST(N'2016-06-22 14:56:14.063' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100957, N'GED6JDD31PXZDSMR48MIJGT54QOKZUFH32535NVIE5GWVFE6O9', CAST(N'2016-06-22 15:05:51.963' AS DateTime), CAST(N'2016-06-22 15:05:52.457' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100960, N'NL7Z9RVP38HCNK3TGCC5K5IYB0TFWC90HHVHQ11F8470788GNU', CAST(N'2016-06-22 15:05:52.610' AS DateTime), CAST(N'2016-06-22 15:05:52.617' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100963, N'F6CF7L2QRFZYWNUQV178QUKJWGKIB9Z8W9W45CTZW36E1C4ZT1', CAST(N'2016-06-22 15:06:19.650' AS DateTime), CAST(N'2016-06-22 15:06:19.673' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100966, N'C7HGIB3V5P9QPRBXHJCFKUXJNNZVW9E0POUDSW1WS9QURLPUGL', CAST(N'2016-06-22 15:06:20.027' AS DateTime), CAST(N'2016-06-22 15:06:20.037' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100969, N'716F9D70FT1BC7OB10C68EHJQV548YY0U7WH2HGKUTAP68HJQ9', CAST(N'2016-06-22 15:06:25.747' AS DateTime), CAST(N'2016-06-22 15:06:25.767' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100972, N'9L2RWR6UJOLSWTR3DVTS77SGMGOWAFWHHASA8U8UP7FO70JPK3', CAST(N'2016-06-22 15:06:25.947' AS DateTime), CAST(N'2016-06-22 15:06:25.957' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100975, N'E6IU1NQGZ5I8EOOBLC1RW8C7SJISM47HOBFL95LOF4VNZ97UO6', CAST(N'2016-06-22 15:06:32.540' AS DateTime), CAST(N'2016-06-22 15:06:32.567' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100978, N'GQE6O1OA302QYAR3X7JCV1N4O31KOL5YAFBDEHCYAJ0M11A0I0', CAST(N'2016-06-22 15:06:32.740' AS DateTime), CAST(N'2016-06-22 15:06:32.753' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100981, N'ND5DJSDDJHRIQQVA4UT6G7MYBPX3FURA8038J83PLT9FV3ZE1C', CAST(N'2016-06-22 15:06:33.077' AS DateTime), CAST(N'2016-06-22 15:06:33.087' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100984, N'ND00PCAI9L41OZCWI26KI9H4DB3Q8RKCB3VNMS6PKEXVKFR32U', CAST(N'2016-06-22 15:07:05.233' AS DateTime), CAST(N'2016-06-22 15:07:05.240' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100987, N'552A5O6SK31UW5JB3SEZ8JUMON8EBE5G1ZCEU3WABR6JTTUJBG', CAST(N'2016-06-22 15:07:05.383' AS DateTime), CAST(N'2016-06-22 15:07:05.390' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100990, N'O102LAK763U4IQJQTNHOE59ZSNUNMSW7YV08KAJZ6NPU22ST5R', CAST(N'2016-06-22 15:07:09.493' AS DateTime), CAST(N'2016-06-22 15:07:09.507' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100993, N'V4OOLDGQ0IOBUV83UVBOIRITTKHU6RCDFNUK8FULZAFCEDBA6U', CAST(N'2016-06-22 15:07:09.527' AS DateTime), CAST(N'2016-06-22 15:07:09.537' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100996, N'6T2C1MGGHMSWRWQ5EDP34FMH2ZYAPFHAPRHZSL9KX0YHBGU9ED', CAST(N'2016-06-22 15:07:09.647' AS DateTime), CAST(N'2016-06-22 15:07:09.660' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (100999, N'STJSGQ6Z45C7CO0NI4FKFNCLYPNRHRP89IRMYQO92IF2UQLJUZ', CAST(N'2016-06-22 15:07:20.647' AS DateTime), CAST(N'2016-06-22 15:07:20.657' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101002, N'401AO6TR97BPWMPFD51S5L9BPOOPQHUA0SH1M9YCB09F0BS8JK', CAST(N'2016-06-22 15:07:20.820' AS DateTime), CAST(N'2016-06-22 15:07:20.830' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101005, N'PQHEGW6EZSEJN9UDOND10ACMTVL570LL9MB19N8JFXD6SK18TI', CAST(N'2016-06-22 15:07:23.567' AS DateTime), CAST(N'2016-06-22 15:07:23.570' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101008, N'WT51GZ2YT88QYDJQQV814WKGVT8CRZ1RPE5DXSJ58J3O5VKQUM', CAST(N'2016-06-22 15:07:23.597' AS DateTime), CAST(N'2016-06-22 15:07:23.617' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101011, N'7IIPV82NABBCWF1S9DLGQKP447PTAN6PZJSSHZX469MT1Y3O14', CAST(N'2016-06-22 15:07:23.720' AS DateTime), CAST(N'2016-06-22 15:07:23.733' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101014, N'G9WM3D27IFMNWTW6DMHDV6F5QPF6UHKT98CIAPS0IBG79K9985', CAST(N'2016-06-22 15:08:32.307' AS DateTime), CAST(N'2016-06-22 15:08:32.463' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101017, N'34SSQ1OP5KORES31S5HZ7TGKQ3XLMVUSANPCGFH2RJTOB8YW6A', CAST(N'2016-06-22 15:08:32.610' AS DateTime), CAST(N'2016-06-22 15:08:32.617' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101020, N'QQU7ZY6XVC72P79FU4OBCEQTA4NJ4TTZWH3SHWEQNEYRV2Y14S', CAST(N'2016-06-22 15:08:37.780' AS DateTime), CAST(N'2016-06-22 15:08:37.787' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101023, N'XTJTZ22HPR190CYSVCIBG0ZNC2AROS95D9X561PBG0PA8DIJ5V', CAST(N'2016-06-22 15:08:37.820' AS DateTime), CAST(N'2016-06-22 15:08:37.827' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101026, N'1E8WF76MCFANM8RHDM2QX2VHJJ4ZNHYW6MQ713TPM4HWS5H0CB', CAST(N'2016-06-22 15:08:37.913' AS DateTime), CAST(N'2016-06-22 15:08:37.930' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101029, N'UYGSUTOWF2CVJT624G0X3RW3SK5L3EO3IDE4KIVKJLUX5VQR7W', CAST(N'2016-06-22 15:09:01.510' AS DateTime), CAST(N'2016-06-22 15:09:01.520' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101032, N'GB65PAOBC9J1EV667GRQA35FAD3I5QYY1NPYNWOIG2W7Y1SOMX', CAST(N'2016-06-22 15:09:01.770' AS DateTime), CAST(N'2016-06-22 15:09:01.780' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101035, N'YFZFYEQBJ3DTN7BA6RDLCGDZ40HW7BTFIGUD3YAA6Y18X9K2PA', CAST(N'2016-06-22 15:09:04.157' AS DateTime), CAST(N'2016-06-22 15:09:04.177' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101038, N'VW0VEGZXBBS0ZZENOU2ZPX1ZAINXL221U1U3AV22KG2C5QZ1VM', CAST(N'2016-06-22 15:09:04.210' AS DateTime), CAST(N'2016-06-22 15:09:04.227' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101041, N'RVEETZNAAPE7UE0SBZZEOEV5NQ30TMKGHIYJUGEUW0T03P5G6F', CAST(N'2016-06-22 15:09:04.433' AS DateTime), CAST(N'2016-06-22 15:09:04.457' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101044, N'CMYFSX3JAO8PHH0KOHOBOSLXPJU2V3BWP7GLI7T7FUFIHVV654', CAST(N'2016-06-22 15:10:11.947' AS DateTime), CAST(N'2016-06-22 15:10:11.957' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101047, N'IBNEQ4Y2M9W54BAWO264L7IOE8FE3K5BLG3ZZ84ZY1VFK62PNL', CAST(N'2016-06-22 15:10:12.550' AS DateTime), NULL)
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101050, N'N11K7IM7XN4CRVPTR7D8LZ5BWWIQC0MNYOGU87DNTP02XJQALF', CAST(N'2016-06-22 15:11:44.070' AS DateTime), NULL)
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101053, N'E2GOFY2HWWGPRW3IPPCQEGEFDP2N3LKVILWAC8N2SXWK244CTE', CAST(N'2016-06-22 15:11:48.097' AS DateTime), NULL)
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101056, N'8Z1B66CSG24TWPKUQRGSDB6CPN1BQE8ARQHKEAGKCDOWGOAM1W', CAST(N'2016-06-22 15:26:58.697' AS DateTime), CAST(N'2016-06-22 15:27:02.020' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101059, N'4H0B4GB6UUZFJ0ZKVN22RSUB8LXU34IW7CV1H4Z1GDCE4IDDGU', CAST(N'2016-06-22 15:27:02.177' AS DateTime), CAST(N'2016-06-22 15:27:02.190' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101062, N'RFTQ7SJ0FQAJ9TETGRTTFYNGBL0FMTRSE89ZXOMLSEPI3GYZ7Q', CAST(N'2016-06-22 15:27:54.627' AS DateTime), CAST(N'2016-06-22 15:27:55.010' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101065, N'GUM9HU4C5QX4BFOF74B0QDZS8J1MGOZ81QHMAR3XV17Z6VPTYO', CAST(N'2016-06-22 15:27:55.123' AS DateTime), CAST(N'2016-06-22 15:27:55.133' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101068, N'AFOYNNEKC6ZB9V67CRQT1X5PA84A5YN7H14V5R7FRVIHBLQ3NP', CAST(N'2016-06-22 15:28:02.670' AS DateTime), CAST(N'2016-06-22 15:28:08.743' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101071, N'10TEKHLL0DHXHZX4QFKW6L79VOVDKUDFWT6IK20ZEUHV5PMMSW', CAST(N'2016-06-22 15:28:29.713' AS DateTime), CAST(N'2016-06-22 15:28:29.757' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101074, N'QVJB0WEF5B9W19TWCDNA1HTL6YN97GEO4IHMGI05ZTH1RD8K2M', CAST(N'2016-06-22 15:28:29.893' AS DateTime), CAST(N'2016-06-22 15:28:29.913' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101077, N'LEX0SW6Y941X5SFFYC3COY1JGX41N24L6Z86LYDI26N2BQ261W', CAST(N'2016-06-22 15:29:18.907' AS DateTime), CAST(N'2016-06-22 15:29:19.360' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101080, N'0P95B4PFNW5ETZBSH2PRCJK3017J1R4L7FP6J6641HSDJVE8F6', CAST(N'2016-06-22 15:29:19.477' AS DateTime), CAST(N'2016-06-22 15:29:19.487' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101083, N'YZO9ZA6DUQRA1EY82KAH3SZ1UHEY2E8P2ER13UIRW2GLZSXBL7', CAST(N'2016-06-22 15:29:24.787' AS DateTime), CAST(N'2016-06-22 15:29:29.167' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101086, N'B1AGT850FV2IS8FJQ6YQ226IZR519F7ML2P420XKXQC6NF9BXU', CAST(N'2016-06-22 15:29:33.787' AS DateTime), CAST(N'2016-06-22 15:29:33.807' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101089, N'IG6XA8PTYY8JF2GAJAF9G7E66194Q9J633IM1JWWWNELZN97HK', CAST(N'2016-06-22 15:29:39.010' AS DateTime), CAST(N'2016-06-22 15:29:39.037' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101092, N'WI3PJ1AAV9NGIQ18QMECW5AD79ITTEVE2CQHR2FCHTCDEE9YUP', CAST(N'2016-06-22 15:29:50.867' AS DateTime), CAST(N'2016-06-22 15:29:50.937' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101095, N'88PTM4PMMCHJK14VR2GD2NX4KXR27E6MAGDEV85L90O12QLI0J', CAST(N'2016-06-22 15:29:51.350' AS DateTime), CAST(N'2016-06-22 15:29:51.380' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101098, N'CZ0IKQ4JJB54J3U5H1LD2ELPF0KWFUN0RQ30035XV5F1WGVV9Y', CAST(N'2016-06-22 15:31:26.293' AS DateTime), CAST(N'2016-06-22 15:31:26.827' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101101, N'PSD3I1VMQBNSI2UUIUW63FRA5NTG79XL4RKQ59RC6YLGC2MWSK', CAST(N'2016-06-22 15:31:26.923' AS DateTime), CAST(N'2016-06-22 15:31:26.930' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101104, N'GF1ZCFOGHPKXY1E3XO739J7ECH4BINFC15UQL5B7Q81VYXGMF8', CAST(N'2016-06-22 15:31:31.883' AS DateTime), CAST(N'2016-06-22 15:31:31.893' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101107, N'IZYBZUMBLK4EINHV9JPP8CIB81N3K5DTO8QJQI3HKN6UZOIS92', CAST(N'2016-06-22 15:31:32.093' AS DateTime), CAST(N'2016-06-22 15:31:32.110' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101110, N'VXNL5B4KUOPBPQIM779PZ14KKXWVYA092UX0BPUBWAZZXP9CSB', CAST(N'2016-06-22 15:33:14.077' AS DateTime), CAST(N'2016-06-22 15:33:14.093' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101113, N'SFO1LDC6NX4I0IMZP9Y3CISKQF2WC19UEFWRINN39S0356PCXN', CAST(N'2016-06-22 15:33:14.127' AS DateTime), CAST(N'2016-06-22 15:33:14.147' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101116, N'QEVBTM6V44FLY7W1IUXAU87NFJSFGTIK86ZHSXBZX2DFL6S1L1', CAST(N'2016-06-22 15:33:14.247' AS DateTime), CAST(N'2016-06-22 15:33:14.267' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101119, N'9CKCJ6GDUGD6YMWQ3YXOJ48V7TENMF0MFCZA4Q0HU65SVT9D2J', CAST(N'2016-06-22 15:33:21.663' AS DateTime), CAST(N'2016-06-22 15:33:21.720' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101122, N'EEE7RJ6M63IH7GW6YRQW4GWSXVREA6PHPUVD350ZB38MO3WKQ1', CAST(N'2016-06-22 15:33:21.817' AS DateTime), CAST(N'2016-06-22 15:33:21.827' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101125, N'W6GI6V2VHLGAFM3LIHYAVQ9A87W1DTALGRC4BGPK3FIAXHZ0ZN', CAST(N'2016-06-22 15:33:21.963' AS DateTime), CAST(N'2016-06-22 15:33:21.973' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101128, N'KXWQFCYMDTI9THHYFJT4EEI18H73DHTAQODQS1QC7H52DAZ91B', CAST(N'2016-06-22 15:34:25.943' AS DateTime), CAST(N'2016-06-22 15:34:26.267' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101131, N'FY81YBTG9A34JAA7VMWIP5B4OSCZ2AHSCTDPPVM5RY2UKJNUBA', CAST(N'2016-06-22 15:34:26.417' AS DateTime), CAST(N'2016-06-22 15:34:26.427' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101134, N'YNUFYA0RG3G27MP8ZQ7Z1KTIH2ZYNLHTFEAFNKJ8J4KXTRZK8N', CAST(N'2016-06-22 15:34:29.277' AS DateTime), CAST(N'2016-06-22 15:34:29.297' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101137, N'7BEDLSU5EDVR2CHDDTJL4ZD9EK5YA1VGI90KH1L365FE6TL83K', CAST(N'2016-06-22 15:34:29.513' AS DateTime), CAST(N'2016-06-22 15:34:29.527' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101140, N'JHXVS8GYKFU9MB658T5TUX9Z6K6WIR0HAJPZ4KW6GNARCFRWS6', CAST(N'2016-06-22 15:34:29.683' AS DateTime), CAST(N'2016-06-22 15:34:29.697' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101143, N'LDMSNFQ0GO6KUB9EPJ5SSK8AL06H3N36FQBLZ9H9MD6NPSKJ3A', CAST(N'2016-06-22 15:37:39.120' AS DateTime), CAST(N'2016-06-22 15:37:39.130' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101146, N'JCT2UOLPYVHNS0KHI4309AND93V07FCW9GDBAJ55BNJZ6SN8RO', CAST(N'2016-06-22 15:37:39.230' AS DateTime), CAST(N'2016-06-22 15:37:39.237' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101149, N'KJ4LY3KT2M46ALND2MRKS5YXTR303L1612L4VJYL95W3NR9YWC', CAST(N'2016-06-22 15:37:53.250' AS DateTime), CAST(N'2016-06-22 15:37:53.260' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101152, N'2B5WDFH3D52YJRUTMCZYIFBF337O68N9SZ2W3VO60H5RW5CE5Z', CAST(N'2016-06-22 15:37:53.410' AS DateTime), CAST(N'2016-06-22 15:37:53.420' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101155, N'YDXIV3OF6TF7JBRVNUPMJEEA5AC527PA1473SKV97YYWC79P0S', CAST(N'2016-06-22 15:38:03.707' AS DateTime), CAST(N'2016-06-22 15:38:03.757' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101158, N'2YNKB8SLSGOL57KK54901GA5DR6E1WE2UG16NNZND2RIWZ8667', CAST(N'2016-06-22 15:38:03.803' AS DateTime), CAST(N'2016-06-22 15:38:03.817' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101161, N'YW03QQGYRUAS0M5QSA5F0Y4AQYLH8HVHIX5M87BFQNH7UZELH1', CAST(N'2016-06-22 15:38:04.020' AS DateTime), CAST(N'2016-06-22 15:38:04.033' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101164, N'XOEU5OM0S1IJT4UIOC07LE6NBUJJHSCWRAVM4W79GHS432WEJ4', CAST(N'2016-06-22 15:45:18.327' AS DateTime), CAST(N'2016-06-22 15:45:18.847' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101167, N'R518N3XLUOAE3K4LAIBNI66WXUXHZE98QA0BGEN300EF0SBEZK', CAST(N'2016-06-22 15:45:18.967' AS DateTime), CAST(N'2016-06-22 15:45:18.970' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101170, N'DURPAFHCLVYPO6HD0OONIA0Y8AC7TT7RJ4LAER6L6YZNT8DRJF', CAST(N'2016-06-22 15:45:27.730' AS DateTime), CAST(N'2016-06-22 15:45:27.817' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101173, N'VMT0PREMWEVIWCOTLDW28JDGJMHUWGTVA122M3W6XB8A2MG7S1', CAST(N'2016-06-22 15:45:27.883' AS DateTime), CAST(N'2016-06-22 15:45:27.890' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101176, N'TM09X08ADL6LU1YVEYU9QASJ7P6E081K3R5SXDK2LLLMJMJWFG', CAST(N'2016-06-22 15:45:27.990' AS DateTime), CAST(N'2016-06-22 15:45:28.000' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101179, N'XPFFGBOJFO3Z65818CZ58AKUT57H40C9WD2ANCC9Z0WG005GUJ', CAST(N'2016-06-22 15:45:54.267' AS DateTime), CAST(N'2016-06-22 15:45:54.283' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101182, N'HI9GODQ480POHL4EZH9CHTI9FDMM4VPNTJHBLDEX22SRSF56GR', CAST(N'2016-06-22 15:45:54.313' AS DateTime), CAST(N'2016-06-22 15:45:54.330' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101185, N'FHGPVNKTQ70RFBFHT27JYKXC4HC57NXDMAJ1VN2TQD539E8W35', CAST(N'2016-06-22 15:45:54.427' AS DateTime), CAST(N'2016-06-22 15:45:54.437' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101188, N'OO8LAD8SWAH9AT3RUJEO1BGD1ZX5Z3JX1QN3NOL1TFYAT783UN', CAST(N'2016-06-22 15:46:23.787' AS DateTime), CAST(N'2016-06-22 15:46:23.797' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101191, N'5X42YIIZIUI4X13H3RDANB1TTQIACO5X9H2VRNFI9ZWQT2NTL6', CAST(N'2016-06-22 15:46:23.907' AS DateTime), CAST(N'2016-06-22 15:46:23.917' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101194, N'WLB43TUCGV1F2G8049E5V0D3FIL1O60OWJ0D5X9UKJWM6TQ2LZ', CAST(N'2016-06-22 15:46:25.900' AS DateTime), CAST(N'2016-06-22 15:46:25.910' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101197, N'MZOXKS6EEOMF24N0L39J4USAK34VIYU3RC7RNQQ05F7820MKP7', CAST(N'2016-06-22 15:46:25.927' AS DateTime), CAST(N'2016-06-22 15:46:25.930' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101200, N'7AOSJ1U1WY400HQ3ORSJGOHROX2H7U6L6NOSO4NTJ9ER3W91SI', CAST(N'2016-06-22 15:46:26.020' AS DateTime), CAST(N'2016-06-22 15:46:26.027' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101203, N'PB6K7VVT8SW860XCYR90AMOVYKWG1ZNAQ7RLYB8SS1GF1WDKGQ', CAST(N'2016-06-22 15:46:44.003' AS DateTime), CAST(N'2016-06-22 15:46:44.013' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101206, N'KSFAU6Y4I7MJFHBR9FXL5TRYS6S1JH5LWIT2FJOGUTVWQDW99G', CAST(N'2016-06-22 15:46:44.163' AS DateTime), CAST(N'2016-06-22 15:46:44.173' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101209, N'IP364ATMH7T64V5RA7UR9PCVCNPD3XT95YPHC3AK9F21OKV0V7', CAST(N'2016-06-22 15:46:50.413' AS DateTime), CAST(N'2016-06-22 15:46:50.497' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101212, N'GOAFCKNBZE4A2LGU4SSYQGRY1RFX7Q2YZPR7MDYGYQFD5JYQIL', CAST(N'2016-06-22 15:46:50.513' AS DateTime), CAST(N'2016-06-22 15:46:50.520' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101215, N'D6BVSMVWRNJGDDJ6LUIC3WEY79LYMGBKB9RYTBQ7B8HID0EPOX', CAST(N'2016-06-22 15:46:50.583' AS DateTime), CAST(N'2016-06-22 15:46:50.587' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101218, N'6GCJ1KCBQ2P4RHC28CZVUFHQTYXKVJ51MZX8S4412KZNA2BP9Z', CAST(N'2016-06-22 15:48:29.963' AS DateTime), CAST(N'2016-06-22 15:48:29.970' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101221, N'G5Q8HTC176TPOJU5SUC9G3LF2CE0E7BYV4KNCBJ01BIS75UOGH', CAST(N'2016-06-22 15:48:30.097' AS DateTime), CAST(N'2016-06-22 15:48:30.117' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101224, N'KY5IUHPLQSR7UZME5571ILPZKTXL86509TORMNFZNNUEG5B6FB', CAST(N'2016-06-22 15:48:44.677' AS DateTime), CAST(N'2016-06-22 15:48:44.707' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101227, N'9TVFAWHEVQJ7E9J6R39GCGBAW3PHWS69GHZVJ3G57LUK2UX3P1', CAST(N'2016-06-22 15:48:44.867' AS DateTime), CAST(N'2016-06-22 15:48:44.910' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101230, N'S7HU5TYEZ1M7XC416RU1LSMJ3P2DV4I56U16F9QIL13MTP9JOA', CAST(N'2016-06-22 15:48:51.987' AS DateTime), CAST(N'2016-06-22 15:48:51.993' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101233, N'ZA5H5WUYTGGE8HTE7ZO1PEUD5MPKF2YBMMVI3E14ENT450T1PD', CAST(N'2016-06-22 15:48:52.010' AS DateTime), CAST(N'2016-06-22 15:48:52.017' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101236, N'Q6N4C2T2G8XAU2F30CS82J1MSSSWZWQU0K3WPJEEABGYAPC9CP', CAST(N'2016-06-22 15:48:52.090' AS DateTime), CAST(N'2016-06-22 15:48:52.107' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101239, N'GC7I4NLQUR0OI9ADHKI5FZ5VAN7WP82TP9ZR46FSKY2RS4WX36', CAST(N'2016-06-22 15:49:36.107' AS DateTime), CAST(N'2016-06-22 15:49:36.650' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101242, N'6TQJAXJU0NBUHJG28A95LX01LK7DWK8MHP17I8R967E0NT377W', CAST(N'2016-06-22 15:49:36.763' AS DateTime), CAST(N'2016-06-22 15:49:36.770' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101245, N'HTV7JYPBD2BFFRWT6E01IP0RE9YJD6NXIRD9A62G3HSIBQB395', CAST(N'2016-06-22 15:49:39.130' AS DateTime), CAST(N'2016-06-22 15:49:39.137' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101248, N'OXJTJ2LU7H5MQVL67MV1MA9LF7MRY533YJ6LYAD2W3J0N0VKA8', CAST(N'2016-06-22 15:49:39.153' AS DateTime), CAST(N'2016-06-22 15:49:39.160' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101251, N'FT1GR8JZU9MIDG7WZZZ8ZFGU2DO2HYWNBHFZKGQCRR5URPESWK', CAST(N'2016-06-22 15:49:39.227' AS DateTime), CAST(N'2016-06-22 15:49:39.233' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101254, N'DLE75YP2RLW3NGC9K3E9MF1Q1TMHUJ0MM9145VF5L2WHIRNEAW', CAST(N'2016-06-22 15:49:41.063' AS DateTime), CAST(N'2016-06-22 15:49:41.067' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101257, N'7ZWEX2FLL4YTY8UMVET2L3LZIHIS0MJKNN9RK30O38H6FYRNRV', CAST(N'2016-06-22 15:49:41.080' AS DateTime), CAST(N'2016-06-22 15:49:41.087' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101260, N'5Z2O5B993B8WWY5PPZRA3U026L8B3FSAHDBHUDOKSJUIVYUCEA', CAST(N'2016-06-22 15:49:41.180' AS DateTime), CAST(N'2016-06-22 15:49:41.193' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101263, N'5M3R1V3TYNUS6ZNP439B77GRKK24K85GZASXZ8VJVEY51VQMFU', CAST(N'2016-06-22 15:50:30.473' AS DateTime), CAST(N'2016-06-22 15:50:30.480' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101266, N'JDILWPOF8KES9KGACYD4WYNF84LVVF7YDND5S3XW0BYH88YHY9', CAST(N'2016-06-22 15:50:30.853' AS DateTime), CAST(N'2016-06-22 15:50:30.857' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101269, N'NY7NCUSLU7N6WG8ZV8XJE0J9FLF3U4XQ6077N50A6FQ4S0YY5P', CAST(N'2016-06-22 15:50:30.953' AS DateTime), CAST(N'2016-06-22 15:50:30.960' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101272, N'EI1PG8RPVL42R9QYSGJ0Z5XJBQZ8NSAIXNROCZNQMBBWY72GFS', CAST(N'2016-06-22 15:51:52.943' AS DateTime), CAST(N'2016-06-22 15:51:53.510' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101275, N'STJ46Q4VRKINC5XD5S3M4GV6JYSA49J7SUAELH489WTINBG7GG', CAST(N'2016-06-22 15:51:53.623' AS DateTime), CAST(N'2016-06-22 15:51:53.630' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101278, N'XX59O1Q76JT9ZTX3UUUI925YYA5ZN8ZDCOHH5I6JS05EHZMGR5', CAST(N'2016-06-22 15:51:57.083' AS DateTime), CAST(N'2016-06-22 15:51:57.090' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101281, N'NBI34Z295CE8ZGB2BOPWIXJ53VOTI0TT7HOVNBNPDWG1C5IYWE', CAST(N'2016-06-22 15:51:57.120' AS DateTime), CAST(N'2016-06-22 15:51:57.123' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101284, N'1HUC46VCT72NMPPSD4EXQ40S5RZ8MXP541BK0K9WY4Y11RMXYL', CAST(N'2016-06-22 15:51:57.187' AS DateTime), CAST(N'2016-06-22 15:51:57.200' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101287, N'C9WEM8JHLVCEN3X1ZQLTJX5HY5T3M1MRWLUDLPMD83EYBIKSEC', CAST(N'2016-06-22 15:52:40.003' AS DateTime), CAST(N'2016-06-22 15:52:40.010' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101290, N'GUMG2DNN8JLS9ZPQH0570Z1B6LNCLQBIOYOGGSPRE76LWAK9KR', CAST(N'2016-06-22 15:52:40.103' AS DateTime), CAST(N'2016-06-22 15:52:40.110' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101293, N'465B4CDPDZYLNHI1MCNOFBXMALWD027LIVERTH1H6ZATGKO2NU', CAST(N'2016-06-22 15:52:43.413' AS DateTime), CAST(N'2016-06-22 15:52:43.427' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101296, N'OZ0CCFGA6BLAZXFDDHXWNUV1VUAH0XJZE1TTQJ3591658YNS82', CAST(N'2016-06-22 15:52:43.457' AS DateTime), CAST(N'2016-06-22 15:52:43.467' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101299, N'FVJZKLEFU327LI036U131Z2AJ0DTJQCIS016COGG4PSYDN70VD', CAST(N'2016-06-22 15:52:43.533' AS DateTime), CAST(N'2016-06-22 15:52:43.540' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101302, N'LZIMTZWAMQNR3J5GVNV5C6Z7QTORWTQ2XTWDNDLFE2DLN79Q6Q', CAST(N'2016-06-22 15:58:48.577' AS DateTime), CAST(N'2016-06-22 15:58:48.597' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101305, N'5RDN12YVF19GEZ1SNS5CLQXMC13VVO3GT0BFKEN3H49WFL9GRY', CAST(N'2016-06-22 15:58:48.627' AS DateTime), CAST(N'2016-06-22 15:58:48.637' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101308, N'7C9ZPGXQJWTXYL5KZNNXKI8J8MMNY50XG377QREDBJEVGDBNLS', CAST(N'2016-06-22 15:58:48.830' AS DateTime), CAST(N'2016-06-22 15:58:48.843' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101311, N'EMWPZXZMWGE4ZRDPXDPYEYHT477ZP9SM67GB21ILDWR7ZHT9ZT', CAST(N'2016-06-22 15:59:12.807' AS DateTime), CAST(N'2016-06-22 15:59:13.730' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101314, N'8QD777FHZ1P5O7XOOBPZMSQVPVTIQLUHQZCCV59PZQPL58SM89', CAST(N'2016-06-22 15:59:13.910' AS DateTime), CAST(N'2016-06-22 15:59:13.920' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101317, N'YA26IJHY1H77390BLU2HDK42FGCAS87LKGS1P3N65YHQ9JEALV', CAST(N'2016-06-22 15:59:18.363' AS DateTime), CAST(N'2016-06-22 15:59:18.380' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101320, N'JK20IT5MJSQT0M3DOIKHQDUKJ9AXH4J3YS92RHKZJSO8AG1QO6', CAST(N'2016-06-22 15:59:18.450' AS DateTime), CAST(N'2016-06-22 15:59:18.470' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101323, N'7YM461BCZSMWYZSGYXE3GZOTDYJAFOL8OBI6JKP1SYC7MM0XGT', CAST(N'2016-06-22 15:59:18.590' AS DateTime), CAST(N'2016-06-22 15:59:18.603' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101326, N'7G8UGC5G24I80P3OSSJWRG1BT7ZOGH1JMRPUPDCKGHVIWUC9NM', CAST(N'2016-06-22 16:01:01.953' AS DateTime), CAST(N'2016-06-22 16:01:02.680' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101329, N'TW5E15RX7EEKUEVI6N7BWVRMHCF8VDOR2OVQO00TFBXFPJOY15', CAST(N'2016-06-22 16:01:02.833' AS DateTime), CAST(N'2016-06-22 16:01:02.840' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101332, N'THY97RGKXTFHQI9M7CMTVO3IQBOHWUN8ST59Q8ISZ7OR7NEW5K', CAST(N'2016-06-22 16:01:06.467' AS DateTime), CAST(N'2016-06-22 16:01:06.520' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101335, N'ICO6M68D2R6GAT5FTAO8QJPU2LGDJGOIZIGDMOJYJ5OXSC0TFA', CAST(N'2016-06-22 16:01:06.657' AS DateTime), CAST(N'2016-06-22 16:01:06.667' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101338, N'5SYHQF9I3S1IR70573FZXM5I7BUESDJR8535M8JP9TZR19ER7F', CAST(N'2016-06-22 16:01:36.713' AS DateTime), CAST(N'2016-06-22 16:01:36.720' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101341, N'9DNK6KDOQGAWD4TUQDZEFO1DFSNNR28J1IX8IAN2FXREL1D8DU', CAST(N'2016-06-22 16:01:36.813' AS DateTime), CAST(N'2016-06-22 16:01:36.817' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101344, N'5ICD39LHI11D78M4RY98KQ94LYBECK96MYSP8HYY8K9G93AY4S', CAST(N'2016-06-22 16:01:54.223' AS DateTime), CAST(N'2016-06-22 16:01:54.237' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101347, N'0ZK3RKOSSGRNGP0J2LWUFXB7GL6YU3RHRAU5PPFMACOXXKTNXJ', CAST(N'2016-06-22 16:01:54.383' AS DateTime), CAST(N'2016-06-22 16:01:54.397' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101350, N'TCGNQ5JSFP8CUA8VB79QZW2ODMB7OPR94V1TNYLKMQCEYJCFST', CAST(N'2016-06-22 16:03:01.783' AS DateTime), CAST(N'2016-06-22 16:03:02.650' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101353, N'RYWPJDR2P2468YOIL3JDTAOQSQSPBAJIC2X4A4KXU28NXSVSWX', CAST(N'2016-06-22 16:03:02.823' AS DateTime), CAST(N'2016-06-22 16:03:02.837' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101356, N'Y9NY92QT21J1V5YK3C4AABGFSOF4GKHQWFUKCENYSL9F9ILWH6', CAST(N'2016-06-22 16:03:07.427' AS DateTime), CAST(N'2016-06-22 16:03:07.447' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101359, N'G1O9PEM2DKHT4B5ZO1CO0LTX30JSJ73TNCBBKPDJKYI2IVNCPS', CAST(N'2016-06-22 16:03:07.583' AS DateTime), CAST(N'2016-06-22 16:03:07.593' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101362, N'7Z8H76MRNZI53X580FFT0MDD9GA2Q8VQ5EQCPAVSY588JJFMNJ', CAST(N'2016-06-22 16:03:43.610' AS DateTime), CAST(N'2016-06-22 16:03:43.623' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101365, N'9J4TVLKLRU2NNJ80CAXEZFOA50TUTQT7SHM5VMM2TKE7KBHTHD', CAST(N'2016-06-22 16:03:43.813' AS DateTime), CAST(N'2016-06-22 16:03:43.833' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101368, N'27MFHQJR10OO6TI6XI94OTPBORE6ZC28V4TF09J1OKGAQ69THN', CAST(N'2016-06-22 16:03:48.663' AS DateTime), CAST(N'2016-06-22 16:03:48.677' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101371, N'R3CCW5CK5ZGNP3EYIGBJIOAN0062NY3I2T4JXPK78IFGBUVQRD', CAST(N'2016-06-22 16:03:48.847' AS DateTime), CAST(N'2016-06-22 16:03:48.873' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101374, N'A5UD57T0SCR5FHHZXK33OWFPZCZCZAS8IZP5MAYJYP2U1QUO45', CAST(N'2016-06-22 16:04:03.647' AS DateTime), CAST(N'2016-06-22 16:04:03.657' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101377, N'MBDVCNFTYEQNZF6STKQBEUBGQC0B70WAA9FK9U8N87W77B1CTQ', CAST(N'2016-06-22 16:04:03.820' AS DateTime), CAST(N'2016-06-22 16:04:03.853' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101380, N'9XAWR4U6E8MH83TS8RA2LIGVEZWWIWOIZ6MEDV8A3NPQGHT6TR', CAST(N'2016-06-22 16:04:41.153' AS DateTime), CAST(N'2016-06-22 16:04:41.163' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101383, N'BH78FJS1I36ZRPXKKMSNKBRSAKFOLDMZM9H7J70KX1UPH9WDNL', CAST(N'2016-06-22 16:04:41.353' AS DateTime), CAST(N'2016-06-22 16:04:41.360' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101386, N'WQPPGOIIJ7L5GRJKWIAMJAN49QL4QXDFFBSY6UVK27W0ZCFVP7', CAST(N'2016-06-22 16:04:47.583' AS DateTime), CAST(N'2016-06-22 16:04:47.620' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101389, N'MO54SAM3320PYQCEHSLT9OSAZZD9RZD1RXWU4ASW6SPYDAG9BO', CAST(N'2016-06-22 16:04:47.917' AS DateTime), CAST(N'2016-06-22 16:04:47.933' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101392, N'C41OVSJ6V5RB0UP74C5260GU2TCW93KUGHXE4WNI1HPDWCUD2G', CAST(N'2016-06-22 16:05:20.937' AS DateTime), CAST(N'2016-06-22 16:05:20.947' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101395, N'EOXZI6H1Z0BSKGSZG7NO5TRRYDVOCKIB3KT798ERVVUCX3WJWA', CAST(N'2016-06-22 16:05:21.130' AS DateTime), CAST(N'2016-06-22 16:05:21.143' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101398, N'YBCCFNXBP86RUGZT75XU9T7RT98RQF4J6UAM56KCGGMQORXN3V', CAST(N'2016-06-22 16:05:36.147' AS DateTime), CAST(N'2016-06-22 16:05:36.193' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101401, N'WAJMMWRZ7FHVR59V1QV1RKMUIDYAU7D80KCCFG885QZ25Q0DQA', CAST(N'2016-06-22 16:05:36.250' AS DateTime), CAST(N'2016-06-22 16:05:36.273' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101404, N'E2KW28N9IYEN0BHBLG3GHUZBSP2YXUYCQHT3NRXTW29PE43TZW', CAST(N'2016-06-22 16:05:36.407' AS DateTime), CAST(N'2016-06-22 16:05:36.423' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101407, N'W1T74QNSXR4B40QQ65HI3C4ZHDCIJH37ERVCQ5H0PQ71BVKI7Z', CAST(N'2016-06-22 16:06:09.967' AS DateTime), CAST(N'2016-06-22 16:06:09.983' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101410, N'66JYJF39K0FWMOPLVR2XA1FSWG20VZGY0RMHOYF0NJEQYGTVJZ', CAST(N'2016-06-22 16:06:10.247' AS DateTime), CAST(N'2016-06-22 16:06:10.333' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101413, N'JGCEKTMULY18RV4ONF5WGUCD6QYB395QCFNUYKHR7YLP2DEJKN', CAST(N'2016-06-22 16:06:49.480' AS DateTime), CAST(N'2016-06-22 16:06:50.147' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101416, N'VQ13IKTOY4QWAHL5UBOQ3VP422GWOJN51C9AICM5JTFO7HWZ8Q', CAST(N'2016-06-22 16:06:50.277' AS DateTime), CAST(N'2016-06-22 16:06:50.287' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101419, N'K4UMT9ZVNY8AQC7ZQ8DVMROAYPLZL6WWJZSS1RX732AUY6JDWB', CAST(N'2016-06-22 16:07:35.807' AS DateTime), CAST(N'2016-06-22 16:07:36.860' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101422, N'DQO71ZVIWOQCZFAQNAKXFM5IR1GKGC6KFNTI9I8CPZWRUF85A9', CAST(N'2016-06-22 16:07:37.077' AS DateTime), CAST(N'2016-06-22 16:07:37.090' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101425, N'4GQ6XJ7CHBFIKK5WFGO3O9TBNVHUF58YZO4ASKOJ35FMYDURIY', CAST(N'2016-06-22 16:07:52.120' AS DateTime), CAST(N'2016-06-22 16:07:52.143' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101428, N'VC9U5P5H43VE64RM8TSA1EZKA1J6ZZ1ICNCNEP1TYU1G22DZ49', CAST(N'2016-06-22 16:07:52.183' AS DateTime), CAST(N'2016-06-22 16:07:52.210' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101431, N'K7ZQK4XA91NEQFNETRVPV9LWMBB1MK2RJCNRB520IS1MOQZWEZ', CAST(N'2016-06-22 16:07:52.373' AS DateTime), CAST(N'2016-06-22 16:07:52.383' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101434, N'IFXICQ1WWI1O5S5ZRZLBH6TIBST57NN4O5T7OF6JMCVB94BLGZ', CAST(N'2016-06-22 16:08:48.843' AS DateTime), CAST(N'2016-06-22 16:08:49.700' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101437, N'9GURW2ZP2EY8V94ZC6ARB8YT6K6YZCYCXQX4QTPFDTCA5LY702', CAST(N'2016-06-22 16:08:49.907' AS DateTime), CAST(N'2016-06-22 16:08:49.913' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101440, N'NL6GM8A41FY0JRGCZ47S50P4QTWBJTWMLBP0RZ0DX52NKHPOOH', CAST(N'2016-06-22 16:08:59.077' AS DateTime), CAST(N'2016-06-22 16:08:59.100' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101443, N'ZRPYTOWW7HXI3Q64V5UZVYLUHTX9RJ0OCLFFEJBG7NWZQ3VDE3', CAST(N'2016-06-22 16:08:59.237' AS DateTime), CAST(N'2016-06-22 16:08:59.267' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101446, N'HJR990S6I0UBCWDJGV2EL8ZCR51XV6MR2IW7MU01YZ5NZGYSMP', CAST(N'2016-06-22 16:08:59.397' AS DateTime), CAST(N'2016-06-22 16:08:59.420' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101449, N'MR6E9SMFU0HTOIGLZWKH66BYCJMPKV8MWCO2LNQ5B5DK9DMNTO', CAST(N'2016-06-22 16:09:10.237' AS DateTime), CAST(N'2016-06-22 16:09:10.267' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101452, N'RXSTCCPFLIAPU0C3U1LHN1IPGKYQL2WUCSEXL2LSCOB6UWOBUX', CAST(N'2016-06-22 16:09:10.537' AS DateTime), CAST(N'2016-06-22 16:09:10.667' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101455, N'76LKXG9QH3AQ9VRDL06UYR74V192FFCSSYON6KCM1B9AK8VE6J', CAST(N'2016-06-22 16:09:17.237' AS DateTime), CAST(N'2016-06-22 16:09:17.253' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101458, N'SGLFWQXEZETC79UGPNPUALXMZU8P4BO96A5O7XAFF5HTL5IU9T', CAST(N'2016-06-22 16:09:17.333' AS DateTime), CAST(N'2016-06-22 16:09:17.347' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101461, N'0M0KS06P8QB3G2GVQ8SNAPPAFRU62Q2SS0TTX2H6RD13PPHSMO', CAST(N'2016-06-22 16:09:17.520' AS DateTime), CAST(N'2016-06-22 16:09:17.533' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101464, N'A8ZDON0M3UY60G9MO7NXOSFCUO9AKUICJ60GNA034KHX03WN75', CAST(N'2016-06-22 17:23:12.883' AS DateTime), CAST(N'2016-06-22 17:23:13.900' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101467, N'XQ5BWA1PI5L0XEM1K10YD1MQL3INV1CVY27U6WZMXUDCK11YKZ', CAST(N'2016-06-22 17:23:14.113' AS DateTime), CAST(N'2016-06-22 17:23:14.133' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101470, N'ED6MU4JYIRTN62ZKG3V51DEXWG2MDRMSNSS76DR9OFPW0X230P', CAST(N'2016-06-22 17:23:29.693' AS DateTime), CAST(N'2016-06-22 17:23:29.723' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101473, N'9TECIFM9S7JYFJEZQQIRWKH0R2Y7VA43T3UONL8XQ83DPEKSTF', CAST(N'2016-06-22 17:23:29.863' AS DateTime), CAST(N'2016-06-22 17:23:29.880' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101476, N'EW97QRCH4TO8NDDELJBYHX5XH4BYJ1SZ4LQQM07F7477IO7ZIX', CAST(N'2016-06-22 17:23:30.010' AS DateTime), CAST(N'2016-06-22 17:23:30.020' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101479, N'CL3CL42Q8FB4666Y9SFUESZPL8HUV15UXGNSCB13AC7XY1H852', CAST(N'2016-06-22 17:23:41.137' AS DateTime), CAST(N'2016-06-22 17:23:41.150' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101482, N'WEYDT74A1RYTHM2B0XO1NBX47HWYUWI8UN2TAC3SDF39QFHYQ9', CAST(N'2016-06-22 17:23:41.183' AS DateTime), CAST(N'2016-06-22 17:23:41.253' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101485, N'AN04OL964JAS1KD32PMUR2XMOC6NC9DXW4JBPLL4I9D17AZE47', CAST(N'2016-06-22 17:23:41.397' AS DateTime), CAST(N'2016-06-22 17:23:41.407' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101488, N'GLYGX7VMKP9JYD89J15Y9GZA20A8G4PM2D69J9WZ9XYEQQXIQ8', CAST(N'2016-06-22 17:23:53.533' AS DateTime), CAST(N'2016-06-22 17:23:53.560' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101491, N'D2ZWD937CXOQ95BM13UCNXMA8IG9VUY8EY5ZQ7PRMF0IY8CIWJ', CAST(N'2016-06-22 17:23:53.597' AS DateTime), CAST(N'2016-06-22 17:23:53.627' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101494, N'P8IEKPP0IZN8T40EW4HKDVJ10IH73K3969VEDQZUWXUV4TJ6L5', CAST(N'2016-06-22 17:23:53.773' AS DateTime), CAST(N'2016-06-22 17:23:53.787' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101497, N'QE55VY39XSO1KDTOXIAJCG7SIGYR6J08MIEHH8ZS1PCK42X2U0', CAST(N'2016-06-22 17:24:01.040' AS DateTime), CAST(N'2016-06-22 17:24:01.050' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101500, N'866FA9ZI8BMTTJ03H8IY2QKASS3F96LBCFV8PJPDT2L8DG0I2N', CAST(N'2016-06-22 17:24:01.197' AS DateTime), CAST(N'2016-06-22 17:24:01.220' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101503, N'286JLFG7TPTFAO30HEGXWQZ79SXRR634BWKY4WEO58DF1EVXAF', CAST(N'2016-06-22 17:24:08.427' AS DateTime), CAST(N'2016-06-22 17:24:08.447' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101506, N'3QBDDM2AIOPBWLAQTXPQ00R9RDH9G728T2NY899TH0OMAWINSH', CAST(N'2016-06-22 17:24:08.477' AS DateTime), CAST(N'2016-06-22 17:24:08.490' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101509, N'Y6J21X5KS3EM53P54KDCV7TCM0DUZQKJZDPEPHQHIS33YD1CK8', CAST(N'2016-06-22 17:24:08.650' AS DateTime), CAST(N'2016-06-22 17:24:08.673' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101512, N'VXVDWZJS9FRUXYRBGQBY9SGMPSS2FFSHEZ66J9DO8PSIHLUU2Y', CAST(N'2016-06-22 18:46:19.900' AS DateTime), CAST(N'2016-06-22 18:46:20.737' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101515, N'HDSXHR49DPO6ROJ5ULZDD76YCX7LTBFPVWD1IV2X6IUFA97JGH', CAST(N'2016-06-22 18:46:20.783' AS DateTime), CAST(N'2016-06-22 18:46:20.800' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101518, N'DC5GXATMC3ADM34AHRVSCP03P5NO1WX4JDHI3GEPJ3K388DYRA', CAST(N'2016-06-22 18:46:20.997' AS DateTime), CAST(N'2016-06-22 18:46:21.003' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101521, N'27QZI9IL85EW3MIOHXBM8NGL41K6HFRGT4K02FIW2M8PI9SK2I', CAST(N'2016-06-22 18:46:53.330' AS DateTime), CAST(N'2016-06-22 18:46:56.790' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101524, N'3SKVNV78XKFSZQXTHMP38FSHD0TGJWQXJ9UJ4O0VNIZ20DII6Y', CAST(N'2016-06-22 18:46:56.967' AS DateTime), CAST(N'2016-06-22 18:46:56.980' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101527, N'YCHYE0XXJJB9BK0EVD669SVLSM3FIU0X60SEMVE0ZJCA3JG38X', CAST(N'2016-06-22 18:47:39.843' AS DateTime), CAST(N'2016-06-22 18:47:39.857' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101530, N'5Z859RM0Z111403L11HZTXUEE8ZY83M94MJ9RM5RBUL3YL5GQ9', CAST(N'2016-06-22 18:47:40.187' AS DateTime), CAST(N'2016-06-22 18:47:40.203' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101533, N'NS0QZ1EDEW45RZABH0N33GTSCV4K6X0N3TC1LJX54E3S7CRYL2', CAST(N'2016-06-22 18:47:43.660' AS DateTime), CAST(N'2016-06-22 18:47:43.670' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101536, N'5K10FDBMPF1X05HQ1QVHTQ6AN788AKLRUQTSTVNQWQCGGQUEUP', CAST(N'2016-06-22 18:47:43.823' AS DateTime), CAST(N'2016-06-22 18:47:43.847' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101539, N'CG9PHL4858L5QXLSXOFCHJZP84U2RA4PLZ7QZI8WPGDAZDLVRM', CAST(N'2016-06-22 18:48:01.977' AS DateTime), CAST(N'2016-06-22 18:48:02.830' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101542, N'TDEZQPSZJX7RT4R1M7QDG6R4QW56OPA787F2FDDTQ2UNHJG9YV', CAST(N'2016-06-22 18:48:03.023' AS DateTime), CAST(N'2016-06-22 18:48:03.040' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101545, N'5JPJNHF2GMP5NAWICX73LLZLG6AOB61T8A9JFHQ320O0JU85IR', CAST(N'2016-06-22 18:48:54.723' AS DateTime), CAST(N'2016-06-22 18:48:55.890' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101548, N'NH28JFHF5C29UQNCJE8Q519317EL4WCNTIIEFB6BW2ZWRAW5OC', CAST(N'2016-06-22 18:48:56.127' AS DateTime), CAST(N'2016-06-22 18:48:56.143' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101551, N'C5ONV112IAGTM8JYL1FJC5P5LFEZEAVFUX64R4IV6U0OVHDMMM', CAST(N'2016-06-22 18:49:04.523' AS DateTime), CAST(N'2016-06-22 18:49:04.540' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101554, N'317A27Z751XP8S4NEEJQPAWE9LGAX4NY7VEIDAV52IMIZ6WU9Y', CAST(N'2016-06-22 18:49:04.590' AS DateTime), CAST(N'2016-06-22 18:49:04.607' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101557, N'LT8LIJVGGKUHHYB3Y4R5FK9WJXLY0Q92XSV9LLKQTUW58KZAHK', CAST(N'2016-06-22 18:49:04.757' AS DateTime), CAST(N'2016-06-22 18:49:04.770' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101560, N'9IO9GEPOQ5D1HSCWB7N1BB5G1X81D7SE2MR7JQGJEDGLRFQH8S', CAST(N'2016-06-22 18:49:32.793' AS DateTime), CAST(N'2016-06-22 18:49:32.813' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101563, N'RAPKWPLY1OAUQYJCWWVG1LIYB9DPGUDHTI8ZR2646PP90STXHF', CAST(N'2016-06-22 18:49:32.947' AS DateTime), CAST(N'2016-06-22 18:49:32.983' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101566, N'3G81357Q6Q9CAX84RXINRKFO39DNPJIJKTXDELG7G7JL6D0L60', CAST(N'2016-06-22 18:49:33.120' AS DateTime), CAST(N'2016-06-22 18:49:33.140' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101569, N'ILXIBRYT3H7UL4NDFTI1OZWC432J32MV0566GO3MRDIV1ISB81', CAST(N'2016-06-22 18:50:11.450' AS DateTime), CAST(N'2016-06-22 18:50:11.480' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101572, N'F2ZYRT6FWPM0WVQQXV8F2GKDAM8KHSVGCQ6WNLWD4VJ0908AED', CAST(N'2016-06-22 18:50:11.517' AS DateTime), CAST(N'2016-06-22 18:50:11.537' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101575, N'YC63YCORW7FQRZ4VU3ONW0PX3JWQAHGOKSQNZ9H26Z4VRWYG42', CAST(N'2016-06-22 18:50:11.723' AS DateTime), CAST(N'2016-06-22 18:50:11.733' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101578, N'81FGJL8AOD6WLTHSZ6V87C85WABEY8L5VA7J8VPKQYKAM94CVX', CAST(N'2016-06-22 18:50:28.050' AS DateTime), CAST(N'2016-06-22 18:50:28.063' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101581, N'ZXY4QR7EB5NT7E2IRJZGKHEEJGDQH1EP88GXU02VMM74RYNKH8', CAST(N'2016-06-22 18:50:28.133' AS DateTime), CAST(N'2016-06-22 18:50:28.180' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101584, N'8LI2E91TAF1H25VN4MB1NVY5HZKQ4ISCC452OH5Q9N2L4198C6', CAST(N'2016-06-22 18:50:28.373' AS DateTime), CAST(N'2016-06-22 18:50:28.403' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101587, N'UO153GGI4MHA0IWX0QE89LLTDPPPW866Z8NF1WFXJCWCV84UK0', CAST(N'2016-06-22 18:50:59.373' AS DateTime), CAST(N'2016-06-22 18:51:07.197' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101590, N'466EFCOM0S39TSYIDMQT7HM4KVTNYOUM86EXSAMOOVOV7JRV0C', CAST(N'2016-06-22 18:51:14.563' AS DateTime), CAST(N'2016-06-22 18:51:14.587' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101593, N'CUQC2UI0Y2IYOIRNQP2FBV6VIE0NL489C142MROKBWKCLMDJV9', CAST(N'2016-06-22 18:51:14.790' AS DateTime), CAST(N'2016-06-22 18:51:14.807' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101596, N'R83BQEMX14S5O0QXFW4DXNFAEIF9GMBYB49P4S1ZJOIQ2TG5XX', CAST(N'2016-06-22 18:54:45.800' AS DateTime), CAST(N'2016-06-22 18:54:46.547' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101599, N'1HZ9VENGVHTX4CIIFDLE1F74ZXND5O22USWVYUU9ITQ1OW1B8E', CAST(N'2016-06-22 18:54:46.700' AS DateTime), CAST(N'2016-06-22 18:54:46.737' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101602, N'2EEYLLVNJTLLHR7ODZ0VPN75LIBCG9929I49RR5SH9MXE33AYN', CAST(N'2016-06-22 18:55:21.550' AS DateTime), CAST(N'2016-06-22 18:55:21.560' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101605, N'RA4V00OGNSDL114HZX2AKJSHWS374VBBG7FCN76Y27M2ZRP78C', CAST(N'2016-06-22 18:55:21.747' AS DateTime), CAST(N'2016-06-22 18:55:21.763' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101608, N'K5KLWJTZG2QM9CWFHNN0YQTYA6MOHMWWT62EG0WJ5ZAZBFEDMK', CAST(N'2016-06-22 18:55:50.547' AS DateTime), CAST(N'2016-06-22 18:55:50.577' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101611, N'B1394PR33U7IVXI590R7BVZ7XCO01FOG65BS268U1NXTG4XL8V', CAST(N'2016-06-22 18:55:50.627' AS DateTime), CAST(N'2016-06-22 18:55:50.637' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101614, N'DLZLS3PY8PRZFJLWLV9TAOA4TW7S4XMXT87L8I03V22SHW0R2P', CAST(N'2016-06-22 18:55:50.820' AS DateTime), CAST(N'2016-06-22 18:55:50.833' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101617, N'DYEDD2ILTXAP61U8IKHU51TZEW7YV2ONWHKZYSPTMATKOGWIU9', CAST(N'2016-06-22 18:55:59.810' AS DateTime), CAST(N'2016-06-22 18:55:59.850' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101620, N'HJ3FT7MQGLJ3SXNX1U18M3PUMD07USEEPUE1TUT6SFL798VZ1O', CAST(N'2016-06-22 18:55:59.910' AS DateTime), CAST(N'2016-06-22 18:55:59.927' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101623, N'I40RGMKLKG3LCJQPDPJULW0RIXJZX9CVBX9UY6KGNTQ6AZX6VI', CAST(N'2016-06-22 18:56:00.103' AS DateTime), CAST(N'2016-06-22 18:56:00.117' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101626, N'SN89F62GPEJ79WS5EMMV9ZJKBG8BBGD5KW49JEWNQ8Y0BT3OGP', CAST(N'2016-06-22 19:06:09.743' AS DateTime), CAST(N'2016-06-22 19:06:10.797' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101629, N'321W6P1S6QXPMI8GPB8B5DB8G7XCQIFZ55HAAQGEAD1PPOD23F', CAST(N'2016-06-22 19:06:11.423' AS DateTime), CAST(N'2016-06-22 19:06:11.437' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101632, N'B3IH396BJL9XIBPMCE111JHNKRAN30ICMLWBW3ZIWD2HJENXDR', CAST(N'2016-06-22 19:06:23.607' AS DateTime), CAST(N'2016-06-22 19:06:23.627' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101635, N'UWS75GG645X8VQHMF2Y1CNC7XC842Y9QBHDLOE0DH65NJ1IZLP', CAST(N'2016-06-22 19:06:24.120' AS DateTime), CAST(N'2016-06-22 19:06:24.130' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101638, N'IH609LQEUBXTFC71Z7D2U502OBJ90KGGDFTV7711YP3VRC71SS', CAST(N'2016-06-22 19:07:20.357' AS DateTime), CAST(N'2016-06-22 19:07:21.587' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101641, N'MAMAM93ZDXVBLSZBCI8UWM4N6S2VVJ9IR4Y0IJX0K1FH1DOJRL', CAST(N'2016-06-22 19:07:34.953' AS DateTime), CAST(N'2016-06-22 19:07:34.963' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101644, N'TXDIH0R2SFK4D92JJ6INHS3GTEZDLSWVOPPVNAORVCOBVFDW9X', CAST(N'2016-06-22 19:07:35.300' AS DateTime), CAST(N'2016-06-22 19:07:35.307' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101647, N'R61IIZ6XMG8WS6976400DG946HDKYA888PWGFV0EJGFDTXD31H', CAST(N'2016-06-22 19:07:50.057' AS DateTime), CAST(N'2016-06-22 19:07:50.087' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101650, N'9I5ETZVPI019INUHXAO8K9CL1IRJ860IFFBQ3T55TH6CK2LFQC', CAST(N'2016-06-22 19:07:50.520' AS DateTime), CAST(N'2016-06-22 19:07:50.530' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101653, N'WNP9G8QUO74ISL5YEOTLO0EWN5V3W0EKZ3QBZIIUY4S0DEKTF0', CAST(N'2016-06-22 19:09:55.270' AS DateTime), CAST(N'2016-06-22 19:09:56.360' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101656, N'ALGGROHKCB3UTFHX7BQM7YJJMEE4XB7S8R3MKWAT5QSKJTE8WD', CAST(N'2016-06-22 19:09:56.897' AS DateTime), CAST(N'2016-06-22 19:09:56.910' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101659, N'I4HWT7RLCBRTDE9AZTK1UU7WII2HR9KYORTDI8921XHW3MS4D2', CAST(N'2016-06-22 19:14:17.830' AS DateTime), CAST(N'2016-06-22 19:14:18.117' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101662, N'VWUHRIIOIB9GCD8Z0MVUVUDH85B0JOTJ1TA4NEVGDQNCI8I5WN', CAST(N'2016-06-22 19:14:18.480' AS DateTime), CAST(N'2016-06-22 19:14:18.487' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101665, N'AZU28HZ856A6YNZCX1MUMGOXQKIURUY27HS3K3ZU9JIDMP9TK1', CAST(N'2016-06-22 19:15:06.013' AS DateTime), CAST(N'2016-06-22 19:15:06.027' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101668, N'E3MQJAWXDVE52W6WLRM2K1BRJOLEXTU0GOKPWSIDYCSBO8E58P', CAST(N'2016-06-22 19:15:06.413' AS DateTime), CAST(N'2016-06-22 19:15:06.423' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101671, N'FLW5SBZQ030JQ4RPLBKPJE936AAW2T1XN7LVXF80NW4NEM5XUN', CAST(N'2016-06-22 19:15:32.120' AS DateTime), CAST(N'2016-06-22 19:15:32.130' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101674, N'OTJOAHMNKG9S36YO4UC42DJUOGP7WJLR8W9J7JQ1TLIF9GWH6T', CAST(N'2016-06-22 19:15:32.677' AS DateTime), CAST(N'2016-06-22 19:15:32.687' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101677, N'47ORCRQE98D3HRK4A7AXJOLVXW883TLWL299XOHYYB8XOUUVZJ', CAST(N'2016-06-22 19:15:56.563' AS DateTime), CAST(N'2016-06-22 19:15:56.577' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101680, N'2QXMFODMCHJRWS9198PYHYQX6O72EW0TVMAINKL06A4KNL3G36', CAST(N'2016-06-22 19:15:56.987' AS DateTime), CAST(N'2016-06-22 19:15:56.997' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101683, N'710QUFNS4X06J17883XWAT3Z0PP12VEJZ48VXF6G6WHTW6YAGO', CAST(N'2016-06-22 19:16:27.367' AS DateTime), CAST(N'2016-06-22 19:16:27.380' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101686, N'WGS85I74UXMRKNHV0GF4L8FAWNQ8WRMYNMGHAHNS8JZAZLQ47N', CAST(N'2016-06-22 19:16:27.860' AS DateTime), CAST(N'2016-06-22 19:16:27.870' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101689, N'HSBI3JFTS74M5LE60F64JDMS4SKY7SKUHDFOWYG4ENPO7KD398', CAST(N'2016-06-22 19:17:06.867' AS DateTime), CAST(N'2016-06-22 19:17:06.877' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101692, N'LW46EBCI1X8L9TLQO56BHZ8MXXMIDRGSQK797MZN2G0M93IGXW', CAST(N'2016-06-22 19:17:07.273' AS DateTime), CAST(N'2016-06-22 19:17:07.280' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101695, N'7UCYLD7R2WJ57GEV5VW2W3IOZPJTRJBDGOYLEEAQV32YA7LQON', CAST(N'2016-06-22 19:17:21.077' AS DateTime), CAST(N'2016-06-22 19:17:21.120' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101698, N'YQVMTJ5VPOZ1U1ZLX80998PXMVL5AD4XUN7Z0KN0RRPSEW4YAY', CAST(N'2016-06-22 19:17:21.157' AS DateTime), CAST(N'2016-06-22 19:17:21.170' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101701, N'W95HWFS3SX5Q92OIW9FA7IU0WNK0LFJT4777RHR2YQKFDNDJFL', CAST(N'2016-06-22 19:17:21.570' AS DateTime), CAST(N'2016-06-22 19:17:21.580' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101704, N'XUGO1CE3DBUTT7JMLWMY514IR8WRWVW5CGWURXF1N9KURV7R1I', CAST(N'2016-06-22 19:18:20.063' AS DateTime), CAST(N'2016-06-22 19:18:20.077' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101707, N'QUY9RK3LQZQRHPMYVKOKXIBOVMR7PGTCTBZJZ2ZQW0UXF3Y2ZW', CAST(N'2016-06-22 19:18:20.647' AS DateTime), CAST(N'2016-06-22 19:18:20.657' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101710, N'OAR2OIVLYSARDINNIGOFLXU3AZ1PELBNK01064AJ91HJ1OE927', CAST(N'2016-06-22 19:20:52.327' AS DateTime), CAST(N'2016-06-22 19:20:53.457' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101713, N'YPJPF1UXF4O9Q53ZT5AVHCMRFRQRTMEH58E1XGUAT6K8FKONOX', CAST(N'2016-06-22 19:20:54.023' AS DateTime), CAST(N'2016-06-22 19:20:54.037' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101716, N'MAU00S92R28G71SLYLFUSCOQJGOHNGKWF3X76TSYIKS5HY4V8Y', CAST(N'2016-06-22 19:21:08.653' AS DateTime), CAST(N'2016-06-22 19:21:08.667' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101719, N'X2DW6CVUF9273P2DSZPUB39EY6NKJO37MVHNL918IOBWDKYMEY', CAST(N'2016-06-22 19:21:09.397' AS DateTime), CAST(N'2016-06-22 19:21:09.407' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101722, N'2ARY8O2G69DNHQT54NS48G1M1UGRW8IKIE8GX71U9690EIS843', CAST(N'2016-06-22 19:21:36.187' AS DateTime), CAST(N'2016-06-22 19:21:36.197' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101725, N'6FKMJHZ5EZHMLY0PSDRC61OGTZIB17EIRKZ29WKDYZKYG1WLSR', CAST(N'2016-06-22 19:21:36.593' AS DateTime), CAST(N'2016-06-22 19:21:36.600' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101728, N'JTU3O9SU3L98WZ9C5EP6TTXU2INFVPI7UPIFNTNHW84QELMY41', CAST(N'2016-06-22 19:25:11.030' AS DateTime), CAST(N'2016-06-22 19:25:11.960' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101731, N'8VWEKARRMRGKEJQJD4KTHVG5PGFK9E96VOKMBREAJX54ZBUGBP', CAST(N'2016-06-22 19:25:12.463' AS DateTime), CAST(N'2016-06-22 19:25:12.473' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101734, N'ZENZ08WHT7PE1E1AJIWRWB7ZALFLI4LTKF3A3B4VUDMR37UHMF', CAST(N'2016-06-22 19:25:26.257' AS DateTime), CAST(N'2016-06-22 19:25:28.167' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101737, N'BERN993Y5LPZZLH1HMNMT27O3A6RZQ05KGECU9F1RN19Q42EOP', CAST(N'2016-06-22 19:25:28.610' AS DateTime), CAST(N'2016-06-22 19:25:28.623' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101740, N'QKE83127U3ZUFT3MYPCD7PF3DFZGGJ3P3ZT0JHBJFXZRGXZP1T', CAST(N'2016-06-22 19:25:34.687' AS DateTime), CAST(N'2016-06-22 19:25:34.710' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101743, N'EH1XMX1GW4QIUI7JDKLSEUZCRSG5LDC19CZNS7WR6S50AV3SAO', CAST(N'2016-06-22 19:25:35.143' AS DateTime), CAST(N'2016-06-22 19:25:35.153' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101746, N'0LC4ZBI9453GLDOL67SCT4VB3VDC18JM7GCAWQ6YNYWWJHHAX0', CAST(N'2016-06-22 19:25:56.697' AS DateTime), CAST(N'2016-06-22 19:25:56.717' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101749, N'MI63PFB7ND57YQ2KENZXH0UN6CKKAU0N7JLMFQF133GIUFO3TA', CAST(N'2016-06-22 19:25:57.260' AS DateTime), CAST(N'2016-06-22 19:25:57.313' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101752, N'23CRKHGD8JFW539LY7GTWMIZWPE4T2BNL4Y94H2L9PK5MJTFMZ', CAST(N'2016-06-22 19:27:26.703' AS DateTime), CAST(N'2016-06-22 19:27:26.737' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101755, N'X3N22FB6400RVW1VEAK77DB2B0J0HU0589Y81CYFU6HWTRH0WY', CAST(N'2016-06-22 19:27:27.193' AS DateTime), CAST(N'2016-06-22 19:27:27.207' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101758, N'8529XD3RA8XQB6RM68MFJ112PDXI9QTLZPNQ6G53P7BF459BCZ', CAST(N'2016-06-22 19:27:58.990' AS DateTime), CAST(N'2016-06-22 19:28:02.707' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101761, N'1QEPT7HWDBTLUT83GK2JBBK32R173SP96PYYFT7RJUCWAIPJET', CAST(N'2016-06-22 19:28:03.223' AS DateTime), CAST(N'2016-06-22 19:28:03.233' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101764, N'LKMKI7LROEP2RJKLGZVVB3T9NA5F9TF7SXWZ0MBGZERYR3LRUG', CAST(N'2016-06-22 19:28:16.510' AS DateTime), CAST(N'2016-06-22 19:28:16.523' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101767, N'J3WFL38ZSMVQ6K8IF09V8DZBX349JVV33HW7RJEH6CMLQUTCZ4', CAST(N'2016-06-22 19:28:16.930' AS DateTime), CAST(N'2016-06-22 19:28:16.940' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101770, N'R4P1P0SQ88L636Q0ALJKXGLD4Y7N9ADSPHQ82N4FYBJ2OTESUM', CAST(N'2016-06-22 20:23:54.473' AS DateTime), NULL)
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101773, N'7KCJP0GID0OQ5B6NCAQCZ24EGPLR3PYCH284DVSVVBSG9ACOLN', CAST(N'2016-06-22 20:24:57.267' AS DateTime), NULL)
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101776, N'O4B8FDUG4SWPGN4KLIESLDMVRQU3OT2PZIXNEEJQZC3I6I637R', CAST(N'2016-06-22 20:25:37.900' AS DateTime), NULL)
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101779, N'BZNAJK447H3EZ63REU4GVPLUQ45HO6RJL34AG85I2PBFLNNRXZ', CAST(N'2016-06-22 20:26:36.470' AS DateTime), NULL)
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101782, N'EZ2MDCRD5S0IG1EI7LZWMFW2FCV8XJJOENF9XNIR6HPDRH43TJ', CAST(N'2016-06-22 20:42:15.727' AS DateTime), NULL)
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101785, N'CM9ZH5FLHAXHNS7KGAF58IRUIFFLI44JQAXFCREMZN6CDD33HI', CAST(N'2016-06-22 20:43:05.130' AS DateTime), CAST(N'2016-06-22 20:43:06.020' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101788, N'3P405XKTJ9TQ7MDPVEBKFUU2GAH6S1NTYJYWQFHJY1UEH48V1R', CAST(N'2016-06-22 20:43:06.457' AS DateTime), CAST(N'2016-06-22 20:43:06.470' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101791, N'QZT1GQHXKX7KL94SLZDHNBM2ROO6Z0K4OVPVRKQMRF159FL5AF', CAST(N'2016-06-22 20:43:25.810' AS DateTime), CAST(N'2016-06-22 20:43:25.837' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101794, N'DWGQZLG6MYX8ZX7P0UNVUG6B515V4TTGU8VI0ABUJA8E3CP8JA', CAST(N'2016-06-22 20:43:26.263' AS DateTime), CAST(N'2016-06-22 20:43:26.290' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101797, N'8FI6MB8YVO1WV7SLXJJPELIPYZKI1I46BRARZEQ7SP01UHWGZK', CAST(N'2016-06-22 20:44:37.953' AS DateTime), CAST(N'2016-06-22 20:44:38.257' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101800, N'XUAOWETALOOHWS28OX1WP0U1VXLPUDCMZ9IDCG6JVCIIYWN9QJ', CAST(N'2016-06-22 20:44:38.453' AS DateTime), CAST(N'2016-06-22 20:44:38.483' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101803, N'IDS24R6B23WB7SIBLE0WDZ0YXQCJDJL12DXCM3TG98UQCO8D52', CAST(N'2016-06-22 20:45:41.400' AS DateTime), CAST(N'2016-06-22 20:45:42.370' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101806, N'XN5FJ16W0550SHLEZOBTX6F4EXG676VLTR9ZHGC5QZDXU9DG1U', CAST(N'2016-06-22 20:56:49.937' AS DateTime), CAST(N'2016-06-22 20:56:50.430' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101809, N'OMU9HJQ2V0C2DPZT3XBN6F2C7G054J1I3CDEZVKQN00CYG7GMN', CAST(N'2016-06-22 20:56:50.627' AS DateTime), CAST(N'2016-06-22 20:56:50.640' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101812, N'036EVD8YRAZ71BZ98CN63N9AGZKTXFC38U4HJ2IDRHXA3X14Q6', CAST(N'2016-06-22 21:00:45.077' AS DateTime), CAST(N'2016-06-22 21:00:45.660' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101815, N'IZEV10QA9WM683YD3XR7Q03SWO73DLAJWEHANN39K67KCTECX9', CAST(N'2016-06-22 21:00:45.857' AS DateTime), CAST(N'2016-06-22 21:00:45.867' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101818, N'5VG7G6V1GZZ65FXURIFKJMONKCIG86RORBZYB3RTPROJSBF3AO', CAST(N'2016-06-22 21:01:47.760' AS DateTime), CAST(N'2016-06-22 21:01:48.247' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101821, N'PRGFEKJOGEB1FILWTJLEP822BXE7KKHFL4A04ENTU6KGJ8QLTC', CAST(N'2016-06-22 21:01:48.420' AS DateTime), CAST(N'2016-06-22 21:01:48.430' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101824, N'RN5H50O0VBZKN80AOCN7BKTN2CBCOVGXLJBJDKX746XAZR8H2M', CAST(N'2016-06-22 21:08:08.287' AS DateTime), CAST(N'2016-06-22 21:08:11.027' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101827, N'BUWPW6IER19FYIM04Y6HRA43D7HTY8F369A9FLQE74QKIH7XG1', CAST(N'2016-06-22 21:08:11.190' AS DateTime), CAST(N'2016-06-22 21:08:11.200' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101830, N'P5MHCXF089YV5Y4W97N8T7QRA9LTEAQ9BLFT4OKIE3C6DPQ914', CAST(N'2016-06-23 01:44:57.733' AS DateTime), CAST(N'2016-06-23 01:44:58.150' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101833, N'3F4W2FS538DFQVABMI8UYIOEIHEVWRZZ5SYJD6201OUT2T502S', CAST(N'2016-06-23 01:44:58.413' AS DateTime), CAST(N'2016-06-23 01:44:58.427' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101836, N'3WF9FYNEKON6S09G8G05HJ15NJ94S2IP6S6SH4ZICGZJM20HRS', CAST(N'2016-07-07 19:54:51.560' AS DateTime), CAST(N'2016-07-07 19:54:57.057' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101839, N'6DVF1RGMA94J8WO2YM9PQ8KZDDBWVZO29W0RXG5XPAR7WSGJKS', CAST(N'2016-07-07 19:54:57.603' AS DateTime), CAST(N'2016-07-07 19:54:57.623' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101842, N'HPH1PROXA10277W6W5VVE798KQR13KD3VUXHM1X63T46S3GBGQ', CAST(N'2016-07-07 19:55:11.447' AS DateTime), CAST(N'2016-07-07 19:55:11.470' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101845, N'OC89KIC0PIPUZNZE2T5OZD826CNJUSZGSFPCQSNYE4DZM55PY2', CAST(N'2016-07-07 19:55:11.797' AS DateTime), CAST(N'2016-07-07 19:55:11.817' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101848, N'MR8DGVIAM7APSZUP7G55DYEQ5G2OE5VHB358UHWVOKKKSSV1X1', CAST(N'2016-07-07 19:55:30.960' AS DateTime), CAST(N'2016-07-07 19:55:31.010' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101851, N'JSCFRLIF0HKHL3CWTYAD7YRQWNH1Z5B93H3HH14SKQ40I0GXKL', CAST(N'2016-07-07 19:55:31.343' AS DateTime), CAST(N'2016-07-07 19:55:31.360' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101854, N'CZJ4GVTPO3UHTK2JQA8KW9N8TB98BU587DF6ILQLM2P9LIUZTJ', CAST(N'2016-07-07 19:56:02.367' AS DateTime), CAST(N'2016-07-07 19:56:04.347' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101857, N'49J9D1ACN2WYEZIZXLY0F09DERLK626JG65ZEHV70W178AHMMC', CAST(N'2016-07-07 19:56:04.837' AS DateTime), CAST(N'2016-07-07 19:56:04.847' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101860, N'6OR1C0OY2NMTQNCZ6SJY4W940CUICO6LKCYG9UPDJ9ZDQR52G1', CAST(N'2016-07-07 19:56:10.547' AS DateTime), CAST(N'2016-07-07 19:56:10.577' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101863, N'MG0LZLFWUDUPXIUHK3PKBW2PZSOPJ30E4ZHXSF3UZWMDG4B7C2', CAST(N'2016-07-07 19:56:10.810' AS DateTime), CAST(N'2016-07-07 19:56:10.827' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101866, N'NSZPRGY9ODBUM16568AS4ONFSF5JB5O3FJS3NGTE7E5AGEBNIV', CAST(N'2016-07-07 19:56:19.330' AS DateTime), CAST(N'2016-07-07 19:56:19.440' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101869, N'OT74DADVYE2CQBSQO7ZEOI5IVOYC7GUEEISL7F4N1UZT7O49H6', CAST(N'2016-07-07 19:56:19.687' AS DateTime), CAST(N'2016-07-07 19:56:19.710' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101872, N'DROJPXIFI9IW79KK9HALEWAOLXPI8IU0P4WI5U1Z5FTQKM5N3N', CAST(N'2016-07-07 19:56:20.030' AS DateTime), CAST(N'2016-07-07 19:56:20.087' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101875, N'EB1I7JSRB4WY5RAFKCL1PTVAH1KVI8W1L14U8OSV9FQJW1MPV6', CAST(N'2016-07-14 13:26:03.277' AS DateTime), CAST(N'2016-07-14 13:26:03.780' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101878, N'TLVGFWPJ1B7BZYKRLQ3WWWMJVY4BNYQ89XZQK9FLMPNAS3ZRCV', CAST(N'2016-08-31 16:26:10.820' AS DateTime), CAST(N'2016-08-31 16:26:11.350' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101881, N'4FCM1PHIL24XKPE3P8BZZOMRC0SHE99RHAT6FWH388KC87K29A', CAST(N'2016-08-31 16:27:48.747' AS DateTime), CAST(N'2016-08-31 16:27:49.223' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101884, N'9FKQHG6Q5LJBHHF26HGJ99BO11JOBL6NALBC34ISF15G81WZYM', CAST(N'2016-08-31 16:28:27.173' AS DateTime), CAST(N'2016-08-31 16:28:27.350' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101887, N'U9N6BENX9XWIW6XZFKED2MR6QJRM6RPC5QQWK4UQCKVARPOBI5', CAST(N'2016-08-31 16:28:27.573' AS DateTime), CAST(N'2016-08-31 16:28:27.583' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101890, N'S46VV7XD2UD0NXYA5HFWAFW34N6CEO0MHJQALFLIPT1TPDDB6E', CAST(N'2016-08-31 16:28:33.193' AS DateTime), CAST(N'2016-08-31 16:28:33.200' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101893, N'GO41IS2B3UU2N31NWB6T7ASD2O6FN5CV6O7SF4U1IO22ZHPJPL', CAST(N'2016-09-04 11:38:03.010' AS DateTime), CAST(N'2016-09-04 11:38:06.427' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101896, N'01TXVHSIMKHNUOB5N6UIFM2NXWTUOHORSZWDFEDO6MPQ9ZF8F9', CAST(N'2016-09-04 11:38:06.683' AS DateTime), CAST(N'2016-09-04 11:38:06.697' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101899, N'8JHYFXXI9KPB5WHBI88RQQXHL2LU7Z0HB4MPKDPFQ0MHR7RB4Q', CAST(N'2016-09-04 20:13:41.977' AS DateTime), CAST(N'2016-09-04 20:13:42.707' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101902, N'PYS1G87CC87VU0UAJASLTMHZLEHGTG54FHX04KPG1EE2IVAET2', CAST(N'2016-09-04 20:13:43.067' AS DateTime), CAST(N'2016-09-04 20:13:43.083' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101905, N'Z18B9MMK4HFW9VWBJK9LTWQCGINJXH5348NKVJMNJ2IE37WYQX', CAST(N'2016-09-04 20:13:58.930' AS DateTime), CAST(N'2016-09-04 20:13:58.953' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101908, N'MW4HWA82QMIZRV36Y3A75IRRHW4YPVF26N0E29BQSAVW6VLLN2', CAST(N'2016-09-04 20:13:59.230' AS DateTime), CAST(N'2016-09-04 20:13:59.243' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101911, N'ITGXDRMTBGZ7AJ7LBPCCV5OGJL8O71D665TU8DUARXMAYD4KTW', CAST(N'2016-09-04 20:50:56.790' AS DateTime), CAST(N'2016-09-04 20:50:57.303' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101914, N'DVZNIKV8HYBK4LLG9Q5DQPZL255ES58YR9TBP71D6VDLVVLR27', CAST(N'2016-09-04 20:50:57.623' AS DateTime), CAST(N'2016-09-04 20:50:57.637' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101917, N'GBOPH7METPUTQZJ92DBK5U95ANFY5YLKJER0BF7TC984M6IXHQ', CAST(N'2016-09-04 20:51:13.153' AS DateTime), CAST(N'2016-09-04 20:51:13.190' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101920, N'W2X94SCCLF2PWV1RGOI6DU1Q9395CDFD31AIU0LASVV3CJN2DR', CAST(N'2016-09-04 20:51:13.420' AS DateTime), CAST(N'2016-09-04 20:51:13.433' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101923, N'2MHRGUREBVJTULU64ZF7RZN927GAOD2CP8MTR8YCX6RT9ORF1Q', CAST(N'2016-09-08 13:55:39.320' AS DateTime), CAST(N'2016-09-08 13:55:39.933' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101926, N'ZQR0HVDKW9JRLC322DH0H3H9ZRD9MXVIF9G4A11KVQCVYFN2NR', CAST(N'2016-09-08 13:55:40.323' AS DateTime), CAST(N'2016-09-08 13:55:40.340' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101929, N'VH7GNNGGBC9S6ZILWJCCY7ZUHZY4Q51PPIGNESFGG5SEDVRXIA', CAST(N'2016-09-08 13:56:01.620' AS DateTime), CAST(N'2016-09-08 13:56:01.740' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101932, N'INCHR7Q7M5NOZP2U3YZHKCZ3MPXDED72R6SMVWR9VOGRFHWXX1', CAST(N'2016-09-08 13:56:07.123' AS DateTime), CAST(N'2016-09-08 13:56:07.140' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101935, N'VFN0R2VN85V9Z3OAXEWIYRLAVLECUNA56X8AE7M5LUCDK4SQZT', CAST(N'2016-09-08 13:56:23.700' AS DateTime), CAST(N'2016-09-08 13:56:23.763' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101938, N'MU99TVMBHY6Q3ZOUU7GIRGIJ3GPZKQ9V0PE7GZFLZ7HI7KHU3C', CAST(N'2016-09-08 13:56:24.097' AS DateTime), CAST(N'2016-09-08 13:56:24.107' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101941, N'FB7E2YLND1O4DWASQN07DGJQ0T7VAYE7KJIQC6MBZ57GQ78CT9', CAST(N'2016-09-08 13:57:06.450' AS DateTime), CAST(N'2016-09-08 13:57:06.507' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101944, N'4QZXC06Z42APFHKFI1IFOVV2XR814TMN82RDP92N2SPXUMZ6K7', CAST(N'2016-09-08 13:57:06.940' AS DateTime), CAST(N'2016-09-08 13:57:06.957' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101947, N'YS2P1N7J11FE6N4JE0MS6XCPSODJSCKTU2YHJ1W08RQGXQ1A55', CAST(N'2016-09-29 11:32:01.340' AS DateTime), CAST(N'2016-09-29 11:32:02.320' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101950, N'IBBPK08QUMC0XPZ5XC40P6X3A909NJU32C34P73GW85B6XRG5J', CAST(N'2016-09-29 11:32:02.937' AS DateTime), CAST(N'2016-09-29 11:32:02.970' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101953, N'TVAAZ9OOU88A6A57ZOGBT7WICL3M9F88NNZLPPRBW1NUZ7KV9V', CAST(N'2016-09-29 11:32:53.977' AS DateTime), CAST(N'2016-09-29 11:32:54.543' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101956, N'67QHT88ANALJMKIQ6W8XBST3MWLH75PZGIEUAISVQICLXLGS9P', CAST(N'2016-09-29 11:32:54.920' AS DateTime), CAST(N'2016-09-29 11:32:54.947' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101959, N'VNSFQRS3M4UF7OQ4KSMPEIABLSIE0441Y4XUEWE65808EKXRXM', CAST(N'2016-09-29 11:33:40.817' AS DateTime), CAST(N'2016-09-29 11:33:40.883' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101962, N'R68K1X9Z6KB7JEP4CDZXTJVHJO6SEYSN2F0TE3541H98UA82PO', CAST(N'2016-09-29 11:33:41.357' AS DateTime), CAST(N'2016-09-29 11:33:41.387' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101965, N'IP0ZU2LPMHDUMYHDL2FJKB8QXVZ2HL4QTU2RC4SVH7FZG98YRO', CAST(N'2016-09-29 11:33:42.363' AS DateTime), CAST(N'2016-09-29 11:33:42.603' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101968, N'4LUYK7EN5PEMYCVDUIN586710C6AP7LSTXB4W41ZXCYKR6FROY', CAST(N'2016-09-29 11:33:42.920' AS DateTime), CAST(N'2016-09-29 11:33:42.987' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101971, N'SDJ34C94BAYQ1ZT1VVNGCD522BESA4IXV18M03YKYZMCB9USVC', CAST(N'2016-09-29 11:33:55.370' AS DateTime), CAST(N'2016-09-29 11:33:55.387' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101974, N'84SNRXZ2307M8VBIA6T2JEYM1R8ZHJCQFOR3IPC1EL8C1N0XRD', CAST(N'2016-09-29 11:33:55.643' AS DateTime), CAST(N'2016-09-29 11:33:55.660' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101977, N'R9FSRUFWCHW6XBTZSS2GY3YBOPSBTA6BU77PIOU5KHMIH2FELS', CAST(N'2016-09-29 11:34:27.007' AS DateTime), CAST(N'2016-09-29 11:34:27.037' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101980, N'IO11UO6KLA8O17TKQLMHSSVKWJ3YJD52OZDMKGNLYURN4J4IPC', CAST(N'2016-09-29 11:34:27.393' AS DateTime), CAST(N'2016-09-29 11:34:27.413' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101983, N'DJ2K89HON0TGM0R49G3I4PSOJ4ZF934IG130FKSHGR27VXB6AF', CAST(N'2016-09-29 11:35:47.617' AS DateTime), CAST(N'2016-09-29 11:35:47.637' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101986, N'TBA5VU7MFQ1CSV9MNRA4CQK9IKTMGJYB0OMIX66YWDP7LBHB6G', CAST(N'2016-09-29 11:35:47.887' AS DateTime), CAST(N'2016-09-29 11:35:47.910' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101989, N'TU8CW2XBRV9G7F526E3CUC5F6U8LFQXJKKDFGCO3DNVYSEFWP7', CAST(N'2016-09-29 11:36:20.350' AS DateTime), CAST(N'2016-09-29 11:36:20.370' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101992, N'0HZKRTMD7DY80W8AD2D5FH49SG546YKWI64AL3FVPY4RMG498J', CAST(N'2016-09-29 11:36:20.687' AS DateTime), CAST(N'2016-09-29 11:36:20.703' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101995, N'CLRRQGAAMVC6LQWPB0TT62IKC3HFA3QGXZSH7IRCS7SX5ZR7RR', CAST(N'2016-09-29 11:37:18.527' AS DateTime), CAST(N'2016-09-29 11:37:18.550' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (101998, N'WXPDT65E19UGEI7W7LJTW46ZJ05VG8A0AZ41K586EY6KF5WUT7', CAST(N'2016-09-29 11:37:18.883' AS DateTime), CAST(N'2016-09-29 11:37:18.903' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (102001, N'N8JQDKVMWV0X79RKOAYD4J7M173WFIBVN7222DX12J26IKU5FY', CAST(N'2016-09-29 11:37:40.987' AS DateTime), CAST(N'2016-09-29 11:37:41.017' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (102004, N'H73J0BEODGX8ZENS41TZKRHV3I9IQU105E98X8XP4D56XJ39D5', CAST(N'2016-09-29 11:37:41.307' AS DateTime), CAST(N'2016-09-29 11:37:41.327' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (102007, N'53XZHDS38HYZJHA4J6VK1Q5AFFGA7B9SWS8R1O0JJLC9JVCYSA', CAST(N'2016-10-06 15:29:59.577' AS DateTime), CAST(N'2016-10-06 15:29:59.947' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (102010, N'RZRX8IL1RQ0QWVO4RM36PM5LHWNIGXQUWVG4KO8MZQWVUSKRPK', CAST(N'2016-10-06 15:30:00.130' AS DateTime), CAST(N'2016-10-06 15:30:00.140' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (102013, N'TPYKD33CPSPHF7Z1IWY8V0T47FEYWC7JFY2YVO00A7T8KMD9ZI', CAST(N'2016-10-06 15:30:17.533' AS DateTime), CAST(N'2016-10-06 15:30:17.567' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (102016, N'YSTGKFTK0EUSO1ZGCPQFGCH1XGRPK3WEQHY0U2ZHR3X3EXZGN0', CAST(N'2016-10-06 15:30:17.667' AS DateTime), CAST(N'2016-10-06 15:30:17.680' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (102019, N'GKUQ0RQUBXRKW66VXEYU7MUJ7SVDNQHIGDFS2EO2IG6QNA2WWN', CAST(N'2016-10-06 15:30:17.820' AS DateTime), CAST(N'2016-10-06 15:30:17.830' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (102022, N'KDA0DF3EUJQ32MZ5AQTM83Y3Q9FYHPBJU2KWDQK15SICWBJEUG', CAST(N'2016-10-06 15:30:32.407' AS DateTime), CAST(N'2016-10-06 15:30:32.417' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (102025, N'RHYNDJZYOYKADROIBYNMDP6XR7262ORPBUD91VVNXE9U9M3VVK', CAST(N'2016-10-06 15:30:32.450' AS DateTime), CAST(N'2016-10-06 15:30:32.470' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (102028, N'S1VY0XXSST4RXDRANT57CIHUNRLY45P6YX9177NWSSETAD52PE', CAST(N'2016-10-06 15:30:32.643' AS DateTime), CAST(N'2016-10-06 15:30:32.653' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (102031, N'KB0JS415ZIOIZT1BKEP71OWN5AUK98YQYSIB6WJ9OOF0V3WJEB', CAST(N'2016-10-06 15:30:48.003' AS DateTime), CAST(N'2016-10-06 15:30:48.047' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (102034, N'IA7SZEVUGPZMXIBDEZNEIFBQTDK3D06GSIK1H675CYSCC2Z92Q', CAST(N'2016-10-06 15:30:48.107' AS DateTime), CAST(N'2016-10-06 15:30:48.117' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (102037, N'Z293FPS3R8WE6OITZPVT8PO84QORGNRJIF1TPHXQ4A1ZLG1PAC', CAST(N'2016-10-06 15:30:48.263' AS DateTime), CAST(N'2016-10-06 15:30:48.273' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (102040, N'PJBAYHSK1LNJ9OMYHNKOOO3FTALZRVDNVO3L89CD0FADVBD3NT', CAST(N'2016-10-06 15:31:30.987' AS DateTime), CAST(N'2016-10-06 15:31:40.300' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (102043, N'6M5GLFMFGQ5YDYJQOSH68VM7ENVJQ59X9A2415P2D6G60U0VG2', CAST(N'2016-10-06 15:32:05.640' AS DateTime), CAST(N'2016-10-06 15:32:05.667' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (102046, N'3N9HW5NKU0FQ611XBAMD2VZ75UAWB6PP1P0EOPXZ8D0MP3LQ3N', CAST(N'2016-10-06 15:32:06.007' AS DateTime), CAST(N'2016-10-06 15:32:06.023' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (102049, N'B9NEMS93S70X6X2FQV433J4YSDGL93RNB6PQ9LUXLOXV58O0IS', CAST(N'2016-10-06 15:33:30.040' AS DateTime), CAST(N'2016-10-06 15:33:36.273' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (102052, N'CI6CC2NT7YEXSRRWQBH968XLE9GF1KN82RY2ELYNDM4IDG2CMR', CAST(N'2016-10-06 15:33:44.417' AS DateTime), CAST(N'2016-10-06 15:33:44.457' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (102055, N'WU4ZFSIXMCW7LJ24NW7AVAL0L63U7P6TFRAMR9GHYDI5NM7YP8', CAST(N'2016-10-06 15:33:44.780' AS DateTime), CAST(N'2016-10-06 15:33:44.797' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (102058, N'6P9EGKC42KDP661W0ORO1KK1QGEZ6A1L108D6GFNDYB06Y4BJ9', CAST(N'2016-10-06 15:40:19.987' AS DateTime), CAST(N'2016-10-06 15:40:21.933' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (102061, N'ENCWAZYOL5XWYU64AES4V8IR402VVDICXTLNPO3F529CILMB9M', CAST(N'2016-10-06 15:40:22.100' AS DateTime), CAST(N'2016-10-06 15:40:22.110' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (102064, N'C2GMN7KPG488THFI32HG4WUP74MZWOL65U1PQO5WSAG253FPDF', CAST(N'2016-10-06 15:41:06.937' AS DateTime), CAST(N'2016-10-06 15:41:06.973' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (102067, N'601EAY3QWP5IMMBQKTC2K43X9FRL70BBN17VLJ5KU5K2K2OTBN', CAST(N'2016-10-06 15:41:07.260' AS DateTime), CAST(N'2016-10-06 15:41:07.277' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (102070, N'HOG6PUQ22MIC1QOHMLK1TU8FMZ0BYK17T1074VH3C1XBA4C8OQ', CAST(N'2016-10-06 15:48:03.920' AS DateTime), CAST(N'2016-10-06 15:48:05.013' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (102073, N'BC09SSZGR9NY8HNBJZ0VH88ISBV56698UNURDLODGKD0YNGGEF', CAST(N'2016-10-06 15:48:05.337' AS DateTime), CAST(N'2016-10-06 15:48:05.353' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (102076, N'H5U3PPQ7T8N6853RK7Z8ZQ8CZWS2KP4PQKYO0YW81A4ZRM0VL5', CAST(N'2016-10-06 15:52:08.893' AS DateTime), CAST(N'2016-10-06 15:52:09.203' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (102079, N'J9T07RHKJ429A2KD1IWME399G4K5TG9CTHS0MX3OEDR9A58YW7', CAST(N'2016-10-06 15:52:09.407' AS DateTime), CAST(N'2016-10-06 15:52:09.420' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (102082, N'3066UIKQUQPO6WD3H2WUHJU6XY6CNUUV7AG795CQM9OLU0E480', CAST(N'2016-10-06 15:53:52.503' AS DateTime), CAST(N'2016-10-06 15:53:52.533' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (102085, N'3K9SP6D9GSK9N8RYNICNX3K5IMFOT311N4EQPRRV5Y6WBRJ0P8', CAST(N'2016-10-06 15:53:52.817' AS DateTime), CAST(N'2016-10-06 15:53:52.840' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (102088, N'TFDION6LGA6S9G2TEWPC33KOB59XEIAOIOHLTGZ8XDRN0Y3QA8', CAST(N'2016-10-06 15:55:07.237' AS DateTime), CAST(N'2016-10-06 15:55:07.263' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (102091, N'76SBJHQ8Q7PSD1VDMRT5SUSCZPTOPQD6W12SMC0L2AQZ7BBLUN', CAST(N'2016-10-06 15:55:07.597' AS DateTime), CAST(N'2016-10-06 15:55:07.613' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (102094, N'20EZEKE6CE5ZXB1MRUL362QWMAW55HWR3YYDNC9SP274L9Q7NN', CAST(N'2016-10-06 15:55:29.540' AS DateTime), CAST(N'2016-10-06 15:55:29.583' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (102097, N'D8U9PG7EEJ35COXJHSFB89LKGCMXUF8VTWJBM53X6H8KZ3F2CF', CAST(N'2016-10-06 15:55:29.980' AS DateTime), CAST(N'2016-10-06 15:55:30.003' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (102100, N'4MY4U5ZW55B679G1MSYAP4ONJJ5E16NJ2DJXA7TKB67I3R07EA', CAST(N'2016-10-06 15:55:36.500' AS DateTime), CAST(N'2016-10-06 15:55:36.513' AS DateTime))
GO
INSERT [Keys] ([id], [val], [created], [deleted]) VALUES (102103, N'56UGIJYQ90VORVJTYNFVOWZKG4O64OL0PHFQGJLU6KCH4I2E84', CAST(N'2016-10-06 15:55:36.697' AS DateTime), CAST(N'2016-10-06 15:55:36.710' AS DateTime))
GO
SET IDENTITY_INSERT [Keys] OFF
GO
INSERT [Leagues] ([AssetID], [SessionID], [Name], [Description], [Night], [EZRegister], [EZSchedule], [Cost], [Display], [Enabled], [Deleted]) VALUES (22, 20, N'Division A', N'aaa', 4, N'test', N'https://tms.ezfacility.com/OnlineRegistrations/Register.aspx?CompanyID=5325&GroupID=1583638', 125.75, 1, 1, 1)
GO
INSERT [Leagues] ([AssetID], [SessionID], [Name], [Description], [Night], [EZRegister], [EZSchedule], [Cost], [Display], [Enabled], [Deleted]) VALUES (42, 21, N'Men''s 30 & Over Division', N'Sunday Morning Basketball League', 7, N'https://tms.ezfacility.com/OnlineRegistrations/Register.aspx?CompanyID=5325&GroupID=1583638', N'https://tms.ezfacility.com/OnlineRegistrations/Register.aspx?CompanyID=5325&GroupID=1583638', 200, 1, 1, 0)
GO
INSERT [Leagues] ([AssetID], [SessionID], [Name], [Description], [Night], [EZRegister], [EZSchedule], [Cost], [Display], [Enabled], [Deleted]) VALUES (43, 21, N'Men''s Competitive Division', N'Sunday Night Basketball League', 7, N'https://tms.ezfacility.com/OnlineRegistrations/Register.aspx?CompanyID=5325&GroupID=1583638', N'', 200, 1, 1, 0)
GO
INSERT [Leagues] ([AssetID], [SessionID], [Name], [Description], [Night], [EZRegister], [EZSchedule], [Cost], [Display], [Enabled], [Deleted]) VALUES (45, 44, N'Men''s 30 & Over Division', N'Here is the description

And some more...', 7, N'https://tms.ezfacility.com/OnlineRegistrations/Register.aspx?CompanyID=5325&GroupID=1583638', N'', 175, 1, 1, 0)
GO
INSERT [Leagues] ([AssetID], [SessionID], [Name], [Description], [Night], [EZRegister], [EZSchedule], [Cost], [Display], [Enabled], [Deleted]) VALUES (72, 71, N'Co-ed 4''s - A Division', N'A Division, Co-ed 4''s. Will take up to 9 teams - 4 time slots per night with games starting at 7.', 2, N'yahoo.com', N'', 200, 5, 1, 0)
GO
INSERT [Leagues] ([AssetID], [SessionID], [Name], [Description], [Night], [EZRegister], [EZSchedule], [Cost], [Display], [Enabled], [Deleted]) VALUES (73, 71, N'Co-ed 4''s - B Division', N'B Division, Co-ed 4''s. Will take up to 9 teams - 4 time slots per night with games starting at 7.', 2, N'yahoo.com', N'', 200, 8, 1, 0)
GO
INSERT [Leagues] ([AssetID], [SessionID], [Name], [Description], [Night], [EZRegister], [EZSchedule], [Cost], [Display], [Enabled], [Deleted]) VALUES (74, 71, N'Co-ed 4''s - BB Division', N'Co-ed 4''s - BB Division', 2, N'Co-ed 4''s - BB Division', N'', 200, 1, 1, 0)
GO
INSERT [Leagues] ([AssetID], [SessionID], [Name], [Description], [Night], [EZRegister], [EZSchedule], [Cost], [Display], [Enabled], [Deleted]) VALUES (75, 71, N'Co-ed 6''s - B Division', N'Co-ed 6''s - B Division', 1, N'http://www.google.com', N'http://www.google.com', 200, 1, 1, 0)
GO
INSERT [Leagues] ([AssetID], [SessionID], [Name], [Description], [Night], [EZRegister], [EZSchedule], [Cost], [Display], [Enabled], [Deleted]) VALUES (76, 71, N'Co-ed 6''s - BB/B Division', N'Co-ed 6''s - BB/B Division', 4, N'Co-ed 6''s - BB/B Division', N'', 200, 4, 1, 0)
GO
INSERT [Leagues] ([AssetID], [SessionID], [Name], [Description], [Night], [EZRegister], [EZSchedule], [Cost], [Display], [Enabled], [Deleted]) VALUES (99, 98, N'Co-ed 4''s - BB Division', N'Co-ed 4''s - BB Division', 2, N'', N'', 200, 1, 1, 0)
GO
INSERT [Leagues] ([AssetID], [SessionID], [Name], [Description], [Night], [EZRegister], [EZSchedule], [Cost], [Display], [Enabled], [Deleted]) VALUES (100, 98, N'Co-ed 6''s - B Division', N'Co-ed 6''s - B Division', 1, N'', N'', 200, 1, 1, 0)
GO
INSERT [Leagues] ([AssetID], [SessionID], [Name], [Description], [Night], [EZRegister], [EZSchedule], [Cost], [Display], [Enabled], [Deleted]) VALUES (101, 98, N'Co-ed 6''s - BB/B Division', N'Co-ed 6''s - BB/B Division', 4, N'', N'', 200, 4, 1, 0)
GO
INSERT [Leagues] ([AssetID], [SessionID], [Name], [Description], [Night], [EZRegister], [EZSchedule], [Cost], [Display], [Enabled], [Deleted]) VALUES (102, 98, N'Co-ed 4''s - A Division', N'A Division, Co-ed 4''s. Will take up to 9 teams - 4 time slots per night with games starting at 7.', 2, N'', N'', 200, 5, 1, 0)
GO
INSERT [Leagues] ([AssetID], [SessionID], [Name], [Description], [Night], [EZRegister], [EZSchedule], [Cost], [Display], [Enabled], [Deleted]) VALUES (103, 98, N'Co-ed 4''s - B Division', N'B Division, Co-ed 4''s. Will take up to 9 teams - 4 time slots per night with games starting at 7.', 2, N'', N'', 200, 8, 1, 0)
GO
INSERT [Leagues] ([AssetID], [SessionID], [Name], [Description], [Night], [EZRegister], [EZSchedule], [Cost], [Display], [Enabled], [Deleted]) VALUES (105, 104, N'Co-ed 4''s - BB Division', N'Co-ed 4''s - BB Division', 2, N'', N'', 200, 1, 1, 0)
GO
INSERT [Leagues] ([AssetID], [SessionID], [Name], [Description], [Night], [EZRegister], [EZSchedule], [Cost], [Display], [Enabled], [Deleted]) VALUES (106, 104, N'Co-ed 6''s - B Division', N'Co-ed 6''s - B Division', 1, N'', N'', 200, 1, 1, 0)
GO
INSERT [Leagues] ([AssetID], [SessionID], [Name], [Description], [Night], [EZRegister], [EZSchedule], [Cost], [Display], [Enabled], [Deleted]) VALUES (107, 104, N'Co-ed 6''s - BB/B Division', N'Co-ed 6''s - BB/B Division', 4, N'', N'', 200, 4, 1, 0)
GO
INSERT [Leagues] ([AssetID], [SessionID], [Name], [Description], [Night], [EZRegister], [EZSchedule], [Cost], [Display], [Enabled], [Deleted]) VALUES (108, 104, N'Co-ed 4''s - A Division', N'A Division, Co-ed 4''s. Will take up to 9 teams - 4 time slots per night with games starting at 7.', 2, N'', N'', 200, 5, 1, 0)
GO
INSERT [Leagues] ([AssetID], [SessionID], [Name], [Description], [Night], [EZRegister], [EZSchedule], [Cost], [Display], [Enabled], [Deleted]) VALUES (109, 104, N'Co-ed 4''s - B Division', N'B Division, Co-ed 4''s. Will take up to 9 teams - 4 time slots per night with games starting at 7.', 2, N'', N'', 200, 8, 1, 0)
GO
INSERT [Leagues] ([AssetID], [SessionID], [Name], [Description], [Night], [EZRegister], [EZSchedule], [Cost], [Display], [Enabled], [Deleted]) VALUES (112, 111, N'First Bocce Session', N'Here is the desc', 2, N'https://tms.ezfacility.com/OnlineRegistrations/Register.aspx?CompanyID=5325&GroupID=1611110', N'', 250, 1, 1, 0)
GO
INSERT [Lessons] ([AssetID], [SportID], [Name], [Rate], [Hourly], [Benefit1], [Benefit2], [Benefit3], [Value], [Display], [Enabled], [Deleted]) VALUES (36, 16, N'1 on 1', 125, 1, N'Single person', N'Focused', N'Direct answers', N'1', 1, 1, 0)
GO
INSERT [Lessons] ([AssetID], [SportID], [Name], [Rate], [Hourly], [Benefit1], [Benefit2], [Benefit3], [Value], [Display], [Enabled], [Deleted]) VALUES (37, 16, N'3 on 1', 275, 1, N'Half of team', N'Work together', N'Still connect', N'3', 3, 1, 0)
GO
INSERT [Lessons] ([AssetID], [SportID], [Name], [Rate], [Hourly], [Benefit1], [Benefit2], [Benefit3], [Value], [Display], [Enabled], [Deleted]) VALUES (38, 16, N'2 on 1', 200, 1, N'Benefit for two', N'Another', N'And last', N'2', 2, 1, 0)
GO
INSERT [Lessons] ([AssetID], [SportID], [Name], [Rate], [Hourly], [Benefit1], [Benefit2], [Benefit3], [Value], [Display], [Enabled], [Deleted]) VALUES (48, 17, N'Dribbling & Shooting', 55, 1, N'Benefit 1', N'Benefit 2', N'Benefit 3', N'Dribbling', 1, 1, 0)
GO
INSERT [LessonsRegister] ([AssetID], [SportID], [First], [Last], [Parent], [Email], [Phone], [Participants], [Submitted], [Scheduled], [Instructor], [Deleted]) VALUES (39, 16, N'Steve', N'Healy', N'jim smith', N'Jim@yahoo.com', N'2165510980', 3, CAST(N'2016-06-16 14:37:43.453' AS DateTime), CAST(N'1753-01-01 00:00:00.000' AS DateTime), 0, 0)
GO
INSERT [LessonsRegister] ([AssetID], [SportID], [First], [Last], [Parent], [Email], [Phone], [Participants], [Submitted], [Scheduled], [Instructor], [Deleted]) VALUES (40, 16, N'Jon', N'James', N'Jonah James', N'thewhale@yahoo.com', N'1239876543', 2, CAST(N'2016-05-16 14:44:09.440' AS DateTime), CAST(N'2016-09-08 00:00:00.000' AS DateTime), 0, 0)
GO
INSERT [LessonsRegister] ([AssetID], [SportID], [First], [Last], [Parent], [Email], [Phone], [Participants], [Submitted], [Scheduled], [Instructor], [Deleted]) VALUES (41, 16, N'Jen', N'Santilla', N'Regina', N'jon@gmail.com', N'9998887777', 1, CAST(N'2016-06-16 14:46:58.357' AS DateTime), CAST(N'2016-07-08 04:00:00.000' AS DateTime), 0, 0)
GO
SET IDENTITY_INSERT [Log] ON 

GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (1, N'Functions', 1, 1, 0, CAST(N'2016-05-18 20:57:03.307' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (2, N'Functions', 2, 0, 0, CAST(N'2016-05-18 23:22:55.817' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (3, N'Functions', 2, 0, 0, CAST(N'2016-05-19 00:04:32.430' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (4, N'Functions', 2, 1, 0, CAST(N'2016-05-19 00:25:08.133' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (5, N'_Parent', 3, 0, 0, CAST(N'2016-05-19 14:31:33.620' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (6, N'Users', 4, 0, 4, CAST(N'2016-06-06 19:21:46.827' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (7, N'Users', 4, 0, 4, CAST(N'2016-06-06 19:26:54.587' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (8, N'Carousel', 13, 0, 4, CAST(N'2016-06-06 20:13:08.920' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (9, N'Carousel', 13, 0, 4, CAST(N'2016-06-06 20:13:30.567' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (10, N'Carousel', 14, 0, 4, CAST(N'2016-06-06 20:14:17.897' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (11, N'Carousel', 13, 0, 4, CAST(N'2016-06-13 17:25:13.520' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (12, N'Carousel', 13, 0, 4, CAST(N'2016-06-13 18:20:50.477' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (13, N'Carousel', 13, 0, 4, CAST(N'2016-06-13 19:55:13.773' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (14, N'Carousel', 15, 0, 4, CAST(N'2016-06-13 20:22:40.023' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (15, N'Carousel', 15, 0, 4, CAST(N'2016-06-13 20:22:50.360' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (16, N'Carousel', 15, 0, 4, CAST(N'2016-06-13 20:26:41.313' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (17, N'Carousel', 15, 0, 4, CAST(N'2016-06-13 20:26:47.767' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (18, N'Carousel', 15, 0, 4, CAST(N'2016-06-13 20:28:58.507' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (19, N'Carousel', 15, 0, 4, CAST(N'2016-06-13 20:29:04.000' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (20, N'Carousel', 15, 0, 4, CAST(N'2016-06-13 20:29:45.350' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (21, N'Carousel', 15, 0, 4, CAST(N'2016-06-13 20:29:54.983' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (22, N'Carousel', 15, 0, 4, CAST(N'2016-06-13 20:32:13.833' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (23, N'Carousel', 15, 0, 4, CAST(N'2016-06-13 20:32:20.980' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (24, N'Carousel', 15, 0, 4, CAST(N'2016-06-13 20:32:53.940' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (25, N'Sports', 16, 0, 4, CAST(N'2016-06-13 20:44:05.880' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (26, N'Sports', 17, 0, 4, CAST(N'2016-06-13 20:44:14.347' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (27, N'Sports', 16, 0, 4, CAST(N'2016-06-13 20:44:21.283' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (28, N'Sports', 17, 1, 4, CAST(N'2016-06-13 20:44:29.067' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (29, N'Sports', 18, 0, 4, CAST(N'2016-06-13 20:45:03.463' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (30, N'Sports', 16, 1, 4, CAST(N'2016-06-13 20:46:38.577' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (32, N'Sessions', 20, 0, 4, CAST(N'2016-06-14 02:46:43.077' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (33, N'Sessions', 21, 0, 4, CAST(N'2016-06-14 02:48:54.850' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (34, N'Leagues', 22, 0, 4, CAST(N'2016-06-15 14:02:00.213' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (35, N'News', 23, 0, 4, CAST(N'2016-06-15 14:29:26.570' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (36, N'Carousel', 14, 0, 4, CAST(N'2016-06-15 14:45:33.317' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (37, N'Events', 24, 0, 4, CAST(N'2016-06-15 14:55:57.127' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (38, N'Carousel', 15, 1, 4, CAST(N'2016-06-15 15:13:51.800' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (39, N'News', 25, 0, 4, CAST(N'2016-06-15 15:17:24.267' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (40, N'News', 26, 1, 4, CAST(N'2016-06-15 15:24:00.950' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (41, N'Events', 24, 0, 4, CAST(N'2016-06-15 15:38:24.457' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (42, N'Events', 24, 1, 4, CAST(N'2016-06-15 15:41:10.827' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (43, N'Users', 27, 0, 4, CAST(N'2016-06-15 15:41:53.060' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (45, N'Settings', 29, 0, 4, CAST(N'2016-06-15 17:39:42.697' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (46, N'Users', 4, 0, 4, CAST(N'2016-06-15 19:44:12.957' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (47, N'Users', 4, 0, 4, CAST(N'2016-06-15 19:48:29.727' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (48, N'Users', 27, 0, 4, CAST(N'2016-06-15 19:53:16.563' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (49, N'Users', 4, 0, 4, CAST(N'2016-06-15 19:53:32.613' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (50, N'Users', 27, 0, 4, CAST(N'2016-06-15 19:53:46.337' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (51, N'Users', 27, 0, 4, CAST(N'2016-06-15 19:56:41.957' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (52, N'Leagues', 22, 0, 4, CAST(N'2016-06-15 20:18:26.990' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (53, N'Leagues', 22, 0, 4, CAST(N'2016-06-15 20:18:32.697' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (54, N'Leagues', 22, 0, 4, CAST(N'2016-06-15 20:22:24.933' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (55, N'Leagues', 22, 0, 4, CAST(N'2016-06-15 20:22:30.667' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (56, N'Leagues', 22, 0, 4, CAST(N'2016-06-15 20:22:36.373' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (57, N'Lessons', 32, 0, 4, CAST(N'2016-06-15 21:56:23.027' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (58, N'Lessons', 32, 1, 4, CAST(N'2016-06-15 22:03:47.057' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (59, N'Lessons', 36, 1, 4, CAST(N'2016-06-16 13:08:43.367' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (60, N'Lessons', 37, 1, 4, CAST(N'2016-06-16 13:09:46.553' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (61, N'Lessons', 38, 1, 4, CAST(N'2016-06-16 13:13:06.240' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (62, N'LessonsRegister', 39, 0, 4, CAST(N'2016-06-16 14:41:53.280' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (63, N'LessonsRegister', 39, 0, 4, CAST(N'2016-06-16 14:42:49.080' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (64, N'LessonsRegister', 39, 1, 4, CAST(N'2016-06-16 14:42:58.207' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (65, N'Sessions', 20, 1, 4, CAST(N'2016-06-16 16:28:20.637' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (66, N'Sessions', 21, 0, 4, CAST(N'2016-06-16 16:28:39.890' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (67, N'Leagues', 42, 0, 4, CAST(N'2016-06-16 16:30:43.110' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (68, N'Leagues', 43, 1, 4, CAST(N'2016-06-16 16:31:56.760' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (69, N'Leagues', 42, 0, 4, CAST(N'2016-06-16 16:38:49.637' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (70, N'Leagues', 42, 0, 4, CAST(N'2016-06-16 16:46:04.890' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (71, N'Leagues', 42, 0, 4, CAST(N'2016-06-16 16:56:10.230' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (72, N'Sessions', 21, 0, 4, CAST(N'2016-06-16 17:05:51.700' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (73, N'Sessions', 21, 0, 4, CAST(N'2016-06-16 17:24:44.367' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (74, N'Sessions', 44, 0, 4, CAST(N'2016-06-16 17:25:04.923' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (75, N'Leagues', 45, 1, 4, CAST(N'2016-06-16 17:26:03.667' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (76, N'Leagues', 42, 1, 4, CAST(N'2016-06-16 17:31:05.603' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (77, N'Sessions', 44, 0, 4, CAST(N'2016-06-16 17:46:59.720' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (78, N'Sessions', 44, 1, 4, CAST(N'2016-06-16 17:48:04.103' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (79, N'Sessions', 21, 0, 4, CAST(N'2016-06-16 17:48:10.557' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (80, N'Sessions', 21, 0, 4, CAST(N'2016-06-16 17:56:56.190' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (81, N'Sports', 18, 0, 4, CAST(N'2016-06-16 18:05:07.993' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (82, N'Tournaments', 46, 0, 4, CAST(N'2016-06-16 18:15:34.130' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (83, N'Tournaments', 46, 0, 4, CAST(N'2016-06-16 18:15:50.120' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (84, N'LessonsRegister', 41, 1, 4, CAST(N'2016-06-16 18:20:33.783' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (85, N'Leagues', 22, 0, 4, CAST(N'2016-06-16 18:52:01.533' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (86, N'Sports', 47, 1, 4, CAST(N'2016-06-16 19:03:18.343' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (87, N'Lessons', 48, 0, 4, CAST(N'2016-06-20 12:40:43.157' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (88, N'Lessons', 48, 1, 4, CAST(N'2016-06-20 12:41:02.943' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (89, N'Users', 27, 0, 4, CAST(N'2016-06-22 19:11:24.587' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (90, N'Users', 27, 1, 4, CAST(N'2016-06-22 19:13:50.983' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (91, N'Photos', 52, 1, 4, CAST(N'2016-06-22 20:44:51.677' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (92, N'Users', 4, 1, 4, CAST(N'2016-06-22 20:45:42.427' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (93, N'Photos', 53, 1, 4, CAST(N'2016-06-22 20:57:08.277' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (94, N'Photos', 55, 1, 4, CAST(N'2016-06-22 21:01:53.633' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (95, N'Sponsors', 56, 0, 4, CAST(N'2016-06-22 21:08:23.917' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (96, N'Testimonials', 57, 0, 4, CAST(N'2016-06-23 01:42:17.677' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (97, N'Testimonials', 57, 0, 4, CAST(N'2016-06-23 01:42:43.223' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (98, N'Testimonials', 57, 0, 4, CAST(N'2016-06-23 01:45:05.597' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (99, N'Testimonials', 57, 1, 4, CAST(N'2016-06-23 01:45:12.807' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (100, N'SubscriptionTypes', 58, 1, 4, CAST(N'2016-06-23 14:36:47.743' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (101, N'SubscriptionTypes', 59, 1, 4, CAST(N'2016-06-23 14:37:01.210' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (102, N'SubscriptionTypes', 60, 1, 4, CAST(N'2016-06-23 14:37:15.820' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (103, N'Sessions', 21, 0, 4, CAST(N'2016-06-27 18:00:49.007' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (104, N'Sessions', 21, 1, 4, CAST(N'2016-06-27 18:01:57.983' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (105, N'Carousel', 13, 0, 4, CAST(N'2016-06-27 18:57:24.103' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (106, N'Carousel', 13, 1, 4, CAST(N'2016-06-27 18:57:46.750' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (107, N'News', 23, 1, 4, CAST(N'2016-06-27 19:02:39.197' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (108, N'Events', 63, 1, 4, CAST(N'2016-06-27 19:13:00.337' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (109, N'Events', 64, 1, 4, CAST(N'2016-06-27 19:13:54.693' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (110, N'Events', 65, 1, 4, CAST(N'2016-06-27 19:14:19.760' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (111, N'Carousel', 14, 1, 4, CAST(N'2016-06-27 19:19:58.037' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (112, N'News', 25, 1, 4, CAST(N'2016-06-27 19:20:32.407' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (113, N'Tournaments', 46, 0, 4, CAST(N'2016-06-27 19:37:26.687' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (114, N'Tournaments', 46, 0, 4, CAST(N'2016-06-27 19:40:42.587' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (115, N'Settings', 29, 0, 4, CAST(N'2016-06-27 19:52:43.053' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (116, N'Settings', 29, 0, 4, CAST(N'2016-06-27 19:56:24.077' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (117, N'Settings', 29, 0, 4, CAST(N'2016-06-27 19:58:44.847' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (118, N'Settings', 29, 0, 4, CAST(N'2016-06-27 20:09:18.437' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (119, N'Settings', 29, 0, 4, CAST(N'2016-06-27 20:10:22.267' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (120, N'Settings', 29, 0, 4, CAST(N'2016-06-27 20:10:34.597' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (121, N'Settings', 29, 1, 4, CAST(N'2016-06-27 20:10:45.657' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (122, N'Sponsors', 56, 0, 4, CAST(N'2016-06-27 20:20:03.127' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (123, N'Positions', 66, 0, 4, CAST(N'2016-06-30 13:47:37.223' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (124, N'Positions', 67, 0, 4, CAST(N'2016-06-30 13:47:54.240' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (125, N'Positions', 68, 0, 4, CAST(N'2016-06-30 13:48:10.367' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (126, N'Positions', 66, 1, 4, CAST(N'2016-06-30 18:48:45.420' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (127, N'Positions', 67, 1, 4, CAST(N'2016-06-30 18:48:53.310' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (128, N'Positions', 68, 1, 4, CAST(N'2016-06-30 18:49:01.187' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (129, N'Settings', 70, 0, 4, CAST(N'2016-06-30 21:20:07.630' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (130, N'Settings', 70, 0, 4, CAST(N'2016-06-30 21:20:34.840' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (131, N'Sessions', 71, 1, 4, CAST(N'2016-07-04 13:08:02.117' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (132, N'Leagues', 72, 0, 4, CAST(N'2016-07-04 13:08:33.057' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (133, N'Leagues', 73, 0, 4, CAST(N'2016-07-04 13:09:01.907' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (134, N'Leagues', 74, 1, 4, CAST(N'2016-07-04 13:09:28.010' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (135, N'Leagues', 75, 0, 4, CAST(N'2016-07-04 13:09:52.847' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (136, N'Leagues', 76, 0, 4, CAST(N'2016-07-04 13:10:17.547' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (137, N'Leagues', 22, 1, 4, CAST(N'2016-07-04 13:55:38.433' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (138, N'Settings', 70, 0, 4, CAST(N'2016-07-07 18:52:32.630' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (139, N'EventRegistration', 51, 1, 4, CAST(N'2016-07-07 19:25:37.237' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (140, N'Settings', 70, 0, 4, CAST(N'2016-07-14 15:25:44.403' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (141, N'Sponsors', 56, 0, 4, CAST(N'2016-07-14 16:15:28.873' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (142, N'Sponsors', 56, 0, 4, CAST(N'2016-07-14 16:17:39.587' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (143, N'Sponsors', 56, 0, 4, CAST(N'2016-07-14 16:23:34.787' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (144, N'Sponsors', 56, 1, 4, CAST(N'2016-07-14 16:23:43.190' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (145, N'Leagues', 72, 1, 4, CAST(N'2016-07-21 14:09:36.343' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (146, N'Leagues', 73, 0, 4, CAST(N'2016-07-21 14:11:04.920' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (147, N'Leagues', 76, 1, 4, CAST(N'2016-07-21 14:11:17.793' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (148, N'Leagues', 73, 1, 4, CAST(N'2016-07-21 14:17:45.690' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (149, N'Tournaments', 46, 1, 4, CAST(N'2016-08-06 13:08:17.727' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (150, N'Clinics', 78, 0, 4, CAST(N'2016-08-20 13:19:40.967' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (151, N'Clinics', 78, 0, 4, CAST(N'2016-08-20 13:31:13.487' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (152, N'Clinics', 78, 1, 4, CAST(N'2016-08-20 13:38:02.627' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (153, N'Users', 79, 0, 4, CAST(N'2016-08-20 13:46:14.277' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (154, N'Users', 79, 1, 4, CAST(N'2016-08-20 13:46:20.097' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (155, N'Settings', 70, 1, 4, CAST(N'2016-08-31 16:13:16.043' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (156, N'PhotoCategories', 80, 1, 4, CAST(N'2016-09-04 11:36:08.280' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (157, N'PhotoCategories', 81, 1, 4, CAST(N'2016-09-04 11:36:35.967' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (158, N'PhotoAlbums', 82, 0, 4, CAST(N'2016-09-04 11:36:59.660' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (159, N'Photos', 83, 1, 4, CAST(N'2016-09-04 11:38:17.610' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (160, N'Photos', 84, 1, 4, CAST(N'2016-09-04 20:14:05.790' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (161, N'PhotoAlbums', 82, 1, 4, CAST(N'2016-09-04 20:55:06.513' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (162, N'Sports', 18, 1, 4, CAST(N'2016-09-08 13:52:18.467' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (163, N'PhotoAlbums', 85, 1, 4, CAST(N'2016-09-08 13:52:39.697' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (164, N'PhotoAlbums', 86, 1, 4, CAST(N'2016-09-08 13:52:54.090' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (165, N'Photos', 87, 0, 4, CAST(N'2016-09-08 13:55:54.783' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (166, N'Photos', 88, 1, 4, CAST(N'2016-09-08 13:56:16.553' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (167, N'Photos', 89, 1, 4, CAST(N'2016-09-08 13:56:36.700' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (168, N'Photos', 90, 1, 4, CAST(N'2016-09-08 13:57:36.800' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (169, N'Photos', 87, 1, 4, CAST(N'2016-09-08 13:58:12.427' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (170, N'LessonsRegister', 40, 1, 4, CAST(N'2016-09-08 14:23:41.543' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (171, N'Clinics', 91, 1, 4, CAST(N'2016-09-27 14:27:22.143' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (172, N'Advertisements', 92, 1, 4, CAST(N'2016-09-27 17:10:51.890' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (173, N'Advertisements', 93, 1, 4, CAST(N'2016-09-27 18:09:08.840' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (174, N'PhotoCategories', 94, 1, 4, CAST(N'2016-10-06 15:29:13.270' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (175, N'PhotoAlbums', 95, 1, 4, CAST(N'2016-10-06 15:29:34.497' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (176, N'Sessions', 96, 0, 4, CAST(N'2016-11-12 14:38:24.540' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (177, N'Sessions', 97, 0, 4, CAST(N'2016-11-12 14:40:03.107' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (178, N'Sessions', 98, 1, 4, CAST(N'2016-11-12 14:41:08.567' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (179, N'Leagues', 99, 1, 4, CAST(N'2016-11-12 14:41:14.007' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (180, N'Leagues', 100, 1, 4, CAST(N'2016-11-12 14:41:16.707' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (181, N'Leagues', 101, 1, 4, CAST(N'2016-11-12 14:41:16.717' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (182, N'Leagues', 102, 1, 4, CAST(N'2016-11-12 14:41:16.730' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (183, N'Leagues', 103, 1, 4, CAST(N'2016-11-12 14:41:16.743' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (184, N'Sessions', 96, 1, 4, CAST(N'2016-11-12 14:45:16.900' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (185, N'Sessions', 97, 1, 4, CAST(N'2016-11-12 14:45:23.810' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (186, N'Leagues', 75, 0, 4, CAST(N'2016-11-12 14:52:11.623' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (187, N'Leagues', 75, 1, 4, CAST(N'2016-11-12 14:52:23.640' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (188, N'Sessions', 104, 1, 4, CAST(N'2016-11-12 15:09:49.193' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (189, N'Leagues', 105, 1, 4, CAST(N'2016-11-12 15:09:49.227' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (190, N'Leagues', 106, 1, 4, CAST(N'2016-11-12 15:09:49.237' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (191, N'Leagues', 107, 1, 4, CAST(N'2016-11-12 15:09:49.240' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (192, N'Leagues', 108, 1, 4, CAST(N'2016-11-12 15:09:49.250' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (193, N'Leagues', 109, 1, 4, CAST(N'2016-11-12 15:09:49.257' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (194, N'Sports', 110, 1, 4, CAST(N'2016-12-07 14:48:17.533' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (195, N'Sessions', 111, 1, 4, CAST(N'2016-12-07 14:49:10.763' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (196, N'Leagues', 112, 1, 4, CAST(N'2016-12-07 14:49:41.403' AS DateTime))
GO
INSERT [Log] ([ID], [Key], [AssetID], [Latest], [CreatedBy], [CreatedOn]) VALUES (197, N'Bocce', 113, 1, 4, CAST(N'2016-12-07 17:30:25.307' AS DateTime))
GO
SET IDENTITY_INSERT [Log] OFF
GO
SET IDENTITY_INSERT [LogDetails] ON 

GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (1, 1, N'AssetID', N'', N'1')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (2, 1, N'ListID', N'', N'0')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (3, 1, N'Name', N'', N'Testing')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (4, 1, N'Enabled', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (5, 1, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (6, 2, N'AssetID', N'', N'2')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (7, 2, N'ListID', N'', N'0')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (8, 2, N'Name', N'', N'Test 2')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (9, 2, N'Enabled', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (10, 2, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (11, 3, N'AssetId', N'', N'2')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (12, 3, N'Name', N'Test 2', N'Test 1')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (13, 4, N'AssetId', N'', N'2')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (14, 4, N'Name', N'Test 1', N'Test 333')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (15, 5, N'AssetID', N'', N'3')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (16, 5, N'Name', N'', N'Test Parent')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (17, 5, N'Display', N'', N'0')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (18, 5, N'Enabled', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (19, 5, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (20, 6, N'AssetId', N'', N'4')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (21, 6, N'Last', N'Admin', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (22, 7, N'AssetId', N'', N'4')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (23, 7, N'First', N'First', N'Steve')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (24, 7, N'Last', N'', N'Healy')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (25, 8, N'AssetID', N'', N'13')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (26, 8, N'Title', N'', N'Fall Volleyball League Registration')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (27, 8, N'Description', N'', N'Register now to get 10% off our team price. Need help finding a team or a player? No problem! Check out our <a class="red-link" href="/About/">player''s connection page</a> to connect with people looking.')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (28, 8, N'Label', N'', N'Register Now')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (29, 8, N'Link', N'', N'/About/')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (30, 8, N'Display', N'', N'0')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (31, 8, N'Enabled', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (32, 8, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (33, 9, N'AssetId', N'', N'13')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (34, 9, N'Enabled', N'False', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (35, 10, N'AssetID', N'', N'14')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (36, 10, N'Title', N'', N'Indoor Volleyball Coming This Fall')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (37, 10, N'Description', N'', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi ut aliquip ex ea commodo consequat.')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (38, 10, N'Label', N'', N'Learn More')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (39, 10, N'Link', N'', N'/About/')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (40, 10, N'Display', N'', N'0')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (41, 10, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (42, 10, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (43, 11, N'AssetId', N'', N'13')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (44, 11, N'Image', N'', N'/img/temp/black.png')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (45, 12, N'AssetId', N'', N'13')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (46, 12, N'Image', N'/img/temp/black.png', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (47, 13, N'AssetId', N'', N'13')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (48, 13, N'Image', N'', N'/img/volleyball-molton.jpg')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (49, 13, N'Link', N'/About/', N'/Volleyball/Indoor/Leagues')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (50, 14, N'AssetID', N'', N'15')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (51, 14, N'Title', N'', N'test')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (52, 14, N'Description', N'', N'test')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (53, 14, N'Image', N'', N'test')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (54, 14, N'Label', N'', N'test')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (55, 14, N'Link', N'', N'test')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (56, 14, N'Left', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (57, 14, N'Display', N'', N'2')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (58, 14, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (59, 14, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (60, 15, N'AssetId', N'', N'15')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (61, 15, N'Deleted', N'False', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (62, 16, N'AssetId', N'', N'15')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (63, 16, N'Deleted', N'True', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (64, 17, N'AssetId', N'', N'15')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (65, 17, N'Deleted', N'False', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (66, 18, N'AssetId', N'', N'15')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (67, 18, N'Deleted', N'True', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (68, 19, N'AssetId', N'', N'15')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (69, 19, N'Deleted', N'False', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (70, 20, N'AssetId', N'', N'15')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (71, 20, N'Deleted', N'True', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (72, 21, N'AssetId', N'', N'15')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (73, 21, N'Deleted', N'False', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (74, 22, N'AssetId', N'', N'15')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (75, 22, N'Deleted', N'True', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (76, 23, N'AssetId', N'', N'15')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (77, 23, N'Deleted', N'False', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (78, 24, N'AssetId', N'', N'15')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (79, 24, N'Deleted', N'True', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (80, 25, N'AssetID', N'', N'16')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (81, 25, N'Name', N'', N'Volleyball')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (82, 25, N'Display', N'', N'0')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (83, 25, N'Hidden', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (84, 25, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (85, 25, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (86, 26, N'AssetID', N'', N'17')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (87, 26, N'Name', N'', N'Basketball')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (88, 26, N'Display', N'', N'1')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (89, 26, N'Hidden', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (90, 26, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (91, 26, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (92, 27, N'AssetId', N'', N'16')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (93, 27, N'Display', N'0', N'2')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (94, 27, N'Hidden', N'True', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (95, 28, N'AssetId', N'', N'17')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (96, 28, N'Hidden', N'True', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (97, 29, N'AssetID', N'', N'18')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (98, 29, N'Name', N'', N'Facility')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (99, 29, N'Display', N'', N'2')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (100, 29, N'Hidden', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (101, 29, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (102, 29, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (103, 30, N'AssetId', N'', N'16')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (104, 30, N'Name', N'Volleyball', N'Indoor Volleyball')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (105, 32, N'AssetID', N'', N'20')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (106, 32, N'SportID', N'', N'16')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (107, 32, N'Name', N'', N'Summer 2015')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (108, 32, N'Deadline', N'', N'7/1/2016 4:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (109, 32, N'StartDate', N'', N'7/18/2016 4:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (110, 32, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (111, 32, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (112, 33, N'AssetID', N'', N'21')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (113, 33, N'SportID', N'', N'17')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (114, 33, N'Name', N'', N'Summer 2015')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (115, 33, N'Deadline', N'', N'8/1/2016 4:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (116, 33, N'StartDate', N'', N'9/1/2016 4:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (117, 33, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (118, 33, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (119, 34, N'AssetID', N'', N'22')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (120, 34, N'SessionID', N'', N'20')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (121, 34, N'Name', N'', N'Division A')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (122, 34, N'Night', N'', N'0')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (123, 34, N'Cost', N'', N'0')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (124, 34, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (125, 34, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (126, 35, N'AssetID', N'', N'23')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (127, 35, N'Title', N'', N'Here is the first title!')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (128, 35, N'Description', N'', N'Here is some content.  Keep in mind that <strong>we are</strong> dedicated to this.')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (129, 35, N'Display', N'', N'0')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (130, 35, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (131, 35, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (132, 36, N'AssetId', N'', N'14')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (133, 36, N'Title', N'Indoor Volleyball Coming This Fall', N'Beach Volleyball Coming This Summer!')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (134, 36, N'Image', N'', N'/img/volleyball-sunset.jpg')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (135, 37, N'AssetID', N'', N'24')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (136, 37, N'Title', N'', N'Big Event coming soon!')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (137, 37, N'Description', N'', N'Here is the big event

To be announced later.')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (138, 37, N'StartDate', N'', N'7/1/2016 4:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (139, 37, N'UserID', N'', N'0')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (140, 37, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (141, 37, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (142, 38, N'AssetId', N'', N'15')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (143, 38, N'Enabled', N'True', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (144, 39, N'AssetID', N'', N'25')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (145, 39, N'Title', N'', N'Second news article')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (146, 39, N'Description', N'', N'Here''s number two!')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (147, 39, N'Display', N'', N'1')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (148, 39, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (149, 39, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (150, 40, N'AssetID', N'', N'26')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (151, 40, N'Title', N'', N'Third one')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (152, 40, N'Description', N'', N'And here is number 3')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (153, 40, N'Display', N'', N'0')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (154, 40, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (155, 40, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (156, 40, N'Display', N'0', N'1')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (157, 40, N'Display', N'1', N'2')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (158, 41, N'AssetId', N'', N'24')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (159, 41, N'UserID', N'0', N'4')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (160, 42, N'AssetId', N'', N'24')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (161, 42, N'StartDate', N'7/1/2016 4:00:00 AM', N'8/20/2016 4:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (162, 43, N'AssetID', N'', N'27')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (163, 43, N'First', N'', N'Rodger')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (164, 43, N'Last', N'', N'Smith')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (165, 43, N'Email', N'', N'rosmith18@gmail.com')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (166, 43, N'Password', N'', N'hrIMWBWDkilLLPqs7q85sA==')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (167, 43, N'Staff', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (168, 43, N'Display', N'', N'0')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (169, 43, N'Super', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (170, 43, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (171, 43, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (172, 44, N'AssetID', N'', N'28')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (173, 44, N'Alert', N'', N'Test')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (174, 44, N'EmailServer', N'', N'localhost')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (175, 44, N'EmailFrom', N'', N'steve@yahoo.com')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (176, 44, N'EmailPort', N'', N'21')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (177, 44, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (178, 45, N'AssetID', N'', N'29')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (179, 45, N'Alert', N'', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (180, 45, N'EmailServer', N'', N'localhost')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (181, 45, N'EmailFrom', N'', N'steve@yahoo.com')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (182, 45, N'EmailPort', N'', N'21')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (183, 45, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (184, 46, N'AssetId', N'', N'4')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (185, 46, N'Image', N'', N'http://localhost:52532/img/4.png')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (186, 47, N'AssetId', N'', N'4')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (187, 47, N'Title', N'', N'A really good guy')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (188, 47, N'Bio', N'', N'Barack Hussein Obama II (US Listeni/b?''r??k hu?''se?n o?''b??m?/;[1][2] born August 4, 1961) is an American politician serving as the 44th President of the United States. He is the first African American to hold the office, as well as the first president born outside of the continental United States. Born in Honolulu, Hawaii, Obama is a graduate of Columbia University and Harvard Law School, where he served as president of the Harvard Law Review. He was a community organizer in Chicago before earning his law degree. He worked as a civil rights attorney and taught constitutional law at University of Chicago Law School between 1992 and 2004. He served three terms representing the 13th District in the Illinois Senate from 1997 to 2004, and ran unsuccessfully in the Democratic primary for the United States House of Representatives in 2000 against incumbent Bobby Rush.

In 2004, Obama received national attention during his campaign to represent Illinois in the United States Senate with his victory in the March Democratic Party primary, his keynote address at the Democratic National Convention in July, and his election to the Senate in November. He began his presidential campaign in 2007 and, after a close primary campaign against Hillary Clinton in 2008, he won sufficient delegates in the Democratic Party primaries to receive the presidential nomination. He then defeated Republican nominee John McCain in the general election, and was inaugurated as president on January 20, 2009. Nine months after his inauguration, Obama was named the 2009 Nobel Peace Prize laureate.')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (189, 47, N'Phone', N'', N'2164405236')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (190, 48, N'AssetId', N'', N'27')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (191, 48, N'Image', N'', N'http://localhost:52532/img/27.png')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (192, 48, N'Phone', N'', N'2161234567')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (193, 49, N'AssetId', N'', N'4')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (194, 49, N'Title', N'A really good guy', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (195, 49, N'Bio', N'Barack Hussein Obama II (US Listeni/b?''r??k hu?''se?n o?''b??m?/;[1][2] born August 4, 1961) is an American politician serving as the 44th President of the United States. He is the first African American to hold the office, as well as the first president born outside of the continental United States. Born in Honolulu, Hawaii, Obama is a graduate of Columbia University and Harvard Law School, where he served as president of the Harvard Law Review. He was a community organizer in Chicago before earning his law degree. He worked as a civil rights attorney and taught constitutional law at University of Chicago Law School between 1992 and 2004. He served three terms representing the 13th District in the Illinois Senate from 1997 to 2004, and ran unsuccessfully in the Democratic primary for the United States House of Representatives in 2000 against incumbent Bobby Rush.

In 2004, Obama received national attention during his campaign to represent Illinois in the United States Senate with his victory in the March Democratic Party primary, his keynote address at the Democratic National Convention in July, and his election to the Senate in November. He began his presidential campaign in 2007 and, after a close primary campaign against Hillary Clinton in 2008, he won sufficient delegates in the Democratic Party primaries to receive the presidential nomination. He then defeated Republican nominee John McCain in the general election, and was inaugurated as president on January 20, 2009. Nine months after his inauguration, Obama was named the 2009 Nobel Peace Prize laureate.', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (196, 49, N'Phone', N'2164405236', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (197, 50, N'AssetId', N'', N'27')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (198, 50, N'Bio', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Odit ratione, facilis perferendis laudantium repellat suscipit aspernatur dignissimos iure impedit.', N'Barack Hussein Obama II (US Listeni/b?''r??k hu?''se?n o?''b??m?/;[1][2] born August 4, 1961) is an American politician serving as the 44th President of the United States. He is the first African American to hold the office, as well as the first president born outside of the continental United States. Born in Honolulu, Hawaii, Obama is a graduate of Columbia University and Harvard Law School, where he served as president of the Harvard Law Review. He was a community organizer in Chicago before earning his law degree. He worked as a civil rights attorney and taught constitutional law at University of Chicago Law School between 1992 and 2004. He served three terms representing the 13th District in the Illinois Senate from 1997 to 2004, and ran unsuccessfully in the Democratic primary for the United States House of Representatives in 2000 against incumbent Bobby Rush.

In 2004, Obama received national attention during his campaign to represent Illinois in the United States Senate with his victory in the March Democratic Party primary, his keynote address at the Democratic National Convention in July, and his election to the Senate in November. He began his presidential campaign in 2007 and, after a close primary campaign against Hillary Clinton in 2008, he won sufficient delegates in the Democratic Party primaries to receive the presidential nomination. He then defeated Republican nominee John McCain in the general election, and was inaugurated as president on January 20, 2009. Nine months after his inauguration, Obama was named the 2009 Nobel Peace Prize laureate.')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (199, 51, N'AssetId', N'', N'27')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (200, 51, N'Bio', N'Barack Hussein Obama II (US Listeni/b?''r??k hu?''se?n o?''b??m?/;[1][2] born August 4, 1961) is an American politician serving as the 44th President of the United States. He is the first African American to hold the office, as well as the first president born outside of the continental United States. Born in Honolulu, Hawaii, Obama is a graduate of Columbia University and Harvard Law School, where he served as president of the Harvard Law Review. He was a community organizer in Chicago before earning his law degree. He worked as a civil rights attorney and taught constitutional law at University of Chicago Law School between 1992 and 2004. He served three terms representing the 13th District in the Illinois Senate from 1997 to 2004, and ran unsuccessfully in the Democratic primary for the United States House of Representatives in 2000 against incumbent Bobby Rush.

In 2004, Obama received national attention during his campaign to represent Illinois in the United States Senate with his victory in the March Democratic Party primary, his keynote address at the Democratic National Convention in July, and his election to the Senate in November. He began his presidential campaign in 2007 and, after a close primary campaign against Hillary Clinton in 2008, he won sufficient delegates in the Democratic Party primaries to receive the presidential nomination. He then defeated Republican nominee John McCain in the general election, and was inaugurated as president on January 20, 2009. Nine months after his inauguration, Obama was named the 2009 Nobel Peace Prize laureate.', N'In 2004, Obama received national attention during his campaign to represent Illinois in the United States Senate with his victory in the March Democratic Party primary, his keynote address at the Democratic National Convention in July, and his election to the Senate in November. He began his presidential campaign in 2007 and, after a close primary campaign against Hillary Clinton in 2008, he won sufficient delegates in the Democratic Party primaries to receive the presidential nomination. He then defeated Republican nominee John McCain in the general election, and was inaugurated as president on January 20, 2009. Nine months after his inauguration, Obama was named the 2009 Nobel Peace Prize laureate.

During his first two years in office, Obama signed into law economic stimulus legislation in response to the Great Recession in the form of the American Recovery and Reinvestment Act of 2009 and the Tax Relief, Unemployment Insurance Reauthorization, and Job Creation Act of 2010. Other major domestic initiatives in his first term included the Patient Protection and Affordable Care Act, often referred to as "Obamacare"; the Dodd–Frank Wall Street Reform and Consumer Protection Act; and the Don''t Ask, Don''t Tell Repeal Act of 2010. In foreign policy, Obama ended U.S. military involvement in the Iraq War, increased U.S. troop levels in Afghanistan, signed the New START arms control treaty with Russia, ordered U.S. military involvement in Libya in opposition to Muammar Gaddafi, and ordered the military operation that resulted in the death of Osama bin Laden. In January 2011, the Republicans regained control of the House of Representatives as the Democratic Party lost a total of 63 seats; and, after a lengthy debate over federal spending and whether or not to raise the nation''s debt limit, Obama signed the Budget Control Act of 2011 and the American Taxpayer Relief Act of 2012.')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (201, 52, N'AssetId', N'', N'22')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (202, 52, N'Description', N'', N'aaa')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (203, 52, N'Night', N'0', N'5')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (204, 52, N'EZRegister', N'', N'test')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (205, 52, N'EZSchedule', N'', N'test')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (206, 52, N'Cost', N'0', N'125')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (207, 53, N'AssetId', N'', N'22')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (208, 53, N'Night', N'5', N'4')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (209, 54, N'AssetId', N'', N'22')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (210, 54, N'Cost', N'125', N'0')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (211, 55, N'AssetId', N'', N'22')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (212, 55, N'Cost', N'0', N'125')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (213, 56, N'AssetId', N'', N'22')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (214, 56, N'Cost', N'125', N'125.75')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (215, 57, N'AssetId', N'', N'32')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (216, 57, N'Scheduled', N'1/1/1753 12:00:00 AM', N'6/17/2016 4:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (217, 58, N'AssetId', N'', N'32')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (218, 58, N'Instructor', N'0', N'27')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (219, 59, N'AssetID', N'', N'36')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (220, 59, N'SportID', N'', N'16')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (221, 59, N'Name', N'', N'1 on 1')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (222, 59, N'Rate', N'', N'125')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (223, 59, N'Benefit1', N'', N'Single person')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (224, 59, N'Benefit2', N'', N'Focused')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (225, 59, N'Benefit3', N'', N'Direct answers')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (226, 59, N'Display', N'', N'0')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (227, 59, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (228, 59, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (229, 60, N'AssetID', N'', N'37')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (230, 60, N'SportID', N'', N'0')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (231, 60, N'Name', N'', N'3 on 1')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (232, 60, N'Rate', N'', N'275')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (233, 60, N'Benefit1', N'', N'Half of team')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (234, 60, N'Benefit2', N'', N'Work together')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (235, 60, N'Benefit3', N'', N'Still connect')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (236, 60, N'Display', N'', N'0')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (237, 60, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (238, 60, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (239, 61, N'AssetID', N'', N'38')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (240, 61, N'SportID', N'', N'16')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (241, 61, N'Name', N'', N'2 on 1')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (242, 61, N'Rate', N'', N'200')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (243, 61, N'Benefit1', N'', N'Benefit for two')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (244, 61, N'Benefit2', N'', N'Another')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (245, 61, N'Benefit3', N'', N'And last')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (246, 61, N'Display', N'', N'0')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (247, 61, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (248, 61, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (249, 62, N'AssetId', N'', N'39')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (250, 62, N'Instructor', N'0', N'27')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (251, 63, N'AssetId', N'', N'39')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (252, 63, N'Scheduled', N'1/1/1753 12:00:00 AM', N'6/23/2016 4:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (253, 63, N'Instructor', N'27', N'0')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (254, 64, N'AssetId', N'', N'39')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (255, 64, N'Scheduled', N'6/23/2016 4:00:00 AM', N'1/1/1753 12:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (256, 65, N'AssetId', N'', N'20')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (257, 65, N'Deadline', N'7/1/2016 4:00:00 AM', N'5/18/2016 4:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (258, 65, N'StartDate', N'7/18/2016 4:00:00 AM', N'6/1/2016 4:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (259, 66, N'AssetId', N'', N'21')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (260, 66, N'Deadline', N'8/1/2016 4:00:00 AM', N'5/18/2016 4:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (261, 66, N'StartDate', N'9/1/2016 4:00:00 AM', N'6/1/2016 4:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (262, 67, N'AssetID', N'', N'42')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (263, 67, N'SessionID', N'', N'21')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (264, 67, N'Name', N'', N'Men''s 30 & Over Division')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (265, 67, N'Description', N'', N'Sunday Morning Basketball League')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (266, 67, N'Night', N'', N'7')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (267, 67, N'EZRegister', N'', N'https://tms.ezfacility.com/OnlineRegistrations/Register.aspx?CompanyID=5325&GroupID=1583640')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (268, 67, N'EZSchedule', N'', N'aaa')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (269, 67, N'Cost', N'', N'200')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (270, 67, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (271, 67, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (272, 68, N'AssetID', N'', N'43')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (273, 68, N'SessionID', N'', N'21')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (274, 68, N'Name', N'', N'Men''s Competitive Division')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (275, 68, N'Description', N'', N'Sunday Night Basketball League')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (276, 68, N'Night', N'', N'7')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (277, 68, N'EZRegister', N'', N'https://tms.ezfacility.com/OnlineRegistrations/Register.aspx?CompanyID=5325&GroupID=1583638')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (278, 68, N'EZSchedule', N'', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (279, 68, N'Cost', N'', N'200')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (280, 68, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (281, 68, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (282, 69, N'AssetId', N'', N'42')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (283, 69, N'EZRegister', N'https://tms.ezfacility.com/OnlineRegistrations/Register.aspx?CompanyID=5325&GroupID=1583640', N'https://tms.ezfacility.com/OnlineRegistrations/Register.aspx?CompanyID=5325&GroupID=1583638')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (284, 69, N'EZSchedule', N'aaa', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (285, 70, N'AssetId', N'', N'42')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (286, 70, N'Name', N'Men''s 30 & Over Division', N'Mens 30 & Over Division')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (287, 71, N'AssetId', N'', N'42')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (288, 71, N'Name', N'Mens 30 & Over Division', N'Men''s 30 & Over Division')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (289, 72, N'AssetId', N'', N'21')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (290, 72, N'Deadline', N'5/18/2016 4:00:00 AM', N'6/28/2016 4:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (291, 72, N'StartDate', N'6/1/2016 4:00:00 AM', N'7/1/2016 4:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (292, 73, N'AssetId', N'', N'21')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (293, 73, N'Deadline', N'6/28/2016 4:00:00 AM', N'5/28/2016 4:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (294, 73, N'StartDate', N'7/1/2016 4:00:00 AM', N'6/1/2016 4:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (295, 74, N'AssetID', N'', N'44')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (296, 74, N'SportID', N'', N'17')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (297, 74, N'Name', N'', N'Fall 2015')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (298, 74, N'Deadline', N'', N'8/28/2016 4:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (299, 74, N'StartDate', N'', N'9/1/2016 4:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (300, 74, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (301, 74, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (302, 75, N'AssetID', N'', N'45')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (303, 75, N'SessionID', N'', N'44')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (304, 75, N'Name', N'', N'Men''s 30 & Over Division')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (305, 75, N'Description', N'', N'Here is the description

And some more...')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (306, 75, N'Night', N'', N'7')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (307, 75, N'EZRegister', N'', N'https://tms.ezfacility.com/OnlineRegistrations/Register.aspx?CompanyID=5325&GroupID=1583638')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (308, 75, N'EZSchedule', N'', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (309, 75, N'Cost', N'', N'175')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (310, 75, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (311, 75, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (312, 76, N'AssetId', N'', N'42')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (313, 76, N'EZSchedule', N'', N'https://tms.ezfacility.com/OnlineRegistrations/Register.aspx?CompanyID=5325&GroupID=1583638')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (314, 77, N'AssetId', N'', N'44')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (315, 77, N'Enabled', N'True', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (316, 78, N'AssetId', N'', N'44')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (317, 78, N'Enabled', N'False', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (318, 79, N'AssetId', N'', N'21')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (319, 79, N'Enabled', N'True', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (320, 80, N'AssetId', N'', N'21')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (321, 80, N'Enabled', N'False', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (322, 81, N'AssetId', N'', N'18')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (323, 81, N'PhotosOnly', N'False', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (324, 82, N'AssetID', N'', N'46')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (325, 82, N'SportID', N'', N'17')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (326, 82, N'Name', N'', N'New Basketball Tournament')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (327, 82, N'Description', N'', N'PQSports Summer Championship is a three day, competitive national basketball tournament for boys and girls grassroots basketball programs that will take place in the beautiful “Garden City” of Augusta, GA and the event headquarters will be Riverview Park the home of the Nike EYBL Peach Jam. This event will serves as a highly competitive tune-up tournament for grassroots basketball teams that are getting ready for their AAU, USSSA, USBA, or other organizations National’s and NCAA certified tournaments in July. This event is also a High School team camp for boys and girls teams. When: June 17-19, 2016 Where: North Augusta, SC & Augusta, GA Area Entry Fee: $250 for 2nd – 11th Grade Eligibility: Boys & Girls 1st – 11th Grade/Unsigned Seniors Headquarters: Riverview Park, home of the Nike EYBL Peach Jam This event will serves as a highly competitive tune-up tournament for grassroots basketball teams that are getting ready for their AAU, USSSA, USBA, or other organizations National tournaments in July. ')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (328, 82, N'Location', N'', N'Riverview Park')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (329, 82, N'Date', N'', N'7/14/2016 4:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (330, 82, N'Deadline', N'', N'7/8/2016 4:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (331, 82, N'Cost', N'', N'250')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (332, 82, N'UserID', N'', N'4')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (333, 82, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (334, 82, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (335, 83, N'AssetId', N'', N'46')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (336, 83, N'Name', N'New Basketball Tournament', N'PQSports Summer Championship')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (337, 84, N'AssetId', N'', N'41')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (338, 84, N'Scheduled', N'1/1/1753 12:00:00 AM', N'7/8/2016 4:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (339, 85, N'AssetId', N'', N'22')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (340, 85, N'EZSchedule', N'test', N'https://tms.ezfacility.com/OnlineRegistrations/Register.aspx?CompanyID=5325&GroupID=1583638')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (341, 86, N'AssetID', N'', N'47')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (342, 86, N'Name', N'', N'Indoor Sand Volleyball')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (343, 86, N'Display', N'', N'3')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (344, 86, N'PhotosOnly', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (345, 86, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (346, 86, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (347, 87, N'AssetID', N'', N'48')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (348, 87, N'SportID', N'', N'17')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (349, 87, N'Name', N'', N'Dribbling')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (350, 87, N'Rate', N'', N'55')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (351, 87, N'Hourly', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (352, 87, N'Benefit1', N'', N'Benefit 1')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (353, 87, N'Benefit2', N'', N'Benefit 2')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (354, 87, N'Benefit3', N'', N'Benefit 3')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (355, 87, N'Value', N'', N'Dribbling')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (356, 87, N'Display', N'', N'0')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (357, 87, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (358, 87, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (359, 88, N'AssetId', N'', N'48')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (360, 88, N'Name', N'Dribbling', N'Dribbling & Shooting')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (361, 88, N'Display', N'0', N'1')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (362, 89, N'AssetId', N'', N'27')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (363, 89, N'Password', N'hrIMWBWDkilLLPqs7q85sA==', N'neFm0xsaU7v5zyBu0TMP5Q==')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (364, 90, N'AssetId', N'', N'27')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (365, 90, N'Password', N'neFm0xsaU7v5zyBu0TMP5Q==', N'3NdXv5rHCIVTFyv+LnPdRg==')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (366, 91, N'AssetID', N'', N'52')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (367, 91, N'SportID', N'', N'18')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (368, 91, N'Title', N'', N'Facility Title')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (369, 91, N'Caption', N'', N'Facility Caption')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (370, 91, N'Image', N'', N'/img/facility2.jpg')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (371, 91, N'Display', N'', N'0')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (372, 91, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (373, 91, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (374, 92, N'AssetId', N'', N'4')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (375, 92, N'Image', N'http://localhost:52532/img/4.png', N'http://localhost:52740/img/4.png')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (376, 93, N'AssetID', N'', N'53')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (377, 93, N'SportID', N'', N'18')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (378, 93, N'Title', N'', N'Weights')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (379, 93, N'Caption', N'', N'Check out our weightroom!')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (380, 93, N'Image', N'', N'/img/facility3.jpg')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (381, 93, N'Display', N'', N'1')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (382, 93, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (383, 93, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (384, 94, N'AssetID', N'', N'55')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (385, 94, N'SportID', N'', N'18')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (386, 94, N'Title', N'', N'The Beach!')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (387, 94, N'Caption', N'', N'Here is a shot of a stupid net.')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (388, 94, N'Image', N'', N'/img/facility1.jpg')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (389, 94, N'Display', N'', N'1')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (390, 94, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (391, 94, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (392, 94, N'Display', N'1', N'3')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (393, 95, N'AssetID', N'', N'56')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (394, 95, N'Name', N'', N'jQuery')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (395, 95, N'Logo', N'', N'/img/temp/logo2-grayscale.png')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (396, 95, N'Display', N'', N'1')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (397, 95, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (398, 95, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (399, 96, N'AssetID', N'', N'57')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (400, 96, N'Name', N'', N'Barack Obama')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (401, 96, N'Company', N'', N'United States of America')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (402, 96, N'Testimonial1', N'', N'This is the best thing I''ve ever seen!')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (403, 96, N'Email', N'', N'potus@us.gov')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (404, 96, N'Image', N'', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (405, 96, N'Display', N'', N'1')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (406, 96, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (407, 96, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (408, 97, N'AssetId', N'', N'57')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (409, 97, N'Testimonial1', N'This is the best thing I''ve ever seen!', N'This is the best thing I''ve ever seen!

And then some!')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (410, 98, N'AssetId', N'', N'57')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (411, 98, N'Image', N'', N'/img/4.png')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (412, 99, N'AssetId', N'', N'57')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (413, 99, N'Image', N'/img/4.png', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (414, 100, N'AssetID', N'', N'58')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (415, 100, N'SportID', N'', N'17')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (416, 100, N'Name', N'', N'Indoor Leagues')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (417, 100, N'Display', N'', N'0')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (418, 100, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (419, 100, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (420, 101, N'AssetID', N'', N'59')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (421, 101, N'SportID', N'', N'17')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (422, 101, N'Name', N'', N'Indoor Tournaments')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (423, 101, N'Display', N'', N'0')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (424, 101, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (425, 101, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (426, 102, N'AssetID', N'', N'60')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (427, 102, N'SportID', N'', N'16')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (428, 102, N'Name', N'', N'Tournaments')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (429, 102, N'Display', N'', N'0')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (430, 102, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (431, 102, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (432, 103, N'AssetId', N'', N'21')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (433, 103, N'Name', N'Summer 2015', N'Summer 2016')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (434, 104, N'AssetId', N'', N'21')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (435, 104, N'Deadline', N'5/28/2016 4:00:00 AM', N'6/12/2016 4:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (436, 104, N'StartDate', N'6/1/2016 4:00:00 AM', N'6/14/2016 4:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (437, 105, N'AssetId', N'', N'13')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (438, 105, N'Lead', N'', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (439, 105, N'Description', N'Register now to get 10% off our team price. Need help finding a team or a player? No problem! Check out our <a class="red-link" href="/About/">player''s connection page</a> to connect with people looking.', N'Need help finding a team or a player? No problem! Check out our <a class="red-link" href="/About/">player''s connection page</a> to connect with people looking.')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (440, 106, N'AssetId', N'', N'13')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (441, 106, N'Lead', N'', N'Register now to get 10% off our team price.')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (442, 107, N'AssetId', N'', N'23')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (443, 107, N'Link', N'', N'http://www.28heath.com/brochure.pdf')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (444, 108, N'AssetID', N'', N'63')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (445, 108, N'Title', N'', N'SEcond event')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (446, 108, N'Description', N'', N'Here it is.

Dang.')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (447, 108, N'StartDate', N'', N'7/20/2016 4:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (448, 108, N'UserID', N'', N'27')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (449, 108, N'Link', N'', N'http://www.yahoo.com')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (450, 108, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (451, 108, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (452, 109, N'AssetID', N'', N'64')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (453, 109, N'Title', N'', N'Missed')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (454, 109, N'Description', N'', N'HJerwereafd

asfdsa
fsdaf')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (455, 109, N'StartDate', N'', N'5/31/2016 4:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (456, 109, N'UserID', N'', N'4')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (457, 109, N'Link', N'', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (458, 109, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (459, 109, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (460, 110, N'AssetID', N'', N'65')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (461, 110, N'Title', N'', N'Missed agba')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (462, 110, N'Description', N'', N'dsfsfa
sdaf sd
afsa
f')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (463, 110, N'StartDate', N'', N'4/6/2016 4:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (464, 110, N'UserID', N'', N'4')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (465, 110, N'Link', N'', N'sdfsad')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (466, 110, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (467, 110, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (468, 111, N'AssetId', N'', N'14')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (469, 111, N'Lead', N'', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (470, 111, N'Description', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi ut aliquip ex ea commodo consequat.', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
Nisi ut aliquip ex ea commodo consequat.')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (471, 112, N'AssetId', N'', N'25')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (472, 112, N'Description', N'Here''s number two!', N'Here''s number two!
Next line.')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (473, 112, N'Link', N'', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (474, 113, N'AssetId', N'', N'46')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (475, 113, N'EZRegister', N'', N'https://tms.ezfacility.com/OnlineRegistrations/Register.aspx?CompanyID=5325&GroupID=1583638')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (476, 113, N'EZSchedule', N'', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (477, 114, N'AssetId', N'', N'46')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (478, 114, N'Description', N'PQSports Summer Championship is a three day, competitive national basketball tournament for boys and girls grassroots basketball programs that will take place in the beautiful “Garden City” of Augusta, GA and the event headquarters will be Riverview Park the home of the Nike EYBL Peach Jam. This event will serves as a highly competitive tune-up tournament for grassroots basketball teams that are getting ready for their AAU, USSSA, USBA, or other organizations National’s and NCAA certified tournaments in July. This event is also a High School team camp for boys and girls teams. When: June 17-19, 2016 Where: North Augusta, SC & Augusta, GA Area Entry Fee: $250 for 2nd – 11th Grade Eligibility: Boys & Girls 1st – 11th Grade/Unsigned Seniors Headquarters: Riverview Park, home of the Nike EYBL Peach Jam This event will serves as a highly competitive tune-up tournament for grassroots basketball teams that are getting ready for their AAU, USSSA, USBA, or other organizations National tournaments in July. ', N'PQSports Summer Championship is a three day, competitive national basketball tournament for boys and girls grassroots basketball programs that will take place in the beautiful “Garden City” of Augusta, GA and the event headquarters will be Riverview Park the home of the Nike EYBL Peach Jam. This event will serves as a highly competitive tune-up tournament for grassroots basketball teams that are getting ready for their AAU, USSSA, USBA, or other organizations National’s and NCAA certified tournaments in July. 

This event is also a High School team camp for boys and girls teams. When: June 17-19, 2016 Where: North Augusta, SC & Augusta, GA Area Entry Fee: $250 for 2nd – 11th Grade Eligibility: Boys & Girls 1st – 11th Grade/Unsigned Seniors Headquarters: Riverview Park, home of the Nike EYBL Peach Jam This event will serves as a highly competitive tune-up tournament for grassroots basketball teams that are getting ready for their AAU, USSSA, USBA, or other organizations National tournaments in July. ')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (479, 115, N'AssetId', N'', N'29')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (480, 115, N'Alert', N'', N'All leagues have been cancelled.')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (481, 116, N'AssetId', N'', N'29')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (482, 116, N'AlertStart', N'', N'6/27/2016 4:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (483, 116, N'AlertEnd', N'', N'6/27/2016 4:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (484, 117, N'AssetId', N'', N'29')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (485, 117, N'AlertEnd', N'6/27/2016 4:00:00 AM', N'6/28/2016 4:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (486, 118, N'AssetId', N'', N'29')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (487, 118, N'AlertStart', N'6/27/2016 4:00:00 AM', N'6/26/2016 4:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (488, 118, N'AlertEnd', N'6/28/2016 4:00:00 AM', N'6/27/2016 4:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (489, 119, N'AssetId', N'', N'29')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (490, 119, N'AlertStart', N'6/26/2016 4:00:00 AM', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (491, 119, N'AlertEnd', N'6/27/2016 4:00:00 AM', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (492, 120, N'AssetId', N'', N'29')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (493, 120, N'AlertStart', N'', N'6/27/2016 4:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (494, 121, N'AssetId', N'', N'29')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (495, 121, N'AlertStart', N'6/27/2016 4:00:00 AM', N'6/28/2016 4:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (496, 122, N'AssetId', N'', N'56')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (497, 122, N'Web', N'', N'http://www.yahoo.com')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (498, 122, N'Address', N'', N'5173 Windsor Drive
North Ridgeville, OH 44039')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (499, 122, N'Phone', N'', N'2165510980')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (500, 122, N'Description', N'', N'Right now, they are offering half off appetizers')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (501, 123, N'AssetID', N'', N'66')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (502, 123, N'Name', N'', N'Setter')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (503, 123, N'Description', N'', N'The setter is special')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (504, 123, N'Display', N'', N'0')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (505, 123, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (506, 123, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (507, 124, N'AssetID', N'', N'67')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (508, 124, N'Name', N'', N'STrong Side')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (509, 124, N'Description', N'', N'HEre is the strong side.')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (510, 124, N'Display', N'', N'1')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (511, 124, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (512, 124, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (513, 125, N'AssetID', N'', N'68')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (514, 125, N'Name', N'', N'Defensive Specialist')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (515, 125, N'Description', N'', N'You are great at defense.')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (516, 125, N'Display', N'', N'2')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (517, 125, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (518, 125, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (519, 126, N'AssetId', N'', N'66')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (520, 126, N'Name', N'Setter', N'Volleyball - Setter')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (521, 126, N'Display', N'0', N'3')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (522, 127, N'AssetId', N'', N'67')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (523, 127, N'Name', N'STrong Side', N'Volleyball - Strong Side')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (524, 128, N'AssetId', N'', N'68')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (525, 128, N'Name', N'Defensive Specialist', N'Volleyball - Defensive Specialist')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (526, 129, N'AssetID', N'', N'70')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (527, 129, N'Alert', N'', N'test')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (528, 129, N'EmailServer', N'', N'localhost')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (529, 129, N'EmailFrom', N'', N'noreply@neosportsplant.com')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (530, 129, N'EmailPort', N'', N'21')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (531, 129, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (532, 130, N'AssetId', N'', N'70')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (533, 130, N'Alert', N'test', N'All leagues have been cancelled.')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (534, 131, N'AssetID', N'', N'71')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (535, 131, N'SportID', N'', N'47')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (536, 131, N'Name', N'', N'Fall 2016')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (537, 131, N'Deadline', N'', N'9/1/2016 12:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (538, 131, N'StartDate', N'', N'9/5/2016 12:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (539, 131, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (540, 131, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (541, 132, N'AssetID', N'', N'72')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (542, 132, N'SessionID', N'', N'71')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (543, 132, N'Name', N'', N'Co-ed 4''s - A Division')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (544, 132, N'Description', N'', N'A Division, Co-ed 4''s. Will take up to 9 teams - 4 time slots per night with games starting at 7.')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (545, 132, N'Night', N'', N'2')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (546, 132, N'EZRegister', N'', N'yahoo.com')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (547, 132, N'EZSchedule', N'', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (548, 132, N'Cost', N'', N'200')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (549, 132, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (550, 132, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (551, 133, N'AssetID', N'', N'73')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (552, 133, N'SessionID', N'', N'71')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (553, 133, N'Name', N'', N'Co-ed 4''s - B Division')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (554, 133, N'Description', N'', N'B Division, Co-ed 4''s. Will take up to 9 teams - 4 time slots per night with games starting at 7.')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (555, 133, N'Night', N'', N'2')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (556, 133, N'EZRegister', N'', N'yahoo.com')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (557, 133, N'EZSchedule', N'', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (558, 133, N'Cost', N'', N'200')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (559, 133, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (560, 133, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (561, 134, N'AssetID', N'', N'74')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (562, 134, N'SessionID', N'', N'71')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (563, 134, N'Name', N'', N'Co-ed 4''s - BB Division')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (564, 134, N'Description', N'', N'Co-ed 4''s - BB Division')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (565, 134, N'Night', N'', N'2')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (566, 134, N'EZRegister', N'', N'Co-ed 4''s - BB Division')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (567, 134, N'EZSchedule', N'', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (568, 134, N'Cost', N'', N'200')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (569, 134, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (570, 134, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (571, 135, N'AssetID', N'', N'75')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (572, 135, N'SessionID', N'', N'71')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (573, 135, N'Name', N'', N'Co-ed 6''s - B Division')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (574, 135, N'Description', N'', N'Co-ed 6''s - B Division')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (575, 135, N'Night', N'', N'1')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (576, 135, N'EZRegister', N'', N'Co-ed 6''s - B Division')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (577, 135, N'EZSchedule', N'', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (578, 135, N'Cost', N'', N'200')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (579, 135, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (580, 135, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (581, 136, N'AssetID', N'', N'76')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (582, 136, N'SessionID', N'', N'71')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (583, 136, N'Name', N'', N'Co-ed 6''s - BB/B Division')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (584, 136, N'Description', N'', N'Co-ed 6''s - BB/B Division')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (585, 136, N'Night', N'', N'4')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (586, 136, N'EZRegister', N'', N'Co-ed 6''s - BB/B Division')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (587, 136, N'EZSchedule', N'', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (588, 136, N'Cost', N'', N'200')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (589, 136, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (590, 136, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (591, 137, N'AssetId', N'', N'22')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (592, 137, N'Deleted', N'False', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (593, 138, N'AssetId', N'', N'70')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (594, 138, N'LeagueWarning', N'50', N'-1')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (595, 139, N'AssetId', N'', N'51')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (596, 139, N'Scheduled', N'1/1/1753 12:00:00 AM', N'7/7/2016 12:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (597, 140, N'AssetId', N'', N'70')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (598, 140, N'EventTo', N'', N'healy@sitesteam.com')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (599, 140, N'EventCc', N'', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (600, 140, N'EventBcc', N'', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (601, 140, N'ContactTo', N'', N'healy@sitesteam.com')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (602, 140, N'ContactCc', N'', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (603, 140, N'ContactBcc', N'', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (604, 141, N'AssetId', N'', N'56')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (605, 141, N'Address', N'5173 Windsor Drive
North Ridgeville, OH 44039', N'5173 Windsor Drive')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (606, 142, N'AssetId', N'', N'56')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (607, 142, N'City', N'', N'North Ridgeville')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (608, 142, N'State', N'', N'OH')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (609, 142, N'Zip', N'', N'44039')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (610, 143, N'AssetId', N'', N'56')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (611, 143, N'Address', N'5173 Windsor Drive', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (612, 144, N'AssetId', N'', N'56')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (613, 144, N'Zip', N'44039', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (614, 145, N'AssetId', N'', N'72')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (615, 145, N'Display', N'1', N'5')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (616, 146, N'AssetId', N'', N'73')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (617, 146, N'Display', N'1', N'3')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (618, 147, N'AssetId', N'', N'76')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (619, 147, N'Display', N'1', N'4')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (620, 148, N'AssetId', N'', N'73')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (621, 148, N'Display', N'3', N'8')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (622, 149, N'AssetId', N'', N'46')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (623, 149, N'Date', N'7/14/2016 4:00:00 AM', N'9/9/2016 12:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (624, 149, N'Deadline', N'7/8/2016 4:00:00 AM', N'9/7/2016 12:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (625, 150, N'AssetID', N'', N'78')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (626, 150, N'SportID', N'', N'16')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (627, 150, N'Name', N'', N'Test VB Clinic')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (628, 150, N'Description', N'', N'Here is the desc.
Next line.

Next P.')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (629, 150, N'StartDate', N'', N'8/24/2016 12:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (630, 150, N'EndDate', N'', N'8/31/2016 12:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (631, 150, N'Deadline', N'', N'8/17/2016 12:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (632, 150, N'Cost', N'', N'250')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (633, 150, N'UserID', N'', N'27')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (634, 150, N'EZRegister', N'', N'http://www.google.com')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (635, 150, N'Link', N'', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (636, 150, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (637, 150, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (638, 151, N'AssetId', N'', N'78')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (639, 151, N'Link', N'', N'http://www.google.com')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (640, 152, N'AssetId', N'', N'78')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (641, 152, N'Deleted', N'False', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (642, 153, N'AssetID', N'', N'79')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (643, 153, N'First', N'', N'Deb')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (644, 153, N'Last', N'', N'Smith')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (645, 153, N'Email', N'', N'deb@sitesteam.com')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (646, 153, N'Password', N'', N'hrIMWBWDkilLLPqs7q85sA==')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (647, 153, N'Staff', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (648, 153, N'Title', N'', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (649, 153, N'Bio', N'', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (650, 153, N'Facebook', N'', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (651, 153, N'Twitter', N'', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (652, 153, N'Phone', N'', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (653, 153, N'Display', N'', N'0')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (654, 153, N'Super', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (655, 153, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (656, 153, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (657, 154, N'AssetId', N'', N'79')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (658, 154, N'Deleted', N'False', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (659, 155, N'AssetId', N'', N'70')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (660, 155, N'Alert', N'All leagues have been cancelled.', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (661, 156, N'AssetID', N'', N'80')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (662, 156, N'Name', N'', N'Category 1')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (663, 156, N'Display', N'', N'0')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (664, 156, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (665, 156, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (666, 157, N'AssetID', N'', N'81')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (667, 157, N'Name', N'', N'Events/Parties')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (668, 157, N'Display', N'', N'1')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (669, 157, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (670, 157, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (671, 158, N'AssetID', N'', N'82')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (672, 158, N'CategoryID', N'', N'81')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (673, 158, N'Name', N'', N'Steve''s Birthday')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (674, 158, N'Display', N'', N'0')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (675, 158, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (676, 158, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (677, 159, N'AssetID', N'', N'83')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (678, 159, N'AlbumID', N'', N'82')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (679, 159, N'Title', N'', N'Here is Steve''s Birthday')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (680, 159, N'Caption', N'', N'Caption')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (681, 159, N'Image', N'', N'/img/facility1.jpg')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (682, 159, N'Display', N'', N'1')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (683, 159, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (684, 159, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (685, 160, N'AssetID', N'', N'84')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (686, 160, N'AlbumID', N'', N'82')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (687, 160, N'Title', N'', N'Another title')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (688, 160, N'Caption', N'', N'Antoher caption')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (689, 160, N'Image', N'', N'/img/LogoSmall.gif')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (690, 160, N'Display', N'', N'1')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (691, 160, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (692, 160, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (693, 160, N'Display', N'1', N'2')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (694, 161, N'AssetId', N'', N'82')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (695, 161, N'Name', N'Steve''s Birthday', N'Steve''s Birthday Bash')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (696, 162, N'AssetId', N'', N'18')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (697, 162, N'Deleted', N'False', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (698, 163, N'AssetID', N'', N'85')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (699, 163, N'CategoryID', N'', N'81')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (700, 163, N'Name', N'', N'Event # 2')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (701, 163, N'Display', N'', N'0')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (702, 163, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (703, 163, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (704, 164, N'AssetID', N'', N'86')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (705, 164, N'CategoryID', N'', N'80')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (706, 164, N'Name', N'', N'This is getting old')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (707, 164, N'Display', N'', N'0')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (708, 164, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (709, 164, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (710, 165, N'AssetID', N'', N'87')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (711, 165, N'AlbumID', N'', N'86')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (712, 165, N'Title', N'', N'Here is the title')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (713, 165, N'Caption', N'', N'facility2')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (714, 165, N'Image', N'', N'/img/facility2.jpg')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (715, 165, N'Display', N'', N'1')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (716, 165, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (717, 165, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (718, 166, N'AssetID', N'', N'88')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (719, 166, N'AlbumID', N'', N'86')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (720, 166, N'Title', N'', N'facility3')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (721, 166, N'Caption', N'', N'facility3')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (722, 166, N'Image', N'', N'/img/facility3.jpg')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (723, 166, N'Display', N'', N'1')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (724, 166, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (725, 166, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (726, 166, N'Display', N'1', N'2')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (727, 167, N'AssetID', N'', N'89')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (728, 167, N'AlbumID', N'', N'86')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (729, 167, N'Title', N'', N'SiteSteam2')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (730, 167, N'Caption', N'', N'SiteSteam2')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (731, 167, N'Image', N'', N'/img/SiteSteam2.png')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (732, 167, N'Display', N'', N'1')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (733, 167, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (734, 167, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (735, 167, N'Display', N'1', N'3')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (736, 168, N'AssetID', N'', N'90')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (737, 168, N'AlbumID', N'', N'85')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (738, 168, N'Title', N'', N'Molton Volleyball Title')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (739, 168, N'Caption', N'', N'Molton Volleyball Caption')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (740, 168, N'Image', N'', N'/img/volleyball-molton.jpg')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (741, 168, N'Display', N'', N'1')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (742, 168, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (743, 168, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (744, 169, N'AssetId', N'', N'87')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (745, 169, N'Title', N'Here is the title', N'facility2')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (746, 169, N'Caption', N'facility2', N'Here is the caption for facility2')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (747, 170, N'AssetId', N'', N'40')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (748, 170, N'Scheduled', N'1/1/1753 12:00:00 AM', N'9/8/2016 12:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (749, 171, N'AssetID', N'', N'91')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (750, 171, N'SportID', N'', N'16')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (751, 171, N'Name', N'', N'K thru 2nd Grade Volleyball Skills Mini Camp')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (752, 171, N'Description', N'', N'

These Classes Will Run Tuesday Evenings From 5:30-6:30pm')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (753, 171, N'StartDate', N'', N'9/27/2016 12:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (754, 171, N'EndDate', N'', N'11/15/2016 12:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (755, 171, N'Deadline', N'', N'9/25/2016 12:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (756, 171, N'Cost', N'', N'90')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (757, 171, N'UserID', N'', N'27')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (758, 171, N'EZRegister', N'', N'https://tms.ezfacility.com/OnlineRegistrations/Register.aspx?CompanyID=5325&GroupID=1611110')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (759, 171, N'Link', N'', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (760, 171, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (761, 171, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (762, 172, N'AssetID', N'', N'92')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (763, 172, N'Name', N'', N'SiteSteam')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (764, 172, N'Heading', N'', N'Get the website you''ve always wanted!')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (765, 172, N'Message', N'', N'SiteSteam, LLC is a professional website design and development company and is offering 10% off new websites for <strong>NEO Sports Plant customers</strong>. Mention this advertisement when ordering.')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (766, 172, N'Link', N'', N'http://www.sitesteam.com/')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (767, 172, N'Label', N'', N'Signup Today!')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (768, 172, N'Frequency', N'', N'5')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (769, 172, N'Times', N'', N'0')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (770, 172, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (771, 172, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (772, 173, N'AssetID', N'', N'93')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (773, 173, N'Name', N'', N'Diversified Insurance Concepts')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (774, 173, N'Heading', N'', N'Let Us Do the Shopping For You')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (775, 173, N'Message', N'', N'Diversified Insurance Concepts’ commitment to superior customer service is the driving factor that sets us apart from our competitors. We treat each client with the urgency, reliability and respect they should expect from their independent agent.')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (776, 173, N'Link', N'', N'http://www.diversifiedinsuranceconcepts.com/')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (777, 173, N'Label', N'', N'Contact Us')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (778, 173, N'Frequency', N'', N'7')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (779, 173, N'Times', N'', N'0')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (780, 173, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (781, 173, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (782, 174, N'AssetID', N'', N'94')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (783, 174, N'Name', N'', N'Sand Volleyball')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (784, 174, N'Display', N'', N'2')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (785, 174, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (786, 174, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (787, 175, N'AssetID', N'', N'95')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (788, 175, N'CategoryID', N'', N'94')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (789, 175, N'Name', N'', N'Sand Volleyball')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (790, 175, N'Display', N'', N'0')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (791, 175, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (792, 175, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (793, 176, N'AssetID', N'', N'96')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (794, 176, N'SportID', N'', N'47')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (795, 176, N'Name', N'', N'Winter 2016')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (796, 176, N'Deadline', N'', N'1/1/2017 12:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (797, 176, N'StartDate', N'', N'1/8/2017 12:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (798, 176, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (799, 176, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (800, 177, N'AssetID', N'', N'97')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (801, 177, N'SportID', N'', N'47')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (802, 177, N'Name', N'', N'Winter 2016 - 2')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (803, 177, N'Deadline', N'', N'1/1/2017 12:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (804, 177, N'StartDate', N'', N'1/8/2017 12:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (805, 177, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (806, 177, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (807, 178, N'AssetID', N'', N'98')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (808, 178, N'SportID', N'', N'47')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (809, 178, N'Name', N'', N'Winter 2016 - 3')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (810, 178, N'Deadline', N'', N'1/8/2017 12:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (811, 178, N'StartDate', N'', N'1/15/2017 12:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (812, 178, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (813, 178, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (814, 179, N'AssetID', N'', N'99')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (815, 179, N'SessionID', N'', N'98')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (816, 179, N'Name', N'', N'Co-ed 4''s - BB Division')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (817, 179, N'Description', N'', N'Co-ed 4''s - BB Division')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (818, 179, N'Night', N'', N'2')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (819, 179, N'EZRegister', N'', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (820, 179, N'EZSchedule', N'', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (821, 179, N'Cost', N'', N'200')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (822, 179, N'Display', N'', N'1')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (823, 179, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (824, 179, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (825, 180, N'AssetID', N'', N'100')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (826, 180, N'SessionID', N'', N'98')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (827, 180, N'Name', N'', N'Co-ed 6''s - B Division')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (828, 180, N'Description', N'', N'Co-ed 6''s - B Division')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (829, 180, N'Night', N'', N'1')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (830, 180, N'EZRegister', N'', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (831, 180, N'EZSchedule', N'', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (832, 180, N'Cost', N'', N'200')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (833, 180, N'Display', N'', N'1')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (834, 180, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (835, 180, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (836, 181, N'AssetID', N'', N'101')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (837, 181, N'SessionID', N'', N'98')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (838, 181, N'Name', N'', N'Co-ed 6''s - BB/B Division')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (839, 181, N'Description', N'', N'Co-ed 6''s - BB/B Division')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (840, 181, N'Night', N'', N'4')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (841, 181, N'EZRegister', N'', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (842, 181, N'EZSchedule', N'', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (843, 181, N'Cost', N'', N'200')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (844, 181, N'Display', N'', N'4')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (845, 181, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (846, 181, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (847, 182, N'AssetID', N'', N'102')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (848, 182, N'SessionID', N'', N'98')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (849, 182, N'Name', N'', N'Co-ed 4''s - A Division')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (850, 182, N'Description', N'', N'A Division, Co-ed 4''s. Will take up to 9 teams - 4 time slots per night with games starting at 7.')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (851, 182, N'Night', N'', N'2')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (852, 182, N'EZRegister', N'', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (853, 182, N'EZSchedule', N'', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (854, 182, N'Cost', N'', N'200')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (855, 182, N'Display', N'', N'5')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (856, 182, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (857, 182, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (858, 183, N'AssetID', N'', N'103')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (859, 183, N'SessionID', N'', N'98')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (860, 183, N'Name', N'', N'Co-ed 4''s - B Division')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (861, 183, N'Description', N'', N'B Division, Co-ed 4''s. Will take up to 9 teams - 4 time slots per night with games starting at 7.')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (862, 183, N'Night', N'', N'2')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (863, 183, N'EZRegister', N'', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (864, 183, N'EZSchedule', N'', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (865, 183, N'Cost', N'', N'200')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (866, 183, N'Display', N'', N'8')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (867, 183, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (868, 183, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (869, 184, N'AssetId', N'', N'96')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (870, 184, N'Deleted', N'False', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (871, 185, N'AssetId', N'', N'97')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (872, 185, N'Deleted', N'False', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (873, 186, N'AssetId', N'', N'75')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (874, 186, N'EZRegister', N'Co-ed 6''s - B Division', N'http://www.google.com')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (875, 187, N'AssetId', N'', N'75')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (876, 187, N'EZSchedule', N'', N'http://www.google.com')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (877, 188, N'AssetID', N'', N'104')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (878, 188, N'SportID', N'', N'47')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (879, 188, N'Name', N'', N'Spring 2017')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (880, 188, N'Deadline', N'', N'4/1/2017 12:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (881, 188, N'StartDate', N'', N'4/9/2017 12:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (882, 188, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (883, 188, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (884, 189, N'AssetID', N'', N'105')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (885, 189, N'SessionID', N'', N'104')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (886, 189, N'Name', N'', N'Co-ed 4''s - BB Division')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (887, 189, N'Description', N'', N'Co-ed 4''s - BB Division')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (888, 189, N'Night', N'', N'2')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (889, 189, N'EZRegister', N'', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (890, 189, N'EZSchedule', N'', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (891, 189, N'Cost', N'', N'200')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (892, 189, N'Display', N'', N'1')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (893, 189, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (894, 189, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (895, 190, N'AssetID', N'', N'106')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (896, 190, N'SessionID', N'', N'104')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (897, 190, N'Name', N'', N'Co-ed 6''s - B Division')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (898, 190, N'Description', N'', N'Co-ed 6''s - B Division')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (899, 190, N'Night', N'', N'1')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (900, 190, N'EZRegister', N'', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (901, 190, N'EZSchedule', N'', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (902, 190, N'Cost', N'', N'200')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (903, 190, N'Display', N'', N'1')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (904, 190, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (905, 190, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (906, 191, N'AssetID', N'', N'107')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (907, 191, N'SessionID', N'', N'104')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (908, 191, N'Name', N'', N'Co-ed 6''s - BB/B Division')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (909, 191, N'Description', N'', N'Co-ed 6''s - BB/B Division')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (910, 191, N'Night', N'', N'4')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (911, 191, N'EZRegister', N'', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (912, 191, N'EZSchedule', N'', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (913, 191, N'Cost', N'', N'200')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (914, 191, N'Display', N'', N'4')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (915, 191, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (916, 191, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (917, 192, N'AssetID', N'', N'108')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (918, 192, N'SessionID', N'', N'104')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (919, 192, N'Name', N'', N'Co-ed 4''s - A Division')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (920, 192, N'Description', N'', N'A Division, Co-ed 4''s. Will take up to 9 teams - 4 time slots per night with games starting at 7.')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (921, 192, N'Night', N'', N'2')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (922, 192, N'EZRegister', N'', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (923, 192, N'EZSchedule', N'', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (924, 192, N'Cost', N'', N'200')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (925, 192, N'Display', N'', N'5')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (926, 192, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (927, 192, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (928, 193, N'AssetID', N'', N'109')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (929, 193, N'SessionID', N'', N'104')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (930, 193, N'Name', N'', N'Co-ed 4''s - B Division')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (931, 193, N'Description', N'', N'B Division, Co-ed 4''s. Will take up to 9 teams - 4 time slots per night with games starting at 7.')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (932, 193, N'Night', N'', N'2')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (933, 193, N'EZRegister', N'', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (934, 193, N'EZSchedule', N'', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (935, 193, N'Cost', N'', N'200')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (936, 193, N'Display', N'', N'8')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (937, 193, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (938, 193, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (939, 194, N'AssetID', N'', N'110')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (940, 194, N'Name', N'', N'Bocce')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (941, 194, N'Display', N'', N'3')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (942, 194, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (943, 194, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (944, 195, N'AssetID', N'', N'111')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (945, 195, N'SportID', N'', N'110')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (946, 195, N'Name', N'', N'Bocce Session')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (947, 195, N'Deadline', N'', N'12/30/2016 12:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (948, 195, N'StartDate', N'', N'1/2/2017 12:00:00 AM')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (949, 195, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (950, 195, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (951, 196, N'AssetID', N'', N'112')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (952, 196, N'SessionID', N'', N'111')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (953, 196, N'Name', N'', N'First Bocce Session')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (954, 196, N'Description', N'', N'Here is the desc')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (955, 196, N'Night', N'', N'2')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (956, 196, N'EZRegister', N'', N'https://tms.ezfacility.com/OnlineRegistrations/Register.aspx?CompanyID=5325&GroupID=1611110')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (957, 196, N'EZSchedule', N'', N'')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (958, 196, N'Cost', N'', N'250')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (959, 196, N'Display', N'', N'1')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (960, 196, N'Enabled', N'', N'True')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (961, 196, N'Deleted', N'', N'False')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (962, 197, N'AssetID', N'', N'113')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (963, 197, N'Message', N'', N'Open all day today.
Thanks,
Steve')
GO
INSERT [LogDetails] ([ID], [LogID], [Field], [Was], [Now]) VALUES (964, 197, N'Deleted', N'', N'False')
GO
SET IDENTITY_INSERT [LogDetails] OFF
GO
INSERT [News] ([AssetID], [Title], [Description], [Link], [Display], [Enabled], [Deleted]) VALUES (23, N'Here is the first title!', N'Here is some content.  Keep in mind that <strong>we are</strong> dedicated to this.', N'http://www.28heath.com/brochure.pdf', 1, 1, 0)
GO
INSERT [News] ([AssetID], [Title], [Description], [Link], [Display], [Enabled], [Deleted]) VALUES (25, N'Second news article', N'Here''s number two!
Next line.', N'', 2, 1, 0)
GO
INSERT [News] ([AssetID], [Title], [Description], [Link], [Display], [Enabled], [Deleted]) VALUES (26, N'Third one', N'And here is number 3', NULL, 0, 1, 0)
GO
INSERT [PhotoAlbums] ([AssetID], [CategoryID], [Name], [Display], [Enabled], [Deleted]) VALUES (82, 81, N'Steve''s Birthday Bash', 0, 1, 0)
GO
INSERT [PhotoAlbums] ([AssetID], [CategoryID], [Name], [Display], [Enabled], [Deleted]) VALUES (85, 81, N'Event # 2', 0, 1, 0)
GO
INSERT [PhotoAlbums] ([AssetID], [CategoryID], [Name], [Display], [Enabled], [Deleted]) VALUES (86, 80, N'This is getting old', 0, 1, 0)
GO
INSERT [PhotoAlbums] ([AssetID], [CategoryID], [Name], [Display], [Enabled], [Deleted]) VALUES (95, 94, N'Sand Volleyball', 0, 1, 0)
GO
INSERT [PhotoCategories] ([AssetID], [Name], [Display], [Enabled], [Deleted]) VALUES (80, N'Category 1', 0, 1, 0)
GO
INSERT [PhotoCategories] ([AssetID], [Name], [Display], [Enabled], [Deleted]) VALUES (81, N'Events/Parties', 1, 1, 0)
GO
INSERT [PhotoCategories] ([AssetID], [Name], [Display], [Enabled], [Deleted]) VALUES (94, N'Sand Volleyball', 2, 1, 0)
GO
INSERT [Photos] ([AssetID], [AlbumID], [Title], [Caption], [Image], [Display], [Enabled], [Deleted]) VALUES (52, 18, N'Facility Title', N'Facility Caption', N'/img/facility2.jpg', 2, 1, 0)
GO
INSERT [Photos] ([AssetID], [AlbumID], [Title], [Caption], [Image], [Display], [Enabled], [Deleted]) VALUES (53, 18, N'Weights', N'Check out our weightroom!', N'/img/facility3.jpg', 3, 1, 0)
GO
INSERT [Photos] ([AssetID], [AlbumID], [Title], [Caption], [Image], [Display], [Enabled], [Deleted]) VALUES (55, 18, N'The Beach!', N'Here is a shot of a stupid net.', N'/img/facility1.jpg', 1, 1, 0)
GO
INSERT [Photos] ([AssetID], [AlbumID], [Title], [Caption], [Image], [Display], [Enabled], [Deleted]) VALUES (83, 82, N'Here is Steve''s Birthday', N'Caption', N'/img/facility1.jpg', 2, 1, 0)
GO
INSERT [Photos] ([AssetID], [AlbumID], [Title], [Caption], [Image], [Display], [Enabled], [Deleted]) VALUES (84, 82, N'Another title', N'Antoher caption', N'/img/LogoSmall.gif', 1, 1, 0)
GO
INSERT [Photos] ([AssetID], [AlbumID], [Title], [Caption], [Image], [Display], [Enabled], [Deleted]) VALUES (87, 86, N'facility2', N'Here is the caption for facility2', N'/img/facility2.jpg', 2, 1, 0)
GO
INSERT [Photos] ([AssetID], [AlbumID], [Title], [Caption], [Image], [Display], [Enabled], [Deleted]) VALUES (88, 86, N'facility3', N'facility3', N'/img/facility3.jpg', 3, 1, 0)
GO
INSERT [Photos] ([AssetID], [AlbumID], [Title], [Caption], [Image], [Display], [Enabled], [Deleted]) VALUES (89, 86, N'SiteSteam2', N'SiteSteam2', N'/img/SiteSteam2.png', 1, 1, 0)
GO
INSERT [Photos] ([AssetID], [AlbumID], [Title], [Caption], [Image], [Display], [Enabled], [Deleted]) VALUES (90, 85, N'Molton Volleyball Title', N'Molton Volleyball Caption', N'/img/volleyball-molton.jpg', 1, 1, 0)
GO
INSERT [Players] ([AssetID], [Email], [Password], [First], [Last], [Address], [City], [State], [Zip], [Phone], [PrivatePhone], [PrivateEmail], [Enabled], [Deleted]) VALUES (61, N'healy@sitesteam.com', N'kP96lBguDQJb38CnYq1WPg==', N'Steve', N'Healy', N'5173 Windsor Drive', N'North Ridgeville', N'OH', N'44039', N'2165510980', 1, 0, 1, 0)
GO
INSERT [Players] ([AssetID], [Email], [Password], [First], [Last], [Address], [City], [State], [Zip], [Phone], [PrivatePhone], [PrivateEmail], [Enabled], [Deleted]) VALUES (62, N'stephen.healy@pnc.com', N'gw3E+39LSiazZLyfvxYbwQ==', N'Jim', N'Smith', N'4100 West 150th Street', N'Cleveland', N'OH', N'44135', N'2162575757', 0, 0, 1, 0)
GO
SET IDENTITY_INSERT [PositionMembers] ON 

GO
INSERT [PositionMembers] ([ID], [SeekingID], [PlayerID], [PositionID], [Created], [Deleted]) VALUES (1, 8, 0, 66, CAST(N'2016-06-30 14:31:13.740' AS DateTime), CAST(N'2016-06-30 14:52:31.110' AS DateTime))
GO
INSERT [PositionMembers] ([ID], [SeekingID], [PlayerID], [PositionID], [Created], [Deleted]) VALUES (2, 8, 0, 66, CAST(N'2016-06-30 14:52:31.110' AS DateTime), CAST(N'2016-06-30 14:53:45.633' AS DateTime))
GO
INSERT [PositionMembers] ([ID], [SeekingID], [PlayerID], [PositionID], [Created], [Deleted]) VALUES (3, 8, 0, 66, CAST(N'2016-06-30 14:53:45.633' AS DateTime), CAST(N'2016-06-30 14:58:15.127' AS DateTime))
GO
INSERT [PositionMembers] ([ID], [SeekingID], [PlayerID], [PositionID], [Created], [Deleted]) VALUES (4, 8, 0, 66, CAST(N'2016-06-30 14:58:15.127' AS DateTime), CAST(N'2016-06-30 18:14:57.657' AS DateTime))
GO
INSERT [PositionMembers] ([ID], [SeekingID], [PlayerID], [PositionID], [Created], [Deleted]) VALUES (5, 8, 0, 66, CAST(N'2016-06-30 18:14:57.657' AS DateTime), CAST(N'2016-06-30 18:15:03.857' AS DateTime))
GO
INSERT [PositionMembers] ([ID], [SeekingID], [PlayerID], [PositionID], [Created], [Deleted]) VALUES (6, 8, 0, 66, CAST(N'2016-06-30 18:15:03.857' AS DateTime), NULL)
GO
INSERT [PositionMembers] ([ID], [SeekingID], [PlayerID], [PositionID], [Created], [Deleted]) VALUES (7, 0, 61, 67, CAST(N'2016-06-30 18:49:09.960' AS DateTime), CAST(N'2016-06-30 18:49:21.967' AS DateTime))
GO
INSERT [PositionMembers] ([ID], [SeekingID], [PlayerID], [PositionID], [Created], [Deleted]) VALUES (8, 0, 61, 66, CAST(N'2016-06-30 18:49:09.960' AS DateTime), CAST(N'2016-06-30 18:49:21.967' AS DateTime))
GO
INSERT [PositionMembers] ([ID], [SeekingID], [PlayerID], [PositionID], [Created], [Deleted]) VALUES (9, 0, 61, 68, CAST(N'2016-06-30 18:49:21.967' AS DateTime), CAST(N'2016-06-30 18:53:26.847' AS DateTime))
GO
INSERT [PositionMembers] ([ID], [SeekingID], [PlayerID], [PositionID], [Created], [Deleted]) VALUES (10, 0, 61, 68, CAST(N'2016-06-30 18:53:26.847' AS DateTime), NULL)
GO
INSERT [PositionMembers] ([ID], [SeekingID], [PlayerID], [PositionID], [Created], [Deleted]) VALUES (11, 0, 61, 66, CAST(N'2016-06-30 18:53:26.847' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [PositionMembers] OFF
GO
INSERT [Positions] ([AssetID], [Name], [Description], [Display], [Enabled], [Deleted]) VALUES (66, N'Volleyball - Setter', N'The setter is special', 3, 1, 0)
GO
INSERT [Positions] ([AssetID], [Name], [Description], [Display], [Enabled], [Deleted]) VALUES (67, N'Volleyball - Strong Side', N'HEre is the strong side.', 1, 1, 0)
GO
INSERT [Positions] ([AssetID], [Name], [Description], [Display], [Enabled], [Deleted]) VALUES (68, N'Volleyball - Defensive Specialist', N'You are great at defense.', 2, 1, 0)
GO
SET IDENTITY_INSERT [Seeking] ON 

GO
INSERT [Seeking] ([ID], [PlayerID], [Team], [Description], [Filled], [Created], [Updated], [Deleted]) VALUES (1, 61, NULL, N'I''m so lonely.', NULL, CAST(N'2016-06-22 00:00:00.000' AS DateTime), NULL, 0)
GO
INSERT [Seeking] ([ID], [PlayerID], [Team], [Description], [Filled], [Created], [Updated], [Deleted]) VALUES (3, 62, NULL, N'safsdafas', NULL, CAST(N'2016-06-23 21:00:29.757' AS DateTime), NULL, 0)
GO
INSERT [Seeking] ([ID], [PlayerID], [Team], [Description], [Filled], [Created], [Updated], [Deleted]) VALUES (4, 62, NULL, N'fsd fdsafdfsdakfjsdaklfjsdaf


hjf asdkfjdsaf

j kfdsjf sa', NULL, CAST(N'2016-06-23 21:01:39.170' AS DateTime), NULL, 0)
GO
INSERT [Seeking] ([ID], [PlayerID], [Team], [Description], [Filled], [Created], [Updated], [Deleted]) VALUES (8, 61, N'Miracles', N'We need a short, stalky, bald setter.', NULL, CAST(N'2016-06-30 14:31:13.740' AS DateTime), NULL, 0)
GO
SET IDENTITY_INSERT [Seeking] OFF
GO
INSERT [Sessions] ([AssetID], [SportID], [Name], [Deadline], [StartDate], [Enabled], [Deleted]) VALUES (20, 16, N'Summer 2015', CAST(N'2016-05-18 04:00:00.000' AS DateTime), CAST(N'2016-06-01 04:00:00.000' AS DateTime), 1, 0)
GO
INSERT [Sessions] ([AssetID], [SportID], [Name], [Deadline], [StartDate], [Enabled], [Deleted]) VALUES (21, 17, N'Summer 2016', CAST(N'2016-06-12 04:00:00.000' AS DateTime), CAST(N'2016-06-14 04:00:00.000' AS DateTime), 1, 0)
GO
INSERT [Sessions] ([AssetID], [SportID], [Name], [Deadline], [StartDate], [Enabled], [Deleted]) VALUES (44, 17, N'Fall 2015', CAST(N'2016-08-28 04:00:00.000' AS DateTime), CAST(N'2016-09-01 04:00:00.000' AS DateTime), 1, 0)
GO
INSERT [Sessions] ([AssetID], [SportID], [Name], [Deadline], [StartDate], [Enabled], [Deleted]) VALUES (71, 47, N'Fall 2016', CAST(N'2016-09-01 00:00:00.000' AS DateTime), CAST(N'2016-09-05 00:00:00.000' AS DateTime), 1, 0)
GO
INSERT [Sessions] ([AssetID], [SportID], [Name], [Deadline], [StartDate], [Enabled], [Deleted]) VALUES (96, 47, N'Winter 2016', CAST(N'2017-01-01 00:00:00.000' AS DateTime), CAST(N'2017-01-08 00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [Sessions] ([AssetID], [SportID], [Name], [Deadline], [StartDate], [Enabled], [Deleted]) VALUES (97, 47, N'Winter 2016 - 2', CAST(N'2017-01-01 00:00:00.000' AS DateTime), CAST(N'2017-01-08 00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [Sessions] ([AssetID], [SportID], [Name], [Deadline], [StartDate], [Enabled], [Deleted]) VALUES (98, 47, N'Winter 2016 - 3', CAST(N'2017-01-08 00:00:00.000' AS DateTime), CAST(N'2017-01-15 00:00:00.000' AS DateTime), 1, 0)
GO
INSERT [Sessions] ([AssetID], [SportID], [Name], [Deadline], [StartDate], [Enabled], [Deleted]) VALUES (104, 47, N'Spring 2017', CAST(N'2017-04-01 00:00:00.000' AS DateTime), CAST(N'2017-04-09 00:00:00.000' AS DateTime), 1, 0)
GO
INSERT [Sessions] ([AssetID], [SportID], [Name], [Deadline], [StartDate], [Enabled], [Deleted]) VALUES (111, 110, N'Bocce Session', CAST(N'2016-12-30 00:00:00.000' AS DateTime), CAST(N'2017-01-02 00:00:00.000' AS DateTime), 1, 0)
GO
INSERT [Settings] ([AssetID], [Alert], [AlertStart], [AlertEnd], [EmailFrom], [EventTo], [EventCc], [EventBcc], [ContactTo], [ContactCc], [ContactBcc], [LeagueError], [LeagueWarning], [Lesson], [Event], [Players], [Teams], [Date], [Deleted]) VALUES (70, N'', NULL, NULL, N'noreply@neosportsplant.com', N'healy@sitesteam.com', N'', N'', N'healy@sitesteam.com', N'', N'', 0, -1, 2, 2, 1, 1, NULL, 0)
GO
SET IDENTITY_INSERT [Sidebar] ON 

GO
INSERT [Sidebar] ([ID], [SportID], [Alt], [Image], [Display], [Enabled], [Deleted]) VALUES (2, 110, N'Bocce', N'/img/bocce1.jpg', 1, 1, 0)
GO
INSERT [Sidebar] ([ID], [SportID], [Alt], [Image], [Display], [Enabled], [Deleted]) VALUES (4, 110, N'Bocce', N'/img/bocce2.jpg', 2, 1, 0)
GO
INSERT [Sidebar] ([ID], [SportID], [Alt], [Image], [Display], [Enabled], [Deleted]) VALUES (5, 17, N'Basketball', N'/img/basketball.jpg', 1, 1, 0)
GO
INSERT [Sidebar] ([ID], [SportID], [Alt], [Image], [Display], [Enabled], [Deleted]) VALUES (6, 1, N'Baseball', N'/img/basketball.jpg', 1, 1, 0)
GO
INSERT [Sidebar] ([ID], [SportID], [Alt], [Image], [Display], [Enabled], [Deleted]) VALUES (7, 2, N'Basketball', N'/img/basketball.jpg', 1, 1, 0)
GO
SET IDENTITY_INSERT [Sidebar] OFF
GO
INSERT [Sponsors] ([AssetID], [Name], [Logo], [Web], [Address], [City], [State], [Zip], [Phone], [Description], [Display], [Enabled], [Deleted]) VALUES (56, N'jQuery', N'/img/temp/logo2-grayscale.png', N'http://www.yahoo.com', N'', N'North Ridgeville', N'OH', N'', N'2165510980', N'Right now, they are offering half off appetizers', 1, 1, 0)
GO
INSERT [Sports] ([AssetID], [Name], [Display], [Enabled], [Deleted]) VALUES (16, N'Indoor Volleyball', 2, 1, 0)
GO
INSERT [Sports] ([AssetID], [Name], [Display], [Enabled], [Deleted]) VALUES (17, N'Basketball', 1, 1, 0)
GO
INSERT [Sports] ([AssetID], [Name], [Display], [Enabled], [Deleted]) VALUES (18, N'Facility', 4, 1, 1)
GO
INSERT [Sports] ([AssetID], [Name], [Display], [Enabled], [Deleted]) VALUES (47, N'Indoor Sand Volleyball', 3, 1, 0)
GO
INSERT [Sports] ([AssetID], [Name], [Display], [Enabled], [Deleted]) VALUES (110, N'Bocce', 3, 1, 0)
GO
SET IDENTITY_INSERT [SubscriptionMembers] ON 

GO
INSERT [SubscriptionMembers] ([ID], [SubscriptionID], [TypeID], [Created], [Deleted]) VALUES (1, 0, 58, CAST(N'2016-06-23 15:34:56.877' AS DateTime), 1)
GO
INSERT [SubscriptionMembers] ([ID], [SubscriptionID], [TypeID], [Created], [Deleted]) VALUES (2, 0, 59, CAST(N'2016-06-23 15:34:56.877' AS DateTime), 1)
GO
INSERT [SubscriptionMembers] ([ID], [SubscriptionID], [TypeID], [Created], [Deleted]) VALUES (3, 4, 60, CAST(N'2016-06-23 15:41:54.087' AS DateTime), 1)
GO
INSERT [SubscriptionMembers] ([ID], [SubscriptionID], [TypeID], [Created], [Deleted]) VALUES (4, 4, 58, CAST(N'2016-06-23 15:44:59.470' AS DateTime), 1)
GO
INSERT [SubscriptionMembers] ([ID], [SubscriptionID], [TypeID], [Created], [Deleted]) VALUES (5, 4, 59, CAST(N'2016-06-23 15:44:59.470' AS DateTime), 1)
GO
INSERT [SubscriptionMembers] ([ID], [SubscriptionID], [TypeID], [Created], [Deleted]) VALUES (6, 4, 58, CAST(N'2016-06-23 15:48:26.833' AS DateTime), 1)
GO
INSERT [SubscriptionMembers] ([ID], [SubscriptionID], [TypeID], [Created], [Deleted]) VALUES (7, 4, 59, CAST(N'2016-06-23 15:48:26.833' AS DateTime), 1)
GO
INSERT [SubscriptionMembers] ([ID], [SubscriptionID], [TypeID], [Created], [Deleted]) VALUES (8, 4, 58, CAST(N'2016-06-23 15:49:02.047' AS DateTime), 1)
GO
INSERT [SubscriptionMembers] ([ID], [SubscriptionID], [TypeID], [Created], [Deleted]) VALUES (9, 4, 59, CAST(N'2016-06-23 15:49:02.047' AS DateTime), 1)
GO
INSERT [SubscriptionMembers] ([ID], [SubscriptionID], [TypeID], [Created], [Deleted]) VALUES (10, 4, 58, CAST(N'2016-06-23 15:50:12.637' AS DateTime), 1)
GO
INSERT [SubscriptionMembers] ([ID], [SubscriptionID], [TypeID], [Created], [Deleted]) VALUES (11, 4, 59, CAST(N'2016-06-23 15:50:12.637' AS DateTime), 1)
GO
INSERT [SubscriptionMembers] ([ID], [SubscriptionID], [TypeID], [Created], [Deleted]) VALUES (12, 4, 58, CAST(N'2016-06-23 15:52:30.067' AS DateTime), 1)
GO
INSERT [SubscriptionMembers] ([ID], [SubscriptionID], [TypeID], [Created], [Deleted]) VALUES (13, 4, 59, CAST(N'2016-06-23 15:52:30.067' AS DateTime), 1)
GO
INSERT [SubscriptionMembers] ([ID], [SubscriptionID], [TypeID], [Created], [Deleted]) VALUES (14, 4, 58, CAST(N'2016-06-23 15:54:14.520' AS DateTime), 1)
GO
INSERT [SubscriptionMembers] ([ID], [SubscriptionID], [TypeID], [Created], [Deleted]) VALUES (15, 4, 59, CAST(N'2016-06-23 15:54:14.523' AS DateTime), 1)
GO
INSERT [SubscriptionMembers] ([ID], [SubscriptionID], [TypeID], [Created], [Deleted]) VALUES (16, 4, 58, CAST(N'2016-06-23 15:55:20.157' AS DateTime), 1)
GO
INSERT [SubscriptionMembers] ([ID], [SubscriptionID], [TypeID], [Created], [Deleted]) VALUES (17, 4, 59, CAST(N'2016-06-23 15:55:20.160' AS DateTime), 1)
GO
INSERT [SubscriptionMembers] ([ID], [SubscriptionID], [TypeID], [Created], [Deleted]) VALUES (18, 4, 58, CAST(N'2016-06-23 15:55:38.727' AS DateTime), 1)
GO
INSERT [SubscriptionMembers] ([ID], [SubscriptionID], [TypeID], [Created], [Deleted]) VALUES (19, 4, 59, CAST(N'2016-06-23 15:55:41.100' AS DateTime), 1)
GO
INSERT [SubscriptionMembers] ([ID], [SubscriptionID], [TypeID], [Created], [Deleted]) VALUES (20, 4, 58, CAST(N'2016-06-23 15:57:16.307' AS DateTime), 1)
GO
INSERT [SubscriptionMembers] ([ID], [SubscriptionID], [TypeID], [Created], [Deleted]) VALUES (21, 4, 59, CAST(N'2016-06-23 15:57:16.310' AS DateTime), 1)
GO
INSERT [SubscriptionMembers] ([ID], [SubscriptionID], [TypeID], [Created], [Deleted]) VALUES (22, 4, 58, CAST(N'2016-06-23 15:57:58.423' AS DateTime), 1)
GO
INSERT [SubscriptionMembers] ([ID], [SubscriptionID], [TypeID], [Created], [Deleted]) VALUES (23, 4, 59, CAST(N'2016-06-23 15:57:58.423' AS DateTime), 1)
GO
INSERT [SubscriptionMembers] ([ID], [SubscriptionID], [TypeID], [Created], [Deleted]) VALUES (24, 4, 58, CAST(N'2016-06-23 16:00:42.217' AS DateTime), 1)
GO
INSERT [SubscriptionMembers] ([ID], [SubscriptionID], [TypeID], [Created], [Deleted]) VALUES (25, 4, 59, CAST(N'2016-06-23 16:00:42.217' AS DateTime), 1)
GO
INSERT [SubscriptionMembers] ([ID], [SubscriptionID], [TypeID], [Created], [Deleted]) VALUES (26, 4, 58, CAST(N'2016-06-23 16:02:19.533' AS DateTime), 1)
GO
INSERT [SubscriptionMembers] ([ID], [SubscriptionID], [TypeID], [Created], [Deleted]) VALUES (27, 4, 59, CAST(N'2016-06-23 16:02:19.533' AS DateTime), 1)
GO
INSERT [SubscriptionMembers] ([ID], [SubscriptionID], [TypeID], [Created], [Deleted]) VALUES (28, 4, 58, CAST(N'2016-06-23 16:03:13.143' AS DateTime), 0)
GO
INSERT [SubscriptionMembers] ([ID], [SubscriptionID], [TypeID], [Created], [Deleted]) VALUES (29, 4, 59, CAST(N'2016-06-23 16:03:13.143' AS DateTime), 0)
GO
INSERT [SubscriptionMembers] ([ID], [SubscriptionID], [TypeID], [Created], [Deleted]) VALUES (30, 0, 58, CAST(N'2016-06-23 16:03:44.897' AS DateTime), 0)
GO
INSERT [SubscriptionMembers] ([ID], [SubscriptionID], [TypeID], [Created], [Deleted]) VALUES (31, 0, 59, CAST(N'2016-06-23 16:03:44.897' AS DateTime), 0)
GO
INSERT [SubscriptionMembers] ([ID], [SubscriptionID], [TypeID], [Created], [Deleted]) VALUES (32, 6, 58, CAST(N'2016-06-23 16:04:19.477' AS DateTime), 0)
GO
INSERT [SubscriptionMembers] ([ID], [SubscriptionID], [TypeID], [Created], [Deleted]) VALUES (33, 6, 59, CAST(N'2016-06-23 16:04:19.477' AS DateTime), 0)
GO
SET IDENTITY_INSERT [SubscriptionMembers] OFF
GO
SET IDENTITY_INSERT [Subscriptions] ON 

GO
INSERT [Subscriptions] ([ID], [Email], [Created]) VALUES (1, N'steph@yahoo.com', CAST(N'2016-06-16 20:09:40.360' AS DateTime))
GO
INSERT [Subscriptions] ([ID], [Email], [Created]) VALUES (2, N'steph@yahoo.com2', CAST(N'2016-06-16 20:12:03.967' AS DateTime))
GO
INSERT [Subscriptions] ([ID], [Email], [Created]) VALUES (3, N'steph@yahoo.com3', CAST(N'2016-06-16 20:12:51.867' AS DateTime))
GO
INSERT [Subscriptions] ([ID], [Email], [Created]) VALUES (4, N'steve.healy@google.com', CAST(N'2016-06-23 16:03:13.143' AS DateTime))
GO
INSERT [Subscriptions] ([ID], [Email], [Created]) VALUES (5, N'steve.healys@google.com', CAST(N'2016-06-23 16:03:44.897' AS DateTime))
GO
INSERT [Subscriptions] ([ID], [Email], [Created]) VALUES (6, N'steve.healys2@google.com', CAST(N'2016-06-23 16:04:19.467' AS DateTime))
GO
SET IDENTITY_INSERT [Subscriptions] OFF
GO
INSERT [SubscriptionTypes] ([AssetID], [SportID], [Name], [Display], [Enabled], [Deleted]) VALUES (58, 17, N'Indoor Leagues', 0, 1, 0)
GO
INSERT [SubscriptionTypes] ([AssetID], [SportID], [Name], [Display], [Enabled], [Deleted]) VALUES (59, 17, N'Indoor Tournaments', 0, 1, 0)
GO
INSERT [SubscriptionTypes] ([AssetID], [SportID], [Name], [Display], [Enabled], [Deleted]) VALUES (60, 16, N'Tournaments', 0, 1, 0)
GO
INSERT [Testimonials] ([AssetID], [Name], [Company], [Testimonial], [Email], [Image], [Display], [Enabled], [Deleted]) VALUES (57, N'Barack Obama', N'United States of America', N'This is the best thing I''ve ever seen!

And then some!', N'potus@us.gov', N'', 1, 1, 0)
GO
INSERT [Tournaments] ([AssetID], [SportID], [Name], [Description], [Location], [Date], [Deadline], [Cost], [UserID], [EZRegister], [EZSchedule], [Enabled], [Deleted]) VALUES (46, 17, N'PQSports Summer Championship', N'PQSports Summer Championship is a three day, competitive national basketball tournament for boys and girls grassroots basketball programs that will take place in the beautiful “Garden City” of Augusta, GA and the event headquarters will be Riverview Park the home of the Nike EYBL Peach Jam. This event will serves as a highly competitive tune-up tournament for grassroots basketball teams that are getting ready for their AAU, USSSA, USBA, or other organizations National’s and NCAA certified tournaments in July. 

This event is also a High School team camp for boys and girls teams. When: June 17-19, 2016 Where: North Augusta, SC & Augusta, GA Area Entry Fee: $250 for 2nd – 11th Grade Eligibility: Boys & Girls 1st – 11th Grade/Unsigned Seniors Headquarters: Riverview Park, home of the Nike EYBL Peach Jam This event will serves as a highly competitive tune-up tournament for grassroots basketball teams that are getting ready for their AAU, USSSA, USBA, or other organizations National tournaments in July. ', N'Riverview Park', CAST(N'2016-09-09 00:00:00.000' AS DateTime), CAST(N'2016-09-07 00:00:00.000' AS DateTime), 250, 4, N'https://tms.ezfacility.com/OnlineRegistrations/Register.aspx?CompanyID=5325&GroupID=1583638', N'', 1, 0)
GO
INSERT [Users] ([AssetID], [First], [Last], [Email], [Password], [Staff], [Title], [Bio], [Image], [Facebook], [Twitter], [Phone], [Display], [Super], [Enabled], [Deleted]) VALUES (4, N'Steve', N'Healy', N'healy@sitesteam.com', N'gw3E+39LSiazZLyfvxYbwQ==', 0, N'', N'', N'http://localhost:52740/img/4.png', N'', N'          ', N'', 1, 1, 1, 0)
GO
INSERT [Users] ([AssetID], [First], [Last], [Email], [Password], [Staff], [Title], [Bio], [Image], [Facebook], [Twitter], [Phone], [Display], [Super], [Enabled], [Deleted]) VALUES (27, N'Rodger', N'Smith', N'rosmith18@gmail.com', N'3NdXv5rHCIVTFyv+LnPdRg==', 1, N'Volleyball Operations', N'In 2004, Obama received national attention during his campaign to represent Illinois in the United States Senate with his victory in the March Democratic Party primary, his keynote address at the Democratic National Convention in July, and his election to the Senate in November. He began his presidential campaign in 2007 and, after a close primary campaign against Hillary Clinton in 2008, he won sufficient delegates in the Democratic Party primaries to receive the presidential nomination. He then defeated Republican nominee John McCain in the general election, and was inaugurated as president on January 20, 2009. Nine months after his inauguration, Obama was named the 2009 Nobel Peace Prize laureate.

During his first two years in office, Obama signed into law economic stimulus legislation in response to the Great Recession in the form of the American Recovery and Reinvestment Act of 2009 and the Tax Relief, Unemployment Insurance Reauthorization, and Job Creation Act of 2010. Other major domestic initiatives in his first term included the Patient Protection and Affordable Care Act, often referred to as "Obamacare"; the Dodd–Frank Wall Street Reform and Consumer Protection Act; and the Don''t Ask, Don''t Tell Repeal Act of 2010. In foreign policy, Obama ended U.S. military involvement in the Iraq War, increased U.S. troop levels in Afghanistan, signed the New START arms control treaty with Russia, ordered U.S. military involvement in Libya in opposition to Muammar Gaddafi, and ordered the military operation that resulted in the death of Osama bin Laden. In January 2011, the Republicans regained control of the House of Representatives as the Democratic Party lost a total of 63 seats; and, after a lengthy debate over federal spending and whether or not to raise the nation''s debt limit, Obama signed the Budget Control Act of 2011 and the American Taxpayer Relief Act of 2012.', N'http://localhost:52532/img/27.png', N'', N'          ', N'2161234567', 0, 0, 1, 0)
GO
INSERT [Users] ([AssetID], [First], [Last], [Email], [Password], [Staff], [Title], [Bio], [Image], [Facebook], [Twitter], [Phone], [Display], [Super], [Enabled], [Deleted]) VALUES (79, N'Deb', N'Smith', N'deb@sitesteam.com', N'hrIMWBWDkilLLPqs7q85sA==', 0, N'', N'', NULL, N'', N'', N'', 0, 0, 1, 1)
GO
