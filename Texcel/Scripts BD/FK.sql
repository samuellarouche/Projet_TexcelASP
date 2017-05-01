/*---------------------------------------------------------
	Programmation orientée objet - Avancée
	PROJET - FK
	SAMUEL LAROUCHE & NICOLAS BILODEAU
----------------------------------------------------------*/

USE master
GO

---------------------------------------------------

USE TexcelASP_SamNic
PRINT('Utilisation de la BD')
GO

---------------------------------------------------
--Platforme

ALTER TABLE dbo.Platforme ADD CONSTRAINT FK_Platforme_TypePlatforme FOREIGN KEY (typePlatforme) REFERENCES dbo.TypePlatforme(id);
ALTER TABLE dbo.Platforme ADD CONSTRAINT FK_Platforme_SystemeExploitation FOREIGN KEY (systemeExploitation) REFERENCES dbo.SystemeExploitation(code);
PRINT('Création des contraintes sur Platforme')

---------------------------------------------------
--Jeu

ALTER TABLE dbo.Jeu ADD CONSTRAINT FK_Jeu_Genre FOREIGN KEY (genre) REFERENCES dbo.Genre(id);
ALTER TABLE dbo.Jeu ADD CONSTRAINT FK_Jeu_Theme FOREIGN KEY (theme) REFERENCES dbo.Theme(id);
ALTER TABLE dbo.Jeu ADD CONSTRAINT FK_Jeu_Classification FOREIGN KEY (classification) REFERENCES dbo.Classification(id);
ALTER TABLE dbo.Jeu ADD CONSTRAINT FK_Jeu_Developpeur FOREIGN KEY (developpeur) REFERENCES dbo.Developpeur(id);
ALTER TABLE dbo.Jeu ADD CONSTRAINT FK_Jeu_Platforme FOREIGN KEY (platforme) REFERENCES dbo.Platforme(id);
PRINT('Création des contraintes sur Jeu')

---------------------------------------------------
--JeuAssociee

ALTER TABLE dbo.JeuAssociee ADD CONSTRAINT FK_JeuAssociee_Jeu1 FOREIGN KEY (jeu) REFERENCES dbo.Jeu(id);
ALTER TABLE dbo.JeuAssociee ADD CONSTRAINT FK_JeuAssociee_Jeu2 FOREIGN KEY (jeuAssociee) REFERENCES dbo.Jeu(id);
PRINT('Création des contraintes sur JeuAssociee')

---------------------------------------------------
--Employe

ALTER TABLE dbo.Employe ADD CONSTRAINT FK_Employe_CategorieEmploi FOREIGN KEY (categorieEmploi) REFERENCES dbo.CategorieEmploi(id);
PRINT('Création des contraintes sur Employe')