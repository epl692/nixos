  { config, pkgs, ... }:
  {
    environment.systemPackages = with pkgs; [
      # Desktop applications
      brave
      threema-desktop
      yakuake

      # System Utilies
      wget
      curl
      git
      htop
      neofetch
      bc

      #Stuff
      x3270

      #Funny
      toilet
      lolcat
      cowsay
      fortune
      
      ];

  virtualisation.docker.enable = true;
  networking.firewall.checkReversePath = "loose"; 

  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  services.udev.packages = [ pkgs.yubikey-personalization ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
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

}
