# Lernportfolio
## 13.05.2025
Heute haben wir unsere VM eingerichtet und einen Einstiegstest geschrieben.

## 20.05.2025
Heute habe ich mit den Grundlagen der BASH-Scriptsprache (Linux/Unix) begonnen, indem ich die README-4.md durchgearbeitet habe. Hier ist mein persönliches Tutorial, was ich heute gelernt habe:

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

## 27.05.2025
Heute habe ich die praktischen BASH-Übungen durchgearbeitet und meine theoretischen Kenntnisse in die Praxis umgesetzt. Es war sehr lehrreich, die Konzepte hands-on anzuwenden!

### BASH-Übungen - Praxiserfahrungen
#### Übung 1: Navigation im Dateisystem gemeistert
- Sichere Navigation zwischen verschiedenen Verzeichnissen geübt
- Unterschied zwischen absoluten (`/var/log`) und relativen (`../network/`) Pfadangaben praktisch angewendet
- Wechsel zwischen `/var/log`, `/etc/udev`, `/etc/network` und `/dev/` erfolgreich durchgeführt
- **Wichtige Erkenntnis**: Relative Pfadangaben sind oft effizienter, besonders bei der täglichen Arbeit

#### Übung 2: Wildcards und Braces intensiv genutzt
- Verzeichnisstruktur mit `Docs` und `Ordner` aufgebaut
- Dateien `file1` bis `file10` mit `touch` erstellt
- **Wildcards in Aktion**:
  - `*1*` zum Löschen aller Dateien mit "1" im Namen
  - `{2,4,7}` um spezifische Dateien auf einmal zu löschen
  - `*` für alle restlichen Dateien
- Verzeichnisse kopiert mit `cp -r Ordner Ordner2`
- Verschachtelte Verzeichnisstrukturen erstellt (`Ordner2/Ordner3`)
- Umbenennung mit `mv` durchgeführt
- **Lernerfolg**: Wildcards und Braces sparen enorm viel Zeit bei Batch-Operationen!

#### Übung 3: Tilde-Expansions praktisch erkundet
- Alle Tilde-Variationen systematisch getestet:
  - `~` für Home-Verzeichnis
  - `~+` für aktuelles Arbeitsverzeichnis 
  - `~-` für vorheriges Verzeichnis
- **Praktischer Nutzen**: Besonders `~-` ist sehr hilfreich beim Wechseln zwischen zwei Arbeitsverzeichnissen

#### Übung 4: Text-Processing mit grep, cut und awk
**a) grep-Patterns gemeistert:**
- Testdatei mit verschiedenen Textzeilen erstellt
- Mustersuche mit `grep --color=auto` durchgeführt:
  - Einfache Textsuche (`obelix`, `2`, `e`)
  - Negation mit `grep -v gamma`
  - Regex mit `grep -E '[123]'` für Zahlenbereiche
- **Erkenntnis**: Die `--color=auto` Option macht Suchergebnisse viel übersichtlicher!

**b) cut-Befehle für Feldextraktion:**
- Felder vor dem ersten `:` mit `cut -d':' -f1`
- Mittlere Felder mit `cut -d':' -f2`
- Letzte Felder mit `cut -d':' -f3`
- **Praktischer Nutzen**: Perfect für CSV-ähnliche Datenverarbeitung

**c) awk für dynamische Feldverarbeitung:**
- Komplexere Feldextraktion zwischen letztem und zweitletztem `:` 
- **Vorteil von awk**: Flexibler als cut, funktioniert unabhängig von der Anzahl Separatoren

#### Übung 5: Regex-Power für Fortgeschrittene
- **dmesg-Pattern analysiert**: `dmesg | egrep '[0-9]{4}:[0-9]{2}:[0-9a-f]{2}.[0-9]'`
  - Sucht nach Hardware-IDs im Format `1234:56:78.9`
  - Typisch für PCI-Device-IDs in Kernel-Meldungen
