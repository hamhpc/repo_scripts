#yum -y install gcc
#yum -y install gcc-c++
#yum -y install autoconf
#yum -y install java-1.6.0-openjdk.x86_64
#yum -y install ImageMagick
yum -y install ghostscript
#yum -y install ant
yum -y install git
yum -y install tesseract
yum -y install leptonica

#
# ffmpeg2theora
#
wget -N -P /usr/local/src http://v2v.cc/~j/ffmpeg2theora/ffmpeg2theora-0.29.linux64.bin
install -m 755 /usr/local/src/ffmpeg2theora-0.29.linux64.bin /usr/bin/ffmpeg2theora

# link fits.sh 
ln -s $ISLANDORA_HOME/packages/fits-0.6.2/fits.sh $ISLANDORA_HOME/bin/fits.sh
