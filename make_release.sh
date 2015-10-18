#!/bin/sh

if [ "x${1}" = "x" ]; then
  echo "Usage: ${0} <release>"
  exit 1
fi
 
rm -rf munin-plugins-hq-${1}
mkdir munin-plugins-hq-${1}
cp -pr ./plugins ./munin-plugins-hq-${1}/
cp -p ./{CHANGELOG,LICENSE} ./munin-plugins-hq-${1}/
tar Jcvf releases/munin-plugins-hq-${1}.tar.xz munin-plugins-hq-${1} --owner=root --group=root
md5sum releases/munin-plugins-hq-${1}.tar.xz >releases/munin-plugins-hq-${1}.tar.xz.md5
rm -rf munin-plugins-hq-${1}
git tag ${1}
git push --tags
