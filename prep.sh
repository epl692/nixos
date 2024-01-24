#!/run/current-system/sw/bin/bash
echo "Configuration..."
sudo cp ./configuration.nix /etc/nixos/system-configuration.nix
echo "Prep..."
sudo cp ./prep.nix /etc/nixos/configuration.nix
if test -d /etc/nixos/scripts; then
	echo "Erase Scripts..."
	sudo rm -r /etc/nixos/scripts/
fi
echo "Copy Scripts..."
sudo cp -r ./scripts /etc/nixos
echo "Copy Flake..."
sudo cp ./flake.nix /etc/nixos
if ! test -f /etc/nixos/local.nix; then
  echo Creating Local Config...
  sudo cp ./local.nix /etc/nixos/
  sudo cp ./efi.nix /etc/nixos/
  sudo cp ./grub.nix /etc/nixos/
  touch ./unsafe.flag
  echo Please edit local nix file and rerun.
  echo unsafe.flag created. Please delete before rerun.
fi

#if ! test -f ./unsafe.flag; then
#	if ! test -f ./prepped.flag; then
#	  sudo nixos-rebuild switch
#	  touch ./prepped.flag
#	fi
#sudo nix flake update /etc/nixos/
#sudo nixos-rebuild switch --flake /etc/nixos/
#fi
