echo "Installing docker-ce"

sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt -qq update

sudo apt install docker-ce

echo "Building bypass docker image"

cd bypass
sudo docker build -t vnf/bypass:0.1 . 
cd -

echo "Building Suricata docker image"

cd suricata-ids
sudo docker build -t vnf/suricata:0.1 . 
cd -

echo "Finished building bypass and suricata images:"
echo "vnf/bypass:0.1 and vnf/suricata:0.1"