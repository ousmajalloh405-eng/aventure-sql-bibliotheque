-- Requêtes et vues pour la bibliothèque

-- Vue : emprunts en cours
CREATE VIEW IF NOT EXISTS v_emprunts_en_cours AS
SELECT 
    e.id,
    l.titre,
    a.nom || ' ' || a.prenom AS auteur,
    em.nom || ' ' || em.prenom AS emprunteur,
    e.date_emprunt,
    e.date_retour_prevue
FROM emprunts e
JOIN livres l ON e.livre_id = l.id
JOIN auteurs a ON l.auteur_id = a.id
JOIN emprunteurs em ON e.emprunteur_id = em.id
WHERE e.date_retour_effective IS NULL;

-- Vue : statistiques par auteur
CREATE VIEW IF NOT EXISTS v_stats_auteurs AS
SELECT 
    a.id,
    a.nom || ' ' || a.prenom AS auteur,
    COUNT(l.id) AS nombre_livres
FROM auteurs a
LEFT JOIN livres l ON a.id = l.auteur_id
GROUP BY a.id;

-- 1. Livres empruntés cette semaine
SELECT 
    l.titre,
    em.nom || ' ' || em.prenom AS emprunteur,
    e.date_emprunt
FROM emprunts e
JOIN livres l ON e.livre_id = l.id
JOIN emprunteurs em ON e.emprunteur_id = em.id
WHERE e.date_retour_effective IS NULL
  AND e.date_emprunt >= date('now', '-7 days');

-- 2. Auteur avec le plus de livres
SELECT 
    auteur,
    nombre_livres
FROM v_stats_auteurs
ORDER BY nombre_livres DESC
LIMIT 1;

-- 3. Emprunteurs les plus actifs (3 derniers mois)
SELECT 
    em.nom || ' ' || em.prenom AS emprunteur,
    COUNT(e.id) AS nombre_emprunts
FROM emprunts e
JOIN emprunteurs em ON e.emprunteur_id = em.id
WHERE e.date_emprunt >= date('now', '-3 months')
GROUP BY em.id
ORDER BY nombre_emprunts DESC;

-- 4. Emprunts en cours
SELECT * FROM v_emprunts_en_cours;

-- 5. Livres jamais empruntés
SELECT l.titre
FROM livres l
LEFT JOIN emprunts e ON l.id = e.livre_id
WHERE e.id IS NULL;
