{ config, pkgs, ... }:

{
  imports = 
      [ # Per system configuration
      #./grub.nix
      ./efi.nix
    ];
}