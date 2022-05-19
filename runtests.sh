#!/usr/bin/env bash

TEST_DIR=./tests

declare -a TESTS=(
    "example-test"
)

for test in ${TESTS[@]}; do
    $TEST_DIR/$test --log_level=message
done


