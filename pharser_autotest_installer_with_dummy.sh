#!/bin/bash

# Defining some font colors
DRED='\033[0;31m' # Red
LRED='\033[1;31m' # Light Red

DGREEN='\033[0;32m' # Green
LGREEN='\033[1;32m' # Light Green

NC='\033[0m' # No Color

user_dir='root'

echo "${LGREEN}Cleaning the screen before starting${NC}"
sleep 1
clear
echo "${LRED}Please, before proceeding, you must know that this script should be executed in the /root/ directory as the root user, to avoid permissions issues during tests.${NC}\n"

echo "You should have Internet connection, since some extra tools, scripts and dummy files are going to be installed\n"

echo "If you are using a Virtual Machine, be sure to properly configure the Bridge Adapter"
echo "\n\n\nThe command ${LGREEN}pwd${NC} has been typed to check the current directory"

echo "${LRED}"
pwd
echo "${NC}"
read -p "Confirm you are in the root directory by pressing [ENTER] or [CTRL+C] to quit the installation" EMPTY_VAR
echo "${DGREEN}Starting in 2 seconds..."
sleep 2

cd /root/

# Uncomment below to update the Kali Linux Machine if outdated or
# if some library problem arises (not needed in 2016.1 version)

#echo "First let us start updating and upgrading your Kali Linux Machine"
#echo "This can take a while since the ISO 2016.1 is one month old"
#echo "Here we go...\n\n\n\n"
# apt-get update && apt-get upgrade -y

echo "${LGREEN}Now we are going to install pip and easy_install, that will be required later...\n${NC}"

apt-get install pip -y
wget https://bootstrap.pypa.io/ez_setup.py -O - | python

echo "${LGREEN}We are going to create some directories and files, since the code is directory and files dependant${NC}"
sleep 3

mkdir /$user_dir/pharser && mkdir /$user_dir/pharser/joint 
mkdir /$user_dir/pharser/joint/bulk_mails 
mkdir /$user_dir/pharser/joint/forced_matches

cd /$user_dir/pharser/joint

mkdir wgot && mkdir ./wgot/good && mkdir ./wgot/bad

echo "\n${LGREEN}The following directories have been created${NC}"
echo "\n/$user_dir/pharser/joint" 
echo "\n/$user_dir/pharser/joint/bulk_mails"
echo "\n/$user_dir/pharser/joint/forced_matches"
echo "\n/$user_dir/pharser/joint/wgot"
echo "./wgot/good and ./wgot/bad"

sleep 3

echo "\n${LGREEN}Now the main scritp is going to be downloaded from GitHub${NC}"

cd /$user_dir/pharser/joint
wget https://raw.githubusercontent.com/segloser/pharser/master/pharser.py

echo "https://www.linkedin.com" > good_urls.txt
echo "https://www.facebook.com" >> good_urls.txt
echo "https://accounts.google.com" >> good_urls.txt
echo "\nThe file <good_urls.txt> has benn created with three white URLs for testing purposes"

wget --no-cache https://raw.githubusercontent.com/segloser/pharser/master/purge_tests.sh

echo "\n${LRED}An example of bash utility has been downloaded from GitHub to initialize conditions for further tests\n\nAnyways, you can simply remove the pharser directory and run this installer again${NC}"
chmod +x purge_tests.sh
echo "\n${LRED}Execution permissions given to the <purge_tests.sh> bash script${NC}"
sleep 3
wget --no-cache -o README https://raw.githubusercontent.com/segloser/pharser/master/README.md

cd ./wgot/bad 

wget https://www.facebook.com
wget https://accounts.google.com

cd ../../

cd ./bulk_mails
wget --no-cache https://raw.githubusercontent.com/segloser/pharser/master/bulk_mails/bulk

cd ../


echo "\nGiving some time to the download..."
echo "\n${LGREEN}Please, wait."
sleep 1

echo "\nWe are going to install xlwt, be patient please.${NC}"
easy_install xlwt
sleep 2

echo "\n${LGREEN}Now installing wget for Python, although finally os.system has been used instead"
pip install wget
echo "\nJust a moment...${NC}"
sleep 2

echo "\n${LGREEN}The ssdeep hasing utility for Python is going to be installed. This is going to take some time, so be patient${NC}"
apt-get install build-essential libffi-dev python python-dev python-pip automake autoconf libtool -y
BUILD_LIB=1 pip install ssdeep
sleep 3

echo "${LGREEN}If you are testing this script in Lubuntu, you will need gnome-terminal.\nWe are going to install it for you. Give us some seconds...${NC}"
apt-get install gnome-terminal -y

echo "${LRED}We recommend to test this tool in Kali Linux 2016.1. Some problems arised while testing in Lubuntu due to unavailability in the Ubuntu repositories while the installation process${NC}"

echo "${LGREEN}Cleaning the screen in 3, 2, 1...${NC}"
sleep 3

clear

echo "\n${LRED}Now, the tool should start automatically the first test${NC}"
echo "${LGREEN}THE AUTOTEST WITH DUMMY RESULTS WILL START IN 5 SECONDS${NC}"

echo "\n${LGREEN}runing [python /$user_dir/pharser/joint/pharser.py -d /$user_dir/pharser/joint/bulk_mails/ -o ./parsed]"
echo "\n${LGREEN}This will:\n>Parse emails from the directory <bulk_mails>\n>Parse URLs from the processed emails\n>Download the URLs in the <bad> directory\n>Download the Good URLs in the <good> directory\n>Hash (ssdeep) every downloaded page.\n>Compare the good and the bad hashes, presenting the outcome in a file named matches.txt${NC}"
sleep 5
python /$user_dir/pharser/joint/pharser.py -d /$user_dir/pharser/joint/bulk_mails/ -o ./parsed

cd /root/pharser/joint

clear
echo "****************************************"
echo "*    OPENING THE matches.txt FILE      *"
echo "****************************************"
gnome-terminal -x sh -c "cat /$user_dir/pharser/joint/matches.txt; DRED='\033[0;31m';echo '${DRED}Press [ENTER] to exit the test'; read -p '' EMPTY_VAR"

