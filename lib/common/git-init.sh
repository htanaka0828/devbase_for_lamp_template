#!/bin/bash

# REPOS=${1}
# DIR=${2:-${REPOS}}
# BRANCH=${3:-"master"}
# ORGANIZATION="" # set youre git organization

# if [ -z "${REPOS}" ]; then 
#   echo "please set a repository name."
#   exit;
# fi

# if ! git -C /opt/src/${DIR} status >/dev/null 2>&1; then
#   git config --global core.autocrlf false
#   git config --global core.filemode false
#   git clone -b ${BRANCH} ${ORGANIZATION}/${REPOS}.git /opt/src/${REPOS}
#   git --git-dir=/opt/src/${DIR}/.git config core.autocrlf false
#   git --git-dir=/opt/src/${DIR}/.git config core.filemode false
# fi

