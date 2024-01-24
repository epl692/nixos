  { config, pkgs, ... }:
  {
    networking.hostName = "nix-vm"; # Define your hostname.
    virtualisation.virtualbox.guest.enable = true;
  }