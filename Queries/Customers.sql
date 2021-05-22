IF (EXISTS (SELECT COUNT(1) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Customers'))
DROP TABLE [dbo].[Customers]
GO

CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](500) NOT NULL,
	[Logo] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

INSERT INTO Customers (FullName, [Address], Logo) VALUES ('Josh Freelancer', 'Liberty Plaza, Miami Florida, United State', 'https://logos-download.com/wp-content/uploads/2016/06/Freelancer_logo.png');
INSERT INTO Customers (FullName, [Address], Logo) VALUES ('Biden Domain Wheel', 'Kahuripan II, Cibiru Bandung, West Java', 'https://logos-download.com/wp-content/uploads/2021/01/Domain_Wheel_Logo.png');
INSERT INTO Customers (FullName, [Address], Logo) VALUES ('Jack Zoopla', 'West Parahyangan, Ciparakan Cibubur, Banten', 'https://logos-download.com/wp-content/uploads/2020/07/Zoopla_Logo.png');