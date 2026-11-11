# Aventure SQL — Gestion de bibliothèque

> Projet pédagogique pour maîtriser les bases de données relationnelles, les requêtes SQL, les vues et les index.

**Statut** : 🟢 Réalisé et validé  
**Catégorie** : 🐍 Aventure en programmation (SQL)  
**Portfolio** : [Profil GitHub](https://github.com/ousmajalloh405-eng)

---

## 1. Problème métier

Modéliser et interroger un système de gestion de bibliothèque permettant de suivre les livres, les auteurs, les emprunteurs et les emprunts.

## 2. Architecture de la base

```
          auteurs
             │
             │ 1
             │
             ▼ N
          livres
             │
             │ 1
             │
             ▼ N
         emprunts ◀──── N emprunteurs
```

**Tables** :
- `auteurs` → qui a écrit le livre
- `livres` → les ouvrages
- `emprunteurs` → les lecteurs
- `emprunts` → qui a emprunté quoi et quand

## 3. Structure du projet

```
aventure-sql-bibliotheque/
├── sql/
│   ├── schema.sql     # Tables + index
│   ├── data.sql       # Données fictives
│   └── queries.sql    # Vues + requêtes
├── data/
│   └── bibliotheque.db
├── main.py           # Démonstration
└── README.md
```

## 4. Technologies

- SQLite (fichier local)
- Python 3 (script de démonstration)
- SQL standard

## 5. Installation et exécution

```bash
git clone https://github.com/ousmajalloh405-eng/aventure-sql-bibliotheque.git
cd aventure-sql-bibliotheque
python3 main.py
```

## 6. Requêtes et vues fournies

- Livres empruntés cette semaine
- Auteur avec le plus de livres
- Emprunteurs les plus actifs
- Vue `v_emprunts_en_cours`
- Vue `v_stats_auteurs`

## 7. Compétences pour le CV

Conception et interrogation d’une base de données relationnelle pour un système de gestion de bibliothèque (schéma, données, requêtes, vues, index).

---

*Projet réalisé dans le cadre de la formation Data — Sonatel Academy.*
