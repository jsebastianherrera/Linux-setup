#!/bin/bash
#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

#########################################################################3
#Check if the script is running as root user
function isRoot(){
  id=$(id -u)
  if [[ "${id}" -eq 0 ]] ;then
    return 0
  else 
    return 1
  fi
}

#########################################################################3
# Check is the current distro is fedora or not 
function isFedora() {
  local distro
  distro=$(cat /etc/os-release | grep -e "^ID=" | sed 's/ID=//g')
  if [[ "${distro}" = 'fedora' ]]; then 
    return 0
  else 
    return 0
  fi
}

#########################################################################3
function logo(){
  echo "         .--.            "
  echo "        |o_o |           "
  echo "        |:_/ |           "
  echo "       //   \ \          "
  echo "      (|     | )         "
  echo "     /\'\_   _/\         "
  echo "     \___)=(___/         "
  echo 
  echo "Cheking packages ..."
  sleep 0.5
  echo
}
#########################################################################3
function setConfig(){
  # Create .config folder if is not created 
  mkdir -p ~/.config/
  echo -e "${blueColour}Backup folder ~/backup/ ${endColour}"
  # Backup 
  mkdir -p ~/backup 
  # mv alacritty bspwm nvim rofi starship.toml ~/backup
  cp ./.zshrc ~/.zshrc
  # Copying config files 
  cp -r ./alacritty ./bspwm ./nvim ./rofi ./starship.toml ~/.config/
  mkdir -p ~/Pictures
  cp ./fedora.png ~/Pictures
  mkdir -p ~/.local/share/fonts
  unzip ./fonts.zip -d ~/.local/share/fonts 
  sudo fc-cache -f -v ~/.local/share/fonts
  
}
#########################################################################3
function setZsh(){
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

#########################################################################3
function main(){
  local packages=( bspwm picom rofi polybar sxhkd nvim bluetoothctl brightnessctl amixer scrot alacritty git zsh snapd neovim feh lsd zathura zip unzip )
  local missingPackages=()
  if isFedora; then 
    clear
    # print logo
    logo
    for i in "${packages[@]}";do
      if which "$i" &> /dev/null; then 
        echo -e "${greenColour}[ Installed ]${endColour} ${i}"
      else 
        echo -e "${redColour}[ Missing ]${endColour} ${i}"
        missingPackages+=("${i}")
      fi
    done
    # Install missing packages 
    if [[ "${#missingPackages[@]}" -gt 0 ]];then
      echo -n "Do u want to install missing packages?(y/n) "
      read -r -n 1 confirmation
      echo
      if [[ "${confirmation}" = "y" ]]; then
        sudo apt update -y 
        sudo apt upgrade -y
        for i in  "${missingPackages[@]}";do
          sudo apt install "${i}" -y 
        done
      fi
    fi
  else
    echo -e "${yellowColour}The current distro is not Fedora${endColour}" 
    exit 1
  fi
}
#########################################################################3
if isRoot; then
  echo -e "${redColour}U do not need to run the script as root${endColour}"
else 
  # Calling zsh function
  main 
  setConfig 
  setZsh
  reboot
fi
