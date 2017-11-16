#! /bin/bash

set -e

#command -- upstream-version version

[ $# -eq 2 ] || exit 255

version="$2"
filename="keychain_$2.orig.tar.gz"
dfsgfilename=$(echo ${filename} | sed 's,\.orig\.,+dfsg.orig.,')

tar xfz ../${filename}

dir=$(tar tfz ../${filename} | head -1 | sed -e 's,^\./,,g;s,/.*,,g')

rm -rf ${dir}/img
rm -rf ${dir}/misc

mv ${dir} ${dir}+dfsg
tar cf - ${dir}+dfsg | gzip -9 > ../${dfsgfilename}

rm -rf ${dir}+dfsg

echo "${dfsgfilename} created."
