# AGSP v3.2 統合作業 引き継ぎプロンプト

## 概要
このプロンプトは、AGSP（AI General Staff Protocol）v3.2の統合作業を新しいチャットで継続するためのものです。

---

## 背景

AGSP v3.1を以下の2つのシステムの知見で強化し、everything-claude-codeに統合する計画です：

1. **Shogun (multi-agent-shogun)** - Claude Code × tmux マルチエージェントシステム
2. **everything-claude-code** - Claude Code設定コレクション

---

## 計画書の場所

詳細な計画は以下のファイルに記載されています：

```
C:\work\ai-general-staff-protocol\docs\AGSP_v3.2_Integration_Plan.md
```

---

## 作業対象リポジトリ

```
\\192.168.1.163\work\everything-claude-code
```

---

## プロンプト（新しいチャットにコピー）

```
# AGSP v3.2 統合作業

## 作業指示
AGSP（AI General Staff Protocol）の機能をeverything-claude-codeに統合してください。

## 計画書
まず以下のファイルを読んでください：
C:\work\ai-general-staff-protocol\docs\AGSP_v3.2_Integration_Plan.md

## 作業対象
\\192.168.1.163\work\everything-claude-code

## 主要タスク（優先度順）

1. **agents/agsp/** - 方面軍エージェント定義を作成
   - fleet-commander.md（連合艦隊司令長官）
   - frontend-army.md（FrontEnd方面軍）
   - backend-army.md（BackEnd方面軍）
   - test-army.md（Test方面軍）
   - infra-army.md（Infra方面軍）

2. **rules/agsp/forbidden-actions.md** - 禁止事項を定義

3. **skills/agsp/compaction-recovery/SKILL.md** - コンパクション復帰手順

4. **status/dashboard.md** - ダッシュボードテンプレート

5. **commands/agsp/sitrep.md** - 状況報告コマンド

6. **hooks/agsp/hooks.json** - 自動化フック

## 参考資料
- AGSP README: C:\work\ai-general-staff-protocol\README.md
- Shogun記事: https://zenn.dev/shio_shoppaize/articles/5fee11d03a11a1
- everything-claude-code: https://github.com/affaan-m/everything-claude-code

## 重要ポイント

### 電報形式（AGSP標準）
- ヘッダー: `宛  ` `発  ` `電番 ` `発信 `（スペース区切り、コロンなし）
- 締めくくり: `以上`
- 本文: 現代文で簡潔に（旧仮名遣いは使用しない）

### Shogunの教訓
1. AIも「うっかり」する → コンパクション対策必須
2. 禁止事項は明文化 → forbidden_actions（違反は切腹）
3. 越権行為を防ぐ → 担当領域マトリクス
4. ダッシュボードで可視化 → 人間はダッシュボードを見るだけ

### 方面軍エージェント必須要素
1. 作業開始前の必須確認手順
2. 電報形式の報告テンプレート
3. 禁止事項（F001〜F004）
4. コンパクション復帰手順

計画書を読んだら、優先度1から順に実装を開始してください。
```

---

## 補足：完了済み作業

### AGSP v3.1 電報形式更新（2026-01-31完了）
- README.md: 「敬礼！」→「以上」、ヘッダー形式変更
- operations_chief.md: 同上
- intel_chief.md: 同上

---

## 参照リンク

- Shogun記事1: https://zenn.dev/shio_shoppaize/articles/5fee11d03a11a1
- Shogun記事2: https://zenn.dev/shio_shoppaize/articles/8870bbf7c14c22
- everything-claude-code: https://github.com/affaan-m/everything-claude-code
