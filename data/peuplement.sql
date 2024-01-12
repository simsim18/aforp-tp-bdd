-- Populer la table Région
INSERT INTO Région (nom) VALUES
    ('Région A'),
    ('Région B'),
    ('Région C');

-- Populer la table Département
INSERT INTO Département (nom) VALUES
    ('Département 1'),
    ('Département 2'),
    ('Département 3');

-- Populer la table Ville
INSERT INTO Ville (nom, consommation, département_id, région_id)
SELECT
    'Ville ' || i,
    RANDOM() * 1000,
    (i % 3) + 1,  -- département_id
    (i % 3) + 1   -- région_id
FROM generate_series(1, 1000) i;

-- Populer la table Fournisseur
INSERT INTO Fournisseur (nom, consommation, type)
SELECT
    'Fournisseur ' || i,
    RANDOM() * 1000,
    CASE WHEN i % 2 = 0 THEN 'Type A' ELSE 'Type B' END
FROM generate_series(1, 1000) i;

-- Populer la table Personnes
INSERT INTO Personnes (nom, prénom, dateDeNaissance, ville_id)
SELECT
    'Nom' || i,
    'Prénom' || i,
    CURRENT_DATE - (i * 365),
    (i % 1000) + 1  -- ville_id
FROM generate_series(1, 1000) i;

-- Populer la table CentreDeDistribution
INSERT INTO CentreDeDistribution (nom, énergie)
SELECT
    'Centre ' || i,
    CASE WHEN i % 2 = 0 THEN 'Énergie A' ELSE 'Énergie B' END
FROM generate_series(1, 1000) i;

-- Populer la table Consommation
INSERT INTO Consommation (consommation, type, fournisseur_id, ville_id, personne_id)
SELECT
    RANDOM() * 100,
    CASE WHEN i % 2 = 0 THEN 'Type X' ELSE 'Type Y' END,
    (i % 1000) + 1,  -- fournisseur_id
    (i % 1000) + 1,  -- ville_id
    (i % 1000) + 1   -- personne_id
FROM generate_series(1, 1000) i;
