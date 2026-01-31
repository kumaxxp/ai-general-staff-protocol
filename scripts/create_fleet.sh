#!/bin/bash
# =============================================================================
# create_fleet.sh - 方面軍展開スクリプト
# =============================================================================
# 
# 使用方法:
#   cd /path/to/your/project
#   bash /path/to/create_fleet.sh
#
# 概要:
#   現在のプロジェクトに対して git worktree を作成し、
#   4つの方面軍（FrontEnd, BackEnd, Test, Infra）を展開する。
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
echo -e "${BLUE}  方面軍展開スクリプト v1.0${NC}"
echo -e "${BLUE}========================================${NC}"

# 現在のディレクトリ情報
PROJECT_ROOT=$(pwd)
PROJECT_NAME=$(basename "$PROJECT_ROOT")

echo ""
echo -e "${YELLOW}プロジェクト名:${NC} $PROJECT_NAME"
echo -e "${YELLOW}展開元:${NC} $PROJECT_ROOT"
echo ""

# Git リポジトリかチェック
if [ ! -d ".git" ]; then
    echo -e "${RED}エラー: Git リポジトリではありません。${NC}"
    echo "このスクリプトはGitリポジトリのルートで実行してください。"
    exit 1
fi

# 未コミットの変更があるかチェック
if ! git diff-index --quiet HEAD --; then
    echo -e "${YELLOW}警告: 未コミットの変更があります。${NC}"
    echo "続行しますか？ (y/n)"
    read -r response
    if [ "$response" != "y" ]; then
        echo "中止しました。"
        exit 0
    fi
fi

# 方面軍リスト
FLEETS=("frontend" "backend" "test" "infra")

echo -e "${GREEN}方面軍を展開中...${NC}"
echo ""

for fleet in "${FLEETS[@]}"; do
    WORKTREE_PATH="../${PROJECT_NAME}-${fleet}"
    BRANCH_NAME="fleet/${fleet}"
    
    echo -e "${BLUE}[$fleet]${NC} 展開中..."
    
    # worktree が既に存在するかチェック
    if [ -d "$WORKTREE_PATH" ]; then
        echo -e "  ${YELLOW}既に存在します: $WORKTREE_PATH${NC}"
        continue
    fi
    
    # ブランチが既に存在するかチェック
    if git show-ref --verify --quiet "refs/heads/$BRANCH_NAME"; then
        echo -e "  ${YELLOW}ブランチ $BRANCH_NAME は既存です${NC}"
        git worktree add "$WORKTREE_PATH" "$BRANCH_NAME"
    else
        echo -e "  新規ブランチ: $BRANCH_NAME"
        git worktree add "$WORKTREE_PATH" -b "$BRANCH_NAME"
    fi
    
    echo -e "  ${GREEN}完了: $WORKTREE_PATH${NC}"
done

echo ""
echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}  方面軍展開完了${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""

# worktree 一覧表示
echo "【現在の worktree 一覧】"
git worktree list

echo ""
echo -e "${YELLOW}次のステップ:${NC}"
echo "1. launch_fleet.sh で方面軍を一斉起動"
echo "2. 各方面軍で作戦を実行"
echo "3. merge_fleet.sh で統合"
echo ""
echo -e "${GREEN}敬礼！${NC}"
