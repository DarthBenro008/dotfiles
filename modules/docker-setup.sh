sudo apt-get remove docker docker-engine docker.io containerd runc 
sudo apt-get update 
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88 
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update 
sudo apt-get install docker-ce docker-ce-cli containerd.io 
sudo docker run hello-world
while true; do
    read -p "Do you wish to add this user to non-root docker?" yn
    case $yn in
        [Yy]* ) sh post-docker.sh; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
