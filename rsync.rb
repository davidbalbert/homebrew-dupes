require 'formula'

class Rsync < Formula
  homepage 'http://rsync.samba.org/'
  url 'http://rsync.samba.org/ftp/rsync/src/rsync-3.0.9.tar.gz'
  md5 '5ee72266fe2c1822333c407e1761b92b'

  depends_on :autoconf

  def patches
    %W[
      http://gitweb.samba.org/?p=rsync-patches.git;a=blob_plain;hb=v3.0.9;f=fileflags.diff
      http://gitweb.samba.org/?p=rsync-patches.git;a=blob_plain;hb=v3.0.9;f=crtimes.diff
      http://gitweb.samba.org/?p=rsync-patches.git;a=blob_plain;hb=v3.0.9;f=hfs-compression.diff
    ]
  end

  def install
    system "./prepare-source"
    system "./configure", "--disable-debug",
                          "--prefix=#{prefix}",
                          "--with-rsyncd-conf=#{etc}/rsyncd.conf",
                          "--enable-ipv6"
    system "make"
    system "make install"
  end
end
