
"保证使用
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
"使用鼠标
set mouse=a
"编码
set encoding=utf-8

set clipboard=unnamed

"防止不正确的背景渲染 Prevent incorrect backgroung rendering
let &t_ut=''

" ===
" === Main code display
" ===
"行号
set number

set relativenumber
set ruler
"线
set cursorline
syntax enable
"高亮
syntax on

" ===
" === Editor behavior
" ===
" Better tab 缩进
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=5

" Prevent auto line split
set wrap
set tw=0

set indentexpr=
" Better backspace
set backspace=indent,eol,start

set foldmethod=indent
set foldlevel=99

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" ===
" === Window behaviors
" ===
set splitright
set splitbelow

" ===
" === Status/command bar
" ===
set laststatus=2
set autochdir
"底部显示键盘输入
set showcmd
set formatoptions-=tc

" Show command autocomplete
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
"tab键提示选择 show a navigable menu for tab completion
set wildmenu
set wildmode=longest,list,full

" Searching options
"搜索高亮
set hlsearch
"每次运行时取消高亮 "exec"相当于每次按:执行指令
exec "nohlsearch"
"搜索边输入边高亮
set incsearch
"忽略大小写
set ignorecase
"智能大小写
set smartcase         

" ===
" === Restore Cursor Position
" ===
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" ===
" === Basic Mappings
" ===

" Set <LEADER> as <SPACE> 将leader键（\键,类似于Windows键）换成空格（相当于空格键）
let mapleader=" "

" Column (:) mods
map ; :
map q; q:
map <LEADER>/ :!
map <LEADER>r :r !
map <LEADER>sr :%s/

" Save & quit
"<CR> 回车
map Q :q<CR>
map S :w<CR>

" Open the vimrc file anytime
map <LEADER>rc :e ~/.vim/vimrc<CR>

" Insert Key
noremap h i
noremap H I

" Copy to system clipboard
vnoremap Y :w !xclip -i -sel c<CR>


" Search 将 <LEADER><CR> 替换为 :nohlearch<CR> 用于快捷取消搜索高亮 搜索下一个 上一个
map <LEADER><CR> :nohlsearch<CR>
noremap = nzz
noremap - Nzz

" Duplicate words
map <LEADER>fd /\(\<\w\+\>\)\_s*\1

" Others
map <LEADER>o o<Esc>u


:
" ===
" === Cursor Movement
" ===
" hjkl(原始)
" New cursor movement (the default arrow keys are used for resizing windows)
"     ^
"     i
" < j   l >
"     k
"     v
noremap j h
noremap i k
noremap k j
" noremap l l
" I/K keys for 5 times i/k (faster navigation)
noremap I 5k
noremap K 5j
" J key: go to the start of the line
noremap J 0
" L key: go to the end of the line
noremap L $

" Faster in-line navigation
noremap W 5w
noremap B 5b
" e 键 表示 'end of word'

" Ctrl + I or K will move up/down the view port without moving the cursor
noremap <C-I> 5<C-y>
noremap <C-K> 5<C-e>

" ===
" === Insert Mode Cursor Movement
" ===
inoremap <C-a> <ESC>A

" ===
" === Command Mode Cursor Movement
" ===
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-w> <S-Right>

" ===
" === Window management
" ===
" ctrl+w jkli 在分屏间移动
" Use <space> + new arrow keys for moving the cursor around windows
map <LEADER>w <C-w>w
map <LEADER>i <C-w>k
map <LEADER>k <C-w>j
map <LEADER>j <C-w>h
map <LEADER>l <C-w>l


" Disabling the default s key
" <nop> 禁用键盘映射
" 小写s键：删掉当前字符并进入写入模式，用处不是很大, 我们去掉s的作用
noremap s <nop>

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
" 分屏
" :split     上下分屏
" :vsplit    左右分屏
" sl:e 文件	向右分屏到文件 sl:edit  
map sl :set splitright<CR>:vsplit<CR>		"向右分屏
map sj :set nosplitright<CR>:vsplit<CR>		"向左分屏
map si :set nosplitbelow<CR>:split<CR>		"向上分屏
map sk :set splitbelow<CR>:split<CR>		"向下分屏

" Resize splits with arrow keys
" 更改分屏大小 vertical resize-5 
map <up> :resize+5<CR>
map <down> :resize-5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

" Place the two screens up and down
noremap sh <C-w>t<C-w>K
" Place the two screens side by side
noremap sv <C-w>t<C-w>H

" Rotate screens
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H

" === 标签
" === Tab management
" ===
" Create a new tab with ti
map ti :tabe<CR>
" Move around tabs with tj and tl
map tj :-tabnext<CR>
map tl :+tabnext<CR>
" Move the tabs with tmj and tml
map tmj :-tabmove<CR>
map tml :+tabmove<CR>


