# Sourced by other scripts; not meant to be executed directly.

set -euo pipefail

ok() {
  printf '\033[1;32m✓\033[0m %s\n' "$*"
}

doing() {
  printf '\033[1;34m→\033[0m %s\n' "$*"
}

fail() {
  printf '\033[1;31m✗\033[0m %s\n' "$*" >&2
}

link() {
  local desc="$1"
  local src="$2"
  local dst="$3"

  if [ ! -e "$src" ]; then
    fail "$desc: source $src does not exist"
    exit 1
  fi

  if [ -d "$dst" ]; then
    dst="$dst/$(basename "$src")"
  fi

  if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$src" ]; then
    ok "$desc"
    return 0
  fi

  if [ -e "$dst" ] || [ -L "$dst" ]; then
    fail "$desc: $dst already exists"
    exit 1
  fi

  doing "$desc"
  ln -s "$src" "$dst"
}

ensure_line() {
  local desc="$1"
  local file="$2"
  local line="$3"

  if [ -f "$file" ] && grep -Fxq "$line" "$file"; then
    ok "$desc"
    return 0
  fi

  doing "$desc"
  echo "$line" >>"$file"
}
