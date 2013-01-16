#!/bin/bash
#
# check-syntax.sh
#
#
# Marcus Vinicius Fereira            ferreira.mv[ at ].gmail.com
# 2012-03
#

usage() {

    echo
    echo "Usage: $0 [-h] | [dirname1] [dirname2]"
    echo
    echo "    Recursively check syntax on *.pp and *.erb files."
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
log=/tmp/pp-check-syntax.err.log

echo "Dir: [ $DIR ]"

for d in $DIR
do

    [ ! -d "$d" ] && usage

    for pp in $( find $d -type f -name '*.pp' | egrep -v "$ignore" )
    do
        echo "Syntax: $pp"
        puppet parser validate $pp 2>&1 | tee -a $log
    done

done

### Final
# 0: found       - egrep 'string' /tmp/1.log && echo 'found'
# 1: not found   - egrep 'string' /tmp/1.log || echo 'notfound'
if egrep -i 'warning|error' $log > /dev/null
then
    printf "\nSyntax: FAILED.\n\n"
    err=1
else
    printf "\nSyntax: ok\n\n"
    err=0
fi

# Reset log
> $log

#cho "log: $log"
#cho "err: $err"
exit $err

# Syntax check templates:

# find modules/*/templates/ -maxdepth 1 -type f -not -name .svn \
#   | xargs -n1 sh -c 'erb -x -T - $1 | ruby -c 2>&1 | sed -e "s,^,$1: ,"' -


# vim:ft=sh:

