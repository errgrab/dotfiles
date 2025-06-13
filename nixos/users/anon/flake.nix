{
	description = "Home-Manager configuration";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { nixpkgs, home-manager, ... }@inputs:
		{
			homeConfigurations."anon" = home-manager.lib.homeManagerConfiguration {
				pkgs = import nixpkgs { system = "x86_64-linux"; };

				modules = [ ./home.nix ];

				# Optionally use extraSpecialArgs
				# to pass through arguments to home.nix
			};
		};
}
