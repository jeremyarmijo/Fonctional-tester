#!/bin/bash

source ./src/progression_bar.sh 3

source ./src/return_value_test.sh './a.out' 1 0 84
rv1=$?

source ./src/return_value_test_with_file.sh './test.sh' 'test.txt' 2 0 84
rv2=$?

source ./src/cmp_output.sh './test.sh' 'buffer' 3
rv3=$?

source ./src/final_report_test.sh $rv1 $rv2 $rv3

