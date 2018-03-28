#yum -y install gcc
#yum -y install gcc-c++
#yum -y install autoconf
#yum -y install java-1.6.0-openjdk.x86_64
#yum -y install ImageMagick
yum -y install ghostscript
#yum -y install ant
yum -y install git

#
# ffmpeg2theora
#
wget -N -P /usr/local/src http://v2v.cc/~j/ffmpeg2theora/ffmpeg2theora-0.29.linux64.bin
install -m 755 /usr/local/src/ffmpeg2theora-0.29.linux64.bin /usr/bin/ffmpeg2theora

#
# Needed for tesseract to find leptonica
#
export LIBLEPT_HEADERSDIR=/opt/islandora/packages/leptonica-1.69/include

for PKG in `ls ../etc/packages | grep .package`
do
	#. $PKG
	. ../etc/packages/$PKG
	wget -N -P $SRC_DIR $PACKAGE_URL
	cd $SRC_DIR
	$PACKAGE_UNCOMPRESS $PACKAGE_TARFILE
	cd $PACKAGE_DIR_UNCOMPRESSED
	./configure --prefix=$ISLANDORA_PKGS/$PACKAGE_NAME-$PACKAGE_VERSION $EXTRA_CONFIGURE_ARGS
	make
	make install
	cd $ISLANDORA_PKGS/$PACKAGE_NAME-$PACKAGE_VERSION
	../../sbin/create_package_makefile.sh
	make install
	cd $SRC_DIR
done

# link fits.sh 
ln -s $ISLANDORA_HOME/packages/fits-0.6.2/fits.sh $ISLANDORA_HOME/bin/fits.sh
