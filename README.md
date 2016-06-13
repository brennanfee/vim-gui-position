# Vim GUI Position
Vim plugin to remember and restore the GUI screen size and position.  This was largely copied\adapted from http://vim.wikia.com/wiki/Restore_screen_size_and_position and placed into plugin form.

Please note that this only effects GUI versions of Vim (gVim, MacVim, etc.) and has no effect for terminal editions.

## Configuration

The only configuration value is g:screen_size_restore_pos which can be used
to temporarily turn off the plugin.  Obviously, if you wish to permanently disable
this functionality it would be better to just uninstall the plugin.

## Installation

Using a plugin manager.

- [NeoBundle][neobundle]

    ```vim
    NeoBundle 'brennanfee/vim-gui-position'
    ```

- [Vundle][vundle]

    ```vim
    Plugin 'brennanfee/vim-gui-position'
    ```

- [Pathogen][pathogen]

    ```sh
    git clone git://github.com/brennanfee/vim-gui-position.git ~/.vim/bundle/vim-gui-position
    ```

- [VimPlug][vimplug]

    ```vim
    Plug 'brennanfee/vim-gui-position'
    ```

- Manual
    - Copy all of the files into your `~/.vim` directory

[neobundle]: https://github.com/Shougo/neobundle.vim
[vundle]: https://github.com/gmarik/vundle
[pathogen]: https://github.com/tpope/vim-pathogen
[vimplug]: https://github.com/junegunn/vim-plug
