#!/bin/bash -
# genpass.sh -
#
# Description:
#      Generate a Random Password with the digit specified in the Params.
#
# Params:
#     -d : Specify the digit to be generated Pass.
#     -n : Generates a Pass with Only Numbers.
#     -l : Generates a Pass with Only Numbers and LowerCases letter.
#     -u : Generates a Pass with Numbers, LowerCases and UpperCases letter.
#     -s : Generates a Pass with Numbers, LowerCases, UpperCases and some Symbols.
#
# Usage:
#     ./genpass.sh -sd 20
#     ./genpass.sh -d 15  # default pattern is include all.
#

NUM=(0 1 2 3 4 5 6 7 8 9)
LOWER=(a b c d e f g h i j k l m n o p q r s t u v w x y z)
UPPER=(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
SYMBOL=('!' '"' '#' '$' '%' "'" '(' ')' '*' '+'
	',' '-' '.' '/' ':' ';' '<' '=' '>' '?'
	'@' '[' '\' ']' '^' '_' '`' '{' '|' '}' '~')

declare -a string

while getopts d:nlus OPT
do
    case $OPT in
        d ) if [[ $OPTARG == "" ]] ; then
               echo 'Please Specify the Num of GeneratePass digit.'
               exit 1
            fi
            DIGIT=$OPTARG ;;
        n ) PATTERN=1 ;;
        l ) PATTERN=2 ;;
        u ) PATTERN=3 ;;
        s ) PATTERN=4 ;;
        * ) echo 'Not Allowed Parameters.'
            exit 1
            ;;
    esac
done

for i in `seq 1 ${DIGIT:-15}`
do

    dice=$(($RANDOM % ${PATTERN:-4}))

    case $dice in
        0 ) string+=${NUM[$(($RANDOM % 9))]} ;;
        1 ) string+=${LOWER[$(($RANDOM % 26))]} ;;
        2 ) string+=${UPPER[$(($RANDOM % 26))]} ;;
        3 ) string+=${SYMBOL[$(($RANDOM % 14))]} ;;
    esac
done

echo $string

exit 0
