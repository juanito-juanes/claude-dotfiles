#!/bin/bash
# install-skill.sh
# Wrapper sobre npx skills add que reemplaza los symlinks
# por carpetas reales en ~/.claude/skills/
#
# Uso: ./install-skill.sh <source> [opciones adicionales de npx skills add]
# Ejemplo: ./install-skill.sh vercel-labs/skills --skill find-skills

if [ -z "$1" ]; then
  echo "Uso: install-skill.sh <source> [opciones]"
  echo "Ejemplo: install-skill.sh anthropics/skills@skill-creator"
  exit 1
fi

CLAUDE_SKILLS="$HOME/.claude/skills"

# Instalar con el CLI de skills (siempre global, siempre para claude-code)
npx skills add "$@" -g -a claude-code -y

# Reemplazar symlinks por carpetas reales
for link in "$CLAUDE_SKILLS"/*/; do
  skill=$(basename "$link")
  if [ -L "${link%/}" ]; then
    target=$(readlink "${link%/}")
    echo "Convirtiendo symlink '$skill' en carpeta real..."
    rm "${link%/}"
    cp -r "$target" "$CLAUDE_SKILLS/$skill"
    echo "  OK: $skill"
  fi
done

echo "Listo. Skills disponibles en ~/.claude/skills/:"
ls "$CLAUDE_SKILLS"
