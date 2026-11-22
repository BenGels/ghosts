# ghosts – „i can see ghosts …"

Eine kleine Web-App zur Verwaltung beschworener Geister für Pen-&-Paper-Runden im Stil von **Shadowrun** (deutsche Regeln/Begriffe). Spieler können ihre Geister anlegen, Kraftstufe und Dienste verwalten, Bindung umschalten, astralen und mundanen Schaden eintragen und die Werte, Fertigkeiten und Kräfte des jeweiligen Geistertyps nachschlagen.

> **Hinweis:** Dieses Projekt stammt aus der Zeit um **ca. 2018** und wurde erst jetzt (2026) auf GitHub hochgeladen. Der Code wird so archiviert, wie er damals entstanden ist – er ist nicht gepflegt und entspricht nicht mehr aktuellen Standards (siehe [Bekannte Einschränkungen](#bekannte-einschränkungen)).

## Funktionen

- Auswahl eines Spielers und Übersicht über seine Geister
- Geister anlegen (Typ, Kraftstufe, Dienste, optionale Kräfte) und löschen
- Dienste ändern, Bindung an-/ausschalten
- Schadensmonitor (astral / mundan) pro Geist
- Detailansicht mit Attributen, Fertigkeiten, Kräften und optionalen Kräften des Geistertyps
- Vordefinierte Geistertypen: Erdgeist, Feuergeist, Luftgeist, Geist des Menschen, Geist des Tieres, Wassergeist, Schutzgeist, Helfergeist u. a.

## Technik

- PHP (mysqli) als Backend, Endpunkte unter `data/`
- MySQL/MariaDB als Datenbank
- Frontend: jQuery 1.10, Bootstrap 3.1 (per CDN), `jquery.cookie.js`

```
.
├── index.php              # Oberfläche
├── jquery.cookie.js
├── ghosts.sql             # Datenbank-Schema + Stammdaten (bereinigte Beispielnutzer)
├── exampleQueries.txt     # Beispiel-SQL-Abfragen
└── data/
    ├── DBConnection.php   # DB-Verbindung, liest database.ini
    ├── Ghosts.php         # Geschäftslogik
    ├── Login.php          # (unfertiger) Login
    ├── database.ini.example
    └── *.php              # AJAX-Endpunkte (add, delete, details, …)
```

## Installation

1. Datenbank anlegen und Dump importieren:
   ```bash
   mysql -u root -p -e "CREATE DATABASE ghosts CHARACTER SET utf8mb4;"
   mysql -u root -p ghosts < ghosts.sql
   ```
2. Konfiguration anlegen:
   ```bash
   cp data/database.ini.example data/database.ini
   ```
   und Zugangsdaten in `data/database.ini` eintragen. Diese Datei ist per `.gitignore` von der Versionsverwaltung ausgeschlossen.
3. Das Verzeichnis über einen PHP-fähigen Webserver ausliefern, z. B. lokal:
   ```bash
   php -S localhost:8000
   ```
   und `http://localhost:8000` öffnen.

Der Dump enthält nur Platzhalter-Nutzer (`Spieler1`–`Spieler3`) ohne Passwort.

## Bekannte Einschränkungen

Der Code ist ein Stand von damals und **nicht für den öffentlichen Betrieb geeignet**:

- SQL-Abfragen werden teilweise per String-Verkettung gebaut (SQL-Injection möglich).
- `data/test.php` ruft beliebige Methoden über `$_GET["method"]` auf.
- `Login.php` nutzt die in PHP 7 entfernten `mysql_*`-Funktionen und MD5-Hashes; der Login ist in der Oberfläche nicht eingebunden.
- Keine Authentifizierung/Autorisierung der Endpunkte.

Wer das Projekt wiederbeleben möchte, sollte auf Prepared Statements, `password_hash()` und eine echte Session-Verwaltung umstellen.

## Rechtliches

Shadowrun ist eine eingetragene Marke der jeweiligen Rechteinhaber. Dieses Projekt ist ein privates Fan-Werkzeug und steht in keiner Verbindung zu ihnen.
