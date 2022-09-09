ARG version_id=36
FROM fedora:$version_id

RUN dnf install -y bat bear \
    clang clang-tools-extra docker-compose exa fd-find \
    fuse-sshfs fzf htop jq neovim nmap moby-engine \
    the_silver_searcher \
    zsh gh rust \
    nodejs-bash-language-server \
    nnn scdoc meson flex \
    bison procs kubernetes-client helm npm \
    llvm gdb elfutils-libelf-devel openssl-devel dwarves zstd 

RUN git clone https://github.com/ldelossa/dotfiles.git ~/git/dotfiles; \
    cd ~/git/dotfiles; make link-configs; \
    make link-zsh; \
    make link-gdb-config

RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf; \
    ~/.fzf/install

RUN git clone --recursive https://github.com/changs/slimzsh.git ~/.slimzsh

RUN cd /tmp; \
    curl -LO https://go.dev/dl/go1.19.linux-amd64.tar.gz; \
    sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.19.linux-amd64.tar.gz; \
    rm -rf go1.19.linux-amd64.tar.gz

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

# RUN nvim +'PlugInstall --sync' +qall &> /dev/null | true
# RUN nvim +'TSInstall all --sync' +qall &> /dev/null | true
# RUN nvim +'GoInstallBinaries --sync' +qall &> /dev/null | true

ENTRYPOINT zsh
