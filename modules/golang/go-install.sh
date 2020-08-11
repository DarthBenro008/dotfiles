sudo add-apt-repository ppa:longsleep/golang-backports 
sudo apt update 
sudo apt install golang-go 
echo "\e[33mTesting Golang ... \n\n"
go run helloworld.go 
go version
echo "\n\nTest Complete! \e[0m"
