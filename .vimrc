" Copy this file to your home directory.  Usually /home/user/, but you can
" also search for .vimrc from bash

set nocompatible              " required
filetype off                  " required

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" set the runtime path to include Plug and initialize

call plug#begin('~/.vim/plugged')

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)

* Enable folding
set foldmethod=indent
set foldlevel=99

* Enable folding with the spacebar
nnoremap <space> za

Plug 'tmhedberg/SimpylFold'

au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

Plug 'vim-scripts/indentpython.vim'

au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set encoding=utf-8

Plug 'Valloric/YouCompleteMe'

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"python with virtualenv support
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF

Plug 'scrooloose/syntastic'

Plug 'nvie/vim-flake8'

let python_highlight_all=1
syntax on

Plug 'jnurmine/Zenburn'
Plug 'altercation/vim-colors-solarized'

if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

Plug 'scrooloose/nerdtree'

Plug 'jistr/vim-nerdtree-tabs'

Plug 'kien/ctrlp.vim'

set nu

Plug 'tpope/vim-fugitive'
" All of your Plugins must be added before the following line
call plug#end()            " required
