ARG version_id=36
FROM fedora:$version_id

RUN sudo dnf install -y git autoconf automake libtool make \
  readline-devel texinfo net-snmp-devel groff pkgconfig json-c-devel \
  pam-devel python3-pytest bison flex c-ares-devel python3-devel \
  python3-sphinx perl-core patch libcap-devel \
  elfutils-libelf-devel libunwind-devel libyang-devel bear
