set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Bundle 'jistr/vim-nerdtree-tabs'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mhinz/vim-signify'
Plugin 'sonph/onehalf', {'rtp': 'vim/'}
Plugin 'christoomey/vim-tmux-navigator'
call plug#begin('~/.local/share/nvm/plugged')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'  }
call plug#end()
"autocmd vimenter * NERDTree

execute pathogen#infect()
syntax on
filetype plugin indent on
colorscheme lucius
LuciusLight

set tabstop=2
set shiftwidth=2

set showtabline=2 " always show tabs in gvim, but not vim
" set up tab labels with tab number, buffer name, number of windows
function! GuiTabLabel()
  let label = ''
  let bufnrlist = tabpagebuflist(v:lnum)
  " Add '+' if one of the buffers in the tab page is modified
  for bufnr in bufnrlist
    if getbufvar(bufnr, "&modified")
      let label = '+'
      break
    endif
  endfor
  " Append the tab number
  let label .= v:lnum.': '
  " Append the buffer name
  let name = bufname(bufnrlist[tabpagewinnr(v:lnum) - 1])
  if name == ''
    " give a name to no-name documents
    if &buftype=='quickfix'
      let name = '[Quickfix List]'
    else
      let name = '[No Name]'
    endif
  else
    " get only the file name
    let name = fnamemodify(name,":t")
  endif
  let label .= name
  " Append the number of windows in the tab page
  let wincount = tabpagewinnr(v:lnum, '$')
  return label . '  [' . wincount . ']'
endfunction
set guitablabel=%{GuiTabLabel()}
set number
au TabLeave * let g:lasttab = tabpagenr()
"nnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
"vnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>

map <Leader>n <plug>NERDTreeTabsToggle<CR>
nmap <F8> :TagbarToggle<CR>
set ruler
" autocmd FileType c nnoremap <buffer> <silent> <C-]> :YcmCompleter GoTo<cr>
" let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
set backspace=indent,eol,start
" let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_autoclose_preview_window_after_insertion = 1
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

set autoread
set expandtab
"set term=screen-256color
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>

call deoplete#enable()
