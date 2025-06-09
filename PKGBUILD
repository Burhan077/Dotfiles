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
  libx11 libxt
)
source=(
  "git+https://github.com/vim/vim.git?signed#tag=v${pkgver}"
  "vimrc"
  "archlinux.vim"
  "vimdoc.hook"
)
sha256sums=(
  '2c0efe63b64966a6b5f7476f4e59817a4b338bc20edb57f2cbaf132519f93bbe'
  'b16e85e457397ab2043a7ee0a3c84307c6b4eac157fd0b721694761f25b3ed5b'
  'cc3d931129854c298eb22e993ec14c2ad86cc1e70a08a64496f5e06559289972'
  '8e9656934d9d7793063230d15a689e10455e6db9b9fe73afa0f294792795d8ae'
)
validpgpkeys=('4F19708816918E19AAE19DEEF3F92DA383FDDE09') # Bram Moolenaar

prepare() {
  cd "${srcdir}/vim/src"
  sed -E -i 's|^.*(#define SYS_.*VIMRC_FILE.*").*$|\1|g' feature.h
  sed -E -i 's|^.*(#define VIMRC_FILE.*").*$|\1|g' feature.h
  autoconf

  cd "${srcdir}"
  cp -a vim vim-build
}

build() {
  cd "${srcdir}/vim-build"

  ./configure \
    --prefix=/usr \
    --localstatedir=/var/lib/vim \
    --with-features=huge \
    --with-compiledby='Arch Linux' \
    --enable-gpm \
    --enable-acl \
    --with-x=yes \
    --enable-gui=auto \
    --enable-clipboard \
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
  cd "${srcdir}/vim-build"
  TERM=xterm make -j1 test
}

package_vim-runtime() {
  pkgdesc+=' (shared runtime)'
  optdepends=(
    'sh: support for some tools and macros'
    'python: demoserver example tool'
    'gawk: mve tool support'
  )
  backup=('etc/vimrc')

  cd "${srcdir}/vim-build"

  make -j1 VIMRCLOC=/etc DESTDIR="${pkgdir}" install

  # Remove binaries and manpages (runtime-only)
  rm -r "${pkgdir}/usr/bin" "${pkgdir}/usr/share/man"

  # Add extra dict
  install -Dm644 runtime/ftplugin/logtalk.dict \
    "${pkgdir}/usr/share/vim/vim${_versiondir}/ftplugin/logtalk.dict"

  # Add Arch-specific configs
  install -Dm644 "${srcdir}/vimrc" "${pkgdir}/etc/vimrc"
  install -Dm644 "${srcdir}/archlinux.vim" \
    "${pkgdir}/usr/share/vim/vimfiles/archlinux.vim"

  # Clean junk
  rm -r "${pkgdir}/usr/share/"{applications,icons}

  # License
  install -dm755 "${pkgdir}/usr/share/licenses/vim-runtime"
  ln -s "/usr/share/vim/vim${_versiondir}/doc/uganda.txt" \
    "${pkgdir}/usr/share/licenses/vim-runtime/license.txt"
}

package_vim() {
  depends=("vim-runtime=${pkgver}-${pkgrel}" 'gpm' 'acl' 'glibc' 'libgcrypt' 'zlib' 'libx11' 'libxt')
  optdepends=('python' 'ruby' 'lua' 'perl' 'tcl' 'xclip: clipboard support under X11' 'wl-clipboard: clipboard support under Wayland')
  conflicts=('gvim' 'vim-minimal')
  provides=('xxd' 'vim-minimal' 'vim-plugin-runtime')
  replaces=('vim-minimal')

  cd "${srcdir}/vim-build"

  make -j1 VIMRCLOC=/etc DESTDIR="${pkgdir}" install

  # Remove unnecessary binaries
  rm "${pkgdir}/usr/bin/"{ex,view}

  # Remove man pages for removed binaries
  find "${pkgdir}/usr/share/man" -type d -name 'man1' 2>/dev/null | while read -r _mandir; do
    cd "${_mandir}" || continue
    rm -f ex.1 view.1 evim.1
  done

  # Remove runtime folder — provided by vim-runtime
  rm -r "${pkgdir}/usr/share/vim"

  # License
  install -Dm644 runtime/doc/uganda.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"

  # ALPM hook
  install -Dm644 "${srcdir}/vimdoc.hook" \
    "${pkgdir}/usr/share/libalpm/hooks/vimdoc.hook"
}

# vim: ts=2 sw=2 et:
