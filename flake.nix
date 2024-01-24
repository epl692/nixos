{
    description = "System Configuration";
    inputs = {
        nixpkgs.url = "nixpkgs/nixos-23.11";
    };

  outputs = { self, nixpkgs, ... }:
    let
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
        nixie = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ ./configuration.nix ./scripts/nixie.nix ];
      };
      nixtop = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ ./configuration.nix ./scripts/nixtop.nix ];
      };
    };
  };

}