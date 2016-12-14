" Tab键的宽度
set tabstop=4
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
" 不要用空格代替制表符
set noexpandtab
set number

set showcmd         " 输入的命令显示出来，看的清楚些  
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容  
set laststatus=2    " 启动显示状态行(1),总是显示状态行(2)  
" 光标显示当前位置
set ruler
" 高亮显示当前行
set cursorline

"允许插件  
filetype plugin on
"从不备份  
set nobackup
"自动保存
set autowrite
" 在处理未保存或只读文件的时候，弹出确认
set confirm
"搜索忽略大小写
set ignorecase
"搜索逐字符高亮
set hlsearch
set incsearch

if version >= 603
	set helplang=cn
	set encoding=utf-8
endif

"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l
" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
set selection=exclusive
set selectmode=mouse,key
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3
" 自动缩进
set autoindent
set cindent
" 为C程序提供自动缩进
set smartindent
" 为特定文件类型载入相关缩进文件
filetype indent on
" 使用回格键正常处理indent, eol, start等
filetype plugin indent on
set backspace=2
set ts=4
set expandtab

set fileencoding=utf-8

autocmd BufNewFile *.cpp,*.h,*.py  exec ":call SetTitle()"
func SetTitle()
    if &filetype == 'cpp' || &filetype == 'h'
        call setline(1, "/*******************************************************************************")
        call append(line("."), " *  @File  : ".expand("%"))
        call append(line(".")+1, " *  @Author: Zhang Zixuan")
        call append(line(".")+2, " *  @Email : zixuan.zhang.victor@gmail.com")
        call append(line(".")+3, " *  @Blog  : www.noathinker.com")
        call append(line(".")+4, " *  @Date  : ".strftime("%c"))
        call append(line(".")+5, " ******************************************************************************/")
        call append(line(".")+6, "")
    endif
    if &filetype == 'python'
        call setline(1, "\# encoding: utf-8")
        call append(line("."), "")
        call append(line(".")+1, "\##############################################################################")
        call append(line(".")+2,"\####   File         : ".expand("%"))
        call append(line(".")+3,"\####   Author       : zixuan.zhang.victor@gmail.com") 
        call append(line(".")+4,"\####   Create Date  : ".strftime("%c"))
        call append(line(".")+5, "\##############################################################################")
    endif
endfunc 

" ctags 设置
" map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map<C-F12>: !ctags -R .<CR>
nmap <Leader>tn :tnext<CR>
nmap <Leader>tp :tprevious<CR>

" TagList 设置
" let Tlist_Show_One_File=1
" let TList_Exit_OnlyWindow=1
" map <C-F8> : TlistToggle <CR>

" tagbar 设置
" 设置tagbar子窗口左边
let tagbar_left=1
" 设置显示/隐藏标签列表子窗口快捷键
map <C-N> :TagbarToggle<CR>
let tagbar_width=32
" 设置不显示冗余信息
let g:tagbar_compact=1
let g:tagbar_type_cpp = {
    \ 'kinds' : [
        \ 'd:macros:1',
        \ 'g:enums',
        \ 't:typedefs:0:0',
        \ 'e:enumerators:0:0',
        \ 'n:namespaces',
        \ 'c:classes',
        \ 's:structs',
        \ 'u:unions',
        \ 'f:functions',
        \ 'm:members:0:0',
        \ 'v:global:0:0',
        \ 'x:external:0:0',
        \ 'l:local:0:0'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }

" 主题设置
syntax enable
syntax on
if has('gui_running')
    set background=light
else
    set background=dark
endif
"colorscheme solarized
colorscheme molokai "我比较喜欢这个主题
"colorscheme phd

let g:molokai_original = 1
let g:rehash256=1
set t_Co=256

" Indent Guides
" 随vim自启动
" let g:indent_guides_enable_on_vim_startup=1
" define indent guide color
let g:indent_guides_auto_colors=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键i开关/缩进可视化
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle


" ctrlSF设置
let mapleader = ","
" map <C-F> : CtrlSF<CR>
map <Leader>sp : CtrlSF<CR>

" Nerdtree 设置
map <C-M> : NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=20
" 设置位置
let NERDTreeWinPos="right"
" 显示隐藏文件
let NERDTreeShowHidden=1
" 不显示冗余信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应buffer
let NERDTreeAutoDeleteBuffer=1

" indentLine设置
let g:indentLine_enabled = 1
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_color_tty_light = 7
let g:indentLine_color_dark = 1
