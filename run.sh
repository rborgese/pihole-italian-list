#!/bin/bash

wget -O - https://raw.githubusercontent.com/disconnectme/disconnect/b27abbf033c6f80f157fe9d98cb767c87065fbf4/firefox/content/disconnect.safariextension/opera/chrome/scripts/data.js > list.txt
wget -O - https://easylist-downloads.adblockplus.org/easylist.txt >> list.txt
wget -O - https://easylist-downloads.adblockplus.org/easylistitaly.txt >> list.txt
wget -O - https://easylist-downloads.adblockplus.org/easyprivacy.txt >> list.txt
wget -O - https://easylist-downloads.adblockplus.org/antiadblockfilters.txt >> list.txt
wget -O - https://easylist-downloads.adblockplus.org/fanboy-annoyance.txt >> list.txt
wget -O - https://easylist-downloads.adblockplus.org/fanboy-social.txt >> list.txt
wget -O - http://winhelp2002.mvps.org/hosts.txt >> list.txt
wget -O - http://hosts-file.net/ad_servers.asp >> list.txt
wget -O - http://someonewhocares.org/hosts/hosts >> list.txt
wget -O - https://easylist-downloads.adblockplus.org/malwaredomains_full.txt >> list.txt
wget -O - https://raw.githubusercontent.com/gioxx/xfiles/master/filtri.txt >> list.txt

sed -e 's/\r//' -e '/^0.0.0.0/!d' -e '/localhost/d' -e 's/0.0.0.0//' -e 's/ \+/\t/' -e 's/#.*$//' -e 's/[ \t]*$//' < list.txt | sort -u > list2.txt
cat list2.txt | tr -d " \t" > adlist.txt
rm -rf list.txt list2.txt
