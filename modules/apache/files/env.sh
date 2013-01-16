#!/bin/bash
#
# env.sh
#     simple cgi env test script
#
# ferreira.mv

IFS='
'

echo "Content-Type: text/html; charset=UTF-8"
echo
echo
echo '<html>  <body FONT FACE="courier">'

echo "________________________________________"
echo

#or f in $( env | sort )
#or f in $( env | grep -v HOST | sort )
for f in $( env | egrep '^HTTP|^REQ|^QUERY' | grep -v HOST | sort )
do
    echo "<p><code>$f</code></p>"
done

echo "________________________________________"
echo

echo "</body>  </html>"

