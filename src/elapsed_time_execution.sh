#!/bin/bash

function elapsed_time_execution {
    test_nb=$1
    to_execute=$2
    expected_time=$3
    execution_time="0"
    time_before_exec=$(date +\"%T\")
    time_before_exec=$(echo "$time_before_exec" | tr -cd '[:digit:]. ')
    rv_value=0

    echo -e "\e[35mTest: elapsed time execution\e[0m"
    echo -e "\e[36mExecute [$to_execute]\e[0m"
    echo -e "\e[32mExpected time $expected_time seconds \e[0m"
    ./src/execution_prompt.sh $to_execute
    time_after_exec=$(date +\"%T\")
    time_after_exec=$(echo "$time_after_exec" | tr -cd '[:digit:]. ')
    echo -e "\e[34m############# Test execution time $test_nb #############\e[0m"
    execution_time=$(($time_after_exec - $time_before_exec))
    if [ $execution_time -gt $expected_time ]; then
        echo -e "\e[34m#\t\e[0m\e\e[31m[FAIL] time execution = $execution_time \e[0m\t\t\e[34m#\e[0m"
        rv_value=84
        else
            echo -e "\e[34m#\t\e[0m\e\e[32m[PASS] time execution = $execution_time \e[0m\t\t\e[34m#\e[0m"
    fi
    echo -e "\e[34m#################################################\e[0m\n"
    return $rv_value
}

elapsed_time_execution $1 $2 $3