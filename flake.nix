{
  inputs = {
      nixpkgs.url = "nixpkgs/nixos-23.11";
      nur.url = github:nix-community/NUR;      
      home-manager = {
      	url = github:nix-community/home-manager/release-23.11;
      	inputs.nixpkgs.follows = "nixpkgs";
      };

	};
  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  let
   system = "x86_64-linux";
   pkgs = import nixpkgs {
   	inherit system;
	config = { allowUnfree = true; };
	};
	lib = nixpkgs.lib;
 in {
    specialArgs = {inherit inputs;};

    nixosConfigurations.nixtop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./configuration.nix ./scripts/systems/nixtop.nix ./scripts/gui.nix ./grub.nix inputs.home-manager.nixosModules.home-manager ];
    };
      nixosConfigurations.nixie = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./configuration.nix ./scripts/systems/nixie.nix ./scripts/gui.nix ./efi.nix inputs.home-manager.nixosModules.home-manager ];
    };
      nixosConfigurations.nix-vm = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./configuration.nix ./scripts/systems/nix-vm.nix ./scripts/gui.nix ./efi.nix inputs.home-manager.nixosModules.home-manager ];
    };
      nixosConfigurations.flowy = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./configuration.nix ./scripts/systems/flowy.nix ./efi.nix inputs.home-manager.nixosModules.home-manager ];
    };
      nixosConfigurations.rivendell = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./configuration.nix ./scripts/systems/rivendell.nix ./scripts/gui.nix ./scripts/twitch-loadout.nix ./efi.nix inputs.home-manager.nixosModules.home-manager ];
    };
  };
}
