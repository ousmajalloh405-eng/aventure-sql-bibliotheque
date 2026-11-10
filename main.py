"""Script pour initialiser et interroger la base SQLite."""

import sqlite3
from pathlib import Path

DB_PATH = Path(__file__).parent / "data" / "bibliotheque.db"
SQL_DIR = Path(__file__).parent / "sql"


def init_db():
    DB_PATH.parent.mkdir(parents=True, exist_ok=True)
    # Supprime l'ancienne base pour repartir propre
    if DB_PATH.exists():
        DB_PATH.unlink()

    conn = sqlite3.connect(DB_PATH)
    conn.row_factory = sqlite3.Row

    # Schéma
    with open(SQL_DIR / "schema.sql", encoding="utf-8") as f:
        conn.executescript(f.read())

    # Données
    with open(SQL_DIR / "data.sql", encoding="utf-8") as f:
        conn.executescript(f.read())

    # Vues (exécution séparée et sûre)
    conn.execute("""
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
        WHERE e.date_retour_effective IS NULL
    """)

    conn.execute("""
        CREATE VIEW IF NOT EXISTS v_stats_auteurs AS
        SELECT 
            a.id,
            a.nom || ' ' || a.prenom AS auteur,
            COUNT(l.id) AS nombre_livres
        FROM auteurs a
        LEFT JOIN livres l ON a.id = l.auteur_id
        GROUP BY a.id
    """)

    conn.commit()
    return conn


def run_query(conn, query: str):
    cur = conn.execute(query)
    rows = cur.fetchall()
    if not rows:
        print("Aucun résultat.")
        return
    cols = rows[0].keys()
    print(" | ".join(cols))
    print("-" * 60)
    for row in rows:
        print(" | ".join(str(row[c]) for c in cols))


def main():
    print("=== Initialisation de la base ===")
    conn = init_db()
    print(f"Base créée : {DB_PATH}")

    print("\n=== Livres empruntés cette semaine ===")
    run_query(conn, """
        SELECT l.titre, em.nom || ' ' || em.prenom AS emprunteur, e.date_emprunt
        FROM emprunts e
        JOIN livres l ON e.livre_id = l.id
        JOIN emprunteurs em ON e.emprunteur_id = em.id
        WHERE e.date_retour_effective IS NULL
          AND e.date_emprunt >= date('now', '-7 days')
    """)

    print("\n=== Auteur avec le plus de livres ===")
    run_query(conn, """
        SELECT auteur, nombre_livres
        FROM v_stats_auteurs
        ORDER BY nombre_livres DESC
        LIMIT 1
    """)

    print("\n=== Emprunteurs les plus actifs (3 derniers mois) ===")
    run_query(conn, """
        SELECT em.nom || ' ' || em.prenom AS emprunteur, COUNT(e.id) AS nombre_emprunts
        FROM emprunts e
        JOIN emprunteurs em ON e.emprunteur_id = em.id
        WHERE e.date_emprunt >= date('now', '-3 months')
        GROUP BY em.id
        ORDER BY nombre_emprunts DESC
    """)

    print("\n=== Emprunts en cours (vue) ===")
    run_query(conn, "SELECT * FROM v_emprunts_en_cours")

    conn.close()
    print("\nTerminé.")


if __name__ == "__main__":
    main()
