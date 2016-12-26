#!/bin/bash

clone_repo() {
 cd ~/MagicMirror/modules
 echo -e "\e[96mCloning Plumcraft $1 ...\e[90m"
 if git clone https://github.com/plumcraft/$1.git; then
   echo -e "\e[92mCloning Plumcraft $1 Done!\e[0m"
 else
   echo -e "\e[91mUnable to clone Plumcraft $1."
   exit;
 fi 
}

npm_install() {
 cd ~/MagicMirror/modules/$1
 echo -e "\e[96mInstalling dependencies of $1 ...\e[90m"
 npm install
 echo -e "\e[96mInstalling dependencies of $1 Done!\e[90m"
}

package_install() {
 echo -e "\e[96mInstalling package : $1 ...\e[90m"
 if apt-get install $1 -y ;
 then
   echo -e "\e[96mInstalling package : $1 Done!\e[90m"
 else
  echo -e "\e[96mInstalling package : $1 Failed!\e[90m"
  exit;
 fi
}
