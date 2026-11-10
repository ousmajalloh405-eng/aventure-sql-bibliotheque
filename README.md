# Aventure SQL — Gestion de bibliothèque

> Projet pédagogique pour maîtriser les bases de données relationnelles, les requêtes SQL, les vues et les index.

**Statut** : 🟢 Réalisé et validé  
**Catégorie** : 🐍 Aventure en programmation (SQL)  
**Portfolio** : [Profil GitHub](https://github.com/ousmajalloh405-eng)

---

## Problème métier

Modéliser et interroger un système de gestion de bibliothèque :
- Auteurs
- Livres
- Emprunteurs (lecteurs)
- Emprunts (avec dates d’emprunt et de retour)

## Structure de la base

```
auteurs (id, nom, prenom, nationalite, date_naissance)
livres (id, titre, annee_publication, categorie, auteur_id)
emprunteurs (id, nom, prenom, email, date_inscription)
emprunts (id, livre_id, emprunteur_id, date_emprunt, date_retour_prevue, date_retour_effective)
```

Relations :
- Un auteur peut avoir plusieurs livres
- Un livre peut être emprunté plusieurs fois
- Un emprunteur peut emprunter plusieurs livres

## Technologies

- SQLite (fichier local, aucune installation serveur)
- Python 3 (script de démonstration)
- SQL standard (compatible avec la plupart des SGBD)

## Installation et exécution

```bash
git clone https://github.com/ousmajalloh405-eng/aventure-sql-bibliotheque.git
cd aventure-sql-bibliotheque
python3 main.py
```

Le script :
1. Crée la base `data/bibliotheque.db`
2. Charge le schéma, les données et les vues
3. Exécute les requêtes d’exemple

## Fichiers SQL

| Fichier | Contenu |
|---------|---------|
| `sql/schema.sql` | Tables + index |
| `sql/data.sql` | Données fictives |
| `sql/queries.sql` | Vues + requêtes utiles |

## Requêtes principales

1. **Livres empruntés cette semaine**
2. **Auteur ayant publié le plus de livres**
3. **Emprunteurs les plus actifs sur une période**
4. **Emprunts en cours** (via vue)
5. **Livres jamais empruntés**

## Vues créées

- `v_emprunts_en_cours` : emprunts non retournés
- `v_stats_auteurs` : nombre de livres par auteur

## Index

- Sur `date_emprunt`, `livre_id`, `emprunteur_id`, `auteur_id`

## Notions travaillées

- Modélisation relationnelle (tables, clés primaires/étrangères)
- Insertion de données
- Requêtes SELECT avec JOIN, WHERE, GROUP BY, ORDER BY
- Vues SQL
- Index pour l’optimisation
- Utilisation de SQLite depuis Python

## Compétences pour le CV

Conception et interrogation d’une base de données relationnelle pour un système de gestion de bibliothèque (schéma, données, requêtes, vues, index).

---

*Projet réalisé dans le cadre de la formation Data — Sonatel Academy.*
