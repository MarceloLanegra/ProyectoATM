USE [master]
GO
/****** Object:  Database [ATMDB]    Script Date: 25/11/2021 21:21:53 ******/
CREATE DATABASE [ATMDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ATMDB', FILENAME = N'D:\BD_ProyectosUPC\BD_ATMs\ATMDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ATMDB_log', FILENAME = N'D:\BD_ProyectosUPC\BD_ATMs\ATMDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ATMDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ATMDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ATMDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ATMDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ATMDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ATMDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ATMDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ATMDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ATMDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ATMDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ATMDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ATMDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ATMDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ATMDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ATMDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ATMDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ATMDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ATMDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ATMDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ATMDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ATMDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ATMDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ATMDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ATMDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ATMDB] SET RECOVERY FULL 
GO
ALTER DATABASE [ATMDB] SET  MULTI_USER 
GO
ALTER DATABASE [ATMDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ATMDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ATMDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ATMDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ATMDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ATMDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ATMDB', N'ON'
GO
ALTER DATABASE [ATMDB] SET QUERY_STORE = OFF
GO
USE [ATMDB]
GO
/****** Object:  Table [dbo].[atm_brands]    Script Date: 25/11/2021 21:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[atm_brands](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](45) NULL,
	[description] [varchar](45) NULL,
 CONSTRAINT [PK_atm_brands] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[atm_models]    Script Date: 25/11/2021 21:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[atm_models](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](45) NULL,
	[description] [varchar](45) NULL,
	[atm_brands_id] [int] NOT NULL,
 CONSTRAINT [PK_atm_models] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[atm_states]    Script Date: 25/11/2021 21:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[atm_states](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](45) NULL,
 CONSTRAINT [PK_atm_states] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[atm_types]    Script Date: 25/11/2021 21:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[atm_types](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](45) NULL,
	[description] [varchar](45) NULL,
 CONSTRAINT [PK_atm_types] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[atms]    Script Date: 25/11/2021 21:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[atms](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[serial_number] [varchar](45) NULL,
	[description] [varchar](45) NULL,
	[manufacturing] [varchar](45) NULL,
	[atm_types_id] [int] NOT NULL,
	[atm_models_id] [int] NOT NULL,
	[atm_states_id] [int] NOT NULL,
 CONSTRAINT [PK_atms] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[departments]    Script Date: 25/11/2021 21:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[departments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[ubigeo] [nvarchar](50) NULL,
 CONSTRAINT [PK_departments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[districts]    Script Date: 25/11/2021 21:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[districts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[ubigeo] [nvarchar](50) NULL,
	[provinces_id] [int] NULL,
 CONSTRAINT [PK_districts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[location_contacts]    Script Date: 25/11/2021 21:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[location_contacts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[last_name] [varchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[position_name] [nvarchar](50) NULL,
	[locations_id] [int] NULL,
 CONSTRAINT [PK_location_contacts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[location_owners]    Script Date: 25/11/2021 21:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[location_owners](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](45) NULL,
	[business_name] [nvarchar](50) NULL,
	[ruc] [varchar](50) NULL,
 CONSTRAINT [PK_location_owners] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[location_types]    Script Date: 25/11/2021 21:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[location_types](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](45) NULL,
	[description] [nvarchar](45) NULL,
 CONSTRAINT [PK_location_types] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[locations]    Script Date: 25/11/2021 21:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[locations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ref_code] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[address_reference] [nvarchar](50) NULL,
	[active_state] [int] NULL,
	[location_type_id] [int] NULL,
	[location_owners_id] [int] NULL,
	[districts_id] [int] NULL,
 CONSTRAINT [PK_locations] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[profiles]    Script Date: 25/11/2021 21:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[profiles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[type] [nvarchar](50) NULL,
	[description] [nvarchar](50) NULL,
 CONSTRAINT [PK_profiles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[provinces]    Script Date: 25/11/2021 21:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[provinces](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[ubigeo] [nvarchar](50) NULL,
	[departments_id] [int] NULL,
 CONSTRAINT [PK_provinces] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[requirement_detail_states]    Script Date: 25/11/2021 21:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[requirement_detail_states](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_requirement_detail_states] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[requirement_details]    Script Date: 25/11/2021 21:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[requirement_details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](50) NULL,
	[date_start] [date] NULL,
	[date_end] [date] NULL,
	[cancel_observation] [nvarchar](50) NULL,
	[requirement_type_id] [int] NULL,
	[requirements_id] [int] NULL,
	[requirement_detial_states_id] [int] NULL,
	[atm_new] [int] NULL,
	[atm_old] [int] NULL,
	[crash_flag] [int] NULL,
 CONSTRAINT [PK_requirement_details] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[requirement_states]    Script Date: 25/11/2021 21:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[requirement_states](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_requirement_states] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[requirement_types]    Script Date: 25/11/2021 21:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[requirement_types](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](50) NULL,
 CONSTRAINT [PK_requirement_types] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[requirements]    Script Date: 25/11/2021 21:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[requirements](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](50) NULL,
	[request_date] [date] NULL,
	[completion_date] [date] NULL,
	[percentage_success] [numeric](18, 2) NULL,
	[user_assigned] [int] NULL,
	[file_url] [nvarchar](50) NULL,
	[locations_id] [int] NULL,
	[requirement_states_id] [int] NULL,
 CONSTRAINT [PK_requirements] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 25/11/2021 21:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](50) NULL,
	[name] [nvarchar](50) NULL,
	[last_name] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[description] [nvarchar](50) NULL,
	[admin] [int] NULL,
	[update_at] [datetime] NULL,
	[encrypted_password] [nvarchar](50) NULL,
	[reset_password_token] [nvarchar](50) NULL,
	[reset_password_sent_at] [nvarchar](50) NULL,
	[remember_created_at] [nvarchar](50) NULL,
	[profiles_id] [int] NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[atm_models]  WITH CHECK ADD  CONSTRAINT [FK_atm_models_atm_brands] FOREIGN KEY([id])
REFERENCES [dbo].[atm_brands] ([id])
GO
ALTER TABLE [dbo].[atm_models] CHECK CONSTRAINT [FK_atm_models_atm_brands]
GO
ALTER TABLE [dbo].[atms]  WITH CHECK ADD  CONSTRAINT [FK_atms_atm_models] FOREIGN KEY([atm_models_id])
REFERENCES [dbo].[atm_models] ([id])
GO
ALTER TABLE [dbo].[atms] CHECK CONSTRAINT [FK_atms_atm_models]
GO
ALTER TABLE [dbo].[atms]  WITH CHECK ADD  CONSTRAINT [FK_atms_atm_states] FOREIGN KEY([atm_types_id])
REFERENCES [dbo].[atm_states] ([id])
GO
ALTER TABLE [dbo].[atms] CHECK CONSTRAINT [FK_atms_atm_states]
GO
ALTER TABLE [dbo].[atms]  WITH CHECK ADD  CONSTRAINT [FK_atms_atm_types] FOREIGN KEY([atm_types_id])
REFERENCES [dbo].[atm_types] ([id])
GO
ALTER TABLE [dbo].[atms] CHECK CONSTRAINT [FK_atms_atm_types]
GO
ALTER TABLE [dbo].[districts]  WITH CHECK ADD  CONSTRAINT [FK_districts_provinces] FOREIGN KEY([provinces_id])
REFERENCES [dbo].[provinces] ([id])
GO
ALTER TABLE [dbo].[districts] CHECK CONSTRAINT [FK_districts_provinces]
GO
ALTER TABLE [dbo].[location_contacts]  WITH CHECK ADD  CONSTRAINT [FK_location_contacts_locations] FOREIGN KEY([locations_id])
REFERENCES [dbo].[locations] ([id])
GO
ALTER TABLE [dbo].[location_contacts] CHECK CONSTRAINT [FK_location_contacts_locations]
GO
ALTER TABLE [dbo].[locations]  WITH CHECK ADD  CONSTRAINT [FK_locations_districts] FOREIGN KEY([districts_id])
REFERENCES [dbo].[districts] ([id])
GO
ALTER TABLE [dbo].[locations] CHECK CONSTRAINT [FK_locations_districts]
GO
ALTER TABLE [dbo].[locations]  WITH CHECK ADD  CONSTRAINT [FK_locations_location_owners] FOREIGN KEY([location_owners_id])
REFERENCES [dbo].[location_owners] ([id])
GO
ALTER TABLE [dbo].[locations] CHECK CONSTRAINT [FK_locations_location_owners]
GO
ALTER TABLE [dbo].[locations]  WITH CHECK ADD  CONSTRAINT [FK_locations_location_types] FOREIGN KEY([location_type_id])
REFERENCES [dbo].[location_types] ([id])
GO
ALTER TABLE [dbo].[locations] CHECK CONSTRAINT [FK_locations_location_types]
GO
ALTER TABLE [dbo].[provinces]  WITH CHECK ADD  CONSTRAINT [FK_provinces_departments] FOREIGN KEY([departments_id])
REFERENCES [dbo].[departments] ([id])
GO
ALTER TABLE [dbo].[provinces] CHECK CONSTRAINT [FK_provinces_departments]
GO
ALTER TABLE [dbo].[requirement_details]  WITH CHECK ADD  CONSTRAINT [FK_requirement_details_requirement_detail_states] FOREIGN KEY([requirement_detial_states_id])
REFERENCES [dbo].[requirement_detail_states] ([id])
GO
ALTER TABLE [dbo].[requirement_details] CHECK CONSTRAINT [FK_requirement_details_requirement_detail_states]
GO
ALTER TABLE [dbo].[requirement_details]  WITH CHECK ADD  CONSTRAINT [FK_requirement_details_requirement_types] FOREIGN KEY([requirement_type_id])
REFERENCES [dbo].[requirement_types] ([id])
GO
ALTER TABLE [dbo].[requirement_details] CHECK CONSTRAINT [FK_requirement_details_requirement_types]
GO
ALTER TABLE [dbo].[requirement_details]  WITH CHECK ADD  CONSTRAINT [FK_requirement_details_requirements] FOREIGN KEY([requirements_id])
REFERENCES [dbo].[requirements] ([id])
GO
ALTER TABLE [dbo].[requirement_details] CHECK CONSTRAINT [FK_requirement_details_requirements]
GO
ALTER TABLE [dbo].[requirements]  WITH CHECK ADD  CONSTRAINT [FK_requirements_locations] FOREIGN KEY([locations_id])
REFERENCES [dbo].[locations] ([id])
GO
ALTER TABLE [dbo].[requirements] CHECK CONSTRAINT [FK_requirements_locations]
GO
ALTER TABLE [dbo].[requirements]  WITH CHECK ADD  CONSTRAINT [FK_requirements_requirement_states] FOREIGN KEY([requirement_states_id])
REFERENCES [dbo].[requirement_states] ([id])
GO
ALTER TABLE [dbo].[requirements] CHECK CONSTRAINT [FK_requirements_requirement_states]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_profiles] FOREIGN KEY([profiles_id])
REFERENCES [dbo].[profiles] ([id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_profiles]
GO
USE [master]
GO
ALTER DATABASE [ATMDB] SET  READ_WRITE 
GO
