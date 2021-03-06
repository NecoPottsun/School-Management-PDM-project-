USE [master]
GO
/****** Object:  Database [School_Management]    Script Date: 29/04/2020 17:34:20 ******/
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
/****** Object:  Table [dbo].[Classes]    Script Date: 29/04/2020 17:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classes](
	[subject_code] [varchar](30) NOT NULL,
	[name_subject] [varchar](50) NOT NULL,
	[room_number] [varchar](10) NULL,
	[weekday] [varchar](10) NULL,
	[time] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[subject_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UC_Class] UNIQUE NONCLUSTERED 
(
	[room_number] ASC,
	[weekday] ASC,
	[time] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 29/04/2020 17:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[r_id] [varchar](10) NOT NULL,
	[roll_no] [varchar](20) NOT NULL,
	[amount] [int] NULL,
	[paid_or_unpaid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[r_id] ASC,
	[roll_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payroll]    Script Date: 29/04/2020 17:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payroll](
	[r_id] [varchar](10) NOT NULL,
	[id_staff] [varchar](20) NOT NULL,
	[amount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[r_id] ASC,
	[id_staff] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receipt]    Script Date: 29/04/2020 17:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receipt](
	[r_id] [varchar](10) NOT NULL,
	[date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[r_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 29/04/2020 17:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[id_staff] [varchar](20) NOT NULL,
	[name_staff] [varchar](50) NOT NULL,
	[gender] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_staff] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 29/04/2020 17:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[roll_no] [varchar](20) NOT NULL,
	[section] [varchar](20) NULL,
	[name_student] [varchar](50) NOT NULL,
	[gender] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[roll_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Study]    Script Date: 29/04/2020 17:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Study](
	[roll_no] [varchar](20) NOT NULL,
	[subject_code] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[roll_no] ASC,
	[subject_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teach]    Script Date: 29/04/2020 17:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teach](
	[id_staff] [varchar](20) NOT NULL,
	[subject_code] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_staff] ASC,
	[subject_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Classes] ADD  DEFAULT ('undecided') FOR [room_number]
GO
ALTER TABLE [dbo].[Classes] ADD  DEFAULT ('undecided') FOR [weekday]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_ReceiptPayment] FOREIGN KEY([r_id])
REFERENCES [dbo].[Receipt] ([r_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_ReceiptPayment]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_StudentPayment] FOREIGN KEY([roll_no])
REFERENCES [dbo].[Student] ([roll_no])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_StudentPayment]
GO
ALTER TABLE [dbo].[Payroll]  WITH CHECK ADD  CONSTRAINT [FK_ReceiptPayroll] FOREIGN KEY([r_id])
REFERENCES [dbo].[Receipt] ([r_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Payroll] CHECK CONSTRAINT [FK_ReceiptPayroll]
GO
ALTER TABLE [dbo].[Payroll]  WITH CHECK ADD  CONSTRAINT [FK_StaffPayroll] FOREIGN KEY([id_staff])
REFERENCES [dbo].[Staff] ([id_staff])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Payroll] CHECK CONSTRAINT [FK_StaffPayroll]
GO
ALTER TABLE [dbo].[Study]  WITH CHECK ADD  CONSTRAINT [FK_ClassStudy] FOREIGN KEY([subject_code])
REFERENCES [dbo].[Classes] ([subject_code])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Study] CHECK CONSTRAINT [FK_ClassStudy]
GO
ALTER TABLE [dbo].[Study]  WITH CHECK ADD  CONSTRAINT [FK_StudentStudy] FOREIGN KEY([roll_no])
REFERENCES [dbo].[Student] ([roll_no])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Study] CHECK CONSTRAINT [FK_StudentStudy]
GO
ALTER TABLE [dbo].[Teach]  WITH CHECK ADD  CONSTRAINT [FK_ClassTeach] FOREIGN KEY([subject_code])
REFERENCES [dbo].[Classes] ([subject_code])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Teach] CHECK CONSTRAINT [FK_ClassTeach]
GO
ALTER TABLE [dbo].[Teach]  WITH CHECK ADD  CONSTRAINT [FK_StaffTeach] FOREIGN KEY([id_staff])
REFERENCES [dbo].[Staff] ([id_staff])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Teach] CHECK CONSTRAINT [FK_StaffTeach]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD CHECK  (([paid_or_unpaid]=(1) OR [paid_or_unpaid]=(0)))
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [CHK_gender_staff] CHECK  (([gender]='Female' OR [gender]='Male'))
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [CHK_gender_staff]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [CHK_gender_student] CHECK  (([gender]='Female' OR [gender]='Male'))
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [CHK_gender_student]
GO
USE [master]
GO
ALTER DATABASE [School_Management] SET  READ_WRITE 
GO
