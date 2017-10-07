" Disable the use of swap files.
set noswapfile

" Dont implement VI's bugs
set nocompatible

" Automatically change current dir when moving around
set autochdir

set showcmd

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

set formatoptions=tcqor

" ----------------------------------------------------------------------------
"  Text Formatting
" ----------------------------------------------------------------------------

set autoindent             " automatic indent new lines
set smartindent            " be smart about it
inoremap # X<BS>#
set nowrap                 " do not wrap lines
set softtabstop=4          " yep, twokj
set shiftwidth=4           " ..
set tabstop=4
" set expandtab              " expand tabs to spaces
" set nosmarttab             " fuck tabs
set formatoptions+=n       " support for numbered/bullet lists
set virtualedit=block      " allow virtual edit in visual block ..

" ----------------------------------------------------------------------------
"  Remapping
" ----------------------------------------------------------------------------

" Enable pasting from system buffer
nnoremap <c-p> :set invpaste paste?<CR>
set pastetoggle=<c-p>

" lead with ,
let mapleader = ","

" exit to normal mode with 'jj'
inoremap jj <ESC>

" Delete stuff into black hole register
noremap D "_d

" reflow paragraph with Q in normal and visual mode
nnoremap Q gqap
vnoremap Q gq

" sane movement with wrap turned on
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" Tab Control
:nmap <C-S-tab> :tabprevious<cr>
:nmap <C-tab> :tabnext<cr>
:nmap <C-t> :tabnew<cr>
:map <C-t> :tabnew<cr>
:map <C-S-tab> :tabprevious<cr>
:map <C-tab> :tabnext<cr>
:map <C-q> :tabclose<cr>
:imap <C-S-tab> <ESC>:tabprevious<cr>i
:imap <C-tab> <ESC>:tabnext<cr>i
:imap <C-t> <ESC>:tabnew<cr>
:map <C-h> :tabprevious<cr>
:map <C-l> :tabnext<cr>
:imap <C-h> <ESC>:tabprevious<cr>i
:imap <C-l> <ESC>:tabnext<cr>i

" Tab Control (others)
":map <C-1> 1gt
":map <C-2> 2gt
":map <C-3> 3gt
":map <C-4> 4gt
":map <C-5> 5gt
":map <C-6> 6gt
":map <C-7> 7gt
":map <C-8> 8gt
":map <C-9> 9gt

" pressing < or > will let you indent/unident selected lines
vnoremap < <gv
vnoremap > >gv

" Map zz to space, center around cursor
nmap <space> zz

" map ctrl+j & ctrl+k to jump half a screen and center cursor in screen.
noremap <C-j> <C-d> zz
noremap <C-k> <C-u> zz

" ----------------------------------------------------------------------------
"  UI
" ----------------------------------------------------------------------------

set background=dark        " dark background
set ruler                  " show the cursor position all the time
set noshowcmd              " don't display incomplete commands
set nolazyredraw           " turn off lazy redraw
set number                 " line numbers
set wildmenu               " turn on wild menu
set wildmode=list:longest,full
set ch=2                   " command line height
set backspace=2            " allow backspacing over everything in insert mode
set whichwrap+=<,>,h,l,[,] " backspace and cursor keys wrap to
set shortmess=filtIoOA     " shorten messages
set report=0               " tell us about changes
set nostartofline          " don't jump to the start of line when scrolling
set scrolljump=5           " Jump 5 lines when running out of the screen
set scrolloff=3            " Indicate jump out of the screen when 3 lines before end of the screen
set showtabline=2
set showmode               " Show current mode on status line


" ----------------------------------------------------------------------------
" Visual Cues
" ----------------------------------------------------------------------------

set showmatch              " brackets/braces that is
set mat=5                  " duration to show matching brace (1/10 sec)
set incsearch              " do incremental searching
set laststatus=2           " always show the status line
set ignorecase             " ignore case when searching
set hlsearch               " highlight searches
set visualbell             " shut the fuck up
set ruler                  " show line and column information

" ----------------------------------------------------------------------------
" This function determines, wether we are on the start of the line text 
" (then tab indents) or if we want to try autocompletion
" ----------------------------------------------------------------------------
function InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

" Remap the tab key to select action with InsertTabWrapper
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

" ---------------------------------------------------------------------------
"  Strip all trailing whitespace in file
" ---------------------------------------------------------------------------

function! StripWhitespace ()
    exec ':%s/ \+$//gc'
endfunction
map ,s :call StripWhitespace ()<CR>

