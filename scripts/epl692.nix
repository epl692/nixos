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

#  environment.shellInit = ''
#    gpg-connect-agent /bye
#    export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
#  '';

  virtualisation.docker.enable = true;
  networking.firewall.checkReversePath = "loose"; 
  networking.firewall.allowedTCPPorts = [ 53317 ];
  networking.firewall.allowedUDPPorts = [ 53317 ];
  hardware.gpgSmartcards.enable = true;
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
  
  services.gnome.gnome-keyring.enable = lib.mkForce false;
services.xserver.desktopManager.gnome = {
  enable = true;
    extraGSettingsOverridePackages = with pkgs; [ gnome.gnome-settings-daemon ];
      extraGSettingsOverrides = ''
    [org.gnome.desktop.session]
        idle-delay=900

    [org.gnome.settings-daemon.plugins.power]
        sleep-inactive-ac-timeout=3600
        sleep-inactive-ac-type='nothing'
        '';
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
