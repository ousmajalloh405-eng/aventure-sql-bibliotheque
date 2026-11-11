# Architecture — Aventure SQL Bibliothèque

## Vue d'ensemble

Base de données relationnelle modélisant un système de gestion de bibliothèque (auteurs, livres, emprunteurs, emprunts).

## Schéma relationnel

```
┌─────────────┐       ┌─────────────┐
│   auteurs   │       │ emprunteurs │
│─────────────│       │─────────────│
│ id (PK)     │       │ id (PK)     │
│ nom         │       │ nom         │
│ prenom      │       │ prenom      │
│ nationalite │       │ email       │
└──────┬──────┘       └──────┬──────┘
       │ 1                   │ 1
       │                     │
       │ N                   │ N
┌──────▼──────┐       ┌──────▼──────┐
│   livres    │       │  emprunts   │
│─────────────│       │─────────────│
│ id (PK)     │◄──────│ livre_id    │
│ titre       │   N   │ emprunteur_id│
│ annee       │       │ date_emprunt│
│ categorie   │       │ date_retour │
│ auteur_id   │       └────────────┘
└─────────────┘
```

## Fichiers

| Fichier | Contenu |
|---------|---------|
| `sql/schema.sql` | Création des tables et des index |
| `sql/data.sql` | Jeu de données fictives |
| `sql/queries.sql` | Vues et requêtes d’exemple |
| `main.py` | Script Python qui initialise la base et exécute les requêtes |

## Vues

- `v_emprunts_en_cours` : emprunts non encore retournés
- `v_stats_auteurs` : nombre de livres par auteur

## Index

Index créés sur les colonnes fréquemment utilisées dans les jointures et les filtres (`date_emprunt`, `livre_id`, `emprunteur_id`, `auteur_id`).
