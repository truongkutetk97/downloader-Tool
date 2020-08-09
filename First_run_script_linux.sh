echo "Use Root"
#sudo -s

#echo "Edit rc.local"
#cp rc.local /etc/
#chmod 755 /etc/init.d/rc.local
#chmod 755 /etc/rc.local
#sudo systemctl enable rc-local.service

echo "Updating system..."
sudo apt-get update -y --fix-missing
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y

echo "Install Unikey"
apt-get install ibus-unikey -y
ibus restart

echo "Install Galculator git aptitude"
sudo apt-get install galculator git aptitude -y

sudo apt-get install gcc g++ valgrind -y
sudo apt-get install pv xz-utils gparted p7zip-full libncurses5 curl -y
sudo apt-get install libssl-dev dislocker curl clang p7zip-full p7zip-rar -y

sudo apt-get install clang llvm -y
sudo apt-get install -y libblas3 libblas-dev liblapack3 liblapack-dev
sudo apt-get install -y libopenblas-base libopenblas-dev
sudo apt-get install -y ssh
sudo apt-get install -y libeigen3-dev
sudo apt-get install -y gphoto2
sudo apt-get install -y libncursesw5-dev git libncurses5-dev
sudo apt-get install -y testdisk
sudo apt-get install -y catkin
sudo apt-get install -y ros-base-dev ros-core-dev
sudo apt-get install -y libboost-all-dev
sudo apt-get install -y libgtk2.0-dev pkg-config
sudo apt-get install -y python-numpy python-dev
sudo apt-get install -y python-dev python-pip python3-dev python3-pip
sudo apt-get install -y libavcodec-dev libavformat-dev libswscale-dev
sudo apt-get install -y libtiff5-dev libdlib-dev
sudo apt-get install -y qt5-qmake cmake-qt-gui
sudo apt-get install -y gstreamer1.0-libav gstreamer1.0-nice
sudo apt-get install -y libtbb-dev libdlib-dev
sudo apt-get install -y libopencv-dev
sudo apt-get install -y libgstreamer1.0-0 libgstreamer1.0-dev
sudo apt-get install -y libgstreamer-plugins-base1.0-0 libgstreamer-plugins-base1.0-dev
sudo apt-get install -y checkinstall
sudo apt-get install -y yasm libdc1394-22-dev libxine2
sudo apt-get install -y libv4l-dev libtbb-dev libqt4-dev
sudo apt-get install -y libmp3lame-dev libtheora-dev libvorbis-dev
sudo apt-get install -y libopencore-amrnb-dev libopencore-amrwb-dev
sudo apt-get install -y libxvidcore-dev v4l-utils
sudo apt-get install -y x264 libx264-dev 265 libx265-dev
sudo apt-get install -y tesseract-ocr libtesseract-dev libleptonica-dev
sudo apt-get install -y zlibc libtbb2 libpng-dev libtiff-dev
sudo apt-get install -y libgtk-3-dev
sudo apt-get install -y libatlas-base-dev gfortran
sudo apt-get install -y qt5-default libgtk2.0-dev libtbb-dev
sudo apt-get install -y libfaac-dev libmp3lame-dev libtheora-dev
sudo apt-get install -y libjpeg8-dev libjpeg-dev libpng++-dev
sudo apt-get install -y libxine2-dev 
sudo apt-get install -y gdb python3-dbg
sudo apt-get install -y stardict

sudo apt-get install -y build-essential checkinstall
sudo apt-get install -y libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev
sudo apt-get install -y libusb-1.0-0 libusb-1.0-0-dev 

sudo apt-get install -y python-dev python-pip python3-dev python3-pip
sudo pip3 install numpy scipy matplotlib scikit-image scikit-learn ipython
sudo apt-get install -y python-pip && pip install --upgrade pip
sudo apt-get install -y net-tools

echo "Install ZeroMQ"
echo "deb http://download.opensuse.org/repositories/network:/messaging:/zeromq:/release-stable/Debian_9.0/ ./" >> /etc/apt/sources.list
wget https://download.opensuse.org/repositories/network:/messaging:/zeromq:/release-stable/Debian_9.0/Release.key -O- | sudo apt-key add
sudo apt-get install -y libzmq3-dev


echo "Install Media"
sudo apt-get install gpicview vlc pinta pv -y

echo "Install htop leafpad"
sudo apt-get install htop leafpad -y

#echo "Install Google Chrome"
#cd ~/Downloads
#wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#sudo apt-get install libgconf2-4 libnss3-1d libxss1
#sudo dpkg -i --force-depends google-chrome-stable_current_amd64.deb
#sudo apt-get install -f -y
#sudo rm google-chrome-stable_current_amd64.deb

#echo "Install Sublime Text 3"
#wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
#sudo apt-get install apt-transport-https
#echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
#sudo apt-get update
#sudo apt-get install sublime-text

echo "Install VPN"
sudo apt install vpnc network-manager-vpnc network-manager-vpnc-gnome -y

