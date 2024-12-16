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

-- Insertion de données dans la table Robots
INSERT INTO Robots (robot_id, modele, nom, etat) VALUES
(1, 'Model-X', 'Robot1', 'actif'),
(2, 'Model-Y', 'Robot2', 'en réparation'),
(3, 'Model-Z', 'Robot3', 'décommissionné'),
(4, 'Model-A', 'Robot4', 'actif'),
(5, 'Model-B', 'Robot5', 'en maintenance'),
(6, 'Model-C', 'Robot6', 'actif'),
(7, 'Model-D', 'Robot7', 'en maintenance'),
(8, 'Model-E', 'Robot8', 'actif'),
(9, 'Model-F', 'Robot9', 'décommissionné'),
(10, 'Model-G', 'Robot10', 'actif'),
(11, 'Model-H', 'Robot11', 'actif'),
(12, 'Model-I', 'Robot12', 'en maintenance'),
(13, 'Model-J', 'Robot13', 'actif'),
(14, 'Model-K', 'Robot14', 'décommissionné'),
(15, 'Model-L', 'Robot15', 'actif'),
(16, 'Model-M', 'Robot16', 'en réparation'),
(17, 'Model-N', 'Robot17', 'actif'),
(18, 'Model-O', 'Robot18', 'en maintenance'),
(19, 'Model-P', 'Robot19', 'actif'),
(20, 'Model-Q', 'Robot20', 'décommissionné');

-- Insertion de données dans la table Humains
INSERT INTO Humains (humain_id, nom, poste, anciennete) VALUES
(1, 'Alice', 'Ingénieur', 5),
(2, 'Bob', 'Technicien', 3),
(3, 'Charlie', 'Superviseur', 7),
(4, 'Diana', 'Analyste', 4),
(5, 'Ethan', 'Administrateur', 6),
(6, 'Frank', 'Mécanicien', 2),
(7, 'Grace', 'Pilote', 8),
(8, 'Henry', 'Médecin', 5),
(9, 'Isabelle', 'Biologiste', 3),
(10, 'Jack', 'Géologue', 4),
(11, 'Léa Martin', 'Ingénieur en robotique', 3),
(12, 'Thomas Dubois', 'Technicien de maintenance', 6),
(13, 'Sophie Leroy', 'Biologiste spatiale', 4),
(14, 'Antoine Moreau', 'Pilote de navette', 7),
(15, 'Camille Petit', 'Médecin de bord', 5),
(16, 'Lucas Roux', 'Spécialiste en communication', 2),
(17, 'Emma Girard', 'Géologue planétaire', 4),
(18, 'Nicolas Lambert', 'Ingénieur en systèmes de survie', 6),
(19, 'Julie Fournier', 'Psychologue spatial', 3),
(20, 'Mathieu Dupont', 'Botaniste', 5);


-- Insertion de données dans la table Actions
INSERT INTO Actions (action_id, type_action, date_debut, date_fin) VALUES
(1, 'Maintenance', '2024-12-01 10:00:00', '2024-12-01 12:00:00'),
(2, 'Inspection', '2024-12-02 14:00:00', '2024-12-02 15:30:00'),
(3, 'Réparation', '2024-12-03 09:00:00', '2024-12-03 11:00:00'),
(4, 'Mise à jour logicielle', '2024-12-04 13:00:00', '2024-12-04 14:00:00'),
(5, 'Formation', '2024-12-05 10:00:00', '2024-12-05 16:00:00'),
(6, 'Exploration', '2024-12-06 08:00:00', '2024-12-06 18:00:00'),
(7, 'Récolte de ressources', '2024-12-07 09:30:00', '2024-12-07 14:30:00'),
(8, 'Analyse atmosphérique', '2024-12-08 11:00:00', '2024-12-08 13:00:00'),
(9, 'Construction', '2024-12-09 07:00:00', '2024-12-09 19:00:00'),
(10, 'Sauvetage', '2024-12-10 15:00:00', '2024-12-10 17:30:00'),
(11, 'Maintenance du système de filtration d''air', '2024-12-11 08:00:00', '2024-12-11 16:00:00'),
(12, 'Exploration d''une nouvelle grotte lunaire', '2024-12-12 10:00:00', '2024-12-12 18:00:00'),
(13, 'Réparation d''un panneau solaire endommagé', '2024-12-13 09:30:00', '2024-12-13 14:30:00'),
(14, 'Collecte d''échantillons de sol martien', '2024-12-14 07:00:00', '2024-12-14 12:00:00'),
(15, 'Installation d''un nouveau module d''habitation', '2024-12-15 06:00:00', '2024-12-15 20:00:00'),
(16, 'Calibration des instruments scientifiques', '2024-12-16 13:00:00', '2024-12-16 17:00:00'),
(17, 'Simulation d''urgence et évacuation', '2024-12-17 14:00:00', '2024-12-17 16:30:00'),
(18, 'Expérience de culture hydroponique', '2024-12-18 09:00:00', '2024-12-18 11:00:00'),
(19, 'Maintenance des combinaisons spatiales', '2024-12-19 10:30:00', '2024-12-19 15:30:00'),
(20, 'Analyse de la composition atmosphérique', '2024-12-20 08:00:00', '2024-12-20 12:00:00');

