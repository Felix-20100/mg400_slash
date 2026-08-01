# Guía de Traspaso y Desarrollo: Manual Técnico Dobot MG400

Esta guía documenta la arquitectura del proyecto, los cambios implementados y las instrucciones necesarias para que cualquier desarrollador o IA pueda continuar con el mantenimiento y evolución del manual técnico interactivo del robot Dobot MG400.

---

## 1. Información del Repositorio y Perfil
* **Perfil de GitHub del Propietario:** [https://github.com/Felix-20100](https://github.com/Felix-20100)
* **Repositorio de Código (GitHub):** [https://github.com/Felix-20100/mg400_slash](https://github.com/Felix-20100/mg400_slash)
* **Sitio Web en Producción (GitHub Pages):** [https://felix-20100.github.io/mg400_slash/](https://felix-20100.github.io/mg400_slash/)
* **Ruta de Trabajo Local:** `c:\Users\garci\Videos\amanual_mg400\`

---

## 2. Arquitectura del Proyecto
El sitio web está estructurado de manera modular y estática utilizando un generador basado en scripting:

* **Archivo de Origen (`index.html.html`):** Contiene todo el contenido original estructurado del manual técnico. Se edita este archivo para agregar o cambiar información permanente.
* **Compilador (`generate_pages.ps1`):** Script de PowerShell que parsea, extrae secciones de `index.html.html` y compila las vistas HTML finales para cada sección.
* **Directorio de Salida (`manual-mg400/`):** Carpeta de compilación intermedia. Tras compilar, el script copia automáticamente todo el contenido a la raíz de la ruta local para su publicación directa en la rama `main` de GitHub.
* **Carpetas del Sitio:**
  * `hardware/`: Páginas y especificaciones del robot y configuración de red.
  * `software/`: Guías de DobotStudio Pro y programación en Python.
  * `blockly/`: Librería interactiva y diccionario de bloques Blockly.
  * `practicas/`: Guías secuenciales de paletizado, laboratorios y retos.
  * `media/`: Capturas de pantalla, diagramas SVG y logotipos oficiales.

---

## 3. Funcionalidades Clave y Cambios Implementados
Durante el desarrollo se realizaron las siguientes optimizaciones de alto nivel:

1. **Asistente Dem (Mascota Chibi):**
   * Ubicado en la esquina inferior derecha. Al hacer clic se abre el panel de chat.
   * **Flujo Horizontal:** Se configuró para abrirse a la izquierda de la mascota (sin subir de altura la pantalla).
   * **Efecto Nube:** Diseñado en CSS con círculos flotantes simulando una nube de diálogo físico.
   * **Escala Dinámica:** Dem se encoge de forma interactiva al `75%` de su tamaño cuando el chat está abierto para ahorrar espacio, y regresa al `100%` al cerrarse.
   * **Buscador y Accesos Rápidos:** Cuenta con botones directos para los temas más solicitados e indexación de búsqueda integrada.
   * **Compatibilidad de Letras:** Se aplicaron códigos Unicode en JS y entidades HTML en emojis para evitar que el compilador rompa los acentos (`á`, `ó`) y emojis.

2. **Optimización Visual y Modo Oscuro:**
   * Contraste mejorado en modo oscuro/claro para textos, tablas y diagramas.
   * Inversión automática de logotipos (UPT, RoCo, MFG) en modo oscuro para que no desaparezcan.
   * Eliminación completa de colores y brillos neón.

3. **Imágenes y Transcripciones:**
   * Imágenes de hardware, software y códigos de bloques rediseñadas para ser más grandes y legibles.
   * Transcripción de texto completa de las capturas de código en lugar de usar imágenes puras.

4. **Progressive Web App (PWA):**
   * Integración de `manifest.json` y Service Worker `sw.js` para permitir la instalación directa del manual en el escritorio de la computadora o en la pantalla de inicio del celular.
   * Añadido archivo `.nojekyll` en la raíz para asegurar que GitHub Pages cargue los assets y archivos PWA sin bloqueos del compilador por defecto de GitHub.

5. **Copyright y Licencia:**
   * Eliminación de "Todos los derechos reservados". Copyright limpio asignado a: `© 2026 Maria Fernanda Garcia Garcia.`

---

## 4. Instrucciones de Compilación y Git

Para aplicar cualquier cambio que realices en `index.html.html` o en los scripts del compilador:

1. **Ejecutar el Compilador:**
   Abre PowerShell en la ruta local y ejecuta:
   ```powershell
   powershell -ExecutionPolicy Bypass -File .\generate_pages.ps1
   ```
2. **Subir los cambios a GitHub:**
   ```bash
   git add .
   git commit -m "Descripción de las mejoras realizadas"
   git push origin main
   ```
