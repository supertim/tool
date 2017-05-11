
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Basic setting section
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 开启文件类型检测
filetype on
" 根据不同文件类型加载不同的插件
filetype plugin on
syntax on

let mapleader=";"

" 让配置变更立即生效
" autocmd BufWritePost $MYVIMRC source $MYVIMRC

" 定义快捷键在结对符之间跳转
nmap <Leader>M %

" backup settings
set backup
set backupdir=~/.vimbackup

if !isdirectory(expand(&backupdir))
  if exists("*mkdir")
    call mkdir(expand(&backupdir), "p")
  endif
endif

" input settings
set backspace=2
set tabstop=4
set shiftwidth=4
" set smarttab
" set softtabstop=4
set expandtab " expand tab to spaces

" indent settiongs
set autoindent
set smartindent
set cindent
set cinoptions=:0,g0,t0,(0,Ws,m1

" search settings
set hlsearch
set incsearch
set smartcase
set ignorecase

" 关闭兼容模式
set nocompatible
" vim 自身命令行模式智能补全
set wildmenu

"设置编码方式
set encoding=utf-8
"自动判断编码时 依次尝试一下编码
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""   Vundle Section
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" vundle 环境设置
" filetype off
set rtp+=~/.vim/bundle/Vundle.vim

" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()

Plugin 'dkprice/vim-easygrep'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Shougo/neocomplete.vim'
Plugin 'SirVer/ultisnips'
Plugin 'VundleVim/Vundle.vim'
Plugin 'a.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'c.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ctrlpvim/ctrlsf.vim'
Plugin 'davidzchen/vim-bazel'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'derekwyatt/vim-protodef'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'gcmt/wildfire.vim'
Plugin 'honza/vim-snippets'
Plugin 'kshenoy/vim-signature'
Plugin 'lilydjwg/fcitx.vim'
Plugin 'majutsushi/tagbar'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'rhysd/vim-clang-format'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'sjl/gundo.vim'
Plugin 'suan/vim-instant-markdown'
"Plugin 'supertab'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tomasr/molokai'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/DfrankUtil'
Plugin 'vim-scripts/DrawIt'
Plugin 'vim-scripts/indexer.tar.gz'
Plugin 'vim-scripts/phd'
Plugin 'vim-scripts/vimprj'
Plugin 'winmanager'

" 插件列表结束
call vundle#end()

filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""  配色 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" 配色方案
set background=dark
" colorscheme solarized
colorscheme molokai
" colorscheme phd 
" 禁止光标闪烁
set gcr=a:block-blinkon0
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行/列
"
set guifont=YaHei\ Consolas\ Hybrid\ 11.5

" 禁止折行
set nowrap
"在状态栏显示正在输入的命令
set showcmd
"设置历史记录条数
set history=1000

"设置匹配模式 类似当输入一个左括号时会匹配相应的那个右括号
set showmatch

" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=1
" 设置格式化时制表符占用空格数
set shiftwidth=2
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=2

" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle

" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable

" 设置 tagbar 子窗口的位置出现在主编辑区的左边
let tagbar_left=1
" 设置显示／隐藏标签列表子窗口的快捷键。速记：identifier list by tag
map <F2> :TagbarToggle<CR>
" 设置标签子窗口的宽度
let tagbar_width=32
" tagbar 子窗口中不显示冗余帮助信息
let g:tagbar_compact=1
" 设置 ctags 对哪些代码标识符生成标签
let g:indexer_disableCtagsWarning=1
let g:tagbar_type_cpp = {
      \ 'kinds' : [
      \ 'c:classes:0:1',
      \ 'd:macros:0:1',
      \ 'e:enumerators:0:0',
      \ 'f:functions:0:1',
      \ 'g:enumeration:0:1',
      \ 'l:local:0:1',
      \ 'm:members:0:1',
      \ 'n:namespaces:0:1',
      \ 'p:functions_prototypes:0:1',
      \ 's:structs:0:1',
      \ 't:typedefs:0:1',
      \ 'u:unions:0:1',
      \ 'v:global:0:1',
      \ 'x:external:0:1'
      \ ],
      \ 'sro' : '::',
      \ 'kind2scope' : {
      \ 'g' : 'enum',
      \ 'n' : 'namespace',
      \ 'c' : 'class',
      \ 's' : 'struct',
      \ 'u' : 'union'
      \ },
      \ 'scope2kind' : {
      \ 'enum' : 'g',
      \ 'namespace' : 'n',
      \ 'class' : 'c',
      \ 'struct' : 's',
      \ 'union' : 'u'
      \ }
      \ }

" 设置插件 indexer 调用 ctags 的参数
" 默认 --c++-kinds=+p+l，重新设置为 --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v
" 默认 --fields=+iaS 不满足 YCM 要求，需改为 --fields=+iaSl
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"

" 替换函数。参数说明：
" confirm：是否替换前逐一确认
" wholeword：是否整词匹配
" replace：被替换字符串
function! Replace(confirm, wholeword, replace)
  wa
  let flag = ''
  if a:confirm
    let flag .= 'gec'
  else
    let flag .= 'ge'
  endif
  let search = ''
  if a:wholeword
    let search .= '\<' .  escape(expand('<cword>'), '/\.*$^~[') . '\>'
  else
    let search .= expand('<cword>')
  endif
  let replace = escape(a:replace, '/\&~')
  execute 'argdo %s/' .  search .  '/' .  replace .  '/' .  flag .  '| update'
endfunction
" 不确认、非整词
nnoremap <Leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 不确认、整词
nnoremap <Leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、非整词
nnoremap <Leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、整词
nnoremap <Leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <Leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>

" 成员函数的实现顺序与声明顺序一致
let g:disable_protodef_sorting=1
" 设置 pullproto.pl 脚本路径
let g:protodefprotogetter='~/.vim/bundle/vim-protodef/pullproto.pl'
" 成员函数的实现顺序与声明顺序一致
let g:disable_protodef_sorting=1

set tags+=/home/timcheng/.vim/tags/tdcpp.tags

" 红线
set colorcolumn=81

" Highlight current line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

" 到文件末尾
autocmd BufNewFile * normal G "

let g:clang_format#style_options = {
      \ "AllowShortIfStatementsOnASingleLine" : "true",
      \ "AlwaysBreakTemplateDeclarations" : "true",
      \ "PointerAlignment" : "true",
      \ "BinPackArguments": "false",
      \ "BinPackParameters": "false",
      \ "Standard" : "C++11"}

