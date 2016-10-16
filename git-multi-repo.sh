#! /bin/bash

# Check for git
GIT=`which git`
if [[ -z ${GIT} ]]; then
    echo "Cannot find 'git', aborting"
    exit 1
fi

# Get the list of repos, replace ',' with ' '
REPOS=${1//,/ }
shift

for repo in $REPOS; do
    echo "--> Repo: ${repo}"
    if [[ ! -d ${repo} ]]; then
        echo "Error: ${repo} is not a valid sub-directory, skipping"
    else
        ${GIT} -C ${repo} ${@}
    fi

    echo ""
done

echo "Done."
exit 0
