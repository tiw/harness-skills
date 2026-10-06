#!/bin/bash
# 发布睡前读物到 iCloud「睡前读物」目录
# 用法: publish.sh <文章绝对路径>
set -euo pipefail

SRC="${1:?用法: publish.sh <文章绝对路径>}"
DIR="$HOME/Library/Mobile Documents/com~apple~CloudDocs/睡前读物"

[ -f "$SRC" ] || { echo "文件不存在: $SRC" >&2; exit 1; }

mkdir -p "$DIR"
cp "$SRC" "$DIR/"
echo "已发布: $DIR/$(basename "$SRC")"
