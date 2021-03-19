#!/bin/sh

git fetch

branch=`git branch | grep \* | cut -d ' ' -f2`
local_changes=`git diff-index --quiet HEAD --; echo $?`
echo "[MERGE] On branch $branch"

if $local_changes;
then
  echo "[MERGE] Stashing local changes"
  if ! git stash
  then
      echo "[MERGE] Failed to stash local changes"
      exit 1
  else
    echo "[MERGE] Successfully stashed local changes"
  fi
fi

echo "[MERGE] Checking out development"

if ! git checkout development
then
    echo "[MERGE] Failed to checkout development"
    exit 1
else
  echo "[MERGE] Successfully checkout development"
fi

if ! git reset --hard origin/development
then
    echo "[MERGE] Failed to reset development"
    exit 1
else
  echo "[MERGE] Successfully reset development"
fi

if ! git pull origin development
then
    echo "[MERGE] Failed to update development with remote branch"
    exit 1
else
  echo "[MERGE] Successfully updated development"
fi

if ! git merge $branch
then
    echo "[MERGE] Failed to merged $branch into development"
    exit 1
else
  echo "[MERGE] Successfully merged $branch into development"
fi

if ! git push origin development
then
    echo "[MERGE] Failed to push development"
    exit 1
else
  echo "[MERGE] Successfully pushed changes into development"
fi

echo "[MERGE] All successfull, checkout $branch"

git checkout $branch

if $local_changes;
then
  echo "[MERGE] Restore stashed local changes"
  if ! git stash pop
  then
      echo "[MERGE] Failed to restore local changes"
      exit 1
  else
    echo "[MERGE] Successfully restored local changes"
  fi
fi
