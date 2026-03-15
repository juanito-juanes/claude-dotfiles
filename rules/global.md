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
- Cuando el usuario se despida (frases como "seguimos mañana", "hasta mañana", "lo dejamos aquí", "hasta luego"), guardar automáticamente el punto de situación en el MEMORY.md del proyecto antes de responder.

## Repo claude-dotfiles (~/.claude/)
- Cuando se modifique la guía (`guia-ficheros-claude-code.txt`) o cualquier fichero de reglas (`rules/global.md`), copiar el fichero modificado a su equivalente en `~/.vscode/repos/claude-dotfiles/`, hacer commit y push automáticamente, sin esperar confirmación del usuario.
- Cuando se instale una nueva skill global o se añada/elimine un MCP server, actualizar el README.md del repo claude-dotfiles y hacer commit y push automáticamente.

## Agentes personalizados en proyectos
- Cuando crees o modifiques el `CLAUDE.md` de un proyecto, incluye siempre una sección `## Agentes` que liste los agentes disponibles en `.claude/agents/` con sus triggers explícitos: cuándo invocarlos y con qué herramienta.
- Ejemplo de sección a incluir:
  ```
  ## Agentes
  - `planner`: invocar antes de planificar cualquier implementación nueva.
  - `code-reviewer`: invocar después de cada bloque de cambios de código.
  - `architect`: invocar antes de decisiones de estructura o diseño técnico.
  ```

## Herramientas y entorno
- Package manager: npm (no usar bun, pnpm ni yarn salvo instrucción explícita).
- Sistema operativo: Windows 10, pero usando bash (sintaxis Unix en comandos).
- Cuando el usuario pregunte sobre una librería o framework externo y vaya a generar código, usa context7 automáticamente.
