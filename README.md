# ghosts – "i can see ghosts …"

A small web app for managing summoned spirits in pen-and-paper sessions in the style of **Shadowrun** (using the German rules and terminology). Players can create their spirits, track force and services, toggle binding, record astral and mundane damage, and look up the attributes, skills and powers of each spirit type.

> **Note:** This project dates from around **2018** and was only uploaded to GitHub now (2026). The code is archived as it was written back then. It is not maintained and does not meet current standards (see [Known limitations](#known-limitations)).

## Features

- Select a player and see an overview of their spirits
- Create spirits (type, force, services, optional powers) and delete them
- Change services, toggle binding on and off
- Damage tracker (astral / mundane) per spirit
- Detail view with the attributes, skills, powers and optional powers of the spirit type
- Predefined spirit types: Erdgeist (earth), Feuergeist (fire), Luftgeist (air), Geist des Menschen (man), Geist des Tieres (beast), Wassergeist (water), Schutzgeist (guardian), Helfergeist (task) and more

The user interface and the game data are in German.

## Tech stack

- PHP (mysqli) backend, endpoints under `data/`
- MySQL/MariaDB database
- Frontend: jQuery 1.10, Bootstrap 3.1 (via CDN), `jquery.cookie.js`

```
.
├── index.php              # User interface
├── jquery.cookie.js
├── ghosts.sql             # Database schema + reference data (sanitized sample users)
├── exampleQueries.txt     # Example SQL queries
└── data/
    ├── DBConnection.php   # DB connection, reads database.ini
    ├── Ghosts.php         # Business logic
    ├── Login.php          # (unfinished) login
    ├── database.ini.example
    └── *.php              # AJAX endpoints (add, delete, details, …)
```

## Installation

1. Create the database and import the dump:
   ```bash
   mysql -u root -p -e "CREATE DATABASE ghosts CHARACTER SET utf8mb4;"
   mysql -u root -p ghosts < ghosts.sql
   ```
2. Create the configuration:
   ```bash
   cp data/database.ini.example data/database.ini
   ```
   and enter your credentials in `data/database.ini`. This file is excluded from version control via `.gitignore`.
3. Serve the directory with a PHP-capable web server, e.g. locally:
   ```bash
   php -S localhost:8000
   ```
   and open `http://localhost:8000`.

The dump only contains placeholder users (`Spieler1`–`Spieler3`) without passwords. The salts in `data/Login.php` are placeholders as well (`CHANGE_ME_…`).

## Known limitations

The code is a snapshot from back then and is **not suitable for public deployment**:

- Some SQL queries are built by string concatenation (SQL injection is possible).
- `data/test.php` calls arbitrary methods via `$_GET["method"]`.
- `Login.php` uses the `mysql_*` functions removed in PHP 7 and MD5 hashes; the login is not wired into the UI.
- The endpoints have no authentication or authorization.

Anyone who wants to revive the project should switch to prepared statements, `password_hash()` and proper session handling.

## Legal

Shadowrun is a registered trademark of its respective owners. This project is a private fan tool and is not affiliated with them.
