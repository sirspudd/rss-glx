#!/usr/bin/env bash

. /etc/makepkg.conf

CARCH="x86_64"

[ "$CARCH" = "x86_64" ] && (sed -i -e 's|@LIBS@|@LIBS@ -fopenmp|g' src/Makefile.in)

PKG_CONFIG_PATH="/usr/lib/imagemagick6/pkgconfig" \
./configure --prefix=/usr \
  --mandir=/usr/share/man \
  --program-transform-name='s/plasma/plasma_rss/' \
  --with-configdir=/usr/share/xscreensaver/config \
  --with-kdessconfigdir=/usr/share/applnk/System/ScreenSavers \
  --enable-shared=yes --enable-static=no
make CFLAGS="$CFLAGS -I/usr/include/ImageMagick"
