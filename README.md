# Manual MG400 con Dem

Pagina web del manual del Dobot MG400 con una mascota asistente llamada Dem.

## Archivos principales

- `_Manual MG400/index.html`: pagina principal con la interfaz del manual y Dem.
- `manual-mg400/`: version generada/publicable del manual.
- `blockly/`, `hardware/`, `software/`, `practicas/`, `paletizado/`: secciones del contenido.
- `media/` e `img/`: recursos visuales usados por las paginas.

## Dem

Dem es una mascota tipo toro magico que acompana al usuario en la pagina. En esta version funciona en frontend:

- Boton de chat flotante.
- Respuestas basadas en el contenido y enlaces del sitio.
- Entiende sinonimos comunes como `Blockly`, `codigo por bloques`, `bloques` y `programacion por bloques`.
- Puede redirigir a secciones o paginas relacionadas.
- Tiene animaciones internas de estado: mirar, pensar, celebrar, dormir, despertar, destellos y arrastre por pantalla.

## Como usar

Abre:

```txt
_Manual MG400/index.html
```

Tambien puede publicarse desde la carpeta que use el hosting del proyecto, segun el flujo de despliegue.

## Siguiente paso recomendado

Lo logico para continuar es conectar Dem con IA real:

1. Indexar el contenido HTML/PDF/DOCX/TXT del manual.
2. Guardar embeddings en una base vectorial.
3. Usar un endpoint backend para responder con contexto del manual.
4. Mantener el chat frontend como interfaz visual.
5. Agregar pruebas para sinonimos, redireccion y respuestas por seccion.

La version actual no llama APIs externas; todo corre localmente en el navegador.
