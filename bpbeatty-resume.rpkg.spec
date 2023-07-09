%define debug_package %{nil}
Name:       bpbeatty-{{{ git_dir_name }}}
Version:    {{{ git_dir_version }}}
Release:    1%{?dist}
Summary:    This is my resume.

License:    GPLv3+
URL:        https://resume.bpbeatty.xyz
VCS:        {{{ git_dir_vcs }}}

Source: {{{ git_archive path="." }}}

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
{{{ git_dir_setup_macro }}}
%setup -q -c -T

%build
make \
	-C %{_sourcedir}/{{{ git_dir_name }}} \
	-f %{_sourcedir}/{{{ git_dir_name }}}/Makefile \
	BUILD=%{_builddir} BIN=%{_builddir}

%install
make \
	-C %{_sourcedir}/{{{ git_dir_name }}} \
	install \
	DESTDIR=%{buildroot} BUILD=%{_builddir} BIN=%{_builddir}

%files
%{_bindir}/bpbeatty-resume
%{_datadir}/bpbeatty/resume.pdf

%changelog
{{{ git_dir_changelog }}}
