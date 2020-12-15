# Scripts for our GIT and Favro flow

These bash scripts help speed up development according to new GIT and Favro flow
with minimal efforts and with naming style in bounds of naming rules.

## Step 1. Create a new branch based on the master

The script `new_branch.sh` intended to fastly create new branch from the master with name
according to naming rules:

### Examples of use

`new_branch.sh -f -c 1597 -m extend-newsletter-api`
 Sets up branch `'feature/COG-1597-extend-newsletter-api'` to track remote branch 'master' from 'origin'.

`new_branch.sh -d -f -c 1597 -m extend-newsletter-api`
 Sets up branch `'feature/COG-1597-extend-newsletter-api'` to track remote branch 'development' from 'origin'.

`new_branch.sh -b -c 1597 -m fix-newsletter-api`
 Sets up branch `'fix/COG-1597-fix-newsletter-api'` to track remote branch 'master' from 'origin'.

`new_branch.sh -c 1597 -m extend-newsletter-api`
 Sets up branch `'chore/COG-1597-extend-newsletter-api'` to track remote branch 'master' from 'origin'.

`new_branch.sh -r -v 0.11.8`
 Sets up branch `'release/0.11.8'` to track remote branch 'master' from 'origin'.

## Step 2. Merge developed work from the branch to the development branch

The script `merge_into_development.sh` updates (merges) code developed from the branch to the development branch.
It should be run within a branch to merge.
It detects current branch name and doesn't require any command-line parameter.

## Step 3. Create a PR with the code developed, get it reviewed, set it to QA on the development environment

## Step 4. Set it to QA on the staging environment

## Step 5. Set it to QA on the production environment
