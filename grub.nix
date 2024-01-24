{ config, pkgs, ... }:

{
    boot.loader = {
      grub = {
      enable = true;
      useOSProber = true;
      devices = ["/dev/sda"];
      };
    };
}