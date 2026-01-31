#!/bin/bash
# =============================================================================
# merge_fleet.sh - 方面軍統合スクリプト
# =============================================================================
# 
# 使用方法:
#   cd /path/to/your/project  # メインリポジトリ
#   bash /path/to/merge_fleet.sh [--cleanup]
#
# オプション:
#   --cleanup : マージ後に worktree と方面軍ブランチを削除
#
# 概要:
#   各方面軍のブランチを main にマージし、
#   オプションで worktree とブランチをクリーンアップする。
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
echo -e "${BLUE}  方面軍統合スクリプト v1.0${NC}"
echo -e "${BLUE}========================================${NC}"

# オプション解析
CLEANUP=false
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --cleanup) CLEANUP=true ;;
        *) echo "不明なオプション: $1"; exit 1 ;;
    esac
    shift
done

# 現在のディレクトリ情報
PROJECT_ROOT=$(pwd)
PROJECT_NAME=$(basename "$PROJECT_ROOT")

echo ""
echo -e "${YELLOW}プロジェクト名:${NC} $PROJECT_NAME"
echo -e "${YELLOW}クリーンアップ:${NC} $CLEANUP"
echo ""

# Git リポジトリかチェック
if [ ! -d ".git" ]; then
    echo -e "${RED}エラー: Git リポジトリではありません。${NC}"
    exit 1
fi

# mainブランチに切り替え
CURRENT_BRANCH=$(git branch --show-current)
if [ "$CURRENT_BRANCH" != "main" ]; then
    echo -e "${YELLOW}main ブランチに切り替え中...${NC}"
    git checkout main
fi

# 未コミットの変更があるかチェック
if ! git diff-index --quiet HEAD --; then
    echo -e "${RED}エラー: main ブランチに未コミットの変更があります。${NC}"
    echo "先にコミットまたはスタッシュしてください。"
    exit 1
fi

# 方面軍リスト
FLEETS=("frontend" "backend" "test" "infra")

echo -e "${GREEN}方面軍を統合中...${NC}"
echo ""

MERGED_COUNT=0
SKIPPED_COUNT=0

for fleet in "${FLEETS[@]}"; do
    BRANCH_NAME="fleet/${fleet}"
    WORKTREE_PATH="../${PROJECT_NAME}-${fleet}"
    
    echo -e "${BLUE}[$fleet]${NC} 処理中..."
    
    # ブランチが存在するかチェック
    if ! git show-ref --verify --quiet "refs/heads/$BRANCH_NAME"; then
        echo -e "  ${YELLOW}ブランチ $BRANCH_NAME は存在しません。スキップ。${NC}"
        ((SKIPPED_COUNT++))
        continue
    fi
    
    # マージ
    echo -e "  マージ中: $BRANCH_NAME -> main"
    if git merge "$BRANCH_NAME" --no-edit; then
        echo -e "  ${GREEN}マージ成功${NC}"
        ((MERGED_COUNT++))
    else
        echo -e "  ${RED}マージ失敗（コンフリクト発生）${NC}"
        echo "  手動でコンフリクトを解決してください。"
        echo "  解決後、再度このスクリプトを実行してください。"
        exit 1
    fi
    
    # クリーンアップ
    if [ "$CLEANUP" = true ]; then
        # worktree 削除
        if [ -d "$WORKTREE_PATH" ]; then
            echo -e "  worktree 削除中: $WORKTREE_PATH"
            git worktree remove "$WORKTREE_PATH" --force
        fi
        
        # ブランチ削除
        echo -e "  ブランチ削除中: $BRANCH_NAME"
        git branch -d "$BRANCH_NAME"
    fi
done

echo ""
echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}  方面軍統合完了${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""

echo "【統合結果】"
echo -e "  マージ成功: ${GREEN}$MERGED_COUNT${NC} 個"
echo -e "  スキップ:   ${YELLOW}$SKIPPED_COUNT${NC} 個"
echo ""

if [ "$CLEANUP" = true ]; then
    echo "【クリーンアップ完了】"
    echo "  worktree と方面軍ブランチを削除しました。"
else
    echo -e "${YELLOW}【注意】${NC}"
    echo "  worktree と方面軍ブランチは残っています。"
    echo "  削除する場合は --cleanup オプションを付けて再実行してください。"
fi

echo ""

# worktree 一覧表示
echo "【現在の worktree 一覧】"
git worktree list

echo ""
echo -e "${GREEN}敬礼！${NC}"
