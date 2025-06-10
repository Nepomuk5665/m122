# CLI & Bash Scripting - Ausführliches Cheat Sheet

## 1. CLI vs GUI

### CLI (Command Line Interface)
**Synonyme:** Terminal, Konsole, Shell, Kommandozeile, Command Prompt

**Definition:** Textbasierte Benutzeroberfläche zur Interaktion mit dem Betriebssystem

### GUI (Graphical User Interface)
**Definition:** Grafische Benutzeroberfläche mit Fenstern, Icons, Menüs und Zeigegerät

### Vergleich: Ressourcenverbrauch

| Aspekt | CLI | GUI |
|--------|-----|-----|
| **RAM-Verbrauch** | Sehr niedrig (1-10 MB) | Hoch (100+ MB) |
| **CPU-Last** | Minimal | Höher (Grafik-Rendering) |
| **Festplattenspeicher** | Minimal | Umfangreich (Grafik-Bibliotheken) |
| **Netzwerk-Overhead** | Gering (SSH: ~1-2 KB/s) | Hoch (VNC/RDP: MB/s) |

### Vor- und Nachteile

**CLI Vorteile:**
- Ressourcenschonend
- Schnelle Ausführung
- Automatisierbar (Skripte)
- Remote-Zugriff effizient
- Präzise Kontrolle
- Batch-Verarbeitung möglich

**CLI Nachteile:**
- Steile Lernkurve
- Keine visuelle Darstellung
- Befehle müssen memoriert werden
- Fehleranfälliger bei komplexen Befehlen

**GUI Vorteile:**
- Intuitive Bedienung
- Visuelle Darstellung
- Drag & Drop
- Multitasking-freundlich
- Weniger Fehler durch Point & Click

**GUI Nachteile:**
- Hoher Ressourcenverbrauch
- Langsamere Ausführung
- Schwer automatisierbar
- Remote-Zugriff ressourcenintensiv

## 2. Grundlegende CLI-Befehle

### `ls` - Verzeichnisinhalte auflisten
```bash
ls                    # Einfache Auflistung
ls -l                 # Detaillierte Auflistung (long format)
ls -la                # Inklusive versteckte Dateien
ls -lh                # Human readable (Größen in KB, MB, GB)
ls -lt                # Sortiert nach Änderungszeit
ls -lS                # Sortiert nach Größe
ls -R                 # Rekursiv (alle Unterverzeichnisse)
ls *.txt              # Nur .txt Dateien
ls -1                 # Eine Datei pro Zeile
```

### `mkdir` - Verzeichnisse erstellen
```bash
mkdir ordner                    # Einzelnes Verzeichnis
mkdir -p pfad/zu/ordner        # Erstellt auch Zwischenverzeichnisse
mkdir ordner1 ordner2 ordner3  # Mehrere Verzeichnisse
mkdir -m 755 ordner            # Mit spezifischen Rechten
```

### `pwd` - Aktuelles Verzeichnis anzeigen
```bash
pwd                   # Print Working Directory
pwd -P               # Physischer Pfad (löst Symlinks auf)
```

### `cd` - Verzeichnis wechseln
```bash
cd /pfad/zum/ordner  # Absoluter Pfad
cd ordner            # Relativer Pfad
cd ..                # Ein Verzeichnis zurück
cd ~                 # Home-Verzeichnis
cd -                 # Vorheriges Verzeichnis
cd /                 # Root-Verzeichnis
```

### `cat` - Dateiinhalt anzeigen
```bash
cat datei.txt                    # Ganze Datei ausgeben
cat datei1.txt datei2.txt       # Mehrere Dateien
cat -n datei.txt                # Mit Zeilennummern
cat -b datei.txt                # Nur nicht-leere Zeilen nummerieren
cat > neue_datei.txt            # Neue Datei erstellen (Strg+D zum Beenden)
cat >> bestehende_datei.txt     # An Datei anhängen
```

### `less` - Datei seitenweise anzeigen
```bash
less datei.txt       # Datei öffnen
# Navigation in less:
# Space/f    - Nächste Seite
# b          - Vorherige Seite
# /suchtext  - Suchen
# n          - Nächstes Suchergebnis
# q          - Beenden
# G          - Zum Ende
# g          - Zum Anfang
```

### `tail` - Ende einer Datei anzeigen
```bash
tail datei.txt           # Letzte 10 Zeilen
tail -n 20 datei.txt     # Letzte 20 Zeilen
tail -f datei.txt        # Verfolgt neue Zeilen (für Logs)
tail -c 100 datei.txt    # Letzte 100 Bytes
```

### `head` - Anfang einer Datei anzeigen
```bash
head datei.txt           # Erste 10 Zeilen
head -n 5 datei.txt      # Erste 5 Zeilen
head -c 50 datei.txt     # Erste 50 Bytes
```

### `diff` - Dateien vergleichen
```bash
diff datei1.txt datei2.txt       # Einfacher Vergleich
diff -u datei1.txt datei2.txt    # Unified format
diff -c datei1.txt datei2.txt    # Context format
diff -r ordner1/ ordner2/        # Verzeichnisse vergleichen
diff -w datei1.txt datei2.txt    # Whitespace ignorieren
```

### `date` - Datum und Zeit
```bash
date                             # Aktuelles Datum/Zeit
date +"%Y-%m-%d"                # Format: 2024-03-15
date +"%H:%M:%S"                # Format: 14:30:25
date +"%Y-%m-%d %H:%M:%S"       # Format: 2024-03-15 14:30:25
date -d "yesterday"             # Gestern
date -d "+1 week"               # Nächste Woche
date -s "2024-03-15 14:30:00"   # Zeit setzen (als root)
```

### `ip` - Netzwerk-Konfiguration
```bash
ip a                    # Alle Netzwerk-Interfaces
ip addr show           # Detaillierte Interface-Info
ip route               # Routing-Tabelle
ip route show default  # Default Gateway
ip link show           # Link-Layer Informationen
ip -4 addr             # Nur IPv4 Adressen
ip -6 addr             # Nur IPv6 Adressen
```

## 3. Automatisierung

### Geeignete Aufgaben für Automatisierung:
- **Backup-Prozesse:** Regelmäßige Datensicherung
- **Log-Rotation:** Alte Log-Dateien archivieren/löschen
- **System-Updates:** Automatische Paket-Updates
- **Monitoring:** System-Überwachung und Benachrichtigungen
- **Datenverarbeitung:** Batch-Verarbeitung von Dateien
- **Berichte:** Automatische Report-Generierung
- **Cleanup-Tasks:** Temporäre Dateien löschen
- **Deployment:** Software-Auslieferung

