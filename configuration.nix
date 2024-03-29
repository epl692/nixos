# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./scripts/epl692.nix
    ];


  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  # Home Manager
  	home-manager.useGlobalPkgs = true;
  	home-manager.useUserPackages = true;
  	home-manager.users.gandalf = import ./home.nix; 
  # Set your time zone.
  time.timeZone = "America/Detroit";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.gandalf = {
    isNormalUser = true;
    description = "Eric Lynema";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [
#      kate
    #  thunderbird
    ];
    openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC1FPRnUFoo6Ygk5MYQrcxvGmxeZBzPo9QDdCnlnt1EZIP642ZJjoZZwEVK4eikEmj8nHjpVL6Y+6mYWCzrokhpKlFSracgpo5Tm1I3FR6XncPTr3/Rzi1dNIsZxa+MNugEg6zehjj9qOJofLARkxai2o/k6pi9q8V7DaoioiVbFYCauTahZiVMtFI9DzL+z2hz4pUpWlYSmoBzI0Weyy92vp2qNx/jRSg03bjoDhv/KpdQayr/8GOKl5vD+HMToh/dMCrZhNjIR4j4Ss3VwnmiwTgdOyzGuv30R5kAyv1QezBezGWEmsRjlGBA6FSIwDvntkVBMcKERwQEYdVwIni9 cardno:24_745_089" ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
  ];
 
  programs.dconf.enable = true;


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
   programs.gnupg.agent = {
     enable = true;
     enableSSHSupport = true;
   };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
   services.openssh.enable = true;
   programs.ssh.startAgent = false;


  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

  # Enable Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

}
