-- Table des Robots
CREATE TABLE Robots (
    robot_id INT PRIMARY KEY,
    modele VARCHAR(50),
    nom VARCHAR(50),
    etat VARCHAR(20)
);

-- Table des Humains
CREATE TABLE Humains (
    humain_id INT PRIMARY KEY,
    nom VARCHAR(50),
    poste VARCHAR(50),
    anciennete INT
);

-- Table des Actions
CREATE TABLE Actions (
    action_id INT PRIMARY KEY,
    type_action VARCHAR(100),
    date_debut DATETIME,
    date_fin DATETIME
);

-- Table de jonction pour la relation many-to-many entre Actions, Robots et Humains
CREATE TABLE Participants_Action (
    action_id INT,
    robot_id INT,
    humain_id INT,
    FOREIGN KEY (action_id) REFERENCES Actions(action_id),
    FOREIGN KEY (robot_id) REFERENCES Robots(robot_id),
    FOREIGN KEY (humain_id) REFERENCES Humains(humain_id),
    PRIMARY KEY (action_id, robot_id, humain_id)
);

-- Table des Rapports d'incidence
CREATE TABLE Rapports_Incidence (
    rapport_id INT PRIMARY KEY,
    type_loi_violee VARCHAR(50),
    description TEXT,
    action_id INT,
    FOREIGN KEY (action_id) REFERENCES Actions(action_id)
);

-- Création des rôles
CREATE USER administrateur;
CREATE USER analyste;
CREATE USER technicien;
CREATE USER superviseur_ethique;

-- Attribution des droits pour l'administrateur
GRANT ALL PRIVILEGES ON robotique TO administrateur;

-- Attribution des droits pour l'analyste
GRANT SELECT ON vues_analytiques TO analyste;

-- Attribution des droits pour le technicien
GRANT SELECT, UPDATE (etat) ON Robots TO technicien;

-- Attribution des droits pour le superviseur éthique
GRANT SELECT ON Actions TO superviseur_ethique;
GRANT SELECT ON Rapports_Incidence TO superviseur_ethique;