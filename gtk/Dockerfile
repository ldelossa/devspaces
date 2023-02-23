FROM devspace/home:latest

# necessary depedencies to build gtk-layer-shell and gtk applications.
RUN sudo dnf install -y gtk4-devel pkg-config gtk-layer-shell-devel \
  wayland-protocols-devel gobject-introspection-devel vala 
RUN mkfifo /var/run/pause; chmod 777 /var/run/pause

ENTRYPOINT ["zsh"]
CMD ["-c", "echo ' ' > /var/run/pause"]

