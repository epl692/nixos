#!/run/current-system/sw/bin/bash

sudo cp /etc/nixos/configuration.nix /etc/nixos/configuration.old
sudo rm -r /etc/nixos-scripts/
sudo mkdir /etc/nixos-scripts/
sudo cp -r ./scripts/ /etc/nixos-scripts/
sudo cp ./configuration.nix /etc/nixos/

sudo nixos-rebuild switch
