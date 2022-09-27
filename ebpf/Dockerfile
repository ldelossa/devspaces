FROM devspace/home:latest

RUN dnf install -y \
  clang libbpf libbpf-devel bpftool

RUN mkfifo /var/run/pause; chmod 777 /var/run/pause

ENTRYPOINT ["zsh"]
CMD ["-c", "echo ' ' > /var/run/pause"]
