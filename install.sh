#!/usr/bin/env bash
set -e
unset PYTHONPATH

app=genewalk
cwd="$( cd .; pwd -P )"
venv="${cwd}/venv"
conda create --prefix="${venv}" python=3.8

read -r -d '' environment << EOF || true
#!/usr/bin/env bash

unset PYTHONPATH
export PATH="${venv}/bin:\$PATH"
EOF
echo "${environment}" > "${venv}/environment.sh"
"${cwd}/update.sh"

read -r -d '' script << EOF || true
#!/usr/bin/env bash

source ${venv}/environment.sh
${app} \$@
EOF
echo "${script}" > "${cwd}/${app}-hpc"
chmod +x "${cwd}/${app}-hpc"
