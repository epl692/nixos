{ config, pkgs, lib, ... }:
  {
    environment.systemPackages = with pkgs; [

      # OBS Studio
      obs-studio
      obs-studio-plugins.droidcam-obs
      obs-studio-plugins.obs-ndi

      ];
  }