### NICHT geeignet für Automatisierung:
- **Kreative Entscheidungen:** Grafik-Design, Texterstellung
- **Komplexe Problemlösung:** Debugging unbekannter Fehler
- **Benutzerinteraktion:** Kundenberatung, Support
- **Kritische Entscheidungen:** Security-Entscheidungen mit hohem Risiko
- **Einmalige Aufgaben:** Seltene, spezifische Konfigurationen
- **Fehlerbehandlung:** Unvorhersagbare Fehlersituationen

## 4. Case Sensitivity

**Definition:** Unterscheidung zwischen Groß- und Kleinschreibung

```bash
# Linux/Unix ist case-sensitive:
datei.txt ≠ Datei.txt ≠ DATEI.TXT

# Beispiele:
ls Dokumente/     # Funktioniert nur wenn Ordner "Dokumente" heißt
ls dokumente/     # Fehler wenn Ordner "Dokumente" heißt

# Bei Befehlen:
mkdir test        # Korrekt
MKDIR test        # Fehler - Befehl nicht gefunden
Mkdir test        # Fehler - Befehl nicht gefunden
```

## 5. Kommentare in Skripten

```bash
#!/bin/bash

# Dies ist ein einzeiliger Kommentar

# Mehrzeilige Kommentare:
# Zeile 1 des Kommentars
# Zeile 2 des Kommentars
# Zeile 3 des Kommentars

echo "Hello World"  # Kommentar am Ende der Zeile

# Funktions-Dokumentation:
# Diese Funktion berechnet die Summe zweier Zahlen
# Parameter 1: Erste Zahl
# Parameter 2: Zweite Zahl
# Rückgabe: Summe der beiden Zahlen
function addieren() {
    local zahl1=$1
    local zahl2=$2
    echo $((zahl1 + zahl2))
}

# TODO: Diese Funktion muss noch implementiert werden
# FIXME: Bug in der Fehlerbehandlung beheben
# NOTE: Wichtiger Hinweis für andere Entwickler
```

## 6. Cron/Cronjobs - Zeitsteuerung

### Crontab Syntax:
```
* * * * * Befehl
│ │ │ │ │
│ │ │ │ └─── Wochentag (0-7, 0=Sonntag, 7=Sonntag)
│ │ │ └───── Monat (1-12)
│ │ └─────── Tag (1-31)
│ └───────── Stunde (0-23)
└─────────── Minute (0-59)
```

### Crontab verwalten:
```bash
crontab -e        # Crontab bearbeiten
crontab -l        # Crontab anzeigen
crontab -r        # Crontab löschen
crontab -u user   # Crontab für anderen User
```

### Beispiele:
```bash
# Jeden Tag um 2:30 Uhr
30 2 * * * /pfad/zum/skript.sh

# Jeden Montag um 9:00 Uhr
0 9 * * 1 /pfad/zum/backup.sh

# Alle 15 Minuten
*/15 * * * * /pfad/zum/monitoring.sh

# Jeden ersten Tag des Monats um Mitternacht
0 0 1 * * /pfad/zum/monatsreport.sh

# Werktags um 8:30 Uhr
30 8 * * 1-5 /pfad/zum/arbeitsplatz_check.sh

# Mehrere Zeiten am Tag (8:00, 12:00, 18:00)
0 8,12,18 * * * /pfad/zum/skript.sh
```

### Spezielle Zeitangaben:
```bash
@reboot        # Bei Systemstart
@yearly        # Einmal jährlich (0 0 1 1 *)
@annually      # Einmal jährlich (identisch mit @yearly)
@monthly       # Einmal monatlich (0 0 1 * *)
@weekly        # Einmal wöchentlich (0 0 * * 0)
@daily         # Einmal täglich (0 0 * * *)
@hourly        # Einmal stündlich (0 * * * *)
```

## 7. Dateirechte (RWX)

### Bedeutung der Rechte:
- **r (read):** Lesen (4)
- **w (write):** Schreiben (2)
- **x (execute):** Ausführen (1)

### Für wen gelten die Rechte:
- **u (user):** Besitzer der Datei
- **g (group):** Gruppe der Datei
- **o (others):** Alle anderen Benutzer

### Rechte anzeigen:
```bash
ls -l datei.txt
# Ausgabe: -rw-r--r-- 1 user group 1234 Mar 15 10:30 datei.txt
#          │││ │││ │││
#          ││└─┴─┴─┴─── others: r--
#          │└────────── group: r--
#          └─────────── user: rw-
```

### Rechte setzen mit `chmod`:

#### Symbolische Notation:
```bash
chmod u+x datei.sh           # User: execute hinzufügen
chmod g-w datei.txt          # Group: write entfernen
chmod o+r datei.txt          # Others: read hinzufügen
chmod a+x datei.sh           # All: execute für alle hinzufügen
chmod u+rw,g+r,o-rwx datei   # Kombinierte Rechte
chmod ug+rw datei.txt        # User und Group: read+write
```

#### Numerische Notation:
```bash
chmod 755 datei.sh    # rwxr-xr-x (User: rwx, Group: r-x, Others: r-x)
chmod 644 datei.txt   # rw-r--r-- (User: rw-, Group: r--, Others: r--)
chmod 600 datei.txt   # rw------- (User: rw-, Group: ---, Others: ---)
chmod 777 datei.sh    # rwxrwxrwx (Alle Rechte für alle)
chmod 000 datei.txt   # --------- (Keine Rechte für niemanden)
```

#### Häufige Kombinationen:
```bash
chmod 755    # Standardrechte für ausführbare Dateien
chmod 644    # Standardrechte für normale Dateien
chmod 600    # Private Dateien (nur Owner kann lesen/schreiben)
chmod 700    # Private Verzeichnisse
chmod 666    # Datei für alle lesbar/schreibbar
chmod 444    # Nur-Lese-Datei für alle
```

### Rechte für Verzeichnisse:
```bash
chmod 755 verzeichnis/    # Standard für Verzeichnisse
chmod -R 755 verzeichnis/ # Rekursiv für alle Unterelemente
```

## 8. Sicherheitsregeln für Skript-Ausführrechte

### Grundprinzipien:
1. **Least Privilege:** Nur minimal notwendige Rechte vergeben
2. **Skript-Verzeichnisse sichern:** Nur authorisierte Benutzer dürfen ändern
3. **PATH-Variable kontrollieren:** Relative Pfade vermeiden
4. **Setuid/Setgid vermeiden:** Besonders bei Shell-Skripten

### Sichere Skript-Praktiken:
```bash
# Sichere Shebang verwenden
#!/bin/bash

# Skript sollte nicht von anderen schreibbar sein
chmod 755 skript.sh      # Gut
chmod 777 skript.sh      # SCHLECHT - andere können Code ändern

# Absolute Pfade verwenden
/bin/rm /tmp/datei       # Gut
rm /tmp/datei           # Potentiell unsicher

# Umgebungsvariablen validieren
PATH="/bin:/usr/bin"     # Sichere PATH setzen
export PATH

# Input validieren
if [[ "$1" =~ ^[a-zA-Z0-9_-]+$ ]]; then
    echo "Gültiger Input: $1"
else
    echo "Ungültiger Input!" >&2
    exit 1
fi
```

