scriptencoding utf-8

set ignorecase
set smartcase
set noexpandtab
set autoindent
set backspace=indent,eol,start
set wrapscan
set showmatch
set wildmenu
set formatoptions+=mM
set nonumber
set ruler
set nolist
set wrap
set laststatus=2
set cmdheight=2
set showcmd
set title
set background=dark
set tabstop=4
set shiftwidth=4
set encoding=utf-8
set langmenu=ja_jp.utf-8
set formatexpr=autofmt#japanese#formatexpr()

colorscheme base16-isotope

if !(has('win32') || has('mac')) && has('multi_lang')
  if !exists('$LANG') || $LANG.'X' ==# 'X'
    if !exists('$LC_CTYPE') || $LC_CTYPE.'X' ==# 'X'
      language ctype ja_JP.eucJP
    endif
    if !exists('$LC_MESSAGES') || $LC_MESSAGES.'X' ==# 'X'
      language messages ja_JP.eucJP
    endif
  endif
endif

if has('mac')
  set langmenu=japanese
  set iskeyword=@,48-57,_,128-167,224-235
endif

if !has('gui_running') && &encoding != 'cp932' && &term == 'win32'
  set termencoding=cp932
endif

if 1 && !filereadable($VIMRUNTIME . '/menu.vim') && has('gui_running')
  set guioptions+=M
endif

if filereadable($VIM . '/vimrc') && filereadable($VIM . '/ViMrC')
  set tags=./tags,tags
endif

if has('unix') && !has('gui_running')
  let s:uname = system('uname')
  if s:uname =~? "linux"
    set term=builtin_linux
  elseif s:uname =~? "freebsd"
    set term=builtin_cons25
  elseif s:uname =~? "Darwin"
    set term=beos-ansi
  else
    set term=builtin_xterm
  endif
  unlet s:uname
endif

if !has('gui_running') && has('xterm_clipboard')
  set clipboard=exclude:cons\\\|linux\\\|cygwin\\\|rxvt\\\|screen
endif

if has('win32') && $PATH !~? '\(^\|;\)' . escape($VIM, '\\') . '\(;\|$\)'
  let $PATH = $VIM . ';' . $PATH
endif

nmap <C-Tab> :tabn<CR>
nmap <C-S-Tab> :tabp<CR>
nmap <C-t> :tabnew<CR>

source $VIMRUNTIME/mswin.vim

let g:neocomplcache_enable_at_startup = 1
