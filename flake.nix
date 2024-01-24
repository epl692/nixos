{
  outputs = { self, nixpkgs }: {
    # replace 'nixtop' with your hostname here.
    nixosConfigurations.nixtop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./configuration.nix ];
    };
  };
}
