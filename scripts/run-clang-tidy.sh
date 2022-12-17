#!/usr/bin/env bash

PROJECT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && cd .. && pwd )"

set -ex

TMP_DIR=/tmp/kaleidoscope
mkdir -p ${TMP_DIR}

clang-tidy \
    --config-file="${PROJECT_PATH}/.clang-tidy" \
    --header-filter="${CONDA_PREFIX}/include" \
    --extra-arg="-I${PROJECT_PATH}/src" \
    -p=${PROJECT_PATH}/build \
    ${PROJECT_PATH}/src/*.cpp \
    ${PROJECT_PATH}/src/*.h
