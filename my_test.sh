#!/bin/bash

# progression bar not really useful 
# source ./src/progression_bar.sh 4

./src/return_value_test.sh 1 './a.out' 0
rv1=$?

./src/return_value_test_with_file.sh 2 './test.sh' 'test.txt' 0
rv2=$?

./src/cmp_output.sh 3 './test.sh' 'buffer'
rv3=$?

./src/elapsed_time_execution.sh 4 ls 0
rv4=$?

./src/final_report_test.sh "$rv1 $rv2 $rv3 $rv4"
