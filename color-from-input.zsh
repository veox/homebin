#!/usr/bin/env zsh
# take input, assign color (use in setting $PROMPT color)
# TODO: proper function /w `return`, not `echo`
# TODO: match array/table instead of `case`

#allcolors=`echo ${(o)color}`

# ========= DEFAULTS =========
mycolor='black'
verbose=0

# ========= FUNCTIONS =========
hash_to_color ()
{
    case $1 in
	'0') mycolor='blue' ;;
	'1') mycolor='blue' ;;
	'2') mycolor='cyan' ;;
	'3') mycolor='cyan' ;;
	'4') mycolor='cyan'  ;;
	'5') mycolor='black' ;;
	'6') mycolor='black' ;;
	'7') mycolor='black' ;;
	'8') mycolor='yellow'   ;;
	'9') mycolor='yellow' ;;
	'a') mycolor='magenta' ;;
	'b') mycolor='magenta' ;;
	'c') mycolor='green' ;;
	'd') mycolor='green' ;;
	'e') mycolor='green' ;;
	'f') mycolor='green' ;;
	*)   mycolor='black' ;;
    esac
    echo $mycolor
}

# FIXME: $0 returns "usage" for function call - get script name
usage ()
{
    cat << EOF
Usage: color-from-input.zsh [OPTION] [FILE]
Options:
    -h: this help
    -v: verbose
EOF
    exit 1
}

# FIXME: locale-dependent
# ========= OS-DEPENDENT =========
if [ "`which md5sum`" = "md5sum not found" ]; then
    MD5='md5'
else
    MD5='md5sum'
fi

# ========= COMMANDLINE ARGS =========
while getopts hv name
do
    case $name in
	h) usage ;;
	v) verbose=1 ;;
	?) usage ;;
    esac
done
shift `expr $OPTIND - 1`
op="$1"

# ========= PROGRAM =========
# read from file or stdin
# https://stackoverflow.com/questions/6980090/how-to-read-from-file-or-stdin-in-bash
while read line
do
    # name starts with 'jo' -> color red
    if [ "`echo $line | head -c2`" = "jo" ]; then
        mycolor='red'
        if [ $verbose -eq 1 ]; then echo -n "x "; fi
    else
        mycolorhash=`echo $line | $MD5 | head -c1`
        if [ $verbose -eq 1 ]; then echo -n "$mycolorhash "; fi
        mycolor=`hash_to_color $mycolorhash`
    fi
    echo $mycolor
done < "${1:-/dev/stdin}"
