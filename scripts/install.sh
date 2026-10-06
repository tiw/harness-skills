#!/usr/bin/env bash
# install.sh — 把本仓库的 skills 安装到指定 harness 的 skills 目录
#
# 用法:
#   ./scripts/install.sh <目标目录> [--copy]
#
# 默认创建符号链接（仓库内修改对所有 harness 生效）；
# 加 --copy 则复制独立副本。
set -euo pipefail

MODE="link"
TARGET=""

usage() {
  cat >&2 <<'EOF'
用法: install.sh <目标 skills 目录> [--copy]

示例:
  install.sh ~/.codex/skills
  install.sh "$HOME/Library/Application Support/kimi-desktop/daimon-share/daimon/skills"
  install.sh /path/to/skills --copy
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --copy) MODE="copy"; shift ;;
    -h|--help) usage; exit 0 ;;
    *) TARGET="$1"; shift ;;
  esac
done

if [[ -z "$TARGET" ]]; then
  echo "错误：缺少目标 skills 目录" >&2
  usage
  exit 1
fi

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILLS_DIR="$REPO_ROOT/skills"

if [[ ! -d "$SKILLS_DIR" ]]; then
  echo "错误：找不到 $SKILLS_DIR" >&2
  exit 1
fi

mkdir -p "$TARGET"

installed=0
for skill in "$SKILLS_DIR"/*/; do
  [[ -d "$skill" ]] || continue
  name="$(basename "$skill")"
  [[ -f "$skill/SKILL.md" ]] || { echo "跳过 $name（缺少 SKILL.md）"; continue; }
  dest="$TARGET/$name"
  [[ -e "$dest" || -L "$dest" ]] && rm -rf "$dest"
  if [[ "$MODE" == "link" ]]; then
    ln -s "$skill" "$dest"
    echo "link  $name -> $dest"
  else
    cp -R "$skill" "$dest"
    echo "copy  $name -> $dest"
  fi
  installed=$((installed + 1))
done

echo "完成：已安装 $installed 个 skill 到 $TARGET"