let g:clang_format#code_style="google"
let g:clang_format#auto_format=1
let g:clang_format#auto_formatexpr=1


" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom commands sections      
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fix vim quick fix
" set errorformat^=%f:%l:%c

if version >= 700
  autocmd QuickFixCmdPost * :QFix
endif

" QUICKFIX WINDOW
" @see http://c9s.blogspot.com/2007/10/vim-quickfix-windows.html
command -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
    unlet g:qfix_win
  else
    copen
    let g:qfix_win = bufnr("$")
  endif
endfunction

" toggle quickfix window
nmap <F9> :QFix<CR>

function! Bazel(...)
  let l:old_makeprg = &makeprg
  setlocal makeprg=bazel
  execute "make " . join(a:000)
  let &makeprg=old_makeprg
endfunction
command! -complete=dir -nargs=* Bazel call Bazel('<args>')

map <F5> :Bazel build --genrule_strategy=standalone --spawn_strategy=standalone ... -c dbg<CR><CR>:1cn<CR> 
map <F6> :Bazel test --test_output all ...<CR><CR> 
" jump to previous building error
map <F3> :cp<CR>
" jump to next building error
map <F4> :cn<CR>

" 设置winmanager的宽度，默认为25
let g:winManagerWindowLayout='NERDTree|Tagbar'
let g:winManagerWidth=30
let g:NERDTree_title = "[NERDTree]"
function! NERDTree_Start()
  exe 'q' "执行一个退出命令，关闭自动出现的窗口"
  exe 'NERDTree'
endfunction

function! NERDTree_IsValid()
  return 1
endfunction

let g:Tagbar_title = "[Tagbar]"
function! Tagbar_Start()
  exe 'q' "执行一个退出命令，关闭自动出现的窗口"
  exe 'TagbarOpen'
endfunction

function! Tagbar_IsValid()
  return 1
endfunction
let g:tagbar_vertical = 30

"autocmd VimEnter * NERDTree 
"autocmd VimEnter * TagbarOpen " $wincmd w
"autocmd VimEnter * 3 wincmd w

" 用来查找文件用
" 目前分屏是上下分屏
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-k>'
let g:ctrlp_cmd = 'CtrlP'

let g:EasyMotion_leader_key='<Space>'

"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
"" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "   "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^.  \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

let g:neocomplete#enable_at_startup = 1
set completeopt=menu
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
set tags+=/home/tim/.vim/tags/stdcpp.tags
" OmniCppComplete
let OmniCpp_NamespaceSearch = 5 
let OmniCpp_GlobalScopeSearch = 5 
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " 显示函数参数列表
let OmniCpp_MayCompleteDot = 1   " 输入 .  后自动补全
let OmniCpp_MayCompleteArrow = 1 " 输入 -> 后自动补全
let OmniCpp_MayCompleteScope = 1 " 输入 :: 后自动补全
" 自动关闭补全窗口
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest
" 窗口的颜色
" 可以通过命令来查看可以配置颜色
" :runtime syntax/colortest.vim
highlight Pmenu ctermbg=darkmagenta gui=bold

" [for ultisnips]
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" [For ProtoDef]
let g:protodefprotogetter='~/.vim/bundle/vim-protodef/pullproto.pl'
" 成员函数的实现顺序与声明顺序一致
let g:disable_protodef_sorting=1


" [For EasyGrep]
let g:EasyGrepMode = 2     " All:0, Open Buffers:1, TrackExt:2,
let g:EasyGrepCommand = 0  " Use vimgrep:0, grepprg:1
let g:EasyGrepRecursive  = 1 " Recursive searching
let g:EasyGrepIgnoreCase = 1 " not ignorecase:0
let g:EasyGrepFilesToInclude = "*.h, *.cc, BUILD"
