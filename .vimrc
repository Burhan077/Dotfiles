autocmd VimEnter * startinsert     		  " Always Open In Insert Mode
set number                          		  " Show Line Number in Vim
set laststatus=2                   		  " Always Have a Status Bar at the Bottom
set nocompatible                    		  " Set Compatibility to Vim not Vi
set wrap                            		  " Wrap Text
set mouse=a                         		  " Include Mouse Support 
set hlsearch                        	       	  " Highlight Searches
set wildmenu                        	 	  " Get Tab Autocomplete
set backspace=indent,eol,start      	          " Backspace Works Normally
set ignorecase					  " Search is not Case Sensitive
set smartcase					  " Search is not Case Sensitive
set noimd					  " No In built graphing
set noimcmdline					  " Disable In built Graph
set clipboard=unnamedplus           		  " Use System Clipboard for Copy and Paste
filetype off                        	 	  " Don't Look at the File
syntax on                           	 	  " Set Syntax as On 

"Keybinds


"Functional Backspace
nnoremap <BS> d                                   " In Normal Mode
vnoremap <BS> d                                   " In Visual Mode


"Control + C && Control + V to Copy and Paste
vnoremap <C-c> "+y		            
nnoremap <C-v> "+gP		   	
vnoremap <C-v> "+P		          
inoremap <C-v> <Esc>"+gPi	         

"Control + A to select All
nnoremap <C-a> ggVG		       
inoremap <C-a> <Esc>ggVGi	     
vnoremap <C-a> ggVG		 


"Control + Q to Save and Quit 
inoremap <C-q> <Esc>:wq<CR>	            
nnoremap <C-q> :wq<CR>		           

"Control + X for Undo
"inoremap <C-x> <Esc>:normal! u<CR>0i       
inoremap <C-x> <Esc>u0i
nnoremap <C-x> u0
vnoremap <C-x> <Esc>u0



"Control + K to deleta a line
nnoremap <C-k> ddi0
vnoremap <C-k> d<Esc>0i
inoremap <C-k> <Esc>ddi<Esc>0i

"Control + F to Search
inoremap <C-f> <Esc>/
nnoremap <C-f> /
vnoremap <C-f> <Esc>/


"Alt + L to Quit without Saving
nnoremap <M-l> :q!<CR>
inoremap <M-l> <Esc>:q!<CR>
vnoremap <M-l> <Esc>:q!<CR>
	         

