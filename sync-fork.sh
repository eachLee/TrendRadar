#!/bin/bash
# 一键同步 fork 的仓库到最新版本

echo "🔄 开始同步上游仓库..."
git fetch upstream
if [ $? -ne 0 ]; then
    echo "❌ 获取上游更新失败，请检查 upstream 是否配置正确"
    exit 1
fi

echo "📥 正在合并更新..."
git checkout master
git rebase upstream/master

echo "☁️  推送到你的远程仓库..."
git push origin master

echo "✅ 同步完成！"