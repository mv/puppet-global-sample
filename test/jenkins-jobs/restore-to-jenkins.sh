#!/bin/bash
#
# Restore to jenkins my jobs....
#
# Marcus Vinicius Fereira            ferreira.mv[ at ].gmail.com
# 2012-09
#

[ -z "$1" ] && {

  echo
  echo "Usage: $0 filename.tar"
  echo
  exit 2

}

[ -f "$1" ] || {

  echo
  echo "File [$1] not found."
  echo
  exit 3

}

dir=/var/lib/jenkins/jobs

cd $dir && tar xvf "$1"


