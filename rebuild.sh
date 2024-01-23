#!/run/current-system/sw/bin/bash

sudo cp /etc/nixos/configuration.nix /etc/nixos/configuration.old
if test -d /etc/scripts; then
  echo "Removing Scripts Folder"
  sudo rm -r /etc/scripts/
fi
sudo mkdir /etc/scripts/
sudo cp -r ./scripts/ /etc/
sudo cp ./configuration.nix /etc/nixos/

if ! test -f /etc/nixos/local.nix; then
  echo Creating Local Config
  sudo cp ./local.nix /etc/nixos/
  touch ./unsafe.flag
  echo Please edit local nix file and rerun.
  echo unsafe.flag created. Please delete before rerun.
fi

if ! test -f ./unsafe.flag; then
  sudo nixos-rebuild switch
fi