-- Insertion de données dans la table Rapports_Incidence
INSERT INTO Rapports_Incidence (rapport_id, type_loi_violee, description, action_id) VALUES
(1, 'Première loi', 'Un robot a blessé un humain par inadvertance.', 1),
(2, 'Deuxième loi', "Un robot a refusé d'obéir à un ordre.", 2),
(3, 'Troisième loi', 'Un robot a mis en danger sa propre existence.', 3),
(4, 'Première loi', 'Un robot a failli causer du tort à un humain.', 4),
(5, 'Deuxième loi', 'Un robot a mal interprété un ordre humain.', 5),
(6, 'Deuxième loi', 'Un robot a priorisé sa propre sécurité sur un ordre humain.', 6),
(7, 'Première loi', "Un robot n'a pas agi pour prévenir un danger potentiel pour un humain.", 7),
(8, 'Troisième loi', "Un robot s'est mis en danger inutilement lors d'une mission.", 8),
(9, 'Deuxième loi', 'Un robot a mal interprété un ordre complexe.', 9),
(10, 'Première loi', "Un robot a hésité trop longtemps avant d'agir pour sauver un humain.", 10),
(11, 'Première loi', 'Un robot a ignoré un humain en détresse pour accomplir une tâche jugée plus importante.', 11),
(12, 'Deuxième loi', 'Un robot a mal interprété un ordre ambigu, causant un retard dans une mission critique.', 12),
(13, 'Troisième loi', "Un robot s'est mis en danger inutilement lors d'une opération de maintenance.", 13),
(14, 'Première loi', 'Un robot a hésité trop longtemps avant d''intervenir dans une situation d''urgence médicale.', 14),
(15, 'Deuxième loi', 'Un robot a priorisé un ordre moins urgent au détriment d''une tâche cruciale pour la sécurité.', 15),
(16, 'Troisième loi', 'Un robot a négligé sa propre maintenance, compromettant sa capacité à protéger les humains.', 16),
(17, 'Première loi', 'Un robot a pris une décision qui a mis indirectement en danger un groupe d''humains.', 17),
(18, 'Deuxième loi', 'Un robot a refusé d''obéir à un ordre qui aurait pu potentiellement violer la première loi.', 18),
(19, 'Troisième loi', 'Un robot s''est désactivé face à un danger, laissant une tâche critique inachevée.', 19),
(20, 'Première loi', 'Un robot a causé un préjudice psychologique à un humain en révélant des informations sensibles.', 20);

-- Création des rôles
CREATE USER 'administrateur'@'localhost' IDENTIFIED BY 'administrateur';
CREATE USER 'analyste'@'localhost' IDENTIFIED BY 'analyste';
CREATE USER 'technicien'@'localhost' IDENTIFIED BY 'technicien';
CREATE USER 'superviseur_ethique'@'localhost' IDENTIFIED BY 'ethique';

-- Attribution des droits pour l'administrateur
GRANT ALL PRIVILEGES ON robotique TO administrateur;

-- Attribution des droits pour l'analyste
GRANT SELECT ON Robots TO analyste;
GRANT SELECT ON Humains TO analyste;
GRANT SELECT ON Actions TO analyste;
GRANT SELECT ON Rapports_Incidence TO analyste;

-- Attribution des droits pour le technicien
GRANT SELECT, UPDATE (etat) ON Robots TO technicien;

-- Attribution des droits pour le superviseur éthique
GRANT SELECT ON Actions TO superviseur_ethique;
GRANT SELECT ON Rapports_Incidence TO superviseur_ethique;

-- Humains impliqués dans les rapports d'incidents
SET profiling=1;
SELECT h.nom, COUNT(*) AS nb_incidents
FROM Humains h
JOIN Participants_Action p ON h.humain_id = p.humain_id
JOIN Rapports_Incidence r ON p.action_id = r.action_id
GROUP BY h.nom
ORDER BY nb_incidents DESC;
SHOW PROFILES;

-- Robots impliqués dans les rapports d'incidents
SET profiling=1;
SELECT r.nom, COUNT(*) AS nb_incidents
FROM Robots r
JOIN Participants_Action p ON r.robot_id = p.robot_id
JOIN Rapports_Incidence ri ON p.action_id = ri.action_id
GROUP BY r.nom
ORDER BY nb_incidents DESC;
SHOW PROFILES;

-- Actions menant au plus de rapports
SET profiling=1;
SELECT a.type_action, COUNT(*) AS nb_incidents
FROM Actions a
JOIN Rapports_Incidence ri ON a.action_id = ri.action_id
GROUP BY a.type_action
ORDER BY nb_incidents DESC;
SHOW PROFILES;

-- Robots impliqués dans un incident qui ont disparu
SET profiling=1;
SELECT r.nom, r.etat
FROM Robots r
JOIN Participants_Action p ON r.robot_id = p.robot_id
JOIN Rapports_Incidence ri ON p.action_id = ri.action_id
WHERE r.etat = 'disparu';
SHOW PROFILES;

