# 電撃設営プロンプト・テンプレート (Blitz-Setup Prompt Template)

**用途**: 参謀総長（Gemini）が新規プロジェクト設営時に使用  
**実行者**: 情報参謀（Claude Desktop）

---

## 使用方法

1. 参謀総長は以下のテンプレートの `{{変数}}` を実際の値に置換する
2. 生成されたプロンプトを幕僚長に提示する
3. 幕僚長は Claude Desktop にプロンプトを貼り付ける
4. 情報参謀が自動設営を実行する

---

## プロンプト・テンプレート

```markdown
# ⚡ 電撃設営命令 (Blitz-Setup Order)

**発令**: 大本営参謀本部  
**宛先**: 情報参謀（Claude Desktop）  
**作戦名**: {{PROJECT_NAME}} 基地設営

---

## 命令

貴官は大本営直轄 情報参謀である。以下の電撃設営命令を受領し、直ちに新規プロジェクトの全環境を自動構築せよ。

## プロジェクト情報

- **プロジェクト名**: {{PROJECT_NAME}}
- **概要**: {{PROJECT_DESCRIPTION}}
- **ベースディレクトリ**: {{BASE_DIRECTORY}}
- **ターゲットパス**: {{BASE_DIRECTORY}}/{{PROJECT_NAME}}

## 設営指示

### 1. ディレクトリ構造の構築

以下の構造を完全に構築せよ：

```
{{PROJECT_NAME}}/
├── .clinerules
├── .gitignore
├── README.md
├── requirements.txt
├── pyproject.toml
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

### 2. ファイル内容

#### .clinerules
方面軍参謀長ルールを配備せよ。AGSP v2.2 準拠。

#### .gitignore
Python プロジェクト用の標準 .gitignore を配備せよ。

#### README.md
以下の内容で初期化せよ：

```markdown
# {{PROJECT_NAME}}

{{PROJECT_DESCRIPTION}}

## AGSP準拠

本プロジェクトは **AI General Staff Protocol (AGSP) v2.2** に準拠して運用される。

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
仕様書テンプレートを配備し、プロジェクト名と概要を記入せよ。

#### docs/RULES.md
AGSP憲法を配備せよ。

#### docs/AGSP_SKILLS_CATALOG.md
技能目録テンプレートを配備し、プロジェクト名を記入せよ。

#### docs/proposals/skill_request.md
技能追加要望書テンプレートを配備せよ。

#### requirements.txt
```
# {{PROJECT_NAME}} dependencies
# Add project dependencies here
```

#### pyproject.toml
```toml
[project]
name = "{{PROJECT_NAME}}"
version = "0.1.0"
description = "{{PROJECT_DESCRIPTION}}"
requires-python = ">=3.10"

[tool.pytest.ini_options]
testpaths = ["tests"]
python_files = ["test_*.py"]
```

#### src/__init__.py
```python
"""{{PROJECT_NAME}} - {{PROJECT_DESCRIPTION}}"""
```

#### tests/__init__.py
```python
"""Test suite for {{PROJECT_NAME}}"""
```

### 3. Git初期化

```bash
git init
git add -A
git commit -m "chore: 電撃設営による初期構築 (AGSP v2.2)"
```

## 完了報告

設営完了後、以下の形式で報告せよ：

```markdown
## ⚡ 電撃設営完了報告

**プロジェクト**: {{PROJECT_NAME}}
**設営日時**: [自動記入]
**状態**: ✅ 設営完了

### 構築ファイル一覧
[ファイルツリーを出力]

### 次のアクション
1. 参謀総長へ設営完了を報告
2. 方面軍参謀長（Cline）が仕様書を作成
3. 師団長（Claude Code）が作戦開始判断
```

---

以上の命令を即座に実行せよ。
```

---

## 変数一覧

| 変数 | 説明 | 例 |
|------|------|-----|
| `{{PROJECT_NAME}}` | プロジェクト名（英数字・アンダースコア） | `dynamic_battlefield` |
| `{{PROJECT_DESCRIPTION}}` | プロジェクト概要（日本語可） | `リアルタイム動的障害物を含む経路探索エンジン` |
| `{{BASE_DIRECTORY}}` | ベースディレクトリ | `C:\work` または `/home/user/projects` |

---

## 生成例

### 入力

```
プロジェクト名: dynamic_battlefield
概要: リアルタイム動的障害物を含む経路探索エンジン
ベースディレクトリ: C:\work
```

### 生成されるプロンプト冒頭

```markdown
# ⚡ 電撃設営命令 (Blitz-Setup Order)

**発令**: 大本営参謀本部  
**宛先**: 情報参謀（Claude Desktop）  
**作戦名**: dynamic_battlefield 基地設営

---

## 命令

貴官は大本営直轄 情報参謀である。以下の電撃設営命令を受領し、直ちに新規プロジェクトの全環境を自動構築せよ。

## プロジェクト情報

- **プロジェクト名**: dynamic_battlefield
- **概要**: リアルタイム動的障害物を含む経路探索エンジン
- **ベースディレクトリ**: C:\work
- **ターゲットパス**: C:\work/dynamic_battlefield

...
```

---

## 注意事項

1. プロジェクト名は英数字とアンダースコアのみ使用可
2. ベースディレクトリは絶対パスで指定
3. 情報参謀は MCP Filesystem を使用するため、アクセス権限のあるディレクトリを指定すること

---

*AGSP v2.2 - Blitz-Setup Prompt Template*
