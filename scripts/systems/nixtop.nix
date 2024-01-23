  { config, pkgs, ... }:
  {
  networking.hostName = "nixtop"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    boot.loader = {
      grub = {
      enable = true;
      useOSProber = true;
      devices = ["/dev/sda"];
      };
    };
  }
