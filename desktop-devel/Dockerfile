FROM devspace/home:latest

# necessary depedencies to build gtk-layer-shell and gtk applications.
RUN sudo dnf install -y         \
    gtk4-devel pkg-config       \
    gtk-layer-shell-devel       \
    wayland-protocols-devel     \
    gobject-introspection-devel \
    vala                        \
    clang-tools-extra           \
    gobject-introspection       \
    libdbusmenu-gtk3-devel      \
    libevdev-devel              \
    fmt-devel                   \
    gobject-introspection-devel \
    gtk3-devel                  \
    gtkmm30-devel               \
    libinput-devel              \
    jsoncpp-devel               \
    libmpdclient-devel          \
    libnl3-devel                \
    pulseaudio-libs-devel       \
    libsigc++20-devel           \
    spdlog-devel                \
    wayland-devel               \
    scdoc                       \
    upower                      \
    libxkbcommon-devel          \
    clang                       \
    llvm                        \
    cmake                       \
    meson                       \
    scdoc                       \
    wayland-protocols-devel     \
    systemd-devel               \
    json-glib-devel             \
    libhandy-devel              \
    fish                        \
    bash-completion             \
    libdrm-devel                \
    libseat-devel               \
    json-c-devel                \
    wlroots-devel               \
    xorg-x11-server-Xwayland-devel \
    libevdev-devel              \
    libinput-devel              \
    pango-devel                 \
    libglvnd-gles               \
    xcb-util-wm-devel           \
    xcb-util-renderutil-devel   \
    libseat-devel               \
    xorg-x11-server-Xwayland-devel 

RUN mkfifo /var/run/pause; chmod 777 /var/run/pause

ENTRYPOINT ["zsh"]
CMD ["-c", "echo ' ' > /var/run/pause"]

