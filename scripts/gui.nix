{ config, pkgs, lib, ... }:
  {
    environment.systemPackages = with pkgs; [
      # Desktop applications
      brave
      threema-desktop
      localsend
      element-desktop
      gnome.adwaita-icon-theme
      ];

  networking.firewall.checkReversePath = "loose"; 
  networking.firewall.allowedTCPPorts = [ 53317 ];
  networking.firewall.allowedUDPPorts = [ 53317 ];
  systemd.targets.sleep.enable = false;
  systemd.targets.suspend.enable = false;
  systemd.targets.hibernate.enable = false;
  systemd.targets.hybrid-sleep.enable = false;
  
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
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  # gnome
   services.xserver.displayManager.gdm.enable = true;
   services.xserver.desktopManager.gnome.enable = true;


  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

}
