"""""""""""""""""""""""""""""""""""""""""""""""""""
"to get rid of some nasty limitaion for VI compatitable
"global basice conf
""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
let mapleader=','
set t_Co=256

"""""""""""""""""""""""""""""""""""""""""""""""""""
" FB specified conf
""""""""""""""""""""""""""""""""""""""""
source $ADMIN_SCRIPTS/master.vimrc
source /home/engshare/admin/scripts/vim/biggrep.vim
"source /mnt/vol/engshare/admin/scripts/vim/fbvim.vim
source /home/junyilu/.vim/fbvim.vim
let g:hack#enable=0
au BufNewFile,BufRead TARGETS setlocal ft=conf


"let backspace work on mac
set backspace=indent,eol,start

" this is vundle part
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=/home/junyilu/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'altercation/vim-colors-solarized'
Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'
Plugin 'cenalulu/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'klen/python-mode'
Plugin 'vim-scripts/YankRing.vim'
"Plugin 'davidhalter/jedi-vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'Lokaltog/vim-easymotion'
Bundle 'cenalulu/powerline', {'rtp': 'powerline/bindings/vim'}


call vundle#end()
filetype plugin indent on

set rtp+=~/.fzf

" vundle part end

" for solarized
syntax enable
set background=dark
colorscheme solarized

" for power line
set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim

 
 
let g:minBufExplForceSyntaxEnable = 1
 
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
" Trigger configuration. Do not use <tab> 
" if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-e>"
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
" move between pane
""""""""""""""""""""""""
nnoremap <C-j> <C-W><C-j>
nnoremap <C-k> <C-W><C-k>
nnoremap <C-l> <C-W><C-l>
nnoremap <C-h> <C-W><C-h>


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
set colorcolumn=80


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
"jedi auto complele
""""""""""""""""""""""""""""""""""""""
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>s"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "<leader>K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "2"
let g:jedi#popup_on_dot = 0

""""""""""""""""""""""""""""""""""""""
"You complete me
""""""""""""""""""""""""""""""""""""""
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_identifier_candidate_chars = 4
"let g:ycm_global_ycm_extra_conf = '/home/maxim/local/bin/.ycm_extra_conf.py'
"nnoremap <leader>y :YcmForceCompileAndDiagnostics<cr>
"nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nnoremap <leader>d :YcmCompleter GoToDefinition<CR>
"nnoremap <leader>d :YcmCompleter GoToDeclaration<CR>
let g:ycm_complete_in_strings = 0
let g:ycm_server_log_level = 'warning'


""""""""""""""""""""""""""""""""""""""
"python mode
""""""""""""""""""""""""""""""""""""""
let g:pymode_run = 0
let g:pymode_rope_goto_definition_bind = '<C-g>'
let g:pymode_lint_ignore = "C901"
let g:pymode_rope = 0
let g:pymode_lint_checkers = ['pep8']
let g:pymode_lint_todo_symbol = 'W>'
let g:pymode_lint_comment_symbol = 'C>'
let g:pymode_lint_visual_symbol = 'R>'
let g:pymode_lint_error_symbol = 'E>'
let g:pymode_lint_info_symbol = 'I>'
let g:pymode_lint_pyflakes_symbol = 'F>'
let g:pymode_syntax_print_as_function = 1


""""""""""""""""""""""""""""""""""""""
"all leader related config
""""""""""""""""""""""""""""""""""""""
nnoremap <leader>i gv>
nnoremap <leader>p :YRShow<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>Q :q!<cr>
nnoremap <leader>s :<C-w>s
nnoremap <leader>v :<C-w>v
nnoremap <leader>w :w<cr>
nnoremap <leader>W :w !sudo tee % >/dev/null <cr>
nnoremap <leader><tab> %
nnoremap <leader>z ZZ


inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" folding
nnoremap <leader>f za
nnoremap <leader>M zM
nnoremap <leader>R zR

""""""""""""""""""""""""
" fast_motion
""""""""""""""""""""""""
map ; <Plug>(easymotion-prefix)
let g:EasyMotion_startofline = 0 
map f <Plug>(easymotion-f)
map F <Plug>(easymotion-F)
map t <Plug>(easymotion-t)
map T <Plug>(easymotion-T)
map w <Plug>(easymotion-w)
map W <Plug>(easymotion-W)
map b <Plug>(easymotion-b)
map B <Plug>(easymotion-B)
map e <Plug>(easymotion-e)
map E <Plug>(easymotion-E)
map s <Plug>(easymotion-s2)
let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ;'

""""""""""""""""""""""""
" move between tab
""""""""""""""""""""""""
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt

"nnoremap <leader>f :FBVimFilenameSearch<cr>
nnoremap <leader>f :FZF ~/fbcode<cr>
nnoremap <leader>g :FBVimBigGrep<cr>
nnoremap <leader>b :FBVimPopTagStack<cr>
