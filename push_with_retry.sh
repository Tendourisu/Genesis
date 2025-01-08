#!/bin/bash

REPO="tendourisu/genesis"
MAX_RETRIES=1000
RETRY_DELAY=3

for ((i=1; i<=MAX_RETRIES; i++)); do
    echo "尝试推送到 Docker 仓库 (第 $i 次)..."
    docker push $REPO
    if [ $? -eq 0 ]; then
        echo "推送成功！"
        exit 0
    else
        echo "推送失败，等待 $RETRY_DELAY 秒后重试..."
        sleep $RETRY_DELAY
    fi
done

echo "多次尝试后仍然推送失败，请检查网络连接或仓库配置。"
exit 1