#!/bin/bash
#
# check-syntax.sh
#
#
# Marcus Vinicius Fereira            ferreira.mv[ at ].gmail.com
# 2012-09
#

usage() {
    echo
    echo "Usage: $0 [-h] | [dirname1] [dirname2]"
    echo
    echo "    Recursively check syntax on *.erb files."
    echo "    If no [dirname] is provided: looks into 'modules'"
    echo "    and 'manifests' directories."
    echo
    exit 2
}

[ "$1" == "-h" ] && usage

if [ -z "$1" ]
then
    # add each dir to a list
    [ -d ./manifests ] && DIR="manifests"
    [ -d ./modules   ] && DIR="modules $DIR"
    # list empty?
    [ -z "$DIR"      ] && usage
else
    DIR="$@"  # all dirs
fi


ignore='_tmp|_arch|_todo'
log=/tmp/pp-check-erb.err.log

echo "Dir: [ $DIR ]"

for d in $DIR
do

    [ ! -d "$d" ] && usage

    for erb in $( find $d -type f -name '*.erb' | egrep -v "$ignore" )
    do
       #erb -x -T - $erb | ruby -c 2>&1 | sed -e "s,^,$erb: ," | tee -a $log

        echo "ERB: $erb"
        erb -x -T - $erb | ruby -c 1>>$log 2>>$log
        # show last error, if error
        [ "$?" != "0" ] && tail -3 $log


    done

done

### Final
# 0: found       - egrep 'string' /tmp/1.log && echo 'found'
# 1: not found   - egrep 'string' /tmp/1.log || echo 'notfound'
if egrep 'syntax error' $log > /dev/null
then
    printf "\nERB: FAILED.\n\n"
    err=1
else
    printf "\nERB: ok\n\n"
    err=0
fi

# Reset log
> $log

#cho "log: $log"
#cho "err: $err"
exit $err


# vim:ft=sh:

