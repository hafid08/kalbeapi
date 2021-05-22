
IF (EXISTS (SELECT COUNT(1) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Currencies'))
DROP TABLE Currencies;
GO

CREATE TABLE [dbo].[Currencies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Country] [nvarchar](100) NOT NULL,
	[Code] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](100) NOT NULL,
	[Symbol] [nvarchar](100) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Currencies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Insert value records
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Albania', 'Leke', 'ALL', 'Lek','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('America', 'Dollars', 'USD', '$','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Afghanistan', 'Afghanis', 'AFN', '؋','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Argentina', 'Pesos', 'ARS', '$','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Aruba', 'Guilders', 'AWG', 'ƒ','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Australia', 'Dollars', 'AUD', '$','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Azerbaijan', 'New Manats', 'AZN', 'ман','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Bahamas', 'Dollars', 'BSD', '$','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Barbados', 'Dollars', 'BBD', '$','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Belarus', 'Rubles', 'BYR', 'p.','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Belgium', 'Euro', 'EUR', '€','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Beliz', 'Dollars', 'BZD', 'BZ$','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Bermuda', 'Dollars', 'BMD', '$','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Bolivia', 'Bolivianos', 'BOB', '$b','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Bosnia and Herzegovina', 'Convertible Marka', 'BAM', 'KM','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Botswana', 'Pula', 'BWP', 'P','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Bulgaria', 'Leva', 'BGN', 'лв','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Brazil', 'Reais', 'BRL', 'R$','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Britain (United Kingdom)', 'Pounds', 'GBP', '£','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Brunei Darussalam', 'Dollars', 'BND', '$','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Cambodia', 'Riels', 'KHR', '៛','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Canada', 'Dollars', 'CAD', '$','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Cayman Islands', 'Dollars', 'KYD', '$','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Chile', 'Pesos', 'CLP', '$','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('China', 'Yuan Renminbi', 'CNY', '¥','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Colombia', 'Pesos', 'COP', '$','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Costa Rica', 'Colón', 'CRC', '₡','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Croatia', 'Kuna', 'HRK', 'kn','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Cuba', 'Pesos', 'CUP', '₱','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Cyprus', 'Euro', 'EUR', '€','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Czech Republic', 'Koruny', 'CZK', 'Kč','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Denmark', 'Kroner', 'DKK', 'kr','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Dominican Republic', 'Pesos', 'DOP ', 'RD$','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('East Caribbean', 'Dollars', 'XCD', '$','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Egypt', 'Pounds', 'EGP', '£','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('El Salvador', 'Colones', 'SVC', '$','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('England (United Kingdom)', 'Pounds', 'GBP', '£','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Euro', 'Euro', 'EUR', '€','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Falkland Islands', 'Pounds', 'FKP', '£','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Fiji', 'Dollars', 'FJD', '$','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('France', 'Euro', 'EUR', '€','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Ghana', 'Cedis', 'GHC', '¢','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Gibraltar', 'Pounds', 'GIP', '£','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Greece', 'Euro', 'EUR', '€','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Guatemala', 'Quetzales', 'GTQ', 'Q','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Guernsey', 'Pounds', 'GGP', '£','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Guyana', 'Dollars', 'GYD', '$','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Holland (Netherlands)', 'Euro', 'EUR', '€','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Honduras', 'Lempiras', 'HNL', 'L','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Hong Kong', 'Dollars', 'HKD', '$','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Hungary', 'Forint', 'HUF', 'Ft','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Iceland', 'Kronur', 'ISK', 'kr','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('India', 'Rupees', 'INR', 'Rp','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Indonesia', 'Rupiahs', 'IDR', 'Rp','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Iran', 'Rials', 'IRR', '﷼','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Ireland', 'Euro', 'EUR', '€','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Isle of Man', 'Pounds', 'IMP', '£','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Israel', 'New Shekels', 'ILS', '₪','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Italy', 'Euro', 'EUR', '€','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Jamaica', 'Dollars', 'JMD', 'J$','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Japan', 'Yen', 'JPY', '¥','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Jersey', 'Pounds', 'JEP', '£','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Kazakhstan', 'Tenge', 'KZT', 'лв','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Korea (North)', 'Won', 'KPW', '₩','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Korea (South)', 'Won', 'KRW', '₩','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Kyrgyzstan', 'Soms', 'KGS', 'лв','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Laos', 'Kips', 'LAK', '₭','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Latvia', 'Lati', 'LVL', 'Ls','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Lebanon', 'Pounds', 'LBP', '£','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Liberia', 'Dollars', 'LRD', '$','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Liechtenstein', 'Switzerland Francs', 'CHF', 'CHF','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Lithuania', 'Litai', 'LTL', 'Lt','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Luxembourg', 'Euro', 'EUR', '€','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Macedonia', 'Denars', 'MKD', 'ден','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Malaysia', 'Ringgits', 'MYR', 'RM','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Malta', 'Euro', 'EUR', '€','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Mauritius', 'Rupees', 'MUR', '₨','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Mexico', 'Pesos', 'MXN', '$','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Mongolia', 'Tugriks', 'MNT', '₮','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Mozambique', 'Meticais', 'MZN', 'MT','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Namibia', 'Dollars', 'NAD', '$','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Nepal', 'Rupees', 'NPR', '₨','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Netherlands Antilles', 'Guilders', 'ANG', 'ƒ','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Netherlands', 'Euro', 'EUR', '€','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('New Zealand', 'Dollars', 'NZD', '$','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Nicaragua', 'Cordobas', 'NIO', 'C$','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Nigeria', 'Nairas', 'NGN', '₦','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('North Korea', 'Won', 'KPW', '₩','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Norway', 'Krone', 'NOK', 'kr','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Oman', 'Rials', 'OMR', '﷼','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Pakistan', 'Rupees', 'PKR', '₨','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Panama', 'Balboa', 'PAB', 'B/.','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Paraguay', 'Guarani', 'PYG', 'Gs','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Peru', 'Nuevos Soles', 'PEN', 'S/.','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Philippines', 'Pesos', 'PHP', 'Php','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Poland', 'Zlotych', 'PLN', 'zł','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Qatar', 'Rials', 'QAR', '﷼','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Romania', 'New Lei', 'RON', 'lei','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Russia', 'Rubles', 'RUB', 'руб','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Saint Helena', 'Pounds', 'SHP', '£','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Saudi Arabia', 'Riyals', 'SAR', '﷼','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Serbia', 'Dinars', 'RSD', 'Дин.','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Seychelles', 'Rupees', 'SCR', '₨','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Singapore', 'Dollars', 'SGD', '$','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Slovenia', 'Euro', 'EUR', '€','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Solomon Islands', 'Dollars', 'SBD', '$','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Somalia', 'Shillings', 'SOS', 'S','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('South Africa', 'Rand', 'ZAR', 'R','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('South Korea', 'Won', 'KRW', '₩','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Spain', 'Euro', 'EUR', '€','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Sri Lanka', 'Rupees', 'LKR', '₨','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Sweden', 'Kronor', 'SEK', 'kr','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Switzerland', 'Francs', 'CHF', 'CHF','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Suriname', 'Dollars', 'SRD', '$','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Syria', 'Pounds', 'SYP', '£','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Taiwan', 'New Dollars', 'TWD', 'NT$','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Thailand', 'Baht', 'THB', '฿','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Trinidad and Tobago', 'Dollars', 'TTD', 'TT$','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Turkey', 'Lira', 'TRY', 'TL','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Turkey', 'Liras', 'TRL', '£','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Tuvalu', 'Dollars', 'TVD', '$','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Ukraine', 'Hryvnia', 'UAH', '₴','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('United Kingdom', 'Pounds', 'GBP', '£','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('United States of America', 'Dollars', 'USD', '$','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Uruguay', 'Pesos', 'UYU', '$U','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Uzbekistan', 'Sums', 'UZS', 'лв','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Vatican City', 'Euro', 'EUR', '€','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Venezuela', 'Bolivares Fuertes', 'VEF', 'Bs','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Vietnam', 'Dong', 'VND', '₫','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Yemen', 'Rials', 'YER', '﷼','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('Zimbabwe', 'Zimbabwe Dollars', 'ZWD', 'Z$','0');
INSERT INTO Currencies (country, value, code, symbol, [status]) VALUES ('India', 'Rupees', 'INR', '₹','0');