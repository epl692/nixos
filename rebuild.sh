#!/run/current-system/sw/bin/bash
sudo cp ./configuration.nix /etc/nixos/system-configuration.nix
sudo cp ./prep.nix /etc/nixos/configuration.nix
sudo cp /etc/nixos/hardware-configuration.nix ./hardware-configuration.nix
if ! test -f /etc/nixos/local.nix; then
  echo Creating Local Config
  sudo cp ./local.nix /etc/nixos/
  sudo cp ./efi.nix /etc/nixos/
  sudo cp ./grub.nix /etc/nixos/
  touch ./unsafe.flag
  echo Please edit local nix file and rerun.
  echo unsafe.flag created. Please delete before rerun.
fi

if ! test -f ./prepped.flag; then
  sudo nixos-rebuild switch
  touch ./prepped.flag
fi

if ! test -f ./unsafe.flag; then
  sudo nixos-rebuild switch --flake .
fi
