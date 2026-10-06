# harness-skills

跨 harness 的个人 Skill 库。同一个 skill，Kimi Work、Codex、Qoder 等 agent 运行时都能直接用。

## 目录结构

```
harness-skills/
├── AGENTS.md                # 任何 harness / agent 进入本仓库先读这里
├── README.md
├── skills/                  # 所有 skill 放这里，一个 skill 一个目录
│   └── <skill-name>/
│       └── SKILL.md         # agentSkills 约定：frontmatter (name + description) + 正文
└── scripts/
    └── install.sh           # 把 skills 链接/复制到某个 harness 的 skills 目录
```

## 快速接入

```bash
git clone https://github.com/tiw/harness-skills.git
cd harness-skills

# 安装到 Codex
./scripts/install.sh ~/.codex/skills

# 安装到 Kimi Work（macOS）
./scripts/install.sh "$HOME/Library/Application Support/kimi-desktop/daimon-share/daimon/skills"
```

默认创建**符号链接**：在仓库里改 skill，所有 harness 立即生效。如需独立副本，加 `--copy`。

## 已知 harness 的 skills 目录

| Harness | 路径 |
|---|---|
| Kimi Work (macOS) | `~/Library/Application Support/kimi-desktop/daimon-share/daimon/skills` |
| Codex | `~/.codex/skills` |
| Qoder / QoderWork | 以其官方文档为准；确认 skills 目录后同样执行 `install.sh <目录>` |

## 新增 skill

1. 建目录 `skills/<name>/`，`<name>` 用小写字母、数字、连字符。
2. 写 `SKILL.md`，顶部 frontmatter 至少包含 `name` 和 `description`（description 决定 harness 何时触发它）。
3. commit、push，然后在各 harness 上跑一次 `install.sh`（符号链接模式下无需重跑）。

## 现有 skill

| Skill | 说明 |
|---|---|
| [systems-thinking](skills/systems-thinking/SKILL.md) | 系统思维：Structure / Function / Process / Context 四维迭代法，分析复杂系统 |
| [bedtime-reading](skills/bedtime-reading/SKILL.md) | 睡前读物：把访谈/视频/长文素材改写成安静阅读的具体叙事文章，发布到 iCloud「睡前读物」目录 |
