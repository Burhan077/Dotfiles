# Maintainer: Me lol ;)
pkgname=vim
pkgver=9.1.1623
_versiondir=91
pkgrel=1
pkgdesc='Vi Improved, console version with system clipboard support'
url='https://www.vim.org'
arch=('x86_64')
license=('custom:vim')
depends=('gpm' 'acl' 'glibc' 'libgcrypt' 'zlib' 'libxt' 'libx11')
makedepends=('gawk' 'git' 'autoconf' 'perl' 'python' 'ruby' 'tcl' 'lua' 'zlib')
source=(git+https://github.com/vim/vim.git?signed#tag=v${pkgver}
        vimrc
        archlinux.vim
        vimdoc.hook)
sha256sums=('1d2d5cdbd1dec65e579a5d05e562e70cd372ffc3357a283a21b4ec472b4e59ee'
            'b16e85e457397ab2043a7ee0a3c84307c6b4eac157fd0b721694761f25b3ed5b'
            'cc3d931129854c298eb22e993ec14c2ad86cc1e70a08a64496f5e06559289972'
            '8e9656934d9d7793063230d15a689e10455e6db9b9fe73afa0f294792795d8ae')
validpgpkeys=('4F19708816918E19AAE19DEEF3F92DA383FDDE09') # Christian Brabandt <cb@256bit.org>

prepare() {
  cd vim/src
  # define the place for the global (g)vimrc file (set to /etc/vimrc)
  sed -E 's|^.*(#define SYS_.*VIMRC_FILE.*").*$|\1|g' -i feature.h
  sed -E 's|^.*(#define VIMRC_FILE.*").*$|\1|g' -i feature.h
  autoconf
}

build() {
  cd vim
  ./configure \
    --prefix=/usr \
    --localstatedir=/var/lib/vim \
    --with-features=huge \
    --with-compiledby='Arch Linux (custom)' \
    --enable-gpm \
    --enable-acl \
    --with-x=yes \
    --enable-clipboard \
    --enable-multibyte \
    --enable-cscope \
    --enable-netbeans \
    --enable-perlinterp=dynamic \
    --enable-python3interp=dynamic \
    --enable-rubyinterp=dynamic \
    --enable-luainterp=dynamic \
    --enable-tclinterp=dynamic \
    --disable-canberra \
    --disable-gui
  make
}

check() {
  cd vim
  TERM=xterm make -j1 test
}

package() {
  depends=('gpm' 'acl' 'glibc' 'libgcrypt' 'zlib' 'libxt' 'libx11')
  optdepends=('python: Python language support'
              'ruby: Ruby language support'
              'lua: Lua language support'
              'perl: Perl language support'
              'tcl: Tcl language support'
              'xclip: X11 clipboard support'
              'wl-clipboard: Wayland clipboard support')
  provides=('xxd' 'vim-minimal' 'vim-plugin-runtime')
  conflicts=('gvim' 'vim-minimal')
  replaces=('vim-minimal')

  cd vim
  make -j1 VIMRCLOC=/etc DESTDIR="${pkgdir}" install

  # Remove binaries provided by (n)vi
  rm "${pkgdir}"/usr/bin/{ex,view}

  # Delete manpages that clash
  find "${pkgdir}"/usr/share/man -type f \( -name ex.1 -o -name view.1 -o -name evim.1 \) -delete

  # License
  install -Dm 644 runtime/doc/uganda.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/license.txt

  # Pacman hook for helptags
  install -Dm 644 "${srcdir}"/vimdoc.hook \
    "${pkgdir}"/usr/share/libalpm/hooks/vimdoc.hook
}
