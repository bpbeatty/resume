%define debug_package %{nil}
Name:       bpbeatty-resume
Version:    0.01
Release:    1%{?dist}
Summary:    This is my resume.

License:    GPLv3+
URL:        https://resume.bpbeatty.xyz
Source: .

BuildArch:  noarch
BuildRequires: aspell-en
BuildRequires: lato-fonts
BuildRequires: lilypond-fonts-common
BuildRequires: make
BuildRequires: texlive-biblatex
BuildRequires: texlive-firstaid
BuildRequires: texlive-lato
BuildRequires: texlive-parskip
BuildRequires: texlive-progressbar
BuildRequires: texlive-textpos
BuildRequires: texlive-tex-gyre
BuildRequires: texlive-unicode-math
BuildRequires: /usr/bin/rpmbuild
BuildRequires: /usr/bin/xelatex

%description
This is a test package.

%prep
%setup -q -c -T

%build
make -C %{_sourcedir} -f %{_sourcedir}/Makefile BUILD=%{_builddir} BIN=%{_builddir}

%install
make -C %{_sourcedir} install DESTDIR=%{buildroot} BUILD=%{_builddir} BIN=%{_builddir}

%files
%{_bindir}/bpbeatty-resume
%{_datadir}/bpbeatty/resume.pdf

%changelog
* Tue Jul 4 2023 Brian Beatty <27@megahertz.com> - 0.01
- Initial packaging
