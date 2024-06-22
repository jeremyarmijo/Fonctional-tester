#!/bin/bash

function return_value_test_with_file {
    to_execute=$1
    file_path=$2
    test_nb=$3
    value_expected=$4
    value_NOT_expected=$5
    Exit_status=0

    echo -e "\n\e[36mExecute [$to_execute $file_path]\e[0m"
    echo -e "\e[32mExpected $value_expected\e[0m | \e[31mNot expected $value_NOT_expected\e[0m"

    echo -e "######### Executing tests ... #########"
    $to_execute $file_path
    return_value=$?
    echo -e "#######################################"

    echo -e "\e[34m######### Personal return_value_test $test_nb ##########\e[0m"
    echo -e "\e[34m#\t\t\t\t\t\t#\e[0m"
    if  [ $return_value -eq $value_expected ] && [ -f $file_path ]; then
        echo -e "\e[34m#\t\e[0m\e\e[32m[PASS] return value = 0\e[0m\t\t\t\e[34m#\e[0m"
        Exit_status=0
    elif [ $return_value -eq $value_NOT_expected ] && [ -f $file_path ]; then
        echo -e "\e[34m#\t\e[0m\e\e[31m[FAIL] return value = 84\e[0m\t\t\t\e[34m#\e[0m"
        Exit_status=84
    else
        echo -e "\e[34m#\t\e[0m\e[35mReturn value = [$return_value] arg 2 not a file\e[0m\t\t\t\e[34m#\e[0m"
        Exit_status=$return_value
    fi
    echo -e "\e[34m#\t\t\t\t\t\t#\e[0m"
    echo -e "\e[34m#################################################\e[0m"
    return $Exit_status
}

return_value_test_with_file $1 $2 $3 $4 $5