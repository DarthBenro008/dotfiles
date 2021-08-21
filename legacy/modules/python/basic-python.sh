sudo apt-get update
sudo apt-get install python3
echo "\e[33m Attempt to execute python file \n\n"
python3 hello-python.py 
echo "Python script execution complete \e[0m"
pip3 install virtualenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv 
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc


