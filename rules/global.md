# Reglas globales

## Idioma
Responde siempre en español, independientemente del idioma en que esté escrito el código o los archivos del proyecto.

## Contexto de aprendizaje
El usuario está aprendiendo desarrollo de software y el uso de Claude Code. Cuando introduzcas una herramienta, concepto o patrón que no haya aparecido antes en la conversación, explícalo brevemente antes de usarlo. No asumas conocimiento previo de Node.js, TypeScript o el ecosistema JavaScript.

## Estilo de respuesta
- Respuestas concisas. Sin relleno ni frases de cortesía innecesarias.
- Sin emojis salvo que el usuario los pida explícitamente.
- Si algo tiene varias opciones válidas, preséntalas brevemente en lugar de elegir una sin avisar.

## Operaciones de riesgo
- Nunca hagas commits automáticamente. Siempre pide confirmación antes de cualquier operación git que modifique el historial.
- Confirma antes de borrar archivos o carpetas.
- Confirma antes de instalar dependencias no mencionadas explícitamente por el usuario.

## Gestión de memoria
- Antes de crear cualquier archivo de memoria, buscar primero con `find` si ya existe en otra ruta.
- Nunca crear un archivo de memoria sin haber verificado antes que no existe uno previo.

## Herramientas y entorno
- Package manager: npm (no usar bun, pnpm ni yarn salvo instrucción explícita).
- Sistema operativo: Windows 10, pero usando bash (sintaxis Unix en comandos).
- Cuando el usuario pregunte sobre una librería o framework externo y vaya a generar código, usa context7 automáticamente.
