#!/bin/bash
# 
# usege:
#   > genpass.sh 15 4
#
# option1: [int] 1 - 255
#   Specify Digit of the Generate Password.
# option2: [int] 1 - 4
#   Specify chars.
#     1 ... only Numbers
#     2 ... only Numbers and lower alphabets.
#     3 ... Numbers and alphabets.
#     4 ... Numbers , alphabets and symbols.
#

INTEGER=(0 1 2 3 4 5 6 7 8 9)
LOWER=(a b c d e f g h i j k l m n o p q r s t u v w x y z)
UPPER=(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
SYMBOL=('!' '"' '#' '$' '%' "'" '(' ')' '*' '+' ',' '-' '.' '/' ':' ';' '<' '=' '>' '?' '@' '[' '\' ']' '^' '_' '`' '{' '|' '}' '~')

string=()

for i in `seq 2 ${1:-15}`
do
    key=$((RANDOM % ${2:-4}))
    case $key in
	0 ) string+=${INTEGER[$((RANDOM % 10))]} ;;
	1 ) string+=${LOWER[$((RANDOM % 26))]} ;;
	2 ) string+=${UPPER[$((RANDOM % 26))]} ;;
	3 ) string+=${SYMBOL[$((RANDOM % 31))]} ;;
    esac
done
echo $string

exit 0
