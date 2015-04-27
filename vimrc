"to get rid of some nasty limitaion for VI compatitable
set nocompatible              " be iMproved, required
let mapleader=','



" this is vundle part
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'altercation/vim-colors-solarized'
Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'
Plugin 'cenalulu/vim-snippets'
Plugin 'vim-scripts/vim-auto-save'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/YankRing.vim'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim'}


call vundle#end()
filetype plugin indent on

" vundle part end

" for solarized
syntax enable
set background=dark
colorscheme solarized

" for power line
set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim

" for vim auto-save
let g:auto_save_no_updatetime = 1  " do not change the global 'updatetime' option
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode
let g:auto_save_silent = 1  " do not display the auto-save notification
let g:auto_save_events = ["InsertLeave", "TextChanged"]



 
set t_Co=256
 
let g:minBufExplForceSyntaxEnable = 1
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
 
if ! has('gui_running')
   set ttimeoutlen=10
   augroup FastEscape
      autocmd!
      au InsertEnter * set timeoutlen=0
      au InsertLeave * set timeoutlen=1000
   augroup END
endif
 
set laststatus=2 " Always display the statusline in all windows
set guifont=Inconsolata\ for\ Powerline:h14
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
" end of powerline

" this is for snippets & unisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"

"this is for markdown plugin
let g:vim_markdown_frontmatter=1
let g:vim_markdown_folding_disabled=1

" this is global configuration
set pastetoggle=<F10>
set ts=4 sw=4 et
set smartindent
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
set number
set cursorline
set foldmethod=syntax
set foldlevel=99
set relativenumber
set noswapfile

""""""""""""""""""""""""
" global conf for search
""""""""""""""""""""""""

"make search regex PERL
nnoremap / /\v
vnoremap / /\v
"highlight match result
set hlsearch
set ignorecase
set smartcase
nnoremap <leader>/ :nohlsearch<CR>

"""""""""""""""""""""""""""""""""""""
" Line width
"""""""""""""""""""""""""""""""""""""
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85


""""""""""""""""""""""""""""""""""""""
" Switch between hex and normal mode
""""""""""""""""""""""""""""""""""""""

"let <F8> to toggle between 
"hex and ascii mode
noremap <F9> :call HexMe()<CR>

let $in_hex=0
function HexMe()
    set binary
    set noeol
    if $in_hex>0
        :%!xxd -r
        let $in_hex=0
    else
        :%!xxd
        let $in_hex=1
    endif
endfunction



""""""""""""""""""""""""""""""""""""""
"all leader related config
""""""""""""""""""""""""""""""""""""""
nnoremap <leader>i gv>
nnoremap <leader>q :q!<cr>
nnoremap <leader><tab> %
nnoremap <leader>z ZZ
nnoremap <leader>p :YRShow<cr>
nnoremap <leader>w :w !sudo tee % >/dev/null <cr>
