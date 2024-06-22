#!/bin/bash

function cmp_output {
    to_execute=$1
    result=$2
    test_nb=$3
    Exit_status=0
    file_content="NOTHING"

    echo -e "\n\e[36mDiff [$to_execute] with [$result]\e[0m"

    echo -e "######### Executing tests ... #########"
    (diff $to_execute $result | wc -l) > .test
    diff $to_execute $result
    file_content=$(cat .test)
    rm .test
    echo -e "#######################################"

    echo -e "\e[34m######### Personal compar_output_test $test_nb #########\e[0m"
    echo -e "\e[34m#\t\t\t\t\t\t#\e[0m"
    if  [ $file_content == "0" ]; then
        echo -e "\e[34m#\e[0m\e\e[32m[PASS] 0 diff between $1 and $result\e[0m\t\e[34m#\e[0m"
        Exit_status=0
    else
        echo -e "\e[34m#\t\e[0m\e\e[31m[FAIL] nb ligne diff = $file_content\e[0m\t\t\e[34m#\e[0m"
        Exit_status=84
    fi
    echo -e "\e[34m#\t\t\t\t\t\t#\e[0m"
    echo -e "\e[34m#################################################\e[0m"
    return $Exit_status
}

cmp_output $1 $2 $3