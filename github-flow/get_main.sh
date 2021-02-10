git checkout main

git fetch

new_requirements=false
for filename in `git diff --name-only origin/main`; do [[ $filename =~ requirements/.*.txt ]] && new_requirements=true ; done

git pull
if $new_requirements ; then
    echo "Installing updated requirements"
    pip install -r requirements.txt
fi
git branch --merged | egrep -v "(^\*|main)" | xargs git branch -d

echo "Applying migrations"
python manage.py migrate
