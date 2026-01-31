# AGSP v3.2 ECC統合計画書

> **最終更新**: 2026-01-31
> **状態**: ✅ 統合完了

## 概要

本文書は、AGSP（AI General Staff Protocol）v3.1に対し、以下の外部知見を統合するための計画をまとめたものである。

- **Shogun (multi-agent-shogun)**: Claude Code × tmux マルチエージェントシステム
- **everything-claude-code**: Claude Code設定コレクション（Anthropicハッカソン優勝者作成）

---

## トリガー方法

Claude Desktopに以下の形式で指示を送ることで、この計画を実行できます：

```
# AGSP v3.2 統合作業
## 作業指示
AGSPの機能をeverything-claude-codeに統合してください。
## 計画書
まず以下のファイルを読んでください：
C:\work\ai-general-staff-protocol\docs\integrations\ECC_Integration_Plan.md
## 作業対象
\\192.168.1.163\work\everything-claude-code
## 主要タスク（優先度順）
1. agents/agsp/ - 方面軍エージェント定義
2. rules/agsp/forbidden-actions.md - 禁止事項
3. skills/agsp/compaction-recovery/SKILL.md - コンパクション復帰
4. status/dashboard.md - ダッシュボード
5. commands/agsp/sitrep.md - 状況報告コマンド
6. hooks/agsp/hooks.json - 自動化フック
計画書を読んだら、優先度1から順に実装を開始してください。
```

---

## 1. 参照資料

### 1.1 Shogunシステム
- GitHub: https://github.com/yohey-w/multi-agent-shogun
- 記事1: https://zenn.dev/shio_shoppaize/articles/5fee11d03a11a1
- 記事2: https://zenn.dev/shio_shoppaize/articles/8870bbf7c14c22

### 1.2 everything-claude-code
- GitHub: https://github.com/affaan-m/everything-claude-code
- ローカル: \\192.168.1.163\work\everything-claude-code

### 1.3 AGSP v3.1
- ローカル: C:\work\ai-general-staff-protocol

---

## 2. 現状分析

### 2.1 機能マッピング

| 機能カテゴリ | everything-claude-code | Shogun | AGSP v3.1 | 統合方針 |
|-------------|----------------------|--------|-----------|----------|
| **エージェント定義** | ✅ 汎用（planner, architect等） | ✅ 役職別（将軍,家老,足軽） | ✅ 役職別（方面軍） | **AGSP役職をagentsに追加** |
| **コンパクション対策** | ❌ なし | ✅ CLAUDE.mdに復帰手順 | ❌ なし | **追加必須** |
| **禁止事項** | ❌ なし | ✅ forbidden_actions | ❌ なし | **追加必須** |
| **ダッシュボード** | ❌ なし | ✅ dashboard.md | ❌ なし | **追加必須** |
| **コンテキスト管理** | ✅ contexts/（dev,review等） | ✅ 3層管理 | ✅ CURRENT_STATUS | **拡張** |
| **Hooks** | ✅ session-start/end等 | ✅ イベント駆動 | ❌ なし | **活用** |
| **Skills自動学習** | ✅ continuous-learning-v2 | ✅ Skills自動提案 | ❌ なし | **活用** |
| **電報形式報告** | ❌ なし | ✅ 戦国口調 | ✅ 電報形式 | **追加** |
| **作戦命令受領** | ❌ なし | ✅ YAML | ✅ strategy.yaml | **追加** |

### 2.2 Shogunから学んだ教訓

1. **AIも「うっかり」する** → 仕組みで防ぐ（コンパクション対策）
2. **禁止事項の明文化** → forbidden_actions（違反は切腹）
3. **3層コンテキスト管理** → Memory/Global/Project
4. **考えすぎるAIは遅い** → 役割を絞る「考えるな、委譲しろ」
5. **ダッシュボードで可視化** → 人間はダッシュボードを見るだけ

---

## 3. 統合計画：AGSP Fleet Plugin

### 3.1 ディレクトリ構造

