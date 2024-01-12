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
	upower-devel				\
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
    xorg-x11-server-Xwayland-devel \
	gtk-doc \
	libadwaita-devel \
	gjs-devel \
	typescript \
	gnome-bluetooth \
	gnome-bluetooth-libs \
	brightnessctl \
	inotify-tools \
	graphviz \
	doxygen \
	gstreamer1-devel \
	gstreamer1-plugins-bad-free-devel \
	gtk-doc \
	xmlto \
	evolution-data-server-devel \
	mutter-devel \
	polkit-devel \
	startup-notification-devel \
	wireplumber-devel \
	NetworkManager-libnm-devel


# build and install gtk4-layer-shell v1.0.1
RUN cd /tmp && \
	curl -LO https://github.com/wmww/gtk4-layer-shell/archive/refs/tags/v1.0.2.tar.gz && \
	tar -xvf v1.0.2.tar.gz && cd gtk4-layer-shell-1.0.2  && \
	meson setup --prefix=/usr -Dexamples=true -Ddocs=true -Dtests=true build && \
	ninja -C build/ && \
	ninja -C build/ install

RUN mkfifo /var/run/pause; chmod 777 /var/run/pause

ENTRYPOINT ["zsh"]
CMD ["-c", "echo ' ' > /var/run/pause"]

