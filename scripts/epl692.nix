  { config, pkgs, ... }:
  {
  environment.systemPackages = with pkgs; [
    neovim
    git
    brave
    threema-desktop
  ];
  }