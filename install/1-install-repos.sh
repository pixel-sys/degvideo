#install-all-dependent-repos
sudo apt-get update;
sudo apt-get upgrade -y;

sudo apt-get install build-essential libpcre3 libpcre3-dev libssl-dev zlib1g zlib1g-dev checkinstall -y;
sudo apt-get install ffmpeg -y;
sudo apt-get install locate -y;
sudo apt-get install rename -y;
sudo apt install iftop -y;

sudo apt install nginx-full -y;

sudo reboot;

