#!/bin/bash

function final_report {
    nb=0
    nb_tests_not_passed=0
    arg=$(printf "$")

    while [ $nb != "$#" ]; do
        arg=$(eval echo "$arg$(printf "$(($nb + 1))")")
        if [ "$arg" -ne 0 ]; then
            nb_tests_not_passed=$(($nb_tests_not_passed + 1))
        fi
        arg=$(printf "$")
        nb=$(($nb + 1))
    done
    echo -e "\n\e[35m################## Test report ##################\e[0m"
    echo -e "\e[35m#\t\t\t\t\t\t#\e[0m"
    if [ $nb_tests_not_passed == 0 ]; then
        echo -e "\e[35m#\e[0m\e[0m\t\t\e[32mALL TEST PASSED !\e[0m\t\t\e[35m#\e\e[0m"
        echo -e "\e[35m#\t\t\t\t\t\t#\e[0m"
        echo -e "\e[35m#################################################\e[0m"
        exit 0
    fi
    echo -e "\e[35m#\e\e[0m\t\t\e[31m$nb_tests_not_passed TEST FAILURE !\e[0m\t\t\e[35m#\e\e[0m"
    echo -e "\e[35m#\t\t\t\t\t\t#\e[0m"
    echo -e "\e[35m#################################################\e[0m"
}

final_report $1 $2 $3