### Gefährliche Praktiken vermeiden:
```bash
# NIEMALS setuid bei Shell-Skripten
chmod u+s skript.sh      # SEHR GEFÄHRLICH

# Keine Skripte in /tmp ausführbar machen
chmod +x /tmp/skript.sh  # UNSICHER

# Keine Passwörter im Skript
password="geheim123"     # NIEMALS SO MACHEN

# Bessere Alternative:
read -s -p "Passwort: " password
```

## 9. Design-Techniken für Programmabläufe

### Flussdiagramm-Symbole:
- **Oval:** Start/Ende
- **Rechteck:** Prozess/Aktion
- **Raute:** Entscheidung (if/else)
- **Parallelogramm:** Ein-/Ausgabe
- **Kreis:** Verbindungspunkt

### Pseudocode-Beispiel:
```
BEGINN
    EINGABE: Benutzername
    WENN Benutzername leer DANN
        AUSGABE: "Fehler: Benutzername erforderlich"
        ENDE
    SONST
        AUSGABE: "Willkommen " + Benutzername
    ENDE WENN
ENDE
```

### Struktogramm (Nassi-Shneiderman):
```
┌─────────────────────────┐
│    Benutzername lesen   │
├─────────────────────────┤
│ Benutzername leer?      │
├──────────┬──────────────┤
│   JA     │     NEIN     │
│ Fehler   │ Willkommen   │
│ ausgeben │ ausgeben     │
└──────────┴──────────────┘
```

## 10. Skript-Dokumentation

### Warum dokumentieren:
- **Wartbarkeit:** Code später verstehen und ändern
- **Zusammenarbeit:** Andere Entwickler können Code verstehen
- **Debugging:** Fehlersuche wird erleichtert
- **Wissenstransfer:** Know-how bleibt erhalten
- **Compliance:** Erfüllung von Standards/Richtlinien

### Was dokumentieren:
- **Zweck des Skripts:** Was macht es?
- **Parameter:** Welche Eingaben werden erwartet?
- **Voraussetzungen:** Welche Software/Rechte werden benötigt?
- **Rückgabewerte:** Was gibt das Skript zurück?
- **Seiteneffekte:** Welche Dateien/Systeme werden geändert?
- **Beispiele:** Wie wird das Skript verwendet?

## 11. Tests vorbereiten und durchführen

### Test-Arten:
- **Unit Tests:** Einzelne Funktionen testen
- **Integration Tests:** Zusammenspiel verschiedener Komponenten
- **System Tests:** Gesamtes System testen
- **Acceptance Tests:** Anforderungen erfüllt?

### Test-Vorbereitung:
```bash
# Testumgebung erstellen
mkdir -p test_env/input test_env/output test_env/expected

# Testdaten vorbereiten
echo "test data" > test_env/input/testfile.txt

# Expected Results definieren
echo "expected output" > test_env/expected/result.txt
```

### Einfaches Test-Framework:
```bash
#!/bin/bash

# Test-Funktionen
test_passed=0
test_failed=0

function assert_equals() {
    local expected="$1"
    local actual="$2"
    local message="$3"
    
    if [[ "$expected" == "$actual" ]]; then
        echo "✓ PASS: $message"
        ((test_passed++))
    else
        echo "✗ FAIL: $message"
        echo "  Expected: '$expected'"
        echo "  Actual: '$actual'"
        ((test_failed++))
    fi
}

function run_tests() {
    echo "=== Test Results ==="
    echo "Passed: $test_passed"
    echo "Failed: $test_failed"
    echo "Total: $((test_passed + test_failed))"
    
    if [[ $test_failed -gt 0 ]]; then
        exit 1
    fi
}

# Beispiel-Tests
assert_equals "hello" "$(echo hello)" "Echo test"
assert_equals "5" "$((2+3))" "Math test"

run_tests
```

### Test-Ausführung:
```bash
# Skript in sicherer Umgebung testen
bash -n skript.sh        # Syntax-Check ohne Ausführung
bash -x skript.sh        # Debug-Modus (zeigt alle Befehle)

# Automatisierte Tests
./test_suite.sh          # Alle Tests ausführen
```

## 12. Dateinamen für Skripte

### Naming Conventions:
```bash
# Gute Dateinamen:
backup_database.sh
user_management.py
system_monitor.pl
data_processor.rb

# Erlaubte Zeichen:
# - Buchstaben (a-z, A-Z)
# - Zahlen (0-9)
# - Underscore (_)
# - Minus/Bindestrich (-)
# - Punkt (.) für Dateierweiterung

# Vermeiden:
# - Leerzeichen
# - Sonderzeichen (@, #, $, %, etc.)
# - Umlaute (ä, ö, ü)
# - Sonderzeichen anderer Sprachen
```

### Best Practices:
```bash
# Beschreibende Namen verwenden
process_logs.sh          # Gut
script1.sh              # Schlecht

# Konsistente Namenskonvention
user_add.sh             # snake_case
user_delete.sh
user_modify.sh

# Oder:
userAdd.sh              # camelCase
userDelete.sh
userModify.sh

# Dateierweiterung verwenden
backup.sh               # Shell-Skript
backup.py               # Python-Skript
backup.pl               # Perl-Skript

# Versionsnummern
backup_v1.0.sh
backup_v1.1.sh

# Datum im Namen (für Logs/Backups)
backup_2024-03-15.sh
log_parser_20240315.sh
```

## 13. Script-Header Informationen

### Vollständiger Header-Template:
```bash
#!/bin/bash

#################################################################################
# Script Name:    backup_database.sh
# Description:    Erstellt tägliche Backups der Produktionsdatenbank
# Author:         Max Mustermann <max.mustermann@example.com>
# Created:        2024-03-15
# Last Modified:  2024-03-20
# Version:        1.2.0
# License:        MIT
# 
# Usage:          ./backup_database.sh [OPTIONS]
# 
# Options:        -d, --database    Name der Datenbank (erforderlich)
#                 -o, --output      Ausgabeverzeichnis (Standard: /backup)
#                 -c, --compress    Backup komprimieren (Standard: ja)
#                 -v, --verbose     Ausführliche Ausgabe
#                 -h, --help        Diese Hilfe anzeigen
# 
# Examples:       ./backup_database.sh -d production -o /backup/daily
#                 ./backup_database.sh --database test --verbose
# 
# Dependencies:   mysqldump, gzip, logger
# 
# Exit Codes:     0 - Erfolg
#                 1 - Allgemeiner Fehler
#                 2 - Ungültige Parameter
#                 3 - Datenbank nicht erreichbar
# 
# Notes:          - Benötigt MySQL-Client
#                 - Läuft als Cronjob um 02:00 Uhr
#                 - Logs werden nach /var/log/backup.log geschrieben
# 
# Changelog:      v1.0.0 - Initiale Version
#                 v1.1.0 - Komprimierung hinzugefügt
#                 v1.2.0 - Fehlerbehandlung verbessert
#################################################################################
```

