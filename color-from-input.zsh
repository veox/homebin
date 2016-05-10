#!/usr/bin/env zsh
# take input, assign color (use in setting $PROMPT color)
# TODO: proper function /w `return`, not `echo`
# TODO: match table instead of `case`

#allcolors=`echo ${(o)color}`
mycolor=''

hash_to_color ()
{
    case $1 in
	'0') mycolor='blue' ;;
	'1') mycolor='blue' ;;
	'2') mycolor='cyan' ;;
	'3') mycolor='cyan' ;;
	'4') mycolor='cyan'  ;;
	'5') mycolor='red' ;;
	'6') mycolor='red' ;;
	'7') mycolor='red' ;;
	'8') mycolor='yellow'   ;;
	'9') mycolor='yellow' ;;
	'a') mycolor='cyan' ;;
	'b') mycolor='magenta' ;;
	'c') mycolor='green' ;;
	'd') mycolor='green' ;;
	'e') mycolor='green' ;;
	'f') mycolor='black' ;;
	*)   mycolor='black' ;;
    esac
    echo $mycolor
}

# read from file or stdin
# https://stackoverflow.com/questions/6980090/how-to-read-from-file-or-stdin-in-bash
while read line
do
      mycolor=`echo $line | md5sum | head -c1`
      mycolor=`hash_to_color $mycolor`
      echo $mycolor
done < "${1:-/dev/stdin}"
