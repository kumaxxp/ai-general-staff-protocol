#!/bin/bash
# =============================================================================
# launch_fleet.sh - 方面軍一斉起動スクリプト
# =============================================================================
# 
# 使用方法:
#   bash launch_fleet.sh [project_name]
#
# 引数:
#   project_name: プロジェクト名（省略時は現在のディレクトリ名）
#
# 概要:
#   tmux を使用して連合艦隊司令長官（統括）と各方面軍を
#   一斉に起動する。
#
# 前提条件:
#   - tmux がインストールされていること
#   - claude (Claude Code CLI) がインストールされていること
#   - create_fleet.sh で worktree が展開済みであること
#
# =============================================================================

set -e  # エラー時に停止

# カラー出力
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}  方面軍一斉起動スクリプト v1.0${NC}"
echo -e "${BLUE}========================================${NC}"

# プロジェクト名の取得
if [ -n "$1" ]; then
    PROJECT_NAME="$1"
else
    PROJECT_NAME=$(basename "$(pwd)")
fi

# プロジェクトのベースディレクトリ
PROJECT_BASE=$(dirname "$(pwd)")

SESSION="fleet-${PROJECT_NAME}"

echo ""
echo -e "${YELLOW}プロジェクト名:${NC} $PROJECT_NAME"
echo -e "${YELLOW}セッション名:${NC} $SESSION"
echo ""

# tmux がインストールされているかチェック
if ! command -v tmux &> /dev/null; then
    echo -e "${RED}エラー: tmux がインストールされていません。${NC}"
    echo "インストール: sudo apt install tmux"
    exit 1
fi

# claude がインストールされているかチェック
if ! command -v claude &> /dev/null; then
    echo -e "${RED}エラー: claude (Claude Code CLI) がインストールされていません。${NC}"
    exit 1
fi

# 既存のセッションがあれば確認
if tmux has-session -t "$SESSION" 2>/dev/null; then
    echo -e "${YELLOW}既存のセッション '$SESSION' があります。${NC}"
    echo "再接続しますか？ (y) / 破棄して新規作成しますか？ (n)"
    read -r response
    if [ "$response" = "y" ]; then
        tmux attach -t "$SESSION"
        exit 0
    else
        tmux kill-session -t "$SESSION"
        echo "既存セッションを破棄しました。"
    fi
fi

echo -e "${GREEN}方面軍を起動中...${NC}"

# ======================================
# 統括セッション（連合艦隊司令長官）
# ======================================
tmux new-session -d -s "$SESSION" -n "commander"
tmux send-keys -t "$SESSION:commander" "cd ${PROJECT_BASE}/${PROJECT_NAME} && echo '⚓ 連合艦隊司令長官 - 待機中' && claude" C-m

# ======================================
# FrontEnd方面軍
# ======================================
if [ -d "${PROJECT_BASE}/${PROJECT_NAME}-frontend" ]; then
    tmux new-window -t "$SESSION" -n "frontend"
    tmux send-keys -t "$SESSION:frontend" "cd ${PROJECT_BASE}/${PROJECT_NAME}-frontend && echo '🚢 FrontEnd方面軍 - 待機中' && claude --dangerously-skip-permissions" C-m
    echo -e "  ${GREEN}FrontEnd方面軍 起動${NC}"
else
    echo -e "  ${YELLOW}FrontEnd方面軍 スキップ（worktree なし）${NC}"
fi

# ======================================
# BackEnd方面軍
# ======================================
if [ -d "${PROJECT_BASE}/${PROJECT_NAME}-backend" ]; then
    tmux new-window -t "$SESSION" -n "backend"
    tmux send-keys -t "$SESSION:backend" "cd ${PROJECT_BASE}/${PROJECT_NAME}-backend && echo '🚢 BackEnd方面軍 - 待機中' && claude --dangerously-skip-permissions" C-m
    echo -e "  ${GREEN}BackEnd方面軍 起動${NC}"
else
    echo -e "  ${YELLOW}BackEnd方面軍 スキップ（worktree なし）${NC}"
fi

# ======================================
# Test方面軍
# ======================================
if [ -d "${PROJECT_BASE}/${PROJECT_NAME}-test" ]; then
    tmux new-window -t "$SESSION" -n "test"
    tmux send-keys -t "$SESSION:test" "cd ${PROJECT_BASE}/${PROJECT_NAME}-test && echo '🚢 Test方面軍 - 待機中' && claude --dangerously-skip-permissions" C-m
    echo -e "  ${GREEN}Test方面軍 起動${NC}"
else
    echo -e "  ${YELLOW}Test方面軍 スキップ（worktree なし）${NC}"
fi

# ======================================
# Infra方面軍
# ======================================
if [ -d "${PROJECT_BASE}/${PROJECT_NAME}-infra" ]; then
    tmux new-window -t "$SESSION" -n "infra"
    tmux send-keys -t "$SESSION:infra" "cd ${PROJECT_BASE}/${PROJECT_NAME}-infra && echo '🚢 Infra方面軍 - 待機中' && claude --dangerously-skip-permissions" C-m
    echo -e "  ${GREEN}Infra方面軍 起動${NC}"
else
    echo -e "  ${YELLOW}Infra方面軍 スキップ（worktree なし）${NC}"
fi

echo ""
echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}  方面軍起動完了${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""

echo -e "${YELLOW}操作方法:${NC}"
echo "  Ctrl+b n  : 次のウィンドウ"
echo "  Ctrl+b p  : 前のウィンドウ"
echo "  Ctrl+b d  : セッションからデタッチ"
echo "  tmux attach -t $SESSION : 再接続"
echo ""

# セッションにアタッチ
echo -e "${GREEN}セッションに接続します...${NC}"
tmux attach -t "$SESSION"
