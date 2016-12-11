#!/bin/bash
# Author: Jose Goncalves
# Description: Script used to install gnu-octave under MacOSX-Sierra
# ------------------------------
tput setaf 1 && tput bold
echo "+[ OCTAVE Install ]+------------------------------+"
tput sgr0

## Install Dependencies 
tput setaf 2 && tput bold
echo ">> [Octave Installer] $(tput setaf 3)- Install some dependencies :"
tput sgr0

# Install Command line tools :
tput setaf 2 && tput bold
echo "> [Octave Installer] $(tput setaf 3)- Get command line tools for MacOS X :"
tput sgr0
xcode-select --install

# Install XQuartz
tput setaf 2 && tput bold
echo "> [Octave Installer] $(tput setaf 3)- Attach XQuartz DMG File :"
tput sgr0
sudo hdiutil attach XQuartz.dmg

tput setaf 2 && tput bold
echo "> [Octave Installer] $(tput setaf 3)- Installing XQuartz Package :"
tput sgr0
sudo installer -package /Volumes/XQuartz-2.7.11/XQuartz.pkg

tput setaf 2 && tput bold
echo "> [Octave Installer] $(tput setaf 3)- Unmount XQuartz DMG File :"
tput sgr0
sudo hdiutil detach /Volumes/XQuartz-2.7.11

# Install Homebrew :
tput setaf 2 && tput bold

echo "> [Octave Installer] $(tput setaf 3)- Get Homebrew :"
tput sgr0
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Checking brew install 
brew doctor

tput setaf 2 && tput bold
echo ">> [Octave Installer] $(tput setaf 3)- Install GNU Octave :"
tput sgr0

# tap the science formulae
tput setaf 2 && tput bold
echo "> [Octave Installer] $(tput setaf 3)- Tap to the science formulae :"
tput sgr0
brew tap homebrew/science

# install some Octave dependencies
tput setaf 2 && tput bold
echo "> [Octave Installer] $(tput setaf 3)- Doing some brew update that could take a while :" 
tput sgr0
brew update && brew upgrade

# install octave
tput setaf 2 && tput bold
echo "> [Octave Installer] $(tput setaf 3)- Installing octave via Brew :"
tput sgr0
brew install octave

# install fltk for gnuplot
tput setaf 2 && tput bold
echo "> [Octave Installer] $(tput setaf 3)- Installing fltk for gnuplot :"
tput sgr0
brew install fltk

# install gnuplot
tput setaf 2 && tput bold
echo "> [Octave Installer] $(tput setaf 3)- Installing gnuplot :"
tput sgr0
brew install gnuplot

# Add octaverc file
tput setaf 2 && tput bold
echo "> [Octave Installer] $(tput setaf 3)- Create your .octaverc file to get gnuplot to play nicely with octave :"
tput sgr0
echo "setenv ('GNUTERM', 'X11')
# below is optional; changes the prompt to two chevron
# and gets rid of the long Octave x.x.x >> prompt 
PS1('>> ')" | tee -a ~/octaverc

tput setaf 2 && tput bold
echo "> [Octave Installer] $(tput setaf 3)- Octave install finished!"
echo "$(tput setaf 1)+[ OCTAVE Install ]                           $(tput setaf 7)[$(tput setaf 2)OK$(tput setaf 7)]$(tput setaf 1)+"

tput sgr0
exit 0;
