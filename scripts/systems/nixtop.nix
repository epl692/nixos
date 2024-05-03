  { config, pkgs, ... }:
  {
    networking.hostName = "nixtop"; # Define your hostname.
    hardware.bluetooth.enable = true;
    programs.steam.enable = true;
    nixpkgs.config.allowNonFree = true;
  }
