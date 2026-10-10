#!/usr/bin/env bash
# Public short entry point; always downloads the maintained GitHub installer.
set -euo pipefail
entry_tmp=$(mktemp -d "${TMPDIR:-/tmp}/dev-entry.XXXXXXXX")
trap 'rm -rf -- "$entry_tmp"' EXIT
installer_url=https://raw.githubusercontent.com/jjjerryc/linux-dev-bootstrap/main/install.sh
if command -v curl >/dev/null; then
  curl -fLsS --proto '=https' --proto-redir '=https' --connect-timeout 15 --max-time 180 "$installer_url" -o "$entry_tmp/install.sh"
elif command -v wget >/dev/null; then
  wget -q --timeout=30 --tries=2 -O "$entry_tmp/install.sh" "$installer_url"
else
  echo 'Install curl or wget first.' >&2
  exit 1
fi
bash "$entry_tmp/install.sh" "$@"
