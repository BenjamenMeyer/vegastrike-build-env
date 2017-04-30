#!/bin/bash

VEGASTRIKE_DIR="${HOME}/vegastrike"
VEGASTRIKE_BUILD_DIR="${HOME}/build"
VEGASTRIKE_SETUP_DIR="${VEGASTRIKE_BUILD_DIR}/vssetup"
VEGASTRIKE_APP_DIR="${VEGASTRIKE_BUILD_DIR}/vs"

SVN_URL=svn://svn.code.sf.net/p/vegastrike/code/trunk

if [ ! -d ${VEGASTRIKE_DIR} ]; then
	svn checkout "${SVN_URL}" "${VEGASTRIKE_DIR}"
fi

# DIRS_TO_MAKE="${VEGASTRIKE_BUILD_DIR}
#${VEGASTRIKE_SETUP_DIR}
#${VEGASTRIKE_APP_DIR}"
#export IFS="
#"

declare -A DIRS_TO_MAKE
DIRS_TO_MAKE[0]="${VEGASTRIKE_BUILD_DIR}"
DIRS_TO_MAKE[1]="${VEGASTRIKE_SETUP_DIR}"
DIRS_TO_MAKE[2]="${VEGASTRIKE_APP_DIR}"

for A_DIR in ${DIRS_TO_MAKE[@]}
do
	echo "Creating ${A_DIR}..."
	mkdir -p "${A_DIR}"
done

pushd "${VEGASTRIKE_SETUP_DIR}"
	
	cmake "${VEGASTRIKE_DIR}/vegastrike/setup"
	make

# popd

pushd "${VEGASTRIKE_APP_DIR}"
	cmake "${VEGASTRIKE_DIR}/vegastrike"
	# Mesh LOD not compatible with libogre 1.9
	# work around is to specify the make target
	# instead of the generic `all` target
	# https://sourceforge.net/p/vegastrike/bugs/679/
	make vegastrike
# popd