### Minimaler Header:
```bash
#!/bin/bash
# File: simple_script.sh
# Author: Max Mustermann
# Date: 2024-03-15
# Description: Einfaches Beispiel-Skript
```

## 14. Shebang für Bash

### Shebang-Varianten:
```bash
#!/bin/bash              # Standard Bash-Shebang
#!/usr/bin/env bash      # Portable Bash-Shebang (findet bash im PATH)
#!/bin/sh                # POSIX-kompatible Shell
#!/usr/bin/bash          # Expliziter Bash-Pfad (manche Systeme)
```

### Warum `/usr/bin/env bash` verwenden:
```bash
# Vorteile von #!/usr/bin/env bash:
# - Funktioniert auf verschiedenen Systemen
# - bash wird im PATH gesucht
# - Portable zwischen Linux-Distributionen
# - Funktioniert auch wenn bash nicht in /bin/ ist

#!/usr/bin/env bash
echo "Dieses Skript ist portable!"
```

### Shebang mit Optionen:
```bash
#!/bin/bash -e           # Skript bei erstem Fehler beenden
#!/bin/bash -u           # Undefinierte Variablen als Fehler behandeln
#!/bin/bash -x           # Debug-Modus (alle Befehle anzeigen)
#!/bin/bash -euo pipefail # Kombination für sichere Skripte
```

## 15. Dateisuche

### `find` - Der mächtigste Suchbefehl:
```bash
# Grundlagen
find /pfad -name "dateiname"              # Nach Name suchen
find . -name "*.txt"                      # Alle .txt Dateien
find /home -name "*.log" -type f          # Nur Dateien, keine Verzeichnisse

# Nach Dateityp suchen
find . -type f                            # Nur Dateien
find . -type d                            # Nur Verzeichnisse
find . -type l                            # Nur Symbolische Links

# Nach Größe suchen
find . -size +10M                         # Größer als 10 MB
find . -size -1k                          # Kleiner als 1 KB
find . -size 100c                         # Exakt 100 Bytes

# Nach Änderungszeit suchen
find . -mtime -7                          # Geändert in letzten 7 Tagen
find . -mtime +30                         # Nicht geändert seit 30 Tagen
find . -mmin -60                          # Geändert in letzten 60 Minuten

# Nach Berechtigungen suchen
find . -perm 755                          # Exakte Berechtigung
find . -perm -755                         # Mindestens diese Berechtigung
find . -perm /u+w                         # User hat write-Berechtigung

# Kombination von Kriterien
find . -name "*.log" -size +1M -mtime -7  # .log Dateien, >1MB, <7 Tage alt

# Aktionen ausführen
find . -name "*.tmp" -delete              # Gefundene Dateien löschen
find . -name "*.txt" -exec ls -l {} \;    # ls für jede gefundene Datei
find . -type f -exec chmod 644 {} \;      # Rechte für alle Dateien setzen
```

### `locate` - Schnelle Dateisuche:
```bash
locate dateiname          # Schnelle Suche in Datenbank
locate "*.conf"           # Wildcards mit Anführungszeichen
updatedb                  # Datenbank aktualisieren (als root)
```

### `which` und `whereis`:
```bash
which bash               # Pfad zu einem Befehl finden
which -a python          # Alle Vorkommen im PATH
whereis ls               # Binärdatei, Quellcode und Manpage finden
```

## 16. Infokanäle (STDIN, STDOUT, STDERR)

### Die drei Standard-Streams:
- **STDIN (0):** Standard Input (Tastatur)
- **STDOUT (1):** Standard Output (Bildschirm)
- **STDERR (2):** Standard Error (Bildschirm)

### Ausgaben umleiten:
```bash
# STDOUT umleiten
ls > ausgabe.txt                    # Überschreiben
ls >> ausgabe.txt                   # Anhängen

# STDERR umleiten
ls nonexistent 2> fehler.txt        # Nur Fehler
ls nonexistent 2>> fehler.txt       # Fehler anhängen

# STDOUT und STDERR kombinieren
ls existiert nonexistent > alle.txt 2>&1    # Beide in eine Datei
ls existiert nonexistent &> alle.txt        # Kurzform (bash)

# Ausgaben unterdrücken
ls > /dev/null                      # STDOUT unterdrücken
ls 2> /dev/null                     # STDERR unterdrücken
ls > /dev/null 2>&1                 # Beide unterdrücken
ls &> /dev/null                     # Kurzform

# STDIN umleiten
sort < input.txt                    # Datei als Input
sort < input.txt > output.txt       # Input und Output umleiten
```

### Pipes (|):
```bash
# Verkettung von Befehlen
ls -l | grep ".txt"                 # ls Ausgabe an grep weiterleiten
ps aux | grep bash | wc -l          # Mehrere Pipes
find . -name "*.log" | xargs rm     # Gefundene Dateien löschen
```

### Here Documents und Here Strings:
```bash
# Here Document
cat << EOF > datei.txt
Zeile 1
Zeile 2
Zeile 3
EOF

# Here String
grep "pattern" <<< "test pattern here"
```

## 17. Textsuche mit grep

### Grundlegende grep-Verwendung:
```bash
grep "suchtext" datei.txt           # Einfache Suche
grep -i "suchtext" datei.txt        # Case-insensitive
grep -v "suchtext" datei.txt        # Invertiert (Zeilen OHNE suchtext)
grep -n "suchtext" datei.txt        # Mit Zeilennummern
grep -c "suchtext" datei.txt        # Anzahl der Treffer
```

### Erweiterte grep-Optionen:
```bash
grep -r "suchtext" verzeichnis/     # Rekursiv in Verzeichnis
grep -l "suchtext" *.txt            # Nur Dateinamen ausgeben
grep -L "suchtext" *.txt            # Dateien OHNE suchtext
grep -w "wort" datei.txt            # Nur ganze Wörter
grep -A 3 "suchtext" datei.txt      # 3 Zeilen nach Treffer
grep -B 2 "suchtext" datei.txt      # 2 Zeilen vor Treffer
grep -C 2 "suchtext" datei.txt      # 2 Zeilen vor und nach Treffer
```

