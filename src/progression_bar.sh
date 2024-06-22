function progression_bar {
    nb_step=$1
    var=0

    printf "\033[30m\033[107mChecking your $nb_step tests :\033[0m\n"
    sleep 0.02
    if [ $nb_step -gt 10 ];then
        nb_step=10
    fi
    printf "["
    while [ $var != $(($nb_step*10)) ]; do
        line_length=$(tput cols)
        sleep 0.02
        printf "#"
        printf "\033[s"
        printf "\033[$(($line_length - $var - 7))C $(($var / $nb_step))0%%"
        printf "\033[u"
        var=$(($var + 1))
    done
    printf "]"
    printf "\033[$(($line_length - $var - 7))C $(($var / $nb_step))0%%\n"
    sleep 0.2
}

progression_bar $1