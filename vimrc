set nocompatible              " be iMproved, required
filetype off                  " required
syntax on

"" map escape key to jj
imap jj <esc>
cmap jj <esc>

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'Syntastic'
let g:syntastic_javascript_checkers = ['eslint']
"" Better :sign interface symbols
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'
let g:syntastic_style_error_symbol = '☡'
let g:syntastic_style_warning_symbol = '¡'
"" Check on buffer open
let g:syntastic_check_on_open = 1
"" Always put errors in the location list
" let g:syntastic_always_populate_loc_list = 1
" "" Auto pop the quickfix split
" " let g:syntastic_auto_loc_list = 1
" "" Aggregate errors for multiple checkers
" let g:syntastic_aggregate_errors = 1
" "" Don't check on write+quit
" let g:syntastic_check_on_wq = 0
"
" let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++14'

Plugin 'sheerun/vim-polyglot'

Plugin 'sjl/vitality.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set number
set list
set listchars=tab:▸ᛧ,trail:·,extends:»,precedes:«
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
fun! StripTrailingWhitespace()
    " Only strip if the b:noStripeWhitespace variable isn't set
    if exists('b:noStripWhitespace')
        return
    endif
    %s/\s\+$//e
endfun

autocmd BufWritePre * call StripTrailingWhitespace()
autocmd FileType perl,vim let b:noStripWhitespace=1

autocmd BufLeave,FocusLost * silent! wall

" stuff specific to the macbook, probably should figure out
" a way to make this part depend on the particulars of the
" environment
let g:syntastic_c_include_dirs = ['/usr/local/include/SDL2/']

