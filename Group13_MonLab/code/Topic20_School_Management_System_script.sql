USE [master]
GO
/****** Object:  Database [School_Management]    Script Date: 23/05/2020 18:28:42 ******/
CREATE DATABASE [School_Management]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'School_Management', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\School_Management.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'School_Management_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\School_Management_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [School_Management] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [School_Management].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [School_Management] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [School_Management] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [School_Management] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [School_Management] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [School_Management] SET ARITHABORT OFF 
GO
ALTER DATABASE [School_Management] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [School_Management] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [School_Management] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [School_Management] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [School_Management] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [School_Management] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [School_Management] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [School_Management] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [School_Management] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [School_Management] SET  ENABLE_BROKER 
GO
ALTER DATABASE [School_Management] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [School_Management] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [School_Management] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [School_Management] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [School_Management] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [School_Management] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [School_Management] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [School_Management] SET RECOVERY FULL 
GO
ALTER DATABASE [School_Management] SET  MULTI_USER 
GO
ALTER DATABASE [School_Management] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [School_Management] SET DB_CHAINING OFF 
GO
ALTER DATABASE [School_Management] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [School_Management] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [School_Management] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'School_Management', N'ON'
GO
ALTER DATABASE [School_Management] SET QUERY_STORE = OFF
GO
USE [School_Management]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 23/05/2020 18:28:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[username] [varchar](20) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[admin] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC,
	[password] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Classes]    Script Date: 23/05/2020 18:28:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classes](
	[class_id] [varchar](30) NOT NULL,
	[subject_code] [varchar](30) NULL,
	[room_number] [varchar](10) NULL,
	[weekday] [varchar](10) NULL,
	[time] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[class_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UC_Class] UNIQUE NONCLUSTERED 
(
	[room_number] ASC,
	[weekday] ASC,
	[time] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 23/05/2020 18:28:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[subject_code] [varchar](30) NOT NULL,
	[name_subject] [varchar](50) NOT NULL,
	[credit] [int] NULL,
	[major] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[subject_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 23/05/2020 18:28:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[major] [varchar](5) NOT NULL,
	[Name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[major] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pay]    Script Date: 23/05/2020 18:28:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pay](
	[roll_no] [varchar](20) NOT NULL,
	[tuition_id] [int] NOT NULL,
	[Amount_per_credit] [int] NULL,
	[Amount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[roll_no] ASC,
	[tuition_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UC_roll_no] UNIQUE NONCLUSTERED 
(
	[roll_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UC_tuition_id] UNIQUE NONCLUSTERED 
(
	[tuition_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 23/05/2020 18:28:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[id_staff] [varchar](20) NOT NULL,
	[name_staff] [varchar](50) NULL,
	[gender] [varchar](20) NULL,
	[salary] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_staff] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 23/05/2020 18:28:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[roll_no] [varchar](20) NOT NULL,
	[major] [varchar](5) NULL,
	[name_student] [varchar](50) NULL,
	[gender] [varchar](20) NULL,
	[section] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[roll_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Study]    Script Date: 23/05/2020 18:28:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Study](
	[roll_no] [varchar](20) NOT NULL,
	[class_id] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[roll_no] ASC,
	[class_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teach]    Script Date: 23/05/2020 18:28:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teach](
	[id_staff] [varchar](20) NOT NULL,
	[class_id] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_staff] ASC,
	[class_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UC_class_id] UNIQUE NONCLUSTERED 
(
	[class_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tuition]    Script Date: 23/05/2020 18:28:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tuition](
	[tuition_id] [int] IDENTITY(1,1) NOT NULL,
	[paid_or_unpaid] [int] NULL,
	[deadline_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[tuition_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Classes] ADD  DEFAULT ('undecided') FOR [room_number]
GO
ALTER TABLE [dbo].[Classes] ADD  DEFAULT ('undecided') FOR [weekday]
GO
ALTER TABLE [dbo].[Classes] ADD  DEFAULT ('none') FOR [time]
GO
ALTER TABLE [dbo].[Classes]  WITH CHECK ADD  CONSTRAINT [FK_CourseClasses] FOREIGN KEY([subject_code])
REFERENCES [dbo].[Course] ([subject_code])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Classes] CHECK CONSTRAINT [FK_CourseClasses]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_DepartmentCourse] FOREIGN KEY([major])
REFERENCES [dbo].[Department] ([major])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_DepartmentCourse]
GO
ALTER TABLE [dbo].[Pay]  WITH CHECK ADD  CONSTRAINT [FK_StudentPay] FOREIGN KEY([roll_no])
REFERENCES [dbo].[Student] ([roll_no])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Pay] CHECK CONSTRAINT [FK_StudentPay]
GO
ALTER TABLE [dbo].[Pay]  WITH CHECK ADD  CONSTRAINT [FK_TuitionPay] FOREIGN KEY([tuition_id])
REFERENCES [dbo].[Tuition] ([tuition_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Pay] CHECK CONSTRAINT [FK_TuitionPay]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_DepartmentStudent] FOREIGN KEY([major])
REFERENCES [dbo].[Department] ([major])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_DepartmentStudent]
GO
ALTER TABLE [dbo].[Study]  WITH CHECK ADD  CONSTRAINT [FK_ClassesStudy] FOREIGN KEY([class_id])
REFERENCES [dbo].[Classes] ([class_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Study] CHECK CONSTRAINT [FK_ClassesStudy]
GO
ALTER TABLE [dbo].[Study]  WITH CHECK ADD  CONSTRAINT [FK_StudentStudy] FOREIGN KEY([roll_no])
REFERENCES [dbo].[Student] ([roll_no])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Study] CHECK CONSTRAINT [FK_StudentStudy]
GO
ALTER TABLE [dbo].[Teach]  WITH CHECK ADD  CONSTRAINT [FK_ClassesTeach] FOREIGN KEY([class_id])
REFERENCES [dbo].[Classes] ([class_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Teach] CHECK CONSTRAINT [FK_ClassesTeach]
GO
ALTER TABLE [dbo].[Teach]  WITH CHECK ADD  CONSTRAINT [FK_StaffTeach] FOREIGN KEY([id_staff])
REFERENCES [dbo].[Staff] ([id_staff])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Teach] CHECK CONSTRAINT [FK_StaffTeach]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD CHECK  (([admin]=(1) OR [admin]=(0)))
GO
ALTER TABLE [dbo].[Classes]  WITH CHECK ADD CHECK  (([time]='none' OR [time]='3 p.m' OR [time]='1 p.m' OR [time]='10 a.m' OR [time]='8 a.m'))
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [CHK_gender_staff] CHECK  (([gender]='Female' OR [gender]='Male'))
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [CHK_gender_staff]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [CHK_gender_student] CHECK  (([gender]='Female' OR [gender]='Male'))
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [CHK_gender_student]
GO
ALTER TABLE [dbo].[Tuition]  WITH CHECK ADD CHECK  (([paid_or_unpaid]=(1) OR [paid_or_unpaid]=(0)))
GO
USE [master]
GO
ALTER DATABASE [School_Management] SET  READ_WRITE 
GO
