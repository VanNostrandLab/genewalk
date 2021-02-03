#!/usr/bin/env bash
set -e
unset PYTHONPATH

app=genewalk
cwd="$( cd .; pwd -P )"
venv="${cwd}/venv"
echo sed -i "s|ENVIRONMENT|${venv}/environment.sh|" "${cwd}/${app}/cli.py"
sed -i "s|ENVIRONMENT|${venv}/environment.sh|" "${cwd}/${app}/cli.py"
"${venv}/bin/pip" install --prefix="${venv}" --upgrade --force-reinstall .
sed -i "s|${venv}/environment.sh|ENVIRONMENT|" "${cwd}/${app}/cli.py"