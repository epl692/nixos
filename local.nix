{ config, pkgs, ... }:

{
  imports = 
      [ # Per system configuration
      #./grub.nix
      ./efi.nix
    ];
    networking.hostName = "nixie"; # Define your hostname.
}