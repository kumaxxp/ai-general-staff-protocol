# AGSP × Everything-Claude-Code Integration Protocol

**"Spec-Driven Strategy meets Agentic TDD Tactics."**

本プロジェクトは、実装フェーズにおいて **[Everything-Claude-Code](https://github.com/affaan-m/everything-claude-code)** の設定（Agents, Skills, Rules）を全面的に採用する。
AGSP（参謀本部）が策定した「仕様」を、ECC（現場指揮官）が「TDD」で確実に実装するための統合プロトコルである。

## 1. システム構成 (System Architecture)

* **戦略・仕様 (Strategy)**: `docs/SPECIFICATION.md` (AGSP管轄)
* **戦術・実装 (Tactics)**: `.claude/` (ECC管轄)
    * **Agent**: `tdd-guide` (TDDの実践)
    * **Command**: `/tdd` (Red-Green-Refactorサイクルの回し車)
    * **Rule**: `testing.md` (カバレッジ80%要件の強制)

## 2. 導入手順 (Installation)

現場指揮官（Claude Code）をECC仕様にするため、以下の手順を実行せよ。

1.  **ECCの配備**:
    `affaan-m/everything-claude-code` リポジトリから、以下のディレクトリをプロジェクトルートにコピーする。
    * `.claude/agents/`
    * `.claude/skills/`
    * `.claude/rules/`
    * `.claude/commands/`
2.  **AGSP適合パッチ**:
    `.claude/rules/agsp-compliance.md` を新規作成し、以下を記述する。
    > "Implementation Source of Truth: You must strictly follow `docs/SPECIFICATION.md`. Do not improvise features not described there."

## 3. 実戦ワークフロー (Combat Workflow)

### Step 1: 参謀本部による仕様策定
* **Gemini/Cline**: `docs/SPECIFICATION.md` を更新。
* **Director**: 仕様を確定。

### Step 2: 現場指揮官への命令
ターミナルで以下のコマンドを実行し、ECCのTDDエージェントを起動する。

```bash
# ECCの /tdd コマンドを使用し、AGSPの仕様書をインプットとして渡す
claude -p "/tdd Implement the features defined in docs/SPECIFICATION.md section 2.1"

```

### Step 3: TDDサイクル (The Loop)

ECCの `tdd-guide` エージェントが自律的に以下を実行する。

1. **RED**: 仕様書に基づき、失敗するテストを書く。
2. **GREEN**: テストを通すための最小限の実装を行う。
3. **REFACTOR**: `coding-standards.md` に従いコードを清書する。

### Step 4: 監査

実装完了後、`/code-review` コマンドを実行し、品質チェックを行う。

## 4. 修正プロトコル (Drift Control)

TDDサイクル中に「仕様の矛盾」によりテストがどうしても通らない場合：

1. **Stop**: 実装を中断する。
2. **Report**: エラー内容をコピーする。
3. **Escalate**: 参謀本部（Cline/Gemini）へ戻し、`docs/SPECIFICATION.md` を修正する。
4. **Restart**: `/tdd` を再実行する。

---

*Powered by AGSP & Everything-Claude-Code*

```

***

### 修正アクション
1.  先ほど提案した自作の `docs/Everything-Claude-Code.md` は破棄（削除）してください。
2.  代わりに、上記の **`docs/ECC_PROTOCOL.md`** を作成してください。
3.  **`docs/RULES.md`** も微修正が必要です（以下に修正版を提示します）。

### `docs/RULES.md` (ECC対応修正版)

```markdown
# AGSP Constitution (Rules of Engagement)

**AI General Staff Protocol: Fundamental Laws**

本プロジェクトは、AGSPに基づき運用される。全ての参加者（Human, Gemini, Cline, Claude）は以下の法を遵守せよ。

## 第1条：ドキュメント絶対主義 (Document Sovereignty)
1.  **Single Source of Truth**: 真実は常に `docs/` 以下のMarkdownファイルにある。
2.  **Spec-Driven**: 仕様書（Spec）が存在しない状態でのコーディングを禁ずる。

## 第2条：役割の分離 (Separation of Powers)
1.  **Staff (Gemini/Cline)**: 戦略立案とドキュメント管理を担当。
2.  **Field (Claude Code)**: **Everything-Claude-Code (ECC)** プロトコルに従い、TDDによる実装を担当。
    * 直接コーディングするのではなく、`/tdd` コマンド等のAgent機能を使用すること。
3.  **Human (Director)**: 承認と最終決定を担当。

## 第3条：逆流同期 (Reverse Sync)
1.  実装時のエラーや矛盾は、コードの修正ではなく、仕様書の修正によって解決せよ。
2.  "Don't fix the code. Update the Spec."

## 第4条：監査と規律 (Audit & Discipline)
1.  実装完了時は、ECCの `/code-review` または `/security-audit` を通過させよ。
2.  プロジェクトの命名規則等は `.claude/rules/` 内の定義に従え。

