let mapleader =';'
set nocompatible
set pyxversion=3

set ts=4
set showmode
set encoding=utf-8
" 语法检验
syntax on 
syntax enable
let g:python_highlight_all=1

set autoindent
set clipboard=unnamed

filetype off
filetype plugin on
filetype indent on

set showcmd
" 自身命令行模式智能补全
set wildmenu

au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" normal write
inoremap <leader>w <Esc>:w<cr>
noremap <leader>w :w<cr>
"vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)
" ultisnips
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" flygrep
nnoremap <space>s :FlyGrep<cr>

" supertab
let g:SuperTabDefaultCompletionType = 'context'
" ack ag
let g:ackprg = 'ag --nogroup --nocolor --column'

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Deoplete
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" virtualenv
let g:virtualenv_auto_activate = 1

" jedi
let g:jedi#auto_vim_configuration = 0
" current default is 1.
let g:jedi#use_tabs_not_buffers = 0
" let g:jedi#completions_enabled = 0
" let g:jedi#smart_auto_mappings = 1
let g:jedi#auto_close_doc = 1

" ale
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'

" gundo
let g:gundo_prefer_python3 = 1
nnoremap <leader>h :GundoToggle<CR>

nnoremap <Leader>c :Ack!<Space>

let g:ackhighlight = 1
let g:ack_qhandler = "botright copen 15"
let g:ack_autoclose = 1
let g:ack_use_cword_for_empty_search = 1

nnoremap <silent> <F12> :LeaderfFunction<cr>

" colorscheme
set t_Co=256
set guifont=YaHei\ Consolas\ Hybrid\ 11.5

" git 
let g:gitgutter_diff_args = '-w'

" 辅助信息展示
"
set laststatus=2
set ruler
set number
set relativenumber
set cursorline
" 实时搜索
set incsearch
set ignorecase
set hlsearch
" 隐藏滚动条"    
set guioptions-=r 
set guioptions-=L
set guioptions-=b
set gcr=a:block-blinkon0

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set backspace=2

" comments
autocmd FileType python,shell set commentstring=#\ %s                 " 设置Python注释字符
autocmd FileType mako set cms=##\ %s

" 缩进管理
map <leader>il :IndentLinesToggle<cr>
" 第二级别开始展示缩进
let g:indent_guides_start_level=2
"  色块宽度
let g:indent_guides_guide_size=1
set foldmethod=indent
set nofoldenable
let g:indent_guides_auto_colors = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

set rtp+=~/.vim/bundle/Vundle.vim

" ctrlsf
nnoremap <C-f> :CtrlSF<Space>

" indent
let g:indentLine_setColors = 0
let g:indentLine_color_term = 239
let g:indentLine_char='┆'
let g:indentLine_enabled = 1

" isort
autocmd FileType python noremap <buffer> <c-i> :Isort<cr>
let g:vim_isort_python_version = 'python3'

" wild快捷键
map <SPACE> <Plug>(wildfire-fuel)
vmap <S-SPACE> <Plug>(wildfire-water)
" 适用于哪些结对符
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "i>", "ip"]

" Autopep8
let g:autopep8_disable_show_diff=1

" nmap <F8> :Autopep8<cr>
autocmd FileType python noremap <buffer> <F8> :ALEFix<CR>

let g:ale_fixers = {'python': ['add_blank_lines_for_python_control_statements','autopep8','isort','yapf','remove_trailing_lines','trim_whitespace'],}

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 | 
    \ set shiftwidth=4 |
    \ set textwidth=120 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

autocmd BufWritePost *.py call Flake8()

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme="luna" 
" nnoremap <C-N> :bn<CR>
" nnoremap <C-P> :bp<CR>
set laststatus=2  "永远显示状态栏


" 插件管理

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" 主题优化
Plugin 'vim-scripts/phd'
" cpp 高亮
" Plugin 'octol/vim-cpp-enhanced-highlight'
" 缩进级别可视化
Plugin 'nathanaelkane/vim-indent-guides'
" 标记快速跳转 m[a-z] '[a-z]
Plugin 'kshenoy/vim-signature'
" 全局搜索
Plugin 'dyng/ctrlsf.vim'
" 多行处理
Plugin 'terryma/vim-multiple-cursors'
" 代码片段
Plugin 'garbas/vim-snipmate'
Plugin 'SirVer/ultisnips'
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'honza/vim-snippets'
" 选中结对符内
Plugin 'gcmt/wildfire.vim'
" 时光机
Plugin 'sjl/gundo.vim'
" jedi 自动补全
Plugin 'davidhalter/jedi-vim'
" flake8 格式化
Plugin 'nvie/vim-flake8'
" python pep8 缩进
Plugin 'Vimjas/vim-python-pep8-indent'
" aut0pep8
Plugin 'tell-k/vim-autopep8'
" 缩进对齐线
Plugin 'Yggdroot/indentLine'
" 配对自动补全
Plugin 'jiangmiao/auto-pairs'
" 状态栏
Plugin 'vim-airline/vim-airline'
" 状态栏主题
Plugin 'vim-airline/vim-airline-themes'
" vim git 插件
Plugin 'tpope/vim-fugitive'
" tab 自动补全
Plugin 'ervandew/supertab'
" python 语法高亮
Plugin 'vim-python/python-syntax'
" git diff
Plugin 'airblade/vim-gitgutter'
" git view tree
Plugin 'gregsexton/gitv'
" vim 批量注释
Plugin 'tpope/vim-commentary'
" 成对符号编辑
Plugin 'tpope/vim-surround'
" python import 优化
Plugin 'fisadev/vim-isort'
" 文件搜索
Plugin 'junegunn/fzf.vim'
Plugin 'mileszs/ack.vim'
Plugin 'Yggdroot/LeaderF'
Plugin 'wsdjeg/FlyGrep.vim'
" search {char}{char} 
Plugin 'justinmk/vim-sneak'
" 区域选中
Plugin 'terryma/vim-expand-region'
" 自动补全
Plugin 'Shougo/deoplete.nvim'
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'roxma/nvim-yarp'
" async 检查
Plugin 'w0rp/ale'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'bogado/file-line'

" 插件列表结束
call vundle#end()
