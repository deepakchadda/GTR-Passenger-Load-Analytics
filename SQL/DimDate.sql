CREATE TABLE [WH_GTR].[dbo].[DimDate]
(
	[DateKey] [int] NULL,
	[FullDate] [date] NULL,
	[CalendarYear] [int] NULL,
	[CalendarMonth] [int] NULL,
	[MonthName] [varchar](20) NULL,
	[QuarterNumber] [int] NULL,
	[DayOfMonth] [int] NULL,
	[DayOfWeekName] [varchar](20) NULL,
	[RailPeriod] [varchar](10) NULL
)
GO