### Reguläre Ausdrücke mit grep:
```bash
grep -E "pattern" datei.txt         # Erweiterte regex (-E oder egrep)
grep "^start" datei.txt             # Zeilen die mit "start" beginnen
grep "ende$" datei.txt              # Zeilen die mit "ende" enden
grep "[0-9]" datei.txt              # Zeilen mit Zahlen
grep "[a-zA-Z]" datei.txt           # Zeilen mit Buchstaben
grep "\." datei.txt                 # Punkt (escaped)
grep "a.b" datei.txt                # a, beliebiges Zeichen, b
grep "a*" datei.txt                 # Null oder mehr 'a'
grep "a+" datei.txt                 # Ein oder mehr 'a' (mit -E)
grep "a\{3\}" datei.txt             # Exakt 3 'a'
grep "a\{2,5\}" datei.txt           # 2 bis 5 'a'
```

### Praktische grep-Beispiele:
```bash
# IP-Adressen finden
grep -E "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" logfile.txt

# E-Mail-Adressen finden
grep -E "[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" datei.txt

# Fehler in Logs finden
grep -i "error\|fail\|exception" /var/log/application.log

# Leere Zeilen entfernen
grep -v "^$" datei.txt

# Kommentarzeilen finden
grep "^#" config.conf
```

## 18. Wildcards (Platzhalterzeichen)

### Grundlegende Wildcards:
```bash
*           # Beliebige Anzahl beliebiger Zeichen
?           # Genau ein beliebiges Zeichen
[abc]       # Ein Zeichen aus der Liste (a, b, oder c)
[a-z]       # Ein Zeichen aus dem Bereich a bis z
[!abc]      # Ein Zeichen NICHT aus der Liste
[^abc]      # Ein Zeichen NICHT aus der Liste (alternative Schreibweise)
```

### Wildcard-Beispiele:
```bash
# Datei-Operationen
ls *.txt                # Alle .txt Dateien
ls file?.txt            # file1.txt, file2.txt, etc.
ls file[123].txt        # file1.txt, file2.txt, file3.txt
ls file[1-9].txt        # file1.txt bis file9.txt
ls file[!1].txt         # Alle außer file1.txt

# Kopieren mit Wildcards
cp *.jpg backup/        # Alle JPG-Dateien kopieren
mv test*.log archive/   # Alle test*.log Dateien verschieben

# Erweiterte Patterns (mit shopt -s extglob)
ls file@(1|2|3).txt     # file1.txt, file2.txt, file3.txt
ls file+(1|2).txt       # file1.txt, file2.txt, file11.txt, file12.txt, etc.
ls file*(1|2).txt       # file.txt, file1.txt, file2.txt, file12.txt, etc.
```

### Brace Expansion:
```bash
echo {1,2,3}            # 1 2 3
echo file{1,2,3}.txt    # file1.txt file2.txt file3.txt
echo {a..z}             # a b c d ... x y z
echo {1..10}            # 1 2 3 4 5 6 7 8 9 10
echo {01..10}           # 01 02 03 04 05 06 07 08 09 10

# Praktische Anwendung
mkdir projekt{1,2,3}    # Erstellt projekt1, projekt2, projekt3
cp datei.txt{,.bak}     # Kopiert datei.txt zu datei.txt.bak
```

## 19. Parameter in Skripten

### Positionsparameter:
```bash
#!/bin/bash

# $0 = Skriptname
# $1 = Erster Parameter
# $2 = Zweiter Parameter
# usw.

echo "Skriptname: $0"
echo "Erster Parameter: $1"
echo "Zweiter Parameter: $2"
echo "Alle Parameter: $@"
echo "Anzahl Parameter: $#"

# Aufruf: ./skript.sh hello world
# Ausgabe:
# Skriptname: ./skript.sh
# Erster Parameter: hello
# Zweiter Parameter: world
# Alle Parameter: hello world
# Anzahl Parameter: 2
```

### Parameter verarbeiten:
```bash
#!/bin/bash

# Einfache Parameter-Verarbeitung
if [ $# -eq 0 ]; then
    echo "Verwendung: $0 <parameter1> [parameter2]"
    exit 1
fi

name="$1"
alter="${2:-unbekannt}"  # Standardwert wenn $2 leer

echo "Name: $name"
echo "Alter: $alter"

# Parameter verschieben
shift                    # $1 wird gelöscht, $2 wird zu $1, etc.
echo "Verbleibende Parameter: $@"
```

### Erweiterte Parameter-Verarbeitung mit getopts:
```bash
#!/bin/bash

# Optionen definieren
while getopts "f:o:vh" opt; do
    case $opt in
        f)
            input_file="$OPTARG"
            ;;
        o)
            output_file="$OPTARG"
            ;;
        v)
            verbose=true
            ;;
        h)
            echo "Verwendung: $0 -f input -o output [-v] [-h]"
            echo "  -f input    Input-Datei"
            echo "  -o output   Output-Datei"
            echo "  -v          Verbose-Modus"
            echo "  -h          Diese Hilfe"
            exit 0
            ;;
        \?)
            echo "Ungültige Option: -$OPTARG" >&2
            exit 1
            ;;
        :)
            echo "Option -$OPTARG benötigt ein Argument." >&2
            exit 1
            ;;
    esac
done

# Verbleibende Parameter verarbeiten
shift $((OPTIND-1))
echo "Verbleibende Parameter: $@"

# Aufruf: ./skript.sh -f input.txt -o output.txt -v param1 param2
```

### Long Options mit getopt:
```bash
#!/bin/bash

# Long options verarbeiten
TEMP=$(getopt -o f:o:vh --long file:,output:,verbose,help -n 'skript.sh' -- "$@")
eval set -- "$TEMP"

while true; do
    case "$1" in
        -f|--file)
            input_file="$2"
            shift 2
            ;;
        -o|--output)
            output_file="$2"
            shift 2
            ;;
        -v|--verbose)
            verbose=true
            shift
            ;;
        -h|--help)
            echo "Hilfe anzeigen"
            shift
            ;;
        --)
            shift
            break
            ;;
        *)
            echo "Interner Fehler!"
            exit 1
            ;;
    esac
done

# Aufruf: ./skript.sh --file input.txt --output output.txt --verbose
```

## 20. SSH/SCP - Dateien zwischen Systemen übertragen

### SSH (Secure Shell):
```bash
# Einfache SSH-Verbindung
ssh benutzer@server.example.com

# Mit spezifischem Port
ssh -p 2222 benutzer@server.example.com

# Mit privatem Schlüssel
ssh -i ~/.ssh/id_rsa benutzer@server.example.com

# Befehl remote ausführen
ssh benutzer@server.example.com "ls -la"
ssh benutzer@server.example.com "uptime && free -h"

# SSH-Tunnel erstellen
ssh -L 8080:localhost:80 benutzer@server.example.com  # Local forward
ssh -R 8080:localhost:80 benutzer@server.example.com  # Remote forward

# SSH ohne Passwort-Eingabe (X11 Forwarding deaktiviert)
ssh -o PasswordAuthentication=no benutzer@server.example.com
```

