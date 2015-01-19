#!/bin/bash
function scm{
if [ -n "$1"]
        then cd "$1"
fi
ls -R | egrep ":$|*.jpg$|*.jpeg$" | \
sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'

if [ 'ls -F -1 | grep "/" | wc -l' = 0 ]
      then echo "-> no sub-dir"
fi
ls -R -l | egrep '*.jpg$|*.jpeg$' | awk '{ x+= $5 } END { print "tot. bytes:" x}'
exit
}
if [ -n "$1" ]
    then scm $1
    else scm
fi
