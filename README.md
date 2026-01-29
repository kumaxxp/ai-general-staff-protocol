# AI General Staff Protocol (AGSP)

## 概要
AGSPは、LLM（大規模言語モデル）を用いたソフトウェア開発において、「仕様の崩壊」と「マイクロマネジメント」を防ぐための汎用開発プロトコルです。
「思考（参謀）」と「実装（現場）」を分離し、NotebookLMを中核とした**"Spec-Driven Development"（完全仕様駆動開発）**を強制します。

## 背景：Vibe Codingへの敗北
AIコーディング（Cursor, Claude Code等）の進化により、コードは一瞬で生成可能になりました。しかし、それは往々にして「仕様書不在の継ぎ接ぎ建築（Vibe Coding）」となり、プロジェクト規模拡大と共に破綻します。
本プロトコルは、**「コードを直すな、仕様書を直せ（Don't fix the code. Update the Spec.）」**を鉄の掟とします。

## アーキテクチャ：参謀本部モデル

### 1. 総監督 (Commander / User)
- **役割**: 大戦略の決定、最終承認。
- **権限**: 仕様変更のGoサインを出す唯一の存在。

### 2. 参謀本部 (General Staff / NotebookLM & Gemini)
- **役割**: **「記憶」と「監査」**。
- **ツール**: NotebookLM (RAG/Context), Gemini (Drive連携).
- **責務**:
  - 全仕様書、APIドキュメント、過去ログの保持。
  - 実装エラー時の「仕様書の欠陥」の特定。
  - 現場指揮官への「純粋なタスク（What）」の発行。

### 3. 現場指揮官 (Field Commander / Claude Code, Local LLMs)
- **役割**: **「実行」**。
- **ツール**: Claude Code, Cursor, VS Code.
- **責務**:
  - 参謀本部から渡された仕様書・指示書に基づく実装。
  - **禁止事項**: 独断による仕様の変更、および仕様書に基づかない場当たり的なバグ修正。

## 核心原則 (Core Philosophy)
1. **Single Source of Truth**: 真実は常にクラウド上のドキュメント（Google Drive等）にあり、ローカルのコードはただの「影」である。
2. **Reverse Sync**: 実装時にエラーが出た場合、コードを修正してはならない。仕様書を修正し、再生成することで解決する。
3. **No Micro-Management**: 人間はAIのコードを一行ずつチェックしない。仕様書の整合性のみをチェックする。
