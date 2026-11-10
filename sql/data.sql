-- Données fictives pour la bibliothèque

-- Auteurs
INSERT INTO auteurs (nom, prenom, nationalite, date_naissance) VALUES
('Martin', 'Robert C.', 'Américaine', '1952-12-05'),
('Saint-Exupéry', 'Antoine de', 'Française', '1900-06-29'),
('Hugo', 'Victor', 'Française', '1802-02-26'),
('Orwell', 'George', 'Britannique', '1903-06-25'),
('Kleppmann', 'Martin', 'Allemande', '1980-01-01');

-- Livres
INSERT INTO livres (titre, annee_publication, categorie, auteur_id) VALUES
('Clean Code', 2008, 'Informatique', 1),
('The Clean Coder', 2011, 'Informatique', 1),
('Le Petit Prince', 1943, 'Roman', 2),
('Les Misérables', 1862, 'Roman', 3),
('Notre-Dame de Paris', 1831, 'Roman', 3),
('1984', 1949, 'Roman', 4),
('La Ferme des animaux', 1945, 'Roman', 4),
('Designing Data-Intensive Applications', 2017, 'Data Engineering', 5);

-- Emprunteurs
INSERT INTO emprunteurs (nom, prenom, email, date_inscription) VALUES
('Diallo', 'Ousmane', 'ousmane@example.com', '2026-01-15'),
('Ndiaye', 'Awa', 'awa@example.com', '2026-02-10'),
('Fall', 'Mamadou', 'mamadou@example.com', '2026-03-05'),
('Sow', 'Fatou', 'fatou@example.com', '2026-04-20');

-- Emprunts
INSERT INTO emprunts (livre_id, emprunteur_id, date_emprunt, date_retour_prevue, date_retour_effective) VALUES
(1, 1, '2026-11-03', '2026-11-17', NULL),
(3, 2, '2026-11-05', '2026-11-19', NULL),
(6, 1, '2026-10-20', '2026-11-03', '2026-11-01'),
(4, 3, '2026-11-08', '2026-11-22', NULL),
(8, 4, '2026-09-15', '2026-09-29', '2026-09-28'),
(2, 1, '2026-11-09', '2026-11-23', NULL),
(5, 2, '2026-08-10', '2026-08-24', '2026-08-20'),
(7, 3, '2026-11-01', '2026-11-15', NULL);
