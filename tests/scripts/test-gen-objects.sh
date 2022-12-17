#!/usr/bin/env bash

set -e

DEBUG=""
TMP_DIR=/tmp/arx
mkdir -p "${TMP_DIR}"

if [[ "${1}" == "--debug" ]]; then
  DEBUG="gdb --args"
fi

TEST_DIR_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && cd .. && pwd )"

# load utils functions
. "${TEST_DIR_PATH}/scripts/utils.sh"

KALEIDOSCOPE="${DEBUG} ./build/kaleidoscope"


for test_name in "average" "fibonacci"; do
  print_header "${test_name}"
  ${KALEIDOSCOPE} < "${TEST_DIR_PATH}/${test_name}.src"

  clang++ "${TEST_DIR_PATH}/main_${test_name}.cpp" output.o -o main
  ./main
done
