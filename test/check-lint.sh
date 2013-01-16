#!/bin/bash
#
# puppet-lint.sh
#
#     Recursively calls puppet-lint
#
# Marcus Vinicius Fereira            ferreira.mv[ at ].gmail.com
# 2012-03
# 2012-09
#

PATH=/bin:/usr/bin

usage() {
    echo
    echo "Usage: $0 [-h] | [dirname1] [dirname2]"
    echo
    echo "    Recursively call puppet-lint on *.pp files."
    echo "    If no [dirname] is provided: looks into 'modules'"
    echo "    and 'manifests' directories."
    echo
    exit 2
}

[ "$1" == "-h" ] && usage

if [ -z "$1" ]
then
    DIR="."
else
    DIR="$@"  # all dirs
fi

echo "Dir: [ $DIR ]"

ignore='_tmp|_arch|_todo'
log=/tmp/pp-lint.err.log

# lint 0.2.1
puppet-lint \
    --no-80chars-check       \
    --no-documentation-check \
    --with-filename $DIR 2>&1 > $log # | tee -a $log


### Final
# 0: found       - egrep 'string' /tmp/1.log && echo 'found'
# 1: not found   - egrep 'string' /tmp/1.log || echo 'notfound'
if egrep -i 'warning|error' $log | egrep -v $ignore # > /dev/null
then
    printf "\nLint: FAILED.\n\n"
    err=1
else
    printf "\nLint: ok\n\n"
    err=0
fi

# Reset log
> $log

#cho "log: $log"
#cho "err: $err"
exit $err

# vim:ft=sh:

