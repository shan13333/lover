#!/bin/bash
# 自动更新版本号脚本
# 用法: bash update_version.sh

VER=$(date +%Y.%m.%d)
COUNT=$(grep -c "$VER" lover.html)
COUNT=$((COUNT + 1))
FULL="$VER.$COUNT"
MAJOR="6.$((15 + COUNT - 1))"

echo "Updating to version: $FULL (v$MAJOR)"

# lover.html
sed -i "s/const VERSION=\".*\";/const VERSION=\"$FULL\"; \/\/ v$MAJOR/" lover.html
sed -i "s/Echo v[0-9.]* ·/Echo v$MAJOR ·/" lover.html

# manifest.json
sed -i "s/\"version\": \"[0-9.]*\"/\"version\": \"$MAJOR\"/" manifest.json

# sw.js
sed -i "s/echo-v[0-9.]*/echo-v$MAJOR/" sw.js

echo "Done. Version: v$MAJOR ($FULL)"
