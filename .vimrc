autocmd VimEnter * startinsert     		  " Always Open In Insert Mode
set number                          		  " Show Absolute Line Number in Vim
set laststatus=2                   		  " Always Have a Status Bar at the Bottom
set nocompatible                    		  " Set Compatibility to Vim not Vi
set wrap                            		  " Wrap Text
set mouse=a                         		  " Include Mouse Support 
set nohlsearch                         	      	  " Highlight Searches
set wildmenu                        	 	  " Get Tab Autocomplete
let mapleader = " "                               " Sets Space Bar as Leader
let g:loaded_matchparen = 1   	                  " Do not Highlight Brackets   
set backspace=indent,eol,start      	          " Backspace Works Normally
set ignorecase					  " Search is not Case Sensitive
set smartcase					  " Search is not Case Sensitive
set noimd					  " No In built graphing
set noswapfile					  " No Swap Files
set noimcmdline					  " Disable In built Graph
set clipboard=unnamedplus           		  " Use System Clipboard for Copy and Paste
filetype off                        	 	  " Don't Look at the File
syntax on                           	 	  " Set Syntax as On 
"----------------------------------------------------------------------------------------------------------	         
source $HOME/.vconfs
source $HOME/.vimfs

"Keybingings
inoremap <Insert> <Esc>              		

"Save & Quit
nnoremap <F12> :wq!<CR>
inoremap <F12> <Esc>:wq!<CR>
vnoremap <F12> <Esc>:wq!<CR>

"Quit Without Saving
nnoremap <F10> :q!<CR>
inoremap <F10> <Esc>:q!<CR>
vnoremap <F10> <Esc>:q!<CR>

"Functional Backspace
nnoremap <BS> d
vnoremap <BS> d


"Control + C && Control + V to Copy and Paste
vnoremap <C-c> "+yi
nnoremap <C-v> "+gPi
vnoremap <C-v> "+Pi
inoremap <C-v> <Esc>"+gPi

"Control + A to select All
nnoremap <C-a> ggVG
inoremap <C-a> <Esc>ggVG
vnoremap <C-a> ggVG


"Control + Q to Save and Quit 
inoremap <C-q> <Esc>:wq!<CR>	            
nnoremap <C-q> :wq!<CR>		           

"Control + Z for Undo
nnoremap <C-z> :undo<CR>
inoremap <C-z> <C-o>:undo<CR>
vnoremap <C-z> <Esc>:undo<CR>

"Control + K to deletea line
nnoremap <C-k> ddi0i
vnoremap <C-k> d<Esc>0i
inoremap <C-k> <Esc>dd0i

"Control + SpaceBar to Quit without Saving
 inoremap <C-Space> <Esc>:q!<CR>
nnoremap <C-Space> :q!<CR>	         	
vnoremap <C-Space> <Esc>:q!<CR>

"Control + Left Arrow to go to EOF
nnoremap <C-Left> ggi
inoremap <C-Left> <Esc>ggi
vnoremap <C-Left> <Esc>gg
	         	         
"Control + Right Arrow to go to BOF
inoremap <C-Right> <Esc>Gi
nnoremap <C-Right> Gi
vnoremap <C-Right> <Esc>Gi
	         
"Control + F to Find 
nnoremap <C-f> :call Lines()<CR>
inoremap <C-f> <Esc>:call Lines()<CR>
vnoremap <C-f> <Esc>:call Lines()<CR>

"Control + L to Find and Replace
nnoremap <C-l> :call Replace()<CR>
inoremap <C-l> <Esc>:call Replace()<CR>
vnoremap <C-l> <Esc>:call Replace()<CR>

"Control + X to Cut
vnoremap <C-x> "+d
nnoremap <C-x> "+dd
inoremap <C-x> <Esc>"+ddi





