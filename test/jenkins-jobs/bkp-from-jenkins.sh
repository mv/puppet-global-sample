#!/bin/bash
#
# Copy what jenkins made....
#
# Marcus Vinicius Fereira            ferreira.mv[ at ].gmail.com
# 2012-09
#


dir=/var/lib/jenkins/jobs

# project is a prefix for my jobs
proj=Puppet

[ -d $dir ] || {

  echo
  echo "Dir [$dir] not found"
  echo
  exit 2

}

tar cvf jenkins-jobs_$( date "+%F_%H%M" ).tar ${dir}/${proj}*/*xml


