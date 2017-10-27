set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree.git'
Plugin 'scrooloose/nerdcommenter.git'
Plugin 'gregsexton/matchtag.git'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/syntastic.git'
Plugin 'kien/ctrlp.vim.git'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround.git'
Plugin 'elzr/vim-json'
Plugin 'mattn/emmet-vim.git'
Plugin 'mileszs/ack.vim'
Plugin 'chrismccord/bclose.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx.git'
Plugin 'morhetz/gruvbox'
Plugin 'IN3D/vim-raml'
Plugin 'mhinz/vim-startify'
Plugin 'leafgarland/typescript-vim.git'
Plugin 'moll/vim-node'
Plugin 'airblade/vim-gitgutter'

call vundle#end()
filetype plugin indent on
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

colors gruvbox
set expandtab
set tabstop=4
set shiftwidth=4
set rtp+=~/.fzf
set autoindent
set hidden
filetype on
filetype plugin on
syntax on
set mouse=nicrv

map <F1> :bp<CR>
map <F2> :bn<CR>
map <F3> :CtrlPBuffer<CR>
nnoremap <F4> :set invpaste paste?<CR>
set pastetoggle=<F4>
set showmode
map <F12> :NERDTreeToggle<CR>
map <Leader>q :Bclose<CR>
let g:NERDTreeChDirMode=2

vmap <Leader>y :w! ~/.vbuf<CR>
nmap <Leader>y :.w! ~/.vbuf<CR>
nmap <Leader>p :r ~/.vbuf<CR>
map <Leader>l oconsole.log("BURR", );<Esc>hi
map <Leader>v :e ~/.vimrc<CR>
map <Leader>g :GitGutterToggle<CR>
map K i<CR><Esc>

set tags=./tags;

set wildmenu
set wcm=<Tab>
menu Encoding.koi8-r :e ++enc=koi8-r ++ff=unix<CR>
menu Encoding.windows-1251 :e ++enc=cp1251<CR>
menu Encoding.cp866 :e ++enc=cp866 ++ff=dos<CR>
menu Encoding.utf-8 :e ++enc=utf8 <CR>
menu Encoding.koi8-u :e ++enc=koi8-u ++ff=unix<CR>
map <F8> :emenu Encoding.<TAB>

setlocal nospell
menu Spell.on :setlocal spell spelllang=ru,en spell<CR>
menu Spell.off :setlocal nospell<CR>
map <F7> :emenu Spell.<TAB>

set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

set foldmethod=manual
autocmd BufWinLeave *.* mkview!
autocmd BufWinEnter *.* silent loadview

au InsertEnter * set cursorline
au InsertLeave * set nocursorline

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

set t_Co=256
let g:jsx_ext_required = 0

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|\.git$'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_extensions = ['tag']

" npm install -g eslint
" npm install -g babel-eslint
" npm install -g eslint-plugin-react
let g:syntastic_javascript_checkers = ['eslint']

" mkdir ~/.vim/.swp/
set directory=~/.vim/.swp//

if executable('ag')
      let g:ackprg = 'ag --vimgrep'
endif

set fillchars+=vert:\ 
