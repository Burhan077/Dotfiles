The files above are Z Shell Config Files 
You Need Git installed to work with these configs
Type this in your Terminal 

        sudo pacman -S --needed base-devel git 
        sudo pacman -S zsh
        
.P10K.ZSH      --These are Prompt Configs
.ZSHRC        --This is the main Z shell Config File
.ZSH_ALIASES  --These are aliases of commonly used commands and some such as journalctl and dmesg are not so often used


For these configs to work smoothly, you should first have the following:
1. Z shell Should be installed.
2. Z shell Should be your default shell.  -Not a Must but it should be your default so the config files can be used
3. Your user should be in the Sudo and wheel groups
4. Do the following in your Terminal Emulator:

        sudo visudo
   
To the bottom of this file add:

        <your-username-here!> ALL=(ALL:ALL) NOPASSWD: ALL
        
After Cloning the repo move the .p10k.zsh , .zshrc and .zsh_aliases to your home folder
And Voila when you open your Terminal the requirements will be downloaded --This should take somewhere between 2 and 3 Minutes depending on your Internet connection
Now you have a blazing fast shell![250510_11h03m34s_screenshot](https://github.com/user-attachments/assets/363efbc5-a786-47c1-bb02-4be9170230e9)
![250510_11h02m35s_screenshot](https://github.com/user-attachments/assets/e52f6a88-6548-4b7b-b600-d48bcbe5d941)
For the .vimrc file you need to do the following 

        git clone https://aur.archlinux.org/cgit/aur.git/diff/vim.git
        cd vim
        nano PKGBUILD
Find the line -- 

        --with-x=no \
Change it to 

         --with-x=yes \
Then run 

        makepkg -si
        
The Build will take around 15 to 20 Minutes depending on your CPU. 
To confirm that you have clipboard support paste this in your terminal

        vim --version | grep clipboard
        
You should see something like this:

        +clipboard       +xterm_clipboard
        
Move the .vimrc to your Home Directory and now you have yourself Vim with some SANE keybinds.
The Keybinds are as Follows:

        Ctrl Q to Save    --If you are Normal
        Alt + L to Quit   -I just wanted this
        
Older Keybinds like :wq and :q! still work here if you liked them

        Ctrl + C to Copy
        Ctrl + V to Paste
        Ctrl + F  to Find --If you liked Nano 
        Ctrl + A to Select All
        Ctrl + X to Undo ----I couldn't get Ctrl + Z to work 
        Ctrl + K to delete a line 
        Alt + L to Quit without Saving 
        
And There You have it a beginner-friendly working vim that you built yourself.



