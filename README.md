# claude-dotfiles

Configuración personal de Claude Code.

## Contenido del repo

```
.claude/
├── rules/
│   └── global.md              <- reglas globales de comportamiento
├── skills/                    <- skills globales (copias reales, no symlinks)
├── hooks/
│   └── fix-skills-symlinks.sh <- convierte symlinks de skills en carpetas reales
├── scripts/
│   └── install-skill.sh       <- alternativa manual al hook
└── guia-ficheros-claude-code.txt
```

## Setup en una máquina nueva

### 1. Clonar el repo
```bash
git clone https://github.com/juanito-juanes/claude-dotfiles.git ~/claude-dotfiles
```

### 2. Copiar los ficheros
```bash
cp ~/claude-dotfiles/rules/global.md ~/.claude/rules/global.md
cp ~/claude-dotfiles/hooks/fix-skills-symlinks.sh ~/.claude/hooks/fix-skills-symlinks.sh
```

### 3. Registrar el hook en ~/.claude/settings.json
Añadir este bloque al settings.json (no se sube al repo porque contiene tokens):

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Bash",
        "hooks": [
          {
            "type": "command",
            "command": "bash \"$HOME/.claude/hooks/fix-skills-symlinks.sh\""
          }
        ]
      }
    ]
  }
}
```

### 4. Instalar las skills globales
```bash
npx skills add vercel-labs/skills --skill find-skills -g -a claude-code -y
npx skills add anthropics/skills@skill-creator -g -a claude-code -y
```

El hook se encarga automáticamente de convertir los symlinks en carpetas reales.
