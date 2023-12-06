ARG version_id=
FROM fedora:$version_id

RUN dnf install -y bat bear iproute iproute-tc kitty \
    clang clang-tools-extra fd-find \
    fuse-sshfs fzf htop jq nmap \
    the_silver_searcher ripgrep \
    zsh gh rust eza cmake man man-pages man-db \
    nodejs-bash-language-server \
    nnn scdoc meson flex \
    bison procs kubernetes-client helm npm \
    llvm gdb elfutils-libelf-devel openssl-devel dwarves zstd \
    tcpdump iputils rsync ncurses-devel zig strace socat \
	systemd-udev

RUN dnf copr enable agriffis/neovim-nightly -y && \
    sudo dnf install -y neovim

RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf; \
    ~/.fzf/install

RUN git clone https://github.com/ldelossa/dotfiles.git ~/git/dotfiles; \
    cd ~/git/dotfiles; make link-configs; 

RUN git clone --recursive https://github.com/changs/slimzsh.git ~/.slimzsh

run cd /tmp; \
    git clone https://github.com/udhos/update-golang.git && \
	cd update-golang && ./update-golang.sh

RUN cd ~/git/lua; \
    curl -LO https://github.com/sumneko/lua-language-server/releases/download/3.4.2/lua-language-server-3.4.2-linux-x64.tar.gz; \
    mkdir lua-language-server; \
    tar -xvf lua-language-server-3.4.2-linux-x64.tar.gz -C lua-language-server; \
    rm -rf; \
    cd /tmp; \
    sudo npm install -g vscode-langservers-extracted; \
    sudo npm install -g yaml-language-server; \
    sudo npm install -g vim-language-server

RUN sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

RUN echo 'louis ALL=(ALL:ALL) ALL' >> /etc/sudoers

RUN mkfifo /var/run/pause; chmod 777 /var/run/pause

ENTRYPOINT ["zsh"]
CMD ["-c", "echo ' ' > /var/run/pause"]
