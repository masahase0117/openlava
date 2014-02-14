#!/bin/sh
set -x

#
# Copyright (c) 2011-2013 David Bigagli
#

major="2"
minor="2"

grep 4.6 /etc/redhat-release > /dev/null
if [ "$?" == "0" ]; then
   echo "Cleaning..."
   rm -f /usr/src/redhat/SOURCES/openlava*
   rm -f /usr/src/redhat/RPMS/x86_64/openlava*
   rm -f /usr/src/redhat/SPECS/openlava.spec

   echo "Archiving..."
   git archive --format=tar --prefix="openlava-${major}.${minor}/" HEAD \
   | gzip > /usr/src/redhat/SOURCES/openlava-${major}.${minor}.tar.gz
   cp spec/openlava.spec /usr/src/redhat/SPECS/openlava.spec

  echo "RPM building..."
  rpmbuild -ba --target x86_64 /usr/src/redhat/SPECS/openlava.spec
  if [ "$?" != 0 ]; then
    echo "Failed buidling rpm"
    exit 1
  fi
  exit 0
fi 
   
echo "Cleaning up ~/rpmbuild directory..."
rm -rf ~/rpmbuild

echo "Creating the ~/rpmbuild..."
rpmdev-setuptree

echo "Archiving source code..."
git archive --format=tar --prefix="openlava-${major}.${minor}/" HEAD \
   | gzip > ~/rpmbuild/SOURCES/openlava-${major}.${minor}.tar.gz
cp spec/openlava.spec ~/rpmbuild/SPECS/openlava.spec

echo "RPM building..."
rpmbuild -ba --target x86_64 ~/rpmbuild/SPECS/openlava.spec
if [ "$?" != 0 ]; then
  echo "Failed buidling rpm"
  exit 1
fi

exit 0

