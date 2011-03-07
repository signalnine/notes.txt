#!/bin/bash
IFS=`echo -en "\n\b"`
echo "00 personal" > ~/.notesdottxt/notes.pal
grep '^\*\ ' ~/notes.txt | sed 's/\*/TODO/' >> ~/.notesdottxt/notes.pal
grep '^\@\*' ~/notes.txt | sed 's/^..//' | sed 's/,//' >> ~/.notesdottxt/notes.pal

for CALENTRY in  `grep '^\@[^\*]' ~/notes.txt | sed 's/^.//'`
 do
    echo -n $CALENTRY | awk -F, '{print $1}' | xargs -i date --date="{}" +"%Y%m%d" | xargs -i echo -n {} >> ~/.notesdottxt/notes.pal
    echo -n $CALENTRY | awk -F, '{print $2}' >> ~/.notesdottxt/notes.pal
 done
pal2ical ~/.notesdottxt/notes.pal > ~/www/notes.ical
