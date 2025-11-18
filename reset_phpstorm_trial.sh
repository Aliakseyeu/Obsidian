#!/usr/bin/env bash
echo "Start reset trial"

rm other_test_back.xml 2> /dev/null
cp other_test.xml other_test_back.xml
sed -i '/&quot;evlsprt/d' other_test.xml 2> /dev/null

rm ~/.java/.userPrefs_back 2> /dev/null
cp -rf ~/.java/.userPrefs ~/.java/.userPrefs_back
rm -rf ~/.java/.userPrefs

echo "End reset trial"
