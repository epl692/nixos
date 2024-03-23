  { config, pkgs, ... }:
  {
    networking.hostName = "nixie"; # Define your hostname.
    security.pam.services.gdm.enableGnomeKeyring = true;
  }