IF (EXISTS (SELECT COUNT(1) FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS WHERE CONSTRAINT_NAME = 'FK_SubInvoices_Invoices_InvoiceId'))
ALTER TABLE [dbo].[SubInvoices] DROP CONSTRAINT [FK_SubInvoices_Invoices_InvoiceId]
GO

IF (EXISTS (SELECT COUNT(1) FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS WHERE CONSTRAINT_NAME = 'FK_SubInvoices_Measurements_MeasurementId'))
ALTER TABLE [dbo].[SubInvoices] DROP CONSTRAINT [FK_SubInvoices_Measurements_MeasurementId]
GO

IF (EXISTS (SELECT COUNT(1) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'SubInvoices'))
DROP TABLE [dbo].[SubInvoices]
GO


CREATE TABLE [dbo].[SubInvoices](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceId] [int] NOT NULL,
	[MeasurementId] [int] NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[Rate] [Decimal](24, 8) NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_SubInvoices] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


ALTER TABLE [dbo].[SubInvoices]  WITH CHECK ADD  CONSTRAINT [FK_SubInvoices_Invoices_InvoiceId] FOREIGN KEY([InvoiceId])
REFERENCES [dbo].[Invoices] ([Id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[SubInvoices] CHECK CONSTRAINT [FK_SubInvoices_Invoices_InvoiceId]
GO


ALTER TABLE [dbo].[SubInvoices]  WITH CHECK ADD  CONSTRAINT [FK_SubInvoices_Measurements_MeasurementId] FOREIGN KEY([MeasurementId])
REFERENCES [dbo].[Measurements] ([Id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[SubInvoices] CHECK CONSTRAINT [FK_SubInvoices_Measurements_MeasurementId]
GO