" ===
" === Other useful stuff
" ===
" Press space twice to jump to the next '<++>' and edit it 两下空格进入下一个 <++>
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" Spelling Check with <space>sc
map <LEADER>sc :set spell!<CR>
noremap <C-x> ea<C-x>s
inoremap <C-x> <Esc>ea<C-x>s

" Press ` to change case (instead of ~)
map ` ~

imap <C-c> <Esc>zza
nmap <C-c> zz

" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h

" Call figlet
map tx :r !figlet 

" Compile function
map r :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    silent! exec "!clear"
    exec "!time python3 %"
  elseif &filetype == 'html'
    exec "!firefox % &"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  elseif &filetype == 'vimwiki'
    exec "MarkdownPreview"
  endif
endfunc

map R :call CompileBuildrrr()<CR>
func! CompileBuildrrr()
  exec "w"
  if &filetype == 'vim'
    exec "source $MYVIMRC"
  elseif &filetype == 'markdown'
    exec "echo"
  endif
endfunc




" ===
" === Install Plugins with Vim-Plug
" ===

call plug#begin('~/.vim/plugged')

" Pretty Dress
Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }


" Undo Tree
Plug 'mbbill/undotree/'


" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'vimwiki/vimwiki'


" Bookmarks
Plug 'kshenoy/vim-signature'


" Other useful utilities
Plug 'junegunn/goyo.vim' " distraction free writing mode


call plug#end()


" ===
" === Dress up my vim
" ===
set termguicolors     " enable true colors support
let ayucolor="light"  " for light version of theme
colorscheme snazzy



" ===
" === NERDTree
" ===
map ff :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "u"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "l"
let NERDTreeMapOpenInTab = ";"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "j"
let NERDTreeMapChangeRoot = "o"

" ==
" == NERDTree-git
" ==
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" ===
" === CtrlP
" ===
map <C-p> :CtrlP<CR>
" ===
" === CtrlP
" ===
let g:ctrlp_prompt_mappings = {
  \ 'PrtSelectMove("j")':   ['<c-k>', '<down>'],
  \ 'PrtSelectMove("k")':   ['<c-i>', '<up>'],
  \ }



" ===
" === Undotree
" ===
let g:undotree_DiffAutoOpen = 0
"map L :UndotreeToggle<CR>



" ===
" === MarkdownPreview
" ===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'

"autocmd Filetype markdown map <leader>w yiWi[<esc>Ea](<esc>pa)
autocmd Filetype markdown inoremap ,f <Esc>/<++><CR>:nohlsearch<CR>c4l
autocmd Filetype markdown inoremap ,n ---<Enter><Enter>
autocmd Filetype markdown inoremap ,b **** <++><Esc>F*hi
autocmd Filetype markdown inoremap ,s ~~~~ <++><Esc>F~hi
autocmd Filetype markdown inoremap ,i ** <++><Esc>F*i
autocmd Filetype markdown inoremap ,d `` <++><Esc>F`i
autocmd Filetype markdown inoremap ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap ,h ====<Space><++><Esc>F=hi
autocmd Filetype markdown inoremap ,p ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap ,a [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,l --------<Enter>

" ===
" === vim-table-mode
" ===
map <LEADER>tm :TableModeToggle<CR>

let g:vimwiki_list = [{
  \ 'automatic_nested_syntaxes':1,
  \ 'path_html': '~/wiki_html',
  \ 'path': '~/wiki',
  \ 'template_path': '~/.vim/vimwiki/template/',
  \ 'syntax': 'markdown',
  \ 'ext':'.md',
  \ 'template_default':'markdown',
  \ 'custom_wiki2html': '~/.vim/vimwiki/wiki2html.sh',
  \ 'template_ext':'.html'
\}]

au BufRead,BufNewFile *.md set filetype=vimwiki

let g:taskwiki_sort_orders={"C": "pri-"}
let g:taskwiki_syntax = 'markdown'
let g:taskwiki_markdown_syntax='markdown'
let g:taskwiki_markup_syntax='markdown'




" ===
" === vim-signiture
" ===
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "dm-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "dm/",
        \ 'PurgeMarkers'       :  "dm?",
        \ 'GotoNextLineAlpha'  :  "m<LEADER>",
        \ 'GotoPrevLineAlpha'  :  "",
        \ 'GotoNextSpotAlpha'  :  "m<LEADER>",
        \ 'GotoPrevSpotAlpha'  :  "",
        \ 'GotoNextLineByPos'  :  "",
        \ 'GotoPrevLineByPos'  :  "",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "",
        \ 'GotoPrevMarker'     :  "",
        \ 'GotoNextMarkerAny'  :  "",
        \ 'GotoPrevMarkerAny'  :  "",
        \ 'ListLocalMarks'     :  "m/",
        \ 'ListLocalMarkers'   :  "m?"
        \ }



" ===
" === Goyo
" ===
map <LEADER>gy :Goyo<CR>
