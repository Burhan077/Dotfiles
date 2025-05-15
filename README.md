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
Delete everything and paste this in

        # Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
        # Contributors trimmed for brevity

        pkgbase=vim
        pkgname=('vim' 'vim-runtime')
        pkgver=9.1.1362
        _versiondir=91
        pkgrel=1
        pkgdesc='Vi Improved, a highly configurable, improved version of the vi text editor'
        url='https://www.vim.org'
        arch=('x86_64')
        license=('custom:vim')
        makedepends=(
          gawk git glibc gpm libgcrypt lua perl python ruby tcl zlib
        )
        source=(git+https://github.com/vim/vim.git?signed#tag=v${pkgver}
        vimrc
        archlinux.vim
        vimdoc.hook)
        sha256sums=('2c0efe63b64966a6b5f7476f4e59817a4b338bc20edb57f2cbaf132519f93bbe'
            'b16e85e457397ab2043a7ee0a3c84307c6b4eac157fd0b721694761f25b3ed5b'
            'cc3d931129854c298eb22e993ec14c2ad86cc1e70a08a64496f5e06559289972'
            '8e9656934d9d7793063230d15a689e10455e6db9b9fe73afa0f294792795d8ae')
        validpgpkeys=('4F19708816918E19AAE19DEEF3F92DA383FDDE09')

        prepare() {
          cd vim/src
          sed -E 's|^.*(#define SYS_.*VIMRC_FILE.*").*$|\1|g' -i feature.h
          sed -E 's|^.*(#define VIMRC_FILE.*").*$|\1|g' -i feature.h
          autoconf
          cd ../..
          cp -a vim vim-build
        }

        build() {
          cd vim-build
          ./configure \
            --prefix=/usr \
            --localstatedir=/var/lib/vim \
            --with-features=huge \
            --with-compiledby='Arch Linux' \
            --enable-gpm \
            --enable-acl \
            --with-x=yes \
            --enable-gui=none \
            --enable-multibyte \
            --enable-cscope \
            --enable-netbeans \
            --enable-perlinterp=dynamic \
            --enable-python3interp=dynamic \
            --enable-rubyinterp=dynamic \
            --enable-luainterp=dynamic \
            --enable-tclinterp=dynamic \
            --disable-canberra
          make
        }

        check() {
          cd vim-build
          TERM=xterm make -j1 test
        }

        package_vim-runtime() {
          pkgdesc+=' (shared runtime)'
          optdepends=('sh: support for some tools and macros'
                      'python: demoserver example tool'
                      'gawk: mve tool support')
          backup=('etc/vimrc')

          cd vim-build
          make -j1 VIMRCLOC=/etc DESTDIR="${pkgdir}" install
          rm -r "${pkgdir}/usr/share/man/" "${pkgdir}/usr/bin/"

          install -Dm644 runtime/ftplugin/logtalk.dict \
            "${pkgdir}/usr/share/vim/vim${_versiondir}/ftplugin/logtalk.dict"

          install -Dm644 "${srcdir}/vimrc" "${pkgdir}/etc/vimrc"
          install -Dm644 "${srcdir}/archlinux.vim" \
            "${pkgdir}/usr/share/vim/vimfiles/archlinux.vim"

          rm -r "${pkgdir}/usr/share/{applications,icons}"

          install -dm755 "${pkgdir}/usr/share/licenses/vim-runtime"
          ln -s /usr/share/vim/vim${_versiondir}/doc/uganda.txt \
            "${pkgdir}/usr/share/licenses/vim-runtime/license.txt"
        }

        package_vim() {
          depends=("vim-runtime=${pkgver}-${pkgrel}" 'gpm' 'acl' 'glibc' 'libgcrypt' 'zlib')
          optdepends=('python' 'ruby' 'lua' 'perl' 'tcl')
          conflicts=('gvim' 'vim-minimal')
          provides=('xxd' 'vim-minimal' 'vim-plugin-runtime')
          replaces=('vim-minimal')

          cd vim-build
          make -j1 VIMRCLOC=/etc DESTDIR="${pkgdir}" install

          rm "${pkgdir}/usr/bin/{ex,view}"

          find "${pkgdir}/usr/share/man" -type d -name 'man1' 2>/dev/null | \
            while read _mandir; do
            cd "${_mandir}"
            rm -f ex.1 view.1 evim.1
          done

          rm -r "${pkgdir}/usr/share/vim"
          install -Dm644 runtime/doc/uganda.txt \
            "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"

          install -Dm644 "${srcdir}/vimdoc.hook" "${pkgdir}/usr/share/libalpm/hooks/vimdoc.hook"
        }

        # vim: ts=2 sw=2 et:

Then run this

        makepkg -si
        
The Build will take around 15 to 20 Minutes depending on your CPU. 
To confirm that you have clipboard support paste this in your terminal

        vim --version | grep clipboard
        
You should see something like this:

        +clipboard       +xterm_clipboard
        
Move the .vimrc to your Home Directory and now you have yourself Vim with some SANE keybinds.
The Keybinds are as Follows:

        Ctrl Q to Save    --If you are Normal
        Ctrl + Space to Quit   -I just wanted this
        
Older Keybinds like :wq and :q! still work here if you liked them

        Ctrl + C to Copy
        Ctrl + V to Paste
        Ctrl + F  to Find 
        Ctrl + A to Select All
        Ctrl + Z to Undo 
        Ctrl + K to delete a line 
       
        
And There You have it a beginner-friendly working vim that you built yourself.
To add plugins do this

        curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

Then download or clone the .vconf and .vimrc files
Enter command mode and type 

        :PlugInstall

Then quit vim and reopen it