### SCP (Secure Copy):
```bash
# Datei zum Remote-Server kopieren
scp lokale_datei.txt benutzer@server.example.com:/pfad/zum/ziel/

# Datei vom Remote-Server kopieren
scp benutzer@server.example.com:/pfad/zur/datei.txt /lokaler/pfad/

# Verzeichnis rekursiv kopieren
scp -r lokales_verzeichnis/ benutzer@server.example.com:/ziel/pfad/

# Mit spezifischem Port
scp -P 2222 datei.txt benutzer@server.example.com:/pfad/

# Mit privatem Schlüssel
scp -i ~/.ssh/id_rsa datei.txt benutzer@server.example.com:/pfad/

# Mehrere Dateien kopieren
scp datei1.txt datei2.txt benutzer@server.example.com:/pfad/

# Progress anzeigen und verbose
scp -v datei.txt benutzer@server.example.com:/pfad/
```

### RSYNC (Alternative zu SCP):
```bash
# Grundlegende Synchronisation
rsync -av lokales_verzeichnis/ benutzer@server.example.com:/remote/pfad/

# Mit SSH und spezifischem Port
rsync -av -e "ssh -p 2222" datei.txt benutzer@server.example.com:/pfad/

# Nur Dateien synchronisieren die sich geändert haben
rsync -av --update lokales_verzeichnis/ benutzer@server.example.com:/remote/pfad/

# Dateien löschen die im Quellverzeichnis nicht mehr existieren
rsync -av --delete lokales_verzeichnis/ benutzer@server.example.com:/remote/pfad/

# Trockenlauf (nur anzeigen was gemacht würde)
rsync -avn lokales_verzeichnis/ benutzer@server.example.com:/remote/pfad/

# Progress anzeigen
rsync -av --progress datei.txt benutzer@server.example.com:/pfad/
```

### SSH-Konfiguration (~/.ssh/config):
```bash
# SSH-Config Datei erstellen
cat > ~/.ssh/config << EOF
Host server1
    HostName server.example.com
    User benutzer
    Port 2222
    IdentityFile ~/.ssh/id_rsa
    
Host server2
    HostName 192.168.1.100
    User admin
    IdentityFile ~/.ssh/server2_key
EOF

# Verwendung:
ssh server1              # Verwendet die gespeicherte Konfiguration
scp datei.txt server2:/pfad/
```

### SSH-Keys generieren und verwenden:
```bash
# SSH-Key generieren
ssh-keygen -t rsa -b 4096 -C "deine.email@example.com"
ssh-keygen -t ed25519 -C "deine.email@example.com"  # Moderne Alternative

# Public Key zum Server kopieren
ssh-copy-id benutzer@server.example.com
ssh-copy-id -i ~/.ssh/id_rsa.pub benutzer@server.example.com

# Manuell Public Key hinzufügen
cat ~/.ssh/id_rsa.pub | ssh benutzer@server.example.com "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
```

## 21. Arrays in Bash

### Array-Deklaration und -Initialisierung:
```bash
# Leeres Array erstellen
declare -a mein_array

# Array mit Werten initialisieren
früchte=("Apfel" "Banane" "Kirsche" "Dattel")
zahlen=(1 2 3 4 5)

# Array-Elemente einzeln setzen
tiere[0]="Hund"
tiere[1]="Katze"
tiere[2]="Vogel"

# Array aus String erstellen
string="eins zwei drei vier"
wörter=($string)

# Array aus Befehlsausgabe erstellen
dateien=($(ls *.txt))
```

### Array-Zugriff:
```bash
# Einzelne Elemente
echo ${früchte[0]}          # Erstes Element (Apfel)
echo ${früchte[1]}          # Zweites Element (Banane)
echo ${früchte[-1]}         # Letztes Element (Dattel)

# Alle Elemente
echo ${früchte[@]}          # Alle Elemente
echo ${früchte[*]}          # Alle Elemente (unterschiedlich bei Quoting)

# Array-Länge
echo ${#früchte[@]}         # Anzahl Elemente
echo ${#früchte[0]}         # Länge des ersten Elements

# Array-Indizes
echo ${!früchte[@]}         # Alle verfügbaren Indizes
```

### Array-Manipulation:
```bash
# Element hinzufügen
früchte+=("Erdbeere")       # Am Ende hinzufügen
früchte[5]="Traube"         # An spezifischen Index

# Element entfernen
unset früchte[1]            # Element an Index 1 entfernen
unset früchte               # Ganzes Array entfernen

# Array-Slice (Teilarray)
echo ${früchte[@]:1:2}      # 2 Elemente ab Index 1
echo ${früchte[@]:2}        # Alle Elemente ab Index 2

# Array kopieren
neue_früchte=("${früchte[@]}")

# Array sortieren
IFS=$'\n' sorted=($(sort <<<"${früchte[*]}")); unset IFS
```

### Praktische Array-Beispiele:
```bash
#!/bin/bash

# Beispiel 1: Datei-Verarbeitung
log_files=("/var/log/syslog" "/var/log/messages" "/var/log/auth.log")

for file in "${log_files[@]}"; do
    if [[ -f "$file" ]]; then
        echo "Verarbeite: $file"
        # Verarbeitung hier...
    else
        echo "Datei nicht gefunden: $file"
    fi
done

# Beispiel 2: Menu-System
menu_options=("Benutzer hinzufügen" "Benutzer löschen" "Benutzer auflisten" "Beenden")

for i in "${!menu_options[@]}"; do
    echo "$((i+1)). ${menu_options[i]}"
done

# Beispiel 3: Konfigurationswerte
declare -A config               # Assoziatives Array
config["database_host"]="localhost"
config["database_port"]="5432"
config["database_name"]="myapp"

echo "Verbinde zu: ${config[database_host]}:${config[database_port]}/${config[database_name]}"
```

## 22. Schleifen

### For-Schleifen:
```bash
# Einfache For-Schleife
for i in 1 2 3 4 5; do
    echo "Nummer: $i"
done

# For-Schleife mit Array
früchte=("Apfel" "Banane" "Kirsche")
for frucht in "${früchte[@]}"; do
    echo "Frucht: $frucht"
done

# For-Schleife mit Dateien
for datei in *.txt; do
    echo "Verarbeite: $datei"
done

# C-Style For-Schleife
for ((i=1; i<=10; i++)); do
    echo "Zähler: $i"
done

# For-Schleife mit Bereich
for i in {1..10}; do
    echo "Nummer: $i"
done

for i in {1..10..2}; do    # Mit Schrittweite
    echo "Ungerade: $i"
done

# For-Schleife mit seq
for i in $(seq 1 5); do
    echo "Seq: $i"
done
```

