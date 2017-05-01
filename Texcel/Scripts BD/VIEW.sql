/*---------------------------------------------------------
	Programmation orient�e objet - Avanc�e
	PROJET - VIEW
	SAMUEL LAROUCHE & NICOLAS BILODEAU
----------------------------------------------------------*/

USE master
GO

---------------------------------------------------

USE TexcelASP_SamNic
PRINT('Utilisation de la BD')
GO

---------------------------------------------------

IF OBJECT_ID('ViewJeu') IS NOT NULL
DROP VIEW ViewJeu;
GO

CREATE VIEW ViewJeu AS
SELECT J.id, J.nom 'nom', description, configMinimal, G.nom 'genre', T.nom 'theme', C.nom 'classification', D.nom 'developpeur', P.nom 'platforme',
CONCAT(J.nom, description, configMinimal, G.nom, T.nom, C.nom, D.nom) 'tag'
FROM Jeu J
JOIN Genre G
  ON G.id = genre
JOIN Theme T
  ON T.id = theme
JOIN Classification C
  ON C.id = classification
JOIN Developpeur D
  ON D.id = developpeur
JOIN Platforme P
  ON P.id = platforme
GO

PRINT('Cr�ation de ViewJeu')
GO

---------------------------------------------------

IF OBJECT_ID('ViewGenre') IS NOT NULL
DROP VIEW ViewGenre;
GO

CREATE VIEW ViewGenre AS
SELECT *
FROM Genre
GO

PRINT('Cr�ation de ViewGenre')
GO

---------------------------------------------------

IF OBJECT_ID('ViewTheme') IS NOT NULL
DROP VIEW ViewTheme;
GO

CREATE VIEW ViewTheme AS
SELECT *
FROM Theme
GO

PRINT('Cr�ation de ViewTheme')
GO

---------------------------------------------------

IF OBJECT_ID('ViewDeveloppeur') IS NOT NULL
DROP VIEW ViewDeveloppeur;
GO

CREATE VIEW ViewDeveloppeur AS
SELECT *
FROM Developpeur
GO

PRINT('Cr�ation de ViewDeveloppeur')
GO

---------------------------------------------------

IF OBJECT_ID('ViewPlatforme') IS NOT NULL
DROP VIEW ViewPlatforme;
GO

CREATE VIEW ViewPlatforme AS
SELECT P.id, P.nom 'nom', configuration, TP.nom 'typePlatforme', SE.nom 'systemeExploitation',
CONCAT(P.nom, configuration, TP.nom, SE.nom) 'tag'
FROM Platforme P
JOIN TypePlatforme TP
  ON TP.id = typePlatforme
JOIN SystemeExploitation SE
  ON SE.code = systemeExploitation
GO

PRINT('Cr�ation de ViewPlatforme')
GO

---------------------------------------------------

IF OBJECT_ID('ViewTypePlatforme') IS NOT NULL
DROP VIEW ViewTypePlatforme;
GO

CREATE VIEW ViewTypePlatforme AS
SELECT *
FROM TypePlatforme
GO

PRINT('Cr�ation de ViewTypePlatforme')
GO

---------------------------------------------------

IF OBJECT_ID('ViewSystemeExploitation') IS NOT NULL
DROP VIEW ViewSystemeExploitation;
GO

CREATE VIEW ViewSystemeExploitation AS
SELECT code, nom, edition, version,
CONCAT(code, nom, edition, version) 'tag'
FROM SystemeExploitation
GO

PRINT('Cr�ation de ViewSystemeExploitation')
GO

---------------------------------------------------

IF OBJECT_ID('ViewEmploye') IS NOT NULL
DROP VIEW ViewEmploye;
GO

CREATE VIEW ViewEmploye AS
SELECT matricule, mdp, E.nom 'nom', prenom, dateNaissance, adresse, telResidentiel, posteTel, CE.nom 'categorieEmploi',
CONCAT(matricule, E.nom, prenom, dateNaissance, adresse, telResidentiel, posteTel, CE.nom) 'tag'
FROM Employe E
JOIN CategorieEmploi CE
  ON CE.id = categorieEmploi
GO

PRINT('Cr�ation de ViewEmploye')
GO