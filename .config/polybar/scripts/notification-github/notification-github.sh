#!/bin/sh

TOKEN="e528769f82dc2f0edf7519b7931353460c5f1dcc"

notifications=$(curl -fs https://api.github.com/notifications?access_token=$TOKEN | jq ".[].unread" | grep -c true)

if [ "$notifications" -gt 0 ]; then
    echo "# $notifications"
else
    echo ""
fi
