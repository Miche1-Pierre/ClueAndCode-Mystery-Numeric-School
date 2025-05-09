/* Première valeur de base */
-- Ajouter une aventure
INSERT INTO aventures (nom, description) 
VALUES ('Mystery Numeric School', 'Trouvez NOVA avant qu’elle ne tombe entre de mauvaises mains.');

-- Récupérer l’ID de l’aventure insérée
SET @aventure_id = LAST_INSERT_ID();

-- Ajouter des salles
INSERT INTO salles (aventure_id, nom, description) VALUES
(@aventure_id, 'Accueil', 'Le point de départ du jeu.'),
(@aventure_id, 'Salle de cours', 'Contient des indices sur la suite du jeu.'),
(@aventure_id, 'Bureau du Formateur', 'Contient des fichiers confidentiels.');

-- Ajouter des objets
INSERT INTO objets (aventure_id, salle_id, nom, description, utilisable) VALUES
(@aventure_id, 1, 'Badge visiteur', 'Permet d’accéder à la Salle de cours.', TRUE),
(@aventure_id, 2, 'Clé USB', 'Contient des fichiers secrets à décrypter.', TRUE);

-- Ajouter des énigmes
INSERT INTO enigmes (aventure_id, salle_id, question, reponse, indice) VALUES
(@aventure_id, 1, 'Quel est le code d’accès du PC d’accueil ?', '1234', 'Cherchez dans le sac du formateur.'),
(@aventure_id, 3, 'Quelle commande Bash permet de lister les fichiers ?', 'ls', 'Utilisez le terminal pour essayer.');
