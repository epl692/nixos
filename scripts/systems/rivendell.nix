  { config, pkgs, ... }:
  {
      environment.systemPackages = with pkgs; [
        #Custom to rivendell
      ];
    networking.firewall.enable = false;
    networking.hostName = "rivendell"; # Define your hostname.

systemd.services.ollama = {
  enable = true;
  serviceConfig = {
     ExecStart = "OLLAMA_HOST=0.0.0.0:11434 ${pkgs.ollama}/bin/ollama serve";
   }
}

}
