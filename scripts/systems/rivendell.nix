  { config, pkgs, ... }:
  {
      environment.systemPackages = with pkgs; [
        #Custom to rivendell
        ollama
      ];
    networking.firewall.enable = false;
    networking.hostName = "rivendell"; # Define your hostname.
  }
