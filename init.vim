let g:ale_completion_enabled = 1

call plug#begin('~/.config/nvim/plugged')
    Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'morhetz/gruvbox'
    Plug 'chrismccord/bclose.vim'
    Plug 'scrooloose/nerdtree'
    Plug 'scrooloose/nerdcommenter'
    Plug 'mattn/emmet-vim'
    Plug 'honza/vim-snippets'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'yuezk/vim-js'
    Plug 'maxmellon/vim-jsx-pretty'
    Plug 'moll/vim-node'
    Plug 'airblade/vim-gitgutter'
    Plug 'w0rp/ale'
call plug#end()

set termguicolors
colorscheme gruvbox
set bg=dark

set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set mouse=nicrv
set fillchars=vert:\│
set list!
set listchars=tab:▶\ ,trail:·,extends:\#,nbsp:.
set hidden

map <Leader>q :Bclose<CR>
vmap <Leader>y :w! ~/.vbuf<CR>
nmap <Leader>y :.w! ~/.vbuf<CR>
nmap <Leader>p :r ~/.vbuf<CR>
map <Leader>l oconsole.log("BURR", );<Esc>hi
map <Leader>v :e ~/.config/nvim/init.vim<CR>
map <Leader>g :GitGutterToggle<CR>
map <Leader>n :set rnu!<CR>
imap <Leader>c <c-x><c-o>
map K i<CR><Esc>
nnoremap <F5> :Ack<space>

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

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

map <F12> :NERDTreeToggle<CR>
let g:NERDTreeChDirMode=2

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> a
  \ denite#do_map('toggle_select_all')
  nnoremap <silent><buffer><expr> l
  \ denite#do_map('do_action', 'quickfix')
  nnoremap <silent><buffer><expr> <ESC>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

call denite#custom#source('buffer', 'sorters', ['sorter/reverse'])
call denite#custom#source('buffer', 'matchers', ['matcher/ignore_current_buffer', 'matcher/fuzzy'])
call denite#custom#source('file/old', 'matchers', ['matcher/ignore_current_buffer', 'matcher/fuzzy'])

call denite#custom#var('file/rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
  imap <silent><buffer> <ESC> <Plug>(denite_filter_quit)
endfunction

map <F3> :Denite file/old<CR>
map <Leader>f :DeniteProjectDir -start-filter file/rec<CR>

map <leader>F :DeniteProjectDir -start-filter grep:::!<CR>

call denite#custom#source('grep', 'matchers', ['matcher_regexp'])

" use ag for content search
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

let g:ale_lint_on_text_changed = 'never'
set completeopt+=noinsert

nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>
