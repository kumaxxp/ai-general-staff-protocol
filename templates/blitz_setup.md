# 電撃設営プロンプト・テンプレート (Blitz-Setup Prompt Template)

**用途**: 参謀総長（Gemini）が新規プロジェクト設営時に使用  
**実行者**: 情報参謀（Claude Desktop）  
**Version**: 2.1（聖域明示・エラーハンドリング対応版）

---

## ドクトリン（運用原則）

1. **聖域の尊重**: ディレクトリ作成・権限付与は**幕僚長の専権事項**
2. **入力情報の最小化**: 幕僚長からの初期入力は **『プロジェクト名』のみ**
3. **標準展開先**: `C:\work\[プロジェクト名]` を原則とする
4. **権限分離の徹底**: 設営は『物理的設営』のみ。設計・実装は作戦会議後
5. **設営完了報告の義務化**: 「設営完了。これより大本営による作戦会議を待機する。」と上奏

---

## 使用方法

1. 幕僚長が参謀総長に **プロジェクト名のみ** を伝達
2. 参謀総長は以下のテンプレートの `{{PROJECT_NAME}}` を置換
3. **生成された命令の最上位に事前準備の警告文があることを確認**
4. 幕僚長に命令を提示
5. 幕僚長は事前準備を完了後、Claude Desktop に命令を貼り付け
6. 情報参謀が物理的設営を実行し、作戦会議待機を報告

---

## 電撃設営命令テンプレート

```markdown
# ⚡ 電撃設営命令 (Blitz-Setup Order)

**発令**: 大本営参謀本部  
**宛先**: 情報参謀（Claude Desktop）  
**作戦名**: {{PROJECT_NAME}} 基地設営

---

## 🚨 事前準備確認【幕僚長の聖域】

> **⚠️ 重要: 本命令を実行する前に、幕僚長（User）は以下を完了しておくこと。**
> 
> AIエージェントはディレクトリ作成・権限付与を行う権限を持たない。
> これは幕僚長にのみ許された特権（聖域）である。

### 必須手順

1. **ディレクトリの作成**:
   ```powershell
   mkdir C:\work\{{PROJECT_NAME}}
   ```

2. **Claude Desktop への権限付与**:
   - `claude_desktop_config.json` を開く（通常: `%APPDATA%\Claude\`）
   - Filesystem MCP サーバーの `args` に追加:
   ```json
   "args": [..., "C:\\work\\{{PROJECT_NAME}}"]
   ```
   - **Claude Desktop を再起動**

### 確認完了後、本命令を Claude Desktop に貼り付けよ。

---

## 命令

貴官は大本営直轄 情報参謀である。以下の電撃設営命令を受領し、直ちに『物理的設営』のみを実行せよ。

**重要**: 設計・実装に関する判断は一切禁ずる。

## 展開情報

- **プロジェクト名**: {{PROJECT_NAME}}
- **展開先パス**: C:\work\{{PROJECT_NAME}}

## 設営指示

### 1. フォルダ構造の構築

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
AGSP v2.4 準拠の方面軍参謀長ルールを配備せよ。

#### .gitignore
Python プロジェクト用の標準 .gitignore を配備せよ。

#### README.md
以下の内容で初期化せよ。**詳細は空欄とし、設計に関する記述は一切含めるな**：

```markdown
# {{PROJECT_NAME}}

## AGSP準拠

本プロジェクトは **AI General Staff Protocol (AGSP) v2.4** に準拠して運用される。

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

### 3. エラーハンドリング

**権限不足の場合**: ディレクトリが存在しない、または権限がない場合は、設営を中止し以下の定型文で進言せよ：

> **「権限不足により進撃不能。幕僚長、C:\work\{{PROJECT_NAME}} の作成と、Claude Desktop 側での Filesystem 権限設定を確認されたし。」**

### 4. 設営完了報告

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

## 🚨 事前準備確認【幕僚長の聖域】

> **⚠️ 重要: 本命令を実行する前に、幕僚長（User）は以下を完了しておくこと。**
> 
> AIエージェントはディレクトリ作成・権限付与を行う権限を持たない。
> これは幕僚長にのみ許された特権（聖域）である。

### 必須手順

1. **ディレクトリの作成**:
   ```powershell
   mkdir C:\work\tile_test
   ```

2. **Claude Desktop への権限付与**:
   - `claude_desktop_config.json` を開く（通常: `%APPDATA%\Claude\`）
   - Filesystem MCP サーバーの `args` に追加:
   ```json
   "args": [..., "C:\\work\\tile_test"]
   ```
   - **Claude Desktop を再起動**

### 確認完了後、本命令を Claude Desktop に貼り付けよ。

---

## 命令

貴官は大本営直轄 情報参謀である。...（以下省略）
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

## 必須事項（参謀総長向け）

電撃設営命令に**必ず含める**こと：

1. ✅ 最上位に「🚨 事前準備確認【幕僚長の聖域】」セクション
2. ✅ ディレクトリ作成コマンド（`mkdir C:\work\{{PROJECT_NAME}}`）
3. ✅ Claude Desktop 設定変更手順
4. ✅ 「確認完了後、本命令を Claude Desktop に貼り付けよ」の一文
5. ✅ エラーハンドリング用の定型文

---

*AGSP v2.4 - Blitz-Setup Prompt Template (Sacred Domain & Error Handling)*
