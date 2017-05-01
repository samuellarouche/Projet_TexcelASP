/*---------------------------------------------------------
	Programmation orientée objet - Avancée
	PROJET - CREATE
	SAMUEL LAROUCHE & NICOLAS BILODEAU
----------------------------------------------------------*/

USE master
GO

IF EXISTS(SELECT * FROM sys.databases WHERE name ='TexcelASP_SamNic')
DROP DATABASE TexcelASP_SamNic;
GO

CREATE DATABASE TexcelASP_SamNic
PRINT('Création de la BD')
GO

---------------------------------------------------

USE TexcelASP_SamNic
PRINT('Utilisation de la BD')
GO

---------------------------------------------------

IF OBJECT_ID('Genre') IS NOT NULL
DROP TABLE Genre;
GO

CREATE TABLE Genre
(
	id					int					NOT NULL	IDENTITY(1,1),	
	nom					varchar(30)			NOT NULL,
	tag					varchar(200)		NULL

	CONSTRAINT PK_Genre_id PRIMARY KEY CLUSTERED (id)
) ON [PRIMARY]
PRINT('Création de Genre')
GO

---------------------------------------------------

IF OBJECT_ID('Theme') IS NOT NULL
DROP TABLE Theme;
GO

CREATE TABLE Theme
(
	id					int					NOT NULL	IDENTITY(1,1),	
	nom					varchar(30)			NOT NULL,
	tag					varchar(200)		NULL

	CONSTRAINT PK_Theme_id PRIMARY KEY CLUSTERED (id)
) ON [PRIMARY]
PRINT('Création de Theme')
GO

---------------------------------------------------

IF OBJECT_ID('Classification') IS NOT NULL
DROP TABLE Classification;
GO

CREATE TABLE Classification
(
	id					int					NOT NULL	IDENTITY(1,1),	
	nom					varchar(4)			NOT NULL,
	tag					varchar(200)		NULL

	CONSTRAINT PK_Classification_id PRIMARY KEY CLUSTERED (id)
) ON [PRIMARY]
PRINT('Création de Classification')
GO

---------------------------------------------------

IF OBJECT_ID('Developpeur') IS NOT NULL
DROP TABLE Developpeur;
GO

CREATE TABLE Developpeur
(
	id					int					NOT NULL	IDENTITY(1,1),	
	nom					varchar(30)			NOT NULL,
	tag					varchar(200)		NULL

	CONSTRAINT PK_Developpeur_id PRIMARY KEY CLUSTERED (id)
) ON [PRIMARY]
PRINT('Création de Developpeur')
GO

---------------------------------------------------

IF OBJECT_ID('SystemeExploitation') IS NOT NULL
DROP TABLE SystemeExploitation;
GO

CREATE TABLE SystemeExploitation
(
	code				varchar(11)			NOT NULL,
	nom					varchar(20)			NOT NULL,
	edition				varchar(20)			NULL,
	version				varchar(20)			NOT NULL,
	tag					varchar(200)		NULL

	CONSTRAINT PK_SystemeExploitation_id PRIMARY KEY CLUSTERED (code)
) ON [PRIMARY]
PRINT('Création de SystemeExploitation')
GO

---------------------------------------------------

IF OBJECT_ID('TypePlatforme') IS NOT NULL
DROP TABLE TypePlatforme;
GO

CREATE TABLE TypePlatforme
(
	id					int					NOT NULL	IDENTITY(1,1),	
	
	nom					varchar(20)			NOT NULL,

	CONSTRAINT PK_TypePlatforme_id PRIMARY KEY CLUSTERED (id)
) ON [PRIMARY]
PRINT('Création de TypePlatforme')
GO

---------------------------------------------------

IF OBJECT_ID('Platforme') IS NOT NULL
DROP TABLE Platforme;
GO

CREATE TABLE Platforme
(
	id					int					NOT NULL	IDENTITY(1,1),
	
	nom					varchar(30)			NOT NULL,
	configuration		varchar(200)		NULL,
	tag					varchar(200)		NULL,

	typePlatforme		int					NOT NULL,	--FK
	systemeExploitation	varchar(11)			NOT NULL	--FK

	CONSTRAINT PK_Platforme_id PRIMARY KEY CLUSTERED (id)
) ON [PRIMARY]
PRINT('Création de Platforme')
GO

---------------------------------------------------

IF OBJECT_ID('Jeu') IS NOT NULL
DROP TABLE Jeu;
GO

