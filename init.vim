" ====================
" system option
" ====================

let &t_ut=''
set autochdir
set number
set relativenumber
set cursorline
set hidden
set noexpandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set list
set listchars=tab:\|\ ,trail:▫
set scrolloff=5
set ttimeoutlen=0
" set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set showcmd
set wildmenu
set ignorecase
set smartcase
set shortmess+=c
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set visualbell
silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.

if has('persistent_undo')
	set undofile
	set undodir=~/.config/nvim/tmp/undo,.
endif

set colorcolumn=100
set updatetime=100
set virtualedit=block
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936

" <LEADER>
let mapleader="\<Space>"

" python3 path
let g:python3_host_prog = '/usr/local/bin/python3'

" ====================
" 快捷键
" ====================

noremap ; :

" save & quit
noremap Q :q<CR>
noremap S :w<CR>

" tab action
noremap <LEADER>to :tabo<CR>
noremap <LEADER>tq :tabc<CR>
noremap <LEADER>tn :tabnew<CR>

" 关闭高亮
noremap <LEADER><LEADER> :noh<CR>

" Open the vimrc file anytime
noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>

" Disable the default s key
noremap s <nop>

" source init.vim
noremap <LEADER>so :so ~/.config/nvim/init.vim<CR>

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sl :set splitright<CR>:vsplit<CR>

" inoremap <c-h> <Left>
" inoremap <c-j> <Down>
" inoremap <c-k> <Up>
" inoremap <c-l> <Right>

" 光标所在单词的搜索快捷键
noremap <LEADER>w *


" 系统粘贴板
nmap P "+p
vmap Y "+y

noremap <c-[> <ESC>

" ====================
" Plugs
" ====================

call plug#begin('~/.config/nvim/plugged')

" theme
" Plug 'ajmwagar/vim-deus'
Plug 'rakr/vim-one'


" 光标移动
Plug 'rhysd/accelerated-jk'


" status line
" Plug 'liuchengxu/eleline.vim'
Plug 'vim-airline/vim-airline'

" 颜色显示
Plug 'RRethy/vim-illuminate'
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }

" file navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'Yggdroot/LeaderF', { 'do': './install.sh' } " 文件搜索引擎
" Plug 'kevinhwang91/rnvimr'  " 浮窗的ranger
Plug 'liuchengxu/vista.vim'
Plug 'preservim/nerdtree', { 'on': ['NERDTreeToggle'] }

" code autoformat
Plug 'Chiel92/vim-autoformat'

" Snippets
Plug 'honza/vim-snippets'

" which key
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

" Git
Plug 'theniceboy/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
Plug 'airblade/vim-gitgutter'
Plug 'cohama/agit.vim'
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': ['NERDTreeToggle'] }

" 类似vscode 的.vscode 文件
"Plug 'skywind3000/asynctasks.vim'
"Plug 'skywind3000/asyncrun.vim'<Paste>

" 分别是 icons，括号多彩，缩进的虚线，终端集成
Plug 'ryanoasis/vim-devicons'
Plug 'luochen1990/rainbow'
Plug 'wincent/terminus'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Editor
Plug 'jiangmiao/auto-pairs'
Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type k) k] k} kp
Plug 'tpope/vim-commentary'

