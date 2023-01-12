# Stream-Deck-und-Fireboard-Integration
Mit Hilfe eines Elgato Stream Decks den Status von Fahrzeugen in Fireboard setzen. Hierzu wird die Fireboard-API verwendet um einen Fahrzeugstatus im Fireboard-Portal zu setzen. Im lokalen Fireboard wird der Status periodisch (kürzestes Intervall ist 30 Sekunden) abgefragt und eingetragen. Zeitgleich wird der Status in Alamos/FE2 ebenfalls gesetzt

## Voraussetzungen:
- Fireboard Authkey: https://login.fireboard.net/account/authkeys
- Elgato Stream Deck
- Curl (sollte bei Windows mittlerweile standardmäßig installiert sein. In der Kommandozeile "curl --version" sollte Klarheit verschaffen)
- Alamos/FE2

## Konfiguration
- in der .bat Datei
  - die Einheitenkennung anpassen
  - Den Fireboard Authkey eintragen
- In Streamdeck
  - Die Oberfläche wie gewünscht anlegen
  - Ein Button mit der Funktion "Öffnen" (System -> Öffnen) versehen
  - Titel beliebig angeben
  - In das Feld "Datei" folgendes eintragen: ```cmd.exe /c ""D:\status.bat" 01/19-01 1" ``` Das Verzeichnis entsprechend anpassen und die Rufnamen/Status je Fahrzeug natürlich auch.
- In Alamos
  - Als Alarmeingang "Externe Schnittstelle" hinzufügen
  - Dabei einen gültigen Absender festlegen. Dieser muss im API-Aufruf entsprechend hinterlegt sein.

## Bedienung
- Jeder Button ist einem Fahrzeug und dessen Status zugewiesen. Für die Statusmeldungen 1, 2, 3 und 4 werden daher vier Buttons belegt.
- Es können beliebig viele Ordner und Unterordner erstellt werden. Auch eine Navigation über verschiedene "Seiten" ist im Stream Deck möglich um viele Fahrzeuge abzubilden.

## Bekannte Einschränkungen
- Aktuell wird ein erfolgreich gesetzter Status nicht per Stream Deck zurück gemeldet

## Beispiel
![Stream Deck Beispiel](https://github.com/DerRheingold/Stream-Deck-und-Fireboard-Integration/blob/main/Streak%20Deck.jpg)
