#!/bin/bash
#用法提示
usage() {
    echo "Usage:"
    echo "  proguard-dictionary-generator.sh [-n NAME] [-f FROM] [-t TO] [-h HELP]"
    echo "Description:"
    echo "    NAME, 名称."
    echo "    FROM, 开始长度."
    echo "    TO, 结束长度."
    echo "    HELP, 帮助."
    exit -1
}


# 获取脚本执行时的选项
while getopts n:f:t:h option
do
   case "${option}"  in
                n) NAME=${OPTARG};;
                f) FROM=${OPTARG};;
                t) TO=${OPTARG};;
                h) usage;;
                ?) usage;;
   esac
done

if [ ! $NAME ]; then
  NAME=proguard-dictionary
fi

if [ ! $FROM ]; then
  FROM=6
fi

if [ ! $TO ]; then
  TO=30
fi

rm -rf $NAME.txt

function generate_child() {
    first=$1
    second=$2
    count=$3
    for((y=0;y<count;y++))
    do
        line=$first
        ch=$second
        for((x=0;x+y<count;x++))
            do
                line=$line$ch
            done
    echo $line >> $NAME
    done
}

function random_count() {
    arr=($(seq $1 $2))
    num=${#arr[*]}
    return ${arr[$(($RANDOM%num))]}
}

function generate() {
    random_count $FROM $TO
    generate_child $1 $2 $?
}

generate "W" "w"
generate "O" "0"
generate "O" "o"
generate "OO" "o"
generate "O" "o0"
generate "I" "l"
generate "L" "l"
generate "I" "1"
generate "I" "1l"
generate "K" "k"
generate "U" "u"
generate "X" "x"
generate "S" "s"
generate "M" "m"
generate "C" "c"
generate "Z" "z"
