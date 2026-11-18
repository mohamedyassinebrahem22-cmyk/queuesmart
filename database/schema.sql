PRAGMA foreign_keys = ON;

CREATE TABLE Commerce (
    id                  INTEGER PRIMARY KEY AUTOINCREMENT,
    nom                 TEXT NOT NULL,
    adresse             TEXT NOT NULL,
    email               TEXT NOT NULL UNIQUE,
    mot_de_passe_hache  TEXT NOT NULL
);

CREATE TABLE File (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    nom             TEXT NOT NULL,
    duree_depart    INTEGER NOT NULL DEFAULT 10,   -- en minutes
    statut          TEXT NOT NULL DEFAULT 'fermee'
                    CHECK (statut IN ('ouverte', 'fermee')),
    id_commerce     INTEGER NOT NULL,
    FOREIGN KEY (id_commerce) REFERENCES Commerce(id)
);

CREATE TABLE Ticket (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    numero          INTEGER NOT NULL,
    prenom          TEXT NOT NULL,
    statut          TEXT NOT NULL DEFAULT 'en_attente'
                    CHECK (statut IN ('en_attente', 'appele', 'servi', 'absent', 'annule')),
    heure_creation  TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    heure_appel     TEXT,
    heure_fin       TEXT,
    id_file         INTEGER NOT NULL,
    FOREIGN KEY (id_file) REFERENCES File(id),
    UNIQUE (id_file, numero)
);
