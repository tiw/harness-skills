# AGENTS.md — harness-skills

本仓库是跨 harness（Kimi Work / Codex / Qoder 等）共享的个人 skill 库。

## 硬约定

- 所有 skill 位于 `skills/<name>/SKILL.md`，遵循 agentSkills 约定：目录名即 skill 名（小写字母、数字、连字符），`SKILL.md` 顶部 frontmatter 至少含 `name` 与 `description`。
- 安装到某个 harness：`scripts/install.sh <该 harness 的 skills 目录>`，默认符号链接，`--copy` 为复制。

## 工作规则

- 改 skill 只动它自己的目录，不碰目录结构约定；要改结构，先同步改 `README.md` 和 `install.sh`。
- 新 skill 必须能一句话说清"什么时候触发我"（写进 frontmatter 的 `description`）。
- 不要往 skill 正文里塞大段外部资料；来源用链接或引用标注（如 `[pdf_1]` 这类标记需指向仓库内或文档内可查证的位置）。
