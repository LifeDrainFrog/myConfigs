#!bin/bash

# set git configuration
git config --global user.name tizee-bot
git config --global user.email tizee-bot@travis-ci.org

git add --all
git commit -m ":robot: generated readme doc"
git push -q "https://${GITHUB_TOKEN}@githun.com/${TRAVIS_REPO_SLUG}.git" HEAD:master