-- Impact des lois violées sur la sécurité de la colonie
SET profiling=1;
SELECT type_loi_violee, COUNT(*) AS nombre_violations,
       AVG(TIMESTAMPDIFF(MINUTE, a.date_debut, a.date_fin)) AS duree_moyenne_action
FROM Rapports_Incidence ri
JOIN Actions a ON ri.action_id = a.action_id
GROUP BY type_loi_violee
ORDER BY nombre_violations DESC;
SHOW PROFILES;

-- Humains et robots  travaillant le plus souvent ensemble
SET profiling=1;
SELECT 
    h.nom AS nom_humain,
    r.nom AS nom_robot,
    COUNT(*) AS nb_collaborations
FROM Participants_Action ph
JOIN Participants_Action pr ON ph.action_id = pr.action_id
JOIN Humains h ON ph.humain_id = h.humain_id
JOIN Robots r ON pr.robot_id = r.robot_id
WHERE ph.humain_id IS NOT NULL AND pr.robot_id IS NOT NULL
GROUP BY h.nom, r.nom
ORDER BY nb_collaborations DESC
LIMIT 10;
SHOW PROFILES;


-- Création d'index dans un premier temps
CREATE INDEX idx_participants_action_humain_id ON Participants_Action(humain_id);
CREATE INDEX idx_participants_action_robot_id ON Participants_Action(robot_id);
CREATE INDEX idx_participants_action_action_id ON Participants_Action(action_id);
CREATE INDEX idx_rapports_incidence_action_id ON Rapports_Incidence(action_id);
CREATE INDEX idx_robots_etat ON Robots(etat);
CREATE INDEX idx_rapports_incidence_type_loi ON Rapports_Incidence(type_loi_violee);
CREATE INDEX idx_humains_nom ON Humains(nom);
CREATE INDEX idx_robots_nom ON Robots(nom);

-- Création de vue dans un deuxième premier temps

-- Vue pour les incidents par humain
CREATE VIEW vue_incidents_par_humain AS
SELECT h.nom, COUNT(*) AS nb_incidents
FROM Humains h
JOIN Participants_Action p ON h.humain_id = p.humain_id
JOIN Rapports_Incidence r ON p.action_id = r.action_id
GROUP BY h.nom
ORDER BY nb_incidents DESC;

-- Vue pour les incidents par robot
CREATE VIEW vue_incidents_par_robot AS
SELECT r.nom, COUNT(*) AS nb_incidents
FROM Robots r
JOIN Participants_Action p ON r.robot_id = p.robot_id
JOIN Rapports_Incidence ri ON p.action_id = ri.action_id
GROUP BY r.nom
ORDER BY nb_incidents DESC;

-- Vue pour les incidents par type d'action
CREATE VIEW vue_incidents_par_action AS
SELECT a.type_action, COUNT(*) AS nb_incidents
FROM Actions a
JOIN Rapports_Incidence ri ON a.action_id = ri.action_id
GROUP BY a.type_action
ORDER BY nb_incidents DESC;

-- Vue pour les collaborations fréquentes
CREATE VIEW vue_collaborations_frequentes AS
SELECT 
    h.nom AS nom_humain,
    r.nom AS nom_robot,
    COUNT(*) AS nb_collaborations
FROM Participants_Action ph
JOIN Participants_Action pr ON ph.action_id = pr.action_id
JOIN Humains h ON ph.humain_id = h.humain_id
JOIN Robots r ON pr.robot_id = r.robot_id
WHERE ph.humain_id IS NOT NULL AND pr.robot_id IS NOT NULL
GROUP BY h.nom, r.nom
ORDER BY nb_collaborations DESC;

-- Humains impliqués dans les rapports d'incidents (optimisée)
SET profiling=1;
SELECT * FROM vue_incidents_par_humain
ORDER BY nb_incidents DESC;
SHOW PROFILES;

-- Robots impliqués dans les rapports d'incidents (optimisée)
SELECT * FROM vue_incidents_par_robot
ORDER BY nb_incidents DESC;

-- Actions menant au plus de rapports (optimisée)
SELECT * FROM vue_incidents_par_action
ORDER BY nb_incidents DESC;

-- Robots impliqués dans un incident qui ont disparu (optimisée)
SELECT r.nom, r.etat
FROM Robots r
JOIN Participants_Action p ON r.robot_id = p.robot_id
JOIN Rapports_Incidence ri ON p.action_id = ri.action_id
WHERE r.etat = 'disparu';

-- Analyse de l'impact des lois violées (optimisée)
SELECT type_loi_violee, COUNT(*) AS nombre_violations,
AVG(TIMESTAMPDIFF(MINUTE, a.date_debut, a.date_fin)) AS duree_moyenne_action
FROM Rapports_Incidence ri
JOIN Actions a ON ri.action_id = a.action_id
GROUP BY type_loi_violee
ORDER BY nombre_violations DESC;
