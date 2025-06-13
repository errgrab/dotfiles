{
	description = "NixOS system configuration";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager.url = "github:nix-community/home-manager";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";
	};

	outputs = { self, nixpkgs, home-manager, ... }@inputs: {
		nixosConfigurations.tawa = nixpkgs.lib.nixosSystem {
			modules = [
				./hosts/tawa/config.nix
				home-manager.nixosModules.home-manager {
					home-manager.useGlobalPkgs = true;
					home-manager.useUserPackages = true;
					home-manager.users.anon = import ./users/anon/home.nix;
				}
			];
		};
		nixosConfigurations.tomo = nixpkgs.lib.nixosSystem {
			modules = [
				./hosts/tomo/config.nix
				home-manager.nixosModules.home-manager {
					home-manager.useGlobalPkgs = true;
					home-manager.useUserPackages = true;
					home-manager.users.anon = import ./users/anon/home.nix;
				}
			];
		};
	};
}
