call pathogen#infect()
call pathogen#helptags()

set t_Co=256

let mysyntaxfile="~/.vimsyntax"

syntax on
set tags=$GXPROJ/tags
set autoindent
set cindent
set statusline=%F\ %h%y%r%m\ %n%=%2B\ %3b\ \ \ \ \ \ %8L,%8l-%-8c%8p%%
set laststatus=2
set ignorecase
set tags=~/ProSysTags$GXPROJ/tags
map [11~ /^\/\*###
map [24~ :g/^\/\*###.*%%%\*\/$/d
set ts=4 sts=4 sw=4 et
set backspace=indent,eol,start
set hlsearch incsearch " Set highligthing in search

set efm=%A%*[^:]:\ %*[^:]:\ %f\\,\ %*[^0123456789]%l:\ %m,
	\%-G%m%*[^-],
	\%-G%*[^%^]%^

" Paste Mode On/Off
map <F9> :call Paste_on_off()<CR>
set pastetoggle=<F9>

let paste_mode = 0 " 0 = normal, 1 = paste

func! Paste_on_off()
  if g:paste_mode == 0
    set paste
    let g:paste_mode = 1
  else
    set nopaste
    let g:paste_mode = 0
  endif
  return
endfunc

map <F8> :call Set_number_on_off()<CR>

let nbr_mode = 0 " 0 = normal, 1 = paste

func! Set_number_on_off()
  if g:nbr_mode == 0
    set number
    let g:nbr_mode = 1
  else
    set nonumber
    let g:nbr_mode = 0
  endif
  return
endfunc

map ,v :e ~/.vimrc<CR>
map ,u :e ~/.user_config<CR>
map ,s :e ~/.vimsyntax<CR>
map ,h :e /etc/hosts<CR>
map ,g :e ~/.vim/colors/greg.vim<CR>

:highlight RedundantSpaces ctermbg=red guibg=red
:match RedundantSpaces /\s\+$\| \+\ze\t/

fun! ShowFuncName()
  let lnum = line(".")
  let col = col(".")
  echohl ModeMsg
  echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
  echohl None
  call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun
map f :call ShowFuncName() <CR>


if has("autocmd")

    " Enable file type detection "
    filetype on

    " Do not expand tabs for makfile "
    autocmd FileType make setlocal noet

    " Source the vimrc file after saving it
    autocmd bufwritepost .vimrc source $MYVIMRC

    autocmd Bufread *pcf.fil set filetype=c
    autocmd Bufread helpsvn.txt set filetype=help
    autocmd Bufread helpsvn.txt set mouse=

endif

"przelaczanie set list
nmap <leader>l :set list!<CR>

set listchars=tab:▸\ ,eol:¬
map <C-Left> <C-w>h
map <C-Down> <C-w>j
map <C-Up> <C-w>k
map <C-Right> <C-w>l

map <F5> :set mouse=a<CR>
map <F6> :set mouse=<CR>

" map <C-]> gt
" map <C-[> gT

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

map <silent><F3> :NEXTCOLOR<cr> 
map <silent><F2> :PREVCOLOR<cr>

" first install plugin https://github.com/tpope/vim-unimpaired
" Bubble single lines
 nmap <C-Up> [e
 nmap <C-Down> ]e
" Bubble multiple lines
 vmap <C-Up> [egv
 vmap <C-Down> ]egv
