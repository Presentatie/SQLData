CREATE DATABASE planten
GO

use planten
go

CREATE TABLE [dbo].[PLSCHEMA] (
	[CATEGORIE] [nvarchar] (10) NOT NULL constraint pk_categorie PRIMARY KEY,
	[HOOGTE1] [FLOAT] NULL ,
	[HOOGTE2] [FLOAT] NULL ,
	[afstand] [float] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[BESTEL] (
	[BESTELNR] [nvarchar] (4) NOT NULL  constraint pk_bestelnr PRIMARY KEY,
	[LEV_CODE] [nvarchar] (3) NULL ,
	[B_DATUM] [smalldatetime] NULL ,
	[L_DATUM] [smalldatetime] NULL ,
	[BEDRAG] [float] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[BESTREG] (
	[BESTELNR] [nvarchar] (4) NOT NULL ,
	[ART_LEV] [nvarchar] (5) NOT NULL ,
	[AANTAL] [float] NULL ,
	[BEST_PR] [float] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[LEVERAN] (
	[LEV_CODE] [nvarchar] (3) NOT NULL  constraint pk_lev_code PRIMARY KEY,
	[LEV_NAAM] [nvarchar] (20) NULL ,
	[ADRES] [nvarchar] (25) NULL ,
	[WOONPL] [nvarchar] (15) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[OFFERTES] (
	[LEV_CODE] [nvarchar] (3) NOT NULL ,
	[ART_LEV] [nvarchar] (5) NOT NULL ,
	[ART_CODE] [nvarchar] (3) NOT NULL ,
	[LEV_TIJD] [float] NULL ,
	[OFF_PRIJS] [float] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PLANTEN] (
	[ART_CODE] [nvarchar] (3) NOT NULL  constraint pk_art_code PRIMARY KEY,
	[PLANTENNM] [nvarchar] (16) NULL ,
	[SOORT] [nvarchar] (7) NULL ,
	[KLEUR] [nvarchar] (7) NULL ,
	[HOOGTE] [float] NULL ,
	[BL_B] [float] NULL ,
	[BL_E] [float] NULL ,
	[PRIJS] [float] NULL 
) ON [PRIMARY]
GO

bulk insert bestel from 'C:\Intec\Data\bestel.txt'
with (fieldterminator=';', ROWTERMINATOR = '\n')
GO

bulk insert bestreg from 'C:\Intec\Data\bestreg.txt'
with (codepage='ACP',fieldterminator=';', ROWTERMINATOR = '\n')
GO

bulk insert leveran from 'C:\Intec\Data\leveran.txt'
with (fieldterminator=';', ROWTERMINATOR = '\n')
GO

bulk insert offertes from 'C:\Intec\Data\offertes.txt'
with (fieldterminator=';', ROWTERMINATOR = '\n')
GO

bulk insert planten from 'C:\Intec\Data\planten.txt'
with (fieldterminator=';', ROWTERMINATOR = '\n')
GO

bulk insert plschema from 'C:\Intec\Data\plschema.txt'
with (fieldterminator=';', ROWTERMINATOR = '\n')
GO