CREATE TABLE Jeu
(
	id					int					NOT NULL	IDENTITY(1,1),	
	
	nom					varchar(50)			NOT NULL,
	description			varchar(200)		NOT NULL,
	configMinimal		varchar(200)		NULL,
	tag					varchar(400)		NULL,

	genre				int					NOT NULL,	--FK
	theme				int					NOT NULL,	--FK
	classification		int					NOT NULL,	--FK
	developpeur			int					NOT NULL,	--FK
	platforme			int					NOT NULL,	--FK

	CONSTRAINT PK_Jeu_id PRIMARY KEY CLUSTERED (id)
) ON [PRIMARY]
PRINT('Création de Jeu')
GO

---------------------------------------------------

IF OBJECT_ID('JeuAssociee') IS NOT NULL
DROP TABLE JeuAssociee;
GO

CREATE TABLE JeuAssociee
(
	jeu					int					NOT NULL,	--FK
	jeuAssociee			int					NOT NULL,	--FK

	CONSTRAINT PK_JeuAssociee_id PRIMARY KEY CLUSTERED (jeu, jeuAssociee)
) ON [PRIMARY]
PRINT('Création de JeuAssociee')
GO

---------------------------------------------------

IF OBJECT_ID('CategorieEmploi') IS NOT NULL
DROP TABLE CategorieEmploi;
GO

CREATE TABLE CategorieEmploi
(
	id					int					NOT NULL	IDENTITY(1,1),	
	
	nom					varchar(20)			NOT NULL

	CONSTRAINT PK_CategorieEmploi_id PRIMARY KEY CLUSTERED (id)
) ON [PRIMARY]
PRINT('Création de CategorieEmploi')
GO

---------------------------------------------------

IF OBJECT_ID('Employe') IS NOT NULL
DROP TABLE Employe;
GO

CREATE TABLE Employe
(
	matricule			char(8)				NOT NULL,	
	mdp					varchar(30)			NOT NULL,
	nom					varchar(30)			NOT NULL,
	prenom				varchar(30)			NOT NULL,
	dateNaissance		date				NOT NULL,
	adresse				varchar(50)			NOT NULL,
	telResidentiel		char(12)			NOT NULL,
	posteTel			char(3)				NOT NULL,
	tag					varchar(200)		NULL,

	categorieEmploi		int					NOT NULL,	--FK

	CONSTRAINT PK_Employe_id PRIMARY KEY CLUSTERED (matricule)
) ON [PRIMARY]
PRINT('Création de Employe')
GO

---------------------------------------------------

IF OBJECT_ID('Equipe') IS NOT NULL
DROP TABLE Equipe;
GO

CREATE TABLE Equipe
(
	id					int					NOT NULL	IDENTITY(1,1),

	chefEquipe			int					NOT NULL,	--FK

	CONSTRAINT PK_Equipe_id PRIMARY KEY CLUSTERED (id)
) ON [PRIMARY]
PRINT('Création de Equipe')
GO

---------------------------------------------------

IF OBJECT_ID('EquipeEmploye') IS NOT NULL
DROP TABLE EquipeEmploye;
GO

CREATE TABLE EquipeEmploye
(
	equipe				int					NOT NULL,	--FK
	employe				char(8)				NOT NULL,	--FK

	CONSTRAINT PK_EquipeEmploye_id PRIMARY KEY CLUSTERED (equipe, employe)
) ON [PRIMARY]
PRINT('Création de EquipeEmploye')
GO

---------------------------------------------------

CREATE TABLE TypeTest
(
	id					int					NOT NULL	IDENTITY(1,1),	
	
	nom					varchar(20)			NOT NULL

	CONSTRAINT PK_TypeTest_id PRIMARY KEY CLUSTERED (id)
) ON [PRIMARY]
PRINT('Création de TypeTest')
GO

---------------------------------------------------

CREATE TABLE Test
(
	id					int					NOT NULL	IDENTITY(1,1),	
	
	description			varchar(100)		NOT NULL,
	completion			int					NOT NULL,

	CONSTRAINT PK_Test_id PRIMARY KEY CLUSTERED (id)
) ON [PRIMARY]
PRINT('Création de Test')
GO

---------------------------------------------------

CREATE TABLE ProjetTest
(
	id					int					NOT NULL	IDENTITY(1,1),	

	jeu					int					NOT NULL,	--FK

	CONSTRAINT PK_ProjetTest_id PRIMARY KEY CLUSTERED (id)
) ON [PRIMARY]
PRINT('Création de ProjetTest')
GO

