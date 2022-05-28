" change leader key form \ to ,
let mapleader = ","
syntax enable " enable syntax processing
" tabstop - number of visual spaces per TAB
" softtabstop - number of spaces in tab when editing
" expandtab - tabs are spaces
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
set number " show line numbers
set showcmd " show command in bottom bar
set cursorline " highlight current line
set wildmenu " visual autocomplete for commmand menu
set lazyredraw " redraw only when we need to
set showmatch " highlight matching [{()}]
set incsearch " search as characters are entered
set hlsearch " highlight matches
" 配置显示特殊字符，及更改其显示方式和配色
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
" 配置简洁窗口切换快捷键
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" 配置标签切换简洁快捷键
map <D-S-]> gt
map <D-S-[> gT
map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt
map <D-6> 6gt
map <D-7> 7gt
map <D-8> 8gt
map <D-9> 9gt
map <D-0> :tablast<CR>

" 使用 %% 展开当前目录
cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'
" 使用空格进行代码折叠
let g:SimpylFold_docstring_preview=1
nnoremap <space> za
" 配置vim可加载插件
set nocompatible
filetype plugin on
runtime macros/matchit.vim
set encoding=UTF-8

" zsh 风格自动补全
set wildmenu " visual autocomplete for commmand menu
set wildmode=full

" 设置分割窗口的位置
set splitbelow
set splitright

" 设置VIM使用系统剪切板
set clipboard=unnamed

" scheme 配置
set t_Co=256
colorscheme zenburn

" airline status line plugin 配置
" 当只有一个tab打开时显示打开的全部 buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts = 1

" 以下是python 专门配置
au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix
let python_highlight_all=1

" YCM config
" pipenv run path
let pipenv_venv_path = system('pipenv --venv')
if shell_error == 0
    let venv_path = substitute(pipenv_venv_path, '\n', '', '')
    let g:ycm_python_interpreter_path = venv_path . '/bin/python'
else
    let g:ycm_python_interpreter_path = 'python'
endif
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/.vim/global_extra_conf.py'
" YCM Symbol search key map
nmap <leader>yfw <Plug>(YCMFindSymbolInWorkspace)
nmap <leader>yfd <Plug>(YCMFindSymbolInDocument)
nnoremap <leader>jd :YcmCompleter GoTo<CR>
nnoremap <leader>gd :YcmCompleter GetDoc<CR>

call plug#begin()
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'
Plug 'ycm-core/YouCompleteMe'
Plug 'Yggdroot/indentLine'
Plug 'vim-syntastic/syntastic'
Plug 'jnurmine/Zenburn'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree' |
    \ Plug 'Xuyuanp/nerdtree-git-plugin' |
    \ Plug 'ryanoasis/vim-devicons' |
    \ Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'kien/ctrlp.vim'
Plug 'bitc/vim-bad-whitespace'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
all plug#end()
