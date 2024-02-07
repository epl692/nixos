  { config, pkgs, ... }:
  {
    networking.hostName = "flowy"; # Define your hostname.
    virtualisation.virtualbox.guest.enable = true;
  }