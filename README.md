# XML + XSLT Viewer

Kleine, client-seitige "Software" zum Laden lokaler XML- und XSL-Dateien im Browser und zur Anzeige der transformierten Ansicht.

Verwendung

1. Öffne `index.html` im Browser (Doppelklick reicht in der Regel).
2. Wähle deine lokale `*.xml`-Datei (und optional die `*.xsl`-Datei) über die Dateiauswahl.
3. Klicke auf "Anwenden". Das Ergebnis wird unten angezeigt.
4. Du kannst das Ergebnis mit "Export als HTML" herunterladen.

Hinweis

- In den meisten Browsern funktioniert diese Seite direkt ohne Webserver (FileReader wird verwendet). Manche Browser beschränken lokale XSLT-Operationen oder Dateizugriffe — in diesem Fall starte einen einfachen lokalen Server und öffne die Seite per http.

  Beispiel mit Python (falls installiert):

  ```bash
  python3 -m http.server 8000
  # dann im Browser: http://localhost:8000/index.html
  ```

Branch

Die Dateien wurden in den Branch `serve-xml-xslt` gelegt.