" markdown
Plug 'godlygeek/tabular', { 'for': 'markdown' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install', 'for': 'markdown'  }

call plug#end()


" ====================
" statusLine
" ====================

let g:airline_powerline_fonts = 0
set guifont=Roboto\ Mono\ Medium\ for\ Powerline\ Font:h18
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='one'

" ====================
" Vista
" ====================

"function! NearestMethodOrFunction() abort
"	return get(b:, 'vista_nearest_method_or_function', '')
"endfunction

"set statusline+=%{NearestMethodOrFunction()}

"autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
" let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'
let g:vista#renderer#enable_icon = 1

noremap <LEADER>va :Vista!!<CR>

" ====================
" auto format
" ====================

command! -nargs=0 Prettier :CocCommand prettier.formatFile
" au BufWrite * :Autoformat
autocmd FileType vim let b:autoformat_autoindent=0
" nnoremap \f :Autoformat<CR>
nnoremap \f :Prettier<CR>
" let g:formatdef_eslint = '"SRC=eslint-temp-${RANDOM}.js; cat - >$SRC; eslint --fix $SRC >/dev/null 2>&1; cat $SRC | perl -pe \"chomp if eof\"; rm -f $SRC"'

let g:formatters_vue = ['eslint_local']
let g:run_all_formatters_vue = 1

" ====================
" 颜色显示
" ====================

let g:Hexokinase_highlighters = ['virtual']
set termguicolors " enable true colors support
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme one
set background=dark
set t_8b=^[[48;2;%lu;%lu;%lum
set t_8f=^[[38;2;%lu;%lu;%lum

" ====================
" gitgutter + Agit
" ====================

let g:gitgutter_sign_allow_clobber = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_sign_added = '▎'
let g:gitgutter_sign_modified = '░'
let g:gitgutter_sign_removed = '▏'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_modified_removed = '▒'
nnoremap <silent> <LEADER>gf :GitGutterFold<CR>
nnoremap H :GitGutterPreviewHunk<CR>
nnoremap <silent> <LEADER>ga :Agit<CR>
" nnoremap <LEADER>g- :GitGutterPrevHunk<CR>
" nnoremap <LEADER>g= :GitGutterNextHunk<CR>

" ====================
" illuminate
" ====================

let g:Illuminate_delay = 750
hi illuminatedWord cterm=undercurl gui=undercurl

" ====================
" 光标移动
" ====================

nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)
let g:accelerated_jk_acceleration_table = [2, 4, 7, 15]

" ====================
" leaderF
" ====================

" let g:Lf_WindowPosition = 'popup'
" let g:Lf_PreviewInPopup = 1
" let g:Lf_ShowDevIcons = 0

" ====================
" which key
" ====================

nnoremap <silent> <LEADER> :<c-u>WhichKey '<Space>'<CR>
set timeoutlen=500

" ====================
" which key
" ====================

let g:coc_global_extensions = [
			\ 'coc-actions',
			\ 'coc-vimlsp',
			\ 'coc-tailwindcss',
			\ 'coc-spell-checker',
			\ 'coc-highlight',
			\ 'coc-gitignore',
			\ 'coc-explorer',
			\ 'coc-emmet',
			\ 'coc-xml',
			\ 'coc-tsserver',
			\ 'coc-stylelint',
			\ 'coc-json',
			\ 'coc-java',
			\ 'coc-snippets',
			\ 'coc-html']

inoremap <silent><expr> <c-space> coc#refresh()

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<Tab>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nnoremap <silent> <LEADER>H :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)


" coc-actions coc-spell-check
function! s:cocActionsOpenFromSelected(type) abort
	execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

" ====================
" fzf
" ====================

nnoremap <silent> <LEADER>f :Files<CR>
nnoremap <silent> <LEADER>b :Buffers<CR>

" ====================
" NERDTree
" ====================

" autocmd vimenter * NERDTree
let NERDTreeShowHidden=1
nnoremap <C-b> :NERDTreeToggle<CR>
let g:NERDTreeGitStatusIndicatorMapCustom = {
			\ 'Modified'  :'✹',
			\ 'Staged'    :'✚',
			\ 'Untracked' :'✭',
			\ 'Renamed'   :'➜',
			\ 'Unmerged'  :'═',
			\ 'Deleted'   :'✖',
			\ 'Dirty'     :'✗',
			\ 'Ignored'   :'☒',
			\ 'Clean'     :'✔︎',
			\ 'Unknown'   :'?',
			\ }
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusShowIgnored = 1
let g:NERDTreeGitStatusConcealBrackets = 1
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ====================
" markdown
" ====================

autocmd Filetype markdown noremap ,m :MarkdownPreview<CR>
autocmd Filetype markdown inoremap ,b **** <++><Esc>F*hi
autocmd Filetype markdown inoremap ,i ** <++><Esc>F*i
autocmd Filetype markdown inoremap ,c ```<Enter><++><Enter>```<Enter><Esc>3kA
autocmd FileType markdown inoremap ,p ![](<++>) <++><Esc>F[a
autocmd FileType markdown inoremap ,a [](<++>) <++><Esc>F[a

exec "nohlsearch"
