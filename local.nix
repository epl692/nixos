{ config, pkgs, ... }:

{
  imports = 
      [ # Per system configuration
      /etc/scripts/systems/nixie.nix
    ];
    networking.hostName = "nixie"; # Define your hostname.
}