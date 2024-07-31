Summary: meta-package for JASMIN xfer machines
Name: jasmin-xfer
Version: 1.1
Release: 1%{?dist}
BuildArch: noarch
License: GPLv2+

Requires: emacs-nox
Requires: ftp
Requires: lftp
Requires: parallel
Requires: python3-requests
Requires: python3.11
Requires: python3.11-requests
Requires: rclone
Requires: screen
Requires: xterm

%description

Installing this package forces the installation of various packages that are required on
the xfer nodes.

%prep

%build

%install

%files

%changelog
# changelog may be incomplete - see history in git
