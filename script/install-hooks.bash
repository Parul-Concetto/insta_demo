#TODO:Install hooks

#!/usr/bin/env bash

GIT_DIR=$(git rev-parse --git-dir)

echo "Installing hooks..."
# this command creates symlink to our pre-commit script
ln -s ../../script/pre-commit.bash $GIT_DIR/pre-commit
echo "Done!"