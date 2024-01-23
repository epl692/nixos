  { config, pkgs, ... }:
  {
  networking.hostName = "nixie"; # Define your hostname.
  
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  }