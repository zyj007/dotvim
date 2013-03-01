set nu
syntax on
colorscheme desert
set tabstop=4
set nobackup
set nowb
set noswapfile
set ai 
set si
set wrap
set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
set autoread
set ruler
set cmdheight=2
set incsearch

filetype plugin on
filetype indent on

set complete+=k
" autocmd是设置文件类型的自动补全,ctrl+x;ctrl+o可以调用
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

function! HasPaste()
    if &paste
		return 'PASTE MODE  '
    en
	return ''
endfunction

function Mytitle()
		call setline(1,"/**********************************************")
		call append(line("."),"Auhtor:ZYJ007")
		call append(line(".")+1,"Time:".strftime("%c"))
		call append(line(".")+2,"File:".expand("%"))
		call append(line(".")+3,"Desc:")
		call append(line(".")+4,"**********************************************/")
endf

map <F2> <Esc>:call Mytitle()<CR><Esc>:$<Esc>o

let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
" 设置默认打开html等网页文件的自动补全
autocmd BufNewFile,BufRead *.html,*.htm,*.xml inoremap </ </<c-x><c-o>
" 指定某些类型新建文件时候的自动补全方式,例如js,更上面的那个设置略有不同
autocmd BufNewFile,BufRead *.js set omnifunc=javascriptcomplete#CompleteJS
" 自动补齐括号书名号引号等设置
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap { {}<LEFT>
inoremap ' ''<LEFT>
inoremap " ""<LEFT>
