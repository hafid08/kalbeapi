IF (EXISTS (SELECT COUNT(1) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Measurements'))
DROP TABLE Measurements
GO

CREATE TABLE [dbo].[Measurements](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Unit] [nvarchar](100) NOT NULL,
	[Symbol] [nvarchar](5) NOT NULL,
 CONSTRAINT [PK_Measurements] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

INSERT INTO Measurements (Unit, Symbol) VALUES ('Hour', 'hr');
INSERT INTO Measurements (Unit, Symbol) VALUES ('Minut', 'mn');
INSERT INTO Measurements (Unit, Symbol) VALUES ('Second', 'sc');
INSERT INTO Measurements (Unit, Symbol) VALUES ('Litre', 'l');
INSERT INTO Measurements (Unit, Symbol) VALUES ('Kilogram', 'kg');
INSERT INTO Measurements (Unit, Symbol) VALUES ('Mile', 'ml');

