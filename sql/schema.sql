-- Schéma de la base de données : gestion de bibliothèque
-- Tables : auteurs, livres, emprunteurs, emprunts

PRAGMA foreign_keys = ON;

-- Table des auteurs
CREATE TABLE IF NOT EXISTS auteurs (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nom TEXT NOT NULL,
    prenom TEXT,
    nationalite TEXT,
    date_naissance DATE
);

-- Table des livres
CREATE TABLE IF NOT EXISTS livres (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    titre TEXT NOT NULL,
    annee_publication INTEGER,
    categorie TEXT,
    auteur_id INTEGER NOT NULL,
    FOREIGN KEY (auteur_id) REFERENCES auteurs(id)
);

-- Table des emprunteurs (lecteurs)
CREATE TABLE IF NOT EXISTS emprunteurs (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nom TEXT NOT NULL,
    prenom TEXT NOT NULL,
    email TEXT UNIQUE,
    date_inscription DATE DEFAULT CURRENT_DATE
);

-- Table des emprunts
CREATE TABLE IF NOT EXISTS emprunts (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    livre_id INTEGER NOT NULL,
    emprunteur_id INTEGER NOT NULL,
    date_emprunt DATE NOT NULL,
    date_retour_prevue DATE,
    date_retour_effective DATE,
    FOREIGN KEY (livre_id) REFERENCES livres(id),
    FOREIGN KEY (emprunteur_id) REFERENCES emprunteurs(id)
);

-- Index pour optimiser les requêtes fréquentes
CREATE INDEX IF NOT EXISTS idx_emprunts_date ON emprunts(date_emprunt);
CREATE INDEX IF NOT EXISTS idx_emprunts_livre ON emprunts(livre_id);
CREATE INDEX IF NOT EXISTS idx_emprunts_emprunteur ON emprunts(emprunteur_id);
CREATE INDEX IF NOT EXISTS idx_livres_auteur ON livres(auteur_id);
