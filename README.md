# AI General Staff Protocol (AGSP)

**"Don't fix the code. Update the Spec."**

## 概要 (Overview)
AGSPは、LLM（大規模言語モデル）を用いたソフトウェア開発において、「仕様の崩壊」と「マイクロマネジメント」を防ぐための汎用開発プロトコルです。
「思考（参謀）」と「実装（現場）」を分離し、NotebookLMを中核とした**"Spec-Driven Development"（完全仕様駆動開発）**を強制します。

![AGSP Org Chart](https://mermaid.ink/img/pako:eNp1ksFqwzAMhl_F6NRC-wI5DLaTjbXTDrfQ3YqT2E1sB9vJ1jH27nMSp2WwYyd__0_Wj7QyE62Uot_VqPdo5_hI81X2yH0845zQ0XhFj9fXF85nPIz4QvM84y_0fF4yPpM9P1B2I3sW0A20g44wQ_tG-0t4Q_uB7lW4wR30dC81tB_oaY3W0K6hJ-2gJz-g_f6B7lS4g4F2E4N2Az1poD38gO6_4I7sS-2e_8i-0O41oAP8D919h1t4gP4rXJ1P-Fz7O9dKqUaZaqS1k6oR1c-iFNaIrJV1XqSCWstSCSHUW1H-tTfC5FpYI4TIGyG1bJRSb6J8AQnNc9k?type=png)

## 背景：Vibe Codingへの敗北
AIコーディング（Claude Code, Cursor等）の進化により、コードは一瞬で生成可能になりました。しかし、それは往々にして「仕様書不在の継ぎ接ぎ建築（Vibe Coding）」となり、プロジェクト規模拡大と共に破綻します。
本プロトコルは、**「コードを直すな、仕様書を直せ」**を鉄の掟とし、人間がコードをマイクロマネジメントする苦痛から解放することを目指します。

## 組織構造 (Organization)

### 1. 大本営 (Supreme Command)
* **主体**: User (General Director)
* **役割**: 戦略目標の決定、最終承認。
* **権限**: 仕様変更のGoサインを出す唯一の存在。

### 2. 参謀本部 (General Staff Office)
* **主体**: **NotebookLM** (Knowledge Base) & **Gemini** (Auditor)
* **役割**: 「記憶」と「監査」。
* **責務**:
    * 全仕様書、APIドキュメント、過去ログの保持。
    * 実装エラー時の「仕様書の欠陥」の特定。
    * 現場指揮官への「純粋なタスク（What）」の発行。

### 3. 現場指揮官 (Field Commander)
* **主体**: **Claude Code** / **Cursor** / **Local LLMs**
* **役割**: 「実行」。
* **責務**:
    * 参謀本部から渡された仕様書に基づく実装。
    * **禁止事項**: 独断による仕様の変更、および仕様書に基づかない場当たり的なバグ修正。

## 核心原則 (Core Philosophy)
1.  **Single Source of Truth**: 真実は常にクラウド上のドキュメント（Google Drive等）にあり、ローカルのコードはただの「影」である。
2.  **Reverse Sync**: 実装時にエラーが出た場合、コードを修正してはならない。仕様書を修正し、再生成することで解決する。
3.  **No Micro-Management**: 人間はAIのコードを一行ずつチェックしない。仕様書の整合性のみをチェックする。

## ライセンス
MIT License