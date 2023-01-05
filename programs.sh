if [ "$EUID" -ne 0 ]
then
    echo "Please run the script as root (e.g., using sudo)."
    exit
fi

# continue with the rest of the script

#installs arcolinux repo to install yay or paru
# add the GPG key for the repository
sudo pacman-key --keyserver keys.gnupg.net -r F1ABB772C4C7F06D
sudo pacman-key --lsign-key F1ABB772C4C7F06D

# add the repository to your system
echo -e "[arcolinux_repo_3rdparty]\nSigLevel = PackageRequired\nServer = https://arcolinux.github.io/arcolinux_repo_3rdparty/$arch" | sudo tee -a /etc/pacman.conf

#asks if you want to install yay or paru
read -p "Do you want to install paru or yay? (paru/yay) " answer

if [ "$answer" == "paru" ]
then
    # execute command to install paru
    sudo pacman -S --noconfirm paru
elif [ "$answer" == "yay" ]
then
    # execute command to install yay
    sudo pacman -S --noconfirm yay
fi

# continue with the rest of the script
echo "Installing the needed packages"

#checks if you have yay or paru

# check if yay is installed
if command -v yay &> /dev/null
then
    # execute command for yay
    yay -S light neovim zsh acpi alsa-utils-git blueman brave-bin bspwm colorpicker dunst eww-git flameshot hsetroot imagemagick jq kitty mantablockscreen network-manager-applet pa-applet-git picom-animations-git playerctl polkit-gnome polybar pulseaudio python3 rofi scrot sox sxhkd thunar wmctrl wpgtk-git xclip xdotool xprintidle --needed
fi

# check if paru is installed
if command -v paru &> /dev/null
then
    # execute command for paru
    paru -S light neovim zsh acpi alsa-utils-git blueman brave-bin bspwm colorpicker dunst eww-git flameshot hsetroot imagemagick jq kitty mantablockscreen network-manager-applet pa-applet-git picom-animations-git playerctl polkit-gnome polybar pulseaudio python3 rofi scrot sox sxhkd thunar wmctrl wpgtk-git xclip xdotool xprintidle --needed
fi

read -p "Do you want to install extra packages? (y/n) " answer

if [ "$answer" == "y" ]
then
    # execute command to install extra packages
    # check if yay is installed
if command -v yay &> /dev/null
then
    # execute command for yay
    yay -S package
fi

# check if paru is installed
if command -v paru &> /dev/null
then
    # execute command for paru
    paru -S dropbox spotify beterlockscreen 
fi

fi

# continue with the rest of the script

#installs ohmyzsh needed for the prompt
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k


echo "Installed all the packages now you can move on to the config script"



