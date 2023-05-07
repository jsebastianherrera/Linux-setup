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

#Check if the script is running as root user
function isRoot(){
  id=$(id -u)
  if [[ "${id}" -eq 0 ]] ;then
    return 0
  else 
    return 1
  fi
}

# Check is the current distro is fedora or not 
function isFedora() {
  if [[ $(uname -n) = 'fedora' ]]; then 
    return 0
  else 
    return 1
  fi
}

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
function setZsh(){
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}
function main(){
  local packages=( bspwm picom rofi polybar bluetoothctl brightnessctl amixer scrot alacritty git zsh )
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
        dnf update -y 
        dnf upgrade -y
        for i in  "${missingPackages[@]}";do
          dnf install "${i}" -y 
        done
        # Calling zsh function
        setZsh
      fi
    fi
  else
    echo -e "${yellowColour}The current distro is not Fedora${endColour}" 
    exit 1
  fi
}

if isRoot; then
  main 
else 
  echo -e "${redColour}U need to run the script as root${endColour}"
fi
