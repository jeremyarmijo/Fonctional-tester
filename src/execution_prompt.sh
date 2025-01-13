function execution_prompt {
    exec_string="######### Executing tests ... #########"
    line_length=$(tput cols)

    printf "$exec_string"
    nb=0
    while [ $nb != $(($line_length - ${#exec_string})) ]; do
        printf "#"
        nb=$(($nb + 1))
    done
    nb=0
    printf "\n"
    to_execute=$(echo $@)
    eval $to_execute
    RETURN_PROMPT=$(echo $?)
    while [ $nb != $line_length ]; do
        printf "#"
        nb=$(($nb + 1))
    done
    printf "\n"
    return $RETURN_PROMPT
}

execution_prompt "$1"
