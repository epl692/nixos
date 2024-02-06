#!/run/current-system/sw/bin/bash
echo "Configuration..."
sudo cp ./configuration.nix /etc/nixos/configuration.nix
if test -d /etc/nixos/scripts; then
	echo "Erase Scripts..."
	sudo rm -r /etc/nixos/scripts/
fi
echo "Copy Scripts..."
sudo cp -r ./scripts /etc/nixos
echo "Copy Flake..."
sudo cp ./flake.nix /etc/nixos
echo "Copy Home-Manager Config..."
sudo cp ./home.nix /etc/nixos
sudo cp ./efi.nix /etc/nixos/
sudo cp ./grub.nix /etc/nixos/

if ! test -f ./armed.flag; then
  sudo nixos-rebuild switch --flake /etc/nixos/
fi
