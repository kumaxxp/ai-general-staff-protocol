# AGSP 環境管理ルール

**電番:** RULE-ENV-001  
**発効日:** 2026-01-31  
**適用範囲:** 全方面軍

---

## 一、Python仮想環境の必須化

### 1.1 基本原則

**Pythonプロジェクトでは、仮想環境（venv）の使用を必須とする。**

システムPythonへの直接インストールは禁止。

### 1.2 仮想環境作成手順

```bash
# プロジェクトディレクトリで実行
cd /path/to/project

# 仮想環境作成
python -m venv .venv

# 仮想環境有効化（Linux/macOS）
source .venv/bin/activate

# 仮想環境有効化（Windows）
.\.venv\Scripts\Activate.ps1

# 依存関係インストール
pip install -e ".[dev]"
```

### 1.3 確認方法

```bash
# 仮想環境が有効か確認
which python
# 出力例: /path/to/project/.venv/bin/python

# システムPythonでないことを確認
# NG例: /usr/bin/python, /usr/local/bin/python
```

### 1.4 禁止事項

| 禁止行為 | 理由 |
|----------|------|
| `pip install` をvenv外で実行 | システム環境汚染 |
| `sudo pip install` | 権限昇格による環境破壊リスク |
| `--break-system-packages` の使用 | システムパッケージとの競合 |

---

## 二、仮想環境の命名規則

| 環境 | ディレクトリ名 |
|------|---------------|
| 開発環境 | `.venv` |
| テスト環境 | `.venv-test`（必要な場合） |

---

## 三、方面軍別チェックリスト

### Infra方面軍
- [ ] `.venv/` が `.gitignore` に含まれていること
- [ ] `pyproject.toml` に依存関係が定義されていること
- [ ] README.mdに仮想環境セットアップ手順が記載されていること

### 全方面軍
- [ ] 作業開始前に `source .venv/bin/activate` を実行すること
- [ ] `which python` で仮想環境内のPythonであることを確認すること

---

## 四、違反時の対応

仮想環境外へのインストールが判明した場合：

1. システムからパッケージをアンインストール（可能な場合）
2. 仮想環境を作成
3. 仮想環境内に再インストール
4. 動作確認

```bash
# 修復手順
cd /path/to/project
python -m venv .venv
source .venv/bin/activate
pip install -e ".[dev]"
```

---

以上
