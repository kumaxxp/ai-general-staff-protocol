# 電撃設営プロンプト・テンプレート (Blitz-Setup Prompt Template)

**用途**: 参謀総長（Gemini）が新規プロジェクト設営時に使用  
**実行者**: 情報参謀（Claude Desktop）  
**Version**: 2.0（ドクトリン最終版）

---

## ドクトリン（運用原則）

1. **入力情報の最小化**: 幕僚長からの初期入力は **『プロジェクト名』のみ**
2. **標準展開先**: `C:\work\[プロジェクト名]` を原則とする
3. **権限分離の徹底**: 設営は『物理的設営』のみ。設計・実装は作戦会議後
4. **設営完了報告の義務化**: 「設営完了。これより大本営による作戦会議を待機する。」と上奏

---

## 使用方法

1. 幕僚長が参謀総長に **プロジェクト名のみ** を伝達
2. 参謀総長は以下のテンプレートの `{{PROJECT_NAME}}` を置換
3. 生成された命令を幕僚長に提示
4. 幕僚長は Claude Desktop に命令を貼り付け
5. 情報参謀が物理的設営を実行し、作戦会議待機を報告

---

## 電撃設営命令テンプレート

```markdown
# ⚡ 電撃設営命令 (Blitz-Setup Order)

**発令**: 大本営参謀本部  
**宛先**: 情報参謀（Claude Desktop）  
**作戦名**: {{PROJECT_NAME}} 基地設営

---

## 命令

貴官は大本営直轄 情報参謀である。以下の電撃設営命令を受領し、直ちに『物理的設営』のみを実行せよ。

**重要**: 設計・実装に関する判断は一切禁ずる。

## 展開情報

- **プロジェクト名**: {{PROJECT_NAME}}
- **展開先パス**: C:\work\{{PROJECT_NAME}}

## 設営指示

### 1. ディレクトリ構造の構築

以下の構造を構築せよ（中身は空または最小限のテンプレート）：

```
{{PROJECT_NAME}}/
├── .clinerules
├── .gitignore
├── README.md
├── docs/
│   ├── SPECIFICATION.md
│   ├── RULES.md
│   ├── AGSP_SKILLS_CATALOG.md
│   ├── strategy/
│   ├── proposals/
│   │   └── skill_request.md
│   └── reports/
├── src/
│   └── __init__.py
├── tests/
│   └── __init__.py
└── data/
```

### 2. ファイル配備

#### .clinerules
AGSP v2.3 準拠の方面軍参謀長ルールを配備せよ。

#### .gitignore
Python プロジェクト用の標準 .gitignore を配備せよ。

#### README.md
以下の内容で初期化せよ。**詳細は空欄とし、設計に関する記述は一切含めるな**：

```markdown
# {{PROJECT_NAME}}

## AGSP準拠

本プロジェクトは **AI General Staff Protocol (AGSP) v2.3** に準拠して運用される。

### 指揮系統

| 役職 | 担当 |
|------|------|
| 幕僚長 | User |
| 参謀総長 | Gemini |
| 方面軍参謀長 | Cline |
| 師団長 | Claude Code |
| 情報参謀 | Claude Desktop |

### ドキュメント

- 仕様書: `docs/SPECIFICATION.md`
- 規律: `docs/RULES.md`
- 技能目録: `docs/AGSP_SKILLS_CATALOG.md`

## プロジェクト概要

（第一回作戦会議後に記載）

## 環境構築

```bash
python -m venv .venv
source .venv/bin/activate  # Windows: .venv\Scripts\activate
pip install -r requirements.txt
```

## ライセンス

MIT License
```

#### docs/SPECIFICATION.md
仕様書テンプレートを配備せよ（内容は空欄）。

#### docs/RULES.md
AGSP憲法を配備せよ。

#### docs/AGSP_SKILLS_CATALOG.md
技能目録テンプレートを配備せよ（プロジェクト名のみ記入、技能は空）。

#### docs/proposals/skill_request.md
技能追加要望書テンプレートを配備せよ。

#### src/__init__.py, tests/__init__.py
空のパッケージ初期化ファイルを配備せよ。

### 3. 設営完了報告

設営完了後、以下の定型文で報告せよ：

---

## ⚡ 設営完了報告

**プロジェクト**: {{PROJECT_NAME}}
**展開先**: C:\work\{{PROJECT_NAME}}
**状態**: ✅ 設営完了

### 構築ファイル一覧
[ファイルツリーを出力]

---

**設営完了。これより大本営による作戦会議を待機する。**

---

以上の命令を即座に実行せよ。設計・実装に関する提案は一切不要である。
```

---

## 変数一覧

| 変数 | 説明 | 例 |
|------|------|-----|
| `{{PROJECT_NAME}}` | プロジェクト名（英数字・アンダースコア） | `tile_test` |

**注**: 展開先パスは常に `C:\work\{{PROJECT_NAME}}` とし、変数化しない。

---

## 生成例

### 入力（幕僚長 → 参謀総長）

```
プロジェクト名: tile_test
```

### 出力（参謀総長 → 幕僚長）

```markdown
# ⚡ 電撃設営命令 (Blitz-Setup Order)

**発令**: 大本営参謀本部  
**宛先**: 情報参謀（Claude Desktop）  
**作戦名**: tile_test 基地設営

---

## 命令

貴官は大本営直轄 情報参謀である。以下の電撃設営命令を受領し、直ちに『物理的設営』のみを実行せよ。

**重要**: 設計・実装に関する判断は一切禁ずる。

## 展開情報

- **プロジェクト名**: tile_test
- **展開先パス**: C:\work\tile_test

...（以下省略）
```

---

## 禁止事項（参謀総長向け）

電撃設営命令に以下を含めてはならない：

1. ❌ プロジェクトの目的・概要の詳細説明
2. ❌ 技術スタック・アーキテクチャの指定
3. ❌ 実装すべき機能の列挙
4. ❌ 設計上の判断・推奨事項

これらは全て『第一回 作戦会議』以降に決定される。

---

*AGSP v2.3 - Blitz-Setup Prompt Template (Final Doctrine)*