- **IP-Adressen-Extraktion**: `ifconfig | grep -oE '((1?[0-9][0-9]?|2[0-4][0-9]|25[0-5])\.){3}(1?[0-9][0-9]?|2[0-4][0-9]|25[0-5])'`
  - Komplexe Regex für gültige IP-Adressen (0.0.0.0 bis 255.255.255.255)
  - **Beeindruckend**: Wie präzise man mit Regex arbeiten kann!

#### Übung 6: Stream-Redirection und Here-Documents
**a) Here-Document mit cat:**
- Textdatei erstellt mit `cat << END`
- Zeile für Zeile eingegeben bis zum Schlusswort `END`
- **Praktisch**: Sehr nützlich für längere Texte ohne externe Editoren

**b) Fehlerumleitung:**
- `ls -z 2> /root/errorsLs.log` für stderr-Umleitung
- **Wichtig**: Fehlerkanal (2) separat von Standardausgabe behandeln

**c) Ausgabeumleitung verstanden:**
- Unterschied zwischen `>` (überschreiben) und `>>` (anhängen) praktisch erprobt
- **Vorsicht**: `>` überschreibt komplett, `>>` hängt an!

**d/e) Praktische Stream-Umleitung:**
- `whoami > info.txt` für neue Datei
- `id >> info.txt` zum Anhängen
- **Workflow**: Ideal für Log-Dateien und Reporterstellung

**f) Pipe-Verarbeitung:**
- `wc -w < info.txt` für Wortzählung aus Datei
- **Erkenntnisse**: Pipes und Umleitung sind das Herzstück der UNIX-Philosophie

### Wichtigste Erkenntnisse des Tages:
1. **Effizienz durch Wildcards**: Batch-Operationen sparen enorme Zeit
2. **Regex-Power**: Mächtige Mustersuche für komplexe Datenfilterung  
3. **Stream-Konzept**: stdin/stdout/stderr sind fundamental für UNIX-Arbeitsweise
4. **Text-Processing-Tools**: grep, cut, awk bilden ein mächtiges Trio
5. **Praktische Anwendung**: Theoriewissen wird erst durch Übung zu echtem Können


## 03.06.2025
Heute habe ich mich intensiv mit fortgeschrittenen BASH-Scripting und Systemadministration beschäftigt. Es war ein sehr praktischer Tag mit zwei umfangreichen Aufgabenblöcken, die mein Verständnis für Automatisierung und Systemverwaltung deutlich erweitert haben.

### Fortgeschrittenes BASH-Scripting - Systemadministration

#### Aufgabenblock 1: Automatisierung und Netzwerk-Tools

**1. Benutzer-Massenanlage:**
- Script entwickelt, das Benutzernamen aus Textdatei liest und automatisch Accounts erstellt
- **Verwendete Befehle**: `useradd` mit `cat` für Batch-Processing
- **Erkenntniss**: Parameter-Übergabe macht Scripts flexibel und wiederverwendbar
- **Praktischer Nutzen**: Spart enorm Zeit bei der Verwaltung vieler Benutzer

**2. Gruppen-Management automatisiert:**
- Erweiterte Benutzerverwaltung mit automatischer Gruppenzuordnung
- **Techniken gelernt**:
  - `groupadd` für neue Gruppen
  - `usermod` für Gruppenzuweisungen
  - Unterscheidung zwischen Initial login group und Supplementary groups
- **Wichtige Erkenntnis**: Gruppenverwaltung ist essentiell für Berechtigungskonzepte

**3. Datei-Archivierung mit find und tar:**
- Komplex-Script für Backup-Automatisierung entwickelt
- **Workflow**: Dateien finden → kopieren → archivieren → aufräumen
- **Verwendete Tools**:
  - `find` mit Besitzer-Filter
  - `tar -czf` für komprimierte Archive  
  - `date` für Zeitstempel in Dateinamen
- **Praktischer Wert**: Grundlage für professionelle Backup-Strategien

**4. Netzwerk-Scanning und PING-Sweep:**
- Automatische Netzwerk-Erkundung programmiert
- **Technischer Ablauf**:
  - Eigene IP mit `ifconfig` und `grep` ermitteln
  - Subnetz-Berechnung durchgeführt
  - PING-Sweep für Host-Discovery
  - Aktive Hosts in Textdatei gespeichert
