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
El settings.json no se sube al repo porque puede contener tokens sensibles.
Hay que añadir el bloque de hooks sin machacar lo que ya exista en el fichero.

Pídele a Claude que lo haga con esta instrucción:
> "Añade el hook de fix-skills-symlinks al ~/.claude/settings.json respetando
> el contenido que ya tenga el fichero. El hook debe ejecutar
> bash \"$HOME/.claude/hooks/fix-skills-symlinks.sh\" en el evento PostToolUse
> con matcher Bash."

O si prefieres hacerlo manualmente, el bloque a añadir dentro de la clave raíz es:

```json
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
```

### 4. Instalar las skills globales
```bash
npx skills add vercel-labs/skills --skill find-skills -g -a claude-code -y
npx skills add anthropics/skills@skill-creator -g -a claude-code -y
```

El hook se encarga automáticamente de convertir los symlinks en carpetas reales.
