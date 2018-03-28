yum -y install ImageMagick ghostscript git tesseract leptonica java

cd /usr/local/src

wget https://download1.rpmfusion.org/free/el/rpmfusion-free-release-7.noarch.rpm
rpm -ivh rpmfusion-free-release-7.noarch.rpm
yum -y install ffmpeg

#
# ffmpeg2theora
#
wget -N -P /usr/local/src http://v2v.cc/~j/ffmpeg2theora/ffmpeg2theora-0.29.linux64.bin
install -m 755 /usr/local/src/ffmpeg2theora-0.29.linux64.bin /usr/local/bin/ffmpeg2theora

#
## Dependancy software installation of fits.sh
#
wget -N -P /usr/local/src https://projects.iq.harvard.edu/files/fits/files/fits-latest.zip
unzip fits-latest.zip
mv fits-*.*.*/ /usr/local/
cd /usr/local/fits-*.*.*/

# link fits.sh 
ln -s /usr/local/fits-1.2.0/fits.sh /usr/local/bin/fits.sh
