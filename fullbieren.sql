use master
GO

CREATE DATABASE Bieren
GO

use bieren
GO

CREATE TABLE dbo.Producten (
	[ProductNr] [int] NOT NULL constraint pk_producten primary key,
	[Naam] [nvarchar] (100) NULL ,
	[LeverancierNr] [int] NULL ,
	[CategorieNr] [int] NULL ,
	[Beschrijving] [real] NULL 
) ON [PRIMARY]
GO

CREATE TABLE dbo.Leveranciers (
	[LeverancierNr] [int] NOT NULL constraint pk_leveranciers primary key,
	[LeverancierNaam] [nvarchar] (50) NULL ,
	[Adres] [nvarchar] (50) NULL ,
	[PostCode] [int] NULL ,
	[Gemeente] [nvarchar] (50) NULL ,
	[Omzet] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE dbo.Categorie (
	[CategorieNr] [int] NOT NULL constraint pk_categorie primary key,
	[Catergorie] [nvarchar] (50) NULL 
) ON [PRIMARY]
GO

bulk insert Producten from 'C:\Intec\Data\bieren.txt'
with (fieldterminator=';', ROWTERMINATOR = '\n')
GO

bulk insert Leveranciers from 'C:\Intec\Data\brouwers.txt'
with (fieldterminator=';', ROWTERMINATOR = '\n')
GO

bulk insert Categorie from 'C:\Intec\Data\soorten.txt'
with (fieldterminator=';', ROWTERMINATOR = '\n')
GO
