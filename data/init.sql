-- Création de la table Région
CREATE TABLE Région (
  id SERIAL PRIMARY KEY,
  nom VARCHAR(255) NOT NULL
);

-- Création de la table Département
CREATE TABLE Département (
  id SERIAL PRIMARY KEY,
  nom VARCHAR(255) NOT NULL
);

-- Création de la table Ville
CREATE TABLE Ville (
  id SERIAL PRIMARY KEY,
  nom VARCHAR(255) NOT NULL,
  consommation INTEGER,
  département_id INTEGER REFERENCES Département(id) ON DELETE CASCADE,
  région_id INTEGER REFERENCES Région(id) ON DELETE CASCADE
);

-- Création de la table Fournisseur
CREATE TABLE Fournisseur (
  id SERIAL PRIMARY KEY,
  nom VARCHAR(255) NOT NULL,
  consommation INTEGER,
  type VARCHAR(255)
);

-- Création de la table Personnes
CREATE TABLE Personnes (
  id SERIAL PRIMARY KEY,
  nom VARCHAR(255) NOT NULL,
  prénom VARCHAR(255),
  dateDeNaissance DATE,
  ville_id INTEGER REFERENCES Ville(id)
);

-- Création de la table CentreDeDistribution
CREATE TABLE CentreDeDistribution (
  id SERIAL PRIMARY KEY,
  nom VARCHAR(255) NOT NULL,
  énergie VARCHAR(255)
);

-- Création de la table Consommation
CREATE TABLE Consommation (
  id SERIAL PRIMARY KEY,
  consommation INTEGER,
  type VARCHAR(255),
  fournisseur_id INTEGER REFERENCES Fournisseur(id),
  ville_id INTEGER REFERENCES Ville(id),
  personne_id INTEGER REFERENCES Personnes(id)
);
