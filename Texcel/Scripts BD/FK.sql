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

/*ALTER TABLE dbo.Platforme DROP FK_Platforme_TypePlatforme
ALTER TABLE dbo.Platforme DROP FK_Platforme_SystemeExploitation*/

ALTER TABLE dbo.Platforme ADD CONSTRAINT FK_Platforme_TypePlatforme FOREIGN KEY (typePlatforme) REFERENCES dbo.TypePlatforme(id) ON DELETE CASCADE;
ALTER TABLE dbo.Platforme ADD CONSTRAINT FK_Platforme_SystemeExploitation FOREIGN KEY (systemeExploitation) REFERENCES dbo.SystemeExploitation(code) ON DELETE CASCADE;
PRINT('Création des contraintes sur Platforme')

---------------------------------------------------
--Jeu

/*ALTER TABLE dbo.Jeu DROP FK_Jeu_Genre
ALTER TABLE dbo.Jeu DROP FK_Jeu_Theme
ALTER TABLE dbo.Jeu DROP FK_Jeu_Classification
ALTER TABLE dbo.Jeu DROP FK_Jeu_Developpeur
ALTER TABLE dbo.Jeu DROP FK_Jeu_Platforme*/

ALTER TABLE dbo.Jeu ADD CONSTRAINT FK_Jeu_Genre FOREIGN KEY (genre) REFERENCES dbo.Genre(id) ON DELETE CASCADE;
ALTER TABLE dbo.Jeu ADD CONSTRAINT FK_Jeu_Theme FOREIGN KEY (theme) REFERENCES dbo.Theme(id) ON DELETE CASCADE;
ALTER TABLE dbo.Jeu ADD CONSTRAINT FK_Jeu_Classification FOREIGN KEY (classification) REFERENCES dbo.Classification(id) ON DELETE CASCADE;
ALTER TABLE dbo.Jeu ADD CONSTRAINT FK_Jeu_Developpeur FOREIGN KEY (developpeur) REFERENCES dbo.Developpeur(id) ON DELETE CASCADE;
ALTER TABLE dbo.Jeu ADD CONSTRAINT FK_Jeu_Platforme FOREIGN KEY (platforme) REFERENCES dbo.Platforme(id) ON DELETE CASCADE;
PRINT('Création des contraintes sur Jeu')

---------------------------------------------------
--JeuAssociee

ALTER TABLE dbo.JeuAssociee ADD CONSTRAINT FK_JeuAssociee_Jeu1 FOREIGN KEY (jeu) REFERENCES dbo.Jeu(id);
ALTER TABLE dbo.JeuAssociee ADD CONSTRAINT FK_JeuAssociee_Jeu2 FOREIGN KEY (jeuAssociee) REFERENCES dbo.Jeu(id);
PRINT('Création des contraintes sur JeuAssociee')

---------------------------------------------------
--Employe

ALTER TABLE dbo.Employe ADD CONSTRAINT FK_Employe_CategorieEmploi FOREIGN KEY (categorieEmploi) REFERENCES dbo.CategorieEmploi(id);
;
PRINT('Création des contraintes sur Employe')