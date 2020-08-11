#!/bin/bash
waitsec 0.5

if which tac >/dev/null; then
  tac="tac"
else
  tac="tail -r"
fi

URL=$1
URLDIR=`echo $1 | sed "s/\(https:\/\/\)\([^/]*\)\(.*$\)/\2/g"`
mkdir work
cd work

wget "$1?limit=500&action=history" -O list.html

git init

$tac list.html \
| grep mw-history-histlinks \
| sed "s/\
\(^.*name=\"diff[^e]*href=\"\)\
\([^\"]*oldid=\)\
\([^\"]*\)\
\(\"[^>]*>\)\
\([^<]*\)\
\(.*$\)\
/wget \"https:\/\/$URLDIR\2\3\" \-O body.html \&\& \
sleep $waitsec \&\&\
git add body.html \&\& \
sleep $waitsec \&\&\
git commit -m\"\5\" \&\&\
sleep $waitsec\
/g" > download.bash

bash download.bash

