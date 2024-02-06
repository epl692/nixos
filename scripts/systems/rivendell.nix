  { config, pkgs, ... }:
  {
      environment.systemPackages = with pkgs; [
        #Custom to rivendell
        ollama
      ];

    networking.hostName = "rivendell"; # Define your hostname.
  }
