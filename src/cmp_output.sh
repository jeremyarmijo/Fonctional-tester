#!/bin/bash

function cmp_output {
    to_execute=$2
    result=$3
    test_nb=$1
    Exit_status=0
    file_content="NOTHING"

    echo -e "\e[35mTest: compare output\e[0m"
    echo -e "\e[36mDiff [$to_execute] with [$result]\e[0m"
    (diff $to_execute $result | wc -l) > .test
    file_content=$(cat .test)
    rm .test
    if [ $file_content != 0 ]; then
        file_content=$(($file_content - 2))
    fi
    ./src/execution_prompt.sh "diff $to_execute $result"
    echo -e "\e[34m######### Personal compar_output_test $test_nb #########\e[0m"
    if  [ $file_content == "0" ]; then
        echo -e "\e[34m#\e[0m\e\e[32m[PASS] 0 diff between $to_execute and $result\e[0m\t\e[34m#\e[0m"
        Exit_status=0
    else
        echo -e "\e[34m#\t\e[0m\e\e[31m[FAIL] nb ligne diff = $file_content\e[0m\t\t\e[34m#\e[0m"
        Exit_status=84
    fi
    echo -e "\e[34m#################################################\e[0m\n"
    return $Exit_status
}

cmp_output $1 $2 $3