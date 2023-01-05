#checks if they have root if they dont exit the script
if [ "$EUID" -ne 0 ]
then
    echo "Please run the script as root (e.g., using sudo)."
    exit
fi

# continue with the rest of the script

cd LouisOS-install-scripts
chmod +x config/dots-2.0/install.sh 
cd config/dots-2.0
./install.sh
cd ..
cp -r cava ~/.config
cp -r kitty ~/.config
cp -r neofetch ~/.config
cp -r nvim ~/.config 
cp -r neofetchbin/neofetch /usr/bin

