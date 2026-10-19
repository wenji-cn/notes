colorscheme desert			"设置主题"

set encoding=utf-8			"设置编码格式"
set number					"设置行号"
set relativenumber			"设置相对行号"

syntax on					"开启语法高亮"
filetype on					"开启文件类型检测"

set smartindent				"智能缩进"
set autoindent				"自动对齐"

set smarttab
set tabstop=4				"tab缩进四个字符"
set shiftwidth=4			"设置自动缩进四个字符"
set splitright				"设置左右分割窗口时，新窗口位置在右侧"
set splitbelow				"设置上下分割窗口时，新窗口位置在底部"

set showcmd					"显示输入命令"
set showmatch				"显示匹配"
set laststatus=2			"显示状态栏"
set showtabline=2			"显示tab栏"

set sm!						"高亮显示匹配括号"
set hlsearch				"高亮显示查找匹配"
"set termguicolors"			"显示终端真色"
set ruler					"显示标尺，在右下角光标位置"
set cursorline				"高亮显示当前行"
set mousehide				"输入时隐藏光标"
"set mouse=a"					"使用鼠标"

set ambiwidth=double		"解决中文标点显示的问题"
set nocompatible			"不兼容vi"
"set nowrap"					"不自动折行"

set nobackup				"不备份文件"
set noswapfile				"禁止生成临时文件"

set path+=**				"递归查找子文件夹"
set wildmenu				"展示match的文件列表"



let g:netrw_banner=0		"禁用没有的横幅"
let g:netrw_winsize=25		"初始窗口大小为25%"
let g:netrw_liststyle=3		"使用树状模式"
let g:netrw_altv=1			"分割窗口时默认右边"
let g:netrw_browse_split=4	"enter时在上一个窗口打开"