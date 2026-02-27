#!/bin/bash
# fix-skills-symlinks.sh
# Se ejecuta automaticamente despues de cada comando Bash.
# Si el comando era "npx skills add", convierte los symlinks
# de ~/.claude/skills/ en carpetas reales.

INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')

# Salir inmediatamente si no es una instalacion de skill
if ! echo "$COMMAND" | grep -q "npx skills add"; then
  exit 0
fi

CLAUDE_SKILLS="$HOME/.claude/skills"

# Convertir symlinks en carpetas reales
for link in "$CLAUDE_SKILLS"/*/; do
  skill=$(basename "$link")
  if [ -L "${link%/}" ]; then
    target=$(readlink "${link%/}")
    rm "${link%/}"
    cp -r "$target" "$CLAUDE_SKILLS/$skill"
  fi
done

exit 0
