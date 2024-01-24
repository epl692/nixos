{
  outputs = { self, nixpkgs }: {
    # replace 'nixtop' with your hostname here.
    nixosConfigurations.nixtop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./configuration.nix ./scripts/systems/nixtop.nix ];
    };
      nixosConfigurations.nixie = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./configuration.nix ./scripts/systems/nixie.nix ];
    };
      nixosConfigurations.nix-vm = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./configuration.nix ./scripts/systems/nix-vm.nix ];
    };
  };
}
