  { config, pkgs, lib, ... }:
  {
    environment.systemPackages = with pkgs; [
      # Desktop applications
      brave
      threema-desktop
      localsend
      element-desktop

      gnome.adwaita-icon-theme

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
      
      #Yubikey
      yubikey-agent
      yubikey-manager
      yubikey-personalization
      ];

  virtualisation.docker.enable = true;
  networking.firewall.checkReversePath = "loose"; 
  networking.firewall.allowedTCPPorts = [ 53317 ];
  networking.firewall.allowedUDPPorts = [ 53317 ];
  hardware.gpgSmartcards.enable = true;
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
  systemd.targets.sleep.enable = false;
  systemd.targets.suspend.enable = false;
  systemd.targets.hibernate.enable = false;
  systemd.targets.hybrid-sleep.enable = false;

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
  
  services.gnome.gnome-keyring.enable = lib.mkForce false;


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
