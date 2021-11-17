" source: https://github.com/chinghanho/.dotfiles/blob/master/.vimrc

"----------------- Vundle ----------------
"
" http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" there is old version of Vundle: https://github.com/gmarik/vundle
  let iCanHazVundle=0
endif
set nocompatible             " be iMproved, required
filetype off                 " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" old version use `call vundle#rc()` to `call vundle#begin()`, `Bundle` to `Plugin`

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" My Plugins
"
Plugin 'easymotion/vim-easymotion'
" Plugin 'vim-syntastic/syntastic'
" Plugin 'altercation/vim-colors-solarized'
" Plugin 'scrooloose/nerdtree'
" Plugin 'MarcWeber/vim-addon-mw-utils'	" depended by snipmate
Plugin 'tomtom/tlib_vim'	" depended by snipmate, tcommand
" Plugin 'garbas/vim-snipmate'
" Plugin 'honza/vim-snippets'
Plugin 'tomtom/tcomment_vim'
" Plugin 'tpope/vim-surround'
" Plugin 'dhruvasagar/vim-table-mode'
" Plugin 'airblade/vim-gitgutter'
" Plugin 'Townk/vim-autoclose'
" Plugin 'kien/ctrlp.vim'
" Plugin 'majutsushi/tagbar'
" Plugin 'tpope/vim-fugitive'
" Plugin 'davidhalter/jedi-vim'
" Plugin 'mattn/emmet-vim'
" Plugin 'bling/vim-airline'
" Plugin 'evanmiller/nginx-vim-syntax'

call vundle#end()
"
" Brief Help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approved removal
"
" see :h vundle for more details or wiki for FAQ
"
"----------------- End Vundle --------------

"----------------- General ------------------
"
filetype plugin indent on	 " enable filetype-specific plugins
filetype plugin on			 " enable loading the plugin files for specific file types
filetype indent on           " enable loading the indent file for specific file types
set background=dark
" let g:solarized_termtrans=0
" let g:solarized_contrast="normal"
" let g:solarized_visibility="normal"
colorscheme desert           " vim color scheme
set noruler					 " status bar
							 " ruler has no effect if there is a custom statusline setting
" set rulerformat=%15(%c%V,%l\ \ %p%%%))	" status bar format
set textwidth=0			 	 " text width for automatic word wrapping, 0 to stop wrapping
set hlsearch				 " highlight search hits
" set nohlsearch
set history=50               " keep 50 lines of command line history
set number                   " enable line numbers
set autoindent               " enable autoindent
set expandtab 	             " use space instead of tab
" autocmd FileType make setlocal noexpandtab	" disable expandtab
set tabstop=4                " insert 2 spaces for a tab
set shiftwidth=4             " the number of space characters inserted for indentation
syntax on                    " enable syntax highlighting
set autoread                 " auto read when file is changed from outside
set mouse=nv                  " mouse support, mouse enabled only in Normal and Visual mode
" patched font src: https://github.com/Lokaltog/powerline-fonts/pull/16
set guifont=Monaco\ for\ Powerline:h14
set t_Co=256                 " 256 color mode
if has("gui_macvim")         " macvim shift movement
	let macvim_hig_shift_movement = 1
endif
set cursorline               " highlight current line
set clipboard=unnamed        " yank to the system register (*) by default
set showmatch                " Cursor shows matching ) and }
set showmode                 " Show current mode
set backspace=2              " make backspace work like most other apps
set noeb vb t_vb=            " disable sound on errors
set laststatus=2             " status line always enabled
" status line format
set statusline=%F%m%r%y%=%c,%l/%L\ \ %P)\ 
set wildmode=longest,list,full
set wildmenu
set whichwrap+=<,>,h,l,[,]   " Automatically wrap left and right

" encoding settings
set encoding=utf-8			 " save file with utf-8
set termencoding=utf-8		 " read file with utf-8
set fileencoding=utf-8		 " auto convert to utf-8

" highlight settings
highlight LineNR cterm=bold ctermfg=DarkGray ctermbg=NONE		" line number highlight 
highlight CursorLineNR cterm=bold ctermfg=Gray ctermbg=NONE		" cursor line number highlight
highlight Search cterm=NONE ctermfg=White ctermbg=Green			" search hits highlight
highlight Pmenu cterm=NONE ctermfg=DarkGray ctermbg=Black		" word completion highlight
highlight PmenuSel cterm=Bold ctermfg=Black ctermbg=Gray 		" selected word completion highlight
highlight StatusLine cterm=Bold ctermfg=Gray ctermbg=NONE		" statusline highlight

" key mapping
" inoremap ( ()<Esc>i
" inoremap " ""<Esc>i
" inoremap ' ''<Esc>i
" inoremap [ []<Esc>i
" inoremap < <><Esc>i
" inoremap { {}<Esc>i
" inoremap {<CR> {<CR>}<Esc>ko<tab>

