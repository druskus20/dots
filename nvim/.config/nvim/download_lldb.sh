#!/bin/sh

[ -z "$1" ] && exit 1

name="codelldb-x86_64-linux"
path="$1"
current_dir="$(pwd)"

cd "$path" || exit 1

rm -rf build
mkdir build
cd build 

echo "Downloading latest release..."

# Download the latest release
curl -s https://api.github.com/repos/vadimcn/vscode-lldb/releases/latest \
| grep "$name.vsix" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi - > /dev/null 2>&1

echo "Unpacking..."

# Rename to zip
mv "$name.vsix" "$name.zip"

# Unzip
unzip "$name.zip" -d codelldb > /dev/null 

# Exit and remove ./build
cd ..
rm -rf lldb
cp -r build/codelldb/extension ./lldb
rm -rf build

cd "$current_dir"
