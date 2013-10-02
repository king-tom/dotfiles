set -e
# Install curl
sudo apt-get install curl
# Install dev tools.
sudo apt-get install xsel
sudo apt-get install git
sudo apt-get install vim
sudo apt-get install libmysqlclient-dev  # Needed for powerline.
sudo apt-get install python-dev
sudo apt-get install python-pip
sudo easy_install powerline
# Install Google chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb