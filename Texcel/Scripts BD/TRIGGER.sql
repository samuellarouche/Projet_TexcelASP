/*---------------------------------------------------------
	Programmation orientée objet - Avancée
	PROJET - TRIGGER
	SAMUEL LAROUCHE & NICOLAS BILODEAU
----------------------------------------------------------*/

USE master
GO

---------------------------------------------------

USE TexcelASP_SamNic
PRINT('Utilisation de la BD')
GO

---------------------------------------------------

IF OBJECT_ID('TriggerJeu') IS NOT NULL
DROP TRIGGER TriggerJeu;
GO

CREATE TRIGGER TriggerJeu ON ViewJeu INSTEAD OF INSERT, UPDATE, DELETE AS
BEGIN
	DECLARE @genre varchar(30), @theme varchar(30), @classification varchar(30), @developpeur varchar(30), @platforme varchar(30),
	@genreId int, @themeId int, @classificationId int, @developpeurId int, @platformeId int

	SELECT @genreId = id
	FROM Genre WHERE nom = (SELECT genre FROM inserted);
	SELECT @themeId = id
	FROM Theme WHERE nom = (SELECT theme FROM inserted);
	SELECT @classificationId = id
	FROM Classification WHERE nom = (SELECT classification FROM inserted);
	SELECT @developpeurId = id
	FROM Developpeur WHERE nom = (SELECT developpeur FROM inserted);
	SELECT @platformeId = id
	FROM Platforme WHERE nom = (SELECT platforme FROM inserted);

	IF (EXISTS(SELECT * FROM inserted) AND EXISTS(SELECT * FROM deleted))
	BEGIN
		UPDATE Jeu
		SET nom = I.nom, description = I.description, configMinimal = I.configMinimal,
		genre = @genreId, theme = @themeId, classification = @classificationId, developpeur = @developpeurId, platforme = @platformeId
		FROM inserted I
		JOIN Jeu on I.id = Jeu.id
	END
	ELSE IF (EXISTS(SELECT * FROM inserted))
	BEGIN
		INSERT INTO Jeu
		SELECT nom, description, configMinimal, @genreId, @themeId, @classificationId, @developpeurId, @platformeId
		FROM inserted
	END
	ELSE IF (EXISTS(SELECT * FROM deleted))
	BEGIN
		DELETE FROM Jeu
		WHERE id = (SELECT id FROM deleted)
	END
END;
GO

---------------------------------------------------

IF OBJECT_ID('TriggerEmploye') IS NOT NULL
DROP TRIGGER TriggerEmploye;
GO

CREATE TRIGGER TriggerEmploye ON ViewEmploye INSTEAD OF INSERT, UPDATE, DELETE AS
BEGIN
	DECLARE @categorieEmploi varchar(20),
	@categorieEmploiId int

	SELECT @categorieEmploiId = id
	FROM CategorieEmploi WHERE nom = (SELECT categorieEmploi FROM inserted);

	IF (EXISTS(SELECT * FROM inserted) AND EXISTS(SELECT * FROM deleted))
	BEGIN
		UPDATE Employe
		SET mdp = I.mdp, nom = I.nom, prenom = I.prenom, dateNaissance = I.dateNaissance, adresse = I.adresse, telResidentiel = I.telResidentiel, posteTel = I.posteTel,
		categorieEmploi = @categorieEmploiId
		FROM inserted I
		JOIN Employe on I.matricule = Employe.matricule
	END
	ELSE IF (EXISTS(SELECT * FROM inserted))
	BEGIN
		DECLARE @matricule char(8), @nom varchar(30), @prenom varchar(30), @date datetime

		SELECT @nom = nom, @prenom = prenom, @date = dateNaissance
		FROM inserted

		SET @matricule = UPPER(CONCAT(SUBSTRING(@nom,1,2),
		SUBSTRING(@prenom,1,2),
		RIGHT('00' + CONVERT(NVARCHAR(2), DATEPART(MONTH, @date)), 2),
		RIGHT('00' + CONVERT(NVARCHAR(2), DATEPART(DAY, @date)), 2)))

		INSERT INTO Employe
		SELECT matricule = @matricule, mdp, nom, prenom, dateNaissance, adresse, telResidentiel, posteTel, categorieEmploi = @categorieEmploiId
		FROM inserted
	END
END;
GO

---------------------------------------------------

IF OBJECT_ID('TriggerPlatforme') IS NOT NULL
DROP TRIGGER TriggerPlatforme;
GO

CREATE TRIGGER TriggerPlatforme ON ViewPlatforme INSTEAD OF INSERT, UPDATE, DELETE AS
BEGIN
	DECLARE @typePlatforme varchar(20), @systemeExploitation varchar(15),
	@typePlatformeId int, @systemeExploitationCode varchar(11)

	SELECT @typePlatforme = typePlatforme, @systemeExploitation = systemeExploitation
	FROM inserted

	SELECT @typePlatformeId = id
	FROM TypePlatforme WHERE nom = (SELECT typePlatforme FROM inserted)
	SELECT @systemeExploitationCode = code
	FROM SystemeExploitation WHERE nom = (SELECT systemeExploitation FROM inserted)

	IF (EXISTS(SELECT * FROM inserted) AND EXISTS(SELECT * FROM deleted))
	BEGIN
		UPDATE Platforme
		SET nom = I.nom, configuration = I.configuration,
		typePlatforme = @typePlatformeId, systemeExploitation = @systemeExploitationCode
		FROM inserted I
		JOIN Platforme on I.id = Platforme.id
	END
	ELSE IF (EXISTS(SELECT * FROM inserted))
	BEGIN
		INSERT INTO Platforme
		SELECT nom, configuration, typePlatforme = @typePlatformeId, systemeExploitation = @systemeExploitationCode
		FROM inserted
	END
	ELSE IF (EXISTS(SELECT * FROM deleted))
	BEGIN
		DELETE FROM Platforme
		WHERE id = (SELECT id FROM deleted)
	END
END;
GO

---------------------------------------------------

IF OBJECT_ID('TriggerSystemeExploitation') IS NOT NULL
DROP TRIGGER TriggerSystemeExploitation;
GO

CREATE TRIGGER TriggerSystemeExploitation ON ViewSystemeExploitation INSTEAD OF INSERT, DELETE AS
BEGIN
	IF (EXISTS(SELECT * FROM inserted))
	BEGIN
		DECLARE @code varchar(11), @nom varchar(15), @edition varchar(15), @version char(5)

		SELECT @nom = nom, @edition = edition, @version = version
		FROM inserted

		SET @code = UPPER(CONCAT(SUBSTRING(@nom,1,3),
		SUBSTRING(@edition,1,3),
		@version))

		INSERT INTO SystemeExploitation
		SELECT code = @code, nom, edition, version
		FROM inserted
	END
	ELSE IF (EXISTS(SELECT * FROM deleted))
	BEGIN
		DELETE FROM SystemeExploitation
		WHERE code = (SELECT code FROM deleted)
	END
END;
GO