- **Systemadmin-Relevanz**: Wichtig für Netzwerk-Monitoring und -Security

**5. Web-Scraping Challenge (Zürich Events):**
- Fortgeschrittenes Script für Event-Abfrage von eventkalender.ch
- **Web-Technologien**: `curl` für HTTP-Requests
- **Data-Processing**: `grep` und `cut` für HTML-Parsing
- **Flexibilität**: Erweiterung auf beliebige Städte und Datumseingabe
- **Wow-Moment**: Wie mächtig simple BASH-Tools für Web-Automatisierung sind!

#### Aufgabenblock 2: Systemdienste und erweiterte Administration

**1. Cron-Jobs und automatisierte Aufräumung:**
- `/root/trash` Verzeichnis mit Auto-Cleanup erstellt
- **Cron-Syntax gelernt**: `*/5 * * * * /path/to/cleanup-script.sh`
- **Testen und Verifikation**: Script-Funktionalität über Zeitverlauf validiert
- **Praktischer Nutzen**: Automatische Systemwartung ohne manuellen Eingriff

**2. Netzwerk-Security mit IP-Banning:**
- Script für dynamisches IP-Management entwickelt
- **Funktionen**: Ban/Unban von IP-Adressbereichen
- **Tools recherchiert**: iptables, fail2ban, UFW als Optionen
- **Security-Aspekt**: Wichtig für Intrusion Prevention und DDoS-Schutz

**3. Automatisierte Benutzer-/Gruppenerstellung:**
- Skalierung der Scripts aus Aufgabenblock 1
- **Automatisierung maximiert**: Komplette User-Management-Pipeline
- **Wiederverwendbarkeit**: Scripts für verschiedene Szenarien anpassbar
- **Enterprise-Relevanz**: So funktioniert Benutzerverwaltung in größeren Umgebungen

**4. Erweiterte Dateiberechtigungen:**
- Komplexe Ordnerstruktur mit speziellen Berechtigungen erstellt
- **Neue Konzepte gelernt**:
  - **SGID-Bit (s)**: Gruppenberechtigung wird vererbt
  - **Sticky-Bit (T)**: Nur Eigentümer kann eigene Dateien löschen
- **chmod-Expertise**: Oktal-Notation für komplexe Berechtigungen
- **Sicherheits-Relevanz**: Fundamental für sicheres Multi-User-System

### Wichtigste Erkenntnisse und Skills des Tages:

#### 1. Systemadministration-Mindset entwickelt:
- **Automatisierung first**: Wiederholbare Aufgaben sollten skriptiert werden
- **Parameter-driven Scripts**: Flexibilität durch Eingabe-Parameter
- **Error-Handling**: Robuste Scripts mit Fehlerbehandlung

#### 2. Fortgeschrittene BASH-Techniken:
- **File-Processing**: Massenverarbeitung von Textdateien
- **Network-Tools**: Integration von Netzwerk-Commands in Scripts
- **Web-Integration**: HTTP-Requests und HTML-Parsing mit Standard-Tools

#### 3. Systemsicherheit verstanden:
- **Benutzer-/Gruppenverwaltung**: Basis für Zugriffskontrolle
- **Spezielle Dateiberechtigungen**: SGID und Sticky-Bit für erweiterte Sicherheit
- **Network-Security**: IP-Banning als Schutzmaßnahme

#### 4. Automatisierung und Scheduling:
- **Cron-Jobs**: Zeitgesteuerte Automatisierung
- **Backup-Strategien**: Automatische Archivierung
- **Monitoring**: Automatische Netzwerk-Überwachung

#### 5. Problem-Solving und Research:
- **Dokumentation nutzen**: Onlinebücher als Referenz
- **Tool-Recherche**: Verschiedene Lösungsansätze evaluieren
- **Testing und Validation**: Scripts gründlich testen

### Professionelle Entwicklung:
**Heute habe ich den Sprung von "BASH-User" zu "System-Administrator" gemacht!** Die Kombination aus Scripting, Systemverwaltung und Automatisierung zeigt mir, wie mächtig die UNIX/Linux-Umgebung für professionelle IT-Administration ist.

