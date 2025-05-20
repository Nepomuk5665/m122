
# Lernportfolio

## 13.05.2025

Heute haben wir unsere VM eingerichtet und einen Einstiegstest geschrieben.



## 20.05.2025

Huete habe ich mit den Grundlagen der BASH-Scriptsprache (Linux/Unix) begonnen, indem ich die README-4.md durchgearbeitet habe. Hier ist mein persönliches Tutorial, was ich heute gelernt habe:

### BASH-Grundlagen - Mein Lerntagebuch

#### 1. Linux-Umgebung und Terminal
- Der Linux-Prompt folgt dem Schema `<username>@<hostname>:<aktuelles_verzeichnis> $`
- Die Tilde `~` steht für das Home-Verzeichnis des aktuellen Benutzers
- Wichtige Tastenkürzel im Terminal:
  - `Tab` für Autovervollständigung
  - `Pfeil nach oben/unten` um durch vorherige Befehle zu navigieren
  - `Strg+C` um Prozesse abzubrechen
- Mit `man <befehl>` und `--help` kann ich Hilfe zu Befehlen erhalten

#### 2. Wichtige Befehle für die Navigation
- `pwd` zeigt das aktuelle Verzeichnis an
- `cd` wechselt Verzeichnisse (mit `cd ~` zum Home-Verzeichnis)
- `ls` listet Verzeichnisinhalte auf (mit `-la` für detaillierte Ansicht)
- `mkdir` erstellt Verzeichnisse
- `rmdir` entfernt leere Verzeichnisse
- `touch` erstellt eine leere Datei
- `rm` löscht Dateien (mit `-r` für Verzeichnisse)
- `find` sucht Dateien in Verzeichnissen und Unterverzeichnissen

#### 3. Pfadangaben verstanden
- Absolute Pfade beginnen mit `/` (Root-Verzeichnis)
- Relative Pfade beziehen sich auf das aktuelle Verzeichnis
- `.` steht für das aktuelle Verzeichnis
- `..` steht für das übergeordnete Verzeichnis

#### 4. Dateioperationen und nützliche Tools
- `cp` kopiert Dateien und Verzeichnisse
- `mv` verschiebt oder benennt Dateien/Verzeichnisse um
- `cat` zeigt Dateiinhalte an
- `echo` gibt Text in der Konsole aus
- `wc -l` zählt Zeilen in einer Datei

#### 5. Wildcards und erweiterte Funktionen
- `*` steht für beliebig viele Zeichen
- `?` steht für ein einzelnes Zeichen
- `{1,2,3}` erstellt Alternativen (z.B. `touch file{1,2,3}.txt`)
- `{1..9}` erstellt Bereiche (z.B. `touch file{1..9}.txt`)

#### 6. Aliase für Kurzbefehle
- Mit `alias ll='ls -alFG'` kann ich Kurzbefehle erstellen
- Sehr nützlich für häufig verwendete Befehlsfolgen

#### 7. Tilde-Expansion
- `~` für Home-Verzeichnis des aktuellen Benutzers
- `~+` für aktuelles Arbeitsverzeichnis
- `~-` für zuvor besuchtes Verzeichnis

#### 8. Mein erstes Shell-Script erstellt
- Scripts beginnen mit der Shebang-Zeile `#!/bin/bash`
- Ein Script muss mit `chmod +x scriptname.sh` ausführbar gemacht werden
- Ausführen mit `./scriptname.sh`

#### 9. Variablen in BASH
- Zuweisung ohne Leerzeichen: `name="Hans"`
- Zugriff mit $: `echo $name`
- Befehlsausgabe speichern: `datum=$(date +%Y_%m_%d)`
- Kennenlernen wichtiger Systemvariablen wie $HOME, $PATH, $PWD

#### 10. Ein- und Ausgabe verstanden
- `stdin` (0) - Standardeingabekanal
- `stdout` (1) - Standardausgabekanal
- `stderr` (2) - Standardfehlerausgabekanal
- Umleitung mit `>` (überschreiben) und `>>` (anhängen)
- Pipelines mit `|` zum Verketten von Befehlen

Morgen werde ich mit arithmetischen Operationen, Kontrollstrukturen (Schleifen, if/else), Arrays und komplexeren Scriptfunktionen weitermachen.
