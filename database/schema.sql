CREATE DATABASE clue_code_game;
USE clue_code_game;

-- Table des aventures
CREATE TABLE aventures (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    description TEXT,
    date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table des salles
CREATE TABLE salles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    aventure_id INT,
    nom VARCHAR(255) NOT NULL,
    description TEXT,
    acces_code VARCHAR(50) DEFAULT NULL, -- Peut contenir un code d'accès nécessaire pour entrer
    FOREIGN KEY (aventure_id) REFERENCES aventures(id) ON DELETE CASCADE
);

-- Table des objets
CREATE TABLE objets (
    id INT AUTO_INCREMENT PRIMARY KEY,
    aventure_id INT,
    salle_id INT,
    nom VARCHAR(255) NOT NULL,
    description TEXT,
    utilisable BOOLEAN DEFAULT FALSE, -- Indique si l'objet peut être utilisé
    FOREIGN KEY (aventure_id) REFERENCES aventures(id) ON DELETE CASCADE,
    FOREIGN KEY (salle_id) REFERENCES salles(id) ON DELETE CASCADE
);

-- Table des énigmes
CREATE TABLE enigmes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    aventure_id INT,
    salle_id INT,
    question TEXT NOT NULL,
    reponse VARCHAR(255) NOT NULL, -- Stocke la réponse attendue
    indice TEXT DEFAULT NULL,
    FOREIGN KEY (aventure_id) REFERENCES aventures(id) ON DELETE CASCADE,
    FOREIGN KEY (salle_id) REFERENCES salles(id) ON DELETE CASCADE
);

-- Table des joueurs
CREATE TABLE joueurs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pseudo VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    date_inscription TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table de la progression des joueurs
CREATE TABLE progression (
    id INT AUTO_INCREMENT PRIMARY KEY,
    joueur_id INT,
    aventure_id INT,
    salle_id INT,
    objets_recuperes TEXT, -- Liste des objets récupérés sous forme de JSON
    enigmes_resolues TEXT, -- Liste des énigmes résolues sous forme de JSON
    date_sauvegarde TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (joueur_id) REFERENCES joueurs(id) ON DELETE CASCADE,
    FOREIGN KEY (aventure_id) REFERENCES aventures(id) ON DELETE CASCADE,
    FOREIGN KEY (salle_id) REFERENCES salles(id) ON DELETE CASCADE
);