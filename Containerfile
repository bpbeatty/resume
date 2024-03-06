FROM fedora:39

RUN dnf install -y \
  'dnf-command(builddep)' \
  rpkg

ADD . /tmp

RUN \
  cd /tmp && \
  rpkg spec --spec /tmp/ -p > /tmp/out.spec && \
  dnf builddep -y /tmp/out.spec && \
  rm -rf /tmp/* && \
  cd /
