IF (EXISTS (SELECT COUNT(1) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'ExchangeRates'))
DROP TABLE ExchangeRates
GO

CREATE TABLE [dbo].[ExchangeRates](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [DateTime] NOT NULL,
	[EndDate] [DateTime] NOT NULL,
	[FromCurr] [nvarchar](100) NOT NULL,
	[ToCurr] [nvarchar](100) NOT NULL,
	[Rate] [Decimal](24, 8) NOT NULL,
 CONSTRAINT [PK_ExchangeRates] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

INSERT INTO ExchangeRates (StartDate, EndDate, FromCurr, ToCurr, Rate) VALUES ('2021-05-01 00:00:00', '2021-05-31 23:59:00', 'USD', 'IDR', '14389.85');
INSERT INTO ExchangeRates (StartDate, EndDate, FromCurr, ToCurr, Rate) VALUES ('2021-05-01 00:00:00', '2021-05-31 23:59:00', 'IDR', 'USD', '0.000069');