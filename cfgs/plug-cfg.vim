" ------------------------------------------------------------------------------
" <插件管理配置>
" 安装插件管理器vim-plug
" 网址: https://github.com/junegunn/vim-plug/
" 命令: curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" 然后须配置插件管理的开始(call plug#begin('~/.vim/plugged'))与结尾标识才能生效
"
" ------------------------------------------------------------------------------
call plug#begin('~/.vim/plugins')
" dracula 配色主题
" https://draculatheme.com/vim
Plug 'dracula/vim', { 'as': 'dracula' }

" Pretty Dress
"Plug 'ajmwagar/vim-deus'
Plug 'arzg/vim-colors-xcode'
Plug 'morhetz/gruvbox'

"文件树
Plug 'scrooloose/nerdtree',{'on': 'NERDTreeToggle'}

"状态栏airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mg979/vim-xtabline'

" 注释插件
" 注释<leader>cc
" 反注释<leader>cu
Plug 'scrooloose/nerdcommenter'

" 快捷键提示
Plug 'liuchengxu/vim-which-key'

" 括号高亮
Plug 'luochen1990/rainbow'

" 单词包裹
" ysiw' 将光标所在字符串(一个单词)进行包裹
" 如果需要包裹多个单词，需要先按v或V进入可视模式选择字符，然后输入大写S，再输入包裹符号
" ds' 清除''
" cs'" 单引号替换成双引号（其他符号同理）
Plug 'tpope/vim-surround'   " 如果使用 . 重复surround的操作需要安装vim-repeat插件进行配合
Plug 'tpope/vim-repeat'

" markdown preview
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
" 为 Markdown 生成 TOC 的 Vim 插件
Plug 'mzlogin/vim-markdown-toc', {'for':['gitignore','markdown','vim-plug'],'on':['GenTocGFM', 'GenTocGitLab', 'GenTocMarked', 'GenTocModeline', 'GenTocRedcarpet']}
" markdown table
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
" 文档编号整理，自动编号
Plug 'dkarter/bullets.vim', {'for' : ['markdown', 'text', 'gitcommit', 'scratch', 'vim-plug']}

call plug#end()
