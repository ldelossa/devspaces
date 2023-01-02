FROM devspace/home:latest

RUN dnf install -y \
  clang-tools-extra \
  gobject-introspection \
  libdbusmenu-gtk3-devel \
  libevdev-devel \
  fmt-devel \
  gobject-introspection-devel \
  gtk3-devel \
  gtkmm30-devel \
  libinput-devel \
  jsoncpp-devel \
  libmpdclient-devel \
  libnl3-devel \
  # libnl-genl-3-devel \
  pulseaudio-libs-devel \
  libsigc++20-devel \
  spdlog-devel \
  wayland-devel \
  scdoc \
  upower \
  libxkbcommon-devel \
  clang \
  llvm  \
  cmake \
  meson \
  scdoc \
  wayland-protocols-devel \
  systemd-devel

RUN mkfifo /var/run/pause; chmod 777 /var/run/pause

ENTRYPOINT ["zsh"]
CMD ["-c", "echo ' ' > /var/run/pause"]
