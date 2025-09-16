install neovim (don't use apt or apt-get or snap, they are outdated or don't work properly)

get the latest release binary from:
https://github.com/neovim/neovim/releases
```
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
```

add init.vim to ~/.config/nvim/init.vim

install vim-plug:

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

open nvim and run `PlugInstall`
