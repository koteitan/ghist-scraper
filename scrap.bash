#!/bin/bash

URL=$1
URLDIR=`echo $1 | sed "s/\(https:\/\/\)\([^/]*\)\(.*$\)/\2/g"`
mkdir work
cd work

wget "$1?limit=500&action=history" -O list.html

git init

tail -r list.html \
| grep mw-history-histlinks \
| sed "s/\
\(^.*name=\"diff[^e]*href=\"\)\
\([^\"]*oldid=\)\
\([^\"]*\)\
\(\"[^>]*>\)\
\([^<]*\)\
\(.*$\)\
/wget \"https:\/\/$URLDIR\2\3\" \-O body.html \&\& \
git add body.html \&\& \
git commit -m\"\5\"\
/g" > download.bash

bash download.bash

