#!/bin/bash

function return_value_test {
    to_execute=$1
    test_nb=$2
    value_expected=$3
    value_NOT_expected=$4
    Exit_status=0
    crash=139

    echo -e "\n\e[36mExecute [$to_execute]\e[0m"
    echo -e "\e[32mExpected $value_expected\e[0m | \e[31mNot expected $value_NOT_expected\e[0m"

    echo -e "######### Executing tests ... #########"
    $to_execute
    return_value=$?
    echo -e "#######################################"

    echo -e "\e[34m######### Personal return_value_test $test_nb ##########\e[0m"
    echo -e "\e[34m#\t\t\t\t\t\t#\e[0m"
    if  [ $return_value -eq $value_expected ]; then
        echo -e "\e[34m#\t\e[0m\e\e[32m[PASS] return value = 0\e[0m\t\t\t\e[34m#\e[0m"
        Exit_status=0
    elif [ $return_value -eq $value_NOT_expected ]; then
        echo -e "\e[34m#\t\e[0m\e\e[31m[FAIL] return value = $return_value\e[0m\t\t\e[34m#\e[0m"
        Exit_status=84
    else
        echo -e "\e[34m#\t\e[0m\e\e[35mPotential crash return value = [$return_value]\e[0m\t\e[34m#\e[0m"
        Exit_status=$return_value
    fi
    echo -e "\e[34m#\t\t\t\t\t\t#\e[0m"
    echo -e "\e[34m#################################################\e[0m"
    return $Exit_status
}

return_value_test $1 $2 $3 $4