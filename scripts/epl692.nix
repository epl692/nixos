  { config, pkgs, ... }:
  {
    environment.systemPackages = with pkgs; [
      # Desktop applications
      brave
      threema-desktop

      # System Utilies
      wget
      curl
      git
      htop
    ];
  
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  # Auto Upgrade
  system.autoUpgrade = {
   enable = true;
   dates = "*-*-* 04:00:00";
   persistent = true;
   allowReboot = true;
  };

  # Garbage Collector
  nix.gc = {
   automatic = true;
   persistent = false;
   dates = "daily";
   options = "--delete-older-than 7d";
  };

  # Enable Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

}
