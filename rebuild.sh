#!/run/current-system/sw/bin/bash

sudo cp /etc/nixos/configuration.nix /etc/nixos/configuration.old
sudo rm -r /etc/scripts/
sudo mkdir /etc/scripts/
sudo cp -r ./scripts/ /etc/
sudo cp ./configuration.nix /etc/nixos/

sudo nixos-rebuild switch