### While-Schleifen:
```bash
# Einfache While-Schleife
counter=1
while [ $counter -le 5 ]; do
    echo "Counter: $counter"
    ((counter++))
done

# While mit Datei lesen
while read -r zeile; do
    echo "Gelesen: $zeile"
done < datei.txt

# While mit Pipeline
cat datei.txt | while read -r zeile; do
    echo "Pipeline: $zeile"
done

# Endlos-Schleife
while true; do
    echo "Läuft endlos... (Strg+C zum Beenden)"
    sleep 1
done

# While mit Bedingung
while [[ -f "/tmp/running" ]]; do
    echo "Prozess läuft noch..."
    sleep 5
done
```

### Until-Schleifen:
```bash
# Until-Schleife (läuft bis Bedingung wahr wird)
counter=1
until [ $counter -gt 5 ]; do
    echo "Until Counter: $counter"
    ((counter++))
done

# Until mit Datei-Überwachung
until [[ -f "/tmp/finished" ]]; do
    echo "Warte auf Fertigstellung..."
    sleep 2
done
```

### Schleifenkontrolle:
```bash
# Break und Continue
for i in {1..10}; do
    if [[ $i -eq 3 ]]; then
        continue        # Überspringt Rest der aktuellen Iteration
    fi
    
    if [[ $i -eq 8 ]]; then
        break          # Verlässt die Schleife komplett
    fi
    
    echo "Nummer: $i"
done

# Nested Loops (verschachtelte Schleifen)
for i in {1..3}; do
    for j in {a..c}; do
        echo "i=$i, j=$j"
    done
done
```

### Praktische Schleifenbeispiele:
```bash
#!/bin/bash

# Beispiel 1: Backup mehrerer Verzeichnisse
backup_dirs=("/home/user/documents" "/home/user/pictures" "/etc")
backup_dest="/backup/$(date +%Y%m%d)"

mkdir -p "$backup_dest"

for dir in "${backup_dirs[@]}"; do
    if [[ -d "$dir" ]]; then
        echo "Sichere $dir..."
        tar -czf "$backup_dest/$(basename "$dir").tar.gz" "$dir"
    else
        echo "Verzeichnis nicht gefunden: $dir"
    fi
done

# Beispiel 2: Log-Dateien rotieren
for logfile in /var/log/myapp*.log; do
    if [[ -f "$logfile" && $(stat -c%s "$logfile") -gt 10485760 ]]; then  # > 10MB
        echo "Rotiere $logfile"
        mv "$logfile" "${logfile}.$(date +%Y%m%d_%H%M%S)"
        touch "$logfile"
    fi
done

# Beispiel 3: Service-Status prüfen
services=("apache2" "mysql" "redis")

for service in "${services[@]}"; do
    if systemctl is-active --quiet "$service"; then
        echo "✓ $service läuft"
    else
        echo "✗ $service ist gestoppt"
        echo "Starte $service..."
        systemctl start "$service"
    fi
done
```

## 23. Dateisystem-Navigation und Datei-Operationen

### Navigation:
```bash
# Verzeichnis wechseln
cd /path/to/directory     # Absoluter Pfad
cd ../                    # Ein Verzeichnis zurück
cd ../../                 # Zwei Verzeichnisse zurück
cd ~                      # Home-Verzeichnis
cd ~/Documents           # Unterverzeichnis im Home
cd -                     # Vorheriges Verzeichnis
cd                       # Home-Verzeichnis (ohne Parameter)

# Aktuelles Verzeichnis anzeigen
pwd                      # Print Working Directory
pwd -P                   # Physischer Pfad (löst Symlinks auf)

# Verzeichnis-Stack
pushd /tmp               # Wechselt zu /tmp und merkt sich aktuelles Verzeichnis
popd                     # Kehrt zum gemerkten Verzeichnis zurück
dirs                     # Zeigt Verzeichnis-Stack
```

### Dateien anzeigen:
```bash
# Dateiinhalt anzeigen
cat datei.txt            # Ganze Datei
head datei.txt           # Erste 10 Zeilen
head -n 20 datei.txt     # Erste 20 Zeilen
tail datei.txt           # Letzte 10 Zeilen
tail -n 15 datei.txt     # Letzte 15 Zeilen
tail -f datei.txt        # Verfolgt neue Zeilen (für Logs)

# Seitenweise anzeigen
less datei.txt           # Interaktive Anzeige
more datei.txt           # Einfache seitenweise Anzeige

# Datei-Eigenschaften
ls -l datei.txt          # Detaillierte Informationen
stat datei.txt           # Ausführliche Datei-Statistiken
file datei.txt           # Dateityp ermitteln
wc datei.txt             # Zeilen, Wörter, Zeichen zählen
wc -l datei.txt          # Nur Zeilen zählen
```

### Dateien erstellen:
```bash
# Leere Datei erstellen
touch neue_datei.txt
touch datei1.txt datei2.txt datei3.txt

# Datei mit Inhalt erstellen
echo "Hallo Welt" > neue_datei.txt
cat > datei.txt << EOF
Zeile 1
Zeile 2
Zeile 3
EOF

# Mehrere Dateien mit einem Befehl
touch file{1..10}.txt    # file1.txt bis file10.txt
```

### Dateien kopieren:
```bash
# Einfaches Kopieren
cp quelle.txt ziel.txt
cp quelle.txt /pfad/zum/zielverzeichnis/

# Verzeichnisse kopieren
cp -r quellverzeichnis/ zielverzeichnis/
cp -r /pfad/quelle/* /pfad/ziel/

# Erweiterte Optionen
cp -i quelle.txt ziel.txt        # Nachfragen bei Überschreibung
cp -u quelle.txt ziel.txt        # Nur kopieren wenn neuer
cp -v quelle.txt ziel.txt        # Verbose (zeigt was kopiert wird)
cp -p quelle.txt ziel.txt        # Erhält Berechtigungen und Zeitstempel

# Backup beim Kopieren
cp --backup=numbered quelle.txt ziel.txt
```

### Dateien verschieben/umbenennen:
```bash
# Verschieben
mv datei.txt /neuer/pfad/
mv datei1.txt datei2.txt /zielverzeichnis/

# Umbenennen
mv alter_name.txt neuer_name.txt

# Erweiterte Optionen
mv -i datei.txt ziel.txt         # Nachfragen bei Überschreibung
mv -u datei.txt ziel.txt         # Nur verschieben wenn neuer
mv -v datei.txt ziel.txt         # Verbose
```

### Dateien löschen:
```bash
# Dateien löschen
rm datei.txt
rm datei1.txt datei2.txt datei3.txt
rm *.tmp                         # Alle .tmp Dateien

# Verzeichnisse löschen
rmdir leeres_verzeichnis/        # Nur leere Verzeichnisse
rm -r verzeichnis/               # Rekursiv (mit Inhalt)
rm -rf verzeichnis/              # Force (keine Nachfragen)

# Sicherheitsoptionen
rm -i datei.txt                  # Nachfragen vor Löschung
rm -v datei.txt                  # Verbose
```

