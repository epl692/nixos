{ config, pkgs, ... }:

{
  imports = 
      [ # Per system configuration
      /etc/scripts/systems/nixie.nix
    ];
}