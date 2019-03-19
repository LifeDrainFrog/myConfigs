#!bin/bash

# set git configuration
git config --global user.name tizee-bot
git config --global user.email tizee-bot@travis-ci.org

git add --all >/dev/null 2>&1
git commit -m ":robot: generated readme doc" >/dev/null 2>&1
git push -q "https://${GITHUB_TOKEN}@github.com/${TRAVIS_REPO_SLUG}.git" HEAD:master

