  { config, pkgs, ... }:
  {
      environment.systemPackages = with pkgs; [
        #Custom to rivendell
      ];
    networking.firewall.enable = false;
    networking.hostName = "rivendell"; # Define your hostname.

  systemd.user.services.ollama = {
    description = "Ollama";
    serviceConfig.PassEnvironment = "DISPLAY";
    script = ''
      OLLAMA_HOST=0.0.0.0:11434 ollama serve
    '';
    wantedBy = [ "multi-user.target" ]; # starts after login
  };

}
