#!/bin/bash
set -e

echo "--- PRE-BUILD DIRECTORY LISTING ---"
pwd
ls -la chat

echo "--- RUNNING BUILD ---"
corepack pnpm --prefix chat build

echo "--- POST-BUILD OUTPUT CHECK ---"
ls -la chat/.next

echo "--- CHECKING FOR SERVER OUTPUT ---"
if [ -d chat/.next/server ]; then
  ls -la chat/.next/server
else
  echo "NO .next/server DIRECTORY FOUND"
fi

echo "--- BUILD COMPLETE ---"
