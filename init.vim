call pathogen#infect()
syntax enable
filetype plugin indent on

"" GRUV BOX AND COLOR STUFF
set background=dark
colorscheme gruvbox
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_improved_strings=1
let g:gruvbox_improved_warnings=1

" Run Python
noremap <buffer> <F9> :exec '!python' shellescape(@%,1)<cr>

" Remove that stupid preview window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"----- Things Releating to Display of Text -----
noremap d "_d
noremap dd "_dd

" Line Indents
let g:indentLine_color_term=191
let g:indentLine_char = '|'

" Folding Settings
set foldlevel=99
noremap <space> za
vnoremap <space> zf
hi Folded ctermbg=242

" General
set cursorline
set showmatch
set noexpandtab
set nu
set clipboard=unnamedplus
set hlsearch
set laststatus=2
set splitright
set splitbelow
let python_highlight_all=1

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_rust_src_path = '~/Documents/Rust_Source/src/'

function! NumToggle()
	if(&relativenumber == 1)
		set norelativenumber
	else
		set relativenumber
	endif
endfunc


noremap <C-n> :call NumToggle()<cr>
"noremap <C-o> :NERDTreeToggle<cr>

" terminal
tnoremap <F12> <C-\><C-n> 
set switchbuf+=useopen
function! TermEnter()
	let bufcount = bufnr("$")
	let currbufnr = 1
	let nummatches = 0
	let firstmatchingbufnr = 0
	while currbufnr <= bufcount
		if(bufexists(currbufnr))
			let currbufname = bufname(currbufnr)
			if(match(currbufname, "term://") > -1)
				echo currbufnr . ": ". bufname(currbufnr)
				let nummatches += 1
				let firstmatchingbufnr = currbufnr
				break
			endif
		endif
	let currbufnr = currbufnr + 1
	endwhile
	if(nummatches >= 1)
		execute ":sbuffer ". firstmatchingbufnr
		execute ":b#"
	else
		execute ":terminal"
	endif
endfunction
map <F12> :call TermEnter()<CR>