```
everything-claude-code/
├── agents/
│   └── agsp/                          # ✅ AGSP専用エージェント
│       ├── fleet-commander.md         # ✅ 連合艦隊司令長官
│       ├── frontend-army.md           # ✅ FrontEnd方面軍
│       ├── backend-army.md            # ✅ BackEnd方面軍
│       ├── test-army.md               # ✅ Test方面軍
│       └── infra-army.md              # ✅ Infra方面軍
│
├── skills/
│   └── agsp/                          # ✅ AGSP専用スキル
│       └── compaction-recovery/       # ✅ コンパクション復帰
│           └── SKILL.md
│
├── commands/
│   └── agsp/                          # ✅ AGSP専用コマンド
│       └── sitrep.md                  # ✅ /sitrep - 状況報告
│
├── rules/
│   └── agsp/                          # ✅ AGSP専用ルール
│       └── forbidden-actions.md       # ✅ 禁止事項
│
├── hooks/
│   └── agsp/                          # ✅ AGSP専用フック
│       └── hooks.json                 # ✅ 自動化フック
│
└── status/                            # ✅ ダッシュボード
    └── dashboard.md
```

---

## 4. 実装優先度と完了状況

| 優先度 | ファイル | 理由 | 状態 |
|--------|----------|------|------|
| **1** | `agents/agsp/*.md` | 方面軍の役割定義が最重要 | ✅ 完了 |
| **2** | `rules/agsp/forbidden-actions.md` | 越権行為防止 | ✅ 完了 |
| **3** | `skills/agsp/compaction-recovery/SKILL.md` | Shogunの教訓 | ✅ 完了 |
| **4** | `status/dashboard.md` | 進捗可視化 | ✅ 完了 |
| **5** | `commands/agsp/sitrep.md` | 報告の標準化 | ✅ 完了 |
| **6** | `hooks/agsp/hooks.json` | 自動化 | ✅ 完了 |

---

## 5. 作成済みファイル詳細

### 5.1 agents/agsp/（5ファイル）

| ファイル | 説明 |
|----------|------|
| `fleet-commander.md` | 連合艦隊司令長官 - 全方面軍統括 |
| `frontend-army.md` | FrontEnd方面軍 - UI/UX実装 |
| `backend-army.md` | BackEnd方面軍 - API/ロジック実装 |
| `test-army.md` | Test方面軍 - テスト・品質保証 |
| `infra-army.md` | Infra方面軍 - インフラ・DevOps |

### 5.2 rules/agsp/forbidden-actions.md

- 重大違反（F001〜F006）の定義
- 担当領域マトリクス
- コンパクション復帰時の必須手順
- 違反検出時の対応

### 5.3 skills/agsp/compaction-recovery/SKILL.md

- コンパクション復帰の5ステップ手順
- 復帰確認チェックリスト
- フック連携設定

### 5.4 status/dashboard.md

- 作戦概況テンプレート
- 方面軍状況テンプレート
- 品質指標
- 進捗バー凡例

### 5.5 commands/agsp/sitrep.md

- 状況報告コマンド仕様
- 電報形式テンプレート（標準/詳細/簡易/バグ報告）
- 電番採番ルール

### 5.6 hooks/agsp/hooks.json

- SessionStart: 役割確認リマインダー
- PreCompact: コンパクション前警告
- PostCompact: 復帰手順表示
- PreToolUse: 越権行為検出
- PostToolUse: テスト結果確認
- SessionEnd: ダッシュボード更新リマインダー

---

## 6. 統合完了後の使用方法

### Claude Codeでの使用

```bash
# 環境変数で方面軍を指定
AGSP_ARMY=frontend claude code ...

# または tmux セッション名で識別
tmux rename-window frontend
```

### 方面軍別起動

```bash
# 連合艦隊司令長官
cd ~/project && claude

# FrontEnd方面軍
cd ~/project-frontend && AGSP_ARMY=frontend claude --dangerously-skip-permissions

# BackEnd方面軍
cd ~/project-backend && AGSP_ARMY=backend claude --dangerously-skip-permissions
```

---

## 付録：参照リンク

- AGSP README: C:\work\ai-general-staff-protocol\README.md
- Shogun記事1: https://zenn.dev/shio_shoppaize/articles/5fee11d03a11a1
- Shogun記事2: https://zenn.dev/shio_shoppaize/articles/8870bbf7c14c22
- everything-claude-code: https://github.com/affaan-m/everything-claude-code
