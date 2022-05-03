#!/bin/bash
set -e
GIT_REPO_URL=$(git config --get remote.origin.url)
#sed -i 's/if(m)for(n.handler&&/if(m)for(n.handler&&/g' gitbook/theme.js
cd _book
sed -i '' 's/if(m)for(n.handler/if(false)for(n.handler/g' gitbook/theme.js # -i 要加空格，否则报错。感觉和liunx中的不太一样
mkdir .deploy
cp -R ./* .deploy
cd .deploy
git init .
git remote add github $GIT_REPO_URL
git checkout -b gh-pages
git add .
git commit -am "Static site deploy"
git push github gh-pages --force
cd ..
rm -rf .deploy