### Verzeichnisse erstellen:
```bash
# Einfaches Verzeichnis
mkdir neues_verzeichnis

# Mehrere Verzeichnisse
mkdir dir1 dir2 dir3

# Verschachtelte Verzeichnisse
mkdir -p pfad/zu/tiefem/verzeichnis

# Mit spezifischen Berechtigungen
mkdir -m 755 verzeichnis
mkdir -m 700 privates_verzeichnis
```

### Symbolische Links:
```bash
# Symbolischen Link erstellen
ln -s /pfad/zur/originaldatei linkname
ln -s /pfad/zum/verzeichnis/ link_zum_verzeichnis

# Hard Link erstellen
ln originaldatei hardlink

# Link-Informationen anzeigen
ls -l linkname               # Zeigt Ziel des Links
readlink linkname           # Zeigt nur den Zielpfad
readlink -f linkname        # Folgt allen Links bis zum Ende
```

## 24. Bash-Skript erstellen und ausführen

### Skript-Erstellung Schritt für Schritt:

#### 1. Neue Skript-Datei erstellen:
```bash
# Mit einem Editor erstellen
nano mein_skript.sh
vim mein_skript.sh
emacs mein_skript.sh

# Oder mit echo/cat
cat > mein_skript.sh << 'EOF'
#!/bin/bash
echo "Hallo Welt!"
EOF
```

#### 2. Vollständiges Beispiel-Skript:
```bash
#!/bin/bash

#################################################################################
# Script Name:    system_info.sh
# Description:    Zeigt Systeminformationen an
# Author:         Max Mustermann
# Created:        2024-03-15
# Version:        1.0.0
#################################################################################

# Fehlerbehandlung aktivieren
set -euo pipefail

# Variablen definieren
SCRIPT_NAME=$(basename "$0")
LOG_FILE="/tmp/${SCRIPT_NAME%.*}.log"

# Funktionen definieren
function show_usage() {
    echo "Verwendung: $SCRIPT_NAME [OPTIONEN]"
    echo "Optionen:"
    echo "  -h, --help     Diese Hilfe anzeigen"
    echo "  -v, --verbose  Ausführliche Ausgabe"
    echo "  -l, --log      Ausgabe in Logdatei schreiben"
}

function log_message() {
    local message="$1"
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo "[$timestamp] $message" | tee -a "$LOG_FILE"
}

function show_system_info() {
    echo "=== System Information ==="
    echo "Hostname: $(hostname)"
    echo "Datum: $(date)"
    echo "Uptime: $(uptime -p)"
    echo "Benutzer: $(whoami)"
    echo "Aktuelle Shell: $SHELL"
    echo "Arbeitsverzeichnis: $(pwd)"
    
    echo ""
    echo "=== Hardware Information ==="
    echo "CPU: $(grep 'model name' /proc/cpuinfo | head -1 | cut -d: -f2 | xargs)"
    echo "RAM: $(free -h | grep Mem | awk '{print $2}')"
    echo "Festplatte: $(df -h / | tail -1 | awk '{print $2 " (verwendet: " $3 ", frei: " $4 ")"}')"
    
    echo ""
    echo "=== Netzwerk Information ==="
    echo "IP-Adressen:"
    ip -4 addr show | grep inet | grep -v '127.0.0.1' | awk '{print "  " $2}'
}

# Hauptprogramm
main() {
    local verbose=false
    local use_log=false
    
    # Parameter verarbeiten
    while [[ $# -gt 0 ]]; do
        case $1 in
            -h|--help)
                show_usage
                exit 0
                ;;
            -v|--verbose)
                verbose=true
                shift
                ;;
            -l|--log)
                use_log=true
                shift
                ;;
            *)
                echo "Unbekannte Option: $1" >&2
                show_usage
                exit 1
                ;;
        esac
    done
    
    # Logging setup
    if [[ "$use_log" == true ]]; then
        log_message "Skript gestartet"
        exec > >(tee -a "$LOG_FILE")
        exec 2> >(tee -a "$LOG_FILE" >&2)
    fi
    
    # Verbose Modus
    if [[ "$verbose" == true ]]; then
        echo "Verbose Modus aktiviert"
        echo "Logdatei: $LOG_FILE"
        echo ""
    fi
    
    # Hauptfunktion ausführen
    show_system_info
    
    if [[ "$use_log" == true ]]; then
        log_message "Skript beendet"
    fi
}

# Skript starten
main "$@"
```

#### 3. Skript ausführbar machen:
```bash
# Ausführungsrechte setzen
chmod +x mein_skript.sh
chmod 755 mein_skript.sh

# Rechte überprüfen
ls -l mein_skript.sh
```

#### 4. Skript ausführen:
```bash
# Aus aktuellem Verzeichnis
./mein_skript.sh

# Mit absolutem Pfad
/pfad/zum/mein_skript.sh

# Mit bash explizit aufrufen
bash mein_skript.sh

# Mit Parametern
./mein_skript.sh --verbose --log

# Im Hintergrund ausführen
./mein_skript.sh &

# Mit nohup (läuft weiter nach Logout)
nohup ./mein_skript.sh &
```

#### 5. Debugging und Fehlerbehebung:
```bash
# Syntax prüfen ohne Ausführung
bash -n mein_skript.sh

# Debug-Modus (zeigt jeden Befehl)
bash -x mein_skript.sh

# Oder im Skript selbst:
#!/bin/bash -x

# Verbose Modus
bash -v mein_skript.sh

# Kombiniert
bash -vx mein_skript.sh

# Debugging im Skript einbauen
set -x    # Debug-Modus ein
# ... Code ...
set +x    # Debug-Modus aus
```

#### 6. Skript installieren:
```bash
# In lokales bin-Verzeichnis kopieren
mkdir -p ~/bin
cp mein_skript.sh ~/bin/
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc

# Systemweit installieren (als root)
sudo cp mein_skript.sh /usr/local/bin/
sudo chmod 755 /usr/local/bin/mein_skript.sh

# Ohne .sh Endung verfügbar machen
sudo cp mein_skript.sh /usr/local/bin/system_info
```

### Best Practices für Bash-Skripte:

```bash
#!/bin/bash

# Strenge Fehlerbehandlung
set -euo pipefail

# Variablen immer in Anführungszeichen
echo "$variable" statt echo $variable

# Lokale Variablen in Funktionen
function meine_funktion() {
    local lokale_var="wert"
    echo "$lokale_var"
}

# Sichere temporäre Dateien
temp_file=$(mktemp)
trap 'rm -f "$temp_file"' EXIT

# Input validieren
if [[ $# -eq 0 ]]; then
    echo "Fehler: Keine Parameter angegeben" >&2
    exit 1
fi

# Absolute Pfade verwenden
readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly CONFIG_FILE="$SCRIPT_DIR/config.conf"
```

---
