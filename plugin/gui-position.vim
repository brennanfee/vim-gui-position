" gui-position.vim - Plugin to remember/restore the GUI window size and position
" Maintainer:   Brennan Fee
" Version:      2.0
" Inspired by:  http://vim.wikia.com/wiki/Restore_screen_size_and_position

if exists('g:loaded_gui_position') || &compatible || v:version < 700
    finish
else
    let g:loaded_gui_position = 1
endif

if has("gui_running") && has("autocmd")
  function! DefaultScreenFilename()
    if has('amiga')
      return "s:.vimsize"
    elseif has('gui_win32') || has('gui_win64')
      return $HOME.'\.vim\vimsize'
    else
      return $HOME.'/.vim/vimsize'
    endif
  endfunction

  function! ScreenRestore()
    " Restore window size (columns and lines) and position
    " from values stored in vimsize file.
    " Must set font first so columns and lines are based on font size.
    let f = g:gui_position_file_name
    if has("gui_running") && g:screen_size_restore_pos && filereadable(f)
      let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
      for line in readfile(f)
        let sizepos = split(line)
        if len(sizepos) == 5 && sizepos[0] == vim_instance
          silent! execute "set columns=".sizepos[1]." lines=".sizepos[2]
          silent! execute "winpos ".sizepos[3]." ".sizepos[4]
          return
        endif
      endfor
    endif
  endfunction

  function! ScreenSave()
    " Save window size and position.
    if has("gui_running") && g:screen_size_restore_pos
      let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
      let data = vim_instance . ' ' . &columns . ' ' . &lines . ' ' .
            \ (getwinposx()<0?0:getwinposx()) . ' ' .
            \ (getwinposy()<0?0:getwinposy())
      let f = g:gui_position_file_name
      if filereadable(f)
        let lines = readfile(f)
        call filter(lines, "v:val !~ '^" . vim_instance . "\\>'")
        call add(lines, data)
      else
        let lines = [data]
      endif
      call writefile(lines, f)
    endif
  endfunction

  if !exists('g:screen_size_restore_pos')
    let g:screen_size_restore_pos = 1
  endif

  if !exists('g:screen_size_by_vim_instance')
    let g:screen_size_by_vim_instance = 1
  endif

  if !exists('g:gui_position_file_name')
      let g:gui_position_file_name = DefaultScreenFilename()
  endif

  augroup VimGuiPosition
      autocmd!
      autocmd VimEnter * if g:screen_size_restore_pos == 1 | call ScreenRestore() | endif
      autocmd VimLeavePre * if g:screen_size_restore_pos == 1 | call ScreenSave() | endif
  augroup END
endif
