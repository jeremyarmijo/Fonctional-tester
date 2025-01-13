#!/bin/bash

function return_value_test {
    test_nb=$1
    to_execute=$2
    value_expected=$3
    Exit_status=0

    echo -e "\e[35mTest: return_value_test\e[0m"
    echo -e "\e[36mExecute [$to_execute]\e[0m"
    echo -e "\e[32mExpected $value_expected\e[0m"
    ./src/execution_prompt.sh "$to_execute"
    return_value=$?
    echo -e "\e[34m######### Personal return_value_test $test_nb ##########\e[0m"
    if  [ $return_value -eq $value_expected ]; then
        echo -e "\e[34m#\t\e[0m\e\e[32m[PASS] return value = 0\e[0m\t\t\t\e[34m#\e[0m"
        Exit_status=0
    else
        echo -e "\e[34m#\t\e[0m\e\e[31m[FAIL] return value = $return_value\e[0m\t\t\e[34m#\e[0m"
        Exit_status=84
    fi
    echo -e "\e[34m#################################################\e[0m\n"
    return $Exit_status
}

return_value_test "$1" "$2" "$3"