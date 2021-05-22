IF (EXISTS (SELECT COUNT(1) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'PurchaseOrders'))
DROP TABLE PurchaseOrders
GO

CREATE TABLE [dbo].[PurchaseOrders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](100) NOT NULL,
	[Amount] [Decimal](24, 8) NOT NULL,
	[PIC] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_PurchaseOrders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

INSERT INTO PurchaseOrders (Code, Amount, PIC) VALUES ('FL-123', '10.000', 'Amir');
INSERT INTO PurchaseOrders (Code, Amount, PIC) VALUES ('FL-124', '12.000', 'Faizal');
INSERT INTO PurchaseOrders (Code, Amount, PIC) VALUES ('FL-125', '12.050', 'Ahmad');