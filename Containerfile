FROM fedora:38 AS builder

RUN dnf install -y \
    nodejs \
    /usr/bin/xelatex \
    texlive-parskip \
    lilypond-fonts-common \
    texlive-textpos \
    texlive-biblatex \
    texlive-progressbar \
    texlive-firstaid \
    lato-fonts \
    texlive-lato \
    texlive-tex-gyre \
    make \
    rpkg \
    python-setuptools \
    /usr/bin/rpmbuild \
    aspell-en \
    texlive-unicode-math \
    python-setuptools

RUN mkdir -p /rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}
ADD . /rpmbuild/SOURCES
ADD rpm/*.spec /rpmbuild/SPECS

RUN ls /rpmbuild

RUN rpmbuild -ba \
    --define '_topdir /rpmbuild' \
    /rpmbuild/SPECS/*.spec

RUN mkdir -p /output && \
    cp /rpmbuild/BUILD/resume.pdf /rpmbuild/RPMS/noarch/bpbeatty-resume-*.rpm \
        /output
# FROM scratch
# COPY --from=builder /rpmbuild/BUILD/resume.pdf /
# COPY --from=builder /rpmbuild/RPMS/noarch/bpbeatty-resume-*.rpm /
