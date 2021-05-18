#!/usr/bin/env sh

set -e

npm run build

cd dist

git init
git add .
git commit -m "New Deployment"
git push -f git@github.com:kenzo44/kenzo44.github.io.git master:gh-pages

cd -