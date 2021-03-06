set nocompatible              " be iMproved, required
set number
syntax enable
set shell=bash
syntax on 
filetype plugin indent on
filetype on
filetype indent on
filetype plugin on
set clipboard=unnamedplus
set clipboard^=unnamed
set mouse=r
set backspace=indent,eol,start
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType eruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType python setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType html setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType css setlocal expandtab shiftwidth=2 tabstop=2

set foldmethod=indent

" max text length
au BufRead,BufNewFile *.rb setlocal textwidth=120
au BufNewFile,BufRead *.py setlocal
    \ tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=79
    \ expandtab
    \ autoindent
    \ fileformat=unix

au BufNewFile,BufRead *.js,*.html,*.css,*.jsx setlocal
    \ tabstop=2
    \ softtabstop=2
    \ shiftwidth=2

" remap splitting windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" remap splits
nmap :vs :vsplit
nmap :s :split
" nnoremap <C-a> <C-w>

" remap text moving
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

"Pathogen
set nocp
" call pathogen#infect()

" Set SPELLCHeCK YYAH
" set spell spelllang=en_ca
" hi SpellBad cterm=underline,bold
"set highlight SpellBad      ctermfg=Red         term=Reverse        guisp=Red       gui=undercurl   ctermbg=White 

" Fzf search enable
set rtp+=~/.fzf

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" set ctrlP plugin
set runtimepath^=~/.vim/bundle/ctrlp.vim
" allow vim to jump through directories for ctags
set tags=tags;/
let g:solarized_termcolors = 16
call vundle#begin()

" Set Theme
" Plugin 'junegunn/seoul256.vim'
" colo seoul256

" Ocean theme VS
" Plugin 'mhartington/oceanic-next'
" if (has("termguicolors"))
"   set termguicolors
"  endif
" colorscheme OceanicNext
" set background=dark
" let g:oceanic_next_terminal_italic = 1
" let g:oceanic_next_terminal_bold = 1

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" Scala highlights
Plugin 'derekwyatt/vim-scala'
" neocomplete Plugin
Plugin 'Shougo/neocomplete.vim'
" show git diif in vim
Plugin 'airblade/vim-gitgutter'
" plugin from http://vim-scripts.org/vim/scripts.html
" Install L9 and avoid a Naming conflict if you've already
" installed a
" different version somewhere else.
Plugin 'ascenator/L9', {'name': 'newL9'}
Bundle 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-endwise'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
" Fzg plugin
Plugin 'junegunn/fzf.vim'
" remap envoke key
nnoremap <silent> <C-z> :FZF<CR>

"" Quick comment toggling
Plugin 'tpope/vim-commentary'
noremap <C-\> :Commentary<CR>
autocmd FileType ruby setlocal commentstring=#\ %s

" Files stucture tree
Plugin 'scrooloose/nerdtree'
"map <C-m> :NERDTreeToggle<CR>
map - :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<cr>
" autocmd BufWinEnter * NERDTreeFind
map ] :NERDTreeFind<CR>

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'nanotech/jellybeans.vim'

Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'Yggdroot/indentLine'

Plugin 'fatih/vim-go'

Plugin 'elixir-editors/vim-elixir'

Plugin 'posva/vim-vue'

Plugin 'vim-scripts/indentpython.vim'
Plugin 'wakatime/vim-wakatime'
Plugin 'chr4/nginx.vim'
Plugin 'sukima/xmledit'
Plugin 'ap/vim-css-color'
Plugin 'ryanoasis/vim-devicons'
call vundle#end()            " required

" Ctrl-P configurations
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'
" Ctags with Ctrl-P
" nnoremap <leader>. :CtrlPTag<cr>

"Neocomplete configurations
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
" Move up and down in autocomplete with <c-j> and <c-k>
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>") 

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" ALE
nmap <LEADER>af :ALEFix<CR>
Plugin 'w0rp/ale'
let g:ale_lint_on_text_changed = 1
let g:ale_lint_on_save = 1
let g:ale_set_loclist = 1

let g:ale_fixers = {
\  'ruby': [
\    'remove_trailing_lines',
\    'trim_whitespace',
\    'rubocop'
\  ]
\}
let g:ale_linters = {'ruby': ['rubocop', 'ruby']}
let g:ale_ruby_rubocop_executable = 'bin/rubocop'
let g:ruby_indent_assignment_style = 'variable'

" vim-ruby
let g:ruby_indent_access_modifier_style = 'normal'
let g:ruby_indent_assignment_style = 'variable'
let g:ruby_indent_block_style = 'do'

" let g:airline_theme='luna'
let g:airline_powerline_fonts = 1

:colorscheme jellybeans

" let g:jellybeans_overrides = {
" 			\    'Todo': { 'guifg': '303030', 'guibg': 'f0f000',
" 			\              'ctermfg': 'Black', 'ctermbg': 'Yellow',
" 			\              'attr': 'bold' },
" 			\    'Comment': { 'guifg': 'e8ff69' },
" 			\}

set colorcolumn=80
highlight ColorColumn ctermbg=green

highlight Pmenu ctermbg=black
highlight PmenuSel ctermbg=green
" highlight PmenuSbar ctermbg=gray
" highlight PmenuThumb ctermbg=gray

set term=screen-256color

iabbrev <// </<C-X><C-O>
