IF (EXISTS (SELECT COUNT(1) FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS WHERE CONSTRAINT_NAME = 'FK_Invoices_Languages_LanguageId'))
ALTER TABLE [dbo].[Invoices] DROP CONSTRAINT [FK_Invoices_Languages_LanguageId]
GO

IF (EXISTS (SELECT COUNT(1) FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS WHERE CONSTRAINT_NAME = 'FK_Invoices_Currencies_CurrencyId'))
ALTER TABLE [dbo].[Invoices] DROP CONSTRAINT [FK_Invoices_Currencies_CurrencyId]
GO

IF (EXISTS (SELECT COUNT(1) FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS WHERE CONSTRAINT_NAME = 'FK_Invoices_PurchaseOrders_PurchaseOrderId'))
ALTER TABLE [dbo].[Invoices] DROP CONSTRAINT [FK_Invoices_PurchaseOrders_PurchaseOrderId]
GO

IF (EXISTS (SELECT COUNT(1) FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS WHERE CONSTRAINT_NAME = 'FK_Invoices_Customers_CustomerId'))
ALTER TABLE [dbo].[Invoices] DROP CONSTRAINT [FK_Invoices_Customers_CustomerId]
GO

IF (EXISTS (SELECT COUNT(1) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Invoices'))
DROP TABLE [dbo].[Invoices]
GO

CREATE TABLE [dbo].[Invoices](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LanguageId] [int] NOT NULL,
	[CurrencyId] [int] NOT NULL,
	[PurchaseOrderId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Code] [nvarchar](100) NOT NULL,
	[InvoiceBy] [nvarchar](250) NOT NULL,
	[InvoiceDate] Datetime NOT NULL,
	[IsImmediately] bit NOT NULL,
	[Discount] [int] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Invoices] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Invoices_Languages_LanguageId] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Languages] ([Id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_Invoices_Languages_LanguageId]
GO


ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Invoices_Currencies_CurrencyId] FOREIGN KEY([CurrencyId])
REFERENCES [dbo].[Currencies] ([Id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_Invoices_Currencies_CurrencyId]
GO

ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Invoices_PurchaseOrders_PurchaseOrderId] FOREIGN KEY([PurchaseOrderId])
REFERENCES [dbo].[PurchaseOrders] ([Id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_Invoices_PurchaseOrders_PurchaseOrderId]
GO

ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Invoices_Customers_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_Invoices_Customers_CustomerId]
GO


insert into Invoices([LanguageId],[CurrencyId],[PurchaseOrderId],[CustomerId],[Code],[InvoiceBy],[InvoiceDate],[IsImmediately],[Discount],[Status])
values(1,1,1,1,'INV-694','Example, Inc. West London, United Kingdom',GETDATE(),1,10,0)