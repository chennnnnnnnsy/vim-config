" Author: Chensy
" Time: 2019/09/02


" ====================
" Auto load for first time uses
" ====================
 
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


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
noremap W :w<CR>

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

" 查询下一个和上一个
noremap n nzz
noremap N Nzz

" 系统粘贴板
nmap P "+p
vmap Y "+y

noremap <c-[> <ESC><ESC>

" find and replace
" noremap \s :%s//g<left><left>

" 关闭当前buffer
nnoremap <silent> <LEADER>BD :bp \| bd #<CR>

" ====================
" Plugs
" ====================

call plug#begin('~/.config/nvim/plugged')

" theme
" Plug 'ajmwagar/vim-deus'
" Plug 'rakr/vim-one'
" Plug 'karoliskoncevicius/sacredforest-vim'
" Plug 'cocopon/iceberg.vim'
Plug 'beikome/cosme.vim'

" 光标移动
Plug 'rhysd/accelerated-jk'


" status line
" Plug 'liuchengxu/eleline.vim'
" Plug 'vim-airline/vim-airline'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'

" 颜色显示
Plug 'RRethy/vim-illuminate'
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }

" file navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'kevinhwang91/rnvimr'  " 浮窗的ranger
Plug 'liuchengxu/vista.vim'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kristijanhusak/defx-icons'

" code autoformat

" Snippets
Plug 'honza/vim-snippets'


" which key
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

" Git
Plug 'theniceboy/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
Plug 'airblade/vim-gitgutter'
Plug 'cohama/agit.vim'

" 类似vscode 的.vscode 文件
"Plug 'skywind3000/asynctasks.vim'
"Plug 'skywind3000/asyncrun.vim'<Paste>

" 分别是 icons，括号多彩，缩进的虚线，终端集成
Plug 'ryanoasis/vim-devicons'
Plug 'luochen1990/rainbow'
Plug 'wincent/terminus'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Editor
Plug 'tpope/vim-surround' " type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'jiangmiao/auto-pairs'
Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type k) k] k} kp
Plug 'tpope/vim-commentary'
Plug 'mg979/vim-visual-multi'
Plug 'dyng/ctrlsf.vim' " 全局搜索

" markdown
Plug 'godlygeek/tabular', { 'for': 'markdown' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install', 'for': 'markdown'  }

" React
Plug 'HerringtonDarkholme/yats.vim'
" or Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'

call plug#end()

" ====================
" statusLine
" ====================

set guifont=Roboto\ Mono\ Medium\ for\ Powerline\ Font:h18

" let g:airline_powerline_fonts = 0
" let g:airline#extensions#tabline#enabled = 1
" let g:airline_theme='one'

set laststatus=2
let g:lightline = {
	\ 'colorscheme': 'cosme',
	\ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
	\             ['gitbranch'],
	\             [ 'filename' ] ],
	\   'right': [ [ 'lineinfo' ],
	\              [ 'percent' ],
	\              [ 'modified','filetype'] ]
	\ },
  \ 'component_function': {
  \   'gitbranch': 'gitbranch#name'
  \ },
\ }

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


" ====================
" 颜色显示
" ====================

let g:Hexokinase_highlighters = ['virtual']
set termguicolors " enable true colors support
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" set background=dark
" set t_8b=^[[48;2;%lu;%lu;%lum
" set t_8f=^[[38;2;%lu;%lu;%lum
" syntax enable
colorscheme cosme

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
" which key
" ====================

nnoremap <silent> <LEADER> :<c-u>WhichKey '<Space>'<CR>
set timeoutlen=500

" ====================
" which key
" ====================

let g:coc_global_extensions = [
	\ 'coc-actions',
	\ 'coc-lists',
	\ 'coc-vimlsp',
	\ 'coc-spell-checker',
	\ 'coc-highlight',
	\ 'coc-gitignore',
	\ 'coc-css',
	\ 'coc-cssmodules',
	\ 'coc-xml',
	\ 'coc-tsserver',
	\ 'coc-json',
	\ 'coc-snippets',
	\ 'coc-eslint',
	\ 'coc-prettier',
	\ 'coc-vetur',
	\ 'coc-html']

" command! -nargs=0 Format :call CocAction('format')
" nnoremap <silent> \f :Format<CR>

nmap <leader>rn <Plug>(coc-rename)

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

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
nnoremap <silent> <LEADER>H :call <SID>show_documentation()<CR>

nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)

" coc-actions coc-spell-check
function! s:cocActionsOpenFromSelected(type) abort
	execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

" ====================
" files search
" ====================

" nnoremap <silent> <LEADER>fp1 :Files ~/Documents/workProjects/chatlysalescloudh5<CR>
nnoremap <silent> <LEADER>ff :Files<CR>
nnoremap <silent> <LEADER>fb :Buffers<CR>
nnoremap <silent> <LEADER>fg :CtrlSF 

" ====================
" files tree
" ====================


autocmd FileType defx call s:defx_my_settings()

function! s:defx_my_settings() abort
	" Define mappings
	nnoremap <silent><buffer><expr> <CR> defx#do_action('open')
	nnoremap <silent><buffer><expr> c defx#do_action('copy')
	nnoremap <silent><buffer><expr> m defx#do_action('move')
	nnoremap <silent><buffer><expr> p defx#do_action('paste')
	nnoremap <silent><buffer><expr> l defx#do_action('open')
	nnoremap <silent><buffer><expr> E defx#do_action('open', 'vsplit')
	nnoremap <silent><buffer><expr> P defx#do_action('preview')
	nnoremap <silent><buffer><expr> o defx#do_action('open_tree', 'toggle')
	nnoremap <silent><buffer><expr> K defx#do_action('new_directory')
	nnoremap <silent><buffer><expr> N defx#do_action('new_file')
	" nnoremap <silent><buffer><expr> M defx#do_action('new_multiple_files')
	nnoremap <silent><buffer><expr> S defx#do_action('toggle_sort', 'time')
	nnoremap <silent><buffer><expr> d defx#do_action('remove')
	nnoremap <silent><buffer><expr> r defx#do_action('rename')
	" nnoremap <silent><buffer><expr> ! defx#do_action('execute_command')
	" nnoremap <silent><buffer><expr> x defx#do_action('execute_system')
	nnoremap <silent><buffer><expr> yy defx#do_action('yank_path')
	nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
	" nnoremap <silent><buffer><expr> ; defx#do_action('repeat')
	nnoremap <silent><buffer><expr> h defx#do_action('cd', ['..'])
	nnoremap <silent><buffer><expr> ~ defx#do_action('cd')
	nnoremap <silent><buffer><expr> <C-[> defx#do_action('quit')
	nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select') . 'j'
	nnoremap <silent><buffer><expr> * defx#do_action('toggle_select_all')
	nnoremap <silent><buffer><expr> j line('.') == line('$') ? 'gg' : 'j'
	nnoremap <silent><buffer><expr> k line('.') == 1 ? 'G' : 'k'
	" nnoremap <silent><buffer><expr> <C-l> defx#do_action('redraw')
	nnoremap <silent><buffer><expr> <C-g> defx#do_action('print')
	" nnoremap <silent><buffer><expr> cd defx#do_action('change_vim_cwd')
endfunction

nnoremap <silent> <C-b> :Defx<CR>

call defx#custom#option('_', {
	\ 'show_ignored_files': 0,
	\ 'columns': 'icons:indent:filename:type:size:time',
	\ })
	" \ 'winheight': 40,
	" \ 'winwidth': 60,
	" \ 'split': 'floating',
	" \ 'direction': '',

call defx#custom#column('filename', {
	\ 'min_width': 40,
	\ 'max_width': 40,
	\ })

" ====================
" markdown
" ====================

autocmd Filetype markdown nnoremap ,m :MarkdownPreview<CR>
autocmd Filetype markdown inoremap <buffer> ,f <Esc>/<++><CR>:nohlsearch<CR>"_c4l
autocmd Filetype markdown inoremap <buffer> ,w <Esc>/ <++><CR>:nohlsearch<CR>"_c5l<CR>
autocmd Filetype markdown inoremap <buffer> ,b **** <++><Esc>F*hi
autocmd Filetype markdown inoremap <buffer> ,i ** <++><Esc>F*i
autocmd Filetype markdown inoremap <buffer> ,c ```<Enter><++><Enter>```<Enter><Esc>3kA
autocmd FileType markdown inoremap <buffer> ,p ![](<++>) <++><Esc>F[a
autocmd FileType markdown inoremap <buffer> ,a [](<++>) <++><Esc>F[a

exec "nohlsearch"
