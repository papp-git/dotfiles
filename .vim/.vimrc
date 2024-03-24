"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               
"               
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"               ██║   ██║██║██╔████╔██║██████╔╝██║     
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║     
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"               
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible    " required Vundle
filetype off        " required Vundle

setlocal spell
set spelllang=de

" clipboard
set clipboard=unnamedplus
set clipboard+=unnamed

set autochdir

" speichern
inoremap jj <esc>:update<CR>
nnoremap jj :update<CR>

" Cursor""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
set cursorcolumn

" insert normal cursor ändern block line
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' | 
    \   silent execute '!echo -ne "\e[3 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[5 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

"--------------------------------------------------------------------------------"

" Plugins---------------------------------------------------{{{
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
"
Plugin 'vim-scripts/indentpython.vim'
Plugin 'lervag/vimtex'
Plugin 'Valloric/YouCompleteMe'
Plugin 'morhetz/gruvbox'
Plugin 'sirver/ultisnips'
Plugin 'preservim/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sainnhe/everforest'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" }}}

" VIMSCRIPT-----------------------------------------------------{{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" folds mit vimtex werden gespeichert
autocmd BufWinLeave *.tex mkview
autocmd BufWinEnter *.tex silent loadview
" }}}
"
syntax enable

"colorscheme---------------------------------------------------------------------{{{
set bg=light
set termguicolors
let g:everforest='soft'
let g:everforest_better_performance = 1
let g:airline_theme = 'everforest'

"colorscheme everforest
colorscheme gruvbox 

hi clear SpellBad
hi SpellBad cterm=underline
hi SpellBad guisp=blue

" toggle dark / light
if exists("*ToggleBackground") == 0
	function ToggleBackground()
		if &background == "dark"
			set background=light
		else
			set background=dark
		endif
	endfunction

	command BG call ToggleBackground()
endif
"}}}


set encoding=utf-8
set tabstop=4

set shiftwidth=4
set expandtab
set number
filetype indent on
set autoindent
set showmatch

" Zeilen--------------------------------------------------------------------------
set wrap
" enable soft wrapping at the edge of the screen
set linebreak
" make it not wrap in the\e piddle of a "word"
set tw=80

" Klammern automatisch schließen-----------------------------------------------------{{{
ino " ""<left>
ino ' ''<left>
ino ( ()<left>
ino [ []<left>
ino { {}<left>
ino $ $$<left>
"-------------------------------------------------------------}}}

" wildmenu----------------------------------------------------------------{{{

 " Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx,*fls,*fdb_latexmk,*.aux
" ------------------------------------------------------------------------}}}

" Python-------------------------------------------------------------{{{
" F5 zum ausführen von Python
autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
let python_highlight_all=1
" -------------------------------------------------------------------}}}

" vimtex----------------------------------------------------------------------------------------------{{{

" pfd-viewer für vimtex
"
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'
" Warnmeldung unterdrücken
let g:vimtex_quickfix_open_on_warning = 0
" code wird unsichtbar oder ersetzt
" set conceallevel=1
" let g:tex_conceal='abdmg'
"start vim als server
if empty(v:servername) && exists('*remote_startserver')
  call remote_startserver('VIM')
endif

" lualatex-------------------------------------------------------------------------------

let g:vimtex_compiler_engine='lualatex'
" ----------------------------------------------------------------------------------------------------}}}

" snippets------------------------------------------------------------------------------------------------{{{
let g:UltiSnipsExpandTrigger = '<c-s>'
let g:UltiSnipsJumpForwardTrigger = '<c-s>'
let g:UltiSnipsJumpBackwardTrigger = '<c-r>'
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips'] 
z" ---------------------------------------------------------------------------------------------------------}}}

" NERDtree------------------------------------------------------------------------------------------{{{
" Start NERDTree and put the cursor back in the other window.

" autocmd VimEnter * NERDTree | wincmd p

" Map the F3 key to toggle NERDTree open and close.
nnoremap <F3> :NERDTreeToggle schule <cr>

" Have nerdtree ignore certain files and directories.
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$', '\.out$', '\.gz$','\.fdb_latexmk$','\.fls$','\.aux$', '\.log$', '\.ggb$', '\.bbl$', '\.blg$', '\.toc$', '\.ods$', '\.pptx$','\.odp$','\.goodnotes$']

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" --------------------------------------------------------------------------------------------------}}}

" STATUS LINE Airline------------------------------------------------------------ {{{

set t_Co=256
let g:airline_theme='zenburn'
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#buffer_nr_show = 1 " buffer in tabline; delete buffer: :bd Nummer

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
""set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
""set statusline+=%=

" Status line right side.
""set statusline+=\ reihe:\ %l\ zeile:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
" "set laststatus=2

" ----------------------------------------------------------------------------- }}}