" Smart mapping for tab completion
" http://vim.wikia.com/wiki/Smart_mapping_for_tab_completion 
"
" function! Smart_TabComplete()
"	let line = getline('.')
" 	let substr = strpart(line, -1, col('.') + 1)
"	let substr = matchstr(substr, "[^ \t]*$")
"	if(strlen(substr) == 0)
"		return "\<tab>"
"	endif
"	let has_period = match(substr, '\.') != -1
"	let has_slash = match(substr, '\/') != -1
"	if (!has_period && !has_slash)
"		return "\<C-X>\<C-P>"	" existing text matching
"	elseif ( has_slash )
"		return "\<C-X>\<C-F>"	" file matching
"	else
"		return "\<C-X>\<C-O>"	" plugin matching
"	endif
" endfunction

" inoremap <tab> <c-r>=Smart_TabComplete()<CR>

" hit space to clear highlight

" function! Smart_EnterComplete()
" 	let line = getline('.')
" 	let substr = strpart(line, -1, col('.') + 1)
" 	let substr = matchstr(substr, "[^ \t]*$")
" 	if(strlen(substr) == 0)
" 			return "\<CR>"
" 	endif
" 	let has_brace = match(substr, '{') != -1
" 	if(!has_brace)
" 		return "\<CR>"
" 	else
" 		return "\<CR>\<tab>\<CR>\<Up>\<Right>"
" 	endif
" endfunction
"
" inoremap <CR> <c-r>=Smart_EnterComplete()<CR>

nnoremap <Space> :noh<return><Space>

"
"------------------- End General ------------------

" tmux will only forward escape sequences to the terminal if surrounded by a DCS sequence
" http://sourceforge.net/mailarchive/forum.php?thread_name=AANLkTinkbdoZ8eNR1X2UobLTeww1jFrvfJxTMfKSq-L%2B%40mail.gmail.com&forum_name=tmux-users
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Hide toolbar and scrollbars in MacVim
set guioptions-=T
set guioptions-=L
set guioptions-=r

" add spell checking and automatic wrapping at the
" recommended 72 columns to you commit messages
" autocmd Filetype gitcommit setlocal spell textwidth=72

" to move effeciently between splits
nmap gh <C-w>h
nmap gj <C-w>j
nmap gk <C-w>k
nmap gl <C-w>l

" Bash like keys for the command line
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-K>      <C-U>

" ctags
set tags=tags;/
" remap Ctrl+] key for Windows Terminal in Traditional Chinese keyboard
nnoremap <C-k> <C-]>

" hit <F8> to compile program
" use :r to remove the file extension name
imap <F8> <ESC>:call Compile()<CR>
nmap <F8> :call Compile()<CR>

func! Compile()
	exec "w"
	if &filetype == 'c'
		exec "!gcc % -o %:r.out -Wall"
		" exec "!gcc % -o %:r -Wall"
	elseif &filetype == 'cpp'
		exec "!g++ -std=c++11 % -o %:r.out -Wall"
	endif
endfunc

" hit <F9> to run program
imap <F9> <ESC>:call Run()<CR>
nmap <F9> :call Run()<CR>

func! Run()
	if &filetype == 'c'
		exec "!./%:r.out"
	elseif &filetype == 'cpp'
		exec "!./%:r.out"
	elseif &filetype == 'python'
		exec "!./%"
	endif
endfunc

" hit <F10> to compile and run program
imap <F10> <Esc>:call CompileRun()<CR>
nmap <F10> :call CompileRun()<CR>

func! CompileRun()
	exec "w"
	if &filetype == 'c'
		exec "!gcc % -o %:r.out -Wall; ./%:r.out"
	elseif &filetype == 'cpp'
		exec "!g++ -std=c++11 % -o %:r.out -Wall; ./%:r.out"
	elseif &filetype == 'python'
		exec "!./%"
	endif
endfunc

" ---------------- Plugin ---------------------
"
" --- easymotion
" f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
" Gif config
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)

hi EasyMotionTarget ctermbg=none ctermfg=green

" --- syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" --- NERDtree
" display dotfiles
" let NERDTreeShowHidden=1

" --- TComment
" comment lines with cmd+/
map <Leader>c :TComment<cr>
vmap <Leader>c :TComment<cr>gv

" --- vim-gitgutter
" let g:gitgutter_enabled = 1
" highlight clear SignColumn " For the same appearance as your line number column

" --- tagbar
" nmap <D-\> :TagbarToggle<CR>

" --- ctrlp
" let g:ctrlp_dont_split = 'NERD_tree_2'
" let g:ctrlp_show_hidden = 1
" let g:ctrlp_custom_ignore = '\v[\/](node_modules|vendor)|(\.(swp|ico|git|svn))$'

" --- airline
" let g:airline_powerline_fonts = 1

"
" -------------- End Plugin --------------------
