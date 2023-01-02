FROM devspace/home:latest

RUN sudo dnf install -y gtk4-devel pkg-config
RUN mkfifo /var/run/pause; chmod 777 /var/run/pause

ENTRYPOINT ["zsh"]
CMD ["-c", "echo ' ' > /var/run/pause"]

