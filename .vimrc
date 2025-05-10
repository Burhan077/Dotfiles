autocmd VimEnter * startinsert      		  " Always Open In Insert Mode
set number                          		  " Show Line Number in Vim
set laststatus=2                    		  " Always Have a Status Bar at the Bottom
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

"Keybingings
"inoremap <Insert> <Esc>              		  " Insert Key to escape to Normal Mode

"Save & Quit
nnoremap <F12> :wq<CR>                            " F12 Key to Save and Quit in Normal Mode
inoremap <F12> <Esc>:wq<CR>	                  " F12 Key To Save and  Quit in Insert mode
vnoremap <F12> <Esc>:wq<CR>                       " F12 Key to Save and Quit in Visual mode

"Quit Without Saving
nnoremap <F10> :q!<CR>                            " F10 Key to Quit without saving in Normal Mode
inoremap <F10> <Esc>:q!<CR>	                  " F10 Key to Quit without saving in Insert Mode
vnoremap <F10> <Esc>:q!<CR>                       " F10 Key to Quit without Saving in Visual mode

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

"Quit Without Saving
nnoremap <C-w> :q!<CR>                           
inoremap <C-w> <Esc>:q!<CR>	                  
vnoremap <C-w> <Esc>:q!<CR> 

"Control + X for Undo
inoremap <C-x> <Esc>:normal! u<CR>i       
nnoremap <C-x> u		       
vnoremap <C-x> u		     

"Control + K to deleta a line
nnoremap <C-k> ddi0
vnoremap <C-k> d<Esc>0i
inoremap <C-k> <Esc>ddi<Esc>0i

"Control + F to Search
inoremap <C-f> <Esc>/				
nnoremap <C-f> /			
vnoremap <C-f> /		

 

            






