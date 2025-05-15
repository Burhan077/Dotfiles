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
	         


"Keybingings
inoremap <Insert> <Esc>              		  " Insert Key to escape to Normal Mode

"Save & Quit
nnoremap <F12> :wq<CR>                            " F12 Key to Save and Quit in Normal Mode
inoremap <F12> <Esc>:wq<CR>	                  " F12 Key To Save and  Quit in Insert mode
vnoremap <F12> <Esc>:wq<CR>                       " F12 Key to Save and Quit in Visual mode

"Quit Without Saving
nnoremap <F10> :q!<CR>                            " F10 Key to Quit without saving in Normal Mode
inoremap <F10> <Esc>:q!<CR>	                  " F10 Key to Quit without saving in Insert Mode
vnoremap <F10> <Esc>:q!<CR>                       " F10 Key to Quit without Saving in Visual mode

"Functional Backspace
nnoremap <BS> d                                   
vnoremap <BS> d                                   


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

"Control + Z for Undo
"inoremap <C-z> <Esc>:normal! u<CR>0i       
inoremap <C-z> <Esc>u0i
vnoremap <C-z> u0
vnoremap <C-z> <Esc>u0

"Control + K to deleta a line
nnoremap <C-k> ddi0
vnoremap <C-k> d<Esc>0i
inoremap <C-k> <Esc>ddi<Esc>0i

"Control + F to Search
inoremap <C-f> <Esc>/
nnoremap <C-f> /
vnoremap <C-f> <Esc>/

"Control + SpaceBar to Quit without Saving
inoremap <C-Space> <Esc>:q!<CR>
nnoremap <C-Space> :q!<CR>	         	
vnoremap <C-Space> <Esc>:q!<CR>

"Control + Left Arrow to go to EOF
nnoremap <C-Left> ggi
inoremap <C-Left> <Esc>ggi
vnoremap <C-Left> <Esc>gg
	         	         
"Control + Right Arrow to go to SOF
inoremap <C-Right> <Esc>Gi
nnoremap <C-Right> Gi
vnoremap <C-Right> <Esc>Gi
	         
	         

	         
