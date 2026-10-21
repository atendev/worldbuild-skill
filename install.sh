#!/usr/bin/env bash
#
# Interactive installer for the `worldbuild` skill. Run it and answer the
# prompts. No flags are needed:
#
#   curl -fsSL https://raw.githubusercontent.com/atendev/worldbuild-skill/main/install.sh | bash

set -euo pipefail

REPO="atendev/worldbuild-skill"   # <-- change this
BRANCH="main"
SKILL_NAME="worldbuild"

# curl | bash consumes stdin for the script itself, so prompts read from the
# terminal directly (/dev/tty) rather than stdin in that case.
ask() {
  local prompt="$1" default="${2:-}" answer
  if [[ -t 0 ]]; then
    read -r -p "$prompt" answer
  elif ! read -r -p "$prompt" answer < /dev/tty 2>/dev/null; then
    echo
    echo "error: this installer needs to ask you a question, but no terminal is available to read your answer." >&2
    echo "Download the script first, then run it directly instead of piping it through bash:" >&2
    echo "  curl -fsSL https://raw.githubusercontent.com/atendev/worldbuild-skill/main/install.sh -o install.sh && bash install.sh" >&2
    exit 1
  fi
  echo "${answer:-$default}"
}

echo "Where would you like to install the worldbuild skill?"
echo
echo "  1) Claude Code, global (all projects)   (~/.claude/skills/worldbuild)  [recommended]"
echo "  2) Claude Code, this project only        (./.claude/skills/worldbuild)"
echo "  3) Codex CLI, this project                (./.codex/skills/worldbuild)   [community convention, unverified]"
echo "  4) Gemini CLI, this project               (./.gemini/skills/worldbuild)  [community convention, unverified]"
echo "  5) Custom path"
echo
choice="$(ask "Enter a number [1]: " "1")"

case "$choice" in
  1) TARGET="$HOME/.claude/skills/$SKILL_NAME" ;;
  2) TARGET="$(pwd)/.claude/skills/$SKILL_NAME" ;;
  3) TARGET="$(pwd)/.codex/skills/$SKILL_NAME" ;;
  4) TARGET="$(pwd)/.gemini/skills/$SKILL_NAME" ;;
  5)
    custom_dir="$(ask "Enter the directory to install into (the skill will be placed at <dir>/$SKILL_NAME): ")"
    if [[ -z "$custom_dir" ]]; then
      echo "error: no directory entered." >&2
      exit 1
    fi
    TARGET="${custom_dir%/}/$SKILL_NAME"
    ;;
  *)
    echo "error: not a valid choice: $choice" >&2
    exit 1
    ;;
esac

if [[ "$choice" == "3" || "$choice" == "4" ]]; then
  echo
  echo "Note: this copies the skill to the right folder, but nobody has verified that"
  echo "the CLI follows SKILL.md's routing instructions (loading only the reference"
  echo "file it needs, rather than everything at once). Test it before relying on it."
fi

if [[ -d "$TARGET" ]]; then
  echo
  overwrite="$(ask "$TARGET already exists. Overwrite? [y/N] " "n")"
  case "$overwrite" in
    y|Y|yes|Yes) ;;
    *) echo "Aborted."; exit 1 ;;
  esac
fi

WORKDIR="$(mktemp -d)"
trap 'rm -rf "$WORKDIR"' EXIT

echo
echo "Downloading $REPO@$BRANCH ..."
curl -fsSL "https://codeload.github.com/$REPO/tar.gz/refs/heads/$BRANCH" -o "$WORKDIR/repo.tar.gz"

echo "Extracting $SKILL_NAME/ ..."
TAR_LISTING="$(tar -tzf "$WORKDIR/repo.tar.gz")"
TOPDIR="$(head -1 <<< "$TAR_LISTING" | cut -d/ -f1)"
tar -xzf "$WORKDIR/repo.tar.gz" -C "$WORKDIR" "$TOPDIR/$SKILL_NAME"

if [[ ! -f "$WORKDIR/$TOPDIR/$SKILL_NAME/SKILL.md" ]]; then
  echo "error: SKILL.md not found in $SKILL_NAME/. Check that the skill lives at the repo root under that name." >&2
  exit 1
fi

mkdir -p "$(dirname "$TARGET")"
rm -rf "$TARGET"
mv "$WORKDIR/$TOPDIR/$SKILL_NAME" "$TARGET"

echo
echo "Installed to $TARGET"
if [[ "$choice" == "1" || "$choice" == "2" ]]; then
  echo "Restart Claude Code (or run /skills in an active session) to pick it up."
else
  echo "Restart the relevant tool/session to pick it up."
fi
