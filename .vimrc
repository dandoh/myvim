set nocompatible              " be iMproved, required
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'majutsushi/tagbar'
Plugin 'bling/vim-airline'
Plugin 'godlygeek/tabular'
Plugin 'elixir-lang/vim-elixir'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'rhysd/clever-f.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'slashmili/alchemist.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'airblade/vim-gitgutter'
Plugin 'shougo/unite.vim'
Plugin 'mhinz/vim-signify'
Plugin 'sonph/onehalf', {'rtp': 'vim/'}
Plugin 'christoomey/vim-tmux-navigator'

execute pathogen#infect()
syntax on
filetype plugin indent on
colorscheme lucius
LuciusLight

set tabstop=2
set shiftwidth=2
set showtabline=2 " always show tabs in gvim, but not vim
" set up tab labels with tab number, buffer name, number of windows

autocmd FileType haskell setlocal ts=4 sts=4 sw=4
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

map <Leader>n <plug>NERDTreeTabsToggle<CR>
nmap <F8> :TagbarToggle<CR>
set ruler
" autocmd FileType c nnoremap <buffer> <silent> <C-]> :YcmCompleter GoTo<cr>
" let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
set backspace=indent,eol,start
" let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_autoclose_preview_window_after_insertion = 1
"
let g:loaded_youcompleteme = 1
let g:ycm_disable_for_files_larger_than_kb = 0
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
set term=screen-256color
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:tmux_navigator_no_mappings = 1


nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>

let g:unite_source_grep_command       = 'ag'
let g:unite_source_grep_default_opts  = '--column --nogroup --nocolor --follow --hidden'
let g:unite_source_grep_recursive_opt = ''
let g:unite_source_rec_async_command  = ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '']
nnoremap <C-F> :Unite file_rec/async<cr>
nnoremap <C-H> :Unite grep:.<cr>
nnoremap <C-E> :Unite buffer<cr>

" syntax checking
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


let g:NERDTreeWinSize=45
let g:clever_f_fix_key_direction = 1
au BufNewFile,BufRead *.ned set syntax=ned 
set encoding=utf-8
set clipboard=unnamed
set formatprg=stylish-haskell

let mapleader=','
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
nmap <Leader>a> :Tabularize /-><CR>
vmap <Leader>a> :Tabularize /-><CR>
nmap <Leader>a< :Tabularize /<-<CR>
vmap <Leader>a< :Tabularize /<-<CR>

map <F5> mzgggqG`z
nmap ss viw
vmap s <nop>
