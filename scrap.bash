#!/bin/bash

URL=$1
URLDIR=`echo $1 | sed "s/\(https:\/\/\)\([^/]*\)\(.*$\)/\2/g"`

wget "$1?limit=500&action=history" -O list.html

tail -r list.html \
  | grep mw-history-histlinks \
  | sed "s/\
\(^[^f]*href=\"\)\
\([^\"]*oldid\=\)\
\([^\"]*\)\
\(.*value\=\"\)\
\([^\"]*\)\(.*$\)\
/wget \"https:\/\/$URLDIR\2\3\" \-O \3.html/g" > download.bash

#bash download.bash

