#!/bin/sh

git fetch

BRANCH=${1:-$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')}
UPSTREAM=${2:-'@{u}'}
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse "$UPSTREAM")
BASE=$(git merge-base @ "$UPSTREAM")

echo branch: $BRANCH
echo upstream: $UPSTREAM;
echo local: $LOCAL
echo remote: $REMOTE
echo base: $BASE
echo "***************"

if [ $LOCAL = $REMOTE ]; then
    echo "Up-to-date"
elif [ $LOCAL = $BASE ]; then
    echo "Need to pull"
    git pull origin $BRANCH
    sudo systemctl restart httpd
    sudo systemctl reload php-fpm.service
elif [ $REMOTE = $BASE ]; then
    echo "Need to push"
else
    echo "Diverged"
fi
echo "***************"
