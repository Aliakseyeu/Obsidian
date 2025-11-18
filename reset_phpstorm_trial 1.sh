#!/usr/bin/env bash
echo "Start reset trial"

otherPath=~/.config/JetBrains/PhpStorm2024.1/options/other.xml
otherPathBack=~/.config/JetBrains/PhpStorm2024.1/options/other_back.xml

rm "$otherPathBack" 2> /dev/null
cp "$otherPath" "$otherPathBack"
sed -i '/&quot;evlsprt/d' "$otherPath" 2> /dev/null

rm ~/.java/.userPrefs_back 2> /dev/null
cp -rf ~/.java/.userPrefs ~/.java/.userPrefs_back
rm -rf ~/.java/.userPrefs

echo "End reset trial"
