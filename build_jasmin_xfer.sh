#!/bin/bash

#
#  Script to build and optionally install jasmin-xfer
#
#  This is based on the one for jasmin-sci but heavily stripped down.
#  If jasmin-xfer is expanded to be more than just a meta-rpm (include
#  locally built packages) then this script will need replaced with
#  something more like the jasmin-sci one.
#

set -e

thisdir=$(pwd)
spec_file=$thisdir/rpmbuild/SPECS/jasmin-xfer.spec
topdir=$thisdir/rpmbuild

buildtmp=_build_tmp.$$

rpmbuild --define "_topdir $topdir" -bs $spec_file
rpmbuild --define "_topdir $topdir" -bb $spec_file | tee $buildtmp
status=${PIPESTATUS[0]}
[ $status -eq 0 ] || exit $status
rpms=$(perl -lane '/^Wrote: (.*\.rpm)/ && ! /debuginfo/ && print $F[1]' $buildtmp)
rm -f $buildtmp

echo -n "Install binaries? "
read ans
ans=$(echo $ans | cut -b 1)
if [ "$ans" = y -o "$ans" = Y ]
then
  sudo yum -y localinstall $rpms || sudo yum -y reinstall $rpms
fi
