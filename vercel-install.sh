#!/bin/bash
set -e

echo "--- ENV CHECK ---"
node -v
npm -v
which pnpm
pnpm -v
corepack enable
corepack use pnpm@10.33.0
which pnpm
pnpm -v
corepack pnpm -v
corepack pnpm config get registry

echo "--- PRE-INSTALL DIRECTORY LISTING ---"
pwd
ls -la

echo "--- CHAT SUBDIR CONTENTS ---"
ls -la chat

echo "--- CHAT PACKAGE.JSON EXISTS? ---"
if [ -f chat/package.json ]; then
  echo "FOUND chat/package.json"
else
  echo "MISSING chat/package.json"
fi

echo "--- RUNNING INSTALL ---"
corepack pnpm --prefix chat install

echo "--- POST-INSTALL NODE_MODULES CHECK ---"
ls -la chat/node_modules | head -20

echo "--- INSTALL COMPLETE ---"
