
{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./system-configuration.nix
      ./epl692.nix
      ./local.nix
    ];
}
