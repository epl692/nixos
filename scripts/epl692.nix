  { config, pkgs, lib, ... }:
  {
    environment.systemPackages = with pkgs; [
      # System Utilies
      wget
      curl
      git
      htop
      neofetch
      bc
      appimage-run
      borgbackup
      distrobox
      
      #Stuff
      x3270

      #Funny
      toilet
      lolcat
      cowsay
      fortune
      haskellPackages.hackertyper

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

  boot.binfmt.emulatedSystems = [ "x86_64-windows" "aarch64-linux" "armv6l-linux" "armv7l-linux"];

boot.binfmt.registrations.appimage = {
  wrapInterpreterInShell = false;
  interpreter = "${pkgs.appimage-run}/bin/appimage-run";
  recognitionType = "magic";
  offset = 0;
  mask = ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
  magicOrExtension = ''\x7fELF....AI\x02'';
};

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
