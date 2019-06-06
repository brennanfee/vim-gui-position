# Vim GUI Position

Vim plugin to remember and restore the GUI screen size and position.  This was largely copied\adapted from http://vim.wikia.com/wiki/Restore_screen_size_and_position and placed into plugin form.

Please note that this only effects GUI versions of Vim (gVim, MacVim, etc.) and has no effect for terminal editions.

## Configuration

There are three configuration items.

`g:screen_size_restore_pos` can be set to 0 to temporarily turn off the plugin, the default is 1 (on). Obviously, if you wish to permanently disable this functionality it would be better to just uninstall the plugin.

`g:screen_size_by_vim_instance` can be set to 0 to share the same size/position for all Vim Gui applications, the default is 1 (on) which means that sizes will be stored by application (Gvim will have different size\position than MacVim, should you use both).

`g:gui_position_file_name` can be set to a path and filename to override the file used to remember the settings.  By default it places a file `.vimsize` in your home path (for Mac and Unixes), and uses `_vimsize` in the home path for Windows.

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
