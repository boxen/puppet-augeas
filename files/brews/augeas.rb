require 'formula'

class Augeas < Formula
  url 'http://download.augeas.net/augeas-1.2.0.tar.gz'
  homepage 'http://augeas.net'
  sha1 'ab63548ae5462d7b3dc90e74311b8e566ba22485'
  version '1.2.0-boxen2'

  depends_on 'pkg-config' => :build

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"

    # libfa example program doesn't compile cleanly on OSX, so skip it
    inreplace 'Makefile' do |s|
      s.change_make_var! "SUBDIRS", "gnulib/lib src gnulib/tests tests man doc"
    end

    system "make install"
  end

  def caveats; <<-EOS.undent
    Lenses have been installed to:
      #{HOMEBREW_PREFIX}/share/augeas/lenses/dist
    EOS
  end
end
