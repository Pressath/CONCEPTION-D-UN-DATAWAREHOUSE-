
-- Utilisation de la base de données nouvellement créée

CREATE DATABASE DB_GUE
on primary (
	name = DB_GUE_data01,
	filename = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DB_GUE_data01.mdf',
	size = 10MB,
	maxsize = 100MB,
	filegrowth = 0
)
log on (
	name = DB_GUE_log01,
	filename = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DB_GUE_log01.ldf',
	size = 20MB,
	maxsize = 200MB,
	filegrowth = 10%
)
collate French_CS_AS;

-- Création de schémas
--CREATE SCHEMA Dimension;
--CREATE SCHEMA Faits;
GO

-- Création de tables de dimensions
CREATE TABLE Dimension.Utilisateurs (
    utilisateur_id INT PRIMARY KEY,
    nom VARCHAR(50),
	prenom VARCHAR(50),
	date_naissance DATE,
	adresse VARCHAR(50),
	email VARCHAR(20),
	telephone VARCHAR(10),
	genre VARCHAR(15),
	date_inscription DATE
);

CREATE TABLE Dimension.Services (
    service_id INT PRIMARY KEY,
    nom_service VARCHAR(50),
	descriptions VARCHAR(500),
	responsable VARCHAR(50),
	date_creation DATE
);

CREATE TABLE Dimension.SousServices (
    sous_service_id INT PRIMARY KEY,
    nom_sous_service VARCHAR(50),
    service_id INT,
	descriptions_sous_service VARCHAR(500),
	responsable_sous_service VARCHAR(50),
	date_creation_sous_service DATE
);

-- Création de la table de faits
CREATE TABLE Faits.Interactions (
    interaction_id INT PRIMARY KEY,
    utilisateur_id INT,
    service_id INT,
    sous_service_id INT,
    date_interaction DATE,
    -- Autres mesures et attributs
    FOREIGN KEY (utilisateur_id) REFERENCES Dimension.Utilisateurs(utilisateur_id),
    FOREIGN KEY (service_id) REFERENCES Dimension.Services(service_id),
    FOREIGN KEY (sous_service_id) REFERENCES Dimension.SousServices(sous_service_id)
);