echo "Install Visual Studio Code"
wget https://az764295.vo.msecnd.net/stable/61122f88f0bf01e2ac16bdb9e1bc4571755f5bd8/code_1.30.2-1546901646_amd64.deb
sudo dpkg -i code_1.30.2-1546901646_amd64.deb
rm -rf code_1.30.2-1546901646_amd64.deb

###############################################################
echo "Add Repository..."
echo "Repository Grub-customizer"
sudo add-apt-repository ppa:danielrichter2007/grub-customizer -y

echo "cmake 3.5 ppa"
#sudo add-apt-repository ppa:george-edison55/cmake-3.x -y

#echo "Repository Skype"
#sudo add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner" -y
#sudo dpkg --add-architecture i386

echo "Add GoLang"
#sudo add-apt-repository ppa:longsleep/golang-backports -y
#sudo add-apt-repository ppa:gophers/archive -y

echo "Repository Kicad"
#sudo add-apt-repository --yes ppa:js-reynaud/kicad-4 -y

#echo "Repository Sublime-text"
#sudo apt-add-repository ppa:webupd8team/sublime-text-3 -y

echo "Repository Code::Block"
#sudo add-apt-repository ppa:damien-moore/codeblocks-stable -y

sudo apt install -y kazam

sudo apt-get update
###############################################################

sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt-get update
sudo apt-get install -y gcc-4.9 g++-4.9

sudo apt-get install -y gcc-5 g++-5

sudo apt-get install -y gcc-6 g++-6

sudo apt-get install -y gcc-7 g++-7

sudo apt-get install -y cmake


###############################################################

sudo apt-get install

echo "Install Grub-Custommizer"
#sudo apt-get update
sudo apt-get install grub-customizer -y


#echo "Install Skype"
#sudo apt-get update
#sudo apt-get install skype -y
#wget https://repo.skype.com/latest/skypeforlinux-64.deb
#sudo dpkg -i skypeforlinux-64.deb
#sudo apt install -f

#echo "Install Kicad"
#sudo apt-get update
#sudo apt-get install kicad -y

#echo "Install Sublime Text"
#sudo apt-get update
sudo apt-get install sublime-text-installer -y

#echo "Install Code::Block"
#sudo apt-get update
#sudo apt install codeblocks -y

#echo "Install GoLang"
#sudo apt-get install golang-1.10-go -y
#sudo apt-get install golang-go -y

################################################################
echo "Install arm-gcc"
################################################################


#echo "Removing something..."
#apt-get remove aisleriot  -y

echo "Complete upgrade"
apt-get upgrade -y
apt-get dist-upgrades -y
apt-get autoremove
apt-get clean

##############################################################
#echo "Install MAC WEBCAM"
#cd /usr/local/src
#git clone https://github.com/patjak/bcwc_pcie.git

#or copy folder to /usr/local/src
#cp -r bcwc_pcie /usr/local/src

#cd bcwc_pcie/firmware

sudo apt-get install curl

sudo make
sudo make install
cd ..
sudo make
sudo make install
sudo depmod
sudo modprobe -r bdc_pci
sudo modprobe facetimehd
cd ~/Downloads
echo "Done"
##############################################################

#echo "Install StarDict"
#cd Stardict
#Echo "This script install stardict..."
#apt-get install stardict -y
#tar -xvf dic.tar.gz
#rm -r /usr/share/stardict/
#cp -r dic/ /usr/share/stardict/
#rm -rf dic
#tar -xvf WyabdcRealPeopleTTS.tar.bz2
#cp -r WyabdcRealPeopleTTS /usr/share/
#rm -rf WyabdcRealPeopleTTS
cd ~/Downloads
echo "Done!"
##############################################################

echo "Install LLVM - Clang"
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
sudo apt-add-repository "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-6.0 main"
sudo apt-get update
sudo apt-get install -y clang-6.0

##############################################################

#echo "Install Dislocker"
#cd DisLocker
#sudo mkdir /media/bitlocker /media/mount

sudo apt-get install libfuse-dev -y
#aptitude install gcc cmake make libfuse-dev libpolarssl-dev ruby-dev -y
#aptitude install gcc cmake make libfuse-dev libmbedtls-dev ruby-dev -y

#git clone https://github.com/Aorimn/dislocker.git

#cd dislocker
#mkdir build
#cd build

#cmake ..
#make
#sudo make install

#cd ~/Downloads
#rm -rf dislocker
##############################################################
echo "Config GCC/G++"
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 10
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.9 10

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 10
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-5 10

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 10
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-6 10

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 10
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 10

sudo update-alternatives --install /usr/bin/cc cc /usr/bin/gcc 30
sudo update-alternatives --set cc /usr/bin/gcc

sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++ 30
sudo update-alternatives --set c++ /usr/bin/g++

sudo update-alternatives --config gcc
sudo update-alternatives --config g++

echo "Done!"
echo "Rebooting..."

reboot
