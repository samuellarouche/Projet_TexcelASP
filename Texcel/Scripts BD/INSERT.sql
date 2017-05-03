/*---------------------------------------------------------
	Gestion et exploitation de bases de données
	PROJET - INSERT
	SAMUEL LAROUCHE & NICOLAS BILODEAU
----------------------------------------------------------*/

USE master
GO

---------------------------------------------------

USE TexcelASP_SamNic
PRINT('Utilisation de la BD')
GO

---------------------------------------------------

DELETE FROM Jeu

INSERT INTO Jeu(nom, description, configMinimal, genre, theme, classification, developpeur, platforme) VALUES
('Game of Thumbs','Jeu ketchapp développé en 5 ans (wtf)','Un cell avec une GTX',1,1,1,1,1),
('Call of duty xD','Pew pew','Gameboy',2,2,2,2,1),
('No man sky','Fuck you Sean Murray','Y run pas stro lagé',3,3,3,3,1)

PRINT('Insertion des données dans la table: Jeu')
GO

---------------------------------------------------

DELETE FROM Genre

INSERT INTO Genre(nom) VALUES
('Aventure'),
('Jeu de rôle'),
('FPS')

PRINT('Insertion des données dans la table: Genre')
GO

---------------------------------------------------

DELETE FROM Theme

INSERT INTO Theme(nom) VALUES
('Western'),
('Deuxième guerre mondiale'),
('Nounours')

PRINT('Insertion des données dans la table: Theme')
GO

---------------------------------------------------

DELETE FROM Classification

INSERT INTO Classification(nom) VALUES
('eC'),
('E'),
('E+10'),
('T'),
('M'),
('Ao')

PRINT('Insertion des données dans la table: Classification')
GO

---------------------------------------------------

DELETE FROM Developpeur

INSERT INTO Developpeur(nom) VALUES
('Totema Studio'),
('Ubisoft'),
('Hello games')

PRINT('Insertion des données dans la table: Developpeur')
GO

---------------------------------------------------

DELETE FROM Employe

INSERT INTO Employe(matricule,mdp, nom, prenom, dateNaissance, adresse, telResidentiel, posteTel, categorieEmploi, tag) VALUES
('GACA0101','Password','Gauthier', 'Carl', '2000-01-01', '123 rue actonvale', '444-444-4444', '256', 1, 'GACA0101GauthierCarl2000-01-01123 rue actonvale444-444-4444256Directeur'),
('BINI0319','Password','Bilodeau', 'Nicolas', '1998-03-19', '3370 Rte St-Léonard', '581-235-9234', '993', 2, 'BINI0319BilodeauNicolas1998-03-193370RteSt-Léonard581-235-9234993Administrateur'),
('CHTE0101','Password','Chef', 'Test', '2000-01-01', '1 2 Test', '444-444-4444', '123', 3, 'CHTE0101ChefTest2000-01-011 2 Test444-444-4444123Chef'),
('TETE0101','Password','Testeur', 'Test', '2000-01-01', '1 2 Test', '444-444-4444', '852', 4, 'TETE0101TesteurTest2000-01-0112Test444-444-4444852Testeur'),
('Admin','Admin','Admin', 'Admin', '2000-01-01', '1 2 Test', '444-444-4444', '852', 2, 'AdminAdminAdmin2000-01-0112Test444-444-4444852Administrateur')

PRINT('Insertion des données dans la table: Employe')
GO

---------------------------------------------------

DELETE FROM CategorieEmploi

INSERT INTO CategorieEmploi(nom) VALUES
('Directeur'),
('Administrateur'),
('Chef'),
('Testeur')

PRINT('Insertion des données dans la table: CategorieEmploi')

---------------------------------------------------

DELETE FROM Platforme

INSERT INTO Platforme(nom, configuration, typePlatforme, systemeExploitation, tag) VALUES
('Xbox One','Xbox One Wireless Controller','2', 'WINHOM10', 'XboxOneXboxOneWirelessControllerConsoledejeuWINHOM10')

PRINT('Insertion des données dans la table: Platforme')

--------------------------------------------------

DELETE FROM TypePlatforme

INSERT INTO TypePlatforme(nom) VALUES
('Ordinateur'),
('Console de jeu'),
('Téléphone cellulaire'),
('Tablette')

PRINT('Insertion des données dans la table: TypePlatforme')

---------------------------------------------------

DELETE FROM SystemeExploitation

INSERT INTO SystemeExploitation(code, nom, edition, version, tag) VALUES
('WINHOM10', 'Windows 10', 'Home', '10.0.10158', 'WINHOM10Windows10Home10.0.10158'),
('IOS10', 'iOS 10', NULL, '10.2.1', 'IOS10iOS1010.2.1')

PRINT('Insertion des données dans la table: SystemeExploitation')