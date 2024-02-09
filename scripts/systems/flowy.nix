  { config, pkgs, ... }:
  {
    networking.hostName = "flowy"; # Define your hostname.
    virtualisation.virtualbox.guest.enable = true;
    environment.systemPackages = with pkgs; [ docker-compose postgresql ];
  }