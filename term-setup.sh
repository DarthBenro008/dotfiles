sudo apt-get update
sudo apt-get install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc
mkdir -p ~/.config/alacritty && cp alacritty.yml ~/.config/alacritty/
cp .zshrc ~/.zshrc
cp .p10k.zsh ~/.p10k.